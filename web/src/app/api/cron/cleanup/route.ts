import { connectDB } from '@/lib/db';
import { Group, Photo, Report, type GroupDoc } from '@/lib/models';
import { handler, json } from '@/lib/http';
import { ownerIsPro } from '@/lib/groups';
import { deleteKeys } from '@/lib/storage';

/**
 * Daily: removes free groups whose 30 days after the end have passed, and
 * uploads that were reserved but never completed (after 2 days).
 */
export const GET = handler(async (req) => {
  const secret = process.env.CRON_SECRET;
  if (!secret || req.headers.get('authorization') !== `Bearer ${secret}`) return json({ error: 'Unauthorized' }, 401);
  await connectDB();

  const due = await Group.find({ deleteAfter: { $ne: null, $lt: new Date() } }).lean<GroupDoc[]>();
  let deletedGroups = 0;
  for (const g of due) {
    // The owner may have bought Pro since deleteAfter was set.
    if (await ownerIsPro(g)) {
      await Group.updateOne({ _id: g._id }, { deleteAfter: null });
      continue;
    }
    const photos = await Photo.find({ groupId: g._id }, { originalKey: 1, displayKey: 1, thumbKey: 1 }).lean();
    await deleteKeys(photos.flatMap((p) => [p.originalKey, p.displayKey, p.thumbKey]));
    await Photo.deleteMany({ groupId: g._id });
    await Report.deleteMany({ groupId: g._id });
    await Group.deleteOne({ _id: g._id });
    deletedGroups++;
  }

  const stale = await Photo.find({ status: 'pending', createdAt: { $lt: new Date(Date.now() - 2 * 86_400_000) } }).lean();
  await deleteKeys(stale.flatMap((p) => [p.originalKey, p.displayKey, p.thumbKey]));
  await Photo.deleteMany({ _id: { $in: stale.map((p) => p._id) } });

  return json({ deletedGroups, stalePending: stale.length });
});
