import { z } from 'zod';
import { User } from '@/lib/models';
import { body, handler, json } from '@/lib/http';
import { requireUser } from '@/lib/auth';

// locale: the app's language ("nl", "pt_BR" ...), so pushes come in that language.
const Body = z.object({
  token: z.string().min(10),
  platform: z.enum(['ios', 'android']),
  locale: z.string().trim().max(20).regex(/^[A-Za-z]{2,3}([_-][A-Za-z0-9]{2,8})*$/).optional(),
});

export const POST = handler(async (req) => {
  const user = await requireUser(req);
  const { token, platform, locale } = await body(req, Body);
  // A token belongs to one device, and one device to one account at a time.
  await User.updateMany({ 'pushTokens.token': token }, { $pull: { pushTokens: { token } } });
  await User.updateOne(
    { _id: user._id },
    {
      $push: { pushTokens: { token, platform, locale: locale ?? null, updatedAt: new Date() } },
      ...(locale ? { $set: { locale } } : {}),
    },
  );
  return json({ ok: true });
});

export const DELETE = handler(async (req) => {
  const user = await requireUser(req);
  const { token } = await body(req, z.object({ token: z.string() }));
  await User.updateOne({ _id: user._id }, { $pull: { pushTokens: { token } } });
  return json({ ok: true });
});
