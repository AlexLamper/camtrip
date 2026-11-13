// Run with `npm test` (node --experimental-strip-types --test).
import { test } from 'node:test';
import assert from 'node:assert/strict';
import { createPublicKey, generateKeyPairSync } from 'node:crypto';
import jwt from 'jsonwebtoken';
import {
  buildClientSecret,
  decryptToken,
  encryptToken,
  normalizePrivateKeyPem,
  parsePrivateKey,
  siwaConfig,
  siwaStatus,
} from '../src/lib/siwa.ts';

const { privateKey } = generateKeyPairSync('ec', { namedCurve: 'P-256' });
const pem = privateKey.export({ type: 'pkcs8', format: 'pem' }).toString();
const publicKey = createPublicKey(privateKey);

test('client secret is an ES256 JWT with the claims Apple wants', () => {
  const cfg = { keyId: 'ABC123DEFG', teamId: '4K4D59MXKW', clientId: 'app.camtrip.camtrip', privateKey: parsePrivateKey(pem) };
  const now = Date.now();
  const token = buildClientSecret(cfg, { now });
  const decoded = jwt.verify(token, publicKey, { algorithms: ['ES256'], audience: 'https://appleid.apple.com', complete: true });
  assert.equal(decoded.header.alg, 'ES256');
  assert.equal(decoded.header.kid, 'ABC123DEFG');
  assert.equal(decoded.payload.iss, '4K4D59MXKW');
  assert.equal(decoded.payload.sub, 'app.camtrip.camtrip');
  assert.equal(decoded.payload.aud, 'https://appleid.apple.com');
  assert.equal(decoded.payload.iat, Math.floor(now / 1000));
  assert.ok(decoded.payload.exp > decoded.payload.iat);

  // Never longer than Apple's 6-month limit.
  const long = jwt.decode(buildClientSecret(cfg, { ttlSeconds: 400 * 86400 }));
  assert.ok(long.exp - long.iat <= 15777000);
});

test('private key is accepted raw, with \\n escapes, base64 PEM, or base64 body', () => {
  const escaped = pem.trim().replace(/\n/g, '\\n');
  const b64pem = Buffer.from(pem).toString('base64');
  const body = pem.replace(/-----[^-]+-----/g, '').replace(/\s+/g, '');
  for (const variant of [pem, escaped, `"${escaped}"`, b64pem, body]) {
    const key = parsePrivateKey(variant);
    assert.equal(key.asymmetricKeyType, 'ec');
    assert.match(normalizePrivateKeyPem(variant), /^-----BEGIN PRIVATE KEY-----\n/);
  }
  assert.throws(() => parsePrivateKey('not a key'));
});

test('siwaConfig / siwaStatus report missing or ok', () => {
  assert.equal(siwaStatus({}), 'missing');
  assert.equal(siwaStatus({ APPLE_SIWA_KEY_ID: 'K', APPLE_SIWA_KEY_P8: 'garbage', APPLE_TEAM_ID: 'T' }), 'missing');
  const env = { APPLE_SIWA_KEY_ID: 'K', APPLE_SIWA_KEY_P8: pem.replace(/\n/g, '\\n'), APPLE_TEAM_ID: '4K4D59MXKW' };
  assert.equal(siwaStatus(env), 'ok');
  assert.equal(siwaConfig(env).clientId, 'app.camtrip.camtrip');
  assert.equal(siwaConfig({ ...env, APPLE_CLIENT_ID: 'other.id' }).clientId, 'other.id');
});

test('refresh token encryption round-trips and detects tampering', () => {
  const env = { JWT_SECRET: 'test-secret-'.repeat(4) };
  const enc = encryptToken('r.refresh-token-value', env);
  assert.match(enc, /^v1\./);
  assert.ok(!enc.includes('refresh-token-value'));
  assert.notEqual(encryptToken('r.refresh-token-value', env), enc); // random IV
  assert.equal(decryptToken(enc, env), 'r.refresh-token-value');

  // A dedicated key takes precedence over JWT_SECRET.
  const dedicated = { ...env, APPLE_TOKEN_ENC_KEY: 'another-key' };
  const enc2 = encryptToken('abc', dedicated);
  assert.equal(decryptToken(enc2, dedicated), 'abc');
  assert.throws(() => decryptToken(enc2, env));

  const raw = Buffer.from(enc.slice(3), 'base64url');
  raw[raw.length - 1] ^= 1;
  assert.throws(() => decryptToken(`v1.${raw.toString('base64url')}`, env));
  assert.throws(() => encryptToken('x', {}));
});
