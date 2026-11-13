import { z } from 'zod';
import { AuthAttempt, Group, HiddenPhoto, Photo, Report, User, type UserDoc } from '@/lib/models';
import { attemptKeyPattern, groupTraceUpdate } from '@/lib/cleanup';
import { body, handler, json } from '@/lib/http';
import { publicUser, requireUser, syncAdminRole } from '@/lib/auth';
import { deleteKeys } from '@/lib/storage';
import { refreshGroupRetention } from '@/lib/pro';
import { revokeAppleForUser } from '@/lib/siwa';

export const GET = handler(async (req) => {
  const user = await syncAdminRole(await requireUser(req));
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
 * Also removes every personal trace: push tokens (first, so nothing is sent
 * during deletion), hidden-photo records, reactions, favorites, archive flags,
 * blocks in other accounts, reports they filed and rate-limit records for
 * their address. Reports about their photos stay, for moderation.
 */
export const DELETE = handler(async (req) => {
  const user = await requireUser(req);
  await User.updateOne({ _id: user._id }, { $set: { pushTokens: [] } });

  // Sign in with Apple: revoke the user's tokens at Apple (guideline 5.1.1(v)).
  // Never throws, so deletion goes ahead even if Apple is unreachable.
  const apple = await User.findById(user._id).select('+appleRefreshToken').lean<UserDoc>();
  if (apple) await revokeAppleForUser(apple);

  const myPhotos = await Photo.find({ userId: user._id }, { originalKey: 1, displayKey: 1, thumbKey: 1, groupId: 1 }).lean();
  await deleteKeys(myPhotos.flatMap((p) => [p.originalKey, p.displayKey, p.thumbKey]));
  await Photo.deleteMany({ userId: user._id });
  await HiddenPhoto.deleteMany({ $or: [{ userId: user._id }, { photoId: { $in: myPhotos.map((p) => p._id) } }] });

  const groups = await Group.find({ 'members.userId': user._id }).lean();
  for (const g of groups) {
    const rest = g.members.filter((m) => String(m.userId) !== String(user._id));
    if (!rest.length) {
      const left = await Photo.find({ groupId: g._id }, { originalKey: 1, displayKey: 1, thumbKey: 1 }).lean();
      await deleteKeys(left.flatMap((p) => [p.originalKey, p.displayKey, p.thumbKey]));
      await Photo.deleteMany({ groupId: g._id });
      await HiddenPhoto.deleteMany({ groupId: g._id });
      await Group.deleteOne({ _id: g._id });
      continue;
    }
    const isOwner = String(g.ownerId) === String(user._id);
    // Never leave a group without an admin, whether or not this user created it.
    const members = rest.some((m) => m.role === 'admin') ? rest : rest.map((m, i) => (i === 0 ? { ...m, role: 'admin' } : m));
    const counts = await Photo.aggregate([
      { $match: { groupId: g._id, status: 'ready' } },
      { $group: { _id: '$kind', n: { $sum: 1 } } },
    ]);
    await Group.updateOne(
      { _id: g._id },
      {
        members,
        ...(isOwner ? { ownerId: (members.find((m) => m.role === 'admin') ?? members[0]).userId } : {}),
        photoCount: counts.find((c) => c._id === 'photo')?.n ?? 0,
        videoCount: counts.find((c) => c._id === 'video')?.n ?? 0,
      },
    );
    // This user may have been the group's Pro member: the free retention can apply again.
    await refreshGroupRetention(g._id);
  }

  // Personal traces on other people's photos and in other accounts.
  await Photo.updateMany({ 'reactions.userId': user._id }, { $pull: { reactions: { userId: user._id } } });
  await Photo.updateMany({ favoritedBy: user._id }, { $pull: { favoritedBy: user._id } });
  await User.updateMany({ blockedUserIds: user._id }, { $pull: { blockedUserIds: user._id } });
  await Group.updateMany(
    { $or: [{ archivedBy: user._id }, { [`lastNotified.${user._id}`]: { $exists: true } }] },
    groupTraceUpdate(String(user._id)),
  );
  await Report.deleteMany({ reporterId: user._id });
  const attempts = attemptKeyPattern(user.email ?? '');
  if (attempts) await AuthAttempt.deleteMany({ key: attempts });

  await User.deleteOne({ _id: user._id });
  return json({ ok: true });
});
