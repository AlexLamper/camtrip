import { Types } from 'mongoose';
import { Group, HiddenPhoto, Photo, Report, type GroupDoc, type PhotoDoc, type UserDoc } from './models';
import { memberRole } from './groups';
import { deleteKeys, readUrl } from './storage';

/**
 * Extra photo filter for what a viewer must not see: photos of people they
 * blocked and photos they reported (App Store guideline 1.2). With a groupId,
 * photos the viewer hid for themselves ("Verbergen voor mij") in that group
 * are left out too, unless `includeHidden` is set (the "Verborgen foto's" view).
 */
export async function hiddenForViewer(
  viewer: Pick<UserDoc, '_id' | 'blockedUserIds'>,
  groupId?: Types.ObjectId | string,
  opts: { includeHidden?: boolean } = {},
): Promise<Record<string, unknown>> {
  const filter: Record<string, unknown> = {};
  const blocked = viewer.blockedUserIds ?? [];
  if (blocked.length) filter.userId = { $nin: blocked };
  const reported = await Report.find({ reporterId: viewer._id }, { photoId: 1 }).lean();
  const excluded: Types.ObjectId[] = reported.map((r) => r.photoId);
  if (groupId && !opts.includeHidden) excluded.push(...(await hiddenPhotoIds(viewer._id, groupId)));
  if (excluded.length) filter._id = { $nin: excluded };
  return filter;
}

/** Photo ids this user hid for themselves in a group. */
export async function hiddenPhotoIds(userId: Types.ObjectId | string, groupId: Types.ObjectId | string): Promise<Types.ObjectId[]> {
  const rows = await HiddenPhoto.find({ userId, groupId }, { photoId: 1 }).lean();
  return rows.map((r) => r.photoId);
}

/** Who may delete a photo: the photographer, or an admin (the owner is always an admin). */
export function canDeletePhoto(photo: Pick<PhotoDoc, 'userId'>, group: GroupDoc, userId: Types.ObjectId | string): boolean {
  return String(photo.userId) === String(userId) || memberRole(group, userId) === 'admin';
}

/** Parses a list of id strings, dropping invalid and duplicate ones. */
export function toObjectIds(ids: string[]): Types.ObjectId[] {
  const seen = new Set<string>();
  const out: Types.ObjectId[] = [];
  for (const id of ids) {
    if (!Types.ObjectId.isValid(id) || seen.has(id)) continue;
    seen.add(id);
    out.push(new Types.ObjectId(id));
  }
  return out;
}

type DeletablePhoto = Pick<PhotoDoc, '_id' | 'kind' | 'status' | 'originalKey' | 'displayKey' | 'thumbKey'>;

/**
 * Permanently removes photos of one group: the R2 objects (original, display
 * and thumbnail) first, then the database rows, then the group's counters.
 * Storage goes first so a failure leaves everything as it was (the client can
 * retry) instead of leaving orphaned files nobody can reach. The device album
 * ("CamTrip - <groep>") on people's phones is never touched.
 * When the cover is among them, the newest remaining photo becomes the cover.
 */
export async function deletePhotos(group: GroupDoc, photos: DeletablePhoto[]): Promise<void> {
  if (!photos.length) return;
  await deleteKeys(photos.flatMap((p) => [p.originalKey, p.displayKey, p.thumbKey]));
  const ids = photos.map((p) => p._id);
  await Photo.deleteMany({ _id: { $in: ids }, groupId: group._id });
  await HiddenPhoto.deleteMany({ photoId: { $in: ids } });

  // Recount instead of decrementing: exact even when two phones delete the
  // same photo at once, or a pending (never counted) upload is removed.
  const [photoCount, videoCount] = await Promise.all([
    Photo.countDocuments({ groupId: group._id, status: 'ready', kind: { $ne: 'video' } }),
    Photo.countDocuments({ groupId: group._id, status: 'ready', kind: 'video' }),
  ]);
  const $set: Record<string, unknown> = { photoCount, videoCount };
  if (group.coverPhotoId && ids.some((id) => String(id) === String(group.coverPhotoId))) {
    const next = await Photo.findOne({ groupId: group._id, status: 'ready', kind: 'photo' }, { _id: 1 }).sort({ takenAt: -1 }).lean();
    $set.coverPhotoId = next?._id ?? null;
  }
  await Group.updateOne({ _id: group._id }, { $set });
}

export async function serializePhoto(p: PhotoDoc, viewerId: Types.ObjectId | string) {
  const viewer = String(viewerId);
  const [thumbUrl, displayUrl] = await Promise.all([readUrl(p.thumbKey), readUrl(p.displayKey)]);
  // Videos are played from the original; photos are viewed at display size.
  const videoUrl = p.kind === 'video' ? await readUrl(p.originalKey) : null;

  const counts = new Map<string, number>();
  for (const r of p.reactions ?? []) counts.set(r.emoji, (counts.get(r.emoji) ?? 0) + 1);

  return {
    id: String(p._id),
    groupId: String(p.groupId),
    userId: String(p.userId),
    kind: p.kind,
    style: p.style,
    width: p.width,
    height: p.height,
    durationMs: p.durationMs,
    takenAt: p.takenAt,
    fromRoll: p.fromRoll,
    caption: p.caption ?? '',
    thumbUrl,
    displayUrl,
    videoUrl,
    reactions: [...counts.entries()].map(([emoji, count]) => ({ emoji, count })),
    myReactions: (p.reactions ?? []).filter((r) => String(r.userId) === viewer).map((r) => r.emoji),
    favoriteCount: (p.favoritedBy ?? []).length,
    isFavorite: (p.favoritedBy ?? []).some((id) => String(id) === viewer),
  };
}
