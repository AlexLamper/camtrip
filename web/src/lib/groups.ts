import { randomInt } from 'node:crypto';
import { Types } from 'mongoose';
import { Group, HiddenPhoto, Photo, Report, User, type GroupDoc, type UserDoc } from './models';
import { HttpError } from './http';
import { groupPro } from './entitlements';
import { deleteKeys, readUrl } from './storage';

export const FREE_MEMBER_LIMIT = 10;
export const FREE_RETENTION_DAYS = 30;

// No 0/O/1/I/L: codes get read out loud and typed on a beach.
const CODE_ALPHABET = 'ABCDEFGHJKMNPQRSTUVWXYZ23456789';

export function normalizeCode(code: string): string {
  return code.trim().toUpperCase().replace(/[^A-Z0-9]/g, '');
}

export async function uniqueCode(): Promise<string> {
  for (let attempt = 0; attempt < 20; attempt++) {
    const code = Array.from({ length: 6 }, () => CODE_ALPHABET[randomInt(CODE_ALPHABET.length)]).join('');
    if (!(await Group.exists({ code }))) return code;
  }
  throw new Error('Could not generate a unique group code');
}

export function memberRole(group: GroupDoc, userId: Types.ObjectId | string): 'admin' | 'member' | null {
  const m = group.members.find((x) => String(x.userId) === String(userId));
  return m ? (m.role as 'admin' | 'member') : null;
}

export async function requireMember(groupId: string, userId: Types.ObjectId): Promise<GroupDoc> {
  if (!Types.ObjectId.isValid(groupId)) throw new HttpError(404, 'Groep niet gevonden');
  const group = await Group.findById(groupId).lean<GroupDoc>();
  if (!group || !memberRole(group, userId)) throw new HttpError(404, 'Groep niet gevonden');
  return group;
}

export async function requireAdmin(groupId: string, userId: Types.ObjectId): Promise<GroupDoc> {
  const group = await requireMember(groupId, userId);
  if (memberRole(group, userId) !== 'admin') throw new HttpError(403, 'Alleen de beheerder kan dit doen');
  return group;
}

// Group Pro (one Pro member = Pro for the whole group) lives in ./pro
// (groupIsPro / groupProFor / refreshGroupRetention) and ./entitlements.

export function computeDeleteAfter(type: string, endDate: Date | null, pro: boolean): Date | null {
  if (pro || type === 'permanent') return null;
  const base = endDate ?? new Date();
  return new Date(base.getTime() + FREE_RETENTION_DAYS * 86_400_000);
}

/** Shape sent to the app. Member details are joined in so the gallery can show avatars. */
export async function serializeGroup(group: GroupDoc, viewerId: Types.ObjectId | string) {
  const users = await User.find(
    { _id: { $in: group.members.map((m) => m.userId) } },
    { name: 1, avatarColor: 1, role: 1, proStore: 1, proExpiresAt: 1, proGrant: 1, banned: 1 },
  ).lean<UserDoc[]>();
  const byId = new Map(users.map((u) => [String(u._id), u]));
  // One Pro member = Pro for everyone in the group (see lib/entitlements.ts).
  const gp = groupPro(
    group.members.map((m) => byId.get(String(m.userId))).filter((u): u is UserDoc => Boolean(u)),
    { viewerId, ownerId: group.ownerId },
  );
  const pro = gp.isPro;

  const hiddenCount = await HiddenPhoto.countDocuments({ userId: viewerId, groupId: group._id });

  let coverUrl: string | null = null;
  if (group.coverPhotoId) {
    const cover = await Photo.findById(group.coverPhotoId, { thumbKey: 1 }).lean();
    if (cover) coverUrl = await readUrl(cover.thumbKey);
  }

  return {
    id: String(group._id),
    name: group.name,
    type: group.type,
    startDate: group.startDate ?? null,
    endDate: group.endDate ?? null,
    defaultStyle: group.defaultStyle,
    code: group.code,
    status: group.status,
    photoCount: group.photoCount ?? 0,
    videoCount: group.videoCount ?? 0,
    coverUrl,
    deleteAfter: group.deleteAfter ?? null,
    isProGroup: pro,
    // Group Pro: 'self' = the viewer's own Pro, 'group' = another member's ("Pro via Sanne").
    isPro: pro,
    proSource: !pro ? null : gp.proBy?.id === String(viewerId) ? 'self' : 'group',
    proBy: gp.proBy ? { id: gp.proBy.id, name: gp.proBy.name } : null,
    memberLimit: pro ? null : FREE_MEMBER_LIMIT,
    myRole: memberRole(group, viewerId),
    ownerId: String(group.ownerId),
    // Personal: only this viewer archived it ("Gearchiveerd" in their albums list).
    archived: (group.archivedBy ?? []).some((id) => String(id) === String(viewerId)),
    // Photos this viewer hid for themselves ("Verborgen foto's").
    hiddenCount,
    members: group.members.map((m) => {
      const u = byId.get(String(m.userId));
      return {
        id: String(m.userId),
        name: u?.name || 'Vriend',
        avatarColor: u?.avatarColor ?? '#d9472b',
        role: m.role,
      };
    }),
    createdAt: (group as unknown as { createdAt?: Date }).createdAt ?? null,
  };
}

/**
 * Removes a whole group for everyone: every photo and video in R2 (original,
 * display, thumbnail), the photo rows, reports, personal hides and the group.
 * Nobody is notified. Phones keep whatever was already saved to their album.
 */
export async function deleteGroupEverywhere(group: Pick<GroupDoc, '_id'>): Promise<number> {
  const photos = await Photo.find({ groupId: group._id }, { originalKey: 1, displayKey: 1, thumbKey: 1 }).lean();
  await deleteKeys(photos.flatMap((p) => [p.originalKey, p.displayKey, p.thumbKey]));
  await Photo.deleteMany({ groupId: group._id });
  await Report.deleteMany({ groupId: group._id });
  await HiddenPhoto.deleteMany({ groupId: group._id });
  await Group.deleteOne({ _id: group._id });
  return photos.length;
}
