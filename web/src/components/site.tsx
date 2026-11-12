import Link from 'next/link';

export const APP_STORE_URL = process.env.NEXT_PUBLIC_APP_STORE_URL ?? '#download';
export const PLAY_STORE_URL = process.env.NEXT_PUBLIC_PLAY_STORE_URL ?? '#download';

function AppleGlyph() {
  return (
    <svg viewBox="0 0 24 24" fill="currentColor" aria-hidden>
      <path d="M16.37 12.6c-.02-2.2 1.8-3.26 1.88-3.31-1.03-1.5-2.62-1.7-3.18-1.73-1.35-.14-2.65.8-3.33.8-.7 0-1.75-.78-2.88-.76-1.48.02-2.85.86-3.61 2.19-1.54 2.67-.39 6.62 1.1 8.79.74 1.06 1.61 2.25 2.75 2.2 1.11-.04 1.52-.71 2.86-.71 1.33 0 1.71.71 2.87.69 1.19-.02 1.94-1.07 2.66-2.14.85-1.23 1.19-2.43 1.21-2.49-.03-.01-2.31-.89-2.33-3.53zM14.2 6.13c.6-.74 1.01-1.75.9-2.77-.87.04-1.94.59-2.56 1.32-.55.64-1.04 1.69-.91 2.68.98.08 1.97-.49 2.57-1.23z" />
    </svg>
  );
}

function PlayGlyph() {
  return (
    <svg viewBox="0 0 24 24" fill="currentColor" aria-hidden>
      <path d="M4.2 2.6c-.25.26-.4.67-.4 1.2v16.4c0 .53.15.94.4 1.2l.07.06L13.5 12.3v-.2L4.27 2.54l-.07.06zM16.6 15.4l-3.1-3.1v-.2l3.1-3.1.07.04 3.67 2.09c1.05.6 1.05 1.57 0 2.17l-3.67 2.08-.07.02zM16.67 15.37 13.5 12.2l-9.3 9.3c.34.36.91.4 1.55.05l10.92-6.18M16.67 9.03 5.75 2.85c-.64-.36-1.21-.31-1.55.05l9.3 9.3 3.17-3.17z" />
    </svg>
  );
}

export function StoreButtons() {
  return (
    <div className="stores" id="download">
      <a className="store" href={APP_STORE_URL}>
        <AppleGlyph />
        <span>
          <small>Download in de</small>
          <strong>App Store</strong>
        </span>
      </a>
      <a className="store" href={PLAY_STORE_URL}>
        <PlayGlyph />
        <span>
          <small>Ontdek het op</small>
          <strong>Google Play</strong>
        </span>
      </a>
    </div>
  );
}

export function Nav() {
  return (
    <div className="wrap nav">
      <Link href="/" className="brand display">
        <img src="/icon.png" alt="" />
        <span>
          Cam<span className="accent">Trip</span>
        </span>
      </Link>
      <a className="link" href="/#download">
        Download
      </a>
    </div>
  );
}

export function Footer() {
  return (
    <footer>
      <div className="wrap">
        <span>© {new Date().getFullYear()} CamTrip · een app van AL Design</span>
        <span className="links">
          <Link href="/privacy">Privacy</Link>
          <Link href="/voorwaarden">Voorwaarden</Link>
          <a href="mailto:support@camtrip.app">Contact</a>
        </span>
      </div>
    </footer>
  );
}
