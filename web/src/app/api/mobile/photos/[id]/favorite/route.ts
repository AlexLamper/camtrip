import { Types } from 'mongoose';
import { Group, Photo, type GroupDoc } from '@/lib/models';
import { handler, HttpError, json, type Params } from '@/lib/http';
import { requireUser } from '@/lib/auth';
import { memberRole } from '@/lib/groups';
import { serializePhoto } from '@/lib/photos';

/** Toggles the photo in the current user's favorites. */
export const POST = handler<Params<{ id: string }>>(async (req, { params }) => {
  const user = await requireUser(req);
  const id = (await params).id;
  if (!Types.ObjectId.isValid(id)) throw new HttpError(404, 'Foto niet gevonden');
  const photo = await Photo.findById(id).lean();
  if (!photo) throw new HttpError(404, 'Foto niet gevonden');
  const group = await Group.findById(photo.groupId).lean<GroupDoc>();
  if (!group || !memberRole(group, user._id)) throw new HttpError(404, 'Foto niet gevonden');

  const fav = (photo.favoritedBy ?? []).some((u) => String(u) === String(user._id));
  const updated = await Photo.findByIdAndUpdate(
    id,
    fav ? { $pull: { favoritedBy: user._id } } : { $addToSet: { favoritedBy: user._id } },
    { new: true },
  ).lean();
  return json({ photo: await serializePhoto(updated!, user._id) });
});
