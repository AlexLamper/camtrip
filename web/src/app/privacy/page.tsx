import type { Metadata } from 'next';
import { Footer, Nav } from '@/components/site';

export const metadata: Metadata = { title: 'Privacybeleid - CamTrip' };

export default function Privacy() {
  return (
    <>
      <Nav />
      <main className="page">
        <h1 className="display">Privacybeleid</h1>
        <p>Laatst bijgewerkt: 12 november 2026</p>
        <p>
          CamTrip is een app van AL Design (eenmanszaak, Middelharnis, Nederland). In dit beleid lees je welke gegevens we
          verwerken, waarom, en wat je rechten zijn.
        </p>

        <h2>Welke gegevens we verwerken</h2>
        <ul>
          <li>Accountgegevens: je naam en e-mailadres zoals Apple of Google die aan ons doorgeven bij het inloggen.</li>
          <li>Foto’s en video’s die je in een groep deelt, met het tijdstip waarop ze gemaakt zijn en de gekozen camerastijl.</li>
          <li>Groepsgegevens: naam, data, leden, reacties en favorieten.</li>
          <li>Een pushtoken van je toestel, als je meldingen toestaat.</li>
          <li>Abonnementsstatus (Pro), via RevenueCat. Betaalgegevens zien wij nooit; die blijven bij Apple of Google.</li>
        </ul>
        <p>We slaan geen locatiegegevens op en verkopen nooit gegevens aan derden.</p>

        <h2>Waarom</h2>
        <p>
          Alleen om de app te laten werken: je foto’s delen met de leden van je groep, meldingen sturen over nieuwe foto’s en
          recaps, en Pro-functies vrijgeven. De grondslag is de uitvoering van de overeenkomst met jou.
        </p>

        <h2>Wie je foto’s kan zien</h2>
        <p>
          Alleen de leden van de groep waarin je ze deelt. Groepen zijn privé en alleen te joinen met de groepscode of
          uitnodigingslink.
        </p>

        <h2>Hoe lang we gegevens bewaren</h2>
        <ul>
          <li>Gratis groepen: tot 30 dagen na de einddatum van de groep, daarna worden de groep en alle foto’s verwijderd.</li>
          <li>Groepen van een Pro-gebruiker: zolang de groep bestaat.</li>
          <li>Je account: tot je het verwijdert via Instellingen → Account verwijderen.</li>
        </ul>

        <h2>Verwerkers</h2>
        <ul>
          <li>Vercel (hosting van de server)</li>
          <li>MongoDB Atlas (database, EU-regio)</li>
          <li>Cloudflare R2 (opslag van foto’s en video’s)</li>
          <li>RevenueCat (abonnementen)</li>
          <li>Google Firebase Cloud Messaging (pushmeldingen)</li>
        </ul>

        <h2>Je rechten</h2>
        <p>
          Je kunt je gegevens inzien, laten corrigeren of verwijderen. Je account en al je foto’s verwijder je zelf in de app.
          Voor andere verzoeken mail je naar <a href="mailto:support@camtrip.app">support@camtrip.app</a>. Je kunt ook een
          klacht indienen bij de Autoriteit Persoonsgegevens.
        </p>
      </main>
      <Footer />
    </>
  );
}
