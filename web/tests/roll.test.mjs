// Run with `npm test` (node --experimental-strip-types --test).
import { test } from 'node:test';
import assert from 'node:assert/strict';
import {
  checkRoll,
  FREE_ROLL_LIMIT,
  monthStart,
  nextMonthStart,
  PENDING_GRACE_MS,
  rollCountFilter,
  rollExempt,
  rollForViewer,
} from '../src/lib/roll.ts';

const NOW = new Date('2026-11-13T15:30:00Z');

test('the free roll is 24 shots', () => {
  assert.equal(FREE_ROLL_LIMIT, 24);
});

test('checkRoll: shots 1..24 fit, the 25th is a 402 roll_full with limit and used', () => {
  assert.equal(checkRoll({ used: 0, exempt: false }), null);
  assert.equal(checkRoll({ used: 23, exempt: false }), null);
  const err = checkRoll({ used: 24, exempt: false });
  assert.equal(err.status, 402);
  assert.equal(err.code, 'roll_full');
  assert.equal(err.limit, 24);
  assert.equal(err.used, 24);
  // more than the limit (e.g. after a race) still refuses, and reports the real count
  assert.equal(checkRoll({ used: 30, exempt: false }).used, 30);
});

test('checkRoll: moving several shots in at once must all fit', () => {
  assert.equal(checkRoll({ used: 20, adding: 4, exempt: false }), null);
  assert.equal(checkRoll({ used: 20, adding: 5, exempt: false }).code, 'roll_full');
});

test('exemptions: own Pro, a Pro group (member or Trip Pass) -> no limit', () => {
  assert.equal(rollExempt({ userIsPro: true, groupIsPro: false }), true);
  assert.equal(rollExempt({ userIsPro: false, groupIsPro: true }), true);
  assert.equal(rollExempt({ userIsPro: false, groupIsPro: false }), false);
  assert.equal(checkRoll({ used: 500, exempt: true }), null);
  assert.equal(rollForViewer({ used: 500, exempt: true }), null);
  assert.deepEqual(rollForViewer({ used: 18, exempt: false }), { limit: 24, used: 18 });
});

test('counting: own photos in this group, ready or freshly pending, videos too', () => {
  const f = rollCountFilter({ _id: 'g1', type: 'vacation' }, 'u1', NOW);
  assert.equal(f.groupId, 'g1');
  assert.equal(f.userId, 'u1');
  // no kind filter: a video is one shot like a photo
  assert.equal('kind' in f, false);
  assert.deepEqual(f.$or[0], { status: 'ready' });
  assert.equal(f.$or[1].status, 'pending');
  assert.equal(f.$or[1].createdAt.$gte.getTime(), NOW.getTime() - PENDING_GRACE_MS);
  // a trip counts the whole trip, no time window
  assert.equal('createdAt' in f, false);
});

test('counting: the personal roll starts again every calendar month (UTC)', () => {
  const f = rollCountFilter({ _id: 'r1', type: 'personal' }, 'u1', NOW);
  assert.equal(f.createdAt.$gte.toISOString(), '2026-11-01T00:00:00.000Z');
  assert.equal(monthStart(new Date('2026-12-31T23:59:59Z')).toISOString(), '2026-12-01T00:00:00.000Z');
  assert.equal(nextMonthStart(new Date('2026-12-31T23:59:59Z')).toISOString(), '2027-01-01T00:00:00.000Z');
});

/** A tiny in-memory stand-in for Photo.countDocuments(rollCountFilter(...)). */
function count(photos, filter) {
  return photos.filter((p) => {
    if (p.groupId !== filter.groupId || p.userId !== filter.userId) return false;
    if (filter.createdAt && p.createdAt < filter.createdAt.$gte) return false;
    return filter.$or.some((o) => p.status === o.status && (!o.createdAt || p.createdAt >= o.createdAt.$gte));
  }).length;
}

test('counting end to end: others, other groups, stale reservations and deleted photos do not count', () => {
  const recent = new Date(NOW.getTime() - 60_000);
  const old = new Date(NOW.getTime() - PENDING_GRACE_MS - 1);
  const photos = [
    ...Array.from({ length: 20 }, () => ({ groupId: 'g1', userId: 'u1', status: 'ready', createdAt: old })),
    { groupId: 'g1', userId: 'u1', status: 'pending', createdAt: recent }, // counts
    { groupId: 'g1', userId: 'u1', status: 'pending', createdAt: old }, // abandoned: no
    { groupId: 'g1', userId: 'u2', status: 'ready', createdAt: recent }, // someone else: no
    { groupId: 'g2', userId: 'u1', status: 'ready', createdAt: recent }, // other trip: no
  ];
  const used = count(photos, rollCountFilter({ _id: 'g1', type: 'event' }, 'u1', NOW));
  assert.equal(used, 21);
  assert.equal(checkRoll({ used, exempt: false }), null);
  // three more fill the roll, the next is refused
  const full = used + 3;
  assert.equal(checkRoll({ used: full, exempt: false }).code, 'roll_full');
  // deleting one (the row is gone) frees a shot again
  assert.equal(checkRoll({ used: full - 1, exempt: false }), null);
});
