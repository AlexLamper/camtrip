import { createCipheriv, createDecipheriv, createPrivateKey, hkdfSync, randomBytes, type KeyObject } from 'node:crypto';
import jwt from 'jsonwebtoken';

/**
 * Sign in with Apple server-to-server calls (App Store Review Guideline 5.1.1(v)):
 * the authorization code from the app is exchanged for a refresh token at sign-in,
 * and that token is revoked when the account is deleted.
 *
 * Needs a "Sign in with Apple" key (.p8) from the Apple Developer account:
 *   APPLE_SIWA_KEY_ID, APPLE_SIWA_KEY_P8, APPLE_TEAM_ID, APPLE_CLIENT_ID (default app.camtrip.camtrip).
 * Without them exchange and revocation are skipped (one warning is logged); sign-in
 * and account deletion keep working.
 *
 * No imports from the app's models here, so the pure parts can be unit tested.
 */

const APPLE_AUDIENCE = 'https://appleid.apple.com';
const TOKEN_URL = 'https://appleid.apple.com/auth/token';
const REVOKE_URL = 'https://appleid.apple.com/auth/revoke';
const DEFAULT_CLIENT_ID = 'app.camtrip.camtrip';
const MAX_SECRET_SECONDS = 15777000; // Apple's limit: 6 months.

export type SiwaConfig = { keyId: string; teamId: string; clientId: string; privateKey: KeyObject };

/**
 * Accepts the .p8 contents as raw PEM, PEM with literal "\n" escapes, the whole
 * PEM base64-encoded, or just the base64 body without the BEGIN/END lines.
 */
export function normalizePrivateKeyPem(input: string): string {
  let s = input.trim().replace(/^["']|["']$/g, '').replace(/\\n/g, '\n').replace(/\r/g, '').trim();
  if (!s.includes('-----BEGIN')) {
    const compact = s.replace(/\s+/g, '');
    const decoded = Buffer.from(compact, 'base64').toString('utf8');
    if (decoded.includes('-----BEGIN')) {
      s = decoded.replace(/\\n/g, '\n').replace(/\r/g, '').trim();
    } else {
      const body = compact.match(/.{1,64}/g)?.join('\n') ?? '';
      s = `-----BEGIN PRIVATE KEY-----\n${body}\n-----END PRIVATE KEY-----`;
    }
  }
  return `${s}\n`;
}

/** Parses an ES256 (EC P-256) private key, or throws. */
export function parsePrivateKey(input: string): KeyObject {
  const key = createPrivateKey(normalizePrivateKeyPem(input));
  if (key.asymmetricKeyType !== 'ec') throw new Error('Sign in with Apple key is not an EC key');
  return key;
}

/** Reads the config from the environment; null when it is missing or the key does not parse. */
export function siwaConfig(env: NodeJS.ProcessEnv = process.env): SiwaConfig | null {
  const keyId = env.APPLE_SIWA_KEY_ID?.trim();
  const p8 = env.APPLE_SIWA_KEY_P8;
  const teamId = (env.APPLE_TEAM_ID || env.APNS_TEAM_ID || '').trim();
  const clientId = (env.APPLE_CLIENT_ID || DEFAULT_CLIENT_ID).trim();
  if (!keyId || !p8 || !teamId) return null;
  try {
    return { keyId, teamId, clientId, privateKey: parsePrivateKey(p8) };
  } catch {
    return null;
  }
}

/** For /api/health: 'ok' when the key is present and parseable. Never exposes values. */
export function siwaStatus(env: NodeJS.ProcessEnv = process.env): 'ok' | 'missing' {
  return siwaConfig(env) ? 'ok' : 'missing';
}

/** The client_secret Apple wants: an ES256 JWT signed with the Sign in with Apple key. */
export function buildClientSecret(cfg: SiwaConfig, opts: { now?: number; ttlSeconds?: number } = {}): string {
  const iat = Math.floor((opts.now ?? Date.now()) / 1000);
  const ttl = Math.min(Math.max(opts.ttlSeconds ?? 3600, 60), MAX_SECRET_SECONDS);
  return jwt.sign({ iss: cfg.teamId, iat, exp: iat + ttl, aud: APPLE_AUDIENCE, sub: cfg.clientId }, cfg.privateKey, {
    algorithm: 'ES256',
    keyid: cfg.keyId,
  });
}

// ---------------------------------------------------------------- refresh token encryption

function encryptionKey(env: NodeJS.ProcessEnv = process.env): Buffer {
  const secret = env.APPLE_TOKEN_ENC_KEY || env.JWT_SECRET;
  if (!secret) throw new Error('APPLE_TOKEN_ENC_KEY or JWT_SECRET must be set');
  return Buffer.from(hkdfSync('sha256', secret, 'camtrip-siwa', 'apple-refresh-token-v1', 32));
}

/** AES-256-GCM. Output: "v1." + base64url(iv | tag | ciphertext). */
export function encryptToken(plain: string, env: NodeJS.ProcessEnv = process.env): string {
  const iv = randomBytes(12);
  const cipher = createCipheriv('aes-256-gcm', encryptionKey(env), iv);
  const ct = Buffer.concat([cipher.update(plain, 'utf8'), cipher.final()]);
  return `v1.${Buffer.concat([iv, cipher.getAuthTag(), ct]).toString('base64url')}`;
}

export function decryptToken(stored: string, env: NodeJS.ProcessEnv = process.env): string {
  if (!stored.startsWith('v1.')) throw new Error('Unknown token format');
  const raw = Buffer.from(stored.slice(3), 'base64url');
  if (raw.length < 29) throw new Error('Token too short');
  const decipher = createDecipheriv('aes-256-gcm', encryptionKey(env), raw.subarray(0, 12));
  decipher.setAuthTag(raw.subarray(12, 28));
  return Buffer.concat([decipher.update(raw.subarray(28)), decipher.final()]).toString('utf8');
}

// ---------------------------------------------------------------- Apple calls

let warnedMissing = false;
function configOrWarn(): SiwaConfig | null {
  const cfg = siwaConfig();
  if (!cfg && !warnedMissing) {
    warnedMissing = true;
    console.warn('[siwa] APPLE_SIWA_KEY_ID / APPLE_SIWA_KEY_P8 / APPLE_TEAM_ID missing or invalid: Apple token exchange and revocation are skipped');
  }
  return cfg;
}

async function postForm(url: string, form: Record<string, string>) {
  return fetch(url, {
    method: 'POST',
    headers: { 'content-type': 'application/x-www-form-urlencoded', accept: 'application/json' },
    body: new URLSearchParams(form).toString(),
    signal: AbortSignal.timeout(8000),
  });
}

/**
 * Exchanges the app's authorization code for a refresh token and returns it
 * encrypted for storage, or null. Never throws: sign-in must not depend on it.
 */
export async function exchangeAuthorizationCode(code: string): Promise<string | null> {
  const cfg = configOrWarn();
  if (!cfg) return null;
  try {
    const res = await postForm(TOKEN_URL, {
      grant_type: 'authorization_code',
      code,
      client_id: cfg.clientId,
      client_secret: buildClientSecret(cfg),
    });
    const data = (await res.json().catch(() => ({}))) as { refresh_token?: string; error?: string };
    if (!res.ok || !data.refresh_token) {
      console.warn(`[siwa] token exchange failed: ${res.status} ${data.error ?? ''}`.trim());
      return null;
    }
    return encryptToken(data.refresh_token);
  } catch (e) {
    console.warn('[siwa] token exchange error:', e instanceof Error ? e.message : e);
    return null;
  }
}

/**
 * Revokes the stored (encrypted) refresh token at Apple. Returns true on success.
 * Never throws: account deletion must go ahead regardless.
 */
export async function revokeAppleToken(encrypted: string): Promise<boolean> {
  const cfg = configOrWarn();
  if (!cfg) return false;
  try {
    const res = await postForm(REVOKE_URL, {
      token: decryptToken(encrypted),
      token_type_hint: 'refresh_token',
      client_id: cfg.clientId,
      client_secret: buildClientSecret(cfg),
    });
    if (!res.ok) {
      console.warn(`[siwa] revoke failed: ${res.status}`);
      return false;
    }
    return true;
  } catch (e) {
    console.warn('[siwa] revoke error:', e instanceof Error ? e.message : e);
    return false;
  }
}

/** Call before deleting a user. Never throws. */
export async function revokeAppleForUser(user: { _id: unknown; appleId?: string; appleRefreshToken?: string | null }) {
  if (user.appleRefreshToken) {
    await revokeAppleToken(user.appleRefreshToken);
  } else if (user.appleId) {
    console.warn(`[siwa] user ${String(user._id)} signed in with Apple but has no stored refresh token; nothing to revoke`);
  }
}
