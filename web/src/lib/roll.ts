// "Het rolletje": the free limit on how much one person shoots. Pure rules,
// no runtime imports, so this file runs as-is under
// `node --experimental-strip-types` for the tests. lib/roll-db.ts wires them
// to Mongo; the upload init (POST /groups/:id/photos) enforces them.
//
// - A free person gets 24 shots (photos and videos alike: a video is one shot)
//   per trip (group). The server counts that person's own photos in the group:
//   ready ones plus pending reservations that are still fresh. Deleted photos
//   are gone from the database, so they free a shot again.
// - The personal roll ("Mijn rolletje") has no trip, so there the 24 roll over
//   per calendar month (UTC): every 1st of the month a fresh roll. Counted on
//   createdAt (when the photo reached the server), not takenAt, so camera-roll
//   imports of old photos cannot dodge the limit.
// - No limit when the person has Pro, or the group is Pro (one Pro member, or
//   a Trip Pass for this group).

export const FREE_ROLL_LIMIT = 24;

/**
 * A reservation (upload init) that never completed stops counting after this
 * long, so a crashed or abandoned upload does not eat a shot for ever. The
 * app retries a failed upload with a new reservation, and presigned URLs only
 * live for 30 minutes, so 24 hours is generous.
 */
export const PENDING_GRACE_MS = 24 * 60 * 60 * 1000;

export interface RollUsage {
  limit: number;
  used: number;
}

/** Start of the window the personal roll counts in: the 1st of this month, 00:00 UTC. */
export function monthStart(now: Date): Date {
  return new Date(Date.UTC(now.getUTCFullYear(), now.getUTCMonth(), 1));
}

/** When the personal roll's count starts again (the 1st of next month, UTC). */
export function nextMonthStart(now: Date): Date {
  return new Date(Date.UTC(now.getUTCFullYear(), now.getUTCMonth() + 1, 1));
}

/**
 * Mongo filter for the shots that count against [userId]'s roll in [group]:
 * their own photos and videos, ready or freshly reserved, and for a personal
 * roll only this calendar month.
 */
export function rollCountFilter<Id>(group: { _id: Id; type?: string | null }, userId: Id, now: Date = new Date()) {
  const filter: Record<string, unknown> = {
    groupId: group._id,
    userId,
    $or: [{ status: 'ready' }, { status: 'pending', createdAt: { $gte: new Date(now.getTime() - PENDING_GRACE_MS) } }],
  };
  if (group.type === 'personal') filter.createdAt = { $gte: monthStart(now) };
  return filter;
}

/** No roll limit with personal Pro, or in a Pro group (Pro member or Trip Pass). */
export function rollExempt(opts: { userIsPro: boolean; groupIsPro: boolean }): boolean {
  return opts.userIsPro || opts.groupIsPro;
}

export interface RollFullError {
  status: 402;
  code: 'roll_full';
  message: string;
  limit: number;
  used: number;
}

/**
 * Checks whether [adding] more shots fit on the roll. Returns null when they
 * do (or the person is exempt), else the 402 the API answers with.
 */
export function checkRoll(opts: { used: number; adding?: number; exempt: boolean; limit?: number }): RollFullError | null {
  if (opts.exempt) return null;
  const limit = opts.limit ?? FREE_ROLL_LIMIT;
  const adding = opts.adding ?? 1;
  if (opts.used + adding <= limit) return null;
  return {
    status: 402,
    code: 'roll_full',
    message: `Je rolletje is vol (${Math.min(opts.used, limit)}/${limit})`,
    limit,
    used: opts.used,
  };
}

/** What the app shows in the camera ("18/24"); null = no limit for this viewer here. */
export function rollForViewer(opts: { used: number; exempt: boolean; limit?: number }): RollUsage | null {
  if (opts.exempt) return null;
  return { limit: opts.limit ?? FREE_ROLL_LIMIT, used: opts.used };
}
