// Run with `npm test` (node --experimental-strip-types --test).
// Password reset by push, admin bootstrap via Google, report alerts and
// account-deletion cleanup (the pure parts; routes wire these to Mongo).
import { test } from 'node:test';
import assert from 'node:assert/strict';
import { adminRecipientsFilter, isBootstrapAdmin, parseAdminEmails } from '../src/lib/entitlements.ts';
import { googleIdentity, linkPlan, newProviderAccount } from '../src/lib/provider.ts';
import {
  newMediaNotice,
  PUSH_LOCALES,
  pushLocale,
  pushTexts,
  recapNotice,
  reportNotice,
  resetCodeNotice,
} from '../src/lib/push-i18n.ts';
import { attemptKeyPattern, groupTraceUpdate } from '../src/lib/cleanup.ts';

const ADMINS = parseAdminEmails('aplamper06@gmail.com');

test('Google sign-in with aplamper06@gmail.com becomes admin', () => {
  const id = googleIdentity({ sub: 'g-1', email: 'Aplamper06@Gmail.com', email_verified: true, given_name: 'Alex' });
  assert.deepEqual(id, { sub: 'g-1', email: 'aplamper06@gmail.com', emailVerified: true, name: 'Alex' });
  const account = newProviderAccount(id.email, id.emailVerified);
  assert.equal(account.emailVerified, true);
  assert.equal(isBootstrapAdmin(account, ADMINS), true);
});

test('an unverified Google address never becomes admin', () => {
  for (const email_verified of [false, undefined, null, 'false']) {
    const id = googleIdentity({ sub: 'g-2', email: 'aplamper06@gmail.com', email_verified });
    assert.equal(id.emailVerified, false);
    assert.equal(isBootstrapAdmin(newProviderAccount(id.email, id.emailVerified), ADMINS), false);
  }
  // An e-mail + password account that registered the address is not verified.
  assert.equal(isBootstrapAdmin({ email: 'aplamper06@gmail.com', emailVerified: false }, ADMINS), false);
  assert.equal(isBootstrapAdmin({ email: 'someone@gmail.com', emailVerified: true }, ADMINS), false);
});

test('Apple/Google sign-in links an e-mail + password account with the same verified address', () => {
  assert.equal(linkPlan(true, { emailVerified: true }), 'link');
  // Never proved the address: link, but drop the password (pre-registration hijack).
  assert.equal(linkPlan(true, { emailVerified: false }), 'link_drop_password');
  assert.equal(linkPlan(true, {}), 'link_drop_password');
  // The provider did not verify the address: no linking at all.
  assert.equal(linkPlan(false, { emailVerified: true }), 'none');
});

test('reset code push text (Dutch and English fallback)', () => {
  const n = resetCodeNotice('nl', '012345');
  assert.equal(n.body, 'Je CamTrip-code: 012345 - geldig voor 15 minuten. Niet aangevraagd? Negeer dit bericht.');
  assert.deepEqual(n.data, { type: 'reset_code' });
  assert.equal(resetCodeNotice('', '012345').body, "Your CamTrip code: 012345 - valid for 15 minutes. Didn't ask for it? Ignore this message.");
  assert.equal(resetCodeNotice('xx', '1').body, resetCodeNotice('en', '1').body);
});

test('push locale mapping', () => {
  assert.equal(pushLocale('nl'), 'nl');
  assert.equal(pushLocale('nl_NL'), 'nl');
  assert.equal(pushLocale('pt-BR'), 'pt_BR');
  assert.equal(pushLocale('pt_BR'), 'pt_BR');
  assert.equal(pushLocale('pt-PT'), 'pt');
  assert.equal(pushLocale('pt'), 'pt');
  assert.equal(pushLocale('no'), 'nb');
  assert.equal(pushLocale('nb-NO'), 'nb');
  assert.equal(pushLocale('zh-Hans-CN'), 'zh');
  assert.equal(pushLocale('EN_us'), 'en');
  assert.equal(pushLocale('ru'), 'ru');
  assert.equal(pushLocale('ru_RU'), 'ru');
  assert.equal(pushLocale('zh_Hant'), 'zh_Hant');
  assert.equal(pushLocale('zh-Hant-TW'), 'zh_Hant');
  assert.equal(pushLocale('zh-TW'), 'zh_Hant');
  assert.equal(pushLocale('zh-HK'), 'zh_Hant');
  assert.equal(pushLocale('zh-Hans-HK'), 'zh');
  assert.equal(pushLocale('iw'), 'he');
  assert.equal(pushLocale('in_ID'), 'id');
  assert.equal(pushLocale('tl'), 'fil');
  assert.equal(pushLocale('fil_PH'), 'fil');
  assert.equal(pushLocale('ar_EG'), 'ar');
  assert.equal(pushLocale('sw'), 'en');
  assert.equal(pushLocale(null), 'en');
});

test('every language has every push text, with the values filled in and no long dashes', () => {
  assert.equal(PUSH_LOCALES.length, 40);
  for (const l of PUSH_LOCALES) {
    assert.equal(pushLocale(l), l);
    const t = pushTexts(l);
    const texts = [
      newMediaNotice(l, 'Sanne', 'Ibiza', 'photo', 'g1').body,
      newMediaNotice(l, 'Sanne', 'Ibiza', 'video', 'g1').body,
      recapNotice(l, 'Ibiza', 42, 'g1').title,
      recapNotice(l, 'Ibiza', 42, 'g1').body,
      resetCodeNotice(l, '012345').body,
      reportNotice(l, 'spam', 'Ibiza', 'r1').body,
    ];
    assert.ok(texts[0].includes('Sanne') && texts[0].includes('Ibiza'), l);
    assert.notEqual(texts[0], texts[1], l);
    assert.ok(texts[2].includes('Ibiza') && texts[3].includes('42'), l);
    assert.ok(texts[4].includes('012345') && texts[4].includes('15'), l);
    assert.ok(texts[5].includes(t.reasons.spam) && texts[5].includes('Ibiza'), l);
    for (const s of [...texts, t.reportTitle, t.someone, ...Object.values(t.reasons)]) {
      assert.ok(s && !/[\u2013\u2014]/.test(s), `${l}: ${s}`);
    }
    assert.ok(newMediaNotice(l, '  ', 'Ibiza', 'photo', 'g1').body.includes(t.someone), l);
  }
});

test('report alert goes to role admin and verified ADMIN_EMAILS', () => {
  const n = reportNotice('nl', 'ongepast', 'Ibiza 2026', 'r1');
  assert.equal(n.title, 'Beheer');
  assert.equal(n.body, 'Nieuwe melding: Ongepast of aanstootgevend in Ibiza 2026');
  assert.deepEqual(n.data, { type: 'report', reportId: 'r1' });
  assert.equal(reportNotice('en', 'spam', 'Ibiza 2026', 'r1').body, 'New report: Spam in Ibiza 2026');
  assert.deepEqual(adminRecipientsFilter(ADMINS), {
    $or: [{ role: 'admin' }, { email: { $in: ['aplamper06@gmail.com'] }, emailVerified: true }],
    banned: { $ne: true },
  });
  assert.deepEqual(adminRecipientsFilter(new Set()), { $or: [{ role: 'admin' }], banned: { $ne: true } });
});

test('account deletion removes only this address from the rate-limit records', () => {
  const re = attemptKeyPattern(' Alex@Example.nl ');
  for (const key of ['login:alex@example.nl:1.2.3.4', 'reset:alex@example.nl:::1', 'forgot:alex@example.nl', 'forgot:alex@example.nl:unknown']) {
    assert.equal(re.test(key), true, key);
  }
  for (const key of ['login:malex@example.nl:1.2.3.4', 'login:alex@example.nl.com:1.2.3.4', 'login:alex@exampleXnl:1.2.3.4', 'register:1.2.3.4']) {
    assert.equal(re.test(key), false, key);
  }
  assert.equal(attemptKeyPattern(''), null);
});

test('account deletion clears archive flags and notify bookkeeping in groups', () => {
  assert.deepEqual(groupTraceUpdate('u1'), { $pull: { archivedBy: 'u1' }, $unset: { 'lastNotified.u1': '' } });
});
