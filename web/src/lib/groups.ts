import { randomInt } from 'node:crypto';
import { Types } from 'mongoose';
import { Group, Photo, User, type GroupDoc, type UserDoc } from './models';
import { HttpError } from './http';
import { isPro } from './auth';
import { readUrl } from './storage';

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

/** A group gets Pro limits when its creator has Pro. */
export async function ownerIsPro(group: Pick<GroupDoc, 'ownerId'>): Promise<boolean> {
  const owner = await User.findById(group.ownerId, { proStore: 1, proExpiresAt: 1 }).lean<UserDoc>();
  return isPro(owner);
}

export function computeDeleteAfter(type: string, endDate: Date | null, pro: boolean): Date | null {
  if (pro || type === 'permanent') return null;
  const base = endDate ?? new Date();
  return new Date(base.getTime() + FREE_RETENTION_DAYS * 86_400_000);
}

/** Recompute deleteAfter for every group a user owns (after a Pro change). */
export async function refreshRetentionForOwner(ownerId: Types.ObjectId | string, pro: boolean) {
  const groups = await Group.find({ ownerId }, { type: 1, endDate: 1 }).lean<GroupDoc[]>();
  await Promise.all(
    groups.map((g) =>
      Group.updateOne({ _id: g._id }, { deleteAfter: computeDeleteAfter(g.type, g.endDate ?? null, pro) }),
    ),
  );
}

/** Shape sent to the app. Member details are joined in so the gallery can show avatars. */
export async function serializeGroup(group: GroupDoc, viewerId: Types.ObjectId | string) {
  const users = await User.find(
    { _id: { $in: group.members.map((m) => m.userId) } },
    { name: 1, avatarColor: 1 },
  ).lean<UserDoc[]>();
  const byId = new Map(users.map((u) => [String(u._id), u]));
  const pro = await ownerIsPro(group);

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
    memberLimit: pro ? null : FREE_MEMBER_LIMIT,
    myRole: memberRole(group, viewerId),
    ownerId: String(group.ownerId),
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
