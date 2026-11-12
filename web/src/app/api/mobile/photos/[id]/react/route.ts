import { z } from 'zod';
import { Types } from 'mongoose';
import { Group, Photo, type GroupDoc } from '@/lib/models';
import { body, handler, HttpError, json, type Params } from '@/lib/http';
import { requireUser } from '@/lib/auth';
import { memberRole } from '@/lib/groups';
import { serializePhoto } from '@/lib/photos';

const ALLOWED = ['❤️', '😂', '🔥', '😍', '😮', '👏'];

/** Toggles one emoji reaction of the current user on a photo. */
export const POST = handler<Params<{ id: string }>>(async (req, { params }) => {
  const user = await requireUser(req);
  const id = (await params).id;
  const { emoji } = await body(req, z.object({ emoji: z.string() }));
  if (!ALLOWED.includes(emoji)) throw new HttpError(400, 'Onbekende reactie');
  if (!Types.ObjectId.isValid(id)) throw new HttpError(404, 'Foto niet gevonden');

  const photo = await Photo.findById(id).lean();
  if (!photo) throw new HttpError(404, 'Foto niet gevonden');
  const group = await Group.findById(photo.groupId).lean<GroupDoc>();
  if (!group || !memberRole(group, user._id)) throw new HttpError(404, 'Foto niet gevonden');

  const has = (photo.reactions ?? []).some((r) => String(r.userId) === String(user._id) && r.emoji === emoji);
  const updated = await Photo.findByIdAndUpdate(
    id,
    has ? { $pull: { reactions: { userId: user._id, emoji } } } : { $push: { reactions: { userId: user._id, emoji } } },
    { new: true },
  ).lean();
  return json({ photo: await serializePhoto(updated!, user._id) });
});
