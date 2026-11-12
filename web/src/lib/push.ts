import { connect, type ClientHttp2Session } from 'node:http2';
import { createSign } from 'node:crypto';
import type { Types } from 'mongoose';
import { User } from './models';

/**
 * Push notifications straight to Apple (APNs), no third party in between.
 * Needs an APNs auth key (.p8) from the Apple Developer account:
 *   APNS_KEY_ID, APNS_TEAM_ID, APNS_KEY_P8 (the key file contents), APNS_BUNDLE_ID.
 * Without them push is simply off; everything else keeps working.
 */

type Jwt = { token: string; issuedAt: number };
let cachedJwt: Jwt | null = null;

function b64url(input: Buffer | string) {
  return Buffer.from(input).toString('base64').replace(/=+$/, '').replace(/\+/g, '-').replace(/\//g, '_');
}

function apnsJwt(): string | null {
  const keyId = process.env.APNS_KEY_ID;
  const teamId = process.env.APNS_TEAM_ID;
  const p8 = process.env.APNS_KEY_P8?.replace(/\\n/g, '\n');
  if (!keyId || !teamId || !p8) return null;
  // Apple wants the token refreshed at most every 20-60 minutes.
  if (cachedJwt && Date.now() - cachedJwt.issuedAt < 40 * 60 * 1000) return cachedJwt.token;
  const iat = Math.floor(Date.now() / 1000);
  const header = b64url(JSON.stringify({ alg: 'ES256', kid: keyId }));
  const claims = b64url(JSON.stringify({ iss: teamId, iat }));
  const signer = createSign('SHA256');
  signer.update(`${header}.${claims}`);
  const sig = signer.sign({ key: p8, dsaEncoding: 'ieee-p1363' });
  cachedJwt = { token: `${header}.${claims}.${b64url(sig)}`, issuedAt: Date.now() };
  return cachedJwt.token;
}

function sendOne(session: ClientHttp2Session, deviceToken: string, jwt: string, payload: object): Promise<{ status: number; reason?: string }> {
  return new Promise((resolve) => {
    const req = session.request({
      ':method': 'POST',
      ':path': `/3/device/${deviceToken}`,
      authorization: `bearer ${jwt}`,
      'apns-topic': process.env.APNS_BUNDLE_ID ?? 'app.camtrip.camtrip',
      'apns-push-type': 'alert',
      'apns-priority': '10',
      'content-type': 'application/json',
    });
    let status = 0;
    let body = '';
    req.on('response', (h) => (status = Number(h[':status'])));
    req.on('data', (c) => (body += c));
    req.on('end', () => {
      let reason: string | undefined;
      try {
        reason = body ? (JSON.parse(body) as { reason?: string }).reason : undefined;
      } catch {}
      resolve({ status, reason });
    });
    req.on('error', () => resolve({ status: 0 }));
    req.end(JSON.stringify(payload));
  });
}

export type PushMessage = { title: string; body: string; data?: Record<string, string> };

/** Sends to every iOS device of the given users. Dead tokens are removed. */
export async function pushToUsers(userIds: Types.ObjectId[], msg: PushMessage, setting?: 'notifyNewPhotos' | 'notifyRecap') {
  const jwt = apnsJwt();
  if (!jwt || !userIds.length) return;
  const filter: Record<string, unknown> = { _id: { $in: userIds } };
  if (setting) filter[`settings.${setting}`] = { $ne: false };
  const users = await User.find(filter, { pushTokens: 1 }).lean();
  const tokens = users.flatMap((u) => (u.pushTokens ?? []).filter((t) => t.platform === 'ios').map((t) => t.token));
  if (!tokens.length) return;

  const host = process.env.APNS_SANDBOX === '1' ? 'https://api.sandbox.push.apple.com' : 'https://api.push.apple.com';
  const session = connect(host);
  session.on('error', () => {});
  const payload = { aps: { alert: { title: msg.title, body: msg.body }, sound: 'default' }, ...msg.data };
  try {
    const results = await Promise.all(tokens.map((t) => sendOne(session, t, jwt, payload)));
    const dead = tokens.filter((_, i) => results[i].status === 410 || results[i].reason === 'BadDeviceToken' || results[i].reason === 'Unregistered');
    if (dead.length) {
      await User.updateMany({ _id: { $in: userIds } }, { $pull: { pushTokens: { token: { $in: dead } } } });
    }
  } finally {
    session.close();
  }
}
