// Who has CamTrip Pro, and why. Pure functions with no database access, so
// this file also runs as-is under `node --experimental-strip-types` for the
// tests (only type imports below).
//
// Personal Pro comes from one of three sources:
//   - 'subscription': an active RevenueCat 'pro' entitlement (proStore + proExpiresAt)
//   - 'gift':         a proGrant given by an admin (until null = lifetime)
//   - 'admin':        app admins always have Pro
// A group is Pro when ANY current member has personal Pro ('group' for the others):
// one Pro in the group = Pro for everyone in that group. A group is also Pro,
// for good, when someone bought a Trip Pass for it ('tripPass', lib/trip-pass.ts).
import type { Types } from 'mongoose';

export type ProSource = 'subscription' | 'gift' | 'admin' | 'group' | 'tripPass';
export type PersonalProSource = Exclude<ProSource, 'group' | 'tripPass'>;

/** The Trip Pass stored on a group (Group.tripPass). */
export interface TripPassFields {
  transactionId?: string | null;
  purchasedBy?: Types.ObjectId | string | null;
  purchasedAt?: Date | string | null;
}

/** A Trip Pass counts when it has a transaction (a refund removes the whole field). */
export function tripPassActive(tripPass: TripPassFields | null | undefined): boolean {
  return Boolean(tripPass?.transactionId);
}

export interface ProFields {
  _id?: Types.ObjectId | string;
  name?: string;
  role?: 'user' | 'admin' | string | null;
  proStore?: boolean | null;
  proExpiresAt?: Date | string | null;
  proGrant?: { until?: Date | string | null } | null;
  banned?: boolean | null;
}

export interface UserPro {
  isPro: boolean;
  /** The main reason, null without Pro. Order: admin, subscription, gift. */
  reason: PersonalProSource | null;
  /** When Pro ends, taking every active source into account. null = no end (or no Pro). */
  until: Date | null;
}

function time(d: Date | string | null | undefined): number | null {
  if (d === null || d === undefined) return null;
  const t = new Date(d).getTime();
  return Number.isNaN(t) ? null : t;
}

export function isAppAdmin(user: Pick<ProFields, 'role'> | null | undefined): boolean {
  return user?.role === 'admin';
}

/** RevenueCat Pro that has not lapsed. No expiry = non-expiring entitlement. */
export function subscriptionActive(user: ProFields | null | undefined, now: Date = new Date()): boolean {
  if (!user?.proStore) return false;
  const exp = time(user.proExpiresAt);
  return exp === null || exp > now.getTime();
}

/** A gift from an admin that has not run out. until null = lifetime. */
export function grantActive(user: ProFields | null | undefined, now: Date = new Date()): boolean {
  const grant = user?.proGrant;
  if (!grant) return false;
  const until = time(grant.until);
  return until === null || until > now.getTime();
}

/** Personal Pro: subscription OR gift OR admin. Banned accounts never have Pro. */
export function userPro(user: ProFields | null | undefined, now: Date = new Date()): UserPro {
  if (!user || user.banned) return { isPro: false, reason: null, until: null };
  const admin = isAppAdmin(user);
  const sub = subscriptionActive(user, now);
  const gift = grantActive(user, now);
  if (!admin && !sub && !gift) return { isPro: false, reason: null, until: null };

  const reason: PersonalProSource = admin ? 'admin' : sub ? 'subscription' : 'gift';
  // The furthest end of every active source; any source without an end wins.
  let until: number | null = 0;
  const ends: (number | null)[] = [];
  if (admin) ends.push(null);
  if (sub) ends.push(time(user.proExpiresAt));
  if (gift) ends.push(time(user.proGrant?.until));
  for (const e of ends) {
    if (e === null) {
      until = null;
      break;
    }
    until = Math.max(until, e);
  }
  return { isPro: true, reason, until: until === null ? null : new Date(until) };
}

/** Shorthand for the many places that only need yes/no. */
export function hasPro(user: ProFields | null | undefined, now: Date = new Date()): boolean {
  return userPro(user, now).isPro;
}

export interface GroupPro {
  isPro: boolean;
  /** The member whose Pro the group uses (the viewer, else the owner, else the longest member). */
  proBy: { id: string; name: string; reason: PersonalProSource } | null;
  /** The group has a Trip Pass (Pro for good, whoever is in it). */
  tripPass: boolean;
}

/**
 * A group is Pro when any current member has personal Pro, or when it has a
 * Trip Pass. [members] are the group's current members (user documents with
 * the Pro fields), in join order. The member credited in "Pro via ..." is the
 * viewer when they have Pro themselves, else the owner, else the first Pro
 * member in join order (null when only the Trip Pass makes it Pro).
 */
export function groupPro(
  members: ProFields[],
  opts: {
    viewerId?: Types.ObjectId | string | null;
    ownerId?: Types.ObjectId | string | null;
    now?: Date;
    tripPass?: TripPassFields | null;
  } = {},
): GroupPro {
  const now = opts.now ?? new Date();
  const tripPass = tripPassActive(opts.tripPass);
  const pro = members
    .map((m) => ({ m, p: userPro(m, now) }))
    .filter((x) => x.p.isPro);
  if (!pro.length) return { isPro: tripPass, proBy: null, tripPass };
  const pick =
    (opts.viewerId != null && pro.find((x) => String(x.m._id) === String(opts.viewerId))) ||
    (opts.ownerId != null && pro.find((x) => String(x.m._id) === String(opts.ownerId))) ||
    pro[0];
  return {
    isPro: true,
    proBy: { id: String(pick.m._id ?? ''), name: pick.m.name || 'Vriend', reason: pick.p.reason! },
    tripPass,
  };
}

/**
 * Where a viewer's Pro in one group comes from, for the app:
 * 'self' = their own Pro, 'tripPass' = the group's Trip Pass (lasts for good,
 * so it is named before a member's Pro, which can lapse), 'group' = another
 * member's Pro ("Pro via Sanne"). null = no Pro here.
 */
export function groupProSource(
  group: GroupPro,
  viewerId: Types.ObjectId | string | null | undefined,
): 'self' | 'group' | 'tripPass' | null {
  if (!group.isPro) return null;
  if (group.proBy && viewerId != null && group.proBy.id === String(viewerId)) return 'self';
  if (group.tripPass) return 'tripPass';
  return group.proBy ? 'group' : null;
}

/**
 * What a viewer gets in one group: their own Pro, or the group's.
 * source 'group' means the group made it Pro, not their own account.
 */
export function proInGroup(viewerPro: UserPro, group: GroupPro): { isPro: boolean; source: ProSource | null } {
  if (viewerPro.isPro) return { isPro: true, source: viewerPro.reason };
  if (group.isPro) return { isPro: true, source: group.tripPass ? 'tripPass' : 'group' };
  return { isPro: false, source: null };
}

// ---------------------------------------------------------------- admins from env

/** Parses ADMIN_EMAILS (comma or whitespace separated) into lowercase addresses. */
export function parseAdminEmails(raw: string | null | undefined): Set<string> {
  return new Set(
    (raw ?? '')
      .split(/[\s,;]+/)
      .map((s) => s.trim().toLowerCase())
      .filter((s) => s.includes('@')),
  );
}

/**
 * True when this account should be bootstrapped as admin: its e-mail is in
 * ADMIN_EMAILS AND the address is verified by Apple/Google (a push reset code
 * proves nothing about the mailbox). An unverified address never counts,
 * otherwise anyone could register the owner's address and become admin.
 */
export function isBootstrapAdmin(
  user: { email?: string | null; emailVerified?: boolean | null } | null | undefined,
  adminEmails: Set<string>,
): boolean {
  if (!user?.email || !user.emailVerified || !adminEmails.size) return false;
  return adminEmails.has(user.email.trim().toLowerCase());
}

/**
 * Mongo filter for everyone who should get admin alerts (e.g. a new report):
 * users with role 'admin', plus users whose *verified* e-mail is in
 * ADMIN_EMAILS (they become admin on their next sign-in anyway). Banned
 * accounts are left out.
 */
export function adminRecipientsFilter(adminEmails: Set<string>): Record<string, unknown> {
  const or: Record<string, unknown>[] = [{ role: 'admin' }];
  if (adminEmails.size) or.push({ email: { $in: [...adminEmails] }, emailVerified: true });
  return { $or: or, banned: { $ne: true } };
}

// ---------------------------------------------------------------- gifts

export type GrantDuration = 'month' | 'year' | 'lifetime' | 'custom';

/** End date of a gift. 'custom' needs [custom] in the future; lifetime = null. */
export function grantUntil(duration: GrantDuration, now: Date = new Date(), custom?: Date | null): Date | null {
  switch (duration) {
    case 'lifetime':
      return null;
    case 'month': {
      const d = new Date(now);
      d.setMonth(d.getMonth() + 1);
      return d;
    }
    case 'year': {
      const d = new Date(now);
      d.setFullYear(d.getFullYear() + 1);
      return d;
    }
    case 'custom':
      if (!custom || Number.isNaN(custom.getTime()) || custom.getTime() <= now.getTime()) {
        throw new RangeError('custom date must be in the future');
      }
      return custom;
  }
}
