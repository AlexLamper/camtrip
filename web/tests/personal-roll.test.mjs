// Run with `npm test` (node --experimental-strip-types --test).
// "Mijn rolletje": the personal roll for loose photos (pure rules; routes wire them to Mongo).
import { test } from 'node:test';
import assert from 'node:assert/strict';
import {
  checkMove,
  isPersonalRoll,
  isProStyle,
  joinable,
  newPersonalRoll,
  NOT_PERSONAL,
  PERSONAL_ROLL_ALIAS,
  personalPatchAllowed,
  personalRollCode,
} from '../src/lib/personal-roll.ts';

const FREE = ['flash', 'film', 'instant', 'disposable'];
const ME = 'aaaaaaaaaaaaaaaaaaaaaaaa';
const OTHER = 'bbbbbbbbbbbbbbbbbbbbbbbb';
const ROLL = 'cccccccccccccccccccccccc';
const TRIP = 'dddddddddddddddddddddddd';

// Same normalization as lib/groups.ts normalizeCode (that file imports mongoose).
const normalizeCode = (c) => c.trim().toUpperCase().replace(/[^A-Z0-9]/g, '');

// A tiny in-memory stand-in for Group.findOne/create with the unique
// (ownerId, type: 'personal') index, to check that lazy creation is idempotent.
function fakeStore() {
  const rows = [];
  return {
    rows,
    findOne: (ownerId) => rows.find((r) => r.ownerId === ownerId && r.type === 'personal') ?? null,
    create(doc) {
      if (doc.type === 'personal' && rows.some((r) => r.ownerId === doc.ownerId && r.type === 'personal')) {
        const e = new Error('E11000 duplicate key');
        e.code = 11000;
        throw e;
      }
      const row = { _id: `g${rows.length}`, ...doc };
      rows.push(row);
      return row;
    },
  };
}
// Mirrors lib/groups.ts ensurePersonalRoll.
function ensure(store, userId, { raceFirstRead = false } = {}) {
  const existing = raceFirstRead ? null : store.findOne(userId);
  if (existing) return existing;
  try {
    return store.create(newPersonalRoll(userId, 'flash'));
  } catch (e) {
    if (e.code !== 11000) throw e;
    return store.findOne(userId);
  }
}

test('a new personal roll: owner only, admin, never auto-deleted, not joinable', () => {
  const roll = newPersonalRoll(ME, 'flash');
  assert.equal(roll.type, 'personal');
  assert.equal(roll.ownerId, ME);
  assert.deepEqual(roll.members, [{ userId: ME, role: 'admin' }]);
  assert.equal(roll.deleteAfter, null);
  assert.equal(roll.endDate, null);
  assert.equal(roll.status, 'active');
  assert.equal(isPersonalRoll(roll), true);
  assert.equal(joinable(roll), false);
});

test('personal roll creation is idempotent, also when two requests race', () => {
  const store = fakeStore();
  const a = ensure(store, ME);
  const b = ensure(store, ME);
  assert.equal(a, b);
  // Second request did not see the first one yet: duplicate key -> reads the existing roll.
  const c = ensure(store, ME, { raceFirstRead: true });
  assert.equal(c, a);
  assert.equal(store.rows.length, 1);
  // Another user gets their own roll.
  const d = ensure(store, OTHER);
  assert.notEqual(d, a);
  assert.equal(store.rows.length, 2);
});

test('a personal roll cannot be joined: its code never survives normalization, and joinable() says no', () => {
  const code = personalRollCode(ME);
  assert.notEqual(normalizeCode(code), code);
  assert.ok(code.includes('-'));
  // Whatever someone types, the normalized code can never equal the stored one.
  for (const typed of [code, code.toUpperCase(), ` ${code} `, code.replace('-', '')]) {
    assert.notEqual(normalizeCode(typed), code);
  }
  assert.equal(joinable({ type: 'personal' }), false);
  assert.equal(joinable({ type: 'vacation' }), true);
  assert.equal(joinable(null), false);
  assert.equal(PERSONAL_ROLL_ALIAS, 'me');
  assert.deepEqual(NOT_PERSONAL, { type: { $ne: 'personal' } });
});

test('personal roll accepts only style and cover changes', () => {
  assert.equal(personalPatchAllowed({ defaultStyle: 'film' }), true);
  assert.equal(personalPatchAllowed({ coverPhotoId: ROLL, name: undefined }), true);
  assert.equal(personalPatchAllowed({ name: 'Vakantie' }), false);
  assert.equal(personalPatchAllowed({ endNow: true }), false);
  assert.equal(personalPatchAllowed({ status: 'archived' }), false);
});

test('isProStyle: free styles and camera-roll picks need no Pro', () => {
  assert.equal(isProStyle('flash', FREE), false);
  assert.equal(isProStyle('roll', FREE), false);
  assert.equal(isProStyle('golden', FREE), true);
});

// ------------------------------------------------------------ move endpoint
const photo = (over = {}) => ({ _id: 'p1', userId: ME, groupId: ROLL, status: 'ready', style: 'flash', ...over });
const base = (over = {}) => ({
  userId: ME,
  roll: { _id: ROLL },
  target: { _id: TRIP, type: 'vacation', status: 'active', isMember: true },
  photos: [photo()],
  requested: 1,
  userIsPro: false,
  targetIsPro: false,
  freeStyles: FREE,
  ...over,
});

test('move: own ready photos from the roll into a group the user is in', () => {
  assert.equal(checkMove(base()), null);
  assert.equal(checkMove(base({ photos: [photo(), photo({ _id: 'p2', style: 'roll' })], requested: 2 })), null);
});

test('move: target must be a group the user is a member of', () => {
  assert.equal(checkMove(base({ target: null }))?.status, 404);
  assert.equal(checkMove(base({ target: { _id: TRIP, type: 'event', status: 'active', isMember: false } }))?.status, 404);
});

test('move: not into a closed group, not into a personal roll, not onto itself', () => {
  assert.equal(checkMove(base({ target: { _id: TRIP, type: 'event', status: 'archived', isMember: true } }))?.code, 'archived');
  assert.equal(checkMove(base({ target: { _id: 'x', type: 'personal', status: 'active', isMember: true } }))?.code, 'target_personal');
  assert.equal(checkMove(base({ target: { _id: ROLL, type: 'vacation', status: 'active', isMember: true } }))?.code, 'same_group');
});

test('move: only own photos, only from the personal roll, only finished ones', () => {
  assert.equal(checkMove(base({ photos: [photo({ userId: OTHER })] }))?.status, 404);
  assert.equal(checkMove(base({ photos: [photo({ groupId: TRIP })] }))?.status, 404);
  assert.equal(checkMove(base({ photos: [photo({ status: 'pending' })] }))?.status, 404);
  // An id that does not exist (asked for 2, found 1).
  assert.equal(checkMove(base({ requested: 2 }))?.status, 404);
  assert.equal(checkMove(base({ roll: null }))?.status, 404);
  assert.equal(checkMove(base({ requested: 0, photos: [] }))?.code, 'no_photos');
});

test('move: Pro styles follow the target group: own Pro or group Pro', () => {
  const pro = [photo({ style: 'golden' })];
  assert.equal(checkMove(base({ photos: pro }))?.status, 402);
  assert.equal(checkMove(base({ photos: pro }))?.code, 'pro_required');
  assert.equal(checkMove(base({ photos: pro, userIsPro: true })), null);
  assert.equal(checkMove(base({ photos: pro, targetIsPro: true })), null);
});
