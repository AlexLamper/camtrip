import { Footer, Nav, StoreButtons } from '@/components/site';
import { StyleLab } from '@/components/style-lab';

function Phone({ src, alt, priority }: { src: string; alt: string; priority?: boolean }) {
  return (
    <img
      className="phone-shot"
      src={`/examples/screens/screen-${src}.webp`}
      alt={alt}
      width={454}
      height={956}
      loading={priority ? 'eager' : 'lazy'}
      decoding="async"
    />
  );
}

const PRINTS = [
  { file: 'strand-instant', style: 'Instant', label: 'Strand, 13 juli', alt: 'Vrienden rond een kampvuur op het strand' },
  { file: 'vrienden-film', style: 'Film', label: 'Boulevard', alt: 'Een groep vrienden loopt de ondergaande zon tegemoet' },
  { file: 'roadtrip-wegwerp', style: 'Wegwerp', label: 'Roadtrip', alt: 'Iemand rent over een lege weg richting de bergen' },
  { file: 'stad-golden', style: 'Golden', label: 'Citytrip', alt: 'Een smal steegje met uitzicht op zee' },
  { file: 'bergen-chrome', style: 'Chrome', label: 'Bergen', alt: 'Een wandelaar met rugzak in een groen bergdal' },
  { file: 'sneeuw-zw', style: 'Z/W', label: 'Sneeuw', alt: 'Twee toerskiers klimmen een besneeuwde helling op' },
] as const;

function Prints() {
  return (
    <section className="prints-band" aria-label="Voorbeeldfoto's in verschillende stijlen">
      <div className="prints">
        {PRINTS.map((p) => (
          <figure key={p.file} className="pol print">
            <picture>
              <source type="image/webp" srcSet={`/examples/print-${p.file}.webp`} />
              <img src={`/examples/print-${p.file}.jpg`} alt={p.alt} width={480} height={640} loading="lazy" decoding="async" />
            </picture>
            <figcaption>
              {p.label}
              <span>{p.style}</span>
            </figcaption>
          </figure>
        ))}
      </div>
      <p className="wrap prints-note">Voorbeeldfoto’s, bewerkt met de echte camerastijlen uit de app.</p>
    </section>
  );
}

function Icon({ d }: { d: string }) {
  return (
    <svg viewBox="0 0 24 24" fill="none" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden>
      <path d={d} />
    </svg>
  );
}

export default function Home() {
  return (
    <>
      <Nav />
      <main>
        <div className="wrap hero">
          <div>
            <h1 className="display">
              Eén rolletje
              <br />
              voor de hele groep.
            </h1>
            <p className="lead">
              Schiet met een retro-camera. Iedereen in je groep ziet je foto’s direct, en ze staan meteen in je eigen
              album. Nooit meer “stuur je die foto’s nog even?”.
            </p>
            <StoreButtons />
            <p className="note">Gratis te downloaden · voor iPhone en Android</p>
          </div>
          <div className="phones">
            <Phone src="camera" alt="De CamTrip-camera met instant-stijl" priority />
            <Phone src="galerij" alt="De gedeelde galerij van een groep" priority />
          </div>
        </div>

        <Prints />

        <section className="wrap">
          <h2 className="display">Zo werkt het</h2>
          <p className="sub">Op vakantie, een feest of een weekendje weg. In drie stappen deelt iedereen alles.</p>
          <div className="steps section-body">
            <div className="step">
              <h3>Maak een groep</h3>
              <p>Geef je trip een naam en kies de data. Je krijgt een code, een QR-code en een link.</p>
            </div>
            <div className="step">
              <h3>Vrienden joinen</h3>
              <p>Deel de link in WhatsApp of laat ze de QR-code scannen. Klaar in tien seconden.</p>
            </div>
            <div className="step">
              <h3>Schiet en zie alles</h3>
              <p>Elke foto staat direct bij iedereen in de app, en in je eigen fotoalbum.</p>
            </div>
          </div>
          <div className="screens">
            <figure>
              <Phone src="albums" alt="Overzicht van je albums in CamTrip" />
              <figcaption>
                Al je trips op een rij
                <span>Join met een code of QR-code</span>
              </figcaption>
            </figure>
            <figure>
              <Phone src="detail" alt="Een foto met reacties van de groep" />
              <figcaption>
                Reageer op elkaars foto’s
                <span>Hartjes, favorieten en opslaan</span>
              </figcaption>
            </figure>
            <figure>
              <Phone src="recap" alt="De recap-video van een trip" />
              <figcaption>
                Recap-video met muziek
                <span>Klaar om te delen na je trip</span>
              </figcaption>
            </figure>
          </div>
        </section>

        <section className="wrap">
          <h2 className="display">Foto’s met karakter</h2>
          <p className="sub">Kies je camera. Elke stijl zie je live in de zoeker, dus je weet precies wat je krijgt. Probeer ze hieronder uit op een echte foto.</p>
          <StyleLab />
        </section>

        <section className="wrap">
          <h2 className="display">Gemaakt voor onderweg</h2>
          <div className="features section-body">
            <div className="feature">
              <div className="ic">
                <Icon d="M5 12.55a11 11 0 0 1 14.08 0M1.42 9a16 16 0 0 1 21.16 0M8.53 16.11a6 6 0 0 1 6.95 0M12 20h.01" />
              </div>
              <h3>Werkt zonder bereik</h3>
              <p>Op het strand of in de bergen? Je foto’s wachten netjes en worden gedeeld zodra je weer internet hebt.</p>
            </div>
            <div className="feature">
              <div className="ic">
                <Icon d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4M7 10l5 5 5-5M12 15V3" />
              </div>
              <h3>Alles in één tik opslaan</h3>
              <p>Sla alle foto’s van de trip in één keer op in je album, of kies alleen je favorieten.</p>
            </div>
            <div className="feature">
              <div className="ic">
                <Icon d="M23 7l-7 5 7 5V7zM14 5H3a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h11a2 2 0 0 0 2-2V7a2 2 0 0 0-2-2z" />
              </div>
              <h3>Automatische recap</h3>
              <p>Na afloop maakt CamTrip een video met muziek van jullie mooiste momenten, klaar voor Instagram en TikTok.</p>
            </div>
          </div>
        </section>

        <section className="wrap">
          <h2 className="display">Gratis, of Pro</h2>
          <p className="sub">
            Voor de meeste groepen is gratis genoeg. En <strong>één Pro in de groep = Pro voor iedereen in die groep.</strong>
          </p>
          <div className="pricing section-body">
            <div className="plan">
              <h3>Gratis</h3>
              <div className="price">€0</div>
              <div className="per">voor altijd</div>
              <ul>
                <li>Groepen tot 10 personen</li>
                <li>Film, Instant en Wegwerp</li>
                <li>Foto’s en video’s delen</li>
                <li>Bewaard tot 30 dagen na je trip</li>
              </ul>
            </div>
            <div className="plan pro">
              <h3>CamTrip Pro</h3>
              <div className="price">€49,99</div>
              <div className="per">per jaar · of €7,99 per maand · 7 dagen gratis proberen</div>
              <ul>
                <li>Alle camerastijlen</li>
                <li>Onbeperkt leden en opslag</li>
                <li>Recaps zonder watermerk</li>
                <li>Originele kwaliteit downloaden</li>
                <li>Geldt voor je hele groep</li>
              </ul>
            </div>
          </div>
        </section>

        <section className="wrap">
          <h2 className="display">Vragen</h2>
          <div className="faq section-body">
            <details>
              <summary>Moet iedereen in de groep de app hebben?</summary>
              <p>Ja, om mee te fotograferen en alles te zien. De app is gratis voor iPhone en Android.</p>
            </details>
            <details>
              <summary>Komen de foto’s ook in mijn eigen fotoalbum?</summary>
              <p>
                Je eigen foto’s meteen, in een album met de naam van je groep. Foto’s van anderen sla je op wanneer jij wilt,
                los of allemaal tegelijk.
              </p>
            </details>
            <details>
              <summary>Wie kan mijn foto’s zien?</summary>
              <p>Alleen de mensen in je groep. Groepen zijn privé en alleen te joinen met de code of link.</p>
            </details>
            <details>
              <summary>Moet iedereen in mijn groep Pro nemen?</summary>
              <p>
                Nee. Eén Pro-lid is genoeg: de groep wordt dan een Pro-groep voor iedereen erin, met alle camerastijlen,
                onbeperkt leden, originele kwaliteit en recaps zonder watermerk. Gaat dat lid uit de groep of stopt het
                abonnement, dan wordt de groep weer gratis.
              </p>
            </details>
            <details>
              <summary>Hoe lang blijven de foto’s bewaard?</summary>
              <p>
                Gratis groepen blijven tot 30 dagen na de einddatum, daarna worden ze verwijderd. Zodra iemand in de groep
                Pro heeft, blijven ze altijd bewaard. Vergeet niet op tijd op “Alles opslaan” te tikken.
              </p>
            </details>
          </div>
        </section>

        <section className="wrap">
          <div className="cta">
            <h2 className="display">Klaar voor je volgende trip?</h2>
            <p>Download CamTrip, maak een groep en stuur de link naar je vrienden.</p>
            <StoreButtons />
          </div>
        </section>
      </main>
      <Footer />
    </>
  );
}
