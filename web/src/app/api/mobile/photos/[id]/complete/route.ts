import { Types } from 'mongoose';
import { Group, Photo, User, type GroupDoc } from '@/lib/models';
import { handler, HttpError, json, type Params } from '@/lib/http';
import { requireUser } from '@/lib/auth';
import { serializePhoto } from '@/lib/photos';
import { pushToUsers } from '@/lib/push';
import { newMediaNotice } from '@/lib/push-i18n';
import { objectExists } from '@/lib/storage';
import { isPersonalRoll } from '@/lib/personal-roll';

// One push per person per group per window, however many photos they take:
// "Daan deelt foto's in Mallorca '27" instead of twelve separate buzzes.
const BUNDLE_WINDOW_MS = 20 * 60 * 1000;

export const POST = handler<Params<{ id: string }>>(async (req, { params }) => {
  const user = await requireUser(req);
  const id = (await params).id;
  if (!Types.ObjectId.isValid(id)) throw new HttpError(404, 'Foto niet gevonden');

  // Only mark ready when all three files really are in storage: a half-finished
  // upload would otherwise show up as a broken photo for the whole group.
  const pending = await Photo.findOne({ _id: id, userId: user._id, status: 'pending' }, { originalKey: 1, displayKey: 1, thumbKey: 1 }).lean();
  if (pending) {
    const present = await Promise.all([pending.originalKey, pending.displayKey, pending.thumbKey].map(objectExists));
    if (present.includes(false)) throw new HttpError(409, 'Upload is niet compleet', 'upload_incomplete');
  }

  const photo = await Photo.findOneAndUpdate(
    { _id: id, userId: user._id, status: 'pending' },
    { status: 'ready' },
    { new: true },
  ).lean();
  if (!photo) {
    const existing = await Photo.findOne({ _id: id, userId: user._id }).lean();
    if (!existing) throw new HttpError(404, 'Foto niet gevonden');
    return json({ photo: await serializePhoto(existing, user._id) }); // idempotent retry
  }

  const group = await Group.findByIdAndUpdate(
    photo.groupId,
    {
      $inc: photo.kind === 'video' ? { videoCount: 1 } : { photoCount: 1 },
      ...(photo.kind === 'photo' ? { $set: { coverPhotoId: photo._id } } : {}),
    },
    { new: true },
  ).lean<GroupDoc>();

  // Mijn rolletje is private: nobody to tell.
  if (group && !isPersonalRoll(group)) {
    const last = group.lastNotified?.[String(user._id) as keyof typeof group.lastNotified] as Date | undefined;
    const due = !last || Date.now() - new Date(last).getTime() > BUNDLE_WINDOW_MS;
    if (due) {
      await Group.updateOne({ _id: group._id }, { $set: { [`lastNotified.${user._id}`]: new Date() } });
      const memberIds = group.members.map((m) => m.userId).filter((m) => String(m) !== String(user._id));
      // People who blocked the photographer do not get told about their photos.
      const blockers = await User.find({ _id: { $in: memberIds }, blockedUserIds: user._id }, { _id: 1 }).lean();
      const blocked = new Set(blockers.map((b) => String(b._id)));
      const others = memberIds.filter((m) => !blocked.has(String(m)));
      const me = await User.findById(user._id, { name: 1 }).lean();
      // Fire and forget: an upload never waits on push delivery.
      pushToUsers(
        others,
        (locale) => newMediaNotice(locale, me?.name ?? '', group.name, photo.kind === 'video' ? 'video' : 'photo', String(group._id)),
        'notifyNewPhotos',
      ).catch((e) => console.error('push failed', e));
    }
  }

  return json({ photo: await serializePhoto(photo, user._id) });
});
