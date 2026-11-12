import { z } from 'zod';
import { Types } from 'mongoose';
import { User, type UserDoc } from '@/lib/models';
import { handler, json } from '@/lib/http';
import { adminUserRow, containsRegex, paged, parseQuery, requireAdmin } from '@/lib/admin';

/**
 * GET ?q=&page=&limit=&filter=all|gift|admin|banned
 * Searches by name or e-mail (contains, case-insensitive) or exact user id.
 * Newest accounts first.
 */
export const GET = handler(async (req) => {
  await requireAdmin(req);
  const query = parseQuery(req, {
    q: z.string().trim().max(100).default(''),
    filter: z.enum(['all', 'gift', 'admin', 'banned']).default('all'),
  });

  const and: Record<string, unknown>[] = [];
  if (query.q) {
    const rx = containsRegex(query.q);
    const or: Record<string, unknown>[] = [{ name: rx }, { email: rx }];
    if (Types.ObjectId.isValid(query.q) && query.q.length === 24) or.push({ _id: new Types.ObjectId(query.q) });
    and.push({ $or: or });
  }
  if (query.filter === 'gift') and.push({ proGrant: { $ne: null } });
  if (query.filter === 'admin') and.push({ role: 'admin' });
  if (query.filter === 'banned') and.push({ banned: true });
  const filter = and.length ? { $and: and } : {};

  const projection = { passwordHash: 0, resetCodeHash: 0, pushTokens: 0, blockedUserIds: 0 };
  const [users, total] = await Promise.all([
    User.find(filter, projection)
      .sort({ createdAt: -1, _id: -1 })
      .skip((query.page - 1) * query.limit)
      .limit(query.limit)
      .lean<UserDoc[]>(),
    User.countDocuments(filter),
  ]);
  return json(paged(users.map(adminUserRow), query, total));
});
