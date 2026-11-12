import { handler, json } from '@/lib/http';
import { requireUser } from '@/lib/auth';
import { syncProFromRevenueCat } from '@/lib/revenuecat';

/**
 * Called by the app after a purchase, a restore and on launch. RevenueCat does
 * not re-send a webhook for a restore, so without this an account whose first
 * webhook got lost could never unlock Pro.
 */
export const POST = handler(async (req) => {
  const user = await requireUser(req);
  const result = await syncProFromRevenueCat(String(user._id));
  return json(result);
});
