import { after } from 'next/server';
import { z } from 'zod';
import { Types } from 'mongoose';
import { Group, Photo, Report, REPORT_REASONS, User, type GroupDoc, type ReportDoc } from '@/lib/models';
import { body, handler, HttpError, json, type Params } from '@/lib/http';
import { requireUser } from '@/lib/auth';
import { memberRole } from '@/lib/groups';
import { pushToUsers } from '@/lib/push';
import { adminRecipientsFilter, parseAdminEmails } from '@/lib/entitlements';
import { reportNotice } from '@/lib/push-i18n';

const Body = z.object({
  reason: z.enum(REPORT_REASONS),
  note: z.string().trim().max(500).optional(),
});

/**
 * "Foto rapporteren" (App Store guideline 1.2). Stores a report for moderation
 * and hides the photo for the reporter straight away. Reporting twice is fine.
 * A new (or reopened) report is pushed to the app admins.
 */
export const POST = handler<Params<{ id: string }>>(async (req, { params }) => {
  const user = await requireUser(req);
  const id = (await params).id;
  if (!Types.ObjectId.isValid(id)) throw new HttpError(404, 'Foto niet gevonden');
  const { reason, note } = await body(req, Body);

  const photo = await Photo.findById(id, { groupId: 1, userId: 1 }).lean();
  if (!photo) throw new HttpError(404, 'Foto niet gevonden');
  const group = await Group.findById(photo.groupId, { members: 1, name: 1 }).lean<GroupDoc>();
  if (!group || !memberRole(group, user._id)) throw new HttpError(404, 'Foto niet gevonden');
  if (String(photo.userId) === String(user._id)) throw new HttpError(400, 'Je kunt je eigen foto niet rapporteren');

  // new: false returns the report as it was before, so we know whether it is news.
  const before = await Report.findOneAndUpdate(
    { photoId: photo._id, reporterId: user._id },
    {
      $set: { reason, note: note ?? '', status: 'open' },
      $setOnInsert: { groupId: photo.groupId, photoUserId: photo.userId },
    },
    { upsert: true, new: false, projection: { status: 1 } },
  ).lean<ReportDoc>();
  console.warn(`[report] photo ${id} in group ${String(photo.groupId)} reported (${reason})`);

  if (!before || before.status !== 'open') {
    const report = before ?? (await Report.findOne({ photoId: photo._id, reporterId: user._id }, { _id: 1 }).lean<ReportDoc>());
    if (report) {
      const reportId = String(report._id);
      after(async () => {
        try {
          const admins = await User.find(adminRecipientsFilter(parseAdminEmails(process.env.ADMIN_EMAILS)), { _id: 1 }).lean();
          await pushToUsers(admins.map((a) => a._id), (locale) => reportNotice(locale, reason, group.name, reportId));
        } catch (e) {
          console.error('[report] admin push failed', e);
        }
      });
    }
  }
  return json({ ok: true });
});
