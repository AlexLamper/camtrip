import { Group, Photo, Report, User } from '@/lib/models';
import { handler, json } from '@/lib/http';
import { requireAdmin } from '@/lib/admin';
import { NOT_PERSONAL } from '@/lib/personal-roll';

/** GET -> numbers for the "Beheer" overview. */
export const GET = handler(async (req) => {
  await requireAdmin(req);
  const now = new Date();
  const weekAgo = new Date(now.getTime() - 7 * 86_400_000);
  const activeSub = { proStore: true, $or: [{ proExpiresAt: null }, { proExpiresAt: { $gt: now } }] };
  const activeGift = { proGrant: { $ne: null }, $or: [{ 'proGrant.until': null }, { 'proGrant.until': { $gt: now } }] };

  const [users, newThisWeek, groups, photos, videos, subscription, gift, giftOnly, admins, banned, openReports] = await Promise.all([
    User.countDocuments({}),
    User.countDocuments({ createdAt: { $gte: weekAgo } }),
    Group.countDocuments({ ...NOT_PERSONAL }),
    Photo.countDocuments({ status: 'ready', kind: { $ne: 'video' } }),
    Photo.countDocuments({ status: 'ready', kind: 'video' }),
    User.countDocuments({ ...activeSub, banned: { $ne: true } }),
    User.countDocuments({ ...activeGift, banned: { $ne: true } }),
    // Gift without a running subscription: the people who really use Pro for free.
    User.countDocuments({ $and: [activeGift, { $nor: [activeSub] }], banned: { $ne: true } }),
    User.countDocuments({ role: 'admin' }),
    User.countDocuments({ banned: true }),
    Report.countDocuments({ status: 'open' }),
  ]);

  return json({
    users: { total: users, newThisWeek, admins, banned },
    groups,
    photos,
    videos,
    pro: { subscription, gift, giftOnly },
    openReports,
  });
});
