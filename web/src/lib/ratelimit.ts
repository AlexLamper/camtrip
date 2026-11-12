import { AUTH_ATTEMPT_WINDOW_SECONDS, AuthAttempt } from './models';
import { HttpError } from './http';

/** Best-effort client IP (Vercel sets x-forwarded-for; the first entry is the client). */
export function clientIp(req: Request): string {
  const fwd = req.headers.get('x-forwarded-for');
  if (fwd) return fwd.split(',')[0].trim();
  return req.headers.get('x-real-ip')?.trim() || 'unknown';
}

/**
 * Counts one attempt for [key] and throws 429 once there were [max] attempts
 * in the last 15 minutes. Stored in Mongo so it holds across serverless
 * instances; a TTL index clears old attempts. Call after connectDB().
 */
export async function rateLimit(key: string, max = 10): Promise<void> {
  const since = new Date(Date.now() - AUTH_ATTEMPT_WINDOW_SECONDS * 1000);
  const count = await AuthAttempt.countDocuments({ key, createdAt: { $gte: since } });
  if (count >= max) {
    throw new HttpError(429, 'Te veel pogingen. Probeer het over een kwartier opnieuw.', 'rate_limited');
  }
  await AuthAttempt.create({ key });
}

export async function clearRateLimit(key: string): Promise<void> {
  await AuthAttempt.deleteMany({ key });
}

/** Key per action, address and IP, e.g. `login:alex@example.com:1.2.3.4`. */
export function attemptKey(action: string, email: string, req: Request): string {
  return `${action}:${email}:${clientIp(req)}`;
}
