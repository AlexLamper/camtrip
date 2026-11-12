import { Types } from 'mongoose';
import { Group, Photo, type GroupDoc } from '@/lib/models';
import { handler, HttpError, json, type Params } from '@/lib/http';
import { requireUser } from '@/lib/auth';
import { memberRole } from '@/lib/groups';
import { deleteKeys } from '@/lib/storage';

/** The photographer or a group admin can delete a photo. */
export const DELETE = handler<Params<{ id: string }>>(async (req, { params }) => {
  const user = await requireUser(req);
  const id = (await params).id;
  if (!Types.ObjectId.isValid(id)) throw new HttpError(404, 'Foto niet gevonden');
  const photo = await Photo.findById(id).lean();
  if (!photo) throw new HttpError(404, 'Foto niet gevonden');
  const group = await Group.findById(photo.groupId).lean<GroupDoc>();
  const role = group ? memberRole(group, user._id) : null;
  if (String(photo.userId) !== String(user._id) && role !== 'admin') {
    throw new HttpError(403, 'Je kunt alleen je eigen foto’s verwijderen');
  }

  await deleteKeys([photo.originalKey, photo.displayKey, photo.thumbKey]);
  await Photo.deleteOne({ _id: photo._id });
  if (photo.status === 'ready' && group) {
    const update: Record<string, unknown> = { $inc: photo.kind === 'video' ? { videoCount: -1 } : { photoCount: -1 } };
    if (String(group.coverPhotoId) === String(photo._id)) {
      const next = await Photo.findOne({ groupId: group._id, status: 'ready', kind: 'photo' }).sort({ takenAt: -1 }).lean();
      update.$set = { coverPhotoId: next?._id ?? null };
    }
    await Group.updateOne({ _id: group._id }, update);
  }
  return json({ ok: true });
});
