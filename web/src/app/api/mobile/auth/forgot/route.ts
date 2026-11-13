import { after } from 'next/server';
import { connectDB } from '@/lib/db';
import { User } from '@/lib/models';
import { handler, json } from '@/lib/http';
import { parseEmail, readJson } from '@/lib/account';
import { generateResetCode, hashResetCode } from '@/lib/password';
import { attemptKey, rateLimit } from '@/lib/ratelimit';
import { hasPushDevice, pushReady, pushToUsers } from '@/lib/push';
import { resetCodeNotice } from '@/lib/push-i18n';

const RESET_MINUTES = 15;

function secret(): string {
  const s = process.env.JWT_SECRET;
  if (!s) throw new Error('JWT_SECRET is not set');
  return s;
}

/**
 * POST {email} -> always 200 {ok: true}, whatever happened, so nobody can
 * find out which addresses have an account. CamTrip sends no e-mail: when the
 * account exists and is still signed in on a device, a 6-digit code (valid 15
 * minutes) goes there as a push. Without such a device the app tells people
 * to sign in with Apple or Google with the same address (that links the
 * account, see signInWithProvider).
 *
 * The account is an e-mail + password account, or an Apple/Google account
 * whose address the provider verified (that lets them add a password).
 * The push is sent after the response, so timing does not give it away either.
 */
export const POST = handler(async (req) => {
  const raw = await readJson(req);
  const email = parseEmail(raw.email);

  await connectDB();
  await rateLimit(attemptKey('forgot', email, req), 5);
  await rateLimit(`forgot:${email}`, 10); // no push-bombing one account from many IPs

  const user =
    (await User.findOne({ email, passwordHash: { $type: 'string' } })) ??
    (await User.findOne({ email, emailVerified: true }).sort({ createdAt: 1 }));
  if (user && !user.banned && hasPushDevice(user) && pushReady()) {
    const code = generateResetCode();
    user.resetCodeHash = hashResetCode(code, String(user._id), secret());
    user.resetExpires = new Date(Date.now() + RESET_MINUTES * 60 * 1000);
    user.resetAttempts = 0;
    await user.save();
    const userId = user._id;
    after(() => pushToUsers([userId], (locale) => resetCodeNotice(locale, code, RESET_MINUTES)).catch((e) => console.error('[forgot] push failed', e)));
  }
  return json({ ok: true });
});
