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
  icons: { icon: '/favicon.png', apple: '/apple-touch-icon.png' },
  openGraph: {
    title: 'CamTrip - één rolletje voor de hele groep',
    description: 'Retro-camera + gedeeld album. Iedereen ziet elkaars foto’s direct.',
    images: ['/icon.png'],
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
