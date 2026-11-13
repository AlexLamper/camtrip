// Push texts in the 40 app languages, with the same terms as the app
// (app/lib/l10n/GLOSSARY.md and the ARB files). Fallback: English.
// Pure (no runtime imports), so it also runs under `node --experimental-strip-types` in the tests.

export const PUSH_LOCALES = [
  'nl', 'en', 'de', 'fr', 'es', 'it', 'pt', 'pt_BR', 'pl', 'sv', 'da', 'nb', 'fi', 'cs', 'tr', 'ja', 'ko', 'zh',
  'zh_Hant', 'uk', 'ru', 'ro', 'hu', 'el', 'bg', 'hr', 'sk', 'sl', 'lt', 'lv', 'et', 'ca', 'id', 'ms', 'vi', 'th',
  'hi', 'ar', 'he', 'fil',
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
  },  uk: {
    newPhotos: (n, g) => `${n} ділиться фото в ${g}`,
    newVideos: (n, g) => `${n} ділиться відео в ${g}`,
    someone: 'Хтось',
    recapTitle: (g) => `Твій підсумок ${g} готовий 🎞️`,
    recapBody: (c) => `Фото: ${c} - можна дивитися й ділитися.`,
    resetCode: (c, m) => `Твій код CamTrip: ${c} - дійсний ${m} хв. Не запитував? Проігноруй це повідомлення.`,
    reportTitle: 'Керування',
    reportBody: (r, g) => `Нова скарга: ${r} у ${g}`,
    reasons: { ongepast: 'Недоречне або образливе', spam: 'Спам', anders: 'Інше' },
  },
  ru: {
    newPhotos: (n, g) => `${n} делится фото в ${g}`,
    newVideos: (n, g) => `${n} делится видео в ${g}`,
    someone: 'Кто-то',
    recapTitle: (g) => `Твои итоги ${g} готовы 🎞️`,
    recapBody: (c) => `Фото: ${c} - можно смотреть и делиться.`,
    resetCode: (c, m) => `Твой код CamTrip: ${c} - действует ${m} мин. Не запрашивал? Просто проигнорируй это сообщение.`,
    reportTitle: 'Управление',
    reportBody: (r, g) => `Новая жалоба: ${r} в ${g}`,
    reasons: { ongepast: 'Неуместное или оскорбительное', spam: 'Спам', anders: 'Другое' },
  },
  ro: {
    newPhotos: (n, g) => `${n} distribuie poze în ${g}`,
    newVideos: (n, g) => `${n} distribuie videoclipuri în ${g}`,
    someone: 'Cineva',
    recapTitle: (g) => `Recapul tău din ${g} e gata 🎞️`,
    recapBody: (c) => `Poze: ${c} - gata de văzut și distribuit.`,
    resetCode: (c, m) => `Codul tău CamTrip: ${c} - valabil ${m} minute. Nu l-ai cerut? Ignoră acest mesaj.`,
    reportTitle: 'Administrare',
    reportBody: (r, g) => `Raportare nouă: ${r} în ${g}`,
    reasons: { ongepast: 'Nepotrivit sau ofensator', spam: 'Spam', anders: 'Altceva' },
  },
  hu: {
    newPhotos: (n, g) => `${n} fotókat oszt meg itt: ${g}`,
    newVideos: (n, g) => `${n} videókat oszt meg itt: ${g}`,
    someone: 'Valaki',
    recapTitle: (g) => `Kész az összefoglalód: ${g} 🎞️`,
    recapBody: (c) => `${c} fotó, megnézheted és megoszthatod.`,
    resetCode: (c, m) => `A CamTrip-kódod: ${c} - ${m} percig érvényes. Nem te kérted? Hagyd figyelmen kívül ezt az üzenetet.`,
    reportTitle: 'Kezelés',
    reportBody: (r, g) => `Új bejelentés: ${r} itt: ${g}`,
    reasons: { ongepast: 'Nem helyénvaló vagy sértő', spam: 'Spam', anders: 'Valami más' },
  },
  el: {
    newPhotos: (n, g) => `${n} μοιράζεται φωτογραφίες στο ${g}`,
    newVideos: (n, g) => `${n} μοιράζεται βίντεο στο ${g}`,
    someone: 'Κάποιος',
    recapTitle: (g) => `Η ανασκόπηση του ${g} είναι έτοιμη 🎞️`,
    recapBody: (c) => `Φωτογραφίες: ${c} - έτοιμες για προβολή και κοινοποίηση.`,
    resetCode: (c, m) => `Ο κωδικός σου CamTrip: ${c} - ισχύει για ${m} λεπτά. Δεν τον ζήτησες; Αγνόησε αυτό το μήνυμα.`,
    reportTitle: 'Διαχείριση',
    reportBody: (r, g) => `Νέα αναφορά: ${r} στο ${g}`,
    reasons: { ongepast: 'Ακατάλληλο ή προσβλητικό', spam: 'Spam', anders: 'Κάτι άλλο' },
  },
  bg: {
    newPhotos: (n, g) => `${n} споделя снимки в ${g}`,
    newVideos: (n, g) => `${n} споделя видеа в ${g}`,
    someone: 'Някой',
    recapTitle: (g) => `Обобщението ти от ${g} е готово 🎞️`,
    recapBody: (c) => `Снимки: ${c} - готови за гледане и споделяне.`,
    resetCode: (c, m) => `Твоят код за CamTrip: ${c} - валиден ${m} минути. Не си го искал? Игнорирай това съобщение.`,
    reportTitle: 'Управление',
    reportBody: (r, g) => `Нов сигнал: ${r} в ${g}`,
    reasons: { ongepast: 'Неподходящо или обидно', spam: 'Спам', anders: 'Друго' },
  },
  hr: {
    newPhotos: (n, g) => `${n} dijeli fotke u grupi ${g}`,
    newVideos: (n, g) => `${n} dijeli videe u grupi ${g}`,
    someone: 'Netko',
    recapTitle: (g) => `Tvoj sažetak grupe ${g} je spreman 🎞️`,
    recapBody: (c) => `Fotke: ${c} - spremne za gledanje i dijeljenje.`,
    resetCode: (c, m) => `Tvoj CamTrip kôd: ${c} - vrijedi ${m} minuta. Nisi ga tražio? Zanemari ovu poruku.`,
    reportTitle: 'Upravljanje',
    reportBody: (r, g) => `Nova prijava: ${r} u grupi ${g}`,
    reasons: { ongepast: 'Neprimjereno ili uvredljivo', spam: 'Neželjeni sadržaj', anders: 'Nešto drugo' },
  },
  sk: {
    newPhotos: (n, g) => `${n} zdieľa fotky v skupine ${g}`,
    newVideos: (n, g) => `${n} zdieľa videá v skupine ${g}`,
    someone: 'Niekto',
    recapTitle: (g) => `Tvoje zhrnutie skupiny ${g} je pripravené 🎞️`,
    recapBody: (c) => `Fotky: ${c} - pripravené na pozeranie a zdieľanie.`,
    resetCode: (c, m) => `Tvoj kód CamTrip: ${c} - platí ${m} minút. Nežiadal si oň? Ignoruj túto správu.`,
    reportTitle: 'Správa',
    reportBody: (r, g) => `Nové nahlásenie: ${r} v skupine ${g}`,
    reasons: { ongepast: 'Nevhodné alebo urážlivé', spam: 'Spam', anders: 'Niečo iné' },
  },
  sl: {
    newPhotos: (n, g) => `${n} deli fotke v skupini ${g}`,
    newVideos: (n, g) => `${n} deli videe v skupini ${g}`,
    someone: 'Nekdo',
    recapTitle: (g) => `Tvoj povzetek skupine ${g} je pripravljen 🎞️`,
    recapBody: (c) => `Fotke: ${c} - pripravljene za ogled in deljenje.`,
    resetCode: (c, m) => `Tvoja koda CamTrip: ${c} - velja ${m} minut. Je nisi zahteval? Prezri to sporočilo.`,
    reportTitle: 'Upravljanje',
    reportBody: (r, g) => `Nova prijava: ${r} v skupini ${g}`,
    reasons: { ongepast: 'Neprimerno ali žaljivo', spam: 'Neželeno', anders: 'Nekaj drugega' },
  },
  lt: {
    newPhotos: (n, g) => `${n} dalijasi nuotraukomis grupėje ${g}`,
    newVideos: (n, g) => `${n} dalijasi vaizdo įrašais grupėje ${g}`,
    someone: 'Kažkas',
    recapTitle: (g) => `Tavo grupės ${g} apžvalga paruošta 🎞️`,
    recapBody: (c) => `Nuotraukos: ${c} - galima žiūrėti ir dalytis.`,
    resetCode: (c, m) => `Tavo CamTrip kodas: ${c} - galioja ${m} min. Neprašei? Nekreipk dėmesio į šį pranešimą.`,
    reportTitle: 'Valdymas',
    reportBody: (r, g) => `Naujas pranešimas: ${r} grupėje ${g}`,
    reasons: { ongepast: 'Netinkama arba įžeidu', spam: 'Šlamštas', anders: 'Kita' },
  },
  lv: {
    newPhotos: (n, g) => `${n} kopīgo bildes grupā ${g}`,
    newVideos: (n, g) => `${n} kopīgo video grupā ${g}`,
    someone: 'Kāds',
    recapTitle: (g) => `Tavs grupas ${g} kopsavilkums ir gatavs 🎞️`,
    recapBody: (c) => `Bildes: ${c} - gatavas skatīšanai un kopīgošanai.`,
    resetCode: (c, m) => `Tavs CamTrip kods: ${c} - derīgs ${m} minūtes. Neprasīji? Ignorē šo ziņu.`,
    reportTitle: 'Pārvaldība',
    reportBody: (r, g) => `Jauns ziņojums: ${r} grupā ${g}`,
    reasons: { ongepast: 'Nepiemērots vai aizskarošs', spam: 'Mēstule', anders: 'Kas cits' },
  },
  et: {
    newPhotos: (n, g) => `${n} jagab pilte grupis ${g}`,
    newVideos: (n, g) => `${n} jagab videoid grupis ${g}`,
    someone: 'Keegi',
    recapTitle: (g) => `Sinu grupi ${g} kokkuvõte on valmis 🎞️`,
    recapBody: (c) => `Pilte: ${c} - valmis vaatamiseks ja jagamiseks.`,
    resetCode: (c, m) => `Sinu CamTripi kood: ${c} - kehtib ${m} minutit. Sa ei küsinud seda? Ignoreeri seda sõnumit.`,
    reportTitle: 'Haldus',
    reportBody: (r, g) => `Uus teade: ${r} grupis ${g}`,
    reasons: { ongepast: 'Sobimatu või solvav', spam: 'Rämpspost', anders: 'Midagi muud' },
  },
  ca: {
    newPhotos: (n, g) => `${n} comparteix fotos a ${g}`,
    newVideos: (n, g) => `${n} comparteix vídeos a ${g}`,
    someone: 'Algú',
    recapTitle: (g) => `El teu resum de ${g} ja està a punt 🎞️`,
    recapBody: (c) => `${c} fotos, a punt per mirar i compartir.`,
    resetCode: (c, m) => `El teu codi de CamTrip: ${c} - vàlid durant ${m} minuts. No l'has demanat? Ignora aquest missatge.`,
    reportTitle: 'Gestió',
    reportBody: (r, g) => `Nova denúncia: ${r} a ${g}`,
    reasons: { ongepast: 'Inadequat o ofensiu', spam: 'Correu brossa', anders: 'Una altra cosa' },
  },
  id: {
    newPhotos: (n, g) => `${n} membagikan foto di ${g}`,
    newVideos: (n, g) => `${n} membagikan video di ${g}`,
    someone: 'Seseorang',
    recapTitle: (g) => `Recap ${g} kamu sudah siap 🎞️`,
    recapBody: (c) => `${c} foto, siap ditonton dan dibagikan.`,
    resetCode: (c, m) => `Kode CamTrip kamu: ${c} - berlaku ${m} menit. Tidak memintanya? Abaikan pesan ini.`,
    reportTitle: 'Kelola',
    reportBody: (r, g) => `Laporan baru: ${r} di ${g}`,
    reasons: { ongepast: 'Tidak pantas atau menyinggung', spam: 'Spam', anders: 'Lainnya' },
  },
  ms: {
    newPhotos: (n, g) => `${n} sedang berkongsi foto dalam ${g}`,
    newVideos: (n, g) => `${n} sedang berkongsi video dalam ${g}`,
    someone: 'Seseorang',
    recapTitle: (g) => `Recap ${g} anda sudah sedia 🎞️`,
    recapBody: (c) => `${c} foto, sedia untuk ditonton dan dikongsi.`,
    resetCode: (c, m) => `Kod CamTrip anda: ${c} - sah selama ${m} minit. Tidak memintanya? Abaikan mesej ini.`,
    reportTitle: 'Urus',
    reportBody: (r, g) => `Laporan baharu: ${r} dalam ${g}`,
    reasons: { ongepast: 'Tidak sesuai atau menyinggung', spam: 'Spam', anders: 'Lain-lain' },
  },
  vi: {
    newPhotos: (n, g) => `${n} đang chia sẻ ảnh trong ${g}`,
    newVideos: (n, g) => `${n} đang chia sẻ video trong ${g}`,
    someone: 'Ai đó',
    recapTitle: (g) => `Video tổng kết ${g} của bạn đã xong 🎞️`,
    recapBody: (c) => `${c} ảnh, sẵn sàng để xem và chia sẻ.`,
    resetCode: (c, m) => `Mã CamTrip của bạn: ${c} - có hiệu lực trong ${m} phút. Không phải bạn yêu cầu? Hãy bỏ qua tin nhắn này.`,
    reportTitle: 'Quản lý',
    reportBody: (r, g) => `Báo cáo mới: ${r} trong ${g}`,
    reasons: { ongepast: 'Không phù hợp hoặc xúc phạm', spam: 'Spam', anders: 'Lý do khác' },
  },
  th: {
    newPhotos: (n, g) => `${n} กำลังแชร์รูปใน ${g}`,
    newVideos: (n, g) => `${n} กำลังแชร์วิดีโอใน ${g}`,
    someone: 'ใครบางคน',
    recapTitle: (g) => `วิดีโอสรุป ${g} ของคุณพร้อมแล้ว 🎞️`,
    recapBody: (c) => `${c} รูป พร้อมให้ดูและแชร์แล้ว`,
    resetCode: (c, m) => `รหัส CamTrip ของคุณ: ${c} - ใช้ได้ ${m} นาที ไม่ได้ขอรหัสนี้? ไม่ต้องสนใจข้อความนี้`,
    reportTitle: 'จัดการ',
    reportBody: (r, g) => `รายงานใหม่: ${r} ใน ${g}`,
    reasons: { ongepast: 'ไม่เหมาะสมหรือไม่สุภาพ', spam: 'สแปม', anders: 'อื่นๆ' },
  },
  hi: {
    newPhotos: (n, g) => `${n} ${g} में फ़ोटो शेयर कर रहे हैं`,
    newVideos: (n, g) => `${n} ${g} में वीडियो शेयर कर रहे हैं`,
    someone: 'कोई',
    recapTitle: (g) => `${g} का आपका रीकैप तैयार है 🎞️`,
    recapBody: (c) => `${c} फ़ोटो, देखने और शेयर करने के लिए तैयार।`,
    resetCode: (c, m) => `आपका CamTrip कोड: ${c} - ${m} मिनट तक मान्य। आपने नहीं माँगा? इस मैसेज को अनदेखा करें।`,
    reportTitle: 'मैनेज करें',
    reportBody: (r, g) => `नई रिपोर्ट: ${g} में ${r}`,
    reasons: { ongepast: 'अनुचित या आपत्तिजनक', spam: 'स्पैम', anders: 'कुछ और' },
  },
  zh_Hant: {
    newPhotos: (n, g) => `${n} 正在「${g}」中分享照片`,
    newVideos: (n, g) => `${n} 正在「${g}」中分享影片`,
    someone: '某人',
    recapTitle: (g) => `你在「${g}」的回顧已完成 🎞️`,
    recapBody: (c) => `${c} 張照片，可以觀看和分享了。`,
    resetCode: (c, m) => `你的 CamTrip 驗證碼：${c} - ${m} 分鐘內有效。如果不是你本人申請，請忽略此訊息。`,
    reportTitle: '管理',
    reportBody: (r, g) => `新舉報：「${g}」中的${r}`,
    reasons: { ongepast: '不當或冒犯性內容', spam: '垃圾訊息', anders: '其他原因' },
  },
  ar: {
    newPhotos: (n, g) => `${n} يشارك صورًا في ${g}`,
    newVideos: (n, g) => `${n} يشارك فيديوهات في ${g}`,
    someone: 'شخص ما',
    recapTitle: (g) => `ملخّص ${g} جاهز 🎞️`,
    recapBody: (c) => `عدد الصور: ${c} - جاهزة للمشاهدة والمشاركة.`,
    resetCode: (c, m) => `رمز CamTrip الخاص بك: ${c} - صالح لمدة ${m} دقيقة. لم تطلبه؟ تجاهل هذه الرسالة.`,
    reportTitle: 'الإدارة',
    reportBody: (r, g) => `بلاغ جديد: ${r} في ${g}`,
    reasons: { ongepast: 'غير لائق أو مسيء', spam: 'رسائل مزعجة', anders: 'سبب آخر' },
  },
  he: {
    newPhotos: (n, g) => `${n} משתף/ת תמונות ב-${g}`,
    newVideos: (n, g) => `${n} משתף/ת סרטונים ב-${g}`,
    someone: 'מישהו',
    recapTitle: (g) => `הסיכום של ${g} מוכן 🎞️`,
    recapBody: (c) => `תמונות: ${c} - מוכנות לצפייה ולשיתוף.`,
    resetCode: (c, m) => `קוד CamTrip שלך: ${c} - בתוקף ל-${m} דקות. לא ביקשת? אפשר להתעלם מההודעה.`,
    reportTitle: 'ניהול',
    reportBody: (r, g) => `דיווח חדש: ${r} ב-${g}`,
    reasons: { ongepast: 'לא הולם או פוגעני', spam: 'ספאם', anders: 'משהו אחר' },
  },
  fil: {
    newPhotos: (n, g) => `Nagsha-share si ${n} ng mga litrato sa ${g}`,
    newVideos: (n, g) => `Nagsha-share si ${n} ng mga video sa ${g}`,
    someone: 'Isang tao',
    recapTitle: (g) => `Handa na ang recap mo ng ${g} 🎞️`,
    recapBody: (c) => `${c} na litrato, handa nang panoorin at i-share.`,
    resetCode: (c, m) => `Ang CamTrip code mo: ${c} - valid sa loob ng ${m} minuto. Hindi mo ito hiningi? Huwag pansinin ang mensaheng ito.`,
    reportTitle: 'Pamahalaan',
    reportBody: (r, g) => `Bagong report: ${r} sa ${g}`,
    reasons: { ongepast: 'Hindi angkop o nakakasakit', spam: 'Spam', anders: 'Iba pa' },
  },
};

/**
 * Maps a device / app locale ("nl", "pt-BR", "pt_BR", "nb-NO", "no",
 * "zh-Hans-CN", "zh_Hant", "zh-TW", "en_US" ...) to one of the 40 app
 * languages, else English. Chinese in Traditional script (Hant, or Taiwan /
 * Hong Kong / Macau without a script) is zh_Hant; old codes iw / in / tl are
 * he / id / fil.
 */
export function pushLocale(raw: string | null | undefined): PushLocale {
  const parts = (raw ?? '').trim().replace(/-/g, '_').split('_').filter(Boolean);
  const lang = (parts[0] ?? '').toLowerCase();
  const rest = parts.slice(1).map((p) => p.toUpperCase());
  if (lang === 'pt') return rest.includes('BR') ? 'pt_BR' : 'pt';
  if (lang === 'no' || lang === 'nn' || lang === 'nb') return 'nb';
  if (lang === 'zh') {
    if (rest.includes('HANT')) return 'zh_Hant';
    if (rest.includes('HANS')) return 'zh';
    return rest.some((p) => p === 'TW' || p === 'HK' || p === 'MO') ? 'zh_Hant' : 'zh';
  }
  const alias: Record<string, string> = { iw: 'he', in: 'id', tl: 'fil' };
  const code = alias[lang] ?? lang;
  return (PUSH_LOCALES as readonly string[]).includes(code) ? (code as PushLocale) : 'en';
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
