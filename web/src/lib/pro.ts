// Database side of Pro: loads members and keeps group retention in step with
// who has Pro. The rules themselves live in ./entitlements (pure, tested).
import { Types } from 'mongoose';
import { Group, User, type GroupDoc, type UserDoc } from './models';
import { groupPro, type GroupPro } from './entitlements';
import { computeDeleteAfter } from './groups';

/** Fields userPro() needs, plus the name for "Pro via ...". */
export const PRO_PROJECTION = { name: 1, role: 1, proStore: 1, proExpiresAt: 1, proGrant: 1, banned: 1 } as const;

type GroupLike = Pick<GroupDoc, 'members' | 'ownerId'> & Partial<Pick<GroupDoc, 'tripPass'>>;

/** Loads the group's current members (in join order) with their Pro fields. */
export async function loadMembersForPro(group: Pick<GroupDoc, 'members'>): Promise<UserDoc[]> {
  const ids = group.members.map((m) => m.userId);
  if (!ids.length) return [];
  const users = await User.find({ _id: { $in: ids } }, PRO_PROJECTION).lean<UserDoc[]>();
  const byId = new Map(users.map((u) => [String(u._id), u]));
  return ids.map((id) => byId.get(String(id))).filter((u): u is UserDoc => Boolean(u));
}

/**
 * Group Pro with the member it comes from. One Pro member = Pro for the whole
 * group, and so does a Trip Pass. Pass the whole group document (with
 * tripPass): a projection without it would miss the pass.
 */
export async function groupProFor(group: GroupLike, viewerId?: Types.ObjectId | string | null): Promise<GroupPro> {
  return groupPro(await loadMembersForPro(group), { viewerId, ownerId: group.ownerId, tripPass: group.tripPass ?? null });
}

export async function groupIsPro(group: GroupLike): Promise<boolean> {
  return (await groupProFor(group)).isPro;
}

/**
 * Brings one group's free 30-day deletion in line with its Pro status:
 * Pro (any member, or a Trip Pass) -> keep forever; no longer Pro -> the free retention
 * starts again. A free group's existing date is left alone, so members
 * joining or leaving do not keep pushing it back.
 */
export async function refreshGroupRetention(groupOrId: Types.ObjectId | string | GroupDoc): Promise<void> {
  const group =
    typeof groupOrId === 'object' && 'members' in groupOrId
      ? groupOrId
      : await Group.findById(groupOrId, { type: 1, endDate: 1, deleteAfter: 1, members: 1, ownerId: 1, tripPass: 1 }).lean<GroupDoc>();
  if (!group) return;
  const pro = await groupIsPro(group);
  let next: Date | null;
  if (pro) next = null;
  else if (group.deleteAfter) return; // already on the free schedule
  else next = computeDeleteAfter(group.type, group.endDate ?? null, false);
  if (String(next) === String(group.deleteAfter ?? null)) return;
  await Group.updateOne({ _id: group._id }, { deleteAfter: next });
}

/** After someone's Pro changed (subscription, gift, admin, ban): every group they are in. */
export async function refreshRetentionForMember(userId: Types.ObjectId | string): Promise<void> {
  if (!Types.ObjectId.isValid(String(userId))) return;
  const groups = await Group.find(
    { 'members.userId': new Types.ObjectId(String(userId)) },
    { type: 1, endDate: 1, deleteAfter: 1, members: 1, ownerId: 1, tripPass: 1 },
  ).lean<GroupDoc[]>();
  for (const g of groups) await refreshGroupRetention(g);
}
