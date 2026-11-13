import type { Metadata } from 'next';
import Link from 'next/link';
import { Footer, Nav } from '@/components/site';

export const metadata: Metadata = { title: 'Voorwaarden - CamTrip' };

export default function Terms() {
  return (
    <>
      <Nav />
      <main className="page">
        <h1 className="display">Gebruiksvoorwaarden</h1>
        <p>Laatst bijgewerkt: 13 november 2026</p>
        <p>
          Door CamTrip te gebruiken ga je akkoord met deze voorwaarden. Lees ook ons <Link href="/privacy">privacybeleid</Link>. De
          app is in meerdere talen beschikbaar, maar bij verschillen tussen een vertaling en deze Nederlandse tekst geldt de
          Nederlandse tekst.
        </p>

        <h2>De dienst</h2>
        <p>
          CamTrip is een app waarmee je met een groep foto’s en video’s maakt en deelt. De app wordt aangeboden door Alex
          Lamper, handelend als AL Design (eenmanszaak), Middelharnis, Nederland.
        </p>

        <h2>Je account</h2>
        <p>
          Je maakt een account aan met je e-mailadres en een wachtwoord, of je logt in met Apple of Google. Je moet minstens
          13 jaar zijn. Ben je jonger dan 16 en is in jouw land toestemming van een ouder of voogd nodig, dan gebruik je
          CamTrip alleen met die toestemming. Zorg dat je gegevens kloppen en houd je wachtwoord geheim. Je bent
          verantwoordelijk voor wat er met je account gebeurt. Merk je dat iemand anders je account gebruikt, mail ons dan.
        </p>

        <h2>Wat wel en niet mag</h2>
        <p>Je gebruikt CamTrip netjes en volgens de wet. Het is niet toegestaan om:</p>
        <ul>
          <li>content te delen die onwettig is, zoals seksueel misbruik van kinderen, geweld of materiaal waar je de rechten niet van hebt;</li>
          <li>anderen te intimideren, bedreigen, discrimineren of lastig te vallen;</li>
          <li>naaktbeelden of andere intieme beelden van iemand te delen zonder diens toestemming;</li>
          <li>foto’s te delen van mensen die daar duidelijk geen toestemming voor geven;</li>
          <li>spam te versturen, de app te misbruiken of te proberen de beveiliging te omzeilen.</li>
        </ul>
        <p>
          Je kunt foto’s melden en mensen blokkeren in de app. We bekijken meldingen binnen 24 uur. CamTrip mag content
          verwijderen en accounts tijdelijk of definitief blokkeren als iemand deze regels overtreedt. Bij strafbare feiten
          kunnen we de politie inschakelen.
        </p>

        <h2>Wat je deelt</h2>
        <p>
          Je blijft eigenaar van je foto’s en video’s. Je geeft CamTrip alleen toestemming (een licentie) om ze op te slaan,
          te verwerken (bijvoorbeeld een kleinere versie of een miniatuur maken) en te tonen aan de leden van de groep waarin
          je ze deelt. We gebruiken je content niet voor reclame en verkopen hem niet. Die toestemming stopt als je de foto,
          de groep of je account verwijdert. Wat groepsleden al op hun eigen telefoon hebben opgeslagen, valt daarbuiten.
        </p>

        <h2>Bewaartermijn</h2>
        <p>
          Gratis groepen worden 30 dagen na hun einddatum verwijderd, met alle foto’s en video’s. Sla je foto’s op tijd op.
          CamTrip is geen back-updienst.
        </p>

        <h2>CamTrip Pro</h2>
        <p>
          Pro is een abonnement dat je afsluit via de App Store of Google Play, voor €7,99 per maand of €49,99 per jaar, met
          7 dagen gratis proberen voor nieuwe abonnees. Het abonnement verlengt automatisch, tenzij je het minstens 24 uur
          voor het einde van de periode opzegt in de instellingen van je App Store- of Google Play-account. Opzeggen kan
          altijd; je houdt Pro tot het einde van de betaalde periode. Betaling en terugbetaling lopen via Apple of Google,
          volgens hun voorwaarden.
        </p>
        <p>
          Pro geldt voor de hele groep: heeft één lid Pro, dan heeft iedereen in die groep de Pro-functies, zoals onbeperkt
          leden en bewaren zolang de groep bestaat. Stopt dat lid met Pro of verlaat het de groep, en heeft niemand anders in
          de groep Pro, dan gelden de regels voor gratis groepen weer. Is de einddatum van de groep dan al meer dan 30 dagen
          geleden, dan kan de groep kort daarna worden verwijderd.
        </p>

        <h2>Pro cadeau</h2>
        <p>
          CamTrip kan Pro als cadeau geven, voor een bepaalde tijd of onbeperkt. Een cadeau is gratis, heeft geen geldwaarde
          en is niet over te dragen. Na afloop gelden de gewone regels weer. Bij misbruik of een blokkade van je account
          kunnen we een cadeau intrekken.
        </p>

        <h2>Stoppen</h2>
        <p>
          Je kunt altijd stoppen door je account te verwijderen via Instellingen → Account verwijderen. Een lopend abonnement
          stopt daar niet automatisch mee; zeg dat apart op via de App Store of Google Play. CamTrip kan je account blokkeren
          of verwijderen als je deze voorwaarden ernstig of herhaaldelijk overtreedt. We kunnen de dienst ook beëindigen; in
          dat geval laten we het je ruim van tevoren weten, zodat je je foto’s kunt downloaden.
        </p>

        <h2>Aansprakelijkheid</h2>
        <p>
          We doen ons best om de app goed en veilig te laten werken, maar kunnen niet garanderen dat hij altijd beschikbaar of
          foutloos is. We zijn niet aansprakelijk voor verlies van foto’s of andere schade, behalve bij opzet of grove
          nalatigheid van onze kant. Je bent zelf verantwoordelijk voor wat je deelt. Dit doet niets af aan de rechten die je
          als consument volgens de wet hebt.
        </p>

        <h2>Wijzigingen</h2>
        <p>
          We kunnen deze voorwaarden aanpassen als de app verandert. Bij belangrijke wijzigingen laten we het je vooraf weten
          in de app. Gebruik je CamTrip daarna nog, dan gelden de nieuwe voorwaarden.
        </p>

        <h2>Toepasselijk recht</h2>
        <p>
          Op deze voorwaarden is Nederlands recht van toepassing. Geschillen leggen we voor aan de bevoegde rechter in
          Nederland. Ben je consument en woon je in een ander EU-land, dan behoud je de bescherming van de dwingende regels
          van dat land en kun je ook naar de rechter in je eigen land. Kom je er met ons niet uit, mail ons dan eerst; we
          lossen het liefst samen op.
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
