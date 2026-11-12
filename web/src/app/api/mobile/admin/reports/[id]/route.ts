import { z } from 'zod';
import { Group, Photo, Report, type GroupDoc, type ReportDoc } from '@/lib/models';
import { body, handler, HttpError, json, type Params } from '@/lib/http';
import { objectIdOr404, requireAdmin, setBanned } from '@/lib/admin';
import { deletePhotos } from '@/lib/photos';

const Action = z.object({
  action: z.enum(['dismiss', 'delete_photo', 'ban_user']),
  reason: z.string().trim().max(300).optional(),
});

/**
 * POST {action, reason?} on one report:
 *   dismiss      -> report handled, nothing else changes
 *   delete_photo -> photo removed for everyone (R2 included); every open report on it handled
 *   ban_user     -> the photographer is banned; this report handled
 */
export const POST = handler<Params<{ id: string }>>(async (req, { params }) => {
  const admin = await requireAdmin(req);
  const id = objectIdOr404((await params).id, 'Melding');
  const input = await body(req, Action);
  const report = await Report.findById(id).lean<ReportDoc>();
  if (!report) throw new HttpError(404, 'Melding niet gevonden');
  const handled = { status: 'handled', handledBy: admin._id, handledAt: new Date() };

  if (input.action === 'dismiss') {
    await Report.updateOne({ _id: report._id }, { $set: { ...handled, resolution: 'dismissed' } });
  } else if (input.action === 'delete_photo') {
    const photo = await Photo.findById(report.photoId).lean();
    if (photo) {
      const group = await Group.findById(photo.groupId).lean<GroupDoc>();
      if (group) await deletePhotos(group, [photo]);
      else await Photo.deleteOne({ _id: photo._id });
    }
    await Report.updateMany(
      { photoId: report.photoId, status: 'open' },
      { $set: { ...handled, resolution: 'photo_deleted' } },
    );
    await Report.updateOne({ _id: report._id }, { $set: { ...handled, resolution: 'photo_deleted' } });
  } else {
    const target = report.photoUserId ?? (await Photo.findById(report.photoId, { userId: 1 }).lean())?.userId;
    if (!target) throw new HttpError(404, 'De maker van deze foto is niet meer bekend');
    await setBanned(admin, target, true, input.reason || `Melding: ${report.reason}`);
    await Report.updateOne({ _id: report._id }, { $set: { ...handled, resolution: 'user_banned' } });
  }

  const fresh = await Report.findById(report._id).lean<ReportDoc>();
  return json({ ok: true, report: { id: String(report._id), status: fresh?.status, resolution: fresh?.resolution ?? null } });
});
