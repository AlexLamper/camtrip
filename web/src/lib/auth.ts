import jwt from 'jsonwebtoken';
import { Types } from 'mongoose';
import { connectDB } from './db';
import { User, type UserDoc } from './models';
import { HttpError } from './http';

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
  return user;
}

export function isPro(user: Pick<UserDoc, 'proStore' | 'proExpiresAt'> | null | undefined): boolean {
  if (!user?.proStore) return false;
  if (!user.proExpiresAt) return true; // lifetime / non-expiring grant
  return new Date(user.proExpiresAt).getTime() > Date.now();
}

export function publicUser(user: UserDoc) {
  return {
    id: String(user._id),
    name: user.name,
    email: user.email,
    avatarColor: user.avatarColor,
    isPro: isPro(user),
    proExpiresAt: user.proExpiresAt ?? null,
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
