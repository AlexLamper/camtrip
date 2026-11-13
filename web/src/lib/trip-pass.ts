// Trip Pass: a one-time purchase that makes ONE group Pro, for everyone in it,
// for good (kept forever, unlimited shots, all cameras, no watermark, no
// member limit). Pure rules, no runtime imports, so this file runs as-is under
// `node --experimental-strip-types` for the tests; lib/trip-pass-db.ts wires
// them to Mongo and RevenueCat.
//
// Flow:
//   1. The app sets the RevenueCat subscriber attribute
//      PENDING_GROUP_ATTRIBUTE = <groupId> and buys the consumable product
//      TRIP_PASS_PRODUCT_ID.
//   2. The app calls POST /api/mobile/groups/:id/trip-pass {transactionId}.
//      The server looks the transaction up in RevenueCat (GET
//      /v1/subscribers/:app_user_id, non_subscriptions[product]) and records
//      it once (TripPassPurchase.transactionId is unique).
//   3. Safety net: the NON_RENEWING_PURCHASE webhook applies the pass to the
//      group in the attribute, so a crash right after paying loses nothing.
//      Both paths are idempotent.
//   4. A refund (CANCELLATION / REFUND webhook for the product) removes the
//      pass again; the refunded transaction can never be applied again.

export const TRIP_PASS_PRODUCT_ID = 'camtrip_trip_pass';

/**
 * Subscriber attribute the app sets right before buying. Custom attribute keys
 * must not start with '$' (RevenueCat reserves those), hence no '$' prefix.
 */
export const PENDING_GROUP_ATTRIBUTE = 'camtrip_pending_trip_pass_group';

/** One entry of RevenueCat's subscriber.non_subscriptions[productId]. */
export interface RcNonSubscription {
  id?: string;
  store_transaction_id?: string | null;
  purchase_date?: string | null;
  original_purchase_date?: string | null;
  store?: string | null;
  is_sandbox?: boolean | null;
}

export interface RcSubscriberResponse {
  subscriber?: {
    non_subscriptions?: Record<string, RcNonSubscription[] | undefined>;
  };
}

export interface VerifiedTransaction {
  /** The store's transaction id (App Store / Google Play order id): our unique key. */
  transactionId: string;
  /** RevenueCat's own id for the purchase. */
  rcId: string | null;
  purchasedAt: Date;
  store: string | null;
  sandbox: boolean;
}

/**
 * Finds [transactionId] among the subscriber's Trip Pass purchases. The app
 * may send the store transaction id or RevenueCat's id; both match. Returns
 * null when this account never bought it.
 */
export function findTripPassTransaction(
  data: RcSubscriberResponse | null | undefined,
  transactionId: string,
  productId: string = TRIP_PASS_PRODUCT_ID,
): VerifiedTransaction | null {
  const wanted = transactionId.trim();
  if (!wanted) return null;
  const list = data?.subscriber?.non_subscriptions?.[productId] ?? [];
  const hit = list.find((t) => t.store_transaction_id === wanted || t.id === wanted);
  if (!hit) return null;
  const when = new Date(hit.purchase_date ?? hit.original_purchase_date ?? Date.now());
  return {
    transactionId: hit.store_transaction_id || hit.id || wanted,
    rcId: hit.id ?? null,
    purchasedAt: Number.isNaN(when.getTime()) ? new Date() : when,
    store: hit.store ?? null,
    sandbox: Boolean(hit.is_sandbox),
  };
}

export interface TripPassRecord {
  transactionId: string;
  groupId: unknown;
  userId: unknown;
  status: 'active' | 'refunded';
}

export type ApplyDecision =
  | { action: 'create' }
  | { action: 'already_applied' }
  | { action: 'refuse'; status: 400 | 409; code: string; message: string };

/**
 * May [transactionId] be applied to [group] by [userId]?
 * - an unknown transaction on a group without a pass: create
 * - the same transaction on the same group again (retry, or the webhook got
 *   there first): already_applied, which is a success
 * - a transaction used for another group, or refunded: refused
 * - a group that already has another pass: refused (one pass per group)
 */
export function decideApply(opts: {
  existing: TripPassRecord | null;
  group: { _id: unknown; type?: string | null; tripPass?: { transactionId?: string | null } | null };
  userId: unknown;
}): ApplyDecision {
  const { existing, group } = opts;
  if (group.type === 'personal') {
    return { action: 'refuse', status: 400, code: 'personal_roll', message: 'Een Trip Pass is voor een reis met vrienden, niet voor je eigen rolletje' };
  }
  if (existing) {
    if (existing.status === 'refunded') {
      return { action: 'refuse', status: 409, code: 'trip_pass_refunded', message: 'Deze aankoop is terugbetaald' };
    }
    if (String(existing.groupId) === String(group._id)) return { action: 'already_applied' };
    return { action: 'refuse', status: 409, code: 'trip_pass_used', message: 'Deze Trip Pass is al voor een andere reis gebruikt' };
  }
  if (group.tripPass?.transactionId) {
    return { action: 'refuse', status: 409, code: 'trip_pass_exists', message: 'Deze reis heeft al een Trip Pass' };
  }
  return { action: 'create' };
}

// ---------------------------------------------------------------- webhook

export interface RcWebhookEvent {
  id?: string;
  type?: string;
  app_user_id?: string;
  original_app_user_id?: string;
  product_id?: string;
  transaction_id?: string | null;
  original_transaction_id?: string | null;
  purchased_at_ms?: number | null;
  cancel_reason?: string | null;
  subscriber_attributes?: Record<string, { value?: string | null } | undefined>;
  transferred_to?: string[];
}

export type TripPassWebhookAction =
  | { kind: 'purchase'; transactionId: string; appUserId: string; groupId: string | null; purchasedAt: Date }
  | { kind: 'refund'; transactionId: string }
  | { kind: 'refund_reversed'; transactionId: string };

/** What a RevenueCat webhook event means for Trip Passes, or null when nothing. */
export function tripPassWebhookAction(
  event: RcWebhookEvent | null | undefined,
  productId: string = TRIP_PASS_PRODUCT_ID,
): TripPassWebhookAction | null {
  if (!event || event.product_id !== productId) return null;
  const transactionId = (event.transaction_id || event.original_transaction_id || '').trim();
  if (!transactionId) return null;
  switch (event.type) {
    case 'NON_RENEWING_PURCHASE': {
      const appUserId = event.app_user_id ?? '';
      const raw = event.subscriber_attributes?.[PENDING_GROUP_ATTRIBUTE]?.value ?? null;
      const groupId = raw && /^[a-f0-9]{24}$/i.test(raw) ? raw : null;
      const at = event.purchased_at_ms ? new Date(event.purchased_at_ms) : new Date();
      return { kind: 'purchase', transactionId, appUserId, groupId, purchasedAt: at };
    }
    // For a non-renewing purchase RevenueCat sends CANCELLATION when the store
    // refunded it (cancel_reason CUSTOMER_SUPPORT); there is nothing else to cancel.
    case 'CANCELLATION':
    case 'REFUND':
      return { kind: 'refund', transactionId };
    case 'REFUND_REVERSED':
      return { kind: 'refund_reversed', transactionId };
    default:
      return null;
  }
}
