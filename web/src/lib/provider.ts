// Pure rules for Apple / Google sign-in. No runtime imports, so this file also
// runs as-is under `node --experimental-strip-types` for the tests.

export type ProviderIdentity = { sub: string; email: string; emailVerified: boolean; name: string };

/** What a verified Google ID token tells us. Google only vouches for the address when email_verified is true. */
export function googleIdentity(payload: {
  sub?: string;
  email?: string | null;
  email_verified?: boolean | string | null;
  given_name?: string | null;
  name?: string | null;
}): ProviderIdentity {
  const email = (payload.email ?? '').trim().toLowerCase();
  return {
    sub: payload.sub ?? '',
    email,
    emailVerified: Boolean(email) && (payload.email_verified === true || payload.email_verified === 'true'),
    name: payload.given_name ?? payload.name ?? '',
  };
}

/** Fields of a brand-new Apple/Google account: the address counts as verified only when the provider says so. */
export function newProviderAccount(email: string, emailVerified: boolean) {
  const e = email.trim().toLowerCase();
  return { email: e, emailVerified: Boolean(e && emailVerified) };
}

/**
 * Linking an Apple/Google sign-in to an existing e-mail + password account with
 * the same address. Only when the provider verified the address. If the
 * password account never proved it owns the address, its password is dropped:
 * otherwise someone could register a victim's address first and keep a way in.
 */
export function linkPlan(
  providerEmailVerified: boolean,
  account: { emailVerified?: boolean | null },
): 'none' | 'link' | 'link_drop_password' {
  if (!providerEmailVerified) return 'none';
  return account.emailVerified ? 'link' : 'link_drop_password';
}
