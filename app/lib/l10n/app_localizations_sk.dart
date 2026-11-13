// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovak (`sk`).
class AppLocalizationsSk extends AppLocalizations {
  AppLocalizationsSk([String locale = 'sk']) : super(locale);

  @override
  String get cancel => 'Zrušiť';

  @override
  String get yes => 'Áno';

  @override
  String inviteMessageIntro(String groupName) {
    return 'Pridáš sa do „$groupName“ na CamTripe? Potom hneď uvidíme fotky jeden druhého.';
  }

  @override
  String inviteMessageCode(String code) {
    return 'Alebo zadaj kód: $code';
  }

  @override
  String get memberFallbackName => 'Kamarát';

  @override
  String get reportReasonInappropriate => 'Nevhodné alebo urážlivé';

  @override
  String get reportReasonSpam => 'Spam';

  @override
  String get reportReasonOther => 'Niečo iné';

  @override
  String dateRangeSameMonth(
    String startDay,
    String endDay,
    String month,
    String monthNum,
    String endDate,
  ) {
    return '$startDay-$endDate';
  }

  @override
  String get errorOffline => 'Žiadne pripojenie. Skús to o chvíľu znova.';

  @override
  String errorSomethingWrongStatus(int status) {
    return 'Niečo sa pokazilo ($status)';
  }

  @override
  String get errorSomethingWrong => 'Niečo sa pokazilo';

  @override
  String get apiInvalidCredentials =>
      'E-mailová adresa alebo heslo nie je správne';

  @override
  String get apiInvalidCode =>
      'Tento kód nie je správny alebo vypršal. Požiadaj o nový kód.';

  @override
  String get apiEmailTaken =>
      'Účet s touto e-mailovou adresou už existuje. Prihlás sa alebo zvoľ „Zabudnuté heslo?“.';

  @override
  String apiEmailTakenProvider(String provider) {
    return 'Účet s touto e-mailovou adresou už existuje. Prihlás sa cez $provider.';
  }

  @override
  String apiWeakPassword(int min) {
    return 'Zvoľ heslo s aspoň $min znakmi';
  }

  @override
  String apiNameTooLong(int max) {
    return 'Tvoje meno môže mať najviac $max znakov';
  }

  @override
  String get apiRateLimited => 'Príliš veľa pokusov. Skús to znova o 15 minút.';

  @override
  String apiAccountBanned(String email) {
    return 'Tvoj účet bol zablokovaný. Napíš na $email, ak si myslíš, že ide o chybu.';
  }

  @override
  String get apiProRequired => 'Tento štýl fotoaparátu patrí do CamTrip Pro';

  @override
  String get apiGroupClosed => 'Táto skupina bola uzavretá';

  @override
  String get apiGroupCodeNotFound => 'Skupina s týmto kódom sa nenašla';

  @override
  String apiGroupFull(int max) {
    return 'Táto skupina je plná (max. $max členov). Ak má jeden člen CamTrip Pro, môže sa pridať ktokoľvek.';
  }

  @override
  String get apiLastMember => 'Si posledný člen. Radšej skupinu vymaž.';

  @override
  String get apiAdminRequired => 'Len pre administrátorov CamTripu';

  @override
  String get apiUploadIncomplete => 'Nahrávanie nie je dokončené';

  @override
  String get apiInvalidInput => 'Neplatný vstup';

  @override
  String get apiNotSignedIn => 'Nie si prihlásený';

  @override
  String get apiAccountGone => 'Tento účet už neexistuje';

  @override
  String get apiPhotoNotFound => 'Fotka sa nenašla';

  @override
  String get apiGroupNotFound => 'Skupina sa nenašla';

  @override
  String get apiMemberNotFound => 'Člen sa nenašiel';

  @override
  String get apiPersonNotFound => 'Osoba sa nenašla';

  @override
  String get apiUserNotFound => 'Používateľ sa nenašiel';

  @override
  String get apiAdminOnly => 'Toto môže urobiť len admin';

  @override
  String get apiCannotBlockSelf => 'Nemôžeš zablokovať sám seba';

  @override
  String get apiCannotReportOwn => 'Nemôžeš nahlásiť vlastnú fotku';

  @override
  String get apiDeleteOwnOnly => 'Môžeš mazať len svoje fotky';

  @override
  String get apiOwnerCannotBeRemoved => 'Tvorcu skupiny nemožno odstrániť';

  @override
  String get apiOwnerStaysAdmin => 'Tvorca vždy zostáva adminom';

  @override
  String get apiNeedsOneAdmin => 'Skupina potrebuje aspoň jedného admina';

  @override
  String get apiEndBeforeStart => 'Dátum konca je pred dátumom začiatku';

  @override
  String get apiPermanentNoEndDate =>
      'Skupina, ktorá je vždy otvorená, nemá dátum konca';

  @override
  String get apiCannotBanAdmin => 'Administrátora nemožno zablokovať';

  @override
  String get apiReportNotFound => 'Nahlásenie sa nenašlo';

  @override
  String get apiPhotoOwnerUnknown => 'Autor tejto fotky už nie je známy';

  @override
  String get validationNameRequired => 'Zadaj svoje meno';

  @override
  String validationMaxChars(int max) {
    return 'Najviac $max znakov';
  }

  @override
  String get validationEmailRequired => 'Zadaj svoju e-mailovú adresu';

  @override
  String get validationEmailInvalid => 'Táto e-mailová adresa nie je platná';

  @override
  String get validationPasswordRequired => 'Zvoľ heslo';

  @override
  String validationMinChars(int min) {
    return 'Aspoň $min znakov';
  }

  @override
  String get validationPasswordTooLong => 'Toto heslo je príliš dlhé';

  @override
  String get validationPasswordEmpty => 'Zadaj svoje heslo';

  @override
  String get validationCodeRequired => 'Zadaj kód z e-mailu';

  @override
  String get validationCodeDigits => 'Kód má 6 číslic';

  @override
  String get onboarding1Title => 'Jeden film\npre celú partiu.';

  @override
  String get onboarding1Body =>
      'Foť retro fotoaparátom. Všetci hneď vidia tvoje fotky a hneď ich máš aj vo svojom albume.';

  @override
  String get onboarding2Title => 'Koniec\nposielania fotiek.';

  @override
  String get onboarding2Body =>
      'Vytvor skupinu, zdieľaj kód, hotovo. Už nikdy „pošleš mi tie fotky?“';

  @override
  String get onboarding3Title => 'Video zhrnutie\npo výlete.';

  @override
  String get onboarding3Body =>
      'CamTrip urobí video s hudbou z vašich najlepších spoločných chvíľ.';

  @override
  String get onboardingInvited => 'Dostal si pozvánku! Prihlás sa a pridaj sa.';

  @override
  String get signInAppleFailed => 'Prihlásenie cez Apple sa nepodarilo';

  @override
  String get signInGoogleFailed => 'Prihlásenie cez Google sa nepodarilo';

  @override
  String get signInFailed => 'Prihlásenie sa nepodarilo';

  @override
  String get next => 'Ďalej';

  @override
  String get legalPrefix => 'Pokračovaním súhlasíš s';

  @override
  String get legalTerms => 'podmienkami';

  @override
  String get legalAnd => ' a';

  @override
  String get legalPrivacy => 'zásadami ochrany súkromia';

  @override
  String get legalSuffix => '.';

  @override
  String get continueWithApple => 'Pokračovať cez Apple';

  @override
  String get continueWithGoogle => 'Pokračovať cez Google';

  @override
  String get createAccount => 'Vytvoriť účet';

  @override
  String get signIn => 'Prihlásiť sa';

  @override
  String get or => 'alebo';

  @override
  String get registerSubtitle => 'Aby kamaráti videli, kto fotky urobil.';

  @override
  String get loginSubtitle => 'Vitaj späť.';

  @override
  String get forgotPasswordTitle => 'Zabudnuté heslo';

  @override
  String get forgotPasswordPushSubtitle =>
      'Si ešte niekde prihlásený? Pošleme tam 6-miestny kód ako push notifikáciu, aby si si nastavil nové heslo.';

  @override
  String get newPassword => 'Nové heslo';

  @override
  String get resetPushInfo =>
      'Ak si ešte niekde prihlásený, dostaneš tam push notifikáciu s kódom. Nevieš sa dostať dnu? Prihlás sa cez Apple alebo Google s rovnakou e-mailovou adresou - tvoj účet sa prepojí.';

  @override
  String get sendCode => 'Poslať kód';

  @override
  String get savePassword => 'Uložiť heslo';

  @override
  String get errorTryAgain => 'Niečo sa pokazilo. Skús to znova.';

  @override
  String get back => 'Späť';

  @override
  String get name => 'Meno';

  @override
  String get email => 'E-mailová adresa';

  @override
  String get codeFromPush => 'Kód z notifikácie';

  @override
  String get password => 'Heslo';

  @override
  String get hidePassword => 'Skryť heslo';

  @override
  String get showPassword => 'Zobraziť heslo';

  @override
  String get forgotPasswordLink => 'Zabudnuté heslo?';

  @override
  String get haveAccount => 'Už máš účet?';

  @override
  String get newToCamTrip => 'Si na CamTripe nový?';

  @override
  String get rememberedIt => 'Spomenul si si?';

  @override
  String get noCodeReceived => 'Neprišiel ti kód?';

  @override
  String get resendCode => 'Poslať znova';

  @override
  String onboardingDemoRoll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotografov, 1 film',
      many: '$count fotografa, 1 film',
      few: '$count fotografi, 1 film',
      one: '$count fotograf, 1 film',
    );
    return '$_temp0';
  }

  @override
  String membersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count členov',
      many: '$count člena',
      few: '$count členovia',
      one: '$count člen',
    );
    return '$_temp0';
  }

  @override
  String photosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotiek',
      many: '$count fotky',
      few: '$count fotky',
      one: '$count fotka',
    );
    return '$_temp0';
  }

  @override
  String videosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count videí',
      many: '$count videa',
      few: '$count videá',
      one: '$count video',
    );
    return '$_temp0';
  }

  @override
  String get justNow => 'teraz';

  @override
  String get badgeNew => 'Nové';

  @override
  String recapTitle(String groupName) {
    return 'Zhrnutie $groupName';
  }

  @override
  String get styleFilm => 'Film';

  @override
  String get styleInstant => 'Instant';

  @override
  String get styleDisposable => 'Jednorazový';

  @override
  String get styleBw => 'Č/B';

  @override
  String get styleGolden => 'Golden';

  @override
  String get styleChrome => 'Chrome';

  @override
  String get styleFilmDescription => 'Teplé farby, zrno a oranžový dátum';

  @override
  String get styleInstantDescription => 'Jemné farby a biely rámik';

  @override
  String get styleDisposableDescription =>
      'Ostrý blesk, vinetácia a presvetlenia';

  @override
  String get styleBwDescription => 'Zrnitá čiernobiela s hlbokým kontrastom';

  @override
  String get styleGoldenDescription => 'Stále zlatá hodinka, jemná zlatá žiara';

  @override
  String get styleChromeDescription => 'Chladný, sýty a ostrý ako diapozitív';

  @override
  String get shutterStopRecording => 'Zastaviť nahrávanie';

  @override
  String get shutterStartRecording => 'Spustiť nahrávanie videa';

  @override
  String get shutterTakePhoto => 'Odfotiť';

  @override
  String get modePhoto => 'Fotka';

  @override
  String get modeVideo => 'Video';

  @override
  String get cameraNotFound => 'Nenašiel sa žiadny fotoaparát';

  @override
  String get cameraAccessNeeded =>
      'CamTrip potrebuje prístup k fotoaparátu. Zapni ho v Nastaveniach.';

  @override
  String get cameraStartFailed => 'Fotoaparát sa nepodarilo spustiť';

  @override
  String get albumAccessNeeded =>
      'Daj CamTripu prístup k fotkám, aby ich ukladal aj do tvojho albumu';

  @override
  String get albumSaveFailed =>
      'Uloženie do albumu sa nepodarilo. Fotka je aj tak zdieľaná.';

  @override
  String styleProFallback(String style) {
    return 'Tento štýl patrí do Pro. V tejto skupine fotíš štýlom $style.';
  }

  @override
  String get photoFailed => 'Fotku sa nepodarilo urobiť. Skús to znova.';

  @override
  String get recordingFailed => 'Nahrávanie videa sa nepodarilo';

  @override
  String get videoFailed => 'Video sa nepodarilo vytvoriť. Skús to znova.';

  @override
  String get shootInGroup => 'Fotiť do skupiny';

  @override
  String get close => 'Zavrieť';

  @override
  String get flash => 'Blesk';

  @override
  String get flashOn => 'Zap.';

  @override
  String get flashOff => 'Vyp.';

  @override
  String get flashAuto => 'Auto';

  @override
  String get chooseGroup => 'Vybrať skupinu';

  @override
  String get switchCamera => 'Prepnúť fotoaparát';

  @override
  String get createOrJoinFirst =>
      'Najprv vytvor skupinu alebo sa k nejakej pridaj';

  @override
  String get proViaGroup => 'Pro cez skupinu';

  @override
  String proViaName(String name) {
    return 'Pro vďaka: $name';
  }

  @override
  String get proStylesFreeViaMember =>
      'Pro štýly sú v tejto skupine pre teba zadarmo vďaka členovi s Pro';

  @override
  String proStylesFreeViaName(String name) {
    return 'Pro štýly v tejto skupine: pre teba zadarmo vďaka: $name';
  }

  @override
  String get subscriptionsUnavailable =>
      'Predplatné momentálne nie je dostupné. Skús to neskôr.';

  @override
  String get paymentPending =>
      'Tvoja platba sa ešte spracúva. Pro sa zapne hneď, ako bude hotová.';

  @override
  String get purchaseFailed => 'Nákup sa nepodaril. Skús to neskôr.';

  @override
  String get restoreUnavailable =>
      'Obnovenie nákupov teraz nie je možné. Skús to neskôr.';

  @override
  String get restoreFailed => 'Obnovenie sa nepodarilo. Skús to neskôr.';

  @override
  String get welcomePro => 'Vitaj v CamTrip Pro! 🎉';

  @override
  String get proRestored => 'Pro bolo obnovené';

  @override
  String get noPurchaseFound => 'Nenašiel sa žiadny predchádzajúci nákup';

  @override
  String periodDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dní',
      many: '$count dňa',
      few: '$count dni',
      one: '$count deň',
    );
    return '$_temp0';
  }

  @override
  String periodWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count týždňov',
      many: '$count týždňa',
      few: '$count týždne',
      one: '$count týždeň',
    );
    return '$_temp0';
  }

  @override
  String periodMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mesiacov',
      many: '$count mesiaca',
      few: '$count mesiace',
      one: '$count mesiac',
    );
    return '$_temp0';
  }

  @override
  String periodYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count rokov',
      many: '$count roka',
      few: '$count roky',
      one: '$count rok',
    );
    return '$_temp0';
  }

  @override
  String get paywallHavePro => 'Máš CamTrip Pro';

  @override
  String get paywallSubtitle => 'Všetko pre tvoj ďalší výlet.';

  @override
  String paywallFeatureStyles(String styles) {
    return 'Všetky štýly fotoaparátu ($styles)';
  }

  @override
  String get paywallFeatureUnlimited =>
      'Neobmedzene členov a miesta, fotky ostávajú navždy';

  @override
  String get paywallFeatureNoWatermark => 'Zhrnutia bez vodoznaku';

  @override
  String get paywallFeatureOriginal => 'Sťahovanie v pôvodnej kvalite';

  @override
  String get planYear => 'Rok';

  @override
  String get planMonth => 'Mesiac';

  @override
  String pricePerMonth(String price) {
    return '$price mesačne';
  }

  @override
  String paywallSaveBadge(int percent) {
    return 'UŠETRÍŠ $percent %';
  }

  @override
  String get planMonthCancelAnytime => 'zrušíš kedykoľvek';

  @override
  String tryFree(String period) {
    return 'Vyskúšaj $period zadarmo';
  }

  @override
  String get becomePro => 'Získať Pro';

  @override
  String get subscriptionsLoadFailed =>
      'Predplatné sa nepodarilo načítať. Skontroluj pripojenie.';

  @override
  String legalAnnual(String price) {
    return 'Ročné predplatné CamTrip Pro: $price ročne.';
  }

  @override
  String legalAnnualTrial(String period, String price) {
    return 'Ročné predplatné CamTrip Pro: $period zadarmo, potom $price ročne.';
  }

  @override
  String legalMonthly(String price) {
    return 'Mesačné predplatné CamTrip Pro: $price mesačne.';
  }

  @override
  String legalMonthlyTrial(String period, String price) {
    return 'Mesačné predplatné CamTrip Pro: $period zadarmo, potom $price mesačne.';
  }

  @override
  String get legalBillingApple =>
      'Platba sa účtuje na tvoje Apple ID. Predplatné sa automaticky obnovuje, ak ho nezrušíš aspoň 24 hodín pred koncom obdobia. Zrušiť a spravovať ho môžeš v nastaveniach účtu App Store.';

  @override
  String get legalBillingGoogle =>
      'Platba sa účtuje na tvoj účet Google. Predplatné sa automaticky obnovuje, ak ho nezrušíš aspoň 24 hodín pred koncom obdobia. Zrušiť a spravovať ho môžeš v nastaveniach účtu Google Play.';

  @override
  String get restorePurchases => 'Obnoviť nákupy';

  @override
  String get terms => 'Podmienky';

  @override
  String get privacy => 'Súkromie';

  @override
  String get groupProTitle =>
      'Jedno Pro v skupine = Pro pre všetkých v tejto skupine';

  @override
  String get groupProBody =>
      'Ak má jeden človek Pro, celá skupina dostane všetky štýly fotoaparátu, neobmedzene členov, fotky, ktoré ostávajú, pôvodnú kvalitu a zhrnutia bez vodoznaku.';

  @override
  String get groupCreated => 'Skupina bola vytvorená ✓';

  @override
  String get inviteFriends => 'Pozvi kamarátov';

  @override
  String get codeCopied => 'Kód bol skopírovaný';

  @override
  String get shareLink => 'Zdieľať odkaz';

  @override
  String inviteSubject(String groupName) {
    return 'Pridaj sa do $groupName na CamTripe';
  }

  @override
  String inviteMembersUnlimited(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count členov',
      many: '$count člena',
      few: '$count členovia',
      one: '$count člen',
    );
    return '$_temp0 · neobmedzene (Pro)';
  }

  @override
  String inviteMembersLimit(int count, int limit) {
    return '$count z $limit členov · Pro: neobmedzene';
  }

  @override
  String get toCamera => 'Na fotoaparát';

  @override
  String get done => 'Hotovo';

  @override
  String get joinEnterCode => 'Zadaj 6-znakový kód';

  @override
  String get joinGroupTitle => 'Pridať sa do skupiny';

  @override
  String get joinGroupSubtitle =>
      'Zadaj kód kamarátov alebo naskenuj ich QR kód.';

  @override
  String get typeCode => 'Napísať kód';

  @override
  String get scanQr => 'Skenovať QR';

  @override
  String get join => 'Pridať sa';

  @override
  String get groupNameRequired => 'Daj skupine názov';

  @override
  String get newGroup => 'Nová skupina';

  @override
  String get groupType => 'Typ skupiny';

  @override
  String get groupTypeVacation => 'Dovolenka';

  @override
  String get groupTypeVacationDescription =>
      'S dátumom začiatku a konca, potom sa archivuje';

  @override
  String get groupTypeEvent => 'Udalosť';

  @override
  String get groupTypeEventDescription => 'Jeden deň alebo večer, napr. párty';

  @override
  String get groupTypePermanent => 'Vždy otvorená';

  @override
  String get groupTypePermanentDescription => 'Pre tvoju stálu partiu';

  @override
  String get date => 'Dátum';

  @override
  String get departure => 'Odchod';

  @override
  String get returnDate => 'Návrat';

  @override
  String get defaultCameraStyle => 'Predvolený štýl fotoaparátu';

  @override
  String freeLimitPermanent(int max) {
    return 'Zadarmo: do $max členov. S Pro neobmedzene.';
  }

  @override
  String freeLimitDated(int max, int days) {
    return 'Zadarmo: do $max členov, fotky sa uchovávajú do $days dní po dátume konca. S Pro neobmedzene a navždy.';
  }

  @override
  String get createGroup => 'Vytvoriť skupinu';

  @override
  String get group => 'Skupina';

  @override
  String groupCode(String code) {
    return 'kód $code';
  }

  @override
  String get manage => 'Spravovať';

  @override
  String get rename => 'Premenovať';

  @override
  String get changeDates => 'Zmeniť dátumy';

  @override
  String get finishTrip => 'Ukončiť výlet';

  @override
  String get finishTripSubtitle => 'Nastaví dátum konca na dnes';

  @override
  String get reopenGroup => 'Znova otvoriť skupinu';

  @override
  String get closeGroup => 'Uzavrieť skupinu';

  @override
  String get reopenGroupSubtitle => 'Členovia môžu znova pridávať fotky';

  @override
  String get closeGroupSubtitle =>
      'Nikto už nemôže pridávať fotky; všetko sa dá stále prezerať';

  @override
  String get members => 'Členovia';

  @override
  String memberYou(String name) {
    return '$name (ty)';
  }

  @override
  String get blockedTag => 'zablokovaný';

  @override
  String get adminTag => 'admin';

  @override
  String removeMemberTitle(String name) {
    return 'Odstrániť: $name?';
  }

  @override
  String get removeMemberMessage => 'Ich fotky ostanú v skupine.';

  @override
  String get remove => 'Vymazať';

  @override
  String get removeMember => 'Odstrániť';

  @override
  String blockTitle(String name) {
    return 'Zablokovať: $name?';
  }

  @override
  String blockMessage(String name) {
    return 'Už neuvidíš fotky a videá od $name ani o nich nedostaneš notifikácie. Môžeš to vrátiť v Nastaveniach.';
  }

  @override
  String get block => 'Zablokovať';

  @override
  String get makeMember => 'Nastaviť ako bežného člena';

  @override
  String get makeAdmin => 'Nastaviť ako admina';

  @override
  String get removeFromGroup => 'Odstrániť zo skupiny';

  @override
  String get unblock => 'Odblokovať';

  @override
  String get inviteFriendsButton => 'Pozvať kamarátov';

  @override
  String get you => 'Ty';

  @override
  String get unarchive => 'Obnoviť z archívu';

  @override
  String get archive => 'Archivovať';

  @override
  String get unarchiveSubtitle => 'Skupina je späť medzi tvojimi albumami';

  @override
  String archiveSubtitle(String section) {
    return 'Len pre teba: skupina sa presunie do „$section“ naspodku tvojich albumov';
  }

  @override
  String get archivedSection => 'Archivované';

  @override
  String get hiddenPhotos => 'Skryté fotky';

  @override
  String get hiddenPhotosSubtitle => 'Fotky, ktoré si pre seba skryl';

  @override
  String get leaveGroup => 'Opustiť skupinu';

  @override
  String get leaveGroupSubtitle => 'Tvoje fotky ostanú v skupine pre ostatných';

  @override
  String get deleteGroup => 'Vymazať skupinu';

  @override
  String get deleteGroupSubtitle => 'Všetky fotky sa vymažú pre všetkých';

  @override
  String groupArchived(String groupName) {
    return '„$groupName“ je archivovaná';
  }

  @override
  String groupUnarchived(String groupName) {
    return '„$groupName“ je späť medzi tvojimi albumami';
  }

  @override
  String get undo => 'Späť';

  @override
  String get groupNameTitle => 'Názov skupiny';

  @override
  String get finishTripTitle => 'Ukončiť výlet?';

  @override
  String get finishTripMessage =>
      'Dátum konca bude dnes. Fotky môžeš pridávať aj naďalej; zhrnutie je pripravené.';

  @override
  String get finishTripConfirm => 'Ukončiť';

  @override
  String get tripFinished => 'Výlet je ukončený';

  @override
  String leaveGroupTitle(String groupName) {
    return 'Opustiť „$groupName“?';
  }

  @override
  String get leaveGroupMessage =>
      'Tvoje fotky ostanú v skupine pre ostatných. Neskôr sa môžeš znova pridať pomocou kódu.';

  @override
  String get leave => 'Opustiť';

  @override
  String groupDeleted(String groupName) {
    return '„$groupName“ bola vymazaná';
  }

  @override
  String get youAreAdmin => 'si admin';

  @override
  String get open => 'Otvoriť';

  @override
  String get archiveMenuSubtitle => 'Len pre teba, ostatní si to nevšimnú';

  @override
  String get deleteGroupMenuSubtitle => 'Pre všetkých, so všetkými fotkami';

  @override
  String get deleteGroupTitle => 'Vymazať skupinu?';

  @override
  String deleteGroupMessage(int count, String groupName, int memberCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Všetkých $count fotiek a videí',
      many: 'Všetkých $count fotiek a videí',
      few: 'Všetky $count fotky a videá',
      one: '$count fotka alebo video',
    );
    String _temp1 = intl.Intl.pluralLogic(
      memberCount,
      locale: localeName,
      other: 'všetkých $memberCount členov',
      many: 'všetkých $memberCount členov',
      few: 'všetkých $memberCount členov',
      one: '$memberCount člena',
    );
    return '$_temp0 v „$groupName“ zmiznú pre $_temp1. Toto sa nedá vrátiť.';
  }

  @override
  String get deleteGroupOwnRoll => 'Tvoja vlastná galéria ostane nezmenená.';

  @override
  String get deleteGroupTypeName => 'Na potvrdenie napíš názov skupiny:';

  @override
  String get deleteForEveryone => 'Vymazať pre všetkých';

  @override
  String get save => 'Uložiť';

  @override
  String get yourAlbums => 'Tvoje albumy';

  @override
  String get uploadQueue => 'Fronta nahrávania';

  @override
  String get noConnection => 'Žiadne pripojenie';

  @override
  String get albumsOfflineMessage =>
      'Albumy sa načítajú, keď budeš znova online. Fotoaparát funguje aj tak.';

  @override
  String get retry => 'Skúsiť znova';

  @override
  String get noAlbumsTitle => 'Zatiaľ žiadne albumy';

  @override
  String get noAlbumsMessage =>
      'Vytvor skupinu na ďalší výlet alebo sa pridaj ku kamarátovi pomocou jeho kódu.';

  @override
  String get haveCode => 'Mám kód';

  @override
  String get joinWithCode => 'Pridať sa kódom alebo QR kódom';

  @override
  String get camera => 'Fotoaparát';

  @override
  String get restore => 'Obnoviť';

  @override
  String get more => 'Viac';

  @override
  String get newAlbum => 'Nový';

  @override
  String get closedTag => 'uzavretá';

  @override
  String get activeTag => 'aktívna';

  @override
  String get uploadFailed => 'Nahrávanie zlyhalo';

  @override
  String get queueNoSignal => 'Žiadny signál.';

  @override
  String get queueNoSignalMessage =>
      'Tvoje fotky sú už v albume a zdieľajú sa hneď, ako budeš znova online.';

  @override
  String get queueWaitingForWifi => 'Čaká sa na Wi-Fi.';

  @override
  String queueWifiOnlyOn(String setting) {
    return 'Máš zapnuté „$setting“.';
  }

  @override
  String get queueVideosWifiOnly => 'Videá idú len cez Wi-Fi.';

  @override
  String get queueAllShared => 'Všetko je zdieľané ✓';

  @override
  String queuePending(String items) {
    return 'Ešte treba zdieľať: $items';
  }

  @override
  String queuePendingBoth(String photos, String videos) {
    return 'Ešte treba zdieľať: $photos a $videos';
  }

  @override
  String get retryUpload => 'Skúsiť znova';

  @override
  String get removeFromQueue => 'Odstrániť z fronty';

  @override
  String get queueStatusWifi => 'Wi-Fi';

  @override
  String get queueStatusWaiting => 'čaká';

  @override
  String get videosWifiOnlyTitle => 'Videá len cez Wi-Fi';

  @override
  String get videosWifiOnlySubtitle => 'Šetrí mobilné dáta';

  @override
  String get retryNow => 'Skúsiť teraz';

  @override
  String get yourName => 'Tvoje meno';

  @override
  String get settings => 'Nastavenia';

  @override
  String get tapToChangeName => 'Ťukni a zmeň svoje meno';

  @override
  String get getCamTripPro => 'Získať CamTrip Pro';

  @override
  String get photos => 'Fotky';

  @override
  String get saveOwnPhotos => 'Ukladať moje fotky do albumu pre každú skupinu';

  @override
  String get autoSaveOthers => 'Automaticky ukladať fotky ostatných';

  @override
  String get wifiOnlyTitle => 'Nahrávať len cez Wi-Fi';

  @override
  String get dateStamp => 'Dátum na fotke';

  @override
  String get notifications => 'Notifikácie';

  @override
  String get notifyNewPhotos => 'Nové fotky (súhrnne)';

  @override
  String get notifyRecapReady => 'Zhrnutie je pripravené';

  @override
  String get camTripTeam => 'Tím CamTrip';

  @override
  String get adminEntrySubtitle =>
      'Používatelia, udeľovanie Pro, nahlásenia a štatistiky';

  @override
  String get account => 'Účet';

  @override
  String get manageSubscription => 'Spravovať predplatné';

  @override
  String get blockedPeople => 'Zablokovaní ľudia';

  @override
  String get nobody => 'Nikto';

  @override
  String peopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count osôb',
      many: '$count osoby',
      few: '$count osoby',
      one: '$count osoba',
    );
    return '$_temp0';
  }

  @override
  String get privacyPolicy => 'Zásady ochrany súkromia';

  @override
  String get contact => 'Kontakt';

  @override
  String get signOut => 'Odhlásiť sa';

  @override
  String get deleteAccount => 'Vymazať účet';

  @override
  String get deleteAccountSubtitle => 'Vymaže tvoj účet a všetky tvoje fotky';

  @override
  String get deleteAccountTitle => 'Vymazať účet?';

  @override
  String get deleteAccountMessage =>
      'Tvoj účet a všetky tvoje fotky a videá sa vymažú, aj zo skupín. Aktívne predplatné zruš v App Store alebo Google Play.';

  @override
  String get blockedTitle => 'Zablokovaní';

  @override
  String get blockedSubtitle => 'Fotky od týchto ľudí nevidíš.';

  @override
  String get blockedNone => 'Nikoho si nezablokoval.';

  @override
  String get unblockShort => 'Odblokovať';

  @override
  String get groupGone =>
      'Táto skupina už neexistuje alebo už nie si jej členom.';

  @override
  String photosSavedToAlbum(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotiek uložených do „$album“',
      many: '$count fotky uložené do „$album“',
      few: '$count fotky uložené do „$album“',
      one: '$count fotka uložená do „$album“',
    );
    return '$_temp0';
  }

  @override
  String photosDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotiek vymazaných',
      many: '$count fotky vymazané',
      few: '$count fotky vymazané',
      one: '$count fotka vymazaná',
    );
    return '$_temp0';
  }

  @override
  String photosDeletedSkipped(int count, int skipped) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotiek vymazaných',
      many: '$count fotky vymazané',
      few: '$count fotky vymazané',
      one: '$count fotka vymazaná',
    );
    return '$_temp0, preskočené: $skipped';
  }

  @override
  String photosHiddenForYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotiek je pre teba skrytých',
      many: '$count fotky sú pre teba skryté',
      few: '$count fotky sú pre teba skryté',
      one: '$count fotka je pre teba skrytá',
    );
    return '$_temp0';
  }

  @override
  String get addedToFavorites => 'Pridané do obľúbených';

  @override
  String get removedFromFavorites => 'Odstránené z obľúbených';

  @override
  String get photoAccessSettings =>
      'Daj CamTripu prístup k fotkám v Nastaveniach';

  @override
  String photosBeingAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Pridáva sa $count fotiek',
      many: 'Pridáva sa $count fotky',
      few: 'Pridávajú sa $count fotky',
      one: 'Pridáva sa $count fotka',
    );
    return '$_temp0';
  }

  @override
  String photosUnreadable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotiek sa nepodarilo načítať',
      many: '$count fotky sa nepodarilo načítať',
      few: '$count fotky sa nepodarilo načítať',
      one: '$count fotku sa nepodarilo načítať',
    );
    return '$_temp0';
  }

  @override
  String get groupNotLoaded => 'Skupina nie je načítaná';

  @override
  String get noFavoritesTitle => 'Zatiaľ žiadne obľúbené';

  @override
  String get noPhotosTitle => 'Zatiaľ žiadne fotky';

  @override
  String get noFavoritesMessage =>
      'Ťukni na hviezdičku na fotke a pridaj ju sem.';

  @override
  String get noPhotosMessage =>
      'Urob prvú fotku. Všetci v skupine ju hneď uvidia.';

  @override
  String get openCamera => 'Otvoriť fotoaparát';

  @override
  String savingProgress(int done, int total) {
    return 'Ukladá sa... $done/$total';
  }

  @override
  String get sharePreparing => 'Pripravuje sa...';

  @override
  String sharingProgress(int done, int total) {
    return 'Pripravuje sa... $done/$total';
  }

  @override
  String get choosePhotos => 'Vybrať fotky';

  @override
  String selectedCount(int count) {
    return 'Vybrané: $count';
  }

  @override
  String get selectNone => 'Zrušiť výber';

  @override
  String get selectAll => 'Vybrať všetky';

  @override
  String photosWaitingToShare(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotiek čaká na zdieľanie',
      many: '$count fotky čakajú na zdieľanie',
      few: '$count fotky čakajú na zdieľanie',
      one: '$count fotka čaká na zdieľanie',
    );
    return '$_temp0';
  }

  @override
  String get recapReadyTitle => 'Tvoje zhrnutie je pripravené';

  @override
  String get recapReadySubtitle => 'Video s hudbou z tvojho výletu';

  @override
  String get watch => 'Pozrieť';

  @override
  String get makeRecapNow => 'Urobiť video zhrnutie teraz';

  @override
  String freeGroupDeleteNotice(String date) {
    return 'Bezplatná skupina: fotky sa uchovávajú do $date. Ulož si ich alebo získaj Pro.';
  }

  @override
  String get filterAll => 'Všetky';

  @override
  String get filterFavorites => 'Obľúbené';

  @override
  String get filterPerPerson => 'Podľa osoby';

  @override
  String get filterPerson => 'Osoba';

  @override
  String get select => 'Vybrať';

  @override
  String get hiddenFilter => 'Skryté';

  @override
  String get photosBy => 'Fotky od...';

  @override
  String get uploadedTag => 'nahrané';

  @override
  String get saveAll => 'Uložiť všetko';

  @override
  String get favorite => 'Obľúbiť';

  @override
  String get unfavorite => 'Zrušiť obľúbenie';

  @override
  String get hide => 'Skryť';

  @override
  String get delete => 'Vymazať';

  @override
  String deletePhotosTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Vymazať $count fotiek?',
      many: 'Vymazať $count fotky?',
      few: 'Vymazať $count fotky?',
      one: 'Vymazať fotku?',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Zmiznú pre všetkých v skupine. Toto sa nedá vrátiť.',
      one: 'Zmizne pre všetkých v skupine. Toto sa nedá vrátiť.',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosNotAllowed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count fotiek patrí niekomu inému. Ostanú; vymazať ich môže len admin.',
      many:
          '$count fotky patria niekomu inému. Ostanú; vymazať ich môže len admin.',
      few:
          '$count fotky patria niekomu inému. Ostanú; vymazať ich môže len admin.',
      one:
          '$count fotka patrí niekomu inému. Ostane; vymazať ju môže len admin.',
    );
    return '$_temp0';
  }

  @override
  String photosBackInGroup(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotiek je späť v skupine',
      many: '$count fotky sú späť v skupine',
      few: '$count fotky sú späť v skupine',
      one: '$count fotka je späť v skupine',
    );
    return '$_temp0';
  }

  @override
  String get showAll => 'Zobraziť všetko';

  @override
  String get hiddenPhotosExplainer =>
      'Tieto fotky už nevidíš len ty. Pre ostatných v skupine tam stále sú.';

  @override
  String get nothingHidden => 'Nič nie je skryté';

  @override
  String get nothingHiddenMessage => 'Fotky, ktoré skryješ, sa zobrazia tu.';

  @override
  String showAgainCount(int count) {
    return 'Znova zobraziť ($count)';
  }

  @override
  String get someone => 'Niekto';

  @override
  String get savedToAlbum => 'Uložené do fotoalbumu';

  @override
  String get share => 'Zdieľať';

  @override
  String get shareFailed => 'Zdieľanie sa nepodarilo';

  @override
  String get reportTitle => 'Prečo nahlasuješ túto fotku?';

  @override
  String get reportSubtitle =>
      'Každé nahlásenie preveríme do 24 hodín. Fotka sa pre teba hneď skryje.';

  @override
  String get reportThanks => 'Ďakujeme, pozrieme sa na to';

  @override
  String blockMessageAllGroups(String name) {
    return 'Už neuvidíš fotky a videá od $name v žiadnej skupine ani o nich nedostaneš notifikácie. Môžeš to vrátiť v Nastaveniach.';
  }

  @override
  String userBlocked(String name) {
    return '$name je zablokovaný';
  }

  @override
  String get videoHiddenForYou => 'Video je pre teba skryté';

  @override
  String get photoHiddenForYou => 'Fotka je pre teba skrytá';

  @override
  String get setAsCover => 'Nastaviť ako obal';

  @override
  String get coverUpdated => 'Titulná fotka bola aktualizovaná';

  @override
  String get hideForMe => 'Skryť pre mňa';

  @override
  String get hideForMeSubtitle => 'Ostatní v skupine ju stále vidia';

  @override
  String get reportPhoto => 'Nahlásiť fotku';

  @override
  String blockName(String name) {
    return 'Zablokovať: $name';
  }

  @override
  String get forEveryoneInGroup => 'Pre všetkých v skupine';

  @override
  String get videoDeleted => 'Video bolo vymazané';

  @override
  String get photoDeleted => 'Fotka bola vymazaná';

  @override
  String get photoAccessToSave =>
      'Daj CamTripu prístup k fotkám v Nastaveniach, aby si ich mohol uložiť';

  @override
  String get phoneFull => 'Tvoj telefón je plný';

  @override
  String get albumSaveFailedShort => 'Uloženie do albumu sa nepodarilo';

  @override
  String get recapTemplateGoldenHour => 'Golden Hour';

  @override
  String get recapTemplateFast => 'Rýchle';

  @override
  String get recapTemplateFilmRoll => 'Filmový pás';

  @override
  String get recapTemplatePolaroid => 'Polaroid';

  @override
  String get trackSummerEvening => 'Letný večer';

  @override
  String get trackGoldenHour => 'Golden Hour';

  @override
  String get trackRoadtrip => 'Road Trip';

  @override
  String get moodWarm => 'teplá';

  @override
  String get moodCheerful => 'veselá';

  @override
  String friendsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kamarátov',
      many: '$count kamaráta',
      few: '$count kamaráti',
      one: '$count kamarát',
    );
    return '$_temp0';
  }

  @override
  String get madeWithCamTrip => 'Vytvorené v CamTripe';

  @override
  String get tagline => 'Jeden film pre celú partiu';

  @override
  String get videoUnsupportedDevice =>
      'Video sa na tomto zariadení nepodarilo vytvoriť';

  @override
  String get groupLoadFailed => 'Túto skupinu sa nepodarilo načítať.';

  @override
  String recapNeedsPhotos(int count) {
    return 'Na zhrnutie potrebuješ aspoň $count fotiek.';
  }

  @override
  String get recapFailed => 'Zhrnutie sa nepodarilo vytvoriť. Skús to znova.';

  @override
  String get recapSaved => 'Zhrnutie bolo uložené do fotoalbumu';

  @override
  String get recap => 'Zhrnutie';

  @override
  String get recapRendering => 'Vytvára sa zhrnutie...';

  @override
  String get videoRendering => 'Vytvára sa video...';

  @override
  String get template => 'Šablóna';

  @override
  String get musicLicense =>
      'Vlastná hudba CamTripu · bez licenčných poplatkov';

  @override
  String get change => 'Zmeniť';

  @override
  String get noWatermark => 'Bez vodoznaku ✓';

  @override
  String get removeWatermarkPro => 'Odstráň vodoznak s Pro';

  @override
  String get proSourceSubscription => 'Predplatné';

  @override
  String get proSourceGift => 'Darček';

  @override
  String get proSourceAdmin => 'Admin';

  @override
  String get proSourceGroup => 'Cez skupinu';

  @override
  String get noPro => 'Bez Pro';

  @override
  String proStatusNoEnd(String source) {
    return 'Pro ($source), bez konca';
  }

  @override
  String proStatusUntil(String source, String date) {
    return 'Pro ($source), do $date';
  }

  @override
  String get lifetime => 'Doživotne';

  @override
  String get pickDate => 'Vyber dátum';

  @override
  String get noAccess => 'Žiadny prístup';

  @override
  String get adminOnlyTeam => 'Správa je len pre tím CamTrip.';

  @override
  String get adminOverview => 'Prehľad';

  @override
  String get adminUsers => 'Používatelia';

  @override
  String get adminReports => 'Nahlásenia';

  @override
  String adminsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count adminov',
      many: '$count admina',
      few: '$count admini',
      one: '$count admin',
    );
    return '$_temp0';
  }

  @override
  String get adminNewThisWeek => 'Noví tento týždeň';

  @override
  String get adminGroups => 'Skupiny';

  @override
  String get adminProSubscription => 'Pro cez predplatné';

  @override
  String get adminProGift => 'Pro ako darček';

  @override
  String adminWithoutSubscription(int count) {
    return '$count bez predplatného';
  }

  @override
  String get adminOpenReports => 'Otvorené nahlásenia';

  @override
  String get adminSearchHint => 'Hľadať podľa mena alebo e-mailu';

  @override
  String get nobodyFound => 'Nikto sa nenašiel';

  @override
  String get loadMore => 'Načítať ďalšie';

  @override
  String get noEmail => 'Žiadny e-mail';

  @override
  String adminDeletePhotoMessage(String groupName) {
    return 'Fotka zmizne pre všetkých v „$groupName“. Všetky nahlásenia k tejto fotke sa vyriešia.';
  }

  @override
  String get adminBanMessage =>
      'Tento účet sa už nemôže prihlásiť ani používať aplikáciu. Neskôr to môžeš vrátiť.';

  @override
  String get adminDismissTitle => 'Zamietnuť nahlásenie?';

  @override
  String get adminDismissMessage =>
      'Fotka ostane. Nahlásenie sa označí ako vyriešené.';

  @override
  String get adminDismiss => 'Zamietnuť';

  @override
  String get adminAccountBlocked => 'Účet je zablokovaný';

  @override
  String get adminReportDismissed => 'Nahlásenie bolo zamietnuté';

  @override
  String get adminNoReports => 'Žiadne otvorené nahlásenia';

  @override
  String get adminNoReportsMessage => 'Nahlásené fotky sa zobrazia tu.';

  @override
  String get deletedTag => 'Vymazané';

  @override
  String adminReportedBy(String name) {
    return 'Od: $name';
  }

  @override
  String adminPhotoBy(String name) {
    return 'Fotka: $name';
  }

  @override
  String reportsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nahlásení',
      many: '$count nahlásenia',
      few: '$count nahlásenia',
      one: '$count nahlásenie',
    );
    return '$_temp0';
  }

  @override
  String get adminDeletePhoto => 'Vymazať fotku';

  @override
  String get adminBlockCreator => 'Zablokovať autora';

  @override
  String get loadFailed => 'Načítanie sa nepodarilo';

  @override
  String get adminLifetimeProGiven => 'Doživotné Pro udelené';

  @override
  String get adminProGiven => 'Pro udelené';

  @override
  String adminGiveProUntil(String date) {
    return 'Udeliť Pro do $date';
  }

  @override
  String get adminGiveProLifetime => 'Udeliť Pro doživotne';

  @override
  String adminGiveProFor(String period) {
    return 'Udeliť Pro na $period';
  }

  @override
  String get adminReasonHint => 'Dôvod, napr. kamarát, tester, influencer';

  @override
  String get adminGivePro => 'Udeliť Pro';

  @override
  String get adminRevokeTitle => 'Odvolať darček?';

  @override
  String get adminRevokeMessage =>
      'Darované Pro okamžite skončí. Vlastné predplatné pokračuje.';

  @override
  String get adminRevoke => 'Odvolať';

  @override
  String get adminGiftRevoked => 'Darček bol odvolaný';

  @override
  String get adminUnbanTitle => 'Zrušiť blokovanie?';

  @override
  String adminUnbanMessage(String name) {
    return '$name sa môže znova prihlásiť.';
  }

  @override
  String get adminUnbanned => 'Blokovanie bolo zrušené';

  @override
  String get adminBanUserMessage =>
      'Tento účet sa už nemôže prihlásiť ani používať aplikáciu. Fotky ostanú.';

  @override
  String get adminUser => 'Používateľ';

  @override
  String get adminNotVerified => 'neoverené';

  @override
  String get adminRole => 'Rola';

  @override
  String get adminCreated => 'Vytvorené';

  @override
  String get unknown => 'Neznáme';

  @override
  String get adminSignInWith => 'Prihlasuje sa cez';

  @override
  String get adminEmailMethod => 'E-mail';

  @override
  String get adminPhotosAndVideos => 'Fotky a videá';

  @override
  String get adminStatus => 'Stav';

  @override
  String get adminActive => 'Aktívne';

  @override
  String adminActiveUntil(String date) {
    return 'Aktívne do $date';
  }

  @override
  String adminGiftFrom(String name) {
    return 'Darček od: $name';
  }

  @override
  String adminExpiredOn(String date) {
    return 'Vypršalo $date';
  }

  @override
  String get adminExpired => 'Vypršalo';

  @override
  String adminUntil(String date) {
    return 'Do $date';
  }

  @override
  String get adminGiveProTitle => 'Udeliť Pro';

  @override
  String get adminGiveProNote =>
      'Platí aj pre skupiny tohto človeka: jedno Pro v skupine = Pro pre všetkých v tejto skupine.';

  @override
  String get adminRevokeGift => 'Odvolať darček';

  @override
  String get adminModeration => 'Moderovanie';

  @override
  String get adminCannotBanSelf => 'Nemôžeš zablokovať sám seba.';

  @override
  String get adminCannotBanAdmin => 'Admina nemožno zablokovať.';

  @override
  String get adminUnban => 'Zrušiť blokovanie';

  @override
  String get adminBanAccount => 'Zablokovať účet';

  @override
  String get googleSignInUnavailable =>
      'Prihlásenie cez Google zatiaľ nie je dostupné';

  @override
  String get cameraPickerTitle => 'Vyber si fotoaparát';

  @override
  String get cameraPickerSubtitle =>
      'Každý fotoaparát dá tvojim fotkám vlastný vzhľad';

  @override
  String get cameraPickerChange => 'Prepnúť fotoaparát';

  @override
  String get cameraPickerUnlock => 'Odomknúť s Pro';

  @override
  String get cameraPickerSelected => 'Vybrané';

  @override
  String get cameraPickerStyleSummer => 'Leto';

  @override
  String get cameraPickerStyleSummerDescription =>
      'Teplé, vyblednuté farby ako na fotke z 90. rokov';

  @override
  String get cameraPickerStyleNight => 'Noc 800';

  @override
  String get cameraPickerStyleNightDescription =>
      'Kinofilm: tyrkysové tiene, teplé svetlo, veľa zrna';

  @override
  String get cameraPickerStyleSepia => 'Sépia';

  @override
  String get cameraPickerStyleSepiaDescription =>
      'Stará hnedá fotka z krabice od topánok';

  @override
  String get cameraPickerStyleLomo => 'Lomo';

  @override
  String get cameraPickerStyleLomoDescription =>
      'Výrazné farby, tmavé rohy a divoký farebný nádych';

  @override
  String get cameraPickerStyleMint => 'Mäta';

  @override
  String get cameraPickerStyleMintDescription =>
      'Jemné a svieže so zeleným nádychom';

  @override
  String get cameraPickerStylePastel => 'Ružová';

  @override
  String get cameraPickerStylePastelDescription =>
      'Pastelové farby s ružovou žiarou a bielym rámikom';

  @override
  String get cameraPickerStyleSuper8 => 'Super 8';

  @override
  String get cameraPickerStyleSuper8Description =>
      'Zrnité a jemné ako staré domáce video';

  @override
  String get paywallBenefitGroup => 'Jedno Pro = Pro pre celú skupinu';

  @override
  String get paywallBenefitUnlimited =>
      'Neobmedzene členov, fotky ostávajú navždy';

  @override
  String get paywallBenefitQuality => 'Bez vodoznaku, pôvodná kvalita';

  @override
  String paywallFreeTrial(String period) {
    return '$period zadarmo';
  }

  @override
  String paywallPriceYear(String price) {
    return '$price ročne.';
  }

  @override
  String paywallPriceYearTrial(String period, String price) {
    return '$period zadarmo, potom $price ročne.';
  }

  @override
  String paywallPriceMonth(String price) {
    return '$price mesačne.';
  }

  @override
  String paywallPriceMonthTrial(String period, String price) {
    return '$period zadarmo, potom $price mesačne.';
  }

  @override
  String paywallAutoRenew(String store) {
    return 'Obnovuje sa automaticky. Zruš aspoň 24 hodín pred obnovením v $store.';
  }

  @override
  String get paywallDetailsTitle => 'Všetko v Pro';

  @override
  String get paywallBenefitStyles => 'Všetky štýly fotoaparátu';

  @override
  String get allPhotosTitle => 'Všetky fotky';

  @override
  String get homeTabAlbums => 'Albumy';

  @override
  String get allPhotosEmptyTitle => 'Zatiaľ žiadne fotky';

  @override
  String get allPhotosEmptyMessage =>
      'Otvor fotoaparát a urob svoju prvú fotku.';

  @override
  String get allPhotosLoadFailed => 'Tvoje fotky sa nepodarilo načítať';

  @override
  String get cameraSettingsTitle => 'Nastavenia fotoaparátu';

  @override
  String get cameraSettingsMore => 'Ďalšie nastavenia';

  @override
  String get cameraSettingsGrid => 'Mriežka';

  @override
  String get cameraSettingsHaptics => 'Vibrovať pri fotení';

  @override
  String get cameraSettingsDateStamp => 'Dátum vpravo dole';

  @override
  String get cameraSettingsSound => 'Zvuk spúšte';

  @override
  String get cameraSettingsSoundHint =>
      'Potichu, keď je telefón v tichom režime';

  @override
  String get cameraSettingsTimer => 'Samospúšť';

  @override
  String get cameraSettingsTimerOff => 'Vyp.';

  @override
  String cameraSettingsTimerSeconds(int seconds) {
    return '$seconds s';
  }

  @override
  String get cameraSettingsTimerCancelHint => 'Ťukni na spúšť a zruš';

  @override
  String get cameraSettingsMirror => 'Zrkadliť selfie';

  @override
  String get cameraSettingsSaveToRoll => 'Ukladať do galérie';

  @override
  String get cameraSettingsQuality => 'Kvalita';

  @override
  String get cameraSettingsQualityStandard => 'Štandardná';

  @override
  String get cameraSettingsQualityHigh => 'Vysoká';

  @override
  String get cameraLowLightHint => 'Málo svetla - zapni blesk';

  @override
  String get cameraFlashUnavailable => 'Tento fotoaparát nemá blesk';

  @override
  String get cameraFlashScreen => 'Blesk obrazovky';

  @override
  String get cameraFlashCycleHint => 'Ťukni a prepínaj medzi vyp., zap. a auto';

  @override
  String get cameraFlip => 'Prepnúť medzi predným a zadným fotoaparátom';

  @override
  String get cameraFlipHint => 'Dvakrát ťukni na hľadáčik a otoč fotoaparát';

  @override
  String cameraPickerPaywallStyles(int count, String styles) {
    return 'Všetky fotoaparáty ($count) vrátane $styles';
  }

  @override
  String get styleFlash => 'Blesk 400';

  @override
  String get styleFlashDescription =>
      'Priamy blesk na teplom filme: jantárová žiara, zrno, sýte červené';

  @override
  String cameraTimerButton(String state) {
    return 'Samospúšť: $state';
  }

  @override
  String get cameraTimerCycleHint => 'Ťukni a prepínaj medzi vyp., 3 s a 10 s';

  @override
  String get cameraLastShotOpen => 'Posledná fotka, otvorí album';

  @override
  String get cameraLastShotEmpty => 'Zatiaľ žiadne fotky, otvorí album';

  @override
  String get deleteOnlyOwnOrAdmin => 'Vymazať to môže len autor alebo admin';

  @override
  String get videoPlay => 'Prehrať';

  @override
  String get videoPause => 'Pozastaviť';

  @override
  String get language => 'Jazyk';

  @override
  String get languageSystem => 'Jazyk systému';

  @override
  String languageSystemCurrent(String language) {
    return 'Systém ($language)';
  }

  @override
  String get languageSearchHint => 'Hľadať jazyk';

  @override
  String get languageNoResults => 'Jazyk sa nenašiel';

  @override
  String get personalRollTitle => 'Môj film';

  @override
  String get personalRollSubtitle => 'Len pre teba';

  @override
  String get personalRollPickerSubtitle => 'Samostatné fotky, len pre teba';

  @override
  String get personalRollMove => 'Do albumu';

  @override
  String get personalRollMoveTitle => 'Presunúť do albumu';

  @override
  String get personalRollMoveNoAlbums =>
      'Najprv vytvor album alebo sa k nejakému pripoj kódom.';

  @override
  String personalRollMoved(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotiek presunutých do $album',
      few: '$count fotky presunuté do $album',
      one: '1 fotka presunutá do $album',
    );
    return '$_temp0';
  }

  @override
  String get personalRollPrivateNote =>
      'Tieto fotky vidíš len ty. Presuň ich do albumu a zdieľaj ich.';

  @override
  String get paywallTripPassSub => 'Len tento výlet, pre celú skupinu';

  @override
  String get paywallOneTime => 'jednorazovo';

  @override
  String get paywallBestValue => 'Najvýhodnejšie';

  @override
  String paywallRollFullTitle(int used, int limit) {
    return 'Tvoj film je plný - $used/$limit fotiek';
  }

  @override
  String get paywallRollFullSub => 'Foť ďalej s Trip Passom alebo Pro.';

  @override
  String get paywallCameraTitle => 'Tento fotoaparát patrí k Pro';

  @override
  String paywallCameraSub(int count) {
    return 'Odomkni všetkých $count fotoaparátov.';
  }

  @override
  String get paywallWatermarkTitle => 'Recap bez vodoznaku';

  @override
  String get paywallWatermarkSub => 'Zdieľaj recap bez loga CamTrip.';

  @override
  String get paywallDeletionTitle => 'Uchovaj si výlet';

  @override
  String paywallDeletionSub(String date) {
    return 'Bezplatné výlety sa mažú $date. S Trip Passom alebo Pro zostane navždy.';
  }

  @override
  String paywallTripPassTerms(String price) {
    return 'Jednorazový nákup za $price pre tento výlet. Nie je to predplatné.';
  }

  @override
  String get buyTripPass => 'Kúpiť Trip Pass';

  @override
  String get tripPassActive => 'Trip Pass aktívny: výlet je Pro pre všetkých';

  @override
  String get tripPassActivating =>
      'Platba prijatá. Trip Pass bude o chvíľu aktívny.';

  @override
  String proViaTripPass(String name) {
    return 'Trip Pass od $name';
  }

  @override
  String rollCounterSemantics(int used, int limit) {
    return '$used z $limit záberov na tvojom filme';
  }

  @override
  String rollHeldTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Fotky, ktoré sa nezmestia: $count',
      one: '1 fotka sa už na film nezmestí',
    );
    return '$_temp0';
  }

  @override
  String get rollHeldBody => 'Uchovaj ich s Pro alebo Trip Passom';

  @override
  String deletionBannerTitle(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Uchovaj si výlet - zostáva dní: $days',
      one: 'Uchovaj si výlet - zostáva 1 deň',
    );
    return '$_temp0';
  }

  @override
  String get deletionBannerBody =>
      'Bezplatné výlety sa mažú 30 dní po konci. S Trip Passom alebo Pro zostane navždy.';

  @override
  String apiRollFull(int limit) {
    return 'Tvoj film je plný ($limit záberov). Zober si Trip Pass alebo Pro a foť ďalej.';
  }

  @override
  String get apiTripPassFailed =>
      'Trip Pass sa nepodarilo aktivovať. Napíš na support@camtrip.app.';

  @override
  String get apiTripPassExists => 'Tento výlet už má Trip Pass.';

  @override
  String get tripPassUnavailable =>
      'Trip Pass teraz nie je dostupný. Skús to neskôr.';

  @override
  String get tripMapTitle => 'Mapa cesty';

  @override
  String get tripMapOpen => 'Mapa a štatistiky';

  @override
  String get tripMapLoadFailed => 'Mapu sa nepodarilo načítať';

  @override
  String get tripMapStatDays => 'Dni';

  @override
  String get tripMapStatPhotos => 'Fotky';

  @override
  String get tripMapStatVideos => 'Videá';

  @override
  String get tripMapStatMembers => 'Členovia';

  @override
  String get tripMapStatDistance => 'prejdených km';

  @override
  String get tripMapStatCountries => 'Krajiny';

  @override
  String get tripMapStatPlaces => 'Miesta';

  @override
  String tripMapBusiestDay(String day, int count) {
    return 'Najviac fotiek: $day ($count)';
  }

  @override
  String tripMapTopPhotographer(String name, int count) {
    return 'Najlepší fotograf: $name ($count)';
  }

  @override
  String get tripMapOffTitle => 'Mapa cesty je vypnutá';

  @override
  String get tripMapOffMessage =>
      'Správca môže mapu zapnúť v nastaveniach skupiny. Štatistiky vidíš vždy.';

  @override
  String get tripMapOffMessageAdmin =>
      'Zapni mapu a uvidíte, kde vznikli vaše fotky. Každý sa sám rozhodne, či sa pridá.';

  @override
  String get tripMapEnable => 'Zapnúť mapu';

  @override
  String get tripMapEmptyTitle => 'Na mape zatiaľ nie sú žiadne miesta';

  @override
  String get tripMapEmptyMessage =>
      'Nové fotky členov, ktorí zdieľajú polohu, sa zobrazia tu, zaokrúhlené na asi 100 m.';

  @override
  String get tripMapConsentTitle => 'Mapa cesty';

  @override
  String get tripMapConsentQuestion =>
      'Zdieľať na mape tejto skupiny, kde vznikli tvoje fotky?';

  @override
  String get tripMapConsentDetail =>
      'Uvidia to len členovia skupiny, zaokrúhlené na asi 100 m. Poloha sa nikdy neuloží do samotnej fotky a kedykoľvek to môžeš vypnúť v nastaveniach skupiny.';

  @override
  String get tripMapConsentYes => 'Áno, zdieľať';

  @override
  String get tripMapConsentNo => 'Nie';

  @override
  String get tripMapLocationDenied =>
      'Bez prístupu k polohe. Môžeš ho povoliť v nastaveniach telefónu.';

  @override
  String get tripMapSettingSubtitle =>
      'Ukázať na mape, kde vznikli fotky. Členovia sa sami rozhodnú, či zdieľať.';

  @override
  String get tripMapDisableTitle => 'Vypnúť mapu?';

  @override
  String get tripMapDisableMessage =>
      'Všetky polohy v tejto skupine sa vymažú. Keď mapu neskôr znova zapneš, opýtame sa všetkých znova.';

  @override
  String get tripMapDisable => 'Vypnúť';

  @override
  String get tripMapMySharing => 'Zdieľať moju polohu';

  @override
  String get tripMapMySharingOn =>
      'Tvoje nové fotky sa zobrazujú na mape (zaokrúhlené na asi 100 m).';

  @override
  String get tripMapMySharingOff =>
      'Vypnuté. Tvoje fotky sa na mape nezobrazujú.';

  @override
  String get tripMapStopSharingTitle => 'Prestať zdieľať polohu?';

  @override
  String get tripMapStopSharingMessage =>
      'Polohy všetkých tvojich fotiek v tejto skupine sa vymažú.';

  @override
  String get tripMapStopSharing => 'Prestať zdieľať';
}
