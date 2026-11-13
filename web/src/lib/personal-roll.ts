// "Mijn rolletje": every user's private personal roll for loose photos that do
// not belong to an album. Server-side it is a group of type 'personal' with
// only the owner as member. These are the pure rules (no runtime imports, so
// this file runs as-is under `node --experimental-strip-types` for the tests);
// lib/groups.ts (ensurePersonalRoll, requireMember's "me" alias) wires them to Mongo.

export const PERSONAL_TYPE = 'personal';

/** Stored name; the app shows a localized label ("Mijn rolletje") instead. */
export const PERSONAL_ROLL_NAME = 'Mijn rolletje';

/** Alias the app may use as group id ("/groups/me/photos") before it knows the roll's id, e.g. offline. */
export const PERSONAL_ROLL_ALIAS = 'me';

/** The most photos one "Verplaats naar album" call may move. */
export const MOVE_MAX_PHOTOS = 500;

/**
 * Group codes are unique and required, but a personal roll must never be
 * joinable. Invite codes are normalized to A-Z/0-9 before any lookup
 * (normalizeCode), so a code with a '-' can never be matched by a join,
 * a lookup or the invite page.
 */
export function personalRollCode(userId: string): string {
  return `personal-${userId}`;
}

export function isPersonalRoll(group: { type?: string | null } | null | undefined): boolean {
  return group?.type === PERSONAL_TYPE;
}

/** Can anyone join this group by code? Never for a personal roll. */
export function joinable(group: { type?: string | null } | null | undefined): boolean {
  return Boolean(group) && !isPersonalRoll(group);
}

/** Mongo filter part that leaves personal rolls out (group lists, crons, counts). */
export const NOT_PERSONAL = { type: { $ne: PERSONAL_TYPE } } as const;

/** Fields of a new personal roll for [userId] (never deleted automatically: deleteAfter null). */
export function newPersonalRoll<Id>(userId: Id, defaultStyle: string) {
  return {
    name: PERSONAL_ROLL_NAME,
    type: PERSONAL_TYPE,
    startDate: null,
    endDate: null,
    defaultStyle,
    code: personalRollCode(String(userId)),
    ownerId: userId,
    members: [{ userId, role: 'admin' as const }],
    status: 'active' as const,
    deleteAfter: null,
  };
}

/** A camera style that needs Pro: not a free style, and not a camera-roll pick ('roll'). */
export function isProStyle(style: string, freeStyles: readonly string[]): boolean {
  return style !== 'roll' && !freeStyles.includes(style);
}

export type MoveError =
  | { status: 400; code: 'no_photos' | 'same_group' | 'target_personal'; message: string }
  | { status: 404; code: 'not_found'; message: string }
  | { status: 410; code: 'archived'; message: string }
  | { status: 402; code: 'pro_required'; message: string };

interface MovePhoto {
  _id: unknown;
  userId: unknown;
  groupId: unknown;
  status: string;
  style: string;
}

/**
 * Checks a "Verplaats naar album" request: the user moves their own, finished
 * photos out of their personal roll into a real group they are a member of.
 * [photos] are the rows found for the requested ids (any owner, any group);
 * [requested] is how many distinct valid ids were asked for. Pro styles need
 * the user's own Pro or the target group's Pro (the same rule as an upload
 * into that group). Returns null when the move is allowed.
 */
export function checkMove(opts: {
  userId: string;
  roll: { _id: unknown } | null;
  target: { _id: unknown; type?: string | null; status?: string; isMember: boolean } | null;
  photos: MovePhoto[];
  requested: number;
  userIsPro: boolean;
  targetIsPro: boolean;
  freeStyles: readonly string[];
}): MoveError | null {
  const { userId, roll, target, photos } = opts;
  if (opts.requested === 0) return { status: 400, code: 'no_photos', message: 'Geen foto’s gekozen' };
  if (!target || !target.isMember) return { status: 404, code: 'not_found', message: 'Groep niet gevonden' };
  if (isPersonalRoll(target)) {
    return { status: 400, code: 'target_personal', message: 'Kies een album om de foto’s naar te verplaatsen' };
  }
  if (target.status === 'archived') return { status: 410, code: 'archived', message: 'Deze groep is afgesloten' };
  if (!roll) return { status: 404, code: 'not_found', message: 'Foto niet gevonden' };
  if (String(roll._id) === String(target._id)) {
    return { status: 400, code: 'same_group', message: 'De foto’s staan al in dit album' };
  }
  // Every requested photo must be the user's own, ready, and in their roll.
  const ok = photos.filter(
    (p) => String(p.userId) === userId && String(p.groupId) === String(roll._id) && p.status === 'ready',
  );
  if (ok.length !== opts.requested || ok.length !== photos.length) {
    return { status: 404, code: 'not_found', message: 'Foto niet gevonden' };
  }
  if (!opts.userIsPro && !opts.targetIsPro && ok.some((p) => isProStyle(p.style, opts.freeStyles))) {
    return { status: 402, code: 'pro_required', message: 'Deze camerastijl hoort bij CamTrip Pro' };
  }
  return null;
}

/**
 * Which changes a personal roll accepts through PATCH /groups/:id. Name,
 * dates, status and "Reis afronden" belong to shared albums only.
 */
export function personalPatchAllowed(input: Record<string, unknown>): boolean {
  const allowed = new Set(['defaultStyle', 'coverPhotoId']);
  return Object.entries(input).every(([k, v]) => v === undefined || allowed.has(k));
}
