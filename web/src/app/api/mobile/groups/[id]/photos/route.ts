import { z } from 'zod';
import { Types } from 'mongoose';
import { Photo, FREE_STYLES, PHOTO_STYLES, type PhotoDoc } from '@/lib/models';
import { body, handler, HttpError, json, type Params } from '@/lib/http';
import { requireUser } from '@/lib/auth';
import { hasPro } from '@/lib/entitlements';
import { groupIsPro } from '@/lib/pro';
import { assertRollSpace } from '@/lib/roll-db';
import { requireMember } from '@/lib/groups';
import { hiddenForViewer, hiddenPhotoIds, serializePhoto } from '@/lib/photos';
import { deleteKeys, mediaKeys, uploadUrl } from '@/lib/storage';
import { mayStoreLocation, parseLocation } from '@/lib/trip-map';
import { countryCodeFor } from '@/lib/countries';

type P = Params<{ id: string }>;
const PAGE = 60;

/** Newest first, cursor = takenAt of the last item (ISO) + id for ties. */
export const GET = handler<P>(async (req, { params }) => {
  const user = await requireUser(req);
  // "me" = the user's personal roll (Mijn rolletje), created on first use (see requireMember).
  const group = await requireMember((await params).id, user._id);
  const url = new URL(req.url);
  const before = url.searchParams.get('before');
  const beforeId = url.searchParams.get('beforeId');
  const userFilter = url.searchParams.get('userId');
  const favorites = url.searchParams.get('favorites') === '1';
  // ?hidden=1: only the photos this user hid for themselves ("Verborgen foto's").
  const onlyHidden = url.searchParams.get('hidden') === '1';

  const hidden = await hiddenForViewer(user, group._id, { includeHidden: onlyHidden });
  const and: Record<string, unknown>[] = [{ groupId: group._id, status: 'ready' }];
  if (hidden.userId) and.push({ userId: hidden.userId });
  if (hidden._id) and.push({ _id: hidden._id });
  if (onlyHidden) and.push({ _id: { $in: await hiddenPhotoIds(user._id, group._id) } });
  if (userFilter && Types.ObjectId.isValid(userFilter)) and.push({ userId: new Types.ObjectId(userFilter) });
  if (favorites) and.push({ favoritedBy: user._id });
  if (before) {
    const d = new Date(before);
    if (Number.isNaN(d.getTime())) throw new HttpError(400, 'Ongeldige cursor');
    and.push({
      $or:
        beforeId && Types.ObjectId.isValid(beforeId)
          ? [{ takenAt: { $lt: d } }, { takenAt: d, _id: { $lt: new Types.ObjectId(beforeId) } }]
          : [{ takenAt: { $lt: d } }],
    });
  }
  const filter = { $and: and };

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
  style: z.enum(PHOTO_STYLES).default('instant'),
  mime: z.string().regex(/^(image|video)\/[\w.+-]+$/).default('image/jpeg'),
  width: z.number().int().nonnegative().default(0),
  height: z.number().int().nonnegative().default(0),
  durationMs: z.number().int().nonnegative().default(0),
  takenAt: z.coerce.date(),
  fromRoll: z.boolean().default(false),
  clientId: z.string().max(64).optional(),
  // A retry with fresh upload URLs: the earlier, never completed reservation it replaces.
  replaces: z.string().max(64).optional(),
  // Reiskaart: {lat, lng} from the phone at capture time, sent next to (never
  // inside) the file. Kept only with the map on and the member's consent.
  location: z.unknown().optional(),
});

/**
 * Step 1 of an upload: reserves the photo and returns presigned PUT URLs for
 * the original, a display version and a thumbnail (the app makes all three,
 * so nothing heavy runs on the server). Step 2 is POST /photos/:id/complete.
 */
export const POST = handler<P>(async (req, { params }) => {
  const user = await requireUser(req);
  // "me" = the user's personal roll: the first loose photo creates it (see requireMember).
  const group = await requireMember((await params).id, user._id);
  if (group.status === 'archived') throw new HttpError(410, 'Deze groep is afgesloten', 'archived');
  const input = await body(req, Init);
  // Same rule as the camera: Pro styles need Pro. Camera-roll photos ('roll') have no style.
  // Group Pro counts: one Pro member unlocks the Pro styles for everyone in this group.
  // A personal roll has only its owner, so there it is the user's own Pro only.
  // Group Pro also comes from a Trip Pass for this group.
  const userIsPro = hasPro(user);
  const groupPro = userIsPro ? true : await groupIsPro(group);
  if (input.style !== 'roll' && !FREE_STYLES.includes(input.style) && !groupPro) {
    throw new HttpError(402, 'Deze camerastijl hoort bij CamTrip Pro', 'pro_required');
  }
  // The free roll: 24 shots per person per trip (Mijn rolletje: per calendar
  // month). 402 {code:'roll_full', limit, used} beyond it (lib/roll.ts).
  // Drop the reservation this one replaces first, so a retry never counts twice on the roll.
  if (input.replaces && Types.ObjectId.isValid(input.replaces)) {
    const old = await Photo.findOneAndDelete({ _id: input.replaces, userId: user._id, status: 'pending' }).lean<PhotoDoc>();
    if (old) await deleteKeys([old.originalKey, old.displayKey, old.thumbKey]);
  }
  const roll = await assertRollSpace(user, group, { groupPro });

  // Coarsened to ~100 m again here; silently dropped when not allowed (the
  // phone may not know yet that the map was switched off or consent withdrawn).
  // Camera-roll picks never get one: the phone's location now is not where they were taken.
  const loc = !input.fromRoll && mayStoreLocation(group, user._id) ? parseLocation(input.location) : null;
  const location = loc ? { ...loc, countryCode: countryCodeFor(loc.lat, loc.lng) } : undefined;

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
    ...(location ? { location } : {}),
    ...keys,
  });

  const [original, display, thumb] = await Promise.all([
    uploadUrl(keys.originalKey, input.mime),
    uploadUrl(keys.displayKey, 'image/jpeg'),
    uploadUrl(keys.thumbKey, 'image/jpeg'),
  ]);
  // roll: the uploader's roll here after this shot ({used, limit}; null = no limit), for the camera counter.
  return json({ photoId: String(id), uploads: { original, display, thumb }, roll }, 201);
});
