import { Types } from 'mongoose';
import { Photo, type PhotoDoc } from '@/lib/models';
import { handler, json, type Params } from '@/lib/http';
import { isPro, requireUser } from '@/lib/auth';
import { requireMember } from '@/lib/groups';
import { readUrl } from '@/lib/storage';

/**
 * Download list for "Alles opslaan" (or a selection via ?ids=a,b,c).
 * Pro gets the originals, free accounts the display version (max 2048 px).
 * Videos are always the original: there is no smaller version of a video.
 */
export const GET = handler<Params<{ id: string }>>(async (req, { params }) => {
  const user = await requireUser(req);
  const group = await requireMember((await params).id, user._id);
  const ids = (new URL(req.url).searchParams.get('ids') ?? '')
    .split(',')
    .filter((x) => Types.ObjectId.isValid(x))
    .map((x) => new Types.ObjectId(x));

  const filter: Record<string, unknown> = { groupId: group._id, status: 'ready' };
  if (ids.length) filter._id = { $in: ids };
  const photos = await Photo.find(filter).sort({ takenAt: 1 }).lean<PhotoDoc[]>();
  const pro = isPro(user);

  const items = await Promise.all(
    photos.map(async (p) => {
      const original = pro || p.kind === 'video';
      return {
        id: String(p._id),
        kind: p.kind,
        takenAt: p.takenAt,
        url: await readUrl(original ? p.originalKey : p.displayKey),
        ext: original ? p.originalKey.split('.').pop() : 'jpg',
      };
    }),
  );
  return json({ items, originalQuality: pro });
});
