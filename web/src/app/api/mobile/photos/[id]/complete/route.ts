import { Types } from 'mongoose';
import { Group, Photo, User, type GroupDoc } from '@/lib/models';
import { handler, HttpError, json, type Params } from '@/lib/http';
import { requireUser } from '@/lib/auth';
import { serializePhoto } from '@/lib/photos';
import { pushToUsers } from '@/lib/push';

// One push per person per group per window, however many photos they take:
// "Daan deelt foto's in Mallorca '27" instead of twelve separate buzzes.
const BUNDLE_WINDOW_MS = 20 * 60 * 1000;

export const POST = handler<Params<{ id: string }>>(async (req, { params }) => {
  const user = await requireUser(req);
  const id = (await params).id;
  if (!Types.ObjectId.isValid(id)) throw new HttpError(404, 'Foto niet gevonden');

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

  if (group) {
    const last = group.lastNotified?.[String(user._id) as keyof typeof group.lastNotified] as Date | undefined;
    const due = !last || Date.now() - new Date(last).getTime() > BUNDLE_WINDOW_MS;
    if (due) {
      await Group.updateOne({ _id: group._id }, { $set: { [`lastNotified.${user._id}`]: new Date() } });
      const others = group.members.map((m) => m.userId).filter((m) => String(m) !== String(user._id));
      const me = await User.findById(user._id, { name: 1 }).lean();
      // Fire and forget: an upload never waits on push delivery.
      pushToUsers(
        others,
        {
          title: group.name,
          body: `${me?.name || 'Iemand'} deelt ${photo.kind === 'video' ? "video's" : "foto's"} in ${group.name}`,
          data: { type: 'new_photos', groupId: String(group._id) },
        },
        'notifyNewPhotos',
      ).catch((e) => console.error('push failed', e));
    }
  }

  return json({ photo: await serializePhoto(photo, user._id) });
});
