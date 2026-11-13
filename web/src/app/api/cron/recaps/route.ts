import { connectDB } from '@/lib/db';
import { Group, type GroupDoc } from '@/lib/models';
import { handler, json } from '@/lib/http';
import { pushToUsers } from '@/lib/push';
import { recapNotice } from '@/lib/push-i18n';
import { NOT_PERSONAL } from '@/lib/personal-roll';

/**
 * Daily: when a trip or event has ended, tell everyone their recap is ready.
 * The recap itself is assembled in the app from the group's photos.
 */
export const GET = handler(async (req) => {
  const secret = process.env.CRON_SECRET;
  if (!secret || req.headers.get('authorization') !== `Bearer ${secret}`) return json({ error: 'Unauthorized' }, 401);
  await connectDB();
  const groups = await Group.find({
    endDate: { $ne: null, $lt: new Date() },
    recapNotifiedAt: null,
    photoCount: { $gte: 5 },
    ...NOT_PERSONAL,
  }).lean<GroupDoc[]>();

  for (const g of groups) {
    await Group.updateOne({ _id: g._id }, { recapNotifiedAt: new Date() });
    await pushToUsers(
      g.members.map((m) => m.userId),
      (locale) => recapNotice(locale, g.name, g.photoCount, String(g._id)),
      'notifyRecap',
    );
  }
  return json({ notified: groups.length });
});
