import { z } from 'zod';
import { Group, type GroupDoc } from '@/lib/models';
import { body, handler, HttpError, json, type Params } from '@/lib/http';
import { requireUser } from '@/lib/auth';
import { requireMember, serializeGroup } from '@/lib/groups';
import { applyTripPass, verifyTripPassTransaction } from '@/lib/trip-pass-db';

type P = Params<{ id: string }>;

const Input = z.object({ transactionId: z.string().trim().min(1).max(200) });

/**
 * Called by the app right after buying a Trip Pass for this group. The
 * transaction is looked up at RevenueCat (it must belong to this account) and
 * applied once; calling again with the same transaction is a no-op success.
 * Any member may buy the pass; it is for everyone in the group.
 */
export const POST = handler<P>(async (req, { params }) => {
  const user = await requireUser(req);
  const group = await requireMember((await params).id, user._id);
  const { transactionId } = await body(req, Input);

  const tx = await verifyTripPassTransaction(String(user._id), transactionId);
  if (!tx) throw new HttpError(404, 'Aankoop niet gevonden', 'trip_pass_not_found');

  const result = await applyTripPass({ group, userId: user._id, tx, via: 'app' });
  const fresh = (await Group.findById(group._id).lean<GroupDoc>()) ?? group;
  return json({ result, group: await serializeGroup(fresh, user._id) });
});
