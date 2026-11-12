import { z } from 'zod';
import { Types } from 'mongoose';
import { Group, Photo, Report, REPORT_REASONS, type GroupDoc } from '@/lib/models';
import { body, handler, HttpError, json, type Params } from '@/lib/http';
import { requireUser } from '@/lib/auth';
import { memberRole } from '@/lib/groups';

const Body = z.object({
  reason: z.enum(REPORT_REASONS),
  note: z.string().trim().max(500).optional(),
});

/**
 * "Foto rapporteren" (App Store guideline 1.2). Stores a report for moderation
 * and hides the photo for the reporter straight away. Reporting twice is fine.
 */
export const POST = handler<Params<{ id: string }>>(async (req, { params }) => {
  const user = await requireUser(req);
  const id = (await params).id;
  if (!Types.ObjectId.isValid(id)) throw new HttpError(404, 'Foto niet gevonden');
  const { reason, note } = await body(req, Body);

  const photo = await Photo.findById(id, { groupId: 1, userId: 1 }).lean();
  if (!photo) throw new HttpError(404, 'Foto niet gevonden');
  const group = await Group.findById(photo.groupId, { members: 1 }).lean<GroupDoc>();
  if (!group || !memberRole(group, user._id)) throw new HttpError(404, 'Foto niet gevonden');
  if (String(photo.userId) === String(user._id)) throw new HttpError(400, 'Je kunt je eigen foto niet rapporteren');

  await Report.updateOne(
    { photoId: photo._id, reporterId: user._id },
    {
      $set: { reason, note: note ?? '', status: 'open' },
      $setOnInsert: { groupId: photo.groupId, photoUserId: photo.userId },
    },
    { upsert: true },
  );
  console.warn(`[report] photo ${id} in group ${String(photo.groupId)} reported (${reason})`);
  return json({ ok: true });
});
