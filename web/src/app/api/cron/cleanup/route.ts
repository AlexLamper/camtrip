import { connectDB } from '@/lib/db';
import { Group, Photo, User, type GroupDoc } from '@/lib/models';
import { handler, json } from '@/lib/http';
import { deleteGroupEverywhere } from '@/lib/groups';
import { groupIsPro, refreshRetentionForMember } from '@/lib/pro';
import { deleteKeys } from '@/lib/storage';
import { NOT_PERSONAL } from '@/lib/personal-roll';

/**
 * Daily: removes free groups whose 30 days after the end have passed, and
 * uploads that were reserved but never completed (after 2 days).
 * Personal rolls ("Mijn rolletje") are never removed while the account exists.
 */
export const GET = handler(async (req) => {
  const secret = process.env.CRON_SECRET;
  if (!secret || req.headers.get('authorization') !== `Bearer ${secret}`) return json({ error: 'Unauthorized' }, 401);
  await connectDB();

  // Gifts from an admin that ran out since the last run: their groups may be
  // free again. (Subscriptions are handled by the RevenueCat webhook.)
  const lapsed = await User.find(
    { 'proGrant.until': { $ne: null, $lt: new Date(), $gt: new Date(Date.now() - 3 * 86_400_000) } },
    { _id: 1 },
  ).lean();
  for (const u of lapsed) await refreshRetentionForMember(u._id);

  const due = await Group.find({ deleteAfter: { $ne: null, $lt: new Date() }, ...NOT_PERSONAL }).lean<GroupDoc[]>();
  let deletedGroups = 0;
  for (const g of due) {
    // A member may have Pro since deleteAfter was set (one Pro member = Pro group).
    if (await groupIsPro(g)) {
      await Group.updateOne({ _id: g._id }, { deleteAfter: null });
      continue;
    }
    // Same removal as a manual delete: R2 objects, photos, reports, hides.
    await deleteGroupEverywhere(g);
    deletedGroups++;
  }

  const stale = await Photo.find({ status: 'pending', createdAt: { $lt: new Date(Date.now() - 2 * 86_400_000) } }).lean();
  await deleteKeys(stale.flatMap((p) => [p.originalKey, p.displayKey, p.thumbKey]));
  await Photo.deleteMany({ _id: { $in: stale.map((p) => p._id) } });

  return json({ deletedGroups, stalePending: stale.length });
});
