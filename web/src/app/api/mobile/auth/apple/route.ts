import appleSignin from 'apple-signin-auth';
import { z } from 'zod';
import { connectDB } from '@/lib/db';
import { User } from '@/lib/models';
import { body, handler, HttpError, json } from '@/lib/http';
import { publicUser, randomAvatarColor, signSession } from '@/lib/auth';

const Body = z.object({
  identityToken: z.string().min(10),
  givenName: z.string().optional(),
  familyName: z.string().optional(),
  email: z.string().optional(),
});

export const POST = handler(async (req) => {
  const input = await body(req, Body);
  const audiences = (process.env.APPLE_CLIENT_IDS ?? '').split(',').map((s) => s.trim()).filter(Boolean);
  if (!audiences.length) throw new Error('APPLE_CLIENT_IDS is not set');

  let payload: { sub: string; email?: string } | null = null;
  for (const audience of audiences) {
    try {
      payload = await appleSignin.verifyIdToken(input.identityToken, { audience });
      break;
    } catch {
      /* try next audience */
    }
  }
  if (!payload?.sub) throw new HttpError(401, 'Inloggen met Apple is mislukt');

  await connectDB();
  // Apple sends name and email only on the very first sign-in.
  const name = [input.givenName, input.familyName].filter(Boolean).join(' ').trim();
  let user = await User.findOne({ appleId: payload.sub });
  if (!user) {
    user = await User.create({
      appleId: payload.sub,
      email: payload.email ?? input.email ?? '',
      name: name || 'Fotograaf',
      avatarColor: randomAvatarColor(),
    });
  } else if (name && (!user.name || user.name === 'Fotograaf')) {
    user.name = name;
    await user.save();
  }
  const u = user.toObject();
  return json({ token: signSession(String(u._id)), user: publicUser(u), isNew: !name && user.name === 'Fotograaf' });
});
