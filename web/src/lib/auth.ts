import jwt from 'jsonwebtoken';
import { Types } from 'mongoose';
import { connectDB } from './db';
import { User, type UserDoc } from './models';
import { HttpError, json } from './http';
import { normalizeEmail } from './password';
import { isBootstrapAdmin, parseAdminEmails, userPro } from './entitlements';
import { linkPlan, newProviderAccount } from './provider';

const SESSION_DAYS = 180;

function secret(): string {
  const s = process.env.JWT_SECRET;
  if (!s) throw new Error('JWT_SECRET is not set');
  return s;
}

export function signSession(userId: string): string {
  return jwt.sign({ userId }, secret(), { expiresIn: `${SESSION_DAYS}d` });
}

export function verifySession(token: string): string | null {
  try {
    const payload = jwt.verify(token, secret()) as { userId?: string };
    return payload.userId && Types.ObjectId.isValid(payload.userId) ? payload.userId : null;
  } catch {
    return null;
  }
}

/** Resolves the signed-in user from the `Authorization: Bearer` header, or throws 401. */
export async function requireUser(req: Request): Promise<UserDoc> {
  const header = req.headers.get('authorization') ?? '';
  const token = header.startsWith('Bearer ') ? header.slice(7) : '';
  const userId = token ? verifySession(token) : null;
  if (!userId) throw new HttpError(401, 'Niet ingelogd');
  await connectDB();
  const user = await User.findById(userId).lean<UserDoc>();
  if (!user) throw new HttpError(401, 'Account bestaat niet meer');
  assertNotBanned(user);
  return user;
}

export const BANNED_MESSAGE = 'Je account is geblokkeerd. Neem contact op met support@camtrip.app als je denkt dat dit niet klopt.';

/** Banned accounts (by an admin in "Beheer") cannot sign in or use the API. */
export function assertNotBanned(user: Pick<UserDoc, 'banned'>) {
  if (user.banned) throw new HttpError(403, BANNED_MESSAGE, 'account_banned');
}

/**
 * Promotes the account to app admin when its verified e-mail is listed in
 * ADMIN_EMAILS. Runs on every sign-in and /me fetch. Never demotes: admins
 * set directly in the database stay admin.
 */
export async function syncAdminRole(user: UserDoc): Promise<UserDoc> {
  if (user.role === 'admin') return user;
  if (!isBootstrapAdmin(user, parseAdminEmails(process.env.ADMIN_EMAILS))) return user;
  await User.updateOne({ _id: user._id }, { $set: { role: 'admin' } });
  return { ...user, role: 'admin' };
}


export function publicUser(user: UserDoc) {
  const pro = userPro(user);
  return {
    id: String(user._id),
    name: user.name,
    email: user.email,
    hasPassword: Boolean(user.passwordHash),
    avatarColor: user.avatarColor,
    isPro: pro.isPro,
    // 'subscription' | 'gift' | 'admin' | null. Group Pro is per group (see serializeGroup).
    proSource: pro.reason,
    // When personal Pro ends; null = no end date (lifetime gift, admin) or no Pro.
    proUntil: pro.until,
    proExpiresAt: user.proExpiresAt ?? null,
    role: user.role === 'admin' ? 'admin' : 'user',
    settings: {
      notifyNewPhotos: user.settings?.notifyNewPhotos ?? true,
      notifyRecap: user.settings?.notifyRecap ?? true,
    },
    blockedUserIds: (user.blockedUserIds ?? []).map(String),
  };
}

const AVATAR_COLORS = ['#d9472b', '#e8642c', '#3d7ea6', '#8a5cc2', '#2f9e6a', '#d1435b', '#c9a227', '#2f6db5'];
export function randomAvatarColor(): string {
  return AVATAR_COLORS[Math.floor(Math.random() * AVATAR_COLORS.length)];
}

/** The response every sign-in endpoint returns: our own session token + the user. */
export async function sessionResponse(user: UserDoc, extra: Record<string, unknown> = {}) {
  assertNotBanned(user);
  const u = await syncAdminRole(user);
  return json({ token: signSession(String(u._id)), user: publicUser(u), ...extra });
}

/**
 * Finds or creates the user for an Apple / Google sign-in. When the provider
 * vouches for the address (verified e-mail) and an e-mail + password account
 * with that address exists, the provider is linked to that account instead of
 * creating a second one. If that account never proved it owns the address,
 * its password is dropped: otherwise someone could register a victim's
 * address first and keep a way into the victim's account after linking.
 */
export async function signInWithProvider(input: {
  provider: 'appleId' | 'googleId';
  sub: string;
  email?: string | null;
  emailVerified: boolean;
  name?: string;
}): Promise<{ user: UserDoc; created: boolean }> {
  const email = input.email ? normalizeEmail(input.email) : '';
  const existing = await User.findOne({ [input.provider]: input.sub });
  if (existing) {
    if (email && input.emailVerified && !existing.emailVerified && existing.email === email && !existing.passwordHash) {
      existing.emailVerified = true;
      await existing.save();
    }
    return { user: existing.toObject(), created: false };
  }

  if (email && input.emailVerified) {
    const account = await User.findOne({ email, passwordHash: { $type: 'string' }, [input.provider]: { $exists: false } });
    const plan = account ? linkPlan(input.emailVerified, account) : 'none';
    if (account && plan !== 'none') {
      account.set(input.provider, input.sub);
      if (plan === 'link_drop_password') {
        account.set('passwordHash', undefined);
        account.emailVerified = true;
      }
      await account.save();
      return { user: account.toObject(), created: false };
    }
  }

  const created = await User.create({
    [input.provider]: input.sub,
    ...newProviderAccount(email, input.emailVerified),
    name: input.name || 'Fotograaf',
    avatarColor: randomAvatarColor(),
  });
  return { user: created.toObject(), created: true };
}
