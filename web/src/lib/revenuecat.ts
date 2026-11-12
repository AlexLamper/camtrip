import { Types } from 'mongoose';
import { User } from './models';
import { refreshRetentionForOwner } from './groups';

export const PRO_ENTITLEMENT_ID = process.env.REVENUECAT_PRO_ENTITLEMENT_ID ?? 'pro';

type Entitlement = { expires_date?: string | null };
type SubscriberResponse = { subscriber?: { entitlements?: Record<string, Entitlement | undefined> } };

/**
 * Asks RevenueCat for the subscriber's current entitlements and stores the
 * result. RevenueCat's REST state is the source of truth; webhooks only tell
 * us *when* to look (their docs recommend exactly this).
 */
export async function syncProFromRevenueCat(appUserId: string): Promise<{ isPro: boolean; expiresAt: Date | null }> {
  if (!Types.ObjectId.isValid(appUserId)) throw new Error(`Invalid app_user_id: ${appUserId}`);
  const key = process.env.REVENUECAT_REST_API_KEY;
  if (!key) throw new Error('REVENUECAT_REST_API_KEY is not set');

  const res = await fetch(`https://api.revenuecat.com/v1/subscribers/${encodeURIComponent(appUserId)}`, {
    headers: { Authorization: `Bearer ${key}` },
    cache: 'no-store',
  });
  if (!res.ok) throw new Error(`RevenueCat ${res.status}: ${(await res.text()).slice(0, 300)}`);
  const data = (await res.json()) as SubscriberResponse;

  const ent = data.subscriber?.entitlements?.[PRO_ENTITLEMENT_ID];
  const expiresAt = ent?.expires_date ? new Date(ent.expires_date) : null;
  // An entitlement object stays in the response after it lapses; only an
  // unexpired (or non-expiring) one counts.
  const active = Boolean(ent) && (expiresAt === null || expiresAt.getTime() > Date.now());

  const before = await User.findByIdAndUpdate(
    appUserId,
    { proStore: active, proExpiresAt: active ? expiresAt : null },
    { new: false, projection: { proStore: 1 } },
  ).lean();

  if (before && Boolean(before.proStore) !== active) {
    await refreshRetentionForOwner(appUserId, active);
  }
  return { isPro: active, expiresAt: active ? expiresAt : null };
}
