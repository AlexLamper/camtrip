import { OAuth2Client } from 'google-auth-library';
import { z } from 'zod';
import { connectDB } from '@/lib/db';
import { body, handler, HttpError } from '@/lib/http';
import { sessionResponse, signInWithProvider } from '@/lib/auth';

const Body = z.object({ idToken: z.string().min(10) });
const client = new OAuth2Client();

export const POST = handler(async (req) => {
  const { idToken } = await body(req, Body);
  // Comma list: web/server client id (Android tokens), iOS client id, ...
  const audience = (process.env.GOOGLE_CLIENT_IDS ?? '').split(',').map((s) => s.trim()).filter(Boolean);
  if (!audience.length) throw new Error('GOOGLE_CLIENT_IDS is not set');

  let payload;
  try {
    payload = (await client.verifyIdToken({ idToken, audience })).getPayload();
  } catch {
    throw new HttpError(401, 'Inloggen met Google is mislukt');
  }
  if (!payload?.sub) throw new HttpError(401, 'Inloggen met Google is mislukt');

  await connectDB();
  const { user } = await signInWithProvider({
    provider: 'googleId',
    sub: payload.sub,
    email: payload.email ?? '',
    emailVerified: payload.email_verified === true,
    name: payload.given_name ?? payload.name ?? '',
  });
  return sessionResponse(user);
});
