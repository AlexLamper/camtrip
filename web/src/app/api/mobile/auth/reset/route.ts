import { connectDB } from '@/lib/db';
import { User } from '@/lib/models';
import { handler, HttpError } from '@/lib/http';
import { sessionResponse } from '@/lib/auth';
import { parseCode, parseEmail, parseNewPassword, readJson } from '@/lib/account';
import { hashPassword, hashResetCode, safeEqualHex } from '@/lib/password';
import { attemptKey, clearRateLimit, rateLimit } from '@/lib/ratelimit';

/** Wrong codes per requested code; after that a new code is needed. */
const MAX_CODE_ATTEMPTS = 5;
const WRONG = 'Deze code klopt niet of is verlopen. Vraag een nieuwe code aan.';

function secret(): string {
  const s = process.env.JWT_SECRET;
  if (!s) throw new Error('JWT_SECRET is not set');
  return s;
}

/** POST {email, code, password} -> {token, user}: sets the new password and signs in. */
export const POST = handler(async (req) => {
  const raw = await readJson(req);
  const email = parseEmail(raw.email);
  const code = parseCode(raw.code);
  const password = parseNewPassword(raw.password);

  await connectDB();
  const key = attemptKey('reset', email, req);
  await rateLimit(key);

  const user = await User.findOne({ email, resetCodeHash: { $type: 'string' } }).sort({ resetExpires: -1 });
  if (!user || !user.resetCodeHash || !user.resetExpires || user.resetExpires.getTime() < Date.now()) {
    throw new HttpError(400, WRONG, 'invalid_code');
  }
  if (!safeEqualHex(hashResetCode(code, String(user._id), secret()), user.resetCodeHash)) {
    const attempts = (user.resetAttempts ?? 0) + 1;
    if (attempts >= MAX_CODE_ATTEMPTS) {
      user.resetCodeHash = null;
      user.resetExpires = null;
      user.resetAttempts = 0;
    } else {
      user.resetAttempts = attempts;
    }
    await user.save();
    throw new HttpError(400, WRONG, 'invalid_code');
  }

  user.passwordHash = await hashPassword(password);
  user.emailVerified = true; // the code proved they read this mailbox
  user.resetCodeHash = null;
  user.resetExpires = null;
  user.resetAttempts = 0;
  await user.save();
  await clearRateLimit(key);
  return sessionResponse(user.toObject());
});
