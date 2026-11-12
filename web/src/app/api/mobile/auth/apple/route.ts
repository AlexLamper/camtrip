import appleSignin from 'apple-signin-auth';
import { z } from 'zod';
import { connectDB } from '@/lib/db';
import { User, type UserDoc } from '@/lib/models';
import { body, handler, HttpError } from '@/lib/http';
import { sessionResponse, signInWithProvider } from '@/lib/auth';

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

  let payload: { sub: string; email?: string; email_verified?: 'true' | 'false' | boolean } | null = null;
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
  // Apple sends name and email only on the very first sign-in. Only the email
  // inside the signed token counts as verified; the one from the app does not.
  const name = [input.givenName, input.familyName].filter(Boolean).join(' ').trim();
  const tokenEmail = payload.email ?? '';
  const verified = Boolean(tokenEmail) && (payload.email_verified === true || payload.email_verified === 'true');
  const { user, created } = await signInWithProvider({
    provider: 'appleId',
    sub: payload.sub,
    email: tokenEmail || input.email || '',
    emailVerified: verified,
    name,
  });
  let u = user;
  if (!created && name && (!u.name || u.name === 'Fotograaf')) {
    u = (await User.findByIdAndUpdate(u._id, { $set: { name } }, { new: true }).lean<UserDoc>()) ?? u;
  }
  return sessionResponse(u, { isNew: !name && u.name === 'Fotograaf' });
});
