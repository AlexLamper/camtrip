// Push texts in the 18 app languages, with the same terms as the app
// (app/lib/l10n/GLOSSARY.md and the ARB files). Fallback: English.
// Pure (no runtime imports), so it also runs under `node --experimental-strip-types` in the tests.

export const PUSH_LOCALES = [
  'nl', 'en', 'de', 'fr', 'es', 'it', 'pt', 'pt_BR', 'pl', 'sv', 'da', 'nb', 'fi', 'cs', 'tr', 'ja', 'ko', 'zh',
] as const;
export type PushLocale = (typeof PUSH_LOCALES)[number];
export type ReportReason = 'ongepast' | 'spam' | 'anders';

interface Texts {
  newPhotos: (name: string, group: string) => string;
  newVideos: (name: string, group: string) => string;
  someone: string;
  recapTitle: (group: string) => string;
  recapBody: (count: number) => string;
  resetCode: (code: string, minutes: number) => string;
  reportTitle: string;
  reportBody: (reason: string, group: string) => string;
  reasons: Record<ReportReason, string>;
}

const T: Record<PushLocale, Texts> = {
  nl: {
    newPhotos: (n, g) => `${n} deelt foto's in ${g}`,
    newVideos: (n, g) => `${n} deelt video's in ${g}`,
    someone: 'Iemand',
    recapTitle: (g) => `Je recap van ${g} is klaar 🎞️`,
    recapBody: (c) => `${c} foto's, klaar om te bekijken en te delen.`,
    resetCode: (c, m) => `Je CamTrip-code: ${c} - geldig voor ${m} minuten. Niet aangevraagd? Negeer dit bericht.`,
    reportTitle: 'Beheer',
    reportBody: (r, g) => `Nieuwe melding: ${r} in ${g}`,
    reasons: { ongepast: 'Ongepast of aanstootgevend', spam: 'Spam', anders: 'Iets anders' },
  },
  en: {
    newPhotos: (n, g) => `${n} is sharing photos in ${g}`,
    newVideos: (n, g) => `${n} is sharing videos in ${g}`,
    someone: 'Someone',
    recapTitle: (g) => `Your recap of ${g} is ready 🎞️`,
    recapBody: (c) => `${c} photos, ready to watch and share.`,
    resetCode: (c, m) => `Your CamTrip code: ${c} - valid for ${m} minutes. Didn't ask for it? Ignore this message.`,
    reportTitle: 'Manage',
    reportBody: (r, g) => `New report: ${r} in ${g}`,
    reasons: { ongepast: 'Inappropriate or offensive', spam: 'Spam', anders: 'Something else' },
  },
  de: {
    newPhotos: (n, g) => `${n} teilt Fotos in ${g}`,
    newVideos: (n, g) => `${n} teilt Videos in ${g}`,
    someone: 'Jemand',
    recapTitle: (g) => `Dein Recap von ${g} ist fertig 🎞️`,
    recapBody: (c) => `${c} Fotos, bereit zum Ansehen und Teilen.`,
    resetCode: (c, m) => `Dein CamTrip-Code: ${c} - ${m} Minuten gültig. Nicht angefordert? Ignoriere diese Nachricht.`,
    reportTitle: 'Verwalten',
    reportBody: (r, g) => `Neue Meldung: ${r} in ${g}`,
    reasons: { ongepast: 'Unangemessen oder anstößig', spam: 'Spam', anders: 'Etwas anderes' },
  },
  fr: {
    newPhotos: (n, g) => `${n} partage des photos dans ${g}`,
    newVideos: (n, g) => `${n} partage des vidéos dans ${g}`,
    someone: "Quelqu'un",
    recapTitle: (g) => `Ton récap de ${g} est prêt 🎞️`,
    recapBody: (c) => `${c} photos, prêtes à regarder et à partager.`,
    resetCode: (c, m) => `Ton code CamTrip : ${c} - valable ${m} minutes. Tu ne l'as pas demandé ? Ignore ce message.`,
    reportTitle: 'Gestion',
    reportBody: (r, g) => `Nouveau signalement : ${r} dans ${g}`,
    reasons: { ongepast: 'Inapproprié ou choquant', spam: 'Spam', anders: 'Autre chose' },
  },
  es: {
    newPhotos: (n, g) => `${n} comparte fotos en ${g}`,
    newVideos: (n, g) => `${n} comparte vídeos en ${g}`,
    someone: 'Alguien',
    recapTitle: (g) => `Tu resumen de ${g} está listo 🎞️`,
    recapBody: (c) => `${c} fotos, listas para ver y compartir.`,
    resetCode: (c, m) => `Tu código de CamTrip: ${c} - válido durante ${m} minutos. ¿No lo has pedido? Ignora este mensaje.`,
    reportTitle: 'Gestión',
    reportBody: (r, g) => `Nueva denuncia: ${r} en ${g}`,
    reasons: { ongepast: 'Inapropiado u ofensivo', spam: 'Spam', anders: 'Otra cosa' },
  },
  it: {
    newPhotos: (n, g) => `${n} condivide foto in ${g}`,
    newVideos: (n, g) => `${n} condivide video in ${g}`,
    someone: 'Qualcuno',
    recapTitle: (g) => `Il tuo recap di ${g} è pronto 🎞️`,
    recapBody: (c) => `${c} foto, pronte da guardare e condividere.`,
    resetCode: (c, m) => `Il tuo codice CamTrip: ${c} - valido per ${m} minuti. Non l'hai richiesto? Ignora questo messaggio.`,
    reportTitle: 'Gestione',
    reportBody: (r, g) => `Nuova segnalazione: ${r} in ${g}`,
    reasons: { ongepast: 'Inappropriato od offensivo', spam: 'Spam', anders: 'Altro' },
  },
  pt: {
    newPhotos: (n, g) => `${n} está a partilhar fotos em ${g}`,
    newVideos: (n, g) => `${n} está a partilhar vídeos em ${g}`,
    someone: 'Alguém',
    recapTitle: (g) => `O teu resumo de ${g} está pronto 🎞️`,
    recapBody: (c) => `${c} fotos, prontas para ver e partilhar.`,
    resetCode: (c, m) => `O teu código CamTrip: ${c} - válido durante ${m} minutos. Não o pediste? Ignora esta mensagem.`,
    reportTitle: 'Gestão',
    reportBody: (r, g) => `Nova denúncia: ${r} em ${g}`,
    reasons: { ongepast: 'Inadequado ou ofensivo', spam: 'Spam', anders: 'Outra coisa' },
  },
  pt_BR: {
    newPhotos: (n, g) => `${n} está compartilhando fotos em ${g}`,
    newVideos: (n, g) => `${n} está compartilhando vídeos em ${g}`,
    someone: 'Alguém',
    recapTitle: (g) => `Sua retrospectiva de ${g} está pronta 🎞️`,
    recapBody: (c) => `${c} fotos, prontas para ver e compartilhar.`,
    resetCode: (c, m) => `Seu código CamTrip: ${c} - válido por ${m} minutos. Não pediu? Ignore esta mensagem.`,
    reportTitle: 'Gerenciar',
    reportBody: (r, g) => `Nova denúncia: ${r} em ${g}`,
    reasons: { ongepast: 'Inadequado ou ofensivo', spam: 'Spam', anders: 'Outro motivo' },
  },
  pl: {
    newPhotos: (n, g) => `${n} udostępnia zdjęcia w grupie ${g}`,
    newVideos: (n, g) => `${n} udostępnia wideo w grupie ${g}`,
    someone: 'Ktoś',
    recapTitle: (g) => `Podsumowanie grupy ${g} jest gotowe 🎞️`,
    recapBody: (c) => `Liczba zdjęć: ${c} - możesz je obejrzeć i udostępnić.`,
    resetCode: (c, m) => `Twój kod CamTrip: ${c} - ważny przez ${m} minut. To nie Ty? Zignoruj tę wiadomość.`,
    reportTitle: 'Zarządzanie',
    reportBody: (r, g) => `Nowe zgłoszenie: ${r} w grupie ${g}`,
    reasons: { ongepast: 'Nieodpowiednie lub obraźliwe', spam: 'Spam', anders: 'Coś innego' },
  },
  sv: {
    newPhotos: (n, g) => `${n} delar bilder i ${g}`,
    newVideos: (n, g) => `${n} delar videor i ${g}`,
    someone: 'Någon',
    recapTitle: (g) => `Din återblick från ${g} är klar 🎞️`,
    recapBody: (c) => `${c} bilder, redo att titta på och dela.`,
    resetCode: (c, m) => `Din CamTrip-kod: ${c} - giltig i ${m} minuter. Bad du inte om den? Ignorera det här meddelandet.`,
    reportTitle: 'Hantera',
    reportBody: (r, g) => `Ny anmälan: ${r} i ${g}`,
    reasons: { ongepast: 'Olämpligt eller stötande', spam: 'Spam', anders: 'Något annat' },
  },
  da: {
    newPhotos: (n, g) => `${n} deler billeder i ${g}`,
    newVideos: (n, g) => `${n} deler videoer i ${g}`,
    someone: 'Nogen',
    recapTitle: (g) => `Dit tilbageblik fra ${g} er klar 🎞️`,
    recapBody: (c) => `${c} billeder, klar til at se og dele.`,
    resetCode: (c, m) => `Din CamTrip-kode: ${c} - gyldig i ${m} minutter. Har du ikke bedt om den? Ignorer denne besked.`,
    reportTitle: 'Administrer',
    reportBody: (r, g) => `Ny anmeldelse: ${r} i ${g}`,
    reasons: { ongepast: 'Upassende eller stødende', spam: 'Spam', anders: 'Noget andet' },
  },
  nb: {
    newPhotos: (n, g) => `${n} deler bilder i ${g}`,
    newVideos: (n, g) => `${n} deler videoer i ${g}`,
    someone: 'Noen',
    recapTitle: (g) => `Tilbakeblikket ditt fra ${g} er klart 🎞️`,
    recapBody: (c) => `${c} bilder, klare til å se og dele.`,
    resetCode: (c, m) => `CamTrip-koden din: ${c} - gyldig i ${m} minutter. Ba du ikke om den? Ignorer denne meldingen.`,
    reportTitle: 'Administrer',
    reportBody: (r, g) => `Ny rapport: ${r} i ${g}`,
    reasons: { ongepast: 'Upassende eller støtende', spam: 'Spam', anders: 'Noe annet' },
  },
  fi: {
    newPhotos: (n, g) => `${n} jakaa kuvia ryhmässä ${g}`,
    newVideos: (n, g) => `${n} jakaa videoita ryhmässä ${g}`,
    someone: 'Joku',
    recapTitle: (g) => `Koosteesi ryhmästä ${g} on valmis 🎞️`,
    recapBody: (c) => `${c} kuvaa, valmiina katsottavaksi ja jaettavaksi.`,
    resetCode: (c, m) => `CamTrip-koodisi: ${c} - voimassa ${m} minuuttia. Etkö pyytänyt sitä? Ohita tämä viesti.`,
    reportTitle: 'Hallinta',
    reportBody: (r, g) => `Uusi ilmoitus: ${r} ryhmässä ${g}`,
    reasons: { ongepast: 'Sopimaton tai loukkaava', spam: 'Roskaposti', anders: 'Jokin muu' },
  },
  cs: {
    newPhotos: (n, g) => `${n} sdílí fotky ve skupině ${g}`,
    newVideos: (n, g) => `${n} sdílí videa ve skupině ${g}`,
    someone: 'Někdo',
    recapTitle: (g) => `Tvoje shrnutí skupiny ${g} je hotové 🎞️`,
    recapBody: (c) => `Počet fotek: ${c} - můžeš si je prohlédnout a sdílet.`,
    resetCode: (c, m) => `Tvůj kód CamTrip: ${c} - platí ${m} minut. Nežádal(a) jsi o něj? Tuto zprávu ignoruj.`,
    reportTitle: 'Správa',
    reportBody: (r, g) => `Nové nahlášení: ${r} ve skupině ${g}`,
    reasons: { ongepast: 'Nevhodné nebo urážlivé', spam: 'Spam', anders: 'Něco jiného' },
  },
  tr: {
    newPhotos: (n, g) => `${n}, ${g} grubunda fotoğraf paylaşıyor`,
    newVideos: (n, g) => `${n}, ${g} grubunda video paylaşıyor`,
    someone: 'Biri',
    recapTitle: (g) => `${g} özetin hazır 🎞️`,
    recapBody: (c) => `${c} fotoğraf, izlemeye ve paylaşmaya hazır.`,
    resetCode: (c, m) => `CamTrip kodun: ${c} - ${m} dakika geçerli. Sen istemediysen bu mesajı yok say.`,
    reportTitle: 'Yönetim',
    reportBody: (r, g) => `Yeni şikâyet: ${g} grubunda ${r}`,
    reasons: { ongepast: 'Uygunsuz veya rahatsız edici', spam: 'Spam', anders: 'Başka bir şey' },
  },
  ja: {
    newPhotos: (n, g) => `${n}さんが「${g}」で写真を共有しています`,
    newVideos: (n, g) => `${n}さんが「${g}」でビデオを共有しています`,
    someone: 'だれか',
    recapTitle: (g) => `「${g}」の振り返りができました 🎞️`,
    recapBody: (c) => `写真${c}枚。見たりシェアしたりできます。`,
    resetCode: (c, m) => `CamTripのコード: ${c} - ${m}分間有効です。心当たりがない場合は、このメッセージを無視してください。`,
    reportTitle: '管理',
    reportBody: (r, g) => `新しい報告: 「${g}」で${r}`,
    reasons: { ongepast: '不適切または不快な内容', spam: 'スパム', anders: 'その他' },
  },
  ko: {
    newPhotos: (n, g) => `${n}님이 ${g}에서 사진을 공유하고 있어요`,
    newVideos: (n, g) => `${n}님이 ${g}에서 동영상을 공유하고 있어요`,
    someone: '누군가',
    recapTitle: (g) => `${g} 하이라이트가 완성됐어요 🎞️`,
    recapBody: (c) => `사진 ${c}장, 지금 보고 공유해 보세요.`,
    resetCode: (c, m) => `CamTrip 코드: ${c} - ${m}분 동안 유효해요. 요청하지 않았다면 이 메시지를 무시하세요.`,
    reportTitle: '관리',
    reportBody: (r, g) => `새 신고: ${g}에서 ${r}`,
    reasons: { ongepast: '부적절하거나 불쾌한 콘텐츠', spam: '스팸', anders: '기타' },
  },
  zh: {
    newPhotos: (n, g) => `${n} 正在「${g}」中分享照片`,
    newVideos: (n, g) => `${n} 正在「${g}」中分享视频`,
    someone: '某人',
    recapTitle: (g) => `你在「${g}」的回顾已完成 🎞️`,
    recapBody: (c) => `${c} 张照片，可以观看和分享了。`,
    resetCode: (c, m) => `你的 CamTrip 验证码：${c} - ${m} 分钟内有效。如果不是你本人申请，请忽略此消息。`,
    reportTitle: '管理',
    reportBody: (r, g) => `新举报：「${g}」中的${r}`,
    reasons: { ongepast: '不当或冒犯性内容', spam: '垃圾信息', anders: '其他原因' },
  },
};

/**
 * Maps a device / app locale ("nl", "pt-BR", "pt_BR", "nb-NO", "no",
 * "zh-Hans-CN", "en_US" ...) to one of the 18 app languages, else English.
 */
export function pushLocale(raw: string | null | undefined): PushLocale {
  const parts = (raw ?? '').trim().replace(/-/g, '_').split('_').filter(Boolean);
  const lang = (parts[0] ?? '').toLowerCase();
  if (lang === 'pt') return parts.slice(1).some((p) => p.toUpperCase() === 'BR') ? 'pt_BR' : 'pt';
  if (lang === 'no' || lang === 'nn' || lang === 'nb') return 'nb';
  return (PUSH_LOCALES as readonly string[]).includes(lang) ? (lang as PushLocale) : 'en';
}

export function pushTexts(locale: string | null | undefined): Texts {
  return T[pushLocale(locale)];
}

export type Notice = { title: string; body: string; data: Record<string, string> };

/** Bundled "X is sharing photos/videos in <group>". [name] empty = "Someone". */
export function newMediaNotice(locale: string | null | undefined, name: string, group: string, kind: 'photo' | 'video', groupId: string): Notice {
  const t = pushTexts(locale);
  const who = name.trim() || t.someone;
  return { title: group, body: kind === 'video' ? t.newVideos(who, group) : t.newPhotos(who, group), data: { type: 'new_photos', groupId } };
}

export function recapNotice(locale: string | null | undefined, group: string, count: number, groupId: string): Notice {
  const t = pushTexts(locale);
  return { title: t.recapTitle(group), body: t.recapBody(count), data: { type: 'recap', groupId } };
}

/** The password reset code, sent as a push to every device the account is signed in on. */
export function resetCodeNotice(locale: string | null | undefined, code: string, minutes = 15): Notice {
  return { title: 'CamTrip', body: pushTexts(locale).resetCode(code, minutes), data: { type: 'reset_code' } };
}

/** Tells the app admins that a photo was reported. Tapping opens Beheer > Meldingen. */
export function reportNotice(locale: string | null | undefined, reason: ReportReason, group: string, reportId: string): Notice {
  const t = pushTexts(locale);
  return { title: t.reportTitle, body: t.reportBody(t.reasons[reason] ?? reason, group), data: { type: 'report', reportId } };
}
