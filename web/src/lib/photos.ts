import type { Types } from 'mongoose';
import type { PhotoDoc } from './models';
import { readUrl } from './storage';

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
