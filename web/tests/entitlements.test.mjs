// Run with `npm test` (node --experimental-strip-types --test).
import { test } from 'node:test';
import assert from 'node:assert/strict';
import {
  grantActive,
  grantUntil,
  groupPro,
  groupProSource,
  tripPassActive,
  hasPro,
  isBootstrapAdmin,
  parseAdminEmails,
  proInGroup,
  subscriptionActive,
  userPro,
} from '../src/lib/entitlements.ts';

const NOW = new Date('2026-11-12T12:00:00Z');
const day = 86_400_000;
const past = new Date(NOW.getTime() - day);
const future = new Date(NOW.getTime() + 30 * day);
const farFuture = new Date(NOW.getTime() + 365 * day);

const free = { _id: 'u-free', name: 'Free', proStore: false, proExpiresAt: null };
const subscriber = { _id: 'u-sub', name: 'Sanne', proStore: true, proExpiresAt: future };
const lapsedSub = { _id: 'u-lapsed', name: 'Lapsed', proStore: true, proExpiresAt: past };
const gifted = { _id: 'u-gift', name: 'Gift', proGrant: { until: farFuture } };
const lifetime = { _id: 'u-life', name: 'Life', proGrant: { until: null } };
const expiredGift = { _id: 'u-oldgift', name: 'Old', proGrant: { until: past } };
const admin = { _id: 'u-admin', name: 'Alex', role: 'admin' };

test('no Pro for a free or missing user', () => {
  assert.deepEqual(userPro(free, NOW), { isPro: false, reason: null, until: null });
  assert.deepEqual(userPro(null, NOW), { isPro: false, reason: null, until: null });
  assert.deepEqual(userPro(undefined, NOW), { isPro: false, reason: null, until: null });
});

test('subscription: active until it expires', () => {
  assert.equal(subscriptionActive(subscriber, NOW), true);
  assert.equal(subscriptionActive(lapsedSub, NOW), false);
  assert.deepEqual(userPro(subscriber, NOW), { isPro: true, reason: 'subscription', until: future });
  assert.equal(hasPro(lapsedSub, NOW), false);
  // Non-expiring store entitlement.
  assert.deepEqual(userPro({ proStore: true, proExpiresAt: null }, NOW), { isPro: true, reason: 'subscription', until: null });
  // ISO strings (from JSON) work too.
  assert.equal(hasPro({ proStore: true, proExpiresAt: future.toISOString() }, NOW), true);
});

test('gift: valid until its date, lifetime without one', () => {
  assert.equal(grantActive(gifted, NOW), true);
  assert.equal(grantActive(expiredGift, NOW), false);
  assert.equal(grantActive({ proGrant: null }, NOW), false);
  assert.deepEqual(userPro(gifted, NOW), { isPro: true, reason: 'gift', until: farFuture });
  assert.deepEqual(userPro(lifetime, NOW), { isPro: true, reason: 'gift', until: null });
  assert.equal(hasPro(expiredGift, NOW), false);
});

test('gift expiry is exact', () => {
  const g = { proGrant: { until: NOW } };
  assert.equal(hasPro(g, new Date(NOW.getTime() - 1)), true);
  assert.equal(hasPro(g, NOW), false);
});

test('admins always have Pro, without an end', () => {
  assert.deepEqual(userPro(admin, NOW), { isPro: true, reason: 'admin', until: null });
  assert.equal(userPro({ ...subscriber, role: 'admin' }, NOW).reason, 'admin');
  assert.equal(hasPro({ role: 'user' }, NOW), false);
});

test('reason order and the furthest end date across sources', () => {
  const both = { proStore: true, proExpiresAt: future, proGrant: { until: farFuture } };
  assert.deepEqual(userPro(both, NOW), { isPro: true, reason: 'subscription', until: farFuture });
  const subLifetimeGift = { proStore: true, proExpiresAt: future, proGrant: { until: null } };
  assert.deepEqual(userPro(subLifetimeGift, NOW), { isPro: true, reason: 'subscription', until: null });
  const lapsedButGift = { proStore: true, proExpiresAt: past, proGrant: { until: future } };
  assert.deepEqual(userPro(lapsedButGift, NOW), { isPro: true, reason: 'gift', until: future });
});

test('banned accounts never have Pro', () => {
  assert.equal(hasPro({ ...subscriber, banned: true }, NOW), false);
  assert.equal(hasPro({ ...admin, banned: true }, NOW), false);
  assert.equal(hasPro({ ...lifetime, banned: true }, NOW), false);
});

test('groupPro: nobody Pro -> free group', () => {
  assert.deepEqual(groupPro([free, lapsedSub, expiredGift], { now: NOW }), { isPro: false, proBy: null, tripPass: false });
  assert.deepEqual(groupPro([], { now: NOW }), { isPro: false, proBy: null, tripPass: false });
});

test('groupPro: one Pro member makes the group Pro (any source)', () => {
  for (const p of [subscriber, gifted, lifetime, admin]) {
    const g = groupPro([free, p, lapsedSub], { now: NOW });
    assert.equal(g.isPro, true, p.name);
    assert.equal(g.proBy.id, String(p._id));
    assert.equal(g.proBy.name, p.name);
  }
  assert.equal(groupPro([free, subscriber], { now: NOW }).proBy.reason, 'subscription');
  assert.equal(groupPro([free, gifted], { now: NOW }).proBy.reason, 'gift');
});

test('groupPro: a banned or lapsed member does not count', () => {
  assert.equal(groupPro([free, { ...subscriber, banned: true }], { now: NOW }).isPro, false);
  assert.equal(groupPro([free, lapsedSub], { now: NOW }).isPro, false);
  assert.equal(groupPro([free, gifted], { now: new Date(farFuture.getTime() + 1) }).isPro, false);
});

test('groupPro: credits the viewer, then the owner, then join order', () => {
  const members = [free, gifted, subscriber];
  assert.equal(groupPro(members, { now: NOW }).proBy.id, 'u-gift');
  assert.equal(groupPro(members, { now: NOW, ownerId: 'u-sub' }).proBy.id, 'u-sub');
  assert.equal(groupPro(members, { now: NOW, ownerId: 'u-sub', viewerId: 'u-gift' }).proBy.id, 'u-gift');
  // A viewer without Pro is not credited.
  assert.equal(groupPro(members, { now: NOW, viewerId: 'u-free' }).proBy.id, 'u-gift');
  // An owner without Pro is skipped.
  assert.equal(groupPro(members, { now: NOW, ownerId: 'u-free' }).proBy.id, 'u-gift');
});

test('proInGroup: own Pro wins, else the group', () => {
  const g = groupPro([free, subscriber], { now: NOW });
  assert.deepEqual(proInGroup(userPro(free, NOW), g), { isPro: true, source: 'group' });
  assert.deepEqual(proInGroup(userPro(gifted, NOW), g), { isPro: true, source: 'gift' });
  assert.deepEqual(proInGroup(userPro(free, NOW), groupPro([free], { now: NOW })), { isPro: false, source: null });
});

test('ADMIN_EMAILS parsing and verified-only bootstrap', () => {
  const list = parseAdminEmails(' Aplamper06@Gmail.com, other@x.nl ;;  , nope ');
  assert.deepEqual([...list].sort(), ['aplamper06@gmail.com', 'other@x.nl']);
  assert.equal(parseAdminEmails(undefined).size, 0);
  assert.equal(isBootstrapAdmin({ email: 'APLAMPER06@gmail.com', emailVerified: true }, list), true);
  assert.equal(isBootstrapAdmin({ email: 'aplamper06@gmail.com', emailVerified: false }, list), false);
  assert.equal(isBootstrapAdmin({ email: 'someone@gmail.com', emailVerified: true }, list), false);
  assert.equal(isBootstrapAdmin({ email: '', emailVerified: true }, list), false);
  assert.equal(isBootstrapAdmin({ email: 'aplamper06@gmail.com', emailVerified: true }, new Set()), false);
});

test('grantUntil durations', () => {
  const start = new Date('2026-01-31T10:00:00Z');
  assert.equal(grantUntil('lifetime', start), null);
  assert.equal(grantUntil('year', start).toISOString(), '2027-01-31T10:00:00.000Z');
  assert.ok(grantUntil('month', start).getTime() > start.getTime() + 27 * day);
  const custom = new Date('2026-12-24T00:00:00Z');
  assert.equal(grantUntil('custom', NOW, custom), custom);
  assert.throws(() => grantUntil('custom', NOW, past), RangeError);
  assert.throws(() => grantUntil('custom', NOW, null), RangeError);
});

// ---------------------------------------------------------------- Trip Pass

const pass = { transactionId: 'tx-1', purchasedBy: 'u-free', purchasedAt: NOW };

test('tripPassActive: only with a transaction', () => {
  assert.equal(tripPassActive(pass), true);
  assert.equal(tripPassActive(null), false);
  assert.equal(tripPassActive(undefined), false);
  assert.equal(tripPassActive({ transactionId: '' }), false);
});

test('groupPro: a Trip Pass makes a group of free members Pro, for good', () => {
  const g = groupPro([free, lapsedSub], { now: NOW, tripPass: pass });
  assert.deepEqual(g, { isPro: true, proBy: null, tripPass: true });
  // years later, nobody subscribed: still Pro
  assert.equal(groupPro([free], { now: new Date('2040-01-01'), tripPass: pass }).isPro, true);
  // an empty group with a pass is still Pro
  assert.equal(groupPro([], { now: NOW, tripPass: pass }).isPro, true);
  // refunded = field removed
  assert.equal(groupPro([free], { now: NOW, tripPass: null }).isPro, false);
});

test('groupPro: Trip Pass plus a Pro member keeps crediting the member', () => {
  const g = groupPro([free, subscriber], { now: NOW, tripPass: pass });
  assert.equal(g.isPro, true);
  assert.equal(g.tripPass, true);
  assert.equal(g.proBy.id, 'u-sub');
});

test('groupProSource: self, then Trip Pass, then another member', () => {
  const both = groupPro([free, subscriber], { now: NOW, tripPass: pass });
  assert.equal(groupProSource(both, 'u-sub'), 'self');
  assert.equal(groupProSource(both, 'u-free'), 'tripPass');
  const memberOnly = groupPro([free, subscriber], { now: NOW });
  assert.equal(groupProSource(memberOnly, 'u-free'), 'group');
  assert.equal(groupProSource(memberOnly, 'u-sub'), 'self');
  const passOnly = groupPro([free], { now: NOW, tripPass: pass });
  assert.equal(groupProSource(passOnly, 'u-free'), 'tripPass');
  assert.equal(groupProSource(groupPro([free], { now: NOW }), 'u-free'), null);
});

test('proInGroup: a Trip Pass group gives source tripPass', () => {
  const g = groupPro([free], { now: NOW, tripPass: pass });
  assert.deepEqual(proInGroup(userPro(free, NOW), g), { isPro: true, source: 'tripPass' });
  assert.deepEqual(proInGroup(userPro(subscriber, NOW), g), { isPro: true, source: 'subscription' });
});
