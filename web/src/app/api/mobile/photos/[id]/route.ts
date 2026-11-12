import { Types } from 'mongoose';
import { Group, Photo, type GroupDoc } from '@/lib/models';
import { handler, HttpError, json, type Params } from '@/lib/http';
import { requireUser } from '@/lib/auth';
import { memberRole, serializeGroup } from '@/lib/groups';
import { canDeletePhoto, deletePhotos } from '@/lib/photos';

/**
 * The photographer or a group admin (the owner is always one) can delete a
 * photo. It is removed for the whole group, R2 files included; phones keep
 * whatever was already saved to their own album.
 */
export const DELETE = handler<Params<{ id: string }>>(async (req, { params }) => {
  const user = await requireUser(req);
  const id = (await params).id;
  if (!Types.ObjectId.isValid(id)) throw new HttpError(404, 'Foto niet gevonden');
  const photo = await Photo.findById(id).lean();
  if (!photo) throw new HttpError(404, 'Foto niet gevonden');
  const group = await Group.findById(photo.groupId).lean<GroupDoc>();
  if (!group || !memberRole(group, user._id)) throw new HttpError(404, 'Foto niet gevonden');
  if (!canDeletePhoto(photo, group, user._id)) {
    throw new HttpError(403, 'Je kunt alleen je eigen foto’s verwijderen');
  }

  await deletePhotos(group, [photo]);
  const fresh = await Group.findById(group._id).lean<GroupDoc>();
  return json({ ok: true, group: fresh ? await serializeGroup(fresh, user._id) : null });
});
