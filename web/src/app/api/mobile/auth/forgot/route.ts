import { connectDB } from '@/lib/db';
import { User } from '@/lib/models';
import { handler, json } from '@/lib/http';
import { parseEmail, readJson } from '@/lib/account';
import { generateResetCode, hashResetCode } from '@/lib/password';
import { attemptKey, rateLimit } from '@/lib/ratelimit';
import { resetCodeMail, sendMail } from '@/lib/mail';

const RESET_MINUTES = 15;

function secret(): string {
  const s = process.env.JWT_SECRET;
  if (!s) throw new Error('JWT_SECRET is not set');
  return s;
}

/**
 * POST {email} -> always {ok: true}, so nobody can find out which addresses
 * have an account. Sends a 6-digit code (valid 15 minutes) when one exists:
 * to an e-mail + password account, or to an Apple/Google account whose
 * address the provider verified (that lets them add a password).
 */
export const POST = handler(async (req) => {
  const raw = await readJson(req);
  const email = parseEmail(raw.email);

  await connectDB();
  await rateLimit(attemptKey('forgot', email, req), 5);
  await rateLimit(`forgot:${email}`, 10); // no mail-bombing one address from many IPs

  const user =
    (await User.findOne({ email, passwordHash: { $type: 'string' } })) ??
    (await User.findOne({ email, emailVerified: true }).sort({ createdAt: 1 }));
  if (user) {
    const code = generateResetCode();
    user.resetCodeHash = hashResetCode(code, String(user._id), secret());
    user.resetExpires = new Date(Date.now() + RESET_MINUTES * 60 * 1000);
    user.resetAttempts = 0;
    await user.save();
    const mail = resetCodeMail(user.name, code);
    await sendMail(email, mail.subject, mail.text, mail.html);
  }
  return json({ ok: true });
});
