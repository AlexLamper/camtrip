// Password and reset-code helpers. Pure Node crypto (no native deps), so this
// file also runs as-is under `node --experimental-strip-types` for the tests.
import { createHmac, randomBytes, randomInt, scrypt, timingSafeEqual } from 'node:crypto';

export const PASSWORD_MIN = 8;
export const PASSWORD_MAX = 200;

// scrypt cost: N=2^14, r=8, p=1 (~16 MB, tens of ms). Stored with the hash so
// it can be raised later without breaking old passwords.
const N = 16384;
const R = 8;
const P = 1;
const KEYLEN = 64;

function scryptAsync(password: string, salt: Buffer, keylen: number, n: number, r: number, p: number): Promise<Buffer> {
  return new Promise((resolve, reject) => {
    scrypt(password.normalize('NFKC'), salt, keylen, { N: n, r, p, maxmem: 128 * n * r * 2 }, (err, key) =>
      err ? reject(err) : resolve(key),
    );
  });
}

/** Returns `scrypt$N$r$p$salt$hash` (salt and hash base64). */
export async function hashPassword(password: string): Promise<string> {
  const salt = randomBytes(16);
  const key = await scryptAsync(password, salt, KEYLEN, N, R, P);
  return ['scrypt', N, R, P, salt.toString('base64'), key.toString('base64')].join('$');
}

/** Constant-time check of [password] against a hash from [hashPassword]. */
export async function verifyPassword(password: string, stored: string | null | undefined): Promise<boolean> {
  if (!stored) return false;
  const parts = stored.split('$');
  if (parts.length !== 6 || parts[0] !== 'scrypt') return false;
  const [, n, r, p, saltB64, hashB64] = parts;
  const expected = Buffer.from(hashB64, 'base64');
  if (!expected.length) return false;
  try {
    const key = await scryptAsync(password, Buffer.from(saltB64, 'base64'), expected.length, Number(n), Number(r), Number(p));
    return key.length === expected.length && timingSafeEqual(key, expected);
  } catch {
    return false;
  }
}

/** Hash to compare against when no account exists, so timing does not reveal that. */
let dummyHash: Promise<string> | null = null;
export function dummyPasswordHash(): Promise<string> {
  dummyHash ??= hashPassword(randomBytes(12).toString('hex'));
  return dummyHash;
}

export function normalizeEmail(email: string): string {
  return email.trim().toLowerCase();
}

/** Six digits, leading zeros allowed. */
export function generateResetCode(): string {
  return String(randomInt(0, 1_000_000)).padStart(6, '0');
}

/** Keyed hash of a reset code, bound to one user so a code is useless for another account. */
export function hashResetCode(code: string, userId: string, secret: string): string {
  return createHmac('sha256', secret).update(`${userId}:${code.trim()}`).digest('hex');
}

export function safeEqualHex(a: string, b: string): boolean {
  const ab = Buffer.from(a, 'hex');
  const bb = Buffer.from(b, 'hex');
  return ab.length > 0 && ab.length === bb.length && timingSafeEqual(ab, bb);
}
