// Run with `npm test` (node --experimental-strip-types --test).
// "Alle foto's" (GET /api/mobile/me/photos): query validation, cursor, filter, paging.
import { test } from 'node:test';
import assert from 'node:assert/strict';
import {
  buildMyPhotosFilter,
  decodeCursor,
  encodeCursor,
  MY_PHOTOS_DEFAULT_LIMIT,
  MY_PHOTOS_SORT,
  pageOf,
  parseMyPhotosQuery,
  withGroupName,
} from '../src/lib/my-photos.ts';

const ID = 'aaaaaaaaaaaaaaaaaaaaaaaa';
const oid = (s) => ({ oid: s });
const q = (s) => parseMyPhotosQuery(new URLSearchParams(s));

test('query: defaults, limits and cursor validation', () => {
  assert.deepEqual(q(''), { limit: MY_PHOTOS_DEFAULT_LIMIT });
  assert.deepEqual(q('cursor=&limit='), { limit: MY_PHOTOS_DEFAULT_LIMIT });
  assert.equal(q('limit=30').limit, 30);
  assert.throws(() => q('limit=0'));
  assert.throws(() => q('limit=500'));
  assert.throws(() => q('limit=abc'));
  assert.throws(() => q('cursor=garbage'));
  assert.throws(() => q(`cursor=notadate_${ID}`));
  assert.throws(() => q('cursor=2027-07-01T12:00:00.000Z_xyz'));
  const c = encodeCursor(new Date('2027-07-01T12:00:00Z'), ID);
  assert.equal(q(`cursor=${encodeURIComponent(c)}`).cursor, c);
});

test('cursor round-trips takenAt and id', () => {
  const c = encodeCursor('2027-07-01T12:00:00.000Z', ID);
  assert.equal(c, `2027-07-01T12:00:00.000Z_${ID}`);
  const d = decodeCursor(c);
  assert.equal(d.before.toISOString(), '2027-07-01T12:00:00.000Z');
  assert.equal(d.beforeId, ID);
  assert.equal(decodeCursor('_'), null);
});

test('filter: own ready photos in member groups, minus hidden, before the cursor', () => {
  const f = buildMyPhotosFilter({ userId: 'u1', groupIds: ['g1', 'g2'], hiddenIds: ['h1'] }, oid);
  assert.deepEqual(f, {
    $and: [{ userId: 'u1', status: 'ready', groupId: { $in: ['g1', 'g2'] } }, { _id: { $nin: ['h1'] } }],
  });
  const at = new Date('2027-07-01T12:00:00Z');
  const paged = buildMyPhotosFilter({ userId: 'u1', groupIds: ['g1'], cursor: encodeCursor(at, ID) }, oid);
  assert.equal(paged.$and.length, 2); // no hidden clause when nothing is hidden
  assert.deepEqual(paged.$and[1], { $or: [{ takenAt: { $lt: at } }, { takenAt: at, _id: { $lt: { oid: ID } } }] });
  assert.deepEqual(MY_PHOTOS_SORT, { takenAt: -1, _id: -1 });
});

test('paging: next cursor only when there is one more row', () => {
  const rows = [3, 2, 1].map((n) => ({ _id: `${n}`.repeat(24), takenAt: new Date(Date.UTC(2027, 6, n)) }));
  const full = pageOf(rows, 2);
  assert.equal(full.page.length, 2);
  assert.equal(full.nextCursor, encodeCursor(rows[1].takenAt, rows[1]._id));
  const last = pageOf(rows, 3);
  assert.equal(last.page.length, 3);
  assert.equal(last.nextCursor, null);
  assert.deepEqual(pageOf([], 60), { page: [], nextCursor: null });
});

test('serialized photo gets its group name', () => {
  const names = new Map([['g1', 'Mallorca']]);
  assert.deepEqual(withGroupName({ id: 'p1', groupId: 'g1', thumbUrl: 'https://t' }, names), {
    id: 'p1',
    groupId: 'g1',
    thumbUrl: 'https://t',
    groupName: 'Mallorca',
    groupPersonal: false,
  });
  assert.equal(withGroupName({ id: 'p2', groupId: 'gone' }, names).groupName, '');
});

test('photos in the personal roll are marked groupPersonal', () => {
  const names = new Map([['g1', 'Mallorca'], ['roll', 'Mijn rolletje']]);
  const personal = new Set(['roll']);
  assert.equal(withGroupName({ id: 'p1', groupId: 'roll' }, names, personal).groupPersonal, true);
  assert.equal(withGroupName({ id: 'p2', groupId: 'g1' }, names, personal).groupPersonal, false);
});

test('Alle foto\'s filter includes the personal roll like any other group the user is in', () => {
  const f = buildMyPhotosFilter({ userId: 'u', groupIds: ['g1', 'roll'] }, oid);
  assert.deepEqual(f.$and[0].groupId, { $in: ['g1', 'roll'] });
});
