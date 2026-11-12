import { z } from 'zod';
import { User } from '@/lib/models';
import { body, handler, json } from '@/lib/http';
import { requireUser } from '@/lib/auth';

const Body = z.object({ token: z.string().min(10), platform: z.enum(['ios', 'android']) });

export const POST = handler(async (req) => {
  const user = await requireUser(req);
  const { token, platform } = await body(req, Body);
  // A token belongs to one device, and one device to one account at a time.
  await User.updateMany({ 'pushTokens.token': token }, { $pull: { pushTokens: { token } } });
  await User.updateOne({ _id: user._id }, { $push: { pushTokens: { token, platform, updatedAt: new Date() } } });
  return json({ ok: true });
});

export const DELETE = handler(async (req) => {
  const user = await requireUser(req);
  const { token } = await body(req, z.object({ token: z.string() }));
  await User.updateOne({ _id: user._id }, { $pull: { pushTokens: { token } } });
  return json({ ok: true });
});
