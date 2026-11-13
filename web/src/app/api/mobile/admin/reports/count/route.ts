import { Report } from '@/lib/models';
import { handler, json } from '@/lib/http';
import { requireAdmin } from '@/lib/admin';

/** GET -> {open}: number of open photo reports, for the badge on the "Beheer" row. */
export const GET = handler(async (req) => {
  await requireAdmin(req);
  return json({ open: await Report.countDocuments({ status: 'open' }) });
});
