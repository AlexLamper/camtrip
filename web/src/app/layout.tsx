import type { Metadata, Viewport } from 'next';
import { Inter } from 'next/font/google';
import './globals.css';

const inter = Inter({ subsets: ['latin'], variable: '--font-inter', display: 'swap' });
// Inter's display cut (opsz axis) for headings.
const display = Inter({ subsets: ['latin'], variable: '--font-display', axes: ['opsz'], display: 'swap' });

export const metadata: Metadata = {
  metadataBase: new URL('https://camtrip.app'),
  title: 'CamTrip - één rolletje voor de hele groep',
  description:
    'Schiet met een retro-camera, en iedereen in je groep ziet je foto’s direct. Geen gedoe meer met foto’s doorsturen na de vakantie.',
  icons: {
    icon: [
      { url: '/favicon.ico', sizes: '16x16 32x32 48x48' },
      { url: '/favicon-32.png', sizes: '32x32', type: 'image/png' },
      { url: '/favicon.png', sizes: '64x64', type: 'image/png' },
      { url: '/icon-192.png', sizes: '192x192', type: 'image/png' },
      { url: '/icon-512.png', sizes: '512x512', type: 'image/png' },
    ],
    apple: { url: '/apple-touch-icon.png', sizes: '180x180' },
  },
  openGraph: {
    title: 'CamTrip - één rolletje voor de hele groep',
    description: 'Retro-camera + gedeeld album. Iedereen ziet elkaars foto’s direct.',
    images: [{ url: '/icon-512.png', width: 512, height: 512 }],
    locale: 'nl_NL',
    type: 'website',
  },
  other: { 'apple-itunes-app': 'app-id=6833896075' },
};

export const viewport: Viewport = { themeColor: '#fbfaf7' };

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="nl" className={`${inter.variable} ${display.variable}`}>
      <body>{children}</body>
    </html>
  );
}
