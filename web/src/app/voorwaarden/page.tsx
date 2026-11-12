import type { Metadata } from 'next';
import { Footer, Nav } from '@/components/site';

export const metadata: Metadata = { title: 'Voorwaarden - CamTrip' };

export default function Terms() {
  return (
    <>
      <Nav />
      <main className="page">
        <h1 className="display">Gebruiksvoorwaarden</h1>
        <p>Laatst bijgewerkt: 12 november 2026</p>

        <h2>De dienst</h2>
        <p>
          CamTrip is een app waarmee je met een groep foto’s en video’s maakt en deelt. De app wordt aangeboden door AL
          Design, Middelharnis.
        </p>

        <h2>Wat je deelt</h2>
        <p>
          Je blijft eigenaar van je foto’s. Je geeft CamTrip alleen toestemming om ze op te slaan en te tonen aan de leden van
          je groep. Deel niets wat onwettig is, of foto’s van mensen die daar duidelijk geen toestemming voor geven. We kunnen
          content en accounts verwijderen die deze regels overtreden.
        </p>

        <h2>Bewaartermijn</h2>
        <p>
          Gratis groepen worden 30 dagen na hun einddatum verwijderd. Sla je foto’s op tijd op. CamTrip is geen
          back-updienst.
        </p>

        <h2>CamTrip Pro</h2>
        <p>
          Pro is een abonnement dat je afsluit via de App Store of Google Play, voor €7,99 per maand of €49,99 per jaar, met
          7 dagen gratis proberen voor nieuwe abonnees. Het abonnement verlengt automatisch, tenzij je het minstens 24 uur
          voor het einde van de periode opzegt in de instellingen van je App Store- of Google Play-account. Betaling en
          terugbetaling lopen via Apple of Google.
        </p>

        <h2>Aansprakelijkheid</h2>
        <p>
          We doen ons best om de app goed en veilig te laten werken, maar kunnen niet garanderen dat hij altijd beschikbaar
          is. We zijn niet aansprakelijk voor verlies van foto’s, behalve bij opzet of grove nalatigheid.
        </p>

        <h2>Contact</h2>
        <p>
          <a href="mailto:support@camtrip.app">support@camtrip.app</a>
        </p>
      </main>
      <Footer />
    </>
  );
}
