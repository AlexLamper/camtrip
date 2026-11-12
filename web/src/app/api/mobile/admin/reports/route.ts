import { z } from 'zod';
import { Group, Photo, Report, User, type GroupDoc, type PhotoDoc, type ReportDoc, type UserDoc } from '@/lib/models';
import { handler, json } from '@/lib/http';
import { paged, parseQuery, requireAdmin } from '@/lib/admin';
import { readUrl } from '@/lib/storage';

/** GET ?status=open|handled&page=&limit= -> photo reports, newest first, with thumbnail and people. */
export const GET = handler(async (req) => {
  await requireAdmin(req);
  const query = parseQuery(req, { status: z.enum(['open', 'handled']).default('open') });
  const filter = { status: query.status };
  const [reports, total] = await Promise.all([
    Report.find(filter)
      .sort({ createdAt: -1, _id: -1 })
      .skip((query.page - 1) * query.limit)
      .limit(query.limit)
      .lean<ReportDoc[]>(),
    Report.countDocuments(filter),
  ]);

  const userIds = reports.flatMap((r) => [r.reporterId, r.photoUserId].filter(Boolean));
  const [users, photos, groups, perPhoto] = await Promise.all([
    User.find({ _id: { $in: userIds } }, { name: 1, email: 1, banned: 1, avatarColor: 1 }).lean<UserDoc[]>(),
    Photo.find({ _id: { $in: reports.map((r) => r.photoId) } }, { thumbKey: 1, displayKey: 1, kind: 1, userId: 1 }).lean<PhotoDoc[]>(),
    Group.find({ _id: { $in: reports.map((r) => r.groupId) } }, { name: 1 }).lean<GroupDoc[]>(),
    Report.aggregate<{ _id: unknown; n: number }>([
      { $match: { photoId: { $in: reports.map((r) => r.photoId) }, status: 'open' } },
      { $group: { _id: '$photoId', n: { $sum: 1 } } },
    ]),
  ]);
  const userById = new Map(users.map((u) => [String(u._id), u]));
  const photoById = new Map(photos.map((p) => [String(p._id), p]));
  const groupById = new Map(groups.map((g) => [String(g._id), g]));
  const countByPhoto = new Map(perPhoto.map((c) => [String(c._id), c.n]));
  const person = (id: unknown) => {
    if (!id) return null;
    const u = userById.get(String(id));
    return { id: String(id), name: u?.name || 'Verwijderd account', email: u?.email ?? '', banned: Boolean(u?.banned) };
  };

  const items = await Promise.all(
    reports.map(async (r) => {
      const photo = photoById.get(String(r.photoId));
      return {
        id: String(r._id),
        status: r.status,
        resolution: r.resolution ?? null,
        reason: r.reason,
        note: r.note ?? '',
        createdAt: r.createdAt ?? null,
        handledAt: r.handledAt ?? null,
        photo: photo
          ? {
              id: String(photo._id),
              kind: photo.kind,
              thumbUrl: await readUrl(photo.thumbKey),
              displayUrl: await readUrl(photo.displayKey),
            }
          : null, // already removed
        openReportsOnPhoto: countByPhoto.get(String(r.photoId)) ?? 0,
        group: { id: String(r.groupId), name: groupById.get(String(r.groupId))?.name ?? 'Verwijderde groep' },
        reporter: person(r.reporterId),
        photoUser: person(r.photoUserId ?? photo?.userId),
      };
    }),
  );
  return json(paged(items, query, total));
});
