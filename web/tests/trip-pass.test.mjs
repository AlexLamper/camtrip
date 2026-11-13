// Run with `npm test` (node --experimental-strip-types --test).
import { test } from 'node:test';
import assert from 'node:assert/strict';
import {
  decideApply,
  findTripPassTransaction,
  PENDING_GROUP_ATTRIBUTE,
  TRIP_PASS_PRODUCT_ID,
  tripPassWebhookAction,
} from '../src/lib/trip-pass.ts';

const GROUP = 'aaaaaaaaaaaaaaaaaaaaaaaa';
const OTHER = 'bbbbbbbbbbbbbbbbbbbbbbbb';
const USER = 'cccccccccccccccccccccccc';

const subscriber = {
  subscriber: {
    non_subscriptions: {
      camtrip_trip_pass: [
        { id: 'rc_1', store_transaction_id: '2000000111', purchase_date: '2026-11-10T10:00:00Z', store: 'app_store', is_sandbox: true },
        { id: 'rc_2', store_transaction_id: '2000000222', purchase_date: '2026-11-12T10:00:00Z', store: 'app_store' },
      ],
      something_else: [{ id: 'rc_x', store_transaction_id: '999' }],
    },
  },
};

test('product id and attribute key (no $: RevenueCat reserves it)', () => {
  assert.equal(TRIP_PASS_PRODUCT_ID, 'camtrip_trip_pass');
  assert.equal(PENDING_GROUP_ATTRIBUTE.startsWith('$'), false);
});

test('verification: finds the transaction by store id or RevenueCat id', () => {
  const a = findTripPassTransaction(subscriber, '2000000222');
  assert.equal(a.transactionId, '2000000222');
  assert.equal(a.rcId, 'rc_2');
  assert.equal(a.purchasedAt.toISOString(), '2026-11-12T10:00:00.000Z');
  assert.equal(a.sandbox, false);
  const b = findTripPassTransaction(subscriber, 'rc_1');
  assert.equal(b.transactionId, '2000000111'); // always keyed on the store id
  assert.equal(b.sandbox, true);
});

test('verification: unknown, other product, empty or missing data -> null', () => {
  assert.equal(findTripPassTransaction(subscriber, '123'), null);
  assert.equal(findTripPassTransaction(subscriber, '999'), null); // other product
  assert.equal(findTripPassTransaction(subscriber, ''), null);
  assert.equal(findTripPassTransaction({}, '2000000222'), null);
  assert.equal(findTripPassTransaction(null, '2000000222'), null);
});

const freeGroup = { _id: GROUP, type: 'vacation', tripPass: null };

test('apply: a new transaction on a group without a pass is created', () => {
  assert.deepEqual(decideApply({ existing: null, group: freeGroup, userId: USER }), { action: 'create' });
});

test('apply is idempotent: same transaction, same group = success without a second record', () => {
  const existing = { transactionId: 't', groupId: GROUP, userId: USER, status: 'active' };
  const withPass = { ...freeGroup, tripPass: { transactionId: 't' } };
  assert.deepEqual(decideApply({ existing, group: withPass, userId: USER }), { action: 'already_applied' });
  // the webhook recorded it but the group update had not landed yet
  assert.deepEqual(decideApply({ existing, group: freeGroup, userId: USER }), { action: 'already_applied' });
});

test('apply: a transaction can only ever be used for one group', () => {
  const existing = { transactionId: 't', groupId: OTHER, userId: USER, status: 'active' };
  const d = decideApply({ existing, group: freeGroup, userId: USER });
  assert.equal(d.action, 'refuse');
  assert.equal(d.code, 'trip_pass_used');
  assert.equal(d.status, 409);
});

test('apply: a refunded transaction never unlocks again', () => {
  const existing = { transactionId: 't', groupId: GROUP, userId: USER, status: 'refunded' };
  assert.equal(decideApply({ existing, group: freeGroup, userId: USER }).code, 'trip_pass_refunded');
});

test('apply: one pass per group, and none for a personal roll', () => {
  const withPass = { ...freeGroup, tripPass: { transactionId: 'other' } };
  assert.equal(decideApply({ existing: null, group: withPass, userId: USER }).code, 'trip_pass_exists');
  assert.equal(decideApply({ existing: null, group: { _id: GROUP, type: 'personal' }, userId: USER }).code, 'personal_roll');
});

const purchaseEvent = {
  id: 'evt1',
  type: 'NON_RENEWING_PURCHASE',
  app_user_id: USER,
  product_id: 'camtrip_trip_pass',
  transaction_id: '2000000222',
  purchased_at_ms: Date.parse('2026-11-12T10:00:00Z'),
  subscriber_attributes: { [PENDING_GROUP_ATTRIBUTE]: { value: GROUP, updated_at_ms: 1 } },
};

test('webhook: NON_RENEWING_PURCHASE applies to the pending group from the attribute', () => {
  const a = tripPassWebhookAction(purchaseEvent);
  assert.equal(a.kind, 'purchase');
  assert.equal(a.transactionId, '2000000222');
  assert.equal(a.groupId, GROUP);
  assert.equal(a.appUserId, USER);
  assert.equal(a.purchasedAt.toISOString(), '2026-11-12T10:00:00.000Z');
});

test('webhook: purchase without (or with a bad) pending group still parses, group null', () => {
  assert.equal(tripPassWebhookAction({ ...purchaseEvent, subscriber_attributes: {} }).groupId, null);
  const bad = { ...purchaseEvent, subscriber_attributes: { [PENDING_GROUP_ATTRIBUTE]: { value: '{$ne:1}' } } };
  assert.equal(tripPassWebhookAction(bad).groupId, null);
});

test('webhook: refunds remove, reversals restore', () => {
  assert.deepEqual(tripPassWebhookAction({ ...purchaseEvent, type: 'CANCELLATION', cancel_reason: 'CUSTOMER_SUPPORT' }), {
    kind: 'refund',
    transactionId: '2000000222',
  });
  assert.equal(tripPassWebhookAction({ ...purchaseEvent, type: 'REFUND' }).kind, 'refund');
  assert.equal(tripPassWebhookAction({ ...purchaseEvent, type: 'REFUND_REVERSED' }).kind, 'refund_reversed');
});

test('webhook: subscription events and other products are not about Trip Passes', () => {
  assert.equal(tripPassWebhookAction({ ...purchaseEvent, product_id: 'camtrip_pro_yearly' }), null);
  assert.equal(tripPassWebhookAction({ ...purchaseEvent, type: 'RENEWAL' }), null);
  assert.equal(tripPassWebhookAction({ ...purchaseEvent, transaction_id: null, original_transaction_id: null }), null);
  assert.equal(tripPassWebhookAction(null), null);
});
