import { z } from 'zod';

/**
 * "Alle foto's": the pure parts of GET /api/mobile/me/photos (query
 * validation, cursor, Mongo filter, paging), kept free of models/storage so
 * they can be tested without a database.
 */

export const MY_PHOTOS_DEFAULT_LIMIT = 60;
export const MY_PHOTOS_MAX_LIMIT = 120;

const OBJECT_ID = /^[a-f0-9]{24}$/i;

/** Cursor = "<takenAt ISO>_<photo id>" of the last item of the previous page. */
export function encodeCursor(takenAt: Date | string, id: string): string {
  return `${new Date(takenAt).toISOString()}_${id}`;
}

export function decodeCursor(cursor: string): { before: Date; beforeId: string } | null {
  const i = cursor.lastIndexOf('_');
  if (i <= 0) return null;
  const before = new Date(cursor.slice(0, i));
  const beforeId = cursor.slice(i + 1);
  if (Number.isNaN(before.getTime()) || !OBJECT_ID.test(beforeId)) return null;
  return { before, beforeId };
}

export const MyPhotosQuery = z.object({
  cursor: z
    .string()
    .max(80)
    .refine((c) => decodeCursor(c) !== null, 'Ongeldige cursor')
    .optional(),
  limit: z.coerce.number().int().min(1).max(MY_PHOTOS_MAX_LIMIT).default(MY_PHOTOS_DEFAULT_LIMIT),
});
export type MyPhotosQuery = z.infer<typeof MyPhotosQuery>;

/** Reads ?cursor=&limit= (empty values count as absent). Throws a ZodError when invalid. */
export function parseMyPhotosQuery(params: URLSearchParams): MyPhotosQuery {
  const raw: Record<string, string> = {};
  for (const k of ['cursor', 'limit']) {
    const v = params.get(k);
    if (v != null && v !== '') raw[k] = v;
  }
  return MyPhotosQuery.parse(raw);
}

/**
 * Own, finished photos and videos in the given groups (the ones the user is
 * still a member of, their personal roll included), minus the ones they hid for themselves, older than the
 * cursor. Sort with MY_PHOTOS_SORT; served by the (userId, takenAt, _id) index.
 * [oid] turns an id string into an ObjectId (injected to keep this pure).
 */
export function buildMyPhotosFilter<Id>(
  opts: { userId: Id; groupIds: Id[]; hiddenIds?: Id[]; cursor?: string },
  oid: (s: string) => Id,
): Record<string, unknown> {
  const and: Record<string, unknown>[] = [{ userId: opts.userId, status: 'ready', groupId: { $in: opts.groupIds } }];
  if (opts.hiddenIds?.length) and.push({ _id: { $nin: opts.hiddenIds } });
  if (opts.cursor) {
    const c = decodeCursor(opts.cursor);
    if (c) {
      and.push({ $or: [{ takenAt: { $lt: c.before } }, { takenAt: c.before, _id: { $lt: oid(c.beforeId) } }] });
    }
  }
  return { $and: and };
}

export const MY_PHOTOS_SORT = { takenAt: -1, _id: -1 } as const;

/** Rows are fetched with limit + 1; the extra one only says there is more. */
export function pageOf<T extends { _id: unknown; takenAt: Date | string }>(rows: T[], limit: number) {
  const page = rows.slice(0, limit);
  const last = page[page.length - 1];
  return { page, nextCursor: rows.length > limit && last ? encodeCursor(last.takenAt, String(last._id)) : null };
}

/**
 * A serialized group photo plus the name of its group ("Mallorca"), and
 * whether that group is the user's personal roll ("Mijn rolletje"; the app
 * shows its own localized label for it).
 */
export function withGroupName<T extends { groupId: string }>(
  photo: T,
  groupNames: Map<string, string>,
  personalGroupIds: Set<string> = new Set(),
): T & { groupName: string; groupPersonal: boolean } {
  return { ...photo, groupName: groupNames.get(photo.groupId) ?? '', groupPersonal: personalGroupIds.has(photo.groupId) };
}
