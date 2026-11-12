// App-wide admin ("Beheer" in the app). Not the same as a group admin
// (lib/groups.ts requireAdmin): this is the CamTrip team.
import { Types } from 'mongoose';
import { z } from 'zod';
import { Group, Photo, User, type UserDoc } from './models';
import { HttpError } from './http';
import { requireUser, syncAdminRole } from './auth';
import { userPro } from './entitlements';
import { refreshRetentionForMember } from './pro';

/** Signed-in app admin, or 403. Also bootstraps ADMIN_EMAILS on the way. */
export async function requireAdmin(req: Request): Promise<UserDoc> {
  const user = await syncAdminRole(await requireUser(req));
  if (user.role !== 'admin') throw new HttpError(403, 'Alleen voor beheerders van CamTrip', 'admin_required');
  return user;
}

// ---------------------------------------------------------------- pagination

export const PageQuery = z.object({
  page: z.coerce.number().int().min(1).max(10_000).default(1),
  limit: z.coerce.number().int().min(1).max(50).default(20),
});
export type Page = z.infer<typeof PageQuery>;

/** Validates ?page=&limit= plus any extra fields with zod. */
export function parseQuery<T extends z.ZodRawShape>(req: Request, extra: T) {
  const params = Object.fromEntries(new URL(req.url).searchParams.entries());
  return PageQuery.extend(extra).parse(params);
}

export function paged<T>(items: T[], page: Page, total: number) {
  return { items, page: page.page, limit: page.limit, total, hasMore: page.page * page.limit < total };
}

export function objectIdOr404(id: string, what = 'Gebruiker'): Types.ObjectId {
  if (!Types.ObjectId.isValid(id)) throw new HttpError(404, `${what} niet gevonden`);
  return new Types.ObjectId(id);
}

/** Escapes user input for a case-insensitive "contains" regex. */
export function containsRegex(q: string): RegExp {
  return new RegExp(q.replace(/[.*+?^${}()|[\]\\]/g, '\\$&'), 'i');
}

// ---------------------------------------------------------------- user views

function signIns(u: UserDoc): string[] {
  return [u.appleId ? 'apple' : null, u.googleId ? 'google' : null, u.passwordHash ? 'email' : null].filter(
    (x): x is string => Boolean(x),
  );
}

/** One row in the "Gebruikers" list. */
export function adminUserRow(u: UserDoc) {
  const pro = userPro(u);
  return {
    id: String(u._id),
    name: u.name || 'Fotograaf',
    email: u.email ?? '',
    avatarColor: u.avatarColor ?? '#d9472b',
    role: u.role === 'admin' ? 'admin' : 'user',
    banned: Boolean(u.banned),
    isPro: pro.isPro,
    proSource: pro.reason,
    proUntil: pro.until,
    createdAt: u.createdAt ?? null,
  };
}

/** Full view of one user for the admin detail screen. */
export async function adminUserDetail(u: UserDoc) {
  const now = new Date();
  const [groupsCount, photosCount, grantedBy] = await Promise.all([
    Group.countDocuments({ 'members.userId': u._id }),
    Photo.countDocuments({ userId: u._id, status: 'ready' }),
    u.proGrant?.grantedBy ? User.findById(u.proGrant.grantedBy, { name: 1, email: 1 }).lean<UserDoc>() : null,
  ]);
  const subActive = Boolean(u.proStore) && (!u.proExpiresAt || new Date(u.proExpiresAt) > now);
  const grantActive = Boolean(u.proGrant) && (!u.proGrant!.until || new Date(u.proGrant!.until) > now);
  return {
    ...adminUserRow(u),
    emailVerified: Boolean(u.emailVerified),
    signIns: signIns(u),
    bannedAt: u.bannedAt ?? null,
    bannedReason: u.bannedReason ?? '',
    groupsCount,
    photosCount,
    subscription: { active: subActive, expiresAt: u.proExpiresAt ?? null },
    proGrant: u.proGrant
      ? {
          active: grantActive,
          until: u.proGrant.until ?? null,
          reason: u.proGrant.reason ?? '',
          createdAt: u.proGrant.createdAt ?? null,
          grantedBy: grantedBy ? { id: String(grantedBy._id), name: grantedBy.name || grantedBy.email } : null,
        }
      : null,
  };
}

// ---------------------------------------------------------------- bans

/** Bans or unbans a user. Shared with the report actions. */
export async function setBanned(admin: UserDoc, id: Types.ObjectId, banned: boolean, reason = ''): Promise<UserDoc> {
  if (String(admin._id) === String(id)) throw new HttpError(400, 'Je kunt jezelf niet blokkeren');
  const target = await User.findById(id, { role: 1 }).lean<UserDoc>();
  if (!target) throw new HttpError(404, 'Gebruiker niet gevonden');
  if (banned && target.role === 'admin') throw new HttpError(400, 'Een beheerder kan niet geblokkeerd worden');
  const user = await User.findByIdAndUpdate(
    id,
    { $set: banned ? { banned: true, bannedAt: new Date(), bannedReason: reason } : { banned: false, bannedAt: null, bannedReason: '' } },
    { new: true, projection: { passwordHash: 0, resetCodeHash: 0, pushTokens: 0 } },
  ).lean<UserDoc>();
  // A banned member no longer makes their groups Pro.
  await refreshRetentionForMember(id);
  console.info(`[admin] ${String(admin._id)} ${banned ? 'banned' : 'unbanned'} ${String(id)}${reason ? `: ${reason}` : ''}`);
  return user!;
}
