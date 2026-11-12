import { OAuth2Client } from 'google-auth-library';
import { z } from 'zod';
import { connectDB } from '@/lib/db';
import { User } from '@/lib/models';
import { body, handler, HttpError, json } from '@/lib/http';
import { publicUser, randomAvatarColor, signSession } from '@/lib/auth';

const Body = z.object({ idToken: z.string().min(10) });
const client = new OAuth2Client();

export const POST = handler(async (req) => {
  const { idToken } = await body(req, Body);
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
  let user = await User.findOne({ googleId: payload.sub });
  if (!user) {
    user = await User.create({
      googleId: payload.sub,
      email: payload.email ?? '',
      name: payload.given_name ?? payload.name ?? 'Fotograaf',
      avatarColor: randomAvatarColor(),
    });
  }
  const u = user.toObject();
  return json({ token: signSession(String(u._id)), user: publicUser(u) });
});
