import { z } from 'zod';
import { Types } from 'mongoose';
import { Photo, FREE_STYLES, CAMERA_STYLES, type PhotoDoc } from '@/lib/models';
import { body, handler, HttpError, json, type Params } from '@/lib/http';
import { isPro, requireUser } from '@/lib/auth';
import { requireMember } from '@/lib/groups';
import { serializePhoto } from '@/lib/photos';
import { mediaKeys, uploadUrl } from '@/lib/storage';

type P = Params<{ id: string }>;
const PAGE = 60;

/** Newest first, cursor = takenAt of the last item (ISO) + id for ties. */
export const GET = handler<P>(async (req, { params }) => {
  const user = await requireUser(req);
  const group = await requireMember((await params).id, user._id);
  const url = new URL(req.url);
  const before = url.searchParams.get('before');
  const beforeId = url.searchParams.get('beforeId');
  const userFilter = url.searchParams.get('userId');
  const favorites = url.searchParams.get('favorites') === '1';

  const filter: Record<string, unknown> = { groupId: group._id, status: 'ready' };
  if (userFilter && Types.ObjectId.isValid(userFilter)) filter.userId = new Types.ObjectId(userFilter);
  if (favorites) filter.favoritedBy = user._id;
  if (before) {
    const d = new Date(before);
    filter.$or = beforeId && Types.ObjectId.isValid(beforeId)
      ? [{ takenAt: { $lt: d } }, { takenAt: d, _id: { $lt: new Types.ObjectId(beforeId) } }]
      : [{ takenAt: { $lt: d } }];
  }

  const photos = await Photo.find(filter).sort({ takenAt: -1, _id: -1 }).limit(PAGE + 1).lean<PhotoDoc[]>();
  const page = photos.slice(0, PAGE);
  const last = page[page.length - 1];
  return json({
    photos: await Promise.all(page.map((p) => serializePhoto(p, user._id))),
    nextCursor: photos.length > PAGE && last ? { before: last.takenAt, beforeId: String(last._id) } : null,
  });
});

const Init = z.object({
  kind: z.enum(['photo', 'video']).default('photo'),
  style: z.enum(CAMERA_STYLES).default('instant'),
  mime: z.string().default('image/jpeg'),
  width: z.number().int().nonnegative().default(0),
  height: z.number().int().nonnegative().default(0),
  durationMs: z.number().int().nonnegative().default(0),
  takenAt: z.coerce.date(),
  fromRoll: z.boolean().default(false),
  clientId: z.string().max(64).optional(),
});

/**
 * Step 1 of an upload: reserves the photo and returns presigned PUT URLs for
 * the original, a display version and a thumbnail (the app makes all three,
 * so nothing heavy runs on the server). Step 2 is POST /photos/:id/complete.
 */
export const POST = handler<P>(async (req, { params }) => {
  const user = await requireUser(req);
  const group = await requireMember((await params).id, user._id);
  if (group.status === 'archived') throw new HttpError(410, 'Deze groep is afgesloten', 'archived');
  const input = await body(req, Init);
  if (!FREE_STYLES.includes(input.style) && !isPro(user) && !input.fromRoll) {
    throw new HttpError(402, 'Deze camerastijl hoort bij CamTrip Pro', 'pro_required');
  }

  const id = new Types.ObjectId();
  const ext = input.kind === 'video' ? (input.mime.includes('quicktime') ? 'mov' : 'mp4') : 'jpg';
  const keys = mediaKeys(String(group._id), String(id), ext);
  await Photo.create({
    _id: id,
    groupId: group._id,
    userId: user._id,
    kind: input.kind,
    style: input.style,
    mime: input.mime,
    width: input.width,
    height: input.height,
    durationMs: input.durationMs,
    takenAt: input.takenAt,
    fromRoll: input.fromRoll,
    ...keys,
  });

  const [original, display, thumb] = await Promise.all([
    uploadUrl(keys.originalKey, input.mime),
    uploadUrl(keys.displayKey, 'image/jpeg'),
    uploadUrl(keys.thumbKey, 'image/jpeg'),
  ]);
  return json({ photoId: String(id), uploads: { original, display, thumb } }, 201);
});
