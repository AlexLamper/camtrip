// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get cancel => 'Zrušit';

  @override
  String get yes => 'Ano';

  @override
  String inviteMessageIntro(String groupName) {
    return 'Přidáš se ke skupině „$groupName“ v CamTripu? Pak hned uvidíme fotky ostatních.';
  }

  @override
  String inviteMessageCode(String code) {
    return 'Nebo zadej kód: $code';
  }

  @override
  String get memberFallbackName => 'Kamarád';

  @override
  String get reportReasonInappropriate => 'Nevhodné nebo urážlivé';

  @override
  String get reportReasonSpam => 'Spam';

  @override
  String get reportReasonOther => 'Něco jiného';

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
  String get errorOffline => 'Žádné připojení. Zkus to za chvíli znovu.';

  @override
  String errorSomethingWrongStatus(int status) {
    return 'Něco se pokazilo ($status)';
  }

  @override
  String get errorSomethingWrong => 'Něco se pokazilo';

  @override
  String get apiInvalidCredentials => 'Nesprávný e-mail nebo heslo';

  @override
  String get apiInvalidCode =>
      'Tento kód je nesprávný nebo vypršel. Požádej o nový kód.';

  @override
  String get apiEmailTaken =>
      'Účet s tímto e-mailem už existuje. Přihlas se, nebo zvol „Zapomenuté heslo?“.';

  @override
  String apiEmailTakenProvider(String provider) {
    return 'Účet s tímto e-mailem už existuje. Přihlas se přes $provider.';
  }

  @override
  String apiWeakPassword(int min) {
    return 'Zvol heslo s alespoň $min znaky';
  }

  @override
  String apiNameTooLong(int max) {
    return 'Jméno může mít nejvýš $max znaků';
  }

  @override
  String get apiRateLimited =>
      'Příliš mnoho pokusů. Zkus to znovu za čtvrt hodiny.';

  @override
  String apiAccountBanned(String email) {
    return 'Tvůj účet byl zablokován. Pokud si myslíš, že jde o chybu, napiš na $email.';
  }

  @override
  String get apiProRequired => 'Tento styl fotoaparátu patří k CamTrip Pro';

  @override
  String get apiGroupClosed => 'Tato skupina byla uzavřena';

  @override
  String get apiGroupCodeNotFound =>
      'S tímto kódem nebyla nalezena žádná skupina';

  @override
  String apiGroupFull(int max) {
    return 'Skupina je plná (max. $max členů). Pokud má jeden člen CamTrip Pro, může se přidat neomezeně lidí.';
  }

  @override
  String get apiLastMember => 'Jsi poslední člen. Raději skupinu smaž.';

  @override
  String get apiAdminRequired => 'Pouze pro správce CamTripu';

  @override
  String get apiUploadIncomplete => 'Nahrávání není dokončené';

  @override
  String get apiInvalidInput => 'Neplatný vstup';

  @override
  String get apiNotSignedIn => 'Nepřihlášeno';

  @override
  String get apiAccountGone => 'Tento účet už neexistuje';

  @override
  String get apiPhotoNotFound => 'Fotka nebyla nalezena';

  @override
  String get apiGroupNotFound => 'Skupina nebyla nalezena';

  @override
  String get apiMemberNotFound => 'Člen nebyl nalezen';

  @override
  String get apiPersonNotFound => 'Osoba nebyla nalezena';

  @override
  String get apiUserNotFound => 'Uživatel nebyl nalezen';

  @override
  String get apiAdminOnly => 'To může udělat jen správce';

  @override
  String get apiCannotBlockSelf => 'Nemůžeš zablokovat sám sebe';

  @override
  String get apiCannotReportOwn => 'Nemůžeš nahlásit vlastní fotku';

  @override
  String get apiDeleteOwnOnly => 'Můžeš mazat jen svoje fotky';

  @override
  String get apiOwnerCannotBeRemoved => 'Zakladatele skupiny nelze odebrat';

  @override
  String get apiOwnerStaysAdmin => 'Zakladatel skupiny zůstává správcem';

  @override
  String get apiNeedsOneAdmin => 'Skupina potřebuje alespoň jednoho správce';

  @override
  String get apiEndBeforeStart => 'Datum konce je před datem začátku';

  @override
  String get apiPermanentNoEndDate =>
      'Skupina, která je pořád otevřená, nemá datum konce';

  @override
  String get apiCannotBanAdmin => 'Správce nelze zablokovat';

  @override
  String get apiReportNotFound => 'Nahlášení nebylo nalezeno';

  @override
  String get apiPhotoOwnerUnknown => 'Už není známo, kdo fotku pořídil';

  @override
  String get validationNameRequired => 'Zadej své jméno';

  @override
  String validationMaxChars(int max) {
    return 'Nejvýš $max znaků';
  }

  @override
  String get validationEmailRequired => 'Zadej svůj e-mail';

  @override
  String get validationEmailInvalid => 'Tento e-mail není platný';

  @override
  String get validationPasswordRequired => 'Zvol heslo';

  @override
  String validationMinChars(int min) {
    return 'Alespoň $min znaků';
  }

  @override
  String get validationPasswordTooLong => 'Heslo je příliš dlouhé';

  @override
  String get validationPasswordEmpty => 'Zadej heslo';

  @override
  String get validationCodeRequired => 'Zadej kód z e-mailu';

  @override
  String get validationCodeDigits => 'Kód má 6 číslic';

  @override
  String get onboarding1Title => 'Jeden film\npro celou partu.';

  @override
  String get onboarding1Body =>
      'Foť retro fotoaparátem. Všichni tvoje fotky hned vidí a zároveň se uloží do tvého alba.';

  @override
  String get onboarding2Title => 'Konec\npřeposílání fotek.';

  @override
  String get onboarding2Body =>
      'Založ skupinu, sdílej kód, hotovo. Už nikdy „pošleš mi ty fotky?“';

  @override
  String get onboarding3Title => 'Na konci\nvideo se shrnutím.';

  @override
  String get onboarding3Body =>
      'CamTrip udělá z vašich nejlepších chvil video s hudbou.';

  @override
  String get onboardingInvited => 'Máš pozvánku! Přihlas se a přidej se.';

  @override
  String get signInAppleFailed => 'Přihlášení přes Apple se nepovedlo';

  @override
  String get signInGoogleFailed => 'Přihlášení přes Google se nepovedlo';

  @override
  String get signInFailed => 'Přihlášení se nepovedlo';

  @override
  String get next => 'Další';

  @override
  String get legalPrefix => 'Pokračováním souhlasíš s ';

  @override
  String get legalTerms => 'podmínkami';

  @override
  String get legalAnd => ' a ';

  @override
  String get legalPrivacy => 'zásadami ochrany soukromí';

  @override
  String get legalSuffix => '.';

  @override
  String get continueWithApple => 'Pokračovat přes Apple';

  @override
  String get continueWithGoogle => 'Pokračovat přes Google';

  @override
  String get createAccount => 'Vytvořit účet';

  @override
  String get signIn => 'Přihlásit se';

  @override
  String get or => 'nebo';

  @override
  String get registerSubtitle => 'Kamarádi tak uvidí, kdo fotky fotí.';

  @override
  String get loginSubtitle => 'Vítej zpátky.';

  @override
  String get forgotPasswordTitle => 'Zapomenuté heslo';

  @override
  String get forgotPasswordPushSubtitle =>
      'Máš ještě někde aktivní přihlášení? Pošleme ti tam 6místný kód v oznámení pro nastavení nového hesla.';

  @override
  String get newPassword => 'Nové heslo';

  @override
  String get resetPushInfo =>
      'Pokud máš ještě někde aktivní přihlášení, přijde ti tam oznámení s kódem. Nemůžeš se přihlásit? Přihlas se přes Apple nebo Google se stejnou e-mailovou adresou - tvůj účet se pak propojí.';

  @override
  String get sendCode => 'Poslat kód';

  @override
  String get savePassword => 'Uložit heslo';

  @override
  String get errorTryAgain => 'Něco se pokazilo. Zkus to znovu.';

  @override
  String get back => 'Zpět';

  @override
  String get name => 'Jméno';

  @override
  String get email => 'E-mail';

  @override
  String get codeFromPush => 'Kód z oznámení';

  @override
  String get password => 'Heslo';

  @override
  String get hidePassword => 'Skrýt heslo';

  @override
  String get showPassword => 'Zobrazit heslo';

  @override
  String get forgotPasswordLink => 'Zapomenuté heslo?';

  @override
  String get haveAccount => 'Už máš účet?';

  @override
  String get newToCamTrip => 'Jsi v CamTripu nový?';

  @override
  String get rememberedIt => 'Vzpomněl sis?';

  @override
  String get noCodeReceived => 'Nepřišel kód?';

  @override
  String get resendCode => 'Poslat znovu';

  @override
  String onboardingDemoRoll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotografů, 1 film',
      many: '$count fotografa, 1 film',
      few: '$count fotografové, 1 film',
      one: '1 fotograf, 1 film',
    );
    return '$_temp0';
  }

  @override
  String membersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count členů',
      many: '$count člena',
      few: '$count členové',
      one: '1 člen',
    );
    return '$_temp0';
  }

  @override
  String photosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotek',
      many: '$count fotky',
      few: '$count fotky',
      one: '1 fotka',
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
      few: '$count videa',
      one: '1 video',
    );
    return '$_temp0';
  }

  @override
  String get justNow => 'teď';

  @override
  String get badgeNew => 'Nové';

  @override
  String recapTitle(String groupName) {
    return 'Shrnutí: $groupName';
  }

  @override
  String get styleFilm => 'Film';

  @override
  String get styleInstant => 'Instant';

  @override
  String get styleDisposable => 'Jednorázový';

  @override
  String get styleBw => 'Č/B';

  @override
  String get styleGolden => 'Golden';

  @override
  String get styleChrome => 'Chrome';

  @override
  String get styleFilmDescription => 'Teplé barvy, zrno a oranžové datum';

  @override
  String get styleInstantDescription => 'Jemné barvy a bílý rámeček';

  @override
  String get styleDisposableDescription =>
      'Ostrý blesk, vinětace a prosvětlení';

  @override
  String get styleBwDescription => 'Zrnitá černobílá s hlubokým kontrastem';

  @override
  String get styleGoldenDescription => 'Pořád zlatá hodinka, jemná zlatá záře';

  @override
  String get styleChromeDescription => 'Chladný, sytý a ostrý jako diapozitiv';

  @override
  String get shutterStopRecording => 'Zastavit nahrávání';

  @override
  String get shutterStartRecording => 'Spustit nahrávání videa';

  @override
  String get shutterTakePhoto => 'Vyfotit';

  @override
  String get modePhoto => 'Foto';

  @override
  String get modeVideo => 'Video';

  @override
  String get cameraNotFound => 'Nebyl nalezen žádný fotoaparát';

  @override
  String get cameraAccessNeeded =>
      'CamTrip potřebuje přístup k fotoaparátu. Zapni ho v Nastavení.';

  @override
  String get cameraStartFailed => 'Fotoaparát se nepodařilo spustit';

  @override
  String get albumAccessNeeded =>
      'Povol CamTripu přístup k fotkám, aby je mohl ukládat i do tvého alba';

  @override
  String get albumSaveFailed =>
      'Uložení do alba se nepovedlo. Fotka se i tak sdílí.';

  @override
  String styleProFallback(String style) {
    return 'Tento styl patří k Pro. V této skupině fotíš stylem $style.';
  }

  @override
  String get photoFailed => 'Vyfotit se nepovedlo. Zkus to znovu.';

  @override
  String get recordingFailed => 'Nahrát video se nepovedlo';

  @override
  String get videoFailed => 'Vytvořit video se nepovedlo. Zkus to znovu.';

  @override
  String get shootInGroup => 'Fotit do skupiny';

  @override
  String get close => 'Zavřít';

  @override
  String get flash => 'Blesk';

  @override
  String get flashOn => 'Zap.';

  @override
  String get flashOff => 'Vyp.';

  @override
  String get flashAuto => 'Auto';

  @override
  String get chooseGroup => 'Vybrat skupinu';

  @override
  String get switchCamera => 'Přepnout fotoaparát';

  @override
  String get createOrJoinFirst =>
      'Nejdřív založ skupinu nebo se k nějaké přidej';

  @override
  String get proViaGroup => 'Pro díky skupině';

  @override
  String proViaName(String name) {
    return 'Pro díky: $name';
  }

  @override
  String get proStylesFreeViaMember =>
      'Styly Pro máš v této skupině zdarma díky členovi s Pro';

  @override
  String proStylesFreeViaName(String name) {
    return 'Styly Pro v této skupině: zdarma díky $name';
  }

  @override
  String get subscriptionsUnavailable =>
      'Předplatné teď není k dispozici. Zkus to později.';

  @override
  String get paymentPending =>
      'Platba se ještě zpracovává. Pro se zapne, jakmile bude hotová.';

  @override
  String get purchaseFailed => 'Nákup se nepovedl. Zkus to později.';

  @override
  String get restoreUnavailable => 'Obnovit nákupy teď nejde. Zkus to později.';

  @override
  String get restoreFailed => 'Obnovení se nepovedlo. Zkus to později.';

  @override
  String get welcomePro => 'Vítej v CamTrip Pro! 🎉';

  @override
  String get proRestored => 'Pro bylo obnoveno';

  @override
  String get noPurchaseFound => 'Nebyl nalezen žádný předchozí nákup';

  @override
  String periodDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dní',
      many: '$count dne',
      few: '$count dny',
      one: '1 den',
    );
    return '$_temp0';
  }

  @override
  String periodWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count týdnů',
      many: '$count týdne',
      few: '$count týdny',
      one: '1 týden',
    );
    return '$_temp0';
  }

  @override
  String periodMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count měsíců',
      many: '$count měsíce',
      few: '$count měsíce',
      one: '1 měsíc',
    );
    return '$_temp0';
  }

  @override
  String periodYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count let',
      many: '$count roku',
      few: '$count roky',
      one: '1 rok',
    );
    return '$_temp0';
  }

  @override
  String get paywallHavePro => 'Máš CamTrip Pro';

  @override
  String get paywallSubtitle => 'Všechno pro tvůj další výlet.';

  @override
  String paywallFeatureStyles(String styles) {
    return 'Všechny styly fotoaparátu ($styles)';
  }

  @override
  String get paywallFeatureUnlimited =>
      'Neomezeně členů a úložiště, fotky zůstanou navždy';

  @override
  String get paywallFeatureNoWatermark => 'Shrnutí bez vodoznaku';

  @override
  String get paywallFeatureOriginal => 'Stahování v původní kvalitě';

  @override
  String get planYear => 'Rok';

  @override
  String get planMonth => 'Měsíc';

  @override
  String pricePerMonth(String price) {
    return '$price měsíčně';
  }

  @override
  String paywallSaveBadge(int percent) {
    return 'UŠETŘÍŠ $percent %';
  }

  @override
  String get planMonthCancelAnytime => 'zrušíš kdykoli';

  @override
  String tryFree(String period) {
    return 'Vyzkoušej $period zdarma';
  }

  @override
  String get becomePro => 'Pořídit Pro';

  @override
  String get subscriptionsLoadFailed =>
      'Předplatné se nepodařilo načíst. Zkontroluj připojení.';

  @override
  String legalAnnual(String price) {
    return 'Roční předplatné CamTrip Pro: $price ročně.';
  }

  @override
  String legalAnnualTrial(String period, String price) {
    return 'Roční předplatné CamTrip Pro: $period zdarma, pak $price ročně.';
  }

  @override
  String legalMonthly(String price) {
    return 'Měsíční předplatné CamTrip Pro: $price měsíčně.';
  }

  @override
  String legalMonthlyTrial(String period, String price) {
    return 'Měsíční předplatné CamTrip Pro: $period zdarma, pak $price měsíčně.';
  }

  @override
  String get legalBillingApple =>
      'Platba se strhne z tvého Apple ID. Předplatné se automaticky obnovuje, pokud ho nezrušíš nejpozději 24 hodin před koncem období. Zrušit a spravovat ho můžeš v nastavení účtu App Store.';

  @override
  String get legalBillingGoogle =>
      'Platba se strhne z tvého účtu Google. Předplatné se automaticky obnovuje, pokud ho nezrušíš nejpozději 24 hodin před koncem období. Zrušit a spravovat ho můžeš v nastavení účtu Google Play.';

  @override
  String get restorePurchases => 'Obnovit nákupy';

  @override
  String get terms => 'Podmínky';

  @override
  String get privacy => 'Soukromí';

  @override
  String get groupProTitle => 'Jedno Pro ve skupině = Pro pro celou skupinu';

  @override
  String get groupProBody =>
      'Když má jeden člověk Pro, celá skupina získá všechny styly fotoaparátu, neomezeně členů, fotky, které zůstanou, původní kvalitu a shrnutí bez vodoznaku.';

  @override
  String get groupCreated => 'Skupina vytvořena ✓';

  @override
  String get inviteFriends => 'Pozvi kamarády';

  @override
  String get codeCopied => 'Kód zkopírován';

  @override
  String get shareLink => 'Sdílet odkaz';

  @override
  String inviteSubject(String groupName) {
    return 'Přidej se ke skupině $groupName v CamTripu';
  }

  @override
  String inviteMembersUnlimited(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count členů',
      many: '$count člena',
      few: '$count členové',
      one: '1 člen',
    );
    return '$_temp0 · neomezeně (Pro)';
  }

  @override
  String inviteMembersLimit(int count, int limit) {
    return '$count z $limit členů · Pro: neomezeně';
  }

  @override
  String get toCamera => 'K fotoaparátu';

  @override
  String get done => 'Hotovo';

  @override
  String get joinEnterCode => 'Zadej 6znakový kód';

  @override
  String get joinGroupTitle => 'Přidat se ke skupině';

  @override
  String get joinGroupSubtitle =>
      'Zadej kód od kamarádů nebo naskenuj jejich QR kód.';

  @override
  String get typeCode => 'Napsat kód';

  @override
  String get scanQr => 'Skenovat QR';

  @override
  String get join => 'Přidat se';

  @override
  String get groupNameRequired => 'Pojmenuj skupinu';

  @override
  String get newGroup => 'Nová skupina';

  @override
  String get groupType => 'Typ skupiny';

  @override
  String get groupTypeVacation => 'Dovolená';

  @override
  String get groupTypeVacationDescription =>
      'S datem začátku a konce, pak do archivu';

  @override
  String get groupTypeEvent => 'Akce';

  @override
  String get groupTypeEventDescription => 'Jeden den nebo večer, třeba párty';

  @override
  String get groupTypePermanent => 'Pořád otevřená';

  @override
  String get groupTypePermanentDescription => 'Pro tvoji stálou partu';

  @override
  String get date => 'Datum';

  @override
  String get departure => 'Odjezd';

  @override
  String get returnDate => 'Návrat';

  @override
  String get defaultCameraStyle => 'Výchozí styl fotoaparátu';

  @override
  String freeLimitPermanent(int max) {
    return 'Zdarma: až $max členů. S Pro neomezeně.';
  }

  @override
  String freeLimitDated(int max, int days) {
    return 'Zdarma: až $max členů, fotky zůstanou do $days dnů po datu konce. S Pro neomezeně a navždy.';
  }

  @override
  String get createGroup => 'Vytvořit skupinu';

  @override
  String get group => 'Skupina';

  @override
  String groupCode(String code) {
    return 'kód $code';
  }

  @override
  String get manage => 'Správa';

  @override
  String get rename => 'Přejmenovat';

  @override
  String get changeDates => 'Změnit datum';

  @override
  String get finishTrip => 'Ukončit výlet';

  @override
  String get finishTripSubtitle => 'Nastaví datum konce na dnešek';

  @override
  String get reopenGroup => 'Znovu otevřít skupinu';

  @override
  String get closeGroup => 'Uzavřít skupinu';

  @override
  String get reopenGroupSubtitle => 'Členové můžou znovu přidávat fotky';

  @override
  String get closeGroupSubtitle =>
      'Nikdo už nemůže přidávat fotky; vše zůstane k prohlížení';

  @override
  String get members => 'Členové';

  @override
  String memberYou(String name) {
    return '$name (ty)';
  }

  @override
  String get blockedTag => 'blokováno';

  @override
  String get adminTag => 'správce';

  @override
  String removeMemberTitle(String name) {
    return 'Odebrat: $name?';
  }

  @override
  String get removeMemberMessage => 'Fotky tohoto člena zůstanou ve skupině.';

  @override
  String get remove => 'Smazat';

  @override
  String get removeMember => 'Odebrat';

  @override
  String blockTitle(String name) {
    return 'Zablokovat: $name?';
  }

  @override
  String blockMessage(String name) {
    return 'Už neuvidíš fotky a videa od $name a nebudeš o nich dostávat oznámení. Zrušit to můžeš v Nastavení.';
  }

  @override
  String get block => 'Zablokovat';

  @override
  String get makeMember => 'Udělat běžným členem';

  @override
  String get makeAdmin => 'Udělat správcem';

  @override
  String get removeFromGroup => 'Odebrat ze skupiny';

  @override
  String get unblock => 'Odblokovat';

  @override
  String get inviteFriendsButton => 'Pozvat kamarády';

  @override
  String get you => 'Ty';

  @override
  String get unarchive => 'Vrátit z archivu';

  @override
  String get archive => 'Archivovat';

  @override
  String get unarchiveSubtitle => 'Skupina je zase mezi tvými alby';

  @override
  String archiveSubtitle(String section) {
    return 'Jen pro tebe: skupina se přesune do „$section“ dole v albech';
  }

  @override
  String get archivedSection => 'Archivované';

  @override
  String get hiddenPhotos => 'Skryté fotky';

  @override
  String get hiddenPhotosSubtitle => 'Fotky, které sis skryl';

  @override
  String get leaveGroup => 'Opustit skupinu';

  @override
  String get leaveGroupSubtitle =>
      'Tvoje fotky zůstanou ve skupině pro ostatní';

  @override
  String get deleteGroup => 'Smazat skupinu';

  @override
  String get deleteGroupSubtitle => 'Všechny fotky se smažou všem';

  @override
  String groupArchived(String groupName) {
    return '„$groupName“ archivováno';
  }

  @override
  String groupUnarchived(String groupName) {
    return '„$groupName“ je zase mezi tvými alby';
  }

  @override
  String get undo => 'Vrátit';

  @override
  String get groupNameTitle => 'Název skupiny';

  @override
  String get finishTripTitle => 'Ukončit výlet?';

  @override
  String get finishTripMessage =>
      'Datem konce bude dnešek. Fotky můžeš přidávat dál; shrnutí je připravené.';

  @override
  String get finishTripConfirm => 'Ukončit';

  @override
  String get tripFinished => 'Výlet ukončen';

  @override
  String leaveGroupTitle(String groupName) {
    return 'Opustit „$groupName“?';
  }

  @override
  String get leaveGroupMessage =>
      'Tvoje fotky zůstanou ve skupině pro ostatní. Později se můžeš vrátit pomocí kódu.';

  @override
  String get leave => 'Opustit';

  @override
  String groupDeleted(String groupName) {
    return '„$groupName“ bylo smazáno';
  }

  @override
  String get youAreAdmin => 'jsi správce';

  @override
  String get open => 'Otevřít';

  @override
  String get archiveMenuSubtitle => 'Jen pro tebe, ostatní si ničeho nevšimnou';

  @override
  String get deleteGroupMenuSubtitle => 'Pro všechny, se všemi fotkami';

  @override
  String get deleteGroupTitle => 'Smazat skupinu?';

  @override
  String deleteGroupMessage(int count, String groupName, int memberCount) {
    return 'Všechny fotky a videa ve skupině „$groupName“ ($count) zmizí všem členům ($memberCount). Tuto akci nelze vrátit.';
  }

  @override
  String get deleteGroupOwnRoll =>
      'Tvoje vlastní galerie v telefonu zůstane beze změny.';

  @override
  String get deleteGroupTypeName => 'Pro potvrzení napiš název skupiny:';

  @override
  String get deleteForEveryone => 'Smazat všem';

  @override
  String get save => 'Uložit';

  @override
  String get yourAlbums => 'Tvoje alba';

  @override
  String get uploadQueue => 'Fronta nahrávání';

  @override
  String get noConnection => 'Žádné připojení';

  @override
  String get albumsOfflineMessage =>
      'Alba se načtou, jakmile budeš zase online. Fotoaparát funguje i tak.';

  @override
  String get retry => 'Zkusit znovu';

  @override
  String get noAlbumsTitle => 'Zatím žádná alba';

  @override
  String get noAlbumsMessage =>
      'Založ skupinu pro další výlet, nebo se přidej ke kamarádově pomocí kódu.';

  @override
  String get haveCode => 'Mám kód';

  @override
  String get joinWithCode => 'Přidat se pomocí kódu nebo QR kódu';

  @override
  String get camera => 'Fotoaparát';

  @override
  String get restore => 'Vrátit';

  @override
  String get more => 'Více';

  @override
  String get newAlbum => 'Nové';

  @override
  String get closedTag => 'uzavřeno';

  @override
  String get activeTag => 'aktivní';

  @override
  String get uploadFailed => 'Nahrávání selhalo';

  @override
  String get queueNoSignal => 'Bez signálu.';

  @override
  String get queueNoSignalMessage =>
      'Tvoje fotky už jsou v albu a nasdílí se, jakmile budeš zase online.';

  @override
  String get queueWaitingForWifi => 'Čeká se na Wi-Fi.';

  @override
  String queueWifiOnlyOn(String setting) {
    return 'Máš zapnuté „$setting“.';
  }

  @override
  String get queueVideosWifiOnly => 'Videa se nahrávají jen přes Wi-Fi.';

  @override
  String get queueAllShared => 'Vše je nasdíleno ✓';

  @override
  String queuePending(String items) {
    return 'Zbývá nasdílet: $items';
  }

  @override
  String queuePendingBoth(String photos, String videos) {
    return 'Zbývá nasdílet: $photos a $videos';
  }

  @override
  String get retryUpload => 'Zkusit znovu';

  @override
  String get removeFromQueue => 'Odebrat z fronty';

  @override
  String get queueStatusWifi => 'Wi-Fi';

  @override
  String get queueStatusWaiting => 'čeká';

  @override
  String get videosWifiOnlyTitle => 'Videa jen přes Wi-Fi';

  @override
  String get videosWifiOnlySubtitle => 'Šetří mobilní data';

  @override
  String get retryNow => 'Zkusit hned znovu';

  @override
  String get yourName => 'Tvoje jméno';

  @override
  String get settings => 'Nastavení';

  @override
  String get tapToChangeName => 'Klepnutím změníš jméno';

  @override
  String get getCamTripPro => 'Pořídit CamTrip Pro';

  @override
  String get photos => 'Fotky';

  @override
  String get saveOwnPhotos => 'Ukládat moje fotky do alba pro každou skupinu';

  @override
  String get autoSaveOthers => 'Automaticky ukládat fotky ostatních';

  @override
  String get wifiOnlyTitle => 'Nahrávat jen přes Wi-Fi';

  @override
  String get dateStamp => 'Datum na fotce';

  @override
  String get notifications => 'Oznámení';

  @override
  String get notifyNewPhotos => 'Nové fotky (souhrnně)';

  @override
  String get notifyRecapReady => 'Shrnutí hotové';

  @override
  String get camTripTeam => 'Tým CamTrip';

  @override
  String get adminEntrySubtitle =>
      'Uživatelé, udělování Pro, nahlášení a čísla';

  @override
  String get account => 'Účet';

  @override
  String get manageSubscription => 'Spravovat předplatné';

  @override
  String get blockedPeople => 'Zablokovaní lidé';

  @override
  String get nobody => 'Nikdo';

  @override
  String peopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count lidí',
      many: '$count člověka',
      few: '$count lidé',
      one: '1 člověk',
    );
    return '$_temp0';
  }

  @override
  String get privacyPolicy => 'Zásady ochrany soukromí';

  @override
  String get contact => 'Kontakt';

  @override
  String get signOut => 'Odhlásit se';

  @override
  String get deleteAccount => 'Smazat účet';

  @override
  String get deleteAccountSubtitle => 'Smaže tvůj účet a všechny tvoje fotky';

  @override
  String get deleteAccountTitle => 'Smazat účet?';

  @override
  String get deleteAccountMessage =>
      'Tvůj účet a všechny tvoje fotky a videa se smažou, i ze skupin. Aktivní předplatné zrušíš v App Storu nebo Google Play.';

  @override
  String get blockedTitle => 'Zablokovaní';

  @override
  String get blockedSubtitle => 'Fotky těchto lidí nevidíš.';

  @override
  String get blockedNone => 'Nikoho jsi nezablokoval.';

  @override
  String get unblockShort => 'Odblokovat';

  @override
  String get groupGone =>
      'Tato skupina už neexistuje, nebo už nejsi jejím členem.';

  @override
  String photosSavedToAlbum(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotek uloženo do „$album“',
      many: '$count fotky uloženo do „$album“',
      few: '$count fotky uloženy do „$album“',
      one: '1 fotka uložena do „$album“',
    );
    return '$_temp0';
  }

  @override
  String photosDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotek smazáno',
      many: '$count fotky smazáno',
      few: '$count fotky smazány',
      one: '1 fotka smazána',
    );
    return '$_temp0';
  }

  @override
  String photosDeletedSkipped(int count, int skipped) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotek smazáno',
      many: '$count fotky smazáno',
      few: '$count fotky smazány',
      one: '1 fotka smazána',
    );
    return '$_temp0, přeskočeno: $skipped';
  }

  @override
  String photosHiddenForYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotek skryto pro tebe',
      many: '$count fotky skryto pro tebe',
      few: '$count fotky skryty pro tebe',
      one: '1 fotka skryta pro tebe',
    );
    return '$_temp0';
  }

  @override
  String get addedToFavorites => 'Přidáno do oblíbených';

  @override
  String get removedFromFavorites => 'Odebráno z oblíbených';

  @override
  String get photoAccessSettings =>
      'Povol CamTripu přístup k fotkám v Nastavení';

  @override
  String photosBeingAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Přidává se $count fotek',
      many: 'Přidává se $count fotky',
      few: 'Přidávají se $count fotky',
      one: 'Přidává se 1 fotka',
    );
    return '$_temp0';
  }

  @override
  String photosUnreadable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotek se nepodařilo načíst',
      many: '$count fotky se nepodařilo načíst',
      few: '$count fotky se nepodařilo načíst',
      one: '1 fotku se nepodařilo načíst',
    );
    return '$_temp0';
  }

  @override
  String get groupNotLoaded => 'Skupina se nenačetla';

  @override
  String get noFavoritesTitle => 'Zatím žádné oblíbené';

  @override
  String get noPhotosTitle => 'Zatím žádné fotky';

  @override
  String get noFavoritesMessage => 'Klepni na hvězdičku u fotky a bude tady.';

  @override
  String get noPhotosMessage =>
      'Vyfoť první fotku. Celá skupina ji hned uvidí.';

  @override
  String get openCamera => 'Otevřít fotoaparát';

  @override
  String savingProgress(int done, int total) {
    return 'Ukládání... $done/$total';
  }

  @override
  String get sharePreparing => 'Příprava...';

  @override
  String sharingProgress(int done, int total) {
    return 'Příprava... $done/$total';
  }

  @override
  String get choosePhotos => 'Vybrat fotky';

  @override
  String selectedCount(int count) {
    return 'Vybráno: $count';
  }

  @override
  String get selectNone => 'Zrušit výběr';

  @override
  String get selectAll => 'Vybrat vše';

  @override
  String photosWaitingToShare(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotek čeká na sdílení',
      many: '$count fotky čeká na sdílení',
      few: '$count fotky čekají na sdílení',
      one: '1 fotka čeká na sdílení',
    );
    return '$_temp0';
  }

  @override
  String get recapReadyTitle => 'Tvoje shrnutí je hotové';

  @override
  String get recapReadySubtitle => 'Video s hudbou z vašeho výletu';

  @override
  String get watch => 'Přehrát';

  @override
  String get makeRecapNow => 'Vytvořit video se shrnutím';

  @override
  String freeGroupDeleteNotice(String date) {
    return 'Skupina zdarma: fotky zůstanou do $date. Ulož si je nebo si pořiď Pro.';
  }

  @override
  String get filterAll => 'Vše';

  @override
  String get filterFavorites => 'Oblíbené';

  @override
  String get filterPerPerson => 'Podle osoby';

  @override
  String get filterPerson => 'Osoba';

  @override
  String get select => 'Vybrat';

  @override
  String get hiddenFilter => 'Skryté';

  @override
  String get photosBy => 'Fotky od...';

  @override
  String get uploadedTag => 'nahráno';

  @override
  String get saveAll => 'Uložit vše';

  @override
  String get favorite => 'Oblíbit';

  @override
  String get unfavorite => 'Neoblíbit';

  @override
  String get hide => 'Skrýt';

  @override
  String get delete => 'Smazat';

  @override
  String deletePhotosTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Smazat $count fotek?',
      many: 'Smazat $count fotky?',
      few: 'Smazat $count fotky?',
      one: 'Smazat fotku?',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Zmizí všem ve skupině. Tuto akci nelze vrátit.',
      one: 'Zmizí všem ve skupině. Tuto akci nelze vrátit.',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosNotAllowed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count fotek patří někomu jinému. Zůstanou; smazat je může jen správce.',
      many:
          '$count fotky patří někomu jinému. Zůstanou; smazat je může jen správce.',
      few:
          '$count fotky patří někomu jinému. Zůstanou; smazat je může jen správce.',
      one: '1 fotka patří někomu jinému. Zůstane; smazat ji může jen správce.',
    );
    return '$_temp0';
  }

  @override
  String photosBackInGroup(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotek je zpátky ve skupině',
      many: '$count fotky je zpátky ve skupině',
      few: '$count fotky jsou zpátky ve skupině',
      one: '1 fotka je zpátky ve skupině',
    );
    return '$_temp0';
  }

  @override
  String get showAll => 'Zobrazit vše';

  @override
  String get hiddenPhotosExplainer =>
      'Tyto fotky nevidíš jen ty. Pro ostatní ve skupině tam pořád jsou.';

  @override
  String get nothingHidden => 'Nic skrytého';

  @override
  String get nothingHiddenMessage => 'Fotky, které skryješ, najdeš tady.';

  @override
  String showAgainCount(int count) {
    return 'Znovu zobrazit ($count)';
  }

  @override
  String get someone => 'Někdo';

  @override
  String get savedToAlbum => 'Uloženo do fotoalba';

  @override
  String get share => 'Sdílet';

  @override
  String get shareFailed => 'Sdílení se nepovedlo';

  @override
  String get reportTitle => 'Proč tuto fotku nahlašuješ?';

  @override
  String get reportSubtitle =>
      'Každé nahlášení prověříme do 24 hodin. Fotka se ti hned skryje.';

  @override
  String get reportThanks => 'Díky, podíváme se na to';

  @override
  String blockMessageAllGroups(String name) {
    return 'Už neuvidíš fotky a videa od $name v žádné skupině a nebudeš o nich dostávat oznámení. Zrušit to můžeš v Nastavení.';
  }

  @override
  String userBlocked(String name) {
    return '$name: zablokováno';
  }

  @override
  String get videoHiddenForYou => 'Video pro tebe skryto';

  @override
  String get photoHiddenForYou => 'Fotka pro tebe skryta';

  @override
  String get setAsCover => 'Nastavit jako obal';

  @override
  String get coverUpdated => 'Obal změněn';

  @override
  String get hideForMe => 'Skrýt pro mě';

  @override
  String get hideForMeSubtitle => 'Ostatní ve skupině ji pořád uvidí';

  @override
  String get reportPhoto => 'Nahlásit fotku';

  @override
  String blockName(String name) {
    return 'Zablokovat: $name';
  }

  @override
  String get forEveryoneInGroup => 'Pro všechny ve skupině';

  @override
  String get videoDeleted => 'Video smazáno';

  @override
  String get photoDeleted => 'Fotka smazána';

  @override
  String get photoAccessToSave =>
      'Pro ukládání povol CamTripu přístup k fotkám v Nastavení';

  @override
  String get phoneFull => 'Telefon je plný';

  @override
  String get albumSaveFailedShort => 'Uložení do alba se nepovedlo';

  @override
  String get recapTemplateGoldenHour => 'Golden Hour';

  @override
  String get recapTemplateFast => 'Rychlé';

  @override
  String get recapTemplateFilmRoll => 'Filmový pás';

  @override
  String get recapTemplatePolaroid => 'Polaroid';

  @override
  String get trackSummerEvening => 'Letní večer';

  @override
  String get trackGoldenHour => 'Golden Hour';

  @override
  String get trackRoadtrip => 'Road trip';

  @override
  String get moodWarm => 'hřejivá';

  @override
  String get moodCheerful => 'veselá';

  @override
  String friendsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kamarádů',
      many: '$count kamaráda',
      few: '$count kamarádi',
      one: '1 kamarád',
    );
    return '$_temp0';
  }

  @override
  String get madeWithCamTrip => 'Vytvořeno v CamTripu';

  @override
  String get tagline => 'Jeden film pro celou partu';

  @override
  String get videoUnsupportedDevice =>
      'Na tomto zařízení se video nepodařilo vytvořit';

  @override
  String get groupLoadFailed => 'Tuto skupinu se nepodařilo načíst.';

  @override
  String recapNeedsPhotos(int count) {
    return 'Na shrnutí potřebuješ aspoň $count fotky.';
  }

  @override
  String get recapFailed => 'Vytvořit shrnutí se nepovedlo. Zkus to znovu.';

  @override
  String get recapSaved => 'Shrnutí uloženo do fotoalba';

  @override
  String get recap => 'Shrnutí';

  @override
  String get recapRendering => 'Vytváří se shrnutí...';

  @override
  String get videoRendering => 'Vytváří se video...';

  @override
  String get template => 'Šablona';

  @override
  String get musicLicense => 'Vlastní hudba CamTripu · bez poplatků';

  @override
  String get change => 'Změnit';

  @override
  String get noWatermark => 'Bez vodoznaku ✓';

  @override
  String get removeWatermarkPro => 'Odstraň vodoznak s Pro';

  @override
  String get proSourceSubscription => 'Předplatné';

  @override
  String get proSourceGift => 'Dárek';

  @override
  String get proSourceAdmin => 'Správce';

  @override
  String get proSourceGroup => 'Přes skupinu';

  @override
  String get noPro => 'Bez Pro';

  @override
  String proStatusNoEnd(String source) {
    return 'Pro ($source), bez data konce';
  }

  @override
  String proStatusUntil(String source, String date) {
    return 'Pro ($source), do $date';
  }

  @override
  String get lifetime => 'Doživotně';

  @override
  String get pickDate => 'Vybrat datum';

  @override
  String get noAccess => 'Bez přístupu';

  @override
  String get adminOnlyTeam => 'Správa je jen pro tým CamTripu.';

  @override
  String get adminOverview => 'Přehled';

  @override
  String get adminUsers => 'Uživatelé';

  @override
  String get adminReports => 'Nahlášení';

  @override
  String adminsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count správců',
      many: '$count správce',
      few: '$count správci',
      one: '1 správce',
    );
    return '$_temp0';
  }

  @override
  String get adminNewThisWeek => 'Noví tento týden';

  @override
  String get adminGroups => 'Skupiny';

  @override
  String get adminProSubscription => 'Pro přes předplatné';

  @override
  String get adminProGift => 'Pro jako dárek';

  @override
  String adminWithoutSubscription(int count) {
    return '$count bez předplatného';
  }

  @override
  String get adminOpenReports => 'Otevřená nahlášení';

  @override
  String get adminSearchHint => 'Hledat podle jména nebo e-mailu';

  @override
  String get nobodyFound => 'Nikdo nenalezen';

  @override
  String get loadMore => 'Načíst další';

  @override
  String get noEmail => 'Bez e-mailu';

  @override
  String adminDeletePhotoMessage(String groupName) {
    return 'Fotka zmizí všem ve skupině „$groupName“. Všechna nahlášení této fotky se vyřídí.';
  }

  @override
  String get adminBanMessage =>
      'Tento účet se už nebude moct přihlásit ani používat aplikaci. Později to můžeš vrátit.';

  @override
  String get adminDismissTitle => 'Zamítnout nahlášení?';

  @override
  String get adminDismissMessage =>
      'Fotka zůstane. Nahlášení se označí jako vyřízené.';

  @override
  String get adminDismiss => 'Zamítnout';

  @override
  String get adminAccountBlocked => 'Účet zablokován';

  @override
  String get adminReportDismissed => 'Nahlášení zamítnuto';

  @override
  String get adminNoReports => 'Žádná otevřená nahlášení';

  @override
  String get adminNoReportsMessage => 'Nahlášené fotky se zobrazí tady.';

  @override
  String get deletedTag => 'Smazáno';

  @override
  String adminReportedBy(String name) {
    return 'Nahlásil(a): $name';
  }

  @override
  String adminPhotoBy(String name) {
    return 'Fotka od: $name';
  }

  @override
  String reportsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nahlášení',
      many: '$count nahlášení',
      few: '$count nahlášení',
      one: '1 nahlášení',
    );
    return '$_temp0';
  }

  @override
  String get adminDeletePhoto => 'Smazat fotku';

  @override
  String get adminBlockCreator => 'Zablokovat autora';

  @override
  String get loadFailed => 'Načtení se nepovedlo';

  @override
  String get adminLifetimeProGiven => 'Doživotní Pro uděleno';

  @override
  String get adminProGiven => 'Pro uděleno';

  @override
  String adminGiveProUntil(String date) {
    return 'Udělit Pro do $date';
  }

  @override
  String get adminGiveProLifetime => 'Udělit Pro doživotně';

  @override
  String adminGiveProFor(String period) {
    return 'Udělit Pro na $period';
  }

  @override
  String get adminReasonHint => 'Důvod, např. kamarád, tester, influencer';

  @override
  String get adminGivePro => 'Udělit Pro';

  @override
  String get adminRevokeTitle => 'Odebrat dárek?';

  @override
  String get adminRevokeMessage =>
      'Darované Pro hned skončí. Vlastní předplatné poběží dál.';

  @override
  String get adminRevoke => 'Odebrat';

  @override
  String get adminGiftRevoked => 'Dárek odebrán';

  @override
  String get adminUnbanTitle => 'Zrušit blokaci?';

  @override
  String adminUnbanMessage(String name) {
    return '$name se může znovu přihlásit.';
  }

  @override
  String get adminUnbanned => 'Blokace zrušena';

  @override
  String get adminBanUserMessage =>
      'Tento účet se už nebude moct přihlásit ani používat aplikaci. Fotky zůstanou.';

  @override
  String get adminUser => 'Uživatel';

  @override
  String get adminNotVerified => 'neověřeno';

  @override
  String get adminRole => 'Role';

  @override
  String get adminCreated => 'Vytvořeno';

  @override
  String get unknown => 'Neznámé';

  @override
  String get adminSignInWith => 'Přihlašuje se přes';

  @override
  String get adminEmailMethod => 'E-mail';

  @override
  String get adminPhotosAndVideos => 'Fotky a videa';

  @override
  String get adminStatus => 'Stav';

  @override
  String get adminActive => 'Aktivní';

  @override
  String adminActiveUntil(String date) {
    return 'Aktivní do $date';
  }

  @override
  String adminGiftFrom(String name) {
    return 'Dárek od: $name';
  }

  @override
  String adminExpiredOn(String date) {
    return 'Vypršelo $date';
  }

  @override
  String get adminExpired => 'Vypršelo';

  @override
  String adminUntil(String date) {
    return 'Do $date';
  }

  @override
  String get adminGiveProTitle => 'Udělit Pro';

  @override
  String get adminGiveProNote =>
      'Platí i pro skupiny tohoto člověka: jedno Pro ve skupině = Pro pro celou skupinu.';

  @override
  String get adminRevokeGift => 'Odebrat dárek';

  @override
  String get adminModeration => 'Moderování';

  @override
  String get adminCannotBanSelf => 'Nemůžeš zablokovat sám sebe.';

  @override
  String get adminCannotBanAdmin => 'Správce nelze zablokovat.';

  @override
  String get adminUnban => 'Zrušit blokaci';

  @override
  String get adminBanAccount => 'Zablokovat účet';

  @override
  String get googleSignInUnavailable =>
      'Přihlášení přes Google zatím není k dispozici';

  @override
  String get cameraPickerTitle => 'Vyber si fotoaparát';

  @override
  String get cameraPickerSubtitle =>
      'Každý fotoaparát dá tvým fotkám vlastní styl';

  @override
  String get cameraPickerChange => 'Přepnout fotoaparát';

  @override
  String get cameraPickerUnlock => 'Odemknout s Pro';

  @override
  String get cameraPickerSelected => 'Vybráno';

  @override
  String get cameraPickerStyleSummer => 'Léto';

  @override
  String get cameraPickerStyleSummerDescription =>
      'Teplé, vybledlé barvy fotky z 90. let';

  @override
  String get cameraPickerStyleNight => 'Noc 800';

  @override
  String get cameraPickerStyleNightDescription =>
      'Kinofilm: modrozelené stíny, teplé světlo, hodně zrna';

  @override
  String get cameraPickerStyleSepia => 'Sépie';

  @override
  String get cameraPickerStyleSepiaDescription =>
      'Stará hnědá fotka z krabice od bot';

  @override
  String get cameraPickerStyleLomo => 'Lomo';

  @override
  String get cameraPickerStyleLomoDescription =>
      'Výrazné barvy, tmavé rohy a šílený barevný nádech';

  @override
  String get cameraPickerStyleMint => 'Máta';

  @override
  String get cameraPickerStyleMintDescription =>
      'Jemné a svěží se zeleným nádechem';

  @override
  String get cameraPickerStylePastel => 'Růžová';

  @override
  String get cameraPickerStylePastelDescription =>
      'Pastelové barvy s růžovou září a bílým okrajem';

  @override
  String get cameraPickerStyleSuper8 => 'Super 8';

  @override
  String get cameraPickerStyleSuper8Description =>
      'Zrnité a měkké jako staré domácí video';

  @override
  String get paywallBenefitGroup => 'Jedno Pro = Pro pro celou skupinu';

  @override
  String get paywallBenefitUnlimited => 'Neomezeně členů, fotky navždy';

  @override
  String get paywallBenefitQuality => 'Bez vodoznaku, původní kvalita';

  @override
  String paywallFreeTrial(String period) {
    return '$period zdarma';
  }

  @override
  String paywallPriceYear(String price) {
    return '$price ročně.';
  }

  @override
  String paywallPriceYearTrial(String period, String price) {
    return '$period zdarma, pak $price ročně.';
  }

  @override
  String paywallPriceMonth(String price) {
    return '$price měsíčně.';
  }

  @override
  String paywallPriceMonthTrial(String period, String price) {
    return '$period zdarma, pak $price měsíčně.';
  }

  @override
  String paywallAutoRenew(String store) {
    return 'Obnovuje se automaticky. Zruš nejméně 24 hodin před obnovením v $store.';
  }

  @override
  String get paywallDetailsTitle => 'Vše v Pro';

  @override
  String get paywallBenefitStyles => 'Všechny styly fotoaparátu';

  @override
  String get allPhotosTitle => 'Všechny fotky';

  @override
  String get homeTabAlbums => 'Alba';

  @override
  String get allPhotosEmptyTitle => 'Zatím žádné fotky';

  @override
  String get allPhotosEmptyMessage =>
      'Otevři fotoaparát a pořiď svou první fotku.';

  @override
  String get allPhotosLoadFailed => 'Tvoje fotky se nepodařilo načíst';

  @override
  String get cameraSettingsTitle => 'Nastavení fotoaparátu';

  @override
  String get cameraSettingsMore => 'Další nastavení';

  @override
  String get cameraSettingsGrid => 'Mřížka';

  @override
  String get cameraSettingsHaptics => 'Vibrovat při focení';

  @override
  String get cameraSettingsDateStamp => 'Datum vpravo dole';

  @override
  String get cameraSettingsSound => 'Zvuk závěrky';

  @override
  String get cameraSettingsSoundHint => 'Ticho, když je telefon ztlumený';

  @override
  String get cameraSettingsTimer => 'Samospoušť';

  @override
  String get cameraSettingsTimerOff => 'Vyp.';

  @override
  String cameraSettingsTimerSeconds(int seconds) {
    return '$seconds s';
  }

  @override
  String get cameraSettingsTimerCancelHint => 'Klepnutím na spoušť zrušíš';

  @override
  String get cameraSettingsMirror => 'Zrcadlit selfie';

  @override
  String get cameraSettingsSaveToRoll => 'Uložit do fotek';

  @override
  String get cameraSettingsQuality => 'Kvalita';

  @override
  String get cameraSettingsQualityStandard => 'Standardní';

  @override
  String get cameraSettingsQualityHigh => 'Vysoká';

  @override
  String get cameraLowLightHint => 'Málo světla - zapni blesk';

  @override
  String get cameraFlashUnavailable => 'Tento fotoaparát nemá blesk';

  @override
  String get cameraFlashScreen => 'Blesk displeje';

  @override
  String get cameraFlashCycleHint =>
      'Klepnutím přepínáš mezi vyp., zap. a auto';

  @override
  String get cameraFlip => 'Přepnout mezi předním a zadním fotoaparátem';

  @override
  String get cameraFlipHint =>
      'Dvojitým klepnutím na hledáček otočíš fotoaparát';

  @override
  String cameraPickerPaywallStyles(int count, String styles) {
    return 'Všechny fotoaparáty ($count), mimo jiné $styles';
  }

  @override
  String get styleFlash => 'Blesk 400';

  @override
  String get styleFlashDescription =>
      'Přímý blesk na teplém filmu: jantarový nádech, zrno, sytě červená';
}
