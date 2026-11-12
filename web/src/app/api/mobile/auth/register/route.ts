import { connectDB } from '@/lib/db';
import { User } from '@/lib/models';
import { handler, HttpError } from '@/lib/http';
import { randomAvatarColor, sessionResponse } from '@/lib/auth';
import { parseEmail, parseName, parseNewPassword, readJson } from '@/lib/account';
import { hashPassword } from '@/lib/password';
import { clientIp, rateLimit } from '@/lib/ratelimit';

/** POST {name, email, password} -> {token, user, isNew: true} */
export const POST = handler(async (req) => {
  const raw = await readJson(req);
  const name = parseName(raw.name);
  const email = parseEmail(raw.email);
  const password = parseNewPassword(raw.password);

  await connectDB();
  // Stops mass sign-ups from one address; generous for a shared wifi.
  await rateLimit(`register:${clientIp(req)}`, 20);

  const existing = await User.findOne({ email }, { passwordHash: 1, appleId: 1, googleId: 1 }).lean();
  if (existing) {
    const social = !existing.passwordHash && (existing.appleId || existing.googleId);
    throw new HttpError(
      409,
      social
        ? `Er bestaat al een account met dit e-mailadres. Log in met ${existing.appleId ? 'Apple' : 'Google'}.`
        : 'Er bestaat al een account met dit e-mailadres. Log in, of kies "Wachtwoord vergeten?".',
      'email_taken',
    );
  }

  try {
    const user = await User.create({
      name,
      email,
      passwordHash: await hashPassword(password),
      emailVerified: false,
      avatarColor: randomAvatarColor(),
    });
    return sessionResponse(user.toObject(), { isNew: true });
  } catch (err) {
    if ((err as { code?: number }).code === 11000) {
      throw new HttpError(409, 'Er bestaat al een account met dit e-mailadres. Log in, of kies "Wachtwoord vergeten?".', 'email_taken');
    }
    throw err;
  }
});
