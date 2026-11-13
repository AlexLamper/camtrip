// "Reiskaart + statistieken": trip map and trip stats for a group.
//
// Privacy rules (see also the privacy page):
// - Photos and videos never carry location metadata: the app strips it before
//   upload (processor.dart / video_processor.dart). A location is only sent as
//   two separate fields on upload init, and only when the group has the trip
//   map on (an admin switched it on) AND this member said yes to sharing.
// - Coordinates are coarsened to 3 decimals (about 100 m) on the phone and
//   again here, so a stored point never says more than "around here".
// - Only members of the group can see the points. Saying no later, leaving
//   the group, being removed, switching the map off, deleting a photo or
//   deleting the account removes the locations.
//
// Pure rules only (no runtime imports), so this file runs as-is under
// `node --experimental-strip-types` for the tests. Routes wire it to Mongo.

/** Decimals kept: 3 decimals of a degree is about 110 m north-south. */
export const COORD_DECIMALS = 3;
const FACTOR = 10 ** COORD_DECIMALS;

/** Consecutive points closer than this are noise from coarsening, not travel. */
export const MIN_SEGMENT_KM = 0.2;

/** "Plekken": distinct cells of 0.05 degree (about 5 km), a stand-in for towns. */
export const PLACE_CELL_DEG = 0.05;

const EARTH_RADIUS_KM = 6371.0088;

export interface LatLng {
  lat: number;
  lng: number;
}

/** Rounds one coordinate to about 100 m. */
export function coarsen(value: number): number {
  const r = Math.round(value * FACTOR) / FACTOR;
  return Object.is(r, -0) ? 0 : r;
}

/**
 * Validates a {lat, lng} from the app and coarsens it. Anything odd (missing,
 * not finite, out of range, exactly 0,0 which is a GPS failure) gives null,
 * so a bad value just means "no location", never a failed upload.
 */
export function parseLocation(v: unknown): LatLng | null {
  if (!v || typeof v !== 'object') return null;
  const { lat, lng } = v as Record<string, unknown>;
  if (typeof lat !== 'number' || typeof lng !== 'number') return null;
  if (!Number.isFinite(lat) || !Number.isFinite(lng)) return null;
  if (lat < -90 || lat > 90 || lng < -180 || lng > 180) return null;
  const out = { lat: coarsen(lat), lng: coarsen(lng) };
  if (out.lat === 0 && out.lng === 0) return null;
  return out;
}

// ---------------------------------------------------------------- consent

interface MemberLike {
  userId: unknown;
  mapConsent?: boolean | null;
}
interface GroupLike {
  type?: string | null;
  tripMap?: { enabled?: boolean | null } | null;
  members: MemberLike[];
}

export function tripMapEnabled(group: GroupLike): boolean {
  return group.type !== 'personal' && group.tripMap?.enabled === true;
}

/** true = shares, false = said no, null = not asked yet (or not a member). */
export function memberMapConsent(group: GroupLike, userId: unknown): boolean | null {
  const m = group.members.find((x) => String(x.userId) === String(userId));
  if (!m) return null;
  return typeof m.mapConsent === 'boolean' ? m.mapConsent : null;
}

/** A location from this user may be stored only when the map is on AND they said yes. */
export function mayStoreLocation(group: GroupLike, userId: unknown): boolean {
  return tripMapEnabled(group) && memberMapConsent(group, userId) === true;
}

/** The part of a serialized group the app needs (gallery toggle, consent prompt, settings). */
export function tripMapView(group: GroupLike, viewerId: unknown) {
  return { enabled: tripMapEnabled(group), myConsent: memberMapConsent(group, viewerId) };
}

/**
 * GET /groups/:id/map. Non-members get a 404 (they learn nothing). Members
 * always get the stats; the points only while the map is on.
 */
export function mapAccess(group: GroupLike, viewerId: unknown): { ok: true; showPoints: boolean } | { ok: false; status: 404 } {
  if (!group.members.some((m) => String(m.userId) === String(viewerId))) return { ok: false, status: 404 };
  return { ok: true, showPoints: tripMapEnabled(group) };
}

// ---------------------------------------------------------------- distance

/** Great-circle distance in km (haversine). */
export function haversineKm(a: LatLng, b: LatLng): number {
  const toRad = Math.PI / 180;
  const dLat = (b.lat - a.lat) * toRad;
  const dLng = (b.lng - a.lng) * toRad;
  const h = Math.sin(dLat / 2) ** 2 + Math.cos(a.lat * toRad) * Math.cos(b.lat * toRad) * Math.sin(dLng / 2) ** 2;
  return 2 * EARTH_RADIUS_KM * Math.asin(Math.min(1, Math.sqrt(h)));
}

/**
 * Sum of great-circle distances between consecutive points in time order.
 * Hops shorter than MIN_SEGMENT_KM are left out (coarsening noise).
 */
export function routeDistanceKm(points: (LatLng & { takenAt: Date | string })[]): number {
  const sorted = [...points].sort((a, b) => new Date(a.takenAt).getTime() - new Date(b.takenAt).getTime());
  let km = 0;
  for (let i = 1; i < sorted.length; i++) {
    const d = haversineKm(sorted[i - 1], sorted[i]);
    if (d >= MIN_SEGMENT_KM) km += d;
  }
  return Math.round(km * 10) / 10;
}

// ---------------------------------------------------------------- stats

/** Minutes east of UTC (Dart's timeZoneOffset.inMinutes). Clamped; junk = 0. */
export function parseTzOffset(v: string | null | undefined): number {
  const n = Number(v);
  if (!v || !Number.isFinite(n)) return 0;
  return Math.max(-14 * 60, Math.min(14 * 60, Math.round(n)));
}

/** Local calendar day "YYYY-MM-DD" for a moment, given the viewer's UTC offset. */
export function dayKey(at: Date | string, tzOffsetMinutes: number): string {
  return new Date(new Date(at).getTime() + tzOffsetMinutes * 60_000).toISOString().slice(0, 10);
}

export function placeKey(p: LatLng): string {
  const cell = (v: number) => Math.floor(v / PLACE_CELL_DEG);
  return `${cell(p.lat)}:${cell(p.lng)}`;
}

export interface StatsPhoto {
  takenAt: Date | string;
  userId: unknown;
  kind?: string;
  location?: (LatLng & { countryCode?: string | null }) | null;
}

export interface TripStats {
  days: number;
  photos: number;
  videos: number;
  members: number;
  mostActiveDay: { date: string; count: number } | null;
  topPhotographer: { userId: string; count: number } | null;
  // Map stats: only when the trip map is on (0 / [] otherwise).
  located: number;
  distanceKm: number;
  countries: string[];
  places: number;
}

/**
 * Stats for a set of ready photos/videos. Ties pick the earliest day and,
 * for the photographer, the lowest id, so the result is stable.
 */
export function computeTripStats(
  photos: StatsPhoto[],
  opts: { members: number; tzOffset?: number; mapEnabled?: boolean },
): TripStats {
  const tz = opts.tzOffset ?? 0;
  const perDay = new Map<string, number>();
  const perUser = new Map<string, number>();
  let videos = 0;
  for (const p of photos) {
    if (p.kind === 'video') videos++;
    const d = dayKey(p.takenAt, tz);
    perDay.set(d, (perDay.get(d) ?? 0) + 1);
    const u = String(p.userId);
    perUser.set(u, (perUser.get(u) ?? 0) + 1);
  }
  const best = <K extends string>(m: Map<K, number>): [K, number] | null => {
    let out: [K, number] | null = null;
    for (const [k, n] of [...m.entries()].sort((a, b) => (a[0] < b[0] ? -1 : a[0] > b[0] ? 1 : 0))) {
      if (!out || n > out[1]) out = [k, n];
    }
    return out;
  };
  const day = best(perDay);
  const user = best(perUser);

  const located = opts.mapEnabled
    ? photos.filter((p): p is StatsPhoto & { location: LatLng & { countryCode?: string | null } } => Boolean(p.location))
    : [];
  const countries = [...new Set(located.map((p) => p.location.countryCode).filter((c): c is string => Boolean(c)))].sort();
  return {
    days: perDay.size,
    photos: photos.length - videos,
    videos,
    members: opts.members,
    mostActiveDay: day ? { date: day[0], count: day[1] } : null,
    topPhotographer: user ? { userId: user[0], count: user[1] } : null,
    located: located.length,
    distanceKm: routeDistanceKm(located.map((p) => ({ lat: p.location.lat, lng: p.location.lng, takenAt: p.takenAt }))),
    countries,
    places: new Set(located.map((p) => placeKey(p.location))).size,
  };
}

// ---------------------------------------------------------------- country lookup (offline)

/**
 * Compact Natural Earth 110m admin-0 countries (public domain), made by
 * scripts: c = ISO 3166-1 alpha-2, b = bbox [minLng, minLat, maxLng, maxLat],
 * p = polygons, each a list of rings (outer first, then holes) as flat
 * [lng, lat, lng, lat, ...] arrays rounded to 2 decimals.
 */
export interface CountryShape {
  c: string;
  b: [number, number, number, number];
  p: number[][][];
}

/** How far (degrees) outside a coarse coastline a point may be and still count. */
export const COUNTRY_SNAP_DEG = 0.35;

function inRing(lng: number, lat: number, ring: number[]): boolean {
  let inside = false;
  for (let i = 0, j = ring.length - 2; i < ring.length; j = i, i += 2) {
    const xi = ring[i], yi = ring[i + 1], xj = ring[j], yj = ring[j + 1];
    if (yi > lat !== yj > lat && lng < ((xj - xi) * (lat - yi)) / (yj - yi) + xi) inside = !inside;
  }
  return inside;
}

function inShape(lng: number, lat: number, s: CountryShape): boolean {
  for (const poly of s.p) {
    if (!inRing(lng, lat, poly[0])) continue;
    if (!poly.slice(1).some((hole) => inRing(lng, lat, hole))) return true;
  }
  return false;
}

/** Squared distance (degrees, lng scaled by cos(lat)) from a point to a shape's edges. */
function edgeDistanceSq(lng: number, lat: number, s: CountryShape): number {
  const k = Math.cos((lat * Math.PI) / 180);
  let best = Infinity;
  for (const poly of s.p) {
    for (const ring of poly) {
      for (let i = 2; i < ring.length; i += 2) {
        const ax = ring[i - 2] * k, ay = ring[i - 1], bx = ring[i] * k, by = ring[i + 1];
        const px = lng * k, py = lat;
        const dx = bx - ax, dy = by - ay;
        const len = dx * dx + dy * dy;
        const t = len ? Math.max(0, Math.min(1, ((px - ax) * dx + (py - ay) * dy) / len)) : 0;
        const ex = ax + t * dx - px, ey = ay + t * dy - py;
        best = Math.min(best, ex * ex + ey * ey);
      }
    }
  }
  return best;
}

/**
 * Country code for a point, or null (open sea, or a microstate the 110m set
 * leaves out). A point just off a coarse coastline (a beach, a harbour) snaps
 * to the nearest country within COUNTRY_SNAP_DEG.
 */
export function countryAt(shapes: CountryShape[], lat: number, lng: number): string | null {
  const near: CountryShape[] = [];
  for (const s of shapes) {
    const [x0, y0, x1, y1] = s.b;
    if (lng >= x0 && lng <= x1 && lat >= y0 && lat <= y1 && inShape(lng, lat, s)) return s.c;
    const m = COUNTRY_SNAP_DEG;
    if (lng >= x0 - m && lng <= x1 + m && lat >= y0 - m && lat <= y1 + m) near.push(s);
  }
  let best: { c: string; d: number } | null = null;
  for (const s of near) {
    const d = edgeDistanceSq(lng, lat, s);
    if (d <= COUNTRY_SNAP_DEG ** 2 && (!best || d < best.d)) best = { c: s.c, d };
  }
  return best?.c ?? null;
}
