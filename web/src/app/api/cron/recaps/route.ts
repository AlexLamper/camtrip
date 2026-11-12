import { connectDB } from '@/lib/db';
import { Group, type GroupDoc } from '@/lib/models';
import { handler, json } from '@/lib/http';
import { pushToUsers } from '@/lib/push';

/**
 * Daily: when a trip or event has ended, tell everyone their recap is ready.
 * The recap itself is assembled in the app from the group's photos.
 */
export const GET = handler(async (req) => {
  if (req.headers.get('authorization') !== `Bearer ${process.env.CRON_SECRET}`) return json({ error: 'Unauthorized' }, 401);
  await connectDB();
  const groups = await Group.find({
    endDate: { $ne: null, $lt: new Date() },
    recapNotifiedAt: null,
    photoCount: { $gte: 5 },
  }).lean<GroupDoc[]>();

  for (const g of groups) {
    await Group.updateOne({ _id: g._id }, { recapNotifiedAt: new Date() });
    await pushToUsers(
      g.members.map((m) => m.userId),
      { title: `Je recap van ${g.name} is klaar 🎞️`, body: `${g.photoCount} foto's, klaar om te bekijken en te delen.`, data: { type: 'recap', groupId: String(g._id) } },
      'notifyRecap',
    );
  }
  return json({ notified: groups.length });
});
