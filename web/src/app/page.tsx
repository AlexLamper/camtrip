import { Footer, Nav, StoreButtons } from '@/components/site';

const SCENES = {
  film: 'radial-gradient(circle at 62% 46%, #ffe7a3 0 7%, transparent 8%), linear-gradient(#f59e5b 0%, #f7c27a 42%, #3d7ea6 43%, #2c6a8f 62%, #e9d2a4 63%, #d9b984 100%)',
  instant: 'radial-gradient(ellipse at 30% 70%, #9be7f0 0 12%, transparent 30%), linear-gradient(160deg, #3fc1d3, #1f8fb0 55%, #f3e5c8 56%, #e7d1aa)',
  disposable:
    'radial-gradient(circle at 50% 75%, #fff 0 9%, #e9e2d6 10% 14%, transparent 15%), linear-gradient(#c96e3e 0 35%, #f1d9b5 36% 100%)',
};

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
            <img src="/screen-camera.png" alt="De CamTrip-camera met instant-stijl" />
            <img src="/screen-galerij.png" alt="De gedeelde galerij van een groep" />
          </div>
        </div>

        <section className="wrap">
          <h2 className="display">Zo werkt het</h2>
          <p className="sub">Op vakantie, een feest of een weekendje weg. In drie stappen deelt iedereen alles.</p>
          <div className="steps">
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
        </section>

        <section className="wrap">
          <h2 className="display">Foto’s met karakter</h2>
          <p className="sub">Kies je camera. Elke stijl zie je live in de zoeker, dus je weet precies wat je krijgt.</p>
          <div className="styles-row">
            {(
              [
                ['film', 'Film 400', 'Warme kleuren, korrel en een oranje datumstempel'],
                ['instant', 'Instant', 'Zachte kleuren en een witte rand'],
                ['disposable', 'Wegwerp', 'Harde flits, vignet en lichtlekken'],
              ] as const
            ).map(([key, title, sub]) => (
              <figure key={key} className="pol">
                <div className="shot" style={{ background: SCENES[key] }} />
                <figcaption>
                  {title}
                  <span>{sub}</span>
                </figcaption>
              </figure>
            ))}
          </div>
        </section>

        <section className="wrap">
          <h2 className="display">Gemaakt voor onderweg</h2>
          <div className="features">
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
          <p className="sub">Voor de meeste groepen is gratis genoeg. Pro is voor als je alles wilt.</p>
          <div className="pricing">
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
              </ul>
            </div>
          </div>
        </section>

        <section className="wrap">
          <h2 className="display">Vragen</h2>
          <div className="faq">
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
              <summary>Hoe lang blijven de foto’s bewaard?</summary>
              <p>
                Gratis groepen blijven tot 30 dagen na de einddatum, daarna worden ze verwijderd. Met Pro blijven ze altijd
                bewaard. Vergeet niet op tijd op “Alles opslaan” te tikken.
              </p>
            </details>
          </div>
        </section>

        <div className="wrap">
          <div className="cta">
            <h2 className="display">Klaar voor je volgende trip?</h2>
            <p>Download CamTrip, maak een groep en stuur de link naar je vrienden.</p>
            <StoreButtons />
          </div>
        </div>
      </main>
      <Footer />
    </>
  );
}
