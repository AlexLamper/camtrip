import type { Types } from 'mongoose';
import { Report, type PhotoDoc, type UserDoc } from './models';
import { readUrl } from './storage';

/**
 * Extra photo filter for what a viewer must not see: photos of people they
 * blocked and photos they reported (App Store guideline 1.2).
 */
export async function hiddenForViewer(viewer: Pick<UserDoc, '_id' | 'blockedUserIds'>): Promise<Record<string, unknown>> {
  const filter: Record<string, unknown> = {};
  const blocked = viewer.blockedUserIds ?? [];
  if (blocked.length) filter.userId = { $nin: blocked };
  const reported = await Report.find({ reporterId: viewer._id }, { photoId: 1 }).lean();
  if (reported.length) filter._id = { $nin: reported.map((r) => r.photoId) };
  return filter;
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
