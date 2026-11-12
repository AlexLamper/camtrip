import type { App } from 'firebase-admin/app';
import { User } from './models';
import type { Types } from 'mongoose';

let app: App | null | undefined;

async function firebase(): Promise<App | null> {
  if (app !== undefined) return app;
  const raw = process.env.FIREBASE_SERVICE_ACCOUNT_JSON;
  if (!raw) {
    app = null; // push is optional; everything else works without it
    return app;
  }
  const { initializeApp, getApps, cert } = await import('firebase-admin/app');
  app = getApps()[0] ?? initializeApp({ credential: cert(JSON.parse(raw)) });
  return app;
}

export type PushMessage = { title: string; body: string; data?: Record<string, string> };

/** Sends to every device of the given users. Dead tokens are removed. */
export async function pushToUsers(userIds: Types.ObjectId[], msg: PushMessage, setting?: 'notifyNewPhotos' | 'notifyRecap') {
  const fb = await firebase();
  if (!fb || !userIds.length) return;
  const filter: Record<string, unknown> = { _id: { $in: userIds } };
  if (setting) filter[`settings.${setting}`] = { $ne: false };
  const users = await User.find(filter, { pushTokens: 1 }).lean();
  const tokens = users.flatMap((u) => (u.pushTokens ?? []).map((t) => t.token));
  if (!tokens.length) return;

  const { getMessaging } = await import('firebase-admin/messaging');
  const res = await getMessaging(fb).sendEachForMulticast({
    tokens,
    notification: { title: msg.title, body: msg.body },
    data: msg.data,
    apns: { payload: { aps: { sound: 'default' } } },
    android: { notification: { channelId: 'camtrip_default' } },
  });

  const dead = res.responses
    .map((r, i) => (!r.success && r.error?.code?.includes('registration-token-not-registered') ? tokens[i] : null))
    .filter((t): t is string => Boolean(t));
  if (dead.length) {
    await User.updateMany({ _id: { $in: userIds } }, { $pull: { pushTokens: { token: { $in: dead } } } });
  }
}
