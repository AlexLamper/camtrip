import { randomInt } from 'node:crypto';
import { Types } from 'mongoose';
import { DEFAULT_STYLE, Group, HiddenPhoto, Photo, Report, User, type GroupDoc, type UserDoc } from './models';
import { HttpError } from './http';
import { groupPro, groupProSource, tripPassActive } from './entitlements';
import { rollForGroup } from './roll-db';
import { deleteKeys, readUrl } from './storage';
import { isPersonalRoll, newPersonalRoll, PERSONAL_ROLL_ALIAS, PERSONAL_TYPE } from './personal-roll';
import { tripMapView } from './trip-map';

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

/** The user's personal roll ("Mijn rolletje"), or null when it was never created. */
export async function findPersonalRoll(userId: Types.ObjectId): Promise<GroupDoc | null> {
  return Group.findOne({ ownerId: userId, type: PERSONAL_TYPE }).lean<GroupDoc>();
}

/**
 * The user's personal roll, created on first use. Idempotent: the unique
 * partial index (one personal roll per owner) turns a concurrent second
 * create into a duplicate-key error, after which the existing roll is read.
 */
export async function ensurePersonalRoll(userId: Types.ObjectId): Promise<GroupDoc> {
  const existing = await findPersonalRoll(userId);
  if (existing) return existing;
  try {
    const created = await Group.create(newPersonalRoll(userId, DEFAULT_STYLE));
    return created.toObject() as GroupDoc;
  } catch (e) {
    if ((e as { code?: number }).code !== 11000) throw e;
    const again = await findPersonalRoll(userId);
    if (!again) throw e;
    return again;
  }
}

/** Refuses actions that only make sense for shared albums (leave, members, archive, delete). */
export function refuseForPersonalRoll(group: Pick<GroupDoc, 'type'>): void {
  if (isPersonalRoll(group)) throw new HttpError(400, 'Dit kan niet met je eigen rolletje', 'personal_roll');
}

/**
 * The group, if the user is a member. The id "me" means the user's personal
 * roll (created on first use), so the app can use one stable id for it, also
 * for photos taken offline before it knew the roll's real id.
 */
export async function requireMember(groupId: string, userId: Types.ObjectId): Promise<GroupDoc> {
  if (groupId === PERSONAL_ROLL_ALIAS) return ensurePersonalRoll(userId);
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
  // A personal roll ("Mijn rolletje") is kept as long as the account exists.
  if (pro || type === 'permanent' || type === PERSONAL_TYPE) return null;
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
    { viewerId, ownerId: group.ownerId, tripPass: group.tripPass ?? null },
  );
  const pro = gp.isPro;

  // Trip Pass: who bought it (may have left the group since).
  let tripPass: { purchasedByName: string; purchasedAt: Date | null } | null = null;
  if (tripPassActive(group.tripPass)) {
    const buyerId = String(group.tripPass!.purchasedBy ?? '');
    const buyer = byId.get(buyerId) ?? (Types.ObjectId.isValid(buyerId) ? await User.findById(buyerId, { name: 1 }).lean<UserDoc>() : null);
    tripPass = { purchasedByName: buyer?.name || 'Vriend', purchasedAt: group.tripPass!.purchasedAt ?? null };
  }
  // The viewer's free roll here ("18/24"); null = no limit (Pro, Pro group or Trip Pass).
  // (The viewer is a member, so their own Pro already makes [pro] true.)
  const roll = await rollForGroup({ _id: new Types.ObjectId(String(viewerId)) }, group, pro);

  const hiddenCount = await HiddenPhoto.countDocuments({ userId: viewerId, groupId: group._id });

  let coverUrl: string | null = null;
  if (group.coverPhotoId) {
    const cover = await Photo.findById(group.coverPhotoId, { thumbKey: 1 }).lean();
    if (cover) coverUrl = await readUrl(cover.thumbKey);
  }

  const personal = isPersonalRoll(group);
  return {
    id: String(group._id),
    name: group.name,
    type: group.type,
    // "Mijn rolletje": private, never joinable, no invite code, never auto-deleted.
    isPersonal: personal,
    startDate: group.startDate ?? null,
    endDate: group.endDate ?? null,
    defaultStyle: group.defaultStyle,
    code: personal ? '' : group.code,
    status: group.status,
    photoCount: group.photoCount ?? 0,
    videoCount: group.videoCount ?? 0,
    coverUrl,
    deleteAfter: personal ? null : (group.deleteAfter ?? null),
    isProGroup: pro,
    // Group Pro: 'self' = the viewer's own Pro, 'tripPass' = the group's Trip Pass,
    // 'group' = another member's ("Pro via Sanne").
    isPro: pro,
    proSource: groupProSource(gp, viewerId),
    tripPass,
    roll,
    proBy: gp.proBy ? { id: gp.proBy.id, name: gp.proBy.name } : null,
    memberLimit: pro || personal ? null : FREE_MEMBER_LIMIT,
    myRole: memberRole(group, viewerId),
    ownerId: String(group.ownerId),
    // Personal: only this viewer archived it ("Gearchiveerd" in their albums list).
    archived: (group.archivedBy ?? []).some((id) => String(id) === String(viewerId)),
    // Photos this viewer hid for themselves ("Verborgen foto's").
    hiddenCount,
    // Reiskaart: on for the group? Does this viewer share locations (null = not asked yet)?
    tripMap: tripMapView(group, viewerId),
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
