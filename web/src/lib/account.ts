import { HttpError } from './http';
import { normalizeEmail, PASSWORD_MAX, PASSWORD_MIN } from './password';

// Input checks for the e-mail + password endpoints, with Dutch messages the
// app can show as-is (zod's generic "Ongeldige invoer" is not helpful here).

const EMAIL_RE = /^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/;

async function readJson(req: Request): Promise<Record<string, unknown>> {
  try {
    const raw = await req.json();
    return raw && typeof raw === 'object' ? (raw as Record<string, unknown>) : {};
  } catch {
    return {};
  }
}

function str(v: unknown): string {
  return typeof v === 'string' ? v : '';
}

export function parseEmail(v: unknown): string {
  const email = normalizeEmail(str(v));
  if (!email) throw new HttpError(400, 'Vul je e-mailadres in', 'invalid_email');
  if (email.length > 254 || !EMAIL_RE.test(email)) throw new HttpError(400, 'Dit e-mailadres klopt niet', 'invalid_email');
  return email;
}

export function parseNewPassword(v: unknown): string {
  const password = str(v);
  if (password.length < PASSWORD_MIN) throw new HttpError(400, `Kies een wachtwoord van minstens ${PASSWORD_MIN} tekens`, 'weak_password');
  if (password.length > PASSWORD_MAX) throw new HttpError(400, 'Dit wachtwoord is te lang', 'weak_password');
  return password;
}

export function parseName(v: unknown): string {
  const name = str(v).trim().replace(/\s+/g, ' ');
  if (!name) throw new HttpError(400, 'Vul je naam in', 'invalid_name');
  if (name.length > 40) throw new HttpError(400, 'Je naam mag maximaal 40 tekens zijn', 'invalid_name');
  return name;
}

export function parseCode(v: unknown): string {
  const code = str(v).replace(/\s/g, '');
  if (!/^\d{6}$/.test(code)) throw new HttpError(400, 'De code bestaat uit 6 cijfers', 'invalid_code');
  return code;
}

export { readJson };
