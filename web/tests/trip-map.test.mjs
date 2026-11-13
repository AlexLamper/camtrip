// Run with `npm test` (node --experimental-strip-types --test).
// Reiskaart: consent gating, coarsening, distance, stats, country lookup.
import { test } from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import {
  coarsen,
  computeTripStats,
  countryAt,
  dayKey,
  haversineKm,
  mapAccess,
  mayStoreLocation,
  memberMapConsent,
  parseLocation,
  parseTzOffset,
  routeDistanceKm,
  tripMapEnabled,
  tripMapView,
} from '../src/lib/trip-map.ts';

const shapes = JSON.parse(readFileSync(new URL('../src/data/countries-110m.json', import.meta.url), 'utf8'));

const A = 'aaaaaaaaaaaaaaaaaaaaaaaa';
const B = 'bbbbbbbbbbbbbbbbbbbbbbbb';
const C = 'cccccccccccccccccccccccc';
const group = (enabled, consents, type = 'vacation') => ({
  type,
  tripMap: { enabled },
  members: Object.entries(consents).map(([userId, mapConsent]) => ({ userId, role: 'member', mapConsent })),
});

test('coarsening keeps 3 decimals (about 100 m)', () => {
  assert.equal(coarsen(51.923456), 51.923);
  assert.equal(coarsen(4.47917), 4.479);
  assert.equal(coarsen(-0.0004), 0);
  assert.deepEqual(parseLocation({ lat: 51.92345678, lng: 4.47912345 }), { lat: 51.923, lng: 4.479 });
  // An exact phone fix is never stored more precisely than ~100 m.
  const p = parseLocation({ lat: 52.3731234, lng: 4.8926789 });
  assert.ok(haversineKm(p, { lat: 52.3731234, lng: 4.8926789 }) < 0.08);
});

test('bad locations are ignored, not errors', () => {
  for (const bad of [null, undefined, 'x', {}, { lat: '52', lng: 4 }, { lat: NaN, lng: 4 }, { lat: 91, lng: 0 },
    { lat: 0, lng: 181 }, { lat: 0, lng: 0 }, { lat: Infinity, lng: 1 }]) {
    assert.equal(parseLocation(bad), null);
  }
});

test('consent gating: map on AND member said yes', () => {
  const g = group(true, { [A]: true, [B]: false, [C]: null });
  assert.equal(mayStoreLocation(g, A), true);
  assert.equal(mayStoreLocation(g, B), false);
  assert.equal(mayStoreLocation(g, C), false); // not asked yet
  assert.equal(mayStoreLocation(g, 'dddddddddddddddddddddddd'), false); // not a member
  assert.equal(mayStoreLocation(group(false, { [A]: true }), A), false); // map off
  assert.equal(mayStoreLocation({ type: 'vacation', members: [{ userId: A, mapConsent: true }] }, A), false); // default off
  assert.equal(mayStoreLocation(group(true, { [A]: true }, 'personal'), A), false); // never on a personal roll
  assert.equal(tripMapEnabled(group(true, {}, 'personal')), false);
  assert.equal(memberMapConsent(g, C), null);
  assert.deepEqual(tripMapView(g, B), { enabled: true, myConsent: false });
});

test('map endpoint permissions', () => {
  const g = group(true, { [A]: true, [B]: null });
  assert.deepEqual(mapAccess(g, A), { ok: true, showPoints: true });
  assert.deepEqual(mapAccess(g, B), { ok: true, showPoints: true }); // members see points even without sharing
  assert.deepEqual(mapAccess(g, C), { ok: false, status: 404 }); // non-members learn nothing
  assert.deepEqual(mapAccess(group(false, { [A]: true }), A), { ok: true, showPoints: false }); // stats only
  assert.deepEqual(mapAccess(group(true, { [A]: true }, 'personal'), A), { ok: true, showPoints: false });
});

test('great-circle distance', () => {
  const ams = { lat: 52.3676, lng: 4.9041 };
  const par = { lat: 48.8566, lng: 2.3522 };
  const d = haversineKm(ams, par);
  assert.ok(Math.abs(d - 430) < 5, `AMS-PAR ${d}`);
  assert.equal(haversineKm(ams, ams), 0);
  // Across the antimeridian: Fiji east to west is short, not half the world.
  assert.ok(haversineKm({ lat: -17, lng: 179.9 }, { lat: -17, lng: -179.9 }) < 25);
});

test('route distance: time order, coarsening noise ignored', () => {
  const t = (h) => new Date(Date.UTC(2027, 6, 1, h)).toISOString();
  const ams = { lat: 52.368, lng: 4.904, takenAt: t(9) };
  const ams2 = { lat: 52.369, lng: 4.904, takenAt: t(10) }; // ~110 m: noise
  const utr = { lat: 52.091, lng: 5.122, takenAt: t(12) };
  const par = { lat: 48.857, lng: 2.352, takenAt: t(18) };
  // Given out of order; sorted by time = AMS -> AMS -> UTR -> PAR.
  const km = routeDistanceKm([par, utr, ams2, ams]);
  const expected = haversineKm(ams2, utr) + haversineKm(utr, par);
  assert.ok(Math.abs(km - expected) < 0.2, `${km} vs ${expected}`);
  assert.equal(routeDistanceKm([]), 0);
  assert.equal(routeDistanceKm([ams]), 0);
  assert.equal(routeDistanceKm([ams, ams2]), 0);
});

test('stats: days in local time, most active day, top photographer', () => {
  const tz = 120; // CEST
  const photos = [
    // 23:30 UTC on 1 July = 01:30 on 2 July in CEST.
    { takenAt: '2027-07-01T23:30:00Z', userId: A, kind: 'photo' },
    { takenAt: '2027-07-02T10:00:00Z', userId: A, kind: 'photo' },
    { takenAt: '2027-07-02T11:00:00Z', userId: B, kind: 'video' },
    { takenAt: '2027-07-03T09:00:00Z', userId: B, kind: 'photo' },
  ];
  const s = computeTripStats(photos, { members: 3, tzOffset: tz });
  assert.equal(s.days, 2);
  assert.equal(s.photos, 3);
  assert.equal(s.videos, 1);
  assert.equal(s.members, 3);
  assert.deepEqual(s.mostActiveDay, { date: '2027-07-02', count: 3 });
  assert.deepEqual(s.topPhotographer, { userId: A, count: 2 }); // tie 2-2: lowest id, stable
  // Map stats stay empty while the map is off, even if rows had locations.
  assert.equal(s.distanceKm, 0);
  assert.deepEqual(s.countries, []);
  assert.equal(dayKey('2027-07-01T23:30:00Z', 0), '2027-07-01');
  assert.equal(parseTzOffset('120'), 120);
  assert.equal(parseTzOffset('-300'), -300);
  assert.equal(parseTzOffset('junk'), 0);
  assert.equal(parseTzOffset('99999'), 840);
  assert.equal(parseTzOffset(null), 0);
  const empty = computeTripStats([], { members: 1 });
  assert.equal(empty.mostActiveDay, null);
  assert.equal(empty.topPhotographer, null);
});

test('stats with the map on: distance, countries, places', () => {
  const photos = [
    { takenAt: '2027-07-01T09:00:00Z', userId: A, location: { lat: 52.368, lng: 4.904, countryCode: 'NL' } },
    { takenAt: '2027-07-01T09:05:00Z', userId: A, location: { lat: 52.369, lng: 4.905, countryCode: 'NL' } },
    { takenAt: '2027-07-02T12:00:00Z', userId: B, location: { lat: 50.85, lng: 4.35, countryCode: 'BE' } },
    { takenAt: '2027-07-03T12:00:00Z', userId: B, location: { lat: 48.857, lng: 2.352, countryCode: 'FR' } },
    { takenAt: '2027-07-03T13:00:00Z', userId: B }, // no location: counts for photos, not for the map
  ];
  const s = computeTripStats(photos, { members: 2, mapEnabled: true });
  assert.equal(s.located, 4);
  assert.deepEqual(s.countries, ['BE', 'FR', 'NL']);
  assert.equal(s.places, 3);
  assert.ok(s.distanceKm > 400 && s.distanceKm < 480, String(s.distanceKm));
  assert.equal(s.photos, 5);
});

test('offline country lookup (Natural Earth 110m)', () => {
  assert.equal(countryAt(shapes, 52.37, 4.9), 'NL'); // Amsterdam
  assert.equal(countryAt(shapes, 51.746, 4.168), 'NL'); // Middelharnis
  assert.equal(countryAt(shapes, 48.857, 2.352), 'FR'); // Paris
  assert.equal(countryAt(shapes, 41.39, 2.17), 'ES'); // Barcelona, on the coast
  assert.equal(countryAt(shapes, 40.71, -74.0), 'US'); // New York
  assert.equal(countryAt(shapes, 35.68, 139.69), 'JP'); // Tokyo
  assert.equal(countryAt(shapes, -33.86, 151.21), 'AU'); // Sydney harbour
  assert.equal(countryAt(shapes, 45.44, 12.33), 'IT'); // Venice lagoon
  assert.equal(countryAt(shapes, 30, -40), null); // mid Atlantic
  // Lesotho is a hole in South Africa.
  assert.equal(countryAt(shapes, -29.5, 28.2), 'LS');
  assert.equal(countryAt(shapes, -26.2, 28.04), 'ZA');
});
