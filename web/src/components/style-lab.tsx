'use client';

import { useEffect, useRef, useState } from 'react';

const STYLES = [
  { id: 'film', name: 'Film', pro: false, desc: 'Warme kleuren, korrel en een oranje datumstempel.' },
  { id: 'instant', name: 'Instant', pro: false, desc: 'Zachte, iets vervaagde kleuren en een witte rand.' },
  { id: 'wegwerp', name: 'Wegwerp', pro: false, desc: 'Harde flits, diep vignet en lichtlekken.' },
  { id: 'zw', name: 'Z/W', pro: true, desc: 'Korrelig zwart-wit met diep contrast.' },
  { id: 'golden', name: 'Golden', pro: true, desc: 'Altijd golden hour, met een zachte gouden gloed.' },
  { id: 'chrome', name: 'Chrome', pro: true, desc: 'Koel, verzadigd en scherp, als dia-film.' },
] as const;

const SCENES = [
  { id: 'strand', name: 'Strand', alt: 'Vrienden rond een kampvuur op het strand bij zonsondergang' },
  { id: 'roadtrip', name: 'Roadtrip', alt: 'Een lange weg richting besneeuwde bergen' },
  { id: 'stad', name: 'Stad', alt: 'Een smal steegje met uitzicht op zee' },
] as const;

type StyleId = (typeof STYLES)[number]['id'];
type SceneId = (typeof SCENES)[number]['id'];

function Photo({ name, alt, className, hidden }: { name: string; alt: string; className?: string; hidden?: boolean }) {
  return (
    <picture>
      <source type="image/webp" srcSet={`/examples/${name}.webp`} />
      <img
        className={className}
        src={`/examples/${name}.jpg`}
        alt={hidden ? '' : alt}
        aria-hidden={hidden || undefined}
        width={720}
        height={960}
        loading="lazy"
        decoding="async"
      />
    </picture>
  );
}

export function StyleLab() {
  const [style, setStyle] = useState<StyleId>('film');
  const [scene, setScene] = useState<SceneId>('strand');
  const [pos, setPos] = useState(50);
  const chips = useRef<(HTMLButtonElement | null)[]>([]);
  const video = useRef<HTMLVideoElement>(null);

  // No moving pictures for people who asked for less motion.
  useEffect(() => {
    const v = video.current;
    if (v && window.matchMedia('(prefers-reduced-motion: reduce)').matches) {
      v.pause();
      v.removeAttribute('autoplay');
    }
  }, []);

  const current = STYLES.find((s) => s.id === style)!;
  const sceneInfo = SCENES.find((s) => s.id === scene)!;

  // Arrow keys move between the style chips (roving focus).
  function onChipKey(e: React.KeyboardEvent, i: number) {
    const keys: Record<string, number> = { ArrowRight: 1, ArrowDown: 1, ArrowLeft: -1, ArrowUp: -1 };
    let next: number | null = null;
    if (e.key in keys) next = (i + keys[e.key] + STYLES.length) % STYLES.length;
    if (e.key === 'Home') next = 0;
    if (e.key === 'End') next = STYLES.length - 1;
    if (next === null) return;
    e.preventDefault();
    setStyle(STYLES[next].id);
    chips.current[next]?.focus();
  }

  return (
    <div className="lab section-body">
      <figure className="lab-stage pol">
        <div className="lab-frame" style={{ '--pos': `${pos}%` } as React.CSSProperties}>
          <Photo key={`${scene}-o`} name={`${scene}-origineel`} alt={sceneInfo.alt} className="lab-img" />
          <div className="lab-styled">
            {STYLES.map((s) => (
              <Photo
                key={`${scene}-${s.id}`}
                name={`${scene}-${s.id}`}
                alt={`${sceneInfo.alt}, met de stijl ${s.name}`}
                hidden={s.id !== style}
                className={`lab-img${s.id === style ? ' on' : ''}`}
              />
            ))}
          </div>
          <span className="lab-tag before" aria-hidden>
            Origineel
          </span>
          <span className="lab-tag after" aria-hidden>
            {current.name}
          </span>
          <div className="lab-handle" aria-hidden />
          <input
            className="lab-range"
            type="range"
            min={0}
            max={100}
            step={1}
            value={pos}
            onChange={(e) => setPos(Number(e.target.value))}
            aria-label={`Vergelijk het origineel met de stijl ${current.name}`}
            aria-valuetext={`${100 - pos}% ${current.name}`}
          />
        </div>
        <figcaption>
          {sceneInfo.name} · {current.name}
          <span>Sleep om voor en na te vergelijken</span>
        </figcaption>
      </figure>

      <div className="lab-panel">
        <div className="chips" role="group" aria-label="Camerastijl">
          {STYLES.map((s, i) => (
            <button
              key={s.id}
              ref={(el) => {
                chips.current[i] = el;
              }}
              type="button"
              className="chip"
              aria-pressed={s.id === style}
              tabIndex={s.id === style ? 0 : -1}
              onClick={() => setStyle(s.id)}
              onKeyDown={(e) => onChipKey(e, i)}
            >
              {s.name}
              {s.pro && <span className="pro">Pro</span>}
            </button>
          ))}
        </div>
        <p className="lab-desc" aria-live="polite">
          <strong>{current.name}</strong> {current.desc}
          {current.pro && <span className="muted"> Onderdeel van CamTrip Pro.</span>}
        </p>

        <div className="lab-scenes">
          <span>Andere foto:</span>
          {SCENES.map((s) => (
            <button key={s.id} type="button" className="chip small" aria-pressed={s.id === scene} onClick={() => setScene(s.id)}>
              {s.name}
            </button>
          ))}
        </div>

        <div className="lab-video">
          <video
            ref={video}
            src="/examples/video-film.mp4"
            poster="/examples/video-film-poster.webp"
            width={480}
            height={640}
            muted
            loop
            playsInline
            autoPlay
            aria-label="Voorbeeldvideo met de stijl Film"
          />
          <div>
            <h3>Ook voor video</h3>
            <p>Dezelfde stijl zit ook in je video’s: kleur, vignet en korrel, live in de zoeker en meteen gedeeld met je groep.</p>
          </div>
        </div>
      </div>
    </div>
  );
}
