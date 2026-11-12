import { z } from 'zod';
import { Group, Photo, User } from '@/lib/models';
import { body, handler, json } from '@/lib/http';
import { publicUser, requireUser } from '@/lib/auth';
import { deleteKeys } from '@/lib/storage';

export const GET = handler(async (req) => {
  const user = await requireUser(req);
  return json({ user: publicUser(user) });
});

const Patch = z.object({
  name: z.string().trim().min(1).max(40).optional(),
  avatarColor: z.string().regex(/^#[0-9a-fA-F]{6}$/).optional(),
  settings: z
    .object({ notifyNewPhotos: z.boolean().optional(), notifyRecap: z.boolean().optional() })
    .optional(),
});

export const PATCH = handler(async (req) => {
  const user = await requireUser(req);
  const input = await body(req, Patch);
  const set: Record<string, unknown> = {};
  if (input.name) set.name = input.name;
  if (input.avatarColor) set.avatarColor = input.avatarColor;
  if (input.settings?.notifyNewPhotos !== undefined) set['settings.notifyNewPhotos'] = input.settings.notifyNewPhotos;
  if (input.settings?.notifyRecap !== undefined) set['settings.notifyRecap'] = input.settings.notifyRecap;
  const updated = await User.findByIdAndUpdate(user._id, { $set: set }, { new: true }).lean();
  return json({ user: publicUser(updated!) });
});

/**
 * Account deletion (required by the App Store). Removes the user's own photos
 * and their memberships. Groups they created pass to the longest-standing
 * remaining member; a group nobody is left in is deleted with its media.
 */
export const DELETE = handler(async (req) => {
  const user = await requireUser(req);

  const myPhotos = await Photo.find({ userId: user._id }, { originalKey: 1, displayKey: 1, thumbKey: 1, groupId: 1 }).lean();
  await deleteKeys(myPhotos.flatMap((p) => [p.originalKey, p.displayKey, p.thumbKey]));
  await Photo.deleteMany({ userId: user._id });

  const groups = await Group.find({ 'members.userId': user._id }).lean();
  for (const g of groups) {
    const rest = g.members.filter((m) => String(m.userId) !== String(user._id));
    if (!rest.length) {
      const left = await Photo.find({ groupId: g._id }, { originalKey: 1, displayKey: 1, thumbKey: 1 }).lean();
      await deleteKeys(left.flatMap((p) => [p.originalKey, p.displayKey, p.thumbKey]));
      await Photo.deleteMany({ groupId: g._id });
      await Group.deleteOne({ _id: g._id });
      continue;
    }
    const isOwner = String(g.ownerId) === String(user._id);
    const members = isOwner && !rest.some((m) => m.role === 'admin') ? rest.map((m, i) => (i === 0 ? { ...m, role: 'admin' } : m)) : rest;
    const counts = await Photo.aggregate([
      { $match: { groupId: g._id, status: 'ready' } },
      { $group: { _id: '$kind', n: { $sum: 1 } } },
    ]);
    await Group.updateOne(
      { _id: g._id },
      {
        members,
        ...(isOwner ? { ownerId: members[0].userId } : {}),
        photoCount: counts.find((c) => c._id === 'photo')?.n ?? 0,
        videoCount: counts.find((c) => c._id === 'video')?.n ?? 0,
      },
    );
  }

  await User.deleteOne({ _id: user._id });
  return json({ ok: true });
});
