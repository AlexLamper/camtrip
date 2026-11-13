import type { Metadata } from 'next';
import { Footer, Nav } from '@/components/site';

export const metadata: Metadata = { title: 'Privacybeleid - CamTrip' };

export default function Privacy() {
  return (
    <>
      <Nav />
      <main className="page">
        <h1 className="display">Privacybeleid</h1>
        <p>Laatst bijgewerkt: 13 november 2026</p>
        <p>
          In dit beleid lees je welke gegevens CamTrip verwerkt, waarom, hoe lang we ze bewaren en wat je rechten zijn. We
          houden het zo kort en duidelijk mogelijk. De app is in meerdere talen beschikbaar, maar dit beleid is in het
          Nederlands geschreven. Bij verschillen tussen een vertaling en deze Nederlandse tekst geldt de Nederlandse tekst.
          Onderaan staat een korte samenvatting in het Engels.
        </p>

        <h2>Wie we zijn</h2>
        <p>
          CamTrip is een app van Alex Lamper, handelend als AL Design (eenmanszaak), gevestigd in Middelharnis, Nederland. Hij
          is de verwerkingsverantwoordelijke voor de gegevens in dit beleid. Vragen of verzoeken over privacy stuur je naar{' '}
          <a href="mailto:support@camtrip.app">support@camtrip.app</a>.
        </p>

        <h2>Welke gegevens we verwerken en waarom</h2>
        <p>
          We verwerken alleen wat nodig is om CamTrip te laten werken. Per soort gegevens staat hieronder waarvoor we ze
          gebruiken en op welke grondslag uit de Algemene verordening gegevensbescherming (AVG/GDPR) dat gebeurt.
        </p>
        <ul>
          <li>
            <strong>Accountgegevens:</strong> je naam, e-mailadres, de kleur van je avatar en, als je met Apple of Google
            inlogt, een technische id van dat account. Bij een account met e-mail en wachtwoord bewaren we een versleutelde
            hash van je wachtwoord, nooit het wachtwoord zelf. Waarom: om je account aan te maken, je in te laten loggen en
            je naam te tonen aan je groepsleden. Grondslag: uitvoering van de overeenkomst.
          </li>
          <li>
            <strong>Groepsgegevens:</strong> de naam, het soort groep, begin- en einddatum, de groepscode, wie er lid is en
            wie de groep beheert. Waarom: om groepen te laten werken. Grondslag: uitvoering van de overeenkomst.
          </li>
          <li>
            <strong>Foto’s en video’s:</strong> de bestanden die je in een groep deelt, met technische gegevens zoals het
            tijdstip waarop ze gemaakt zijn, afmetingen, de lengte van een video, de gekozen camerastijl, of het uit je
            filmrol komt en een eventueel bijschrift. Waarom: om ze te tonen aan je groep. Grondslag: uitvoering van de
            overeenkomst.
          </li>
          <li>
            <strong>Reacties en favorieten:</strong> welke emoji’s je bij foto’s zet en welke foto’s je als favoriet markeert,
            en welke foto’s je voor jezelf hebt verborgen. Grondslag: uitvoering van de overeenkomst.
          </li>
          <li>
            <strong>Pushtokens en meldingsinstellingen:</strong> een token van je toestel en je keuzes voor meldingen over
            nieuwe foto’s en recaps. Waarom: om je meldingen te sturen. Grondslag: toestemming, die je geeft via de
            meldingsvraag van je telefoon. Je kunt die altijd intrekken in de instellingen van je telefoon of in de app.
          </li>
          <li>
            <strong>Abonnement en Pro:</strong> of je Pro hebt, tot wanneer, en of je Pro als cadeau van CamTrip hebt gekregen.
            Betaalgegevens zien wij nooit; die blijven bij Apple of Google. Grondslag: uitvoering van de overeenkomst.
          </li>
          <li>
            <strong>Veiligheid en moderatie:</strong> meldingen die je doet of die over jouw foto’s gaan, de mensen die je hebt
            geblokkeerd, een eventuele blokkade van je account met de reden, en tijdelijke registraties van inlogpogingen
            (met je e-mailadres en IP-adres) om misbruik zoals het raden van wachtwoorden tegen te gaan. Grondslag:
            gerechtvaardigd belang, namelijk een veilige app en het beschermen van gebruikers tegen misbruik.
          </li>
          <li>
            <strong>Technische logs:</strong> onze hosting houdt korte tijd technische gegevens bij, zoals IP-adressen en
            foutmeldingen. Grondslag: gerechtvaardigd belang, namelijk de app veilig en werkend houden.
          </li>
        </ul>
        <p>
          We vragen geen toegang tot je locatie en slaan geen locatie op als apart gegeven. Let op: video’s en foto’s uit je
          filmrol kunnen metadata bevatten die je telefoon erin heeft gezet (zoals een locatie). Wie zo’n bestand
          downloadt, kan die metadata zien. We gebruiken geen advertenties, maken geen profielen van je en verkopen nooit
          gegevens aan anderen.
        </p>

        <h2>Toestemmingen in de app</h2>
        <ul>
          <li>
            <strong>Camera:</strong> om foto’s en video’s te maken in de app.
          </li>
          <li>
            <strong>Microfoon:</strong> alleen om geluid op te nemen bij video’s.
          </li>
          <li>
            <strong>Foto’s en video’s op je toestel:</strong> om foto’s uit je filmrol te kiezen en om foto’s uit je groep op
            je telefoon op te slaan.
          </li>
          <li>
            <strong>Meldingen:</strong> om je te laten weten dat er nieuwe foto’s of een recap klaarstaan.
          </li>
        </ul>
        <p>
          Je kiest zelf of je deze toestemmingen geeft en kunt ze altijd intrekken in de instellingen van je telefoon. Zonder
          een toestemming werkt het bijbehorende onderdeel niet, de rest van de app wel.
        </p>

        <h2>Inloggen met e-mail en wachtwoord</h2>
        <p>
          Kies je voor een account met e-mail en wachtwoord, dan bewaren we je wachtwoord nooit als leesbare tekst. We
          slaan alleen een hash op die gemaakt is met scrypt, met een unieke salt per wachtwoord. Na te veel inlogpogingen
          in korte tijd blokkeren we tijdelijk verdere pogingen. Ben je je wachtwoord vergeten, dan sturen we je een code
          van 6 cijfers per e-mail. Die code is 15 minuten geldig en we bewaren alleen een versleutelde versie ervan.
        </p>

        <h2>Inloggen met Apple of Google</h2>
        <p>
          Log je in met Apple of Google, dan krijgen we van hen een id voor je account en, als je dat toestaat, je naam en
          e-mailadres. Bij Apple kun je ervoor kiezen je e-mailadres te verbergen; dan krijgen we een doorstuuradres van
          Apple. Je wachtwoord bij Apple of Google zien we nooit. Bij inloggen met Apple bewaren we een versleuteld token van
          Apple, zodat we de koppeling met CamTrip bij Apple kunnen intrekken als je je account verwijdert.
        </p>

        <h2>Wie je foto’s kan zien</h2>
        <p>
          Alleen de leden van de groep waarin je ze deelt. Groepen zijn privé en alleen te joinen met de groepscode of
          uitnodigingslink. Deel die code dus alleen met mensen die je in de groep wilt hebben. Groepsleden kunnen je foto’s
          bekijken, erop reageren en ze downloaden; wat ze eenmaal op hun eigen telefoon hebben opgeslagen, kunnen wij niet
          meer verwijderen. Je naam en avatarkleur zijn zichtbaar voor de leden van groepen waar je in zit.
        </p>

        <h2>Melden, blokkeren en moderatie</h2>
        <p>
          Zie je een foto die niet deugt, dan kun je die melden. De foto wordt dan direct voor jou verborgen. Je kunt ook
          iemand blokkeren; je ziet dan geen foto’s meer van die persoon. Meldingen worden binnen 24 uur bekeken door het
          CamTrip-team. Daarbij zien we de gemelde foto, de reden van de melding en beperkte accountgegevens van de
          betrokkenen. Als iets in strijd is met onze voorwaarden, kunnen we de foto verwijderen en het account blokkeren.
          Moderatoren kijken alleen naar content als dat nodig is om een melding af te handelen of misbruik te onderzoeken.
        </p>

        <h2>Hoe lang we gegevens bewaren</h2>
        <ul>
          <li>
            Gratis groepen: tot 30 dagen na de einddatum van de groep. Daarna verwijderen we de groep met alle foto’s, video’s,
            reacties en meldingen automatisch.
          </li>
          <li>
            Groepen met Pro (minstens één lid heeft Pro): zolang de groep bestaat. Heeft niemand in de groep meer Pro, dan
            gelden de regels voor gratis groepen weer.
          </li>
          <li>
            Je account: tot je het zelf verwijdert via Instellingen → Account verwijderen. Daarmee verwijderen we je
            accountgegevens, al je foto’s en video’s, je reacties, favorieten en de meldingen die je zelf hebt gedaan. Groepen
            waarin je de laatste was worden helemaal verwijderd; andere groepen blijven bestaan voor de overige leden. Heb je
            met Apple ingelogd, dan trekken we ook de koppeling bij Apple in.
          </li>
          <li>
            Meldingen over jouw content: zolang nodig is voor de moderatie, en uiterlijk tot de groep wordt verwijderd.
          </li>
          <li>Uploads die nooit afgerond zijn: na 2 dagen.</li>
          <li>Registraties van inlogpogingen: 15 minuten.</li>
          <li>Codes om je wachtwoord te herstellen: 15 minuten geldig, daarna onbruikbaar.</li>
          <li>
            Back-ups en technische logs: verwijderde gegevens kunnen nog maximaal ongeveer 30 dagen in back-ups of logs staan,
            daarna zijn ze ook daar weg.
          </li>
        </ul>

        <h2>Met wie we gegevens delen</h2>
        <p>
          We delen gegevens alleen met bedrijven die we nodig hebben om CamTrip te laten werken (verwerkers). Zij mogen je
          gegevens alleen voor ons gebruiken en niet voor zichzelf.
        </p>
        <ul>
          <li>Vercel: hosting van de website en de server van de app (servers in de EU en de VS).</li>
          <li>MongoDB Atlas: database met account- en groepsgegevens, opgeslagen in Frankfurt (AWS eu-central-1).</li>
          <li>Cloudflare R2: opslag van foto’s en video’s.</li>
          <li>Apple Push Notification service: het afleveren van pushmeldingen.</li>
          <li>RevenueCat: beheer van abonnementen. De betaling zelf loopt via de App Store of Google Play.</li>
          <li>Resend: het versturen van e-mails, zoals codes om je wachtwoord te herstellen.</li>
          <li>Apple en Google: inloggen met je Apple- of Google-account, als je daarvoor kiest.</li>
        </ul>
        <p>
          Daarnaast geven we gegevens alleen door als de wet ons daartoe verplicht, bijvoorbeeld op een rechtmatig verzoek
          van de politie.
        </p>

        <h2>Doorgifte buiten de EU</h2>
        <p>
          Een deel van deze bedrijven is gevestigd in de Verenigde Staten of kan gegevens daar verwerken. In dat geval zorgen
          we voor passende waarborgen, zoals de standaardcontractbepalingen (SCC’s) van de Europese Commissie of certificering
          onder het EU-US Data Privacy Framework.
        </p>

        <h2>Kinderen</h2>
        <p>
          CamTrip is bedoeld voor mensen van 13 jaar en ouder. Ben je jonger dan 16 en woon je in een land waar daarvoor
          toestemming van een ouder of voogd nodig is (zoals in Nederland), gebruik CamTrip dan alleen met die toestemming.
          Merken we dat een kind jonger dan 13 een account heeft, of dat de vereiste toestemming ontbreekt, dan verwijderen we
          het account. Denk je dat dit het geval is, mail dan naar{' '}
          <a href="mailto:support@camtrip.app">support@camtrip.app</a>.
        </p>

        <h2>Je rechten</h2>
        <p>Op grond van de AVG heb je de volgende rechten:</p>
        <ul>
          <li>Inzage: opvragen welke gegevens we van je hebben.</li>
          <li>Rectificatie: onjuiste gegevens laten aanpassen. Je naam en avatarkleur pas je zelf aan in de app.</li>
          <li>Verwijdering: je account en al je foto’s verwijder je zelf in de app. Je kunt ons ook vragen dit te doen.</li>
          <li>
            Overdraagbaarheid: een kopie van je gegevens krijgen in een gangbaar formaat. Foto’s van een groep kun je ook zelf
            downloaden in de app.
          </li>
          <li>Bezwaar: bezwaar maken tegen verwerking op basis van ons gerechtvaardigd belang.</li>
          <li>Beperking: vragen om de verwerking tijdelijk te beperken.</li>
          <li>Toestemming intrekken: bijvoorbeeld voor pushmeldingen, via de instellingen van je telefoon of de app.</li>
        </ul>
        <p>
          Voor een verzoek mail je naar <a href="mailto:support@camtrip.app">support@camtrip.app</a>. We reageren binnen een
          maand en kunnen je vragen te bevestigen dat het account van jou is. Ben je het niet eens met hoe we met je gegevens
          omgaan, dan kun je een klacht indienen bij de Autoriteit Persoonsgegevens (autoriteitpersoonsgegevens.nl). We horen
          het liefst eerst van jou, zodat we het samen kunnen oplossen.
        </p>

        <h2>Beveiliging</h2>
        <p>
          Alle verbindingen tussen de app en onze server zijn versleuteld (HTTPS). Foto’s en video’s zijn alleen op te halen
          met tijdelijke, ondertekende links die we alleen aan groepsleden geven. Wachtwoorden en tokens bewaren we gehasht of
          versleuteld.
        </p>

        <h2>Cookies op de website</h2>
        <p>
          De website camtrip.app gebruikt alleen cookies en vergelijkbare technieken die strikt nodig zijn om de site te laten
          werken. We gebruiken geen analytische of trackingcookies en geen advertentienetwerken. Daarom vragen we ook geen
          toestemming voor cookies.
        </p>

        <h2>Wijzigingen</h2>
        <p>
          Als de app verandert, kan dit beleid ook veranderen. De datum bovenaan laat zien wanneer het voor het laatst is
          bijgewerkt. Bij belangrijke wijzigingen laten we het je vooraf weten in de app.
        </p>

        <h2>Summary in English</h2>
        <p>
          CamTrip is made by Alex Lamper (AL Design, Middelharnis, the Netherlands). We only process what the app needs: your
          account (name, e-mail, a scrypt password hash or your Apple/Google id), your groups, the photos and videos you share
          with their metadata, reactions, push tokens (with your consent) and your Pro status. Your photos are only visible to
          members of the group you share them in. You can report photos and block people; reports are reviewed within 24
          hours and we may remove content and ban accounts. Free groups are deleted 30 days after their end date. Deleting
          your account in the app removes your data (and revokes Sign in with Apple); backups and logs are cleared within
          about 30 days and login-attempt records after 15 minutes. We use processors (Vercel, MongoDB Atlas in Frankfurt,
          Cloudflare R2, Apple Push Notification service, RevenueCat, Resend, Apple and Google sign-in) with safeguards such
          as SCCs or the EU-US Data Privacy Framework for transfers outside the EU. CamTrip is for ages 13 and up, with
          parental consent where national law requires it. You have the right to access, correct, delete and export your data,
          to object, and to complain to the Dutch Data Protection Authority (Autoriteit Persoonsgegevens). The website only
          uses strictly necessary cookies and no tracking. Contact: support@camtrip.app. This summary is for convenience; the
          Dutch text above prevails.
        </p>
      </main>
      <Footer />
    </>
  );
}
