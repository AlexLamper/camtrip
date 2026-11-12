import { connectDB } from '@/lib/db';
import { User, type UserDoc } from '@/lib/models';
import { handler, HttpError } from '@/lib/http';
import { sessionResponse } from '@/lib/auth';
import { readJson } from '@/lib/account';
import { dummyPasswordHash, normalizeEmail, verifyPassword } from '@/lib/password';
import { attemptKey, clearRateLimit, rateLimit } from '@/lib/ratelimit';

const WRONG = 'E-mailadres of wachtwoord klopt niet';

/** POST {email, password} -> {token, user} */
export const POST = handler(async (req) => {
  const raw = await readJson(req);
  const email = normalizeEmail(typeof raw.email === 'string' ? raw.email : '');
  const password = typeof raw.password === 'string' ? raw.password : '';
  if (!email || !password || email.length > 254 || password.length > 200) throw new HttpError(401, WRONG, 'invalid_credentials');

  await connectDB();
  const key = attemptKey('login', email, req);
  await rateLimit(key);

  const user = await User.findOne({ email, passwordHash: { $type: 'string' } }).lean<UserDoc>();
  // Always run scrypt, so a missing account answers as slowly as a wrong password.
  const ok = await verifyPassword(password, user?.passwordHash ?? (await dummyPasswordHash()));
  if (!user || !ok) throw new HttpError(401, WRONG, 'invalid_credentials');

  await clearRateLimit(key);
  return sessionResponse(user);
});
