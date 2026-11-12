/**
 * Sends e-mail through the Resend HTTP API. Without RESEND_API_KEY it logs a
 * warning and skips, so local development works without mail.
 */
export async function sendMail(to: string, subject: string, text: string, html?: string): Promise<boolean> {
  const key = process.env.RESEND_API_KEY;
  if (!key) {
    console.warn(`[mail] RESEND_API_KEY is not set - skipped "${subject}"`);
    return false;
  }
  const from = process.env.MAIL_FROM || 'CamTrip <noreply@camtrip.app>';
  try {
    const res = await fetch('https://api.resend.com/emails', {
      method: 'POST',
      headers: { Authorization: `Bearer ${key}`, 'Content-Type': 'application/json' },
      body: JSON.stringify({ from, to: [to], subject, text, ...(html ? { html } : {}) }),
    });
    if (!res.ok) {
      console.error(`[mail] Resend ${res.status}: ${await res.text().catch(() => '')}`);
      return false;
    }
    return true;
  } catch (err) {
    console.error('[mail] send failed', err);
    return false;
  }
}

function escapeHtml(s: string): string {
  return s.replace(/[&<>"']/g, (c) => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' })[c]!);
}

export function resetCodeMail(name: string, code: string) {
  const hi = name && name !== 'Fotograaf' ? `Hoi ${name},` : 'Hoi,';
  const subject = `${code} is je CamTrip-code`;
  const text = [
    hi,
    '',
    `Je code om een nieuw wachtwoord in te stellen is: ${code}`,
    '',
    'De code is 15 minuten geldig. Heb je dit niet zelf aangevraagd? Dan kun je deze mail negeren.',
    '',
    'CamTrip',
  ].join('\n');
  const html = `<!doctype html><html><body style="margin:0;background:#fbfaf7;font-family:Inter,Helvetica,Arial,sans-serif;color:#1d1d1b">
<div style="max-width:440px;margin:0 auto;padding:32px 24px">
<p style="font-size:15px;line-height:1.5;margin:0 0 16px">${escapeHtml(hi)}</p>
<p style="font-size:15px;line-height:1.5;margin:0 0 20px">Je code om een nieuw wachtwoord in te stellen:</p>
<div style="background:#fff;border:1.5px solid #e6e2d9;border-radius:14px;padding:18px;text-align:center;font-size:32px;font-weight:700;letter-spacing:8px">${code}</div>
<p style="font-size:13px;line-height:1.5;color:#777770;margin:20px 0 0">De code is 15 minuten geldig. Heb je dit niet zelf aangevraagd? Dan kun je deze mail negeren.</p>
<p style="font-size:13px;color:#777770;margin:24px 0 0">CamTrip</p>
</div></body></html>`;
  return { subject, text, html };
}
