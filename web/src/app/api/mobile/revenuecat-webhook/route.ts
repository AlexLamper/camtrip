import { connectDB } from '@/lib/db';
import { WebhookEvent } from '@/lib/models';
import { handler, json } from '@/lib/http';
import { syncProFromRevenueCat } from '@/lib/revenuecat';

type Event = { id?: string; type?: string; app_user_id?: string; transferred_to?: string[] };

export const POST = handler(async (req) => {
  const expected = process.env.REVENUECAT_WEBHOOK_AUTHORIZATION;
  if (expected && req.headers.get('authorization') !== expected) {
    return json({ error: 'Unauthorized' }, 401);
  }
  const { event } = (await req.json()) as { event?: Event };
  if (!event?.id) return json({ ok: true });
  if (event.type === 'TEST') return json({ ok: true, test: true });

  await connectDB();
  try {
    await WebhookEvent.create({ eventId: event.id });
  } catch {
    return json({ ok: true, duplicate: true });
  }

  const ids = new Set<string>([event.app_user_id ?? '', ...(event.transferred_to ?? [])]);
  for (const id of ids) {
    // Anonymous RevenueCat ids ($RCAnonymousID:...) are not accounts here.
    if (/^[a-f0-9]{24}$/i.test(id)) await syncProFromRevenueCat(id);
  }
  return json({ ok: true });
});
