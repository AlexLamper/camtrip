// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovenian (`sl`).
class AppLocalizationsSl extends AppLocalizations {
  AppLocalizationsSl([String locale = 'sl']) : super(locale);

  @override
  String get cancel => 'Prekliči';

  @override
  String get yes => 'Da';

  @override
  String inviteMessageIntro(String groupName) {
    return 'Se pridružiš skupini »$groupName« na CamTripu? Tako takoj vidimo fotke drug drugega.';
  }

  @override
  String inviteMessageCode(String code) {
    return 'Ali vpiši kodo: $code';
  }

  @override
  String get memberFallbackName => 'Prijatelj';

  @override
  String get reportReasonInappropriate => 'Neprimerno ali žaljivo';

  @override
  String get reportReasonSpam => 'Neželeno';

  @override
  String get reportReasonOther => 'Nekaj drugega';

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
  String get errorOffline => 'Ni povezave. Poskusi znova čez trenutek.';

  @override
  String errorSomethingWrongStatus(int status) {
    return 'Nekaj je šlo narobe ($status)';
  }

  @override
  String get errorSomethingWrong => 'Nekaj je šlo narobe';

  @override
  String get apiInvalidCredentials => 'E-poštni naslov ali geslo ni pravilno';

  @override
  String get apiInvalidCode =>
      'Koda ni pravilna ali je potekla. Zahtevaj novo kodo.';

  @override
  String get apiEmailTaken =>
      'Račun s tem e-poštnim naslovom že obstaja. Prijavi se ali izberi »Pozabljeno geslo?«.';

  @override
  String apiEmailTakenProvider(String provider) {
    return 'Račun s tem e-poštnim naslovom že obstaja. Prijavi se z računom $provider.';
  }

  @override
  String apiWeakPassword(int min) {
    return 'Izberi geslo z vsaj $min znaki';
  }

  @override
  String apiNameTooLong(int max) {
    return 'Ime ima lahko največ $max znakov';
  }

  @override
  String get apiRateLimited => 'Preveč poskusov. Poskusi znova čez 15 minut.';

  @override
  String apiAccountBanned(String email) {
    return 'Tvoj račun je blokiran. Piši na $email, če misliš, da gre za napako.';
  }

  @override
  String get apiProRequired => 'Ta slog kamere je del CamTrip Pro';

  @override
  String get apiGroupClosed => 'Ta skupina je zaprta';

  @override
  String get apiGroupCodeNotFound => 'S to kodo ni bila najdena nobena skupina';

  @override
  String apiGroupFull(int max) {
    return 'Skupina je polna (največ $max članov). Če ima en član CamTrip Pro, se lahko pridruži kdorkoli.';
  }

  @override
  String get apiLastMember => 'Si zadnji član. Raje izbriši skupino.';

  @override
  String get apiAdminRequired => 'Samo za skrbnike CamTripa';

  @override
  String get apiUploadIncomplete => 'Nalaganje ni dokončano';

  @override
  String get apiInvalidInput => 'Neveljaven vnos';

  @override
  String get apiNotSignedIn => 'Nisi prijavljen';

  @override
  String get apiAccountGone => 'Ta račun ne obstaja več';

  @override
  String get apiPhotoNotFound => 'Fotke ni mogoče najti';

  @override
  String get apiGroupNotFound => 'Skupine ni mogoče najti';

  @override
  String get apiMemberNotFound => 'Člana ni mogoče najti';

  @override
  String get apiPersonNotFound => 'Osebe ni mogoče najti';

  @override
  String get apiUserNotFound => 'Uporabnika ni mogoče najti';

  @override
  String get apiAdminOnly => 'To lahko naredi samo admin';

  @override
  String get apiCannotBlockSelf => 'Sebe ne moreš blokirati';

  @override
  String get apiCannotReportOwn => 'Svoje fotke ne moreš prijaviti';

  @override
  String get apiDeleteOwnOnly => 'Izbrišeš lahko samo svoje fotke';

  @override
  String get apiOwnerCannotBeRemoved =>
      'Ustvarjalca skupine ni mogoče odstraniti';

  @override
  String get apiOwnerStaysAdmin => 'Ustvarjalec vedno ostane admin';

  @override
  String get apiNeedsOneAdmin => 'Skupina potrebuje vsaj enega admina';

  @override
  String get apiEndBeforeStart => 'Končni datum je pred začetnim';

  @override
  String get apiPermanentNoEndDate =>
      'Skupina, ki je vedno odprta, nima končnega datuma';

  @override
  String get apiCannotBanAdmin => 'Skrbnika ni mogoče blokirati';

  @override
  String get apiReportNotFound => 'Prijave ni mogoče najti';

  @override
  String get apiPhotoOwnerUnknown => 'Avtor te fotke ni več znan';

  @override
  String get validationNameRequired => 'Vpiši svoje ime';

  @override
  String validationMaxChars(int max) {
    return 'Največ $max znakov';
  }

  @override
  String get validationEmailRequired => 'Vpiši svoj e-poštni naslov';

  @override
  String get validationEmailInvalid => 'Ta e-poštni naslov ni veljaven';

  @override
  String get validationPasswordRequired => 'Izberi geslo';

  @override
  String validationMinChars(int min) {
    return 'Vsaj $min znakov';
  }

  @override
  String get validationPasswordTooLong => 'To geslo je predolgo';

  @override
  String get validationPasswordEmpty => 'Vpiši geslo';

  @override
  String get validationCodeRequired => 'Vpiši kodo iz e-pošte';

  @override
  String get validationCodeDigits => 'Koda ima 6 števk';

  @override
  String get onboarding1Title => 'En film\nza vso ekipo.';

  @override
  String get onboarding1Body =>
      'Fotografiraj z retro kamero. Vsi takoj vidijo tvoje fotke, hkrati pa so tudi v tvojem albumu.';

  @override
  String get onboarding2Title => 'Konec\npošiljanja fotk.';

  @override
  String get onboarding2Body =>
      'Ustvari skupino, deli kodo, konec. Nikoli več »mi pošlješ tiste fotke?«';

  @override
  String get onboarding3Title => 'Video povzetek\npo potovanju.';

  @override
  String get onboarding3Body =>
      'CamTrip naredi video z glasbo iz vaših najlepših skupnih trenutkov.';

  @override
  String get onboardingInvited => 'Povabljen si! Prijavi se in se pridruži.';

  @override
  String get signInAppleFailed => 'Prijava z Applom ni uspela';

  @override
  String get signInGoogleFailed => 'Prijava z Googlom ni uspela';

  @override
  String get signInFailed => 'Prijava ni uspela';

  @override
  String get next => 'Naprej';

  @override
  String get legalPrefix => 'Z nadaljevanjem se strinjaš s';

  @override
  String get legalTerms => 'pogoji';

  @override
  String get legalAnd => ' in';

  @override
  String get legalPrivacy => 'pravilnikom o zasebnosti';

  @override
  String get legalSuffix => '.';

  @override
  String get continueWithApple => 'Nadaljuj z Applom';

  @override
  String get continueWithGoogle => 'Nadaljuj z Googlom';

  @override
  String get createAccount => 'Ustvari račun';

  @override
  String get signIn => 'Prijava';

  @override
  String get or => 'ali';

  @override
  String get registerSubtitle => 'Da prijatelji vidijo, kdo je posnel fotke.';

  @override
  String get loginSubtitle => 'Dobrodošel nazaj.';

  @override
  String get forgotPasswordTitle => 'Pozabljeno geslo';

  @override
  String get forgotPasswordPushSubtitle =>
      'Si še kje prijavljen? Tja ti bomo poslali 6-mestno kodo kot potisno obvestilo, da nastaviš novo geslo.';

  @override
  String get newPassword => 'Novo geslo';

  @override
  String get resetPushInfo =>
      'Če si še kje prijavljen, boš tam dobil potisno obvestilo s kodo. Ne moreš noter? Prijavi se z Applom ali Googlom z istim e-poštnim naslovom - račun se bo povezal.';

  @override
  String get sendCode => 'Pošlji kodo';

  @override
  String get savePassword => 'Shrani geslo';

  @override
  String get errorTryAgain => 'Nekaj je šlo narobe. Poskusi znova.';

  @override
  String get back => 'Nazaj';

  @override
  String get name => 'Ime';

  @override
  String get email => 'E-poštni naslov';

  @override
  String get codeFromPush => 'Koda iz obvestila';

  @override
  String get password => 'Geslo';

  @override
  String get hidePassword => 'Skrij geslo';

  @override
  String get showPassword => 'Pokaži geslo';

  @override
  String get forgotPasswordLink => 'Pozabljeno geslo?';

  @override
  String get haveAccount => 'Že imaš račun?';

  @override
  String get newToCamTrip => 'Si nov na CamTripu?';

  @override
  String get rememberedIt => 'Si se spomnil?';

  @override
  String get noCodeReceived => 'Nisi dobil kode?';

  @override
  String get resendCode => 'Pošlji znova';

  @override
  String onboardingDemoRoll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotografov, 1 film',
      few: '$count fotografi, 1 film',
      two: '$count fotografa, 1 film',
      one: '$count fotograf, 1 film',
    );
    return '$_temp0';
  }

  @override
  String membersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count članov',
      few: '$count člani',
      two: '$count člana',
      one: '$count član',
    );
    return '$_temp0';
  }

  @override
  String photosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotk',
      few: '$count fotke',
      two: '$count fotki',
      one: '$count fotka',
    );
    return '$_temp0';
  }

  @override
  String videosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count videov',
      few: '$count videi',
      two: '$count videa',
      one: '$count video',
    );
    return '$_temp0';
  }

  @override
  String get justNow => 'zdaj';

  @override
  String get badgeNew => 'Novo';

  @override
  String recapTitle(String groupName) {
    return 'Povzetek: $groupName';
  }

  @override
  String get styleFilm => 'Film';

  @override
  String get styleInstant => 'Instant';

  @override
  String get styleDisposable => 'Enkratni';

  @override
  String get styleBw => 'Č/B';

  @override
  String get styleGolden => 'Golden';

  @override
  String get styleChrome => 'Chrome';

  @override
  String get styleFilmDescription => 'Tople barve, zrnatost in oranžen datum';

  @override
  String get styleInstantDescription => 'Mehke barve in bel rob';

  @override
  String get styleDisposableDescription =>
      'Oster blisk, vinjeta in uhajanje svetlobe';

  @override
  String get styleBwDescription => 'Zrnata črno-bela z globokim kontrastom';

  @override
  String get styleGoldenDescription => 'Vedno zlata ura, mehak zlat sij';

  @override
  String get styleChromeDescription => 'Hladno, nasičeno in ostro kot diafilm';

  @override
  String get shutterStopRecording => 'Ustavi snemanje';

  @override
  String get shutterStartRecording => 'Začni snemati video';

  @override
  String get shutterTakePhoto => 'Fotografiraj';

  @override
  String get modePhoto => 'Fotka';

  @override
  String get modeVideo => 'Video';

  @override
  String get cameraNotFound => 'Kamere ni mogoče najti';

  @override
  String get cameraAccessNeeded =>
      'CamTrip potrebuje dostop do kamere. Vklopi ga v Nastavitvah.';

  @override
  String get cameraStartFailed => 'Kamere ni bilo mogoče zagnati';

  @override
  String get albumAccessNeeded =>
      'Daj CamTripu dostop do fotk, da jih shrani tudi v tvoj album';

  @override
  String get albumSaveFailed =>
      'Shranjevanje v album ni uspelo. Fotka je vseeno deljena.';

  @override
  String styleProFallback(String style) {
    return 'Ta slog je del Pro. V tej skupini fotografiraš s slogom $style.';
  }

  @override
  String get photoFailed => 'Fotografiranje ni uspelo. Poskusi znova.';

  @override
  String get recordingFailed => 'Snemanje videa ni uspelo';

  @override
  String get videoFailed => 'Izdelava videa ni uspela. Poskusi znova.';

  @override
  String get shootInGroup => 'Fotografiraj v skupino';

  @override
  String get close => 'Zapri';

  @override
  String get flash => 'Bliskavica';

  @override
  String get flashOn => 'Vklop';

  @override
  String get flashOff => 'Izklop';

  @override
  String get flashAuto => 'Samodejno';

  @override
  String get chooseGroup => 'Izberi skupino';

  @override
  String get switchCamera => 'Zamenjaj kamero';

  @override
  String get createOrJoinFirst =>
      'Najprej ustvari skupino ali se pridruži kakšni';

  @override
  String get proViaGroup => 'Pro prek skupine';

  @override
  String proViaName(String name) {
    return 'Pro prek: $name';
  }

  @override
  String get proStylesFreeViaMember =>
      'Slogi Pro so v tej skupini zate brezplačni zaradi člana s Pro';

  @override
  String proStylesFreeViaName(String name) {
    return 'Slogi Pro v tej skupini: zate brezplačno zaradi: $name';
  }

  @override
  String get subscriptionsUnavailable =>
      'Naročnine trenutno niso na voljo. Poskusi znova pozneje.';

  @override
  String get paymentPending =>
      'Plačilo se še obdeluje. Pro se vklopi, ko bo končano.';

  @override
  String get purchaseFailed => 'Nakup ni uspel. Poskusi znova pozneje.';

  @override
  String get restoreUnavailable =>
      'Obnovitev nakupov trenutno ni mogoča. Poskusi znova pozneje.';

  @override
  String get restoreFailed => 'Obnovitev ni uspela. Poskusi znova pozneje.';

  @override
  String get welcomePro => 'Dobrodošel v CamTrip Pro! 🎉';

  @override
  String get proRestored => 'Pro je obnovljen';

  @override
  String get noPurchaseFound => 'Ni najdenega prejšnjega nakupa';

  @override
  String periodDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dni',
      few: '$count dni',
      two: '$count dneva',
      one: '$count dan',
    );
    return '$_temp0';
  }

  @override
  String periodWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tednov',
      few: '$count tedne',
      two: '$count tedna',
      one: '$count teden',
    );
    return '$_temp0';
  }

  @override
  String periodMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mesecev',
      few: '$count mesece',
      two: '$count meseca',
      one: '$count mesec',
    );
    return '$_temp0';
  }

  @override
  String periodYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count let',
      few: '$count leta',
      two: '$count leti',
      one: '$count leto',
    );
    return '$_temp0';
  }

  @override
  String get paywallHavePro => 'Imaš CamTrip Pro';

  @override
  String get paywallSubtitle => 'Vse za tvoje naslednje potovanje.';

  @override
  String paywallFeatureStyles(String styles) {
    return 'Vsi slogi kamere ($styles)';
  }

  @override
  String get paywallFeatureUnlimited =>
      'Neomejeno članov in prostora, fotke ostanejo za vedno';

  @override
  String get paywallFeatureNoWatermark => 'Povzetki brez vodnega žiga';

  @override
  String get paywallFeatureOriginal => 'Prenos v izvirni kakovosti';

  @override
  String get planYear => 'Leto';

  @override
  String get planMonth => 'Mesec';

  @override
  String pricePerMonth(String price) {
    return '$price na mesec';
  }

  @override
  String paywallSaveBadge(int percent) {
    return 'PRIHRANI $percent %';
  }

  @override
  String get planMonthCancelAnytime => 'prekliči kadarkoli';

  @override
  String tryFree(String period) {
    return 'Preizkusi $period brezplačno';
  }

  @override
  String get becomePro => 'Pridobi Pro';

  @override
  String get subscriptionsLoadFailed =>
      'Naročnin ni bilo mogoče naložiti. Preveri povezavo.';

  @override
  String legalAnnual(String price) {
    return 'Letna naročnina CamTrip Pro: $price na leto.';
  }

  @override
  String legalAnnualTrial(String period, String price) {
    return 'Letna naročnina CamTrip Pro: $period brezplačno, nato $price na leto.';
  }

  @override
  String legalMonthly(String price) {
    return 'Mesečna naročnina CamTrip Pro: $price na mesec.';
  }

  @override
  String legalMonthlyTrial(String period, String price) {
    return 'Mesečna naročnina CamTrip Pro: $period brezplačno, nato $price na mesec.';
  }

  @override
  String get legalBillingApple =>
      'Plačilo se zaračuna tvojemu Apple ID-ju. Naročnina se samodejno podaljša, razen če jo prekličeš vsaj 24 ur pred koncem obdobja. Prekličeš in upravljaš jo lahko v nastavitvah računa App Store.';

  @override
  String get legalBillingGoogle =>
      'Plačilo se zaračuna tvojemu Google računu. Naročnina se samodejno podaljša, razen če jo prekličeš vsaj 24 ur pred koncem obdobja. Prekličeš in upravljaš jo lahko v nastavitvah računa Google Play.';

  @override
  String get restorePurchases => 'Obnovi nakupe';

  @override
  String get terms => 'Pogoji';

  @override
  String get privacy => 'Zasebnost';

  @override
  String get groupProTitle => 'En Pro v skupini = Pro za vse v tej skupini';

  @override
  String get groupProBody =>
      'Če ima ena oseba Pro, cela skupina dobi vse sloge kamere, neomejeno članov, fotke, ki ostanejo, izvirno kakovost in povzetke brez vodnega žiga.';

  @override
  String get groupCreated => 'Skupina je ustvarjena ✓';

  @override
  String get inviteFriends => 'Povabi prijatelje';

  @override
  String get codeCopied => 'Koda je kopirana';

  @override
  String get shareLink => 'Deli povezavo';

  @override
  String inviteSubject(String groupName) {
    return 'Pridruži se skupini $groupName na CamTripu';
  }

  @override
  String inviteMembersUnlimited(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count članov',
      few: '$count člani',
      two: '$count člana',
      one: '$count član',
    );
    return '$_temp0 · neomejeno (Pro)';
  }

  @override
  String inviteMembersLimit(int count, int limit) {
    return '$count od $limit članov · Pro: neomejeno';
  }

  @override
  String get toCamera => 'Na kamero';

  @override
  String get done => 'Končano';

  @override
  String get joinEnterCode => 'Vpiši 6-mestno kodo';

  @override
  String get joinGroupTitle => 'Pridruži se skupini';

  @override
  String get joinGroupSubtitle =>
      'Vpiši kodo prijateljev ali skeniraj njihovo kodo QR.';

  @override
  String get typeCode => 'Vpiši kodo';

  @override
  String get scanQr => 'Skeniraj QR';

  @override
  String get join => 'Pridruži se';

  @override
  String get groupNameRequired => 'Poimenuj skupino';

  @override
  String get newGroup => 'Nova skupina';

  @override
  String get groupType => 'Vrsta skupine';

  @override
  String get groupTypeVacation => 'Počitnice';

  @override
  String get groupTypeVacationDescription =>
      'Z začetnim in končnim datumom, nato arhivirano';

  @override
  String get groupTypeEvent => 'Dogodek';

  @override
  String get groupTypeEventDescription => 'En dan ali večer, npr. zabava';

  @override
  String get groupTypePermanent => 'Vedno odprta';

  @override
  String get groupTypePermanentDescription =>
      'Za tvojo stalno ekipo prijateljev';

  @override
  String get date => 'Datum';

  @override
  String get departure => 'Odhod';

  @override
  String get returnDate => 'Vrnitev';

  @override
  String get defaultCameraStyle => 'Privzeti slog kamere';

  @override
  String freeLimitPermanent(int max) {
    return 'Brezplačno: do $max članov. S Pro neomejeno.';
  }

  @override
  String freeLimitDated(int max, int days) {
    return 'Brezplačno: do $max članov, fotke se hranijo do $days dni po končnem datumu. S Pro neomejeno in za vedno.';
  }

  @override
  String get createGroup => 'Ustvari skupino';

  @override
  String get group => 'Skupina';

  @override
  String groupCode(String code) {
    return 'koda $code';
  }

  @override
  String get manage => 'Upravljaj';

  @override
  String get rename => 'Preimenuj';

  @override
  String get changeDates => 'Spremeni datume';

  @override
  String get finishTrip => 'Zaključi potovanje';

  @override
  String get finishTripSubtitle => 'Končni datum nastavi na danes';

  @override
  String get reopenGroup => 'Znova odpri skupino';

  @override
  String get closeGroup => 'Zapri skupino';

  @override
  String get reopenGroupSubtitle => 'Člani lahko znova dodajajo fotke';

  @override
  String get closeGroupSubtitle =>
      'Nihče ne more več dodajati fotk; vse si je še vedno mogoče ogledati';

  @override
  String get members => 'Člani';

  @override
  String memberYou(String name) {
    return '$name (ti)';
  }

  @override
  String get blockedTag => 'blokiran';

  @override
  String get adminTag => 'admin';

  @override
  String removeMemberTitle(String name) {
    return 'Odstranim: $name?';
  }

  @override
  String get removeMemberMessage => 'Njegove fotke ostanejo v skupini.';

  @override
  String get remove => 'Izbriši';

  @override
  String get removeMember => 'Odstrani';

  @override
  String blockTitle(String name) {
    return 'Blokiram: $name?';
  }

  @override
  String blockMessage(String name) {
    return 'Fotk in videov od $name ne boš več videl in o njih ne boš dobival obvestil. To lahko razveljaviš v Nastavitvah.';
  }

  @override
  String get block => 'Blokiraj';

  @override
  String get makeMember => 'Nastavi kot običajnega člana';

  @override
  String get makeAdmin => 'Nastavi kot admina';

  @override
  String get removeFromGroup => 'Odstrani iz skupine';

  @override
  String get unblock => 'Odblokiraj';

  @override
  String get inviteFriendsButton => 'Povabi prijatelje';

  @override
  String get you => 'Ti';

  @override
  String get unarchive => 'Obnovi iz arhiva';

  @override
  String get archive => 'Arhiviraj';

  @override
  String get unarchiveSubtitle => 'Skupina je spet med tvojimi albumi';

  @override
  String archiveSubtitle(String section) {
    return 'Samo zate: skupina se premakne v »$section« na dnu tvojih albumov';
  }

  @override
  String get archivedSection => 'Arhivirano';

  @override
  String get hiddenPhotos => 'Skrite fotke';

  @override
  String get hiddenPhotosSubtitle => 'Fotke, ki si jih skril zase';

  @override
  String get leaveGroup => 'Zapusti skupino';

  @override
  String get leaveGroupSubtitle => 'Tvoje fotke ostanejo v skupini za druge';

  @override
  String get deleteGroup => 'Izbriši skupino';

  @override
  String get deleteGroupSubtitle => 'Vse fotke se izbrišejo za vse';

  @override
  String groupArchived(String groupName) {
    return '»$groupName« je arhivirana';
  }

  @override
  String groupUnarchived(String groupName) {
    return '»$groupName« je spet med tvojimi albumi';
  }

  @override
  String get undo => 'Razveljavi';

  @override
  String get groupNameTitle => 'Ime skupine';

  @override
  String get finishTripTitle => 'Zaključim potovanje?';

  @override
  String get finishTripMessage =>
      'Končni datum postane danes. Fotke lahko še vedno dodajaš; povzetek je pripravljen.';

  @override
  String get finishTripConfirm => 'Zaključi';

  @override
  String get tripFinished => 'Potovanje je zaključeno';

  @override
  String leaveGroupTitle(String groupName) {
    return 'Zapustim »$groupName«?';
  }

  @override
  String get leaveGroupMessage =>
      'Tvoje fotke ostanejo v skupini za druge. Pozneje se lahko znova pridružiš s kodo.';

  @override
  String get leave => 'Zapusti';

  @override
  String groupDeleted(String groupName) {
    return '»$groupName« je izbrisana';
  }

  @override
  String get youAreAdmin => 'si admin';

  @override
  String get open => 'Odpri';

  @override
  String get archiveMenuSubtitle => 'Samo zate, drugi ne bodo opazili';

  @override
  String get deleteGroupMenuSubtitle => 'Za vse, z vsemi fotkami';

  @override
  String get deleteGroupTitle => 'Izbrišem skupino?';

  @override
  String deleteGroupMessage(int count, String groupName, int memberCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Vseh $count fotk in videov',
      few: 'Vse $count fotke in videi',
      two: 'Obe $count fotki in videa',
      one: '$count fotka ali video',
    );
    String _temp1 = intl.Intl.pluralLogic(
      memberCount,
      locale: localeName,
      other: 'vseh $memberCount članov',
      few: 'vse $memberCount člane',
      two: 'oba $memberCount člana',
      one: '$memberCount člana',
    );
    return '$_temp0 v »$groupName« bo izginilo za $_temp1. Tega ni mogoče razveljaviti.';
  }

  @override
  String get deleteGroupOwnRoll => 'Tvoja galerija ostane nespremenjena.';

  @override
  String get deleteGroupTypeName => 'Za potrditev vpiši ime skupine:';

  @override
  String get deleteForEveryone => 'Izbriši za vse';

  @override
  String get save => 'Shrani';

  @override
  String get yourAlbums => 'Tvoji albumi';

  @override
  String get uploadQueue => 'Čakalna vrsta nalaganja';

  @override
  String get noConnection => 'Ni povezave';

  @override
  String get albumsOfflineMessage =>
      'Albumi se naložijo, ko boš spet na spletu. Kamera vseeno deluje.';

  @override
  String get retry => 'Poskusi znova';

  @override
  String get noAlbumsTitle => 'Še ni albumov';

  @override
  String get noAlbumsMessage =>
      'Ustvari skupino za naslednje potovanje ali se pridruži prijateljevi s njegovo kodo.';

  @override
  String get haveCode => 'Imam kodo';

  @override
  String get joinWithCode => 'Pridruži se s kodo ali kodo QR';

  @override
  String get camera => 'Kamera';

  @override
  String get restore => 'Obnovi';

  @override
  String get more => 'Več';

  @override
  String get newAlbum => 'Nova';

  @override
  String get closedTag => 'zaprta';

  @override
  String get activeTag => 'aktivna';

  @override
  String get uploadFailed => 'Nalaganje ni uspelo';

  @override
  String get queueNoSignal => 'Ni signala.';

  @override
  String get queueNoSignalMessage =>
      'Tvoje fotke so že v albumu in bodo deljene, ko boš spet na spletu.';

  @override
  String get queueWaitingForWifi => 'Čakanje na Wi-Fi.';

  @override
  String queueWifiOnlyOn(String setting) {
    return 'Vklopljeno imaš »$setting«.';
  }

  @override
  String get queueVideosWifiOnly => 'Videi gredo samo prek Wi-Fi.';

  @override
  String get queueAllShared => 'Vse je deljeno ✓';

  @override
  String queuePending(String items) {
    return 'Še za deljenje: $items';
  }

  @override
  String queuePendingBoth(String photos, String videos) {
    return 'Še za deljenje: $photos in $videos';
  }

  @override
  String get retryUpload => 'Poskusi znova';

  @override
  String get removeFromQueue => 'Odstrani iz vrste';

  @override
  String get queueStatusWifi => 'Wi-Fi';

  @override
  String get queueStatusWaiting => 'čaka';

  @override
  String get videosWifiOnlyTitle => 'Videi samo prek Wi-Fi';

  @override
  String get videosWifiOnlySubtitle => 'Varčuje z mobilnimi podatki';

  @override
  String get retryNow => 'Poskusi zdaj';

  @override
  String get yourName => 'Tvoje ime';

  @override
  String get settings => 'Nastavitve';

  @override
  String get tapToChangeName => 'Tapni za spremembo imena';

  @override
  String get getCamTripPro => 'Pridobi CamTrip Pro';

  @override
  String get photos => 'Fotke';

  @override
  String get saveOwnPhotos => 'Shranjuj moje fotke v album za vsako skupino';

  @override
  String get autoSaveOthers => 'Samodejno shranjuj fotke drugih';

  @override
  String get wifiOnlyTitle => 'Nalaganje samo prek Wi-Fi';

  @override
  String get dateStamp => 'Datum na fotki';

  @override
  String get notifications => 'Obvestila';

  @override
  String get notifyNewPhotos => 'Nove fotke (zbrano)';

  @override
  String get notifyRecapReady => 'Povzetek je pripravljen';

  @override
  String get camTripTeam => 'Ekipa CamTrip';

  @override
  String get adminEntrySubtitle =>
      'Uporabniki, podeljevanje Pro, prijave in statistika';

  @override
  String get account => 'Račun';

  @override
  String get manageSubscription => 'Upravljaj naročnino';

  @override
  String get blockedPeople => 'Blokirane osebe';

  @override
  String get nobody => 'Nihče';

  @override
  String peopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count oseb',
      few: '$count osebe',
      two: '$count osebi',
      one: '$count oseba',
    );
    return '$_temp0';
  }

  @override
  String get privacyPolicy => 'Pravilnik o zasebnosti';

  @override
  String get contact => 'Stik';

  @override
  String get signOut => 'Odjava';

  @override
  String get deleteAccount => 'Izbriši račun';

  @override
  String get deleteAccountSubtitle => 'Izbriše tvoj račun in vse tvoje fotke';

  @override
  String get deleteAccountTitle => 'Izbrišem račun?';

  @override
  String get deleteAccountMessage =>
      'Tvoj račun ter vse tvoje fotke in videi bodo izbrisani, tudi iz skupin. Aktivno naročnino prekliči v App Storu ali Google Playu.';

  @override
  String get blockedTitle => 'Blokirani';

  @override
  String get blockedSubtitle => 'Fotk teh oseb ne vidiš.';

  @override
  String get blockedNone => 'Nikogar nisi blokiral.';

  @override
  String get unblockShort => 'Odblokiraj';

  @override
  String get groupGone => 'Ta skupina ne obstaja več ali nisi več član.';

  @override
  String photosSavedToAlbum(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotk shranjenih v »$album«',
      few: '$count fotke shranjene v »$album«',
      two: '$count fotki shranjeni v »$album«',
      one: '$count fotka shranjena v »$album«',
    );
    return '$_temp0';
  }

  @override
  String photosDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotk izbrisanih',
      few: '$count fotke izbrisane',
      two: '$count fotki izbrisani',
      one: '$count fotka izbrisana',
    );
    return '$_temp0';
  }

  @override
  String photosDeletedSkipped(int count, int skipped) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotk izbrisanih',
      few: '$count fotke izbrisane',
      two: '$count fotki izbrisani',
      one: '$count fotka izbrisana',
    );
    return '$_temp0, preskočeno: $skipped';
  }

  @override
  String photosHiddenForYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotk skritih zate',
      few: '$count fotke skrite zate',
      two: '$count fotki skriti zate',
      one: '$count fotka skrita zate',
    );
    return '$_temp0';
  }

  @override
  String get addedToFavorites => 'Dodano med priljubljene';

  @override
  String get removedFromFavorites => 'Odstranjeno iz priljubljenih';

  @override
  String get photoAccessSettings => 'Daj CamTripu dostop do fotk v Nastavitvah';

  @override
  String photosBeingAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Dodajanje $count fotk',
      few: 'Dodajanje $count fotk',
      two: 'Dodajanje $count fotk',
      one: 'Dodajanje $count fotke',
    );
    return '$_temp0';
  }

  @override
  String photosUnreadable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotk ni bilo mogoče prebrati',
      few: '$count fotk ni bilo mogoče prebrati',
      two: '$count fotk ni bilo mogoče prebrati',
      one: '$count fotke ni bilo mogoče prebrati',
    );
    return '$_temp0';
  }

  @override
  String get groupNotLoaded => 'Skupina ni naložena';

  @override
  String get noFavoritesTitle => 'Še ni priljubljenih';

  @override
  String get noPhotosTitle => 'Še ni fotk';

  @override
  String get noFavoritesMessage => 'Tapni zvezdico na fotki, da jo dodaš sem.';

  @override
  String get noPhotosMessage =>
      'Posnemi prvo fotko. Vsi v skupini jo takoj vidijo.';

  @override
  String get openCamera => 'Odpri kamero';

  @override
  String savingProgress(int done, int total) {
    return 'Shranjevanje... $done/$total';
  }

  @override
  String get sharePreparing => 'Pripravljanje...';

  @override
  String sharingProgress(int done, int total) {
    return 'Pripravljanje... $done/$total';
  }

  @override
  String get choosePhotos => 'Izberi fotke';

  @override
  String selectedCount(int count) {
    return 'Izbrano: $count';
  }

  @override
  String get selectNone => 'Počisti izbiro';

  @override
  String get selectAll => 'Izberi vse';

  @override
  String photosWaitingToShare(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotk čaka na deljenje',
      few: '$count fotke čakajo na deljenje',
      two: '$count fotki čakata na deljenje',
      one: '$count fotka čaka na deljenje',
    );
    return '$_temp0';
  }

  @override
  String get recapReadyTitle => 'Tvoj povzetek je pripravljen';

  @override
  String get recapReadySubtitle => 'Video z glasbo s tvojega potovanja';

  @override
  String get watch => 'Poglej';

  @override
  String get makeRecapNow => 'Naredi video povzetek zdaj';

  @override
  String freeGroupDeleteNotice(String date) {
    return 'Brezplačna skupina: fotke se hranijo do $date. Shrani jih ali pridobi Pro.';
  }

  @override
  String get filterAll => 'Vse';

  @override
  String get filterFavorites => 'Priljubljene';

  @override
  String get filterPerPerson => 'Po osebi';

  @override
  String get filterPerson => 'Oseba';

  @override
  String get select => 'Izberi';

  @override
  String get hiddenFilter => 'Skrite';

  @override
  String get photosBy => 'Fotke od...';

  @override
  String get uploadedTag => 'naloženo';

  @override
  String get saveAll => 'Shrani vse';

  @override
  String get favorite => 'Priljubljena';

  @override
  String get unfavorite => 'Odstrani iz priljubljenih';

  @override
  String get hide => 'Skrij';

  @override
  String get delete => 'Izbriši';

  @override
  String deletePhotosTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Izbrišem $count fotk?',
      few: 'Izbrišem $count fotke?',
      two: 'Izbrišem $count fotki?',
      one: 'Izbrišem fotko?',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Izginejo za vse v skupini. Tega ni mogoče razveljaviti.',
      two: 'Izgineta za vse v skupini. Tega ni mogoče razveljaviti.',
      one: 'Izgine za vse v skupini. Tega ni mogoče razveljaviti.',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosNotAllowed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count fotk je od nekoga drugega. Ostanejo; izbriše jih lahko samo admin.',
      few:
          '$count fotke so od nekoga drugega. Ostanejo; izbriše jih lahko samo admin.',
      two:
          '$count fotki sta od nekoga drugega. Ostaneta; izbriše ju lahko samo admin.',
      one:
          '$count fotka je od nekoga drugega. Ostane; izbriše jo lahko samo admin.',
    );
    return '$_temp0';
  }

  @override
  String photosBackInGroup(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotk je spet v skupini',
      few: '$count fotke so spet v skupini',
      two: '$count fotki sta spet v skupini',
      one: '$count fotka je spet v skupini',
    );
    return '$_temp0';
  }

  @override
  String get showAll => 'Pokaži vse';

  @override
  String get hiddenPhotosExplainer =>
      'Teh fotk ne vidiš samo ti. Za druge v skupini so še vedno tam.';

  @override
  String get nothingHidden => 'Nič ni skrito';

  @override
  String get nothingHiddenMessage =>
      'Fotke, ki jih skriješ, se prikažejo tukaj.';

  @override
  String showAgainCount(int count) {
    return 'Znova pokaži ($count)';
  }

  @override
  String get someone => 'Nekdo';

  @override
  String get savedToAlbum => 'Shranjeno v foto album';

  @override
  String get share => 'Deli';

  @override
  String get shareFailed => 'Deljenje ni uspelo';

  @override
  String get reportTitle => 'Zakaj prijavljaš to fotko?';

  @override
  String get reportSubtitle =>
      'Vsako prijavo pregledamo v 24 urah. Fotka je zate takoj skrita.';

  @override
  String get reportThanks => 'Hvala, pogledali bomo';

  @override
  String blockMessageAllGroups(String name) {
    return 'Fotk in videov od $name ne boš več videl v nobeni skupini in o njih ne boš dobival obvestil. To lahko razveljaviš v Nastavitvah.';
  }

  @override
  String userBlocked(String name) {
    return '$name je blokiran';
  }

  @override
  String get videoHiddenForYou => 'Video je skrit zate';

  @override
  String get photoHiddenForYou => 'Fotka je skrita zate';

  @override
  String get setAsCover => 'Nastavi kot naslovnico';

  @override
  String get coverUpdated => 'Naslovnica je posodobljena';

  @override
  String get hideForMe => 'Skrij zame';

  @override
  String get hideForMeSubtitle => 'Drugi v skupini jo še vedno vidijo';

  @override
  String get reportPhoto => 'Prijavi fotko';

  @override
  String blockName(String name) {
    return 'Blokiraj: $name';
  }

  @override
  String get forEveryoneInGroup => 'Za vse v skupini';

  @override
  String get videoDeleted => 'Video je izbrisan';

  @override
  String get photoDeleted => 'Fotka je izbrisana';

  @override
  String get photoAccessToSave =>
      'Daj CamTripu dostop do fotk v Nastavitvah, da jih lahko shraniš';

  @override
  String get phoneFull => 'Telefon je poln';

  @override
  String get albumSaveFailedShort => 'Shranjevanje v album ni uspelo';

  @override
  String get recapTemplateGoldenHour => 'Golden Hour';

  @override
  String get recapTemplateFast => 'Hitro';

  @override
  String get recapTemplateFilmRoll => 'Filmski trak';

  @override
  String get recapTemplatePolaroid => 'Polaroid';

  @override
  String get trackSummerEvening => 'Poletni večer';

  @override
  String get trackGoldenHour => 'Golden Hour';

  @override
  String get trackRoadtrip => 'Road Trip';

  @override
  String get moodWarm => 'toplo';

  @override
  String get moodCheerful => 'veselo';

  @override
  String friendsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count prijateljev',
      few: '$count prijatelji',
      two: '$count prijatelja',
      one: '$count prijatelj',
    );
    return '$_temp0';
  }

  @override
  String get madeWithCamTrip => 'Narejeno s CamTripom';

  @override
  String get tagline => 'En film za vso ekipo';

  @override
  String get videoUnsupportedDevice =>
      'Izdelava videa na tej napravi ni uspela';

  @override
  String get groupLoadFailed => 'Te skupine ni bilo mogoče naložiti.';

  @override
  String recapNeedsPhotos(int count) {
    return 'Za povzetek potrebuješ vsaj $count fotk.';
  }

  @override
  String get recapFailed => 'Izdelava povzetka ni uspela. Poskusi znova.';

  @override
  String get recapSaved => 'Povzetek je shranjen v foto album';

  @override
  String get recap => 'Povzetek';

  @override
  String get recapRendering => 'Izdelava povzetka...';

  @override
  String get videoRendering => 'Izdelava videa...';

  @override
  String get template => 'Predloga';

  @override
  String get musicLicense =>
      'Lastna glasba CamTripa · brez avtorskih nadomestil';

  @override
  String get change => 'Spremeni';

  @override
  String get noWatermark => 'Brez vodnega žiga ✓';

  @override
  String get removeWatermarkPro => 'Odstrani vodni žig s Pro';

  @override
  String get proSourceSubscription => 'Naročnina';

  @override
  String get proSourceGift => 'Darilo';

  @override
  String get proSourceAdmin => 'Admin';

  @override
  String get proSourceGroup => 'Prek skupine';

  @override
  String get noPro => 'Brez Pro';

  @override
  String proStatusNoEnd(String source) {
    return 'Pro ($source), brez končnega datuma';
  }

  @override
  String proStatusUntil(String source, String date) {
    return 'Pro ($source), do $date';
  }

  @override
  String get lifetime => 'Doživljenjsko';

  @override
  String get pickDate => 'Izberi datum';

  @override
  String get noAccess => 'Ni dostopa';

  @override
  String get adminOnlyTeam => 'Upravljanje je samo za ekipo CamTrip.';

  @override
  String get adminOverview => 'Pregled';

  @override
  String get adminUsers => 'Uporabniki';

  @override
  String get adminReports => 'Prijave';

  @override
  String adminsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count adminov',
      few: '$count admini',
      two: '$count admina',
      one: '$count admin',
    );
    return '$_temp0';
  }

  @override
  String get adminNewThisWeek => 'Novi ta teden';

  @override
  String get adminGroups => 'Skupine';

  @override
  String get adminProSubscription => 'Pro z naročnino';

  @override
  String get adminProGift => 'Pro kot darilo';

  @override
  String adminWithoutSubscription(int count) {
    return '$count brez naročnine';
  }

  @override
  String get adminOpenReports => 'Odprte prijave';

  @override
  String get adminSearchHint => 'Iskanje po imenu ali e-pošti';

  @override
  String get nobodyFound => 'Nihče ni najden';

  @override
  String get loadMore => 'Naloži več';

  @override
  String get noEmail => 'Ni e-pošte';

  @override
  String adminDeletePhotoMessage(String groupName) {
    return 'Fotka izgine za vse v »$groupName«. Vse prijave te fotke se zaključijo.';
  }

  @override
  String get adminBanMessage =>
      'Ta račun se ne more več prijaviti in uporabljati aplikacije. To lahko pozneje razveljaviš.';

  @override
  String get adminDismissTitle => 'Zavrnem prijavo?';

  @override
  String get adminDismissMessage =>
      'Fotka ostane. Prijava je označena kot zaključena.';

  @override
  String get adminDismiss => 'Zavrni';

  @override
  String get adminAccountBlocked => 'Račun je blokiran';

  @override
  String get adminReportDismissed => 'Prijava je zavrnjena';

  @override
  String get adminNoReports => 'Ni odprtih prijav';

  @override
  String get adminNoReportsMessage => 'Prijavljene fotke se prikažejo tukaj.';

  @override
  String get deletedTag => 'Izbrisano';

  @override
  String adminReportedBy(String name) {
    return 'Prijavil: $name';
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
      other: '$count prijav',
      few: '$count prijave',
      two: '$count prijavi',
      one: '$count prijava',
    );
    return '$_temp0';
  }

  @override
  String get adminDeletePhoto => 'Izbriši fotko';

  @override
  String get adminBlockCreator => 'Blokiraj avtorja';

  @override
  String get loadFailed => 'Nalaganje ni uspelo';

  @override
  String get adminLifetimeProGiven => 'Doživljenjski Pro podeljen';

  @override
  String get adminProGiven => 'Pro podeljen';

  @override
  String adminGiveProUntil(String date) {
    return 'Podeli Pro do $date';
  }

  @override
  String get adminGiveProLifetime => 'Podeli doživljenjski Pro';

  @override
  String adminGiveProFor(String period) {
    return 'Podeli Pro za $period';
  }

  @override
  String get adminReasonHint => 'Razlog, npr. prijatelj, tester, vplivnež';

  @override
  String get adminGivePro => 'Podeli Pro';

  @override
  String get adminRevokeTitle => 'Prekličem darilo?';

  @override
  String get adminRevokeMessage =>
      'Podarjeni Pro se takoj ustavi. Lastna naročnina teče naprej.';

  @override
  String get adminRevoke => 'Prekliči';

  @override
  String get adminGiftRevoked => 'Darilo je preklicano';

  @override
  String get adminUnbanTitle => 'Odpravim blokado?';

  @override
  String adminUnbanMessage(String name) {
    return '$name se lahko spet prijavi.';
  }

  @override
  String get adminUnbanned => 'Blokada je odpravljena';

  @override
  String get adminBanUserMessage =>
      'Ta račun se ne more več prijaviti in uporabljati aplikacije. Fotke ostanejo.';

  @override
  String get adminUser => 'Uporabnik';

  @override
  String get adminNotVerified => 'ni preverjeno';

  @override
  String get adminRole => 'Vloga';

  @override
  String get adminCreated => 'Ustvarjeno';

  @override
  String get unknown => 'Neznano';

  @override
  String get adminSignInWith => 'Prijava z';

  @override
  String get adminEmailMethod => 'E-pošta';

  @override
  String get adminPhotosAndVideos => 'Fotke in videi';

  @override
  String get adminStatus => 'Stanje';

  @override
  String get adminActive => 'Aktivno';

  @override
  String adminActiveUntil(String date) {
    return 'Aktivno do $date';
  }

  @override
  String adminGiftFrom(String name) {
    return 'Darilo od: $name';
  }

  @override
  String adminExpiredOn(String date) {
    return 'Poteklo $date';
  }

  @override
  String get adminExpired => 'Poteklo';

  @override
  String adminUntil(String date) {
    return 'Do $date';
  }

  @override
  String get adminGiveProTitle => 'Podeli Pro';

  @override
  String get adminGiveProNote =>
      'Velja tudi za skupine te osebe: en Pro v skupini = Pro za vse v tej skupini.';

  @override
  String get adminRevokeGift => 'Prekliči darilo';

  @override
  String get adminModeration => 'Moderiranje';

  @override
  String get adminCannotBanSelf => 'Sebe ne moreš blokirati.';

  @override
  String get adminCannotBanAdmin => 'Admina ni mogoče blokirati.';

  @override
  String get adminUnban => 'Odpravi blokado';

  @override
  String get adminBanAccount => 'Blokiraj račun';

  @override
  String get googleSignInUnavailable => 'Prijava z Googlom še ni na voljo';

  @override
  String get cameraPickerTitle => 'Izberi kamero';

  @override
  String get cameraPickerSubtitle => 'Vsaka kamera da tvojim fotkam svoj videz';

  @override
  String get cameraPickerChange => 'Zamenjaj kamero';

  @override
  String get cameraPickerUnlock => 'Odkleni s Pro';

  @override
  String get cameraPickerSelected => 'Izbrano';

  @override
  String get cameraPickerStyleSummer => 'Poletje';

  @override
  String get cameraPickerStyleSummerDescription =>
      'Tople, zbledele barve kot na posnetku iz 90. let';

  @override
  String get cameraPickerStyleNight => 'Noč 800';

  @override
  String get cameraPickerStyleNightDescription =>
      'Kinofilm: turkizne sence, topla svetloba, veliko zrnatosti';

  @override
  String get cameraPickerStyleSepia => 'Sepija';

  @override
  String get cameraPickerStyleSepiaDescription =>
      'Stara rjava fotografija iz škatle za čevlje';

  @override
  String get cameraPickerStyleLomo => 'Lomo';

  @override
  String get cameraPickerStyleLomoDescription =>
      'Močne barve, temni koti in nor barvni odtenek';

  @override
  String get cameraPickerStyleMint => 'Meta';

  @override
  String get cameraPickerStyleMintDescription =>
      'Mehko in sveže z zelenim odtenkom';

  @override
  String get cameraPickerStylePastel => 'Roza';

  @override
  String get cameraPickerStylePastelDescription =>
      'Pastelne barve z roza sijem in belim robom';

  @override
  String get cameraPickerStyleSuper8 => 'Super 8';

  @override
  String get cameraPickerStyleSuper8Description =>
      'Zrnato in mehko kot star domači film';

  @override
  String get paywallBenefitGroup => 'En Pro = Pro za vso skupino';

  @override
  String get paywallBenefitUnlimited =>
      'Neomejeno članov, fotke ostanejo za vedno';

  @override
  String get paywallBenefitQuality => 'Brez vodnega žiga, izvirna kakovost';

  @override
  String paywallFreeTrial(String period) {
    return '$period brezplačno';
  }

  @override
  String paywallPriceYear(String price) {
    return '$price na leto.';
  }

  @override
  String paywallPriceYearTrial(String period, String price) {
    return '$period brezplačno, nato $price na leto.';
  }

  @override
  String paywallPriceMonth(String price) {
    return '$price na mesec.';
  }

  @override
  String paywallPriceMonthTrial(String period, String price) {
    return '$period brezplačno, nato $price na mesec.';
  }

  @override
  String paywallAutoRenew(String store) {
    return 'Samodejno se podaljša. Prekliči vsaj 24 ur pred podaljšanjem v $store.';
  }

  @override
  String get paywallDetailsTitle => 'Vse v Pro';

  @override
  String get paywallBenefitStyles => 'Vsi slogi kamere';

  @override
  String get allPhotosTitle => 'Vse fotke';

  @override
  String get homeTabAlbums => 'Albumi';

  @override
  String get allPhotosEmptyTitle => 'Še ni fotk';

  @override
  String get allPhotosEmptyMessage =>
      'Odpri kamero in posnemi svojo prvo fotko.';

  @override
  String get allPhotosLoadFailed => 'Tvojih fotk ni bilo mogoče naložiti';

  @override
  String get cameraSettingsTitle => 'Nastavitve kamere';

  @override
  String get cameraSettingsMore => 'Več nastavitev';

  @override
  String get cameraSettingsGrid => 'Mreža';

  @override
  String get cameraSettingsHaptics => 'Vibriraj ob fotografiranju';

  @override
  String get cameraSettingsDateStamp => 'Datum spodaj desno';

  @override
  String get cameraSettingsSound => 'Zvok sprožilca';

  @override
  String get cameraSettingsSoundHint => 'Tiho, ko je telefon na tihem';

  @override
  String get cameraSettingsTimer => 'Samosprožilec';

  @override
  String get cameraSettingsTimerOff => 'Izklop';

  @override
  String cameraSettingsTimerSeconds(int seconds) {
    return '$seconds s';
  }

  @override
  String get cameraSettingsTimerCancelHint => 'Tapni sprožilec za preklic';

  @override
  String get cameraSettingsMirror => 'Zrcali selfije';

  @override
  String get cameraSettingsSaveToRoll => 'Shrani v galerijo';

  @override
  String get cameraSettingsQuality => 'Kakovost';

  @override
  String get cameraSettingsQualityStandard => 'Standardna';

  @override
  String get cameraSettingsQualityHigh => 'Visoka';

  @override
  String get cameraLowLightHint => 'Malo svetlobe - vklopi bliskavico';

  @override
  String get cameraFlashUnavailable => 'Ta kamera nima bliskavice';

  @override
  String get cameraFlashScreen => 'Bliskavica zaslona';

  @override
  String get cameraFlashCycleHint =>
      'Tapni za preklop med izklop, vklop in samodejno';

  @override
  String get cameraFlip => 'Preklopi med sprednjo in zadnjo kamero';

  @override
  String get cameraFlipHint => 'Dvakrat tapni iskalo za obrat kamere';

  @override
  String cameraPickerPaywallStyles(int count, String styles) {
    return 'Vse kamere ($count), vključno s $styles';
  }

  @override
  String get styleFlash => 'Blisk 400';

  @override
  String get styleFlashDescription =>
      'Neposredna bliskavica na toplem filmu: jantarni sij, zrnatost, polne rdeče';

  @override
  String cameraTimerButton(String state) {
    return 'Samosprožilec: $state';
  }

  @override
  String get cameraTimerCycleHint => 'Tapni za preklop med izklop, 3 s in 10 s';

  @override
  String get cameraLastShotOpen => 'Zadnja fotka, odpre album';

  @override
  String get cameraLastShotEmpty => 'Še ni fotk, odpre album';

  @override
  String get deleteOnlyOwnOrAdmin => 'To lahko izbriše samo avtor ali admin';

  @override
  String get videoPlay => 'Predvajaj';

  @override
  String get videoPause => 'Premor';

  @override
  String get language => 'Jezik';

  @override
  String get languageSystem => 'Sistemski jezik';

  @override
  String languageSystemCurrent(String language) {
    return 'Sistem ($language)';
  }

  @override
  String get languageSearchHint => 'Išči jezik';

  @override
  String get languageNoResults => 'Jezika ni mogoče najti';

  @override
  String get personalRollTitle => 'Moj film';

  @override
  String get personalRollSubtitle => 'Samo zate';

  @override
  String get personalRollPickerSubtitle => 'Posamezne fotke, samo zate';

  @override
  String get personalRollMove => 'V album';

  @override
  String get personalRollMoveTitle => 'Premakni v album';

  @override
  String get personalRollMoveNoAlbums =>
      'Najprej ustvari album ali se pridruži enemu s kodo.';

  @override
  String personalRollMoved(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotk premaknjenih v $album',
      few: '$count fotke premaknjene v $album',
      two: '2 fotki premaknjeni v $album',
      one: '1 fotka premaknjena v $album',
    );
    return '$_temp0';
  }

  @override
  String get personalRollPrivateNote =>
      'Te fotke vidiš samo ti. Premakni jih v album, da jih deliš.';

  @override
  String get paywallTripPassSub => 'Samo to potovanje, za celo skupino';

  @override
  String get paywallOneTime => 'enkratno';

  @override
  String get paywallBestValue => 'Najugodneje';

  @override
  String paywallRollFullTitle(int used, int limit) {
    return 'Tvoj film je poln - $used/$limit fotografij';
  }

  @override
  String get paywallRollFullSub => 'Fotografiraj naprej s Trip Passom ali Pro.';

  @override
  String get paywallCameraTitle => 'Ta fotoaparat je del Pro';

  @override
  String paywallCameraSub(int count) {
    return 'Odkleni vseh $count fotoaparatov.';
  }

  @override
  String get paywallWatermarkTitle => 'Recap brez vodnega žiga';

  @override
  String get paywallWatermarkSub => 'Deli recap brez logotipa CamTrip.';

  @override
  String get paywallDeletionTitle => 'Ohrani potovanje';

  @override
  String paywallDeletionSub(String date) {
    return 'Brezplačna potovanja se izbrišejo $date. S Trip Passom ali Pro ostane za vedno.';
  }

  @override
  String paywallTripPassTerms(String price) {
    return 'Enkraten nakup za $price za to potovanje. Ni naročnina.';
  }

  @override
  String get buyTripPass => 'Kupi Trip Pass';

  @override
  String get tripPassActive => 'Trip Pass aktiven: potovanje je Pro za vse';

  @override
  String get tripPassActivating =>
      'Plačilo prejeto. Trip Pass bo kmalu aktiven.';

  @override
  String proViaTripPass(String name) {
    return 'Trip Pass od $name';
  }

  @override
  String rollCounterSemantics(int used, int limit) {
    return '$used od $limit posnetkov na tvojem filmu';
  }

  @override
  String rollHeldTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Fotografij, ki ne gredo na film: $count',
      one: '1 fotografija ne gre več na film',
    );
    return '$_temp0';
  }

  @override
  String get rollHeldBody => 'Ohrani jih s Pro ali Trip Passom';

  @override
  String deletionBannerTitle(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Ohrani potovanje - še dni: $days',
      one: 'Ohrani potovanje - še 1 dan',
    );
    return '$_temp0';
  }

  @override
  String get deletionBannerBody =>
      'Brezplačna potovanja se izbrišejo 30 dni po koncu. S Trip Passom ali Pro ostane za vedno.';

  @override
  String apiRollFull(int limit) {
    return 'Tvoj film je poln ($limit posnetkov). Vzemi Trip Pass ali Pro za nadaljevanje.';
  }

  @override
  String get apiTripPassFailed =>
      'Trip Passa ni bilo mogoče aktivirati. Piši na support@camtrip.app.';

  @override
  String get apiTripPassExists => 'To potovanje že ima Trip Pass.';

  @override
  String get tripPassUnavailable =>
      'Trip Pass trenutno ni na voljo. Poskusi pozneje.';

  @override
  String get tripMapTitle => 'Zemljevid potovanja';

  @override
  String get tripMapOpen => 'Zemljevid in statistika';

  @override
  String get tripMapLoadFailed => 'Zemljevida ni bilo mogoče naložiti';

  @override
  String get tripMapStatDays => 'Dnevi';

  @override
  String get tripMapStatPhotos => 'Fotografije';

  @override
  String get tripMapStatVideos => 'Videi';

  @override
  String get tripMapStatMembers => 'Člani';

  @override
  String get tripMapStatDistance => 'prevoženih km';

  @override
  String get tripMapStatCountries => 'Države';

  @override
  String get tripMapStatPlaces => 'Kraji';

  @override
  String tripMapBusiestDay(String day, int count) {
    return 'Največ fotografij: $day ($count)';
  }

  @override
  String tripMapTopPhotographer(String name, int count) {
    return 'Najboljši fotograf: $name ($count)';
  }

  @override
  String get tripMapOffTitle => 'Zemljevid potovanja je izklopljen';

  @override
  String get tripMapOffMessage =>
      'Skrbnik lahko vklopi zemljevid v nastavitvah skupine. Statistiko vidiš vedno.';

  @override
  String get tripMapOffMessageAdmin =>
      'Vklopi zemljevid in poglejte, kje so nastale vaše fotografije. Vsak se sam odloči, ali sodeluje.';

  @override
  String get tripMapEnable => 'Vklopi zemljevid';

  @override
  String get tripMapEmptyTitle => 'Na zemljevidu še ni krajev';

  @override
  String get tripMapEmptyMessage =>
      'Nove fotografije članov, ki delijo lokacijo, se prikažejo tukaj, zaokrožene na približno 100 m.';

  @override
  String get tripMapConsentTitle => 'Zemljevid potovanja';

  @override
  String get tripMapConsentQuestion =>
      'Deliš na zemljevidu te skupine, kje so nastale tvoje fotografije?';

  @override
  String get tripMapConsentDetail =>
      'Vidijo jo le člani skupine, zaokroženo na približno 100 m. Lokacija se nikoli ne shrani v samo fotografijo in to lahko kadar koli izklopiš v nastavitvah skupine.';

  @override
  String get tripMapConsentYes => 'Da, deli';

  @override
  String get tripMapConsentNo => 'Ne';

  @override
  String get tripMapLocationDenied =>
      'Ni dostopa do tvoje lokacije. Dovoliš ga lahko v nastavitvah telefona.';

  @override
  String get tripMapSettingSubtitle =>
      'Pokaže na zemljevidu, kje so nastale fotografije. Člani se sami odločijo, ali delijo.';

  @override
  String get tripMapDisableTitle => 'Izklopim zemljevid?';

  @override
  String get tripMapDisableMessage =>
      'Vse lokacije v tej skupini bodo izbrisane. Če zemljevid pozneje znova vklopiš, bomo vse vprašali znova.';

  @override
  String get tripMapDisable => 'Izklopi';

  @override
  String get tripMapMySharing => 'Deli mojo lokacijo';

  @override
  String get tripMapMySharingOn =>
      'Tvoje nove fotografije se prikažejo na zemljevidu (zaokroženo na približno 100 m).';

  @override
  String get tripMapMySharingOff =>
      'Izklopljeno. Tvoje fotografije se ne prikažejo na zemljevidu.';

  @override
  String get tripMapStopSharingTitle => 'Ne deliš več lokacije?';

  @override
  String get tripMapStopSharingMessage =>
      'Lokacije vseh tvojih fotografij v tej skupini bodo izbrisane.';

  @override
  String get tripMapStopSharing => 'Ne deli več';
}
