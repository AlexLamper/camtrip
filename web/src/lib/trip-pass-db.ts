// Database + RevenueCat side of the Trip Pass (rules in ./trip-pass).
import { Types } from 'mongoose';
import { Group, TripPassPurchase, User, type GroupDoc, type TripPassPurchaseDoc } from './models';
import { HttpError } from './http';
import { memberRole, refuseForPersonalRoll } from './groups';
import { refreshGroupRetention } from './pro';
import {
  decideApply,
  findTripPassTransaction,
  TRIP_PASS_PRODUCT_ID,
  type RcSubscriberResponse,
  type TripPassWebhookAction,
  type VerifiedTransaction,
} from './trip-pass';

export const TRIP_PASS_PRODUCT = process.env.REVENUECAT_TRIP_PASS_PRODUCT_ID ?? TRIP_PASS_PRODUCT_ID;

/** RevenueCat's view of this account (GET /v1/subscribers/:id). */
async function fetchSubscriber(appUserId: string): Promise<RcSubscriberResponse> {
  const key = process.env.REVENUECAT_REST_API_KEY;
  if (!key) throw new Error('REVENUECAT_REST_API_KEY is not set');
  const res = await fetch(`https://api.revenuecat.com/v1/subscribers/${encodeURIComponent(appUserId)}`, {
    headers: { Authorization: `Bearer ${key}` },
    cache: 'no-store',
  });
  if (!res.ok) throw new Error(`RevenueCat ${res.status}: ${(await res.text()).slice(0, 300)}`);
  return (await res.json()) as RcSubscriberResponse;
}

/** Looks [transactionId] up among the account's Trip Pass purchases at RevenueCat. */
export async function verifyTripPassTransaction(appUserId: string, transactionId: string): Promise<VerifiedTransaction | null> {
  return findTripPassTransaction(await fetchSubscriber(appUserId), transactionId, TRIP_PASS_PRODUCT);
}

/**
 * Records a verified purchase for [group] and puts the pass on it. Idempotent:
 * the same transaction on the same group again is a success; any other reuse
 * is refused (TripPassPurchase.transactionId is unique, so two requests at
 * once cannot both apply it).
 */
export async function applyTripPass(opts: {
  group: GroupDoc;
  userId: Types.ObjectId;
  tx: VerifiedTransaction;
  via: 'app' | 'webhook';
}): Promise<'applied' | 'already_applied'> {
  const { group, userId, tx } = opts;
  // Mijn rolletje uses its owner's own Pro only: never a Trip Pass.
  refuseForPersonalRoll(group);
  const existing = await TripPassPurchase.findOne({ transactionId: tx.transactionId }).lean<TripPassPurchaseDoc>();
  const decision = decideApply({ existing, group, userId });
  if (decision.action === 'refuse') throw new HttpError(decision.status, decision.message, decision.code);
  if (decision.action === 'already_applied') {
    await putPassOnGroup(group._id, existing!);
    return 'already_applied';
  }
  let record: TripPassPurchaseDoc;
  try {
    record = (
      await TripPassPurchase.create({
        transactionId: tx.transactionId,
        rcId: tx.rcId,
        groupId: group._id,
        userId,
        store: tx.store,
        sandbox: tx.sandbox,
        appliedVia: opts.via,
        purchasedAt: tx.purchasedAt,
      })
    ).toObject() as TripPassPurchaseDoc;
  } catch (e) {
    if ((e as { code?: number }).code !== 11000) throw e;
    // The webhook (or a retry) got there a moment earlier: decide again.
    const again = await TripPassPurchase.findOne({ transactionId: tx.transactionId }).lean<TripPassPurchaseDoc>();
    const d = decideApply({ existing: again, group, userId });
    if (d.action === 'refuse') throw new HttpError(d.status, d.message, d.code);
    await putPassOnGroup(group._id, again!);
    return 'already_applied';
  }
  const ok = await putPassOnGroup(group._id, record);
  if (!ok) {
    // Another pass landed on the group between the check and now: keep the
    // transaction unused so support can move it, and say so.
    await TripPassPurchase.deleteOne({ _id: record._id });
    throw new HttpError(409, 'Deze reis heeft al een Trip Pass', 'trip_pass_exists');
  }
  return 'applied';
}

/** Sets Group.tripPass from [p] unless the group already has another pass. */
async function putPassOnGroup(groupId: Types.ObjectId, p: TripPassPurchaseDoc): Promise<boolean> {
  const res = await Group.updateOne(
    { _id: groupId, $or: [{ tripPass: null }, { 'tripPass.transactionId': p.transactionId }] },
    { $set: { tripPass: { transactionId: p.transactionId, purchasedBy: p.userId, purchasedAt: p.purchasedAt } } },
  );
  if (res.matchedCount === 0) return false;
  await refreshGroupRetention(groupId); // Pro for good: never auto-deleted
  return true;
}

/** Removes a refunded pass from its group; the transaction stays 'refunded' for ever. */
export async function refundTripPass(transactionId: string): Promise<boolean> {
  const p = await TripPassPurchase.findOneAndUpdate(
    { transactionId },
    { $set: { status: 'refunded', refundedAt: new Date() } },
    { new: true },
  ).lean<TripPassPurchaseDoc>();
  if (!p) return false;
  await Group.updateOne({ _id: p.groupId, 'tripPass.transactionId': transactionId }, { $set: { tripPass: null } });
  await refreshGroupRetention(p.groupId); // the free 30 days start again (unless a member has Pro)
  return true;
}

/** Applies what a RevenueCat webhook says about a Trip Pass. Safe to repeat. */
export async function handleTripPassWebhook(action: TripPassWebhookAction): Promise<string> {
  if (action.kind === 'refund') return (await refundTripPass(action.transactionId)) ? 'refunded' : 'unknown_transaction';
  if (action.kind === 'refund_reversed') {
    const p = await TripPassPurchase.findOneAndUpdate(
      { transactionId: action.transactionId, status: 'refunded' },
      { $set: { status: 'active', refundedAt: null } },
      { new: true },
    ).lean<TripPassPurchaseDoc>();
    if (!p) return 'unknown_transaction';
    return (await putPassOnGroup(p.groupId, p)) ? 'restored' : 'group_has_other_pass';
  }
  // Purchase: only the safety net. Without the group in the subscriber
  // attribute the app's own call (POST /groups/:id/trip-pass) has to do it.
  if (!action.groupId || !Types.ObjectId.isValid(action.appUserId)) return 'no_pending_group';
  const group = await Group.findById(action.groupId).lean<GroupDoc>();
  if (!group || !memberRole(group, action.appUserId)) return 'not_a_member';
  if (!(await User.exists({ _id: action.appUserId }))) return 'unknown_user';
  try {
    return await applyTripPass({
      group,
      userId: new Types.ObjectId(action.appUserId),
      tx: { transactionId: action.transactionId, rcId: null, purchasedAt: action.purchasedAt, store: null, sandbox: false },
      via: 'webhook',
    });
  } catch (e) {
    // A refusal (already used elsewhere, group has a pass) is final: do not make RevenueCat retry.
    if (e instanceof HttpError) return e.code ?? 'refused';
    throw e;
  }
}
