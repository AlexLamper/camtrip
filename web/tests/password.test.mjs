// Run with `npm test` (node --experimental-strip-types --test).
import { test } from 'node:test';
import assert from 'node:assert/strict';
import {
  dummyPasswordHash,
  generateResetCode,
  hashPassword,
  hashResetCode,
  normalizeEmail,
  safeEqualHex,
  verifyPassword,
} from '../src/lib/password.ts';

test('hash and verify a password', async () => {
  const hash = await hashPassword('correct horse battery');
  assert.match(hash, /^scrypt\$16384\$8\$1\$[^$]+\$[^$]+$/);
  assert.equal(await verifyPassword('correct horse battery', hash), true);
  assert.equal(await verifyPassword('correct horse batterY', hash), false);
  assert.equal(await verifyPassword('', hash), false);
});

test('same password gets a different salt each time', async () => {
  const a = await hashPassword('wachtwoord123');
  const b = await hashPassword('wachtwoord123');
  assert.notEqual(a, b);
  assert.equal(await verifyPassword('wachtwoord123', a), true);
  assert.equal(await verifyPassword('wachtwoord123', b), true);
});

test('unicode is normalized', async () => {
  const hash = await hashPassword('café-geheim');
  assert.equal(await verifyPassword('café-geheim', hash), true);
});

test('broken or missing hashes never verify', async () => {
  for (const bad of [null, undefined, '', 'plain', 'scrypt$1$2$3', 'bcrypt$a$b$c$d$e', 'scrypt$16384$8$1$AAAA$']) {
    assert.equal(await verifyPassword('anything', bad), false);
  }
  assert.equal(await verifyPassword('anything', await dummyPasswordHash()), false);
});

test('email normalization', () => {
  assert.equal(normalizeEmail('  Alex@Example.COM '), 'alex@example.com');
});

test('reset codes are 6 digits and bound to a user', () => {
  for (let i = 0; i < 200; i++) assert.match(generateResetCode(), /^\d{6}$/);
  const h1 = hashResetCode('012345', 'user1', 'secret');
  assert.equal(safeEqualHex(h1, hashResetCode(' 012345 ', 'user1', 'secret')), true);
  assert.equal(safeEqualHex(h1, hashResetCode('012345', 'user2', 'secret')), false);
  assert.equal(safeEqualHex(h1, hashResetCode('012346', 'user1', 'secret')), false);
  assert.equal(safeEqualHex(h1, ''), false);
});
