// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Croatian (`hr`).
class AppLocalizationsHr extends AppLocalizations {
  AppLocalizationsHr([String locale = 'hr']) : super(locale);

  @override
  String get cancel => 'Odustani';

  @override
  String get yes => 'Da';

  @override
  String inviteMessageIntro(String groupName) {
    return 'Pridružuješ se grupi „$groupName” na CamTripu? Tako odmah vidimo fotke jedni drugih.';
  }

  @override
  String inviteMessageCode(String code) {
    return 'Ili unesi kôd: $code';
  }

  @override
  String get memberFallbackName => 'Prijatelj';

  @override
  String get reportReasonInappropriate => 'Neprimjereno ili uvredljivo';

  @override
  String get reportReasonSpam => 'Neželjeni sadržaj';

  @override
  String get reportReasonOther => 'Nešto drugo';

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
  String get errorOffline => 'Nema veze. Pokušaj ponovno za trenutak.';

  @override
  String errorSomethingWrongStatus(int status) {
    return 'Nešto nije u redu ($status)';
  }

  @override
  String get errorSomethingWrong => 'Nešto nije u redu';

  @override
  String get apiInvalidCredentials => 'E-adresa ili lozinka nije točna';

  @override
  String get apiInvalidCode =>
      'Kôd nije točan ili je istekao. Zatraži novi kôd.';

  @override
  String get apiEmailTaken =>
      'Račun s ovom e-adresom već postoji. Prijavi se ili odaberi „Zaboravljena lozinka?”.';

  @override
  String apiEmailTakenProvider(String provider) {
    return 'Račun s ovom e-adresom već postoji. Prijavi se putem usluge $provider.';
  }

  @override
  String apiWeakPassword(int min) {
    return 'Odaberi lozinku od najmanje $min znakova';
  }

  @override
  String apiNameTooLong(int max) {
    return 'Ime može imati najviše $max znakova';
  }

  @override
  String get apiRateLimited =>
      'Previše pokušaja. Pokušaj ponovno za 15 minuta.';

  @override
  String apiAccountBanned(String email) {
    return 'Tvoj račun je blokiran. Javi se na $email ako misliš da je to pogreška.';
  }

  @override
  String get apiProRequired => 'Ovaj stil kamere dio je CamTrip Pro';

  @override
  String get apiGroupClosed => 'Ova grupa je zatvorena';

  @override
  String get apiGroupCodeNotFound => 'Nema grupe s ovim kôdom';

  @override
  String apiGroupFull(int max) {
    return 'Grupa je puna (najviše $max članova). Ako jedan član ima CamTrip Pro, svatko se može pridružiti.';
  }

  @override
  String get apiLastMember => 'Ti si zadnji član. Radije izbriši grupu.';

  @override
  String get apiAdminRequired => 'Samo za administratore CamTripa';

  @override
  String get apiUploadIncomplete => 'Prijenos nije dovršen';

  @override
  String get apiInvalidInput => 'Neispravan unos';

  @override
  String get apiNotSignedIn => 'Nisi prijavljen';

  @override
  String get apiAccountGone => 'Ovaj račun više ne postoji';

  @override
  String get apiPhotoNotFound => 'Fotka nije pronađena';

  @override
  String get apiGroupNotFound => 'Grupa nije pronađena';

  @override
  String get apiMemberNotFound => 'Član nije pronađen';

  @override
  String get apiPersonNotFound => 'Osoba nije pronađena';

  @override
  String get apiUserNotFound => 'Korisnik nije pronađen';

  @override
  String get apiAdminOnly => 'Ovo može samo admin';

  @override
  String get apiCannotBlockSelf => 'Ne možeš blokirati sebe';

  @override
  String get apiCannotReportOwn => 'Ne možeš prijaviti vlastitu fotku';

  @override
  String get apiDeleteOwnOnly => 'Možeš brisati samo svoje fotke';

  @override
  String get apiOwnerCannotBeRemoved => 'Tvorac grupe ne može se ukloniti';

  @override
  String get apiOwnerStaysAdmin => 'Tvorac uvijek ostaje admin';

  @override
  String get apiNeedsOneAdmin => 'Grupa treba barem jednog admina';

  @override
  String get apiEndBeforeStart => 'Datum završetka je prije datuma početka';

  @override
  String get apiPermanentNoEndDate =>
      'Grupa koja je uvijek otvorena nema datum završetka';

  @override
  String get apiCannotBanAdmin => 'Administrator se ne može blokirati';

  @override
  String get apiReportNotFound => 'Prijava nije pronađena';

  @override
  String get apiPhotoOwnerUnknown =>
      'Osoba koja je snimila ovu fotku više nije poznata';

  @override
  String get validationNameRequired => 'Unesi svoje ime';

  @override
  String validationMaxChars(int max) {
    return 'Najviše $max znakova';
  }

  @override
  String get validationEmailRequired => 'Unesi e-adresu';

  @override
  String get validationEmailInvalid => 'Ova e-adresa nije valjana';

  @override
  String get validationPasswordRequired => 'Odaberi lozinku';

  @override
  String validationMinChars(int min) {
    return 'Najmanje $min znakova';
  }

  @override
  String get validationPasswordTooLong => 'Lozinka je preduga';

  @override
  String get validationPasswordEmpty => 'Unesi lozinku';

  @override
  String get validationCodeRequired => 'Unesi kôd iz e-pošte';

  @override
  String get validationCodeDigits => 'Kôd ima 6 znamenki';

  @override
  String get onboarding1Title => 'Jedan film\nza cijelu ekipu.';

  @override
  String get onboarding1Body =>
      'Snimaj retro kamerom. Svi odmah vide tvoje fotke, a odmah su i u tvom albumu.';

  @override
  String get onboarding2Title => 'Gotovo je sa\nslanjem fotki.';

  @override
  String get onboarding2Body =>
      'Napravi grupu, podijeli kôd, gotovo. Nikad više „možeš mi poslati te fotke?”';

  @override
  String get onboarding3Title => 'Video sažetak\nnakon putovanja.';

  @override
  String get onboarding3Body =>
      'CamTrip radi video s glazbom od vaših najboljih zajedničkih trenutaka.';

  @override
  String get onboardingInvited => 'Pozvan si! Prijavi se da se pridružiš.';

  @override
  String get signInAppleFailed => 'Prijava putem Applea nije uspjela';

  @override
  String get signInGoogleFailed => 'Prijava putem Googlea nije uspjela';

  @override
  String get signInFailed => 'Prijava nije uspjela';

  @override
  String get next => 'Dalje';

  @override
  String get legalPrefix => 'Nastavkom prihvaćaš';

  @override
  String get legalTerms => 'uvjete';

  @override
  String get legalAnd => ' i';

  @override
  String get legalPrivacy => 'pravila privatnosti';

  @override
  String get legalSuffix => '.';

  @override
  String get continueWithApple => 'Nastavi s Appleom';

  @override
  String get continueWithGoogle => 'Nastavi s Googleom';

  @override
  String get createAccount => 'Izradi račun';

  @override
  String get signIn => 'Prijava';

  @override
  String get or => 'ili';

  @override
  String get registerSubtitle => 'Da prijatelji vide tko je snimio fotke.';

  @override
  String get loginSubtitle => 'Dobro došao natrag.';

  @override
  String get forgotPasswordTitle => 'Zaboravljena lozinka';

  @override
  String get forgotPasswordPushSubtitle =>
      'Još si negdje prijavljen? Tamo ćemo poslati 6-znamenkasti kôd kao push obavijest da postaviš novu lozinku.';

  @override
  String get newPassword => 'Nova lozinka';

  @override
  String get resetPushInfo =>
      'Ako si još negdje prijavljen, tamo ćeš dobiti push obavijest s kôdom. Ne možeš ući? Prijavi se putem Applea ili Googlea s istom e-adresom - račun će se povezati.';

  @override
  String get sendCode => 'Pošalji kôd';

  @override
  String get savePassword => 'Spremi lozinku';

  @override
  String get errorTryAgain => 'Nešto nije u redu. Pokušaj ponovno.';

  @override
  String get back => 'Natrag';

  @override
  String get name => 'Ime';

  @override
  String get email => 'E-adresa';

  @override
  String get codeFromPush => 'Kôd iz obavijesti';

  @override
  String get password => 'Lozinka';

  @override
  String get hidePassword => 'Sakrij lozinku';

  @override
  String get showPassword => 'Prikaži lozinku';

  @override
  String get forgotPasswordLink => 'Zaboravljena lozinka?';

  @override
  String get haveAccount => 'Već imaš račun?';

  @override
  String get newToCamTrip => 'Novi si na CamTripu?';

  @override
  String get rememberedIt => 'Sjetio si se?';

  @override
  String get noCodeReceived => 'Nisi dobio kôd?';

  @override
  String get resendCode => 'Pošalji ponovno';

  @override
  String onboardingDemoRoll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotografa, 1 film',
      few: '$count fotografa, 1 film',
      one: '$count fotograf, 1 film',
    );
    return '$_temp0';
  }

  @override
  String membersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count članova',
      few: '$count člana',
      one: '$count član',
    );
    return '$_temp0';
  }

  @override
  String photosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotki',
      few: '$count fotke',
      one: '$count fotka',
    );
    return '$_temp0';
  }

  @override
  String videosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count videa',
      few: '$count videa',
      one: '$count video',
    );
    return '$_temp0';
  }

  @override
  String get justNow => 'sad';

  @override
  String get badgeNew => 'Novo';

  @override
  String recapTitle(String groupName) {
    return 'Sažetak: $groupName';
  }

  @override
  String get styleFilm => 'Film';

  @override
  String get styleInstant => 'Instant';

  @override
  String get styleDisposable => 'Jednokratni';

  @override
  String get styleBw => 'C/B';

  @override
  String get styleGolden => 'Golden';

  @override
  String get styleChrome => 'Chrome';

  @override
  String get styleFilmDescription => 'Tople boje, zrno i narančasti datum';

  @override
  String get styleInstantDescription => 'Mekane boje i bijeli okvir';

  @override
  String get styleDisposableDescription =>
      'Oštra bljeskalica, vinjeta i curenje svjetla';

  @override
  String get styleBwDescription => 'Zrnato crno-bijelo s dubokim kontrastom';

  @override
  String get styleGoldenDescription => 'Uvijek zlatni sat, meki zlatni sjaj';

  @override
  String get styleChromeDescription => 'Hladno, zasićeno i oštro, kao dijafilm';

  @override
  String get shutterStopRecording => 'Zaustavi snimanje';

  @override
  String get shutterStartRecording => 'Pokreni snimanje videa';

  @override
  String get shutterTakePhoto => 'Snimi fotku';

  @override
  String get modePhoto => 'Fotka';

  @override
  String get modeVideo => 'Video';

  @override
  String get cameraNotFound => 'Kamera nije pronađena';

  @override
  String get cameraAccessNeeded =>
      'CamTrip treba pristup kameri. Uključi ga u Postavkama.';

  @override
  String get cameraStartFailed => 'Kamera se nije mogla pokrenuti';

  @override
  String get albumAccessNeeded =>
      'Daj CamTripu pristup fotkama kako bi ih spremao i u tvoj album';

  @override
  String get albumSaveFailed =>
      'Spremanje u album nije uspjelo. Fotka je ipak podijeljena.';

  @override
  String styleProFallback(String style) {
    return 'Ovaj stil dio je Pro. U ovoj grupi snimaš stilom $style.';
  }

  @override
  String get photoFailed => 'Snimanje fotke nije uspjelo. Pokušaj ponovno.';

  @override
  String get recordingFailed => 'Snimanje videa nije uspjelo';

  @override
  String get videoFailed => 'Izrada videa nije uspjela. Pokušaj ponovno.';

  @override
  String get shootInGroup => 'Snimaj u grupu';

  @override
  String get close => 'Zatvori';

  @override
  String get flash => 'Bljeskalica';

  @override
  String get flashOn => 'Uklj.';

  @override
  String get flashOff => 'Isklj.';

  @override
  String get flashAuto => 'Auto';

  @override
  String get chooseGroup => 'Odaberi grupu';

  @override
  String get switchCamera => 'Promijeni kameru';

  @override
  String get createOrJoinFirst => 'Najprije izradi grupu ili se pridruži nekoj';

  @override
  String get proViaGroup => 'Pro preko grupe';

  @override
  String proViaName(String name) {
    return 'Pro preko: $name';
  }

  @override
  String get proStylesFreeViaMember =>
      'Pro stilovi u ovoj grupi besplatni su za tebe zahvaljujući članu s Pro';

  @override
  String proStylesFreeViaName(String name) {
    return 'Pro stilovi u ovoj grupi: besplatno za tebe zahvaljujući: $name';
  }

  @override
  String get subscriptionsUnavailable =>
      'Pretplate trenutno nisu dostupne. Pokušaj ponovno kasnije.';

  @override
  String get paymentPending =>
      'Plaćanje se još obrađuje. Pro se uključuje čim bude gotovo.';

  @override
  String get purchaseFailed => 'Kupnja nije uspjela. Pokušaj ponovno kasnije.';

  @override
  String get restoreUnavailable =>
      'Vraćanje kupnji trenutno nije moguće. Pokušaj ponovno kasnije.';

  @override
  String get restoreFailed => 'Vraćanje nije uspjelo. Pokušaj ponovno kasnije.';

  @override
  String get welcomePro => 'Dobro došao u CamTrip Pro! 🎉';

  @override
  String get proRestored => 'Pro je vraćen';

  @override
  String get noPurchaseFound => 'Nije pronađena prethodna kupnja';

  @override
  String periodDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dana',
      few: '$count dana',
      one: '$count dan',
    );
    return '$_temp0';
  }

  @override
  String periodWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tjedana',
      few: '$count tjedna',
      one: '$count tjedan',
    );
    return '$_temp0';
  }

  @override
  String periodMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mjeseci',
      few: '$count mjeseca',
      one: '$count mjesec',
    );
    return '$_temp0';
  }

  @override
  String periodYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count godina',
      few: '$count godine',
      one: '$count godina',
    );
    return '$_temp0';
  }

  @override
  String get paywallHavePro => 'Imaš CamTrip Pro';

  @override
  String get paywallSubtitle => 'Sve za tvoje sljedeće putovanje.';

  @override
  String paywallFeatureStyles(String styles) {
    return 'Svi stilovi kamere ($styles)';
  }

  @override
  String get paywallFeatureUnlimited =>
      'Neograničeno članova i prostora, fotke ostaju zauvijek';

  @override
  String get paywallFeatureNoWatermark => 'Sažeci bez vodenog žiga';

  @override
  String get paywallFeatureOriginal => 'Preuzimanje u izvornoj kvaliteti';

  @override
  String get planYear => 'Godina';

  @override
  String get planMonth => 'Mjesec';

  @override
  String pricePerMonth(String price) {
    return '$price mjesečno';
  }

  @override
  String paywallSaveBadge(int percent) {
    return 'UŠTEDI $percent%';
  }

  @override
  String get planMonthCancelAnytime => 'otkaži bilo kad';

  @override
  String tryFree(String period) {
    return 'Isprobaj $period besplatno';
  }

  @override
  String get becomePro => 'Uzmi Pro';

  @override
  String get subscriptionsLoadFailed =>
      'Pretplate se nisu mogle učitati. Provjeri vezu.';

  @override
  String legalAnnual(String price) {
    return 'Godišnja pretplata CamTrip Pro: $price godišnje.';
  }

  @override
  String legalAnnualTrial(String period, String price) {
    return 'Godišnja pretplata CamTrip Pro: $period besplatno, zatim $price godišnje.';
  }

  @override
  String legalMonthly(String price) {
    return 'Mjesečna pretplata CamTrip Pro: $price mjesečno.';
  }

  @override
  String legalMonthlyTrial(String period, String price) {
    return 'Mjesečna pretplata CamTrip Pro: $period besplatno, zatim $price mjesečno.';
  }

  @override
  String get legalBillingApple =>
      'Plaćanje se naplaćuje s tvog Apple ID-a. Pretplata se automatski obnavlja osim ako je ne otkažeš najmanje 24 sata prije kraja razdoblja. Možeš je otkazati i upravljati njome u postavkama računa App Storea.';

  @override
  String get legalBillingGoogle =>
      'Plaćanje se naplaćuje s tvog Google računa. Pretplata se automatski obnavlja osim ako je ne otkažeš najmanje 24 sata prije kraja razdoblja. Možeš je otkazati i upravljati njome u postavkama računa Google Playa.';

  @override
  String get restorePurchases => 'Vrati kupnje';

  @override
  String get terms => 'Uvjeti';

  @override
  String get privacy => 'Privatnost';

  @override
  String get groupProTitle => 'Jedan Pro u grupi = Pro za sve u toj grupi';

  @override
  String get groupProBody =>
      'Ako jedna osoba ima Pro, cijela grupa dobiva sve stilove kamere, neograničeno članova, fotke koje ostaju, izvornu kvalitetu i sažetke bez vodenog žiga.';

  @override
  String get groupCreated => 'Grupa je izrađena ✓';

  @override
  String get inviteFriends => 'Pozovi prijatelje';

  @override
  String get codeCopied => 'Kôd je kopiran';

  @override
  String get shareLink => 'Podijeli poveznicu';

  @override
  String inviteSubject(String groupName) {
    return 'Pridruži se grupi $groupName na CamTripu';
  }

  @override
  String inviteMembersUnlimited(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count članova',
      few: '$count člana',
      one: '$count član',
    );
    return '$_temp0 · neograničeno (Pro)';
  }

  @override
  String inviteMembersLimit(int count, int limit) {
    return '$count od $limit članova · Pro: neograničeno';
  }

  @override
  String get toCamera => 'Na kameru';

  @override
  String get done => 'Gotovo';

  @override
  String get joinEnterCode => 'Unesi kôd od 6 znakova';

  @override
  String get joinGroupTitle => 'Pridruži se grupi';

  @override
  String get joinGroupSubtitle =>
      'Unesi kôd prijatelja ili skeniraj njihov QR kôd.';

  @override
  String get typeCode => 'Upiši kôd';

  @override
  String get scanQr => 'Skeniraj QR';

  @override
  String get join => 'Pridruži se';

  @override
  String get groupNameRequired => 'Daj grupi ime';

  @override
  String get newGroup => 'Nova grupa';

  @override
  String get groupType => 'Vrsta grupe';

  @override
  String get groupTypeVacation => 'Odmor';

  @override
  String get groupTypeVacationDescription =>
      'S datumom početka i završetka, zatim se arhivira';

  @override
  String get groupTypeEvent => 'Događaj';

  @override
  String get groupTypeEventDescription => 'Jedan dan ili večer, npr. zabava';

  @override
  String get groupTypePermanent => 'Uvijek otvorena';

  @override
  String get groupTypePermanentDescription => 'Za tvoju stalnu ekipu';

  @override
  String get date => 'Datum';

  @override
  String get departure => 'Polazak';

  @override
  String get returnDate => 'Povratak';

  @override
  String get defaultCameraStyle => 'Zadani stil kamere';

  @override
  String freeLimitPermanent(int max) {
    return 'Besplatno: do $max članova. Neograničeno uz Pro.';
  }

  @override
  String freeLimitDated(int max, int days) {
    return 'Besplatno: do $max članova, fotke se čuvaju do $days dana nakon datuma završetka. Neograničeno i zauvijek uz Pro.';
  }

  @override
  String get createGroup => 'Izradi grupu';

  @override
  String get group => 'Grupa';

  @override
  String groupCode(String code) {
    return 'kôd $code';
  }

  @override
  String get manage => 'Upravljanje';

  @override
  String get rename => 'Preimenuj';

  @override
  String get changeDates => 'Promijeni datume';

  @override
  String get finishTrip => 'Završi putovanje';

  @override
  String get finishTripSubtitle => 'Postavlja datum završetka na danas';

  @override
  String get reopenGroup => 'Ponovno otvori grupu';

  @override
  String get closeGroup => 'Zatvori grupu';

  @override
  String get reopenGroupSubtitle => 'Članovi opet mogu dodavati fotke';

  @override
  String get closeGroupSubtitle =>
      'Nitko više ne može dodavati fotke; sve se i dalje može pregledavati';

  @override
  String get members => 'Članovi';

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
    return 'Ukloniti: $name?';
  }

  @override
  String get removeMemberMessage => 'Njihove fotke ostaju u grupi.';

  @override
  String get remove => 'Izbriši';

  @override
  String get removeMember => 'Ukloni';

  @override
  String blockTitle(String name) {
    return 'Blokirati: $name?';
  }

  @override
  String blockMessage(String name) {
    return 'Više nećeš vidjeti fotke i videe od $name niti dobivati obavijesti o njima. To možeš poništiti u Postavkama.';
  }

  @override
  String get block => 'Blokiraj';

  @override
  String get makeMember => 'Postavi kao običnog člana';

  @override
  String get makeAdmin => 'Postavi kao admina';

  @override
  String get removeFromGroup => 'Ukloni iz grupe';

  @override
  String get unblock => 'Odblokiraj';

  @override
  String get inviteFriendsButton => 'Pozovi prijatelje';

  @override
  String get you => 'Ti';

  @override
  String get unarchive => 'Vrati iz arhive';

  @override
  String get archive => 'Arhiviraj';

  @override
  String get unarchiveSubtitle => 'Grupa je opet među tvojim albumima';

  @override
  String archiveSubtitle(String section) {
    return 'Samo za tebe: grupa se premješta u „$section” na dnu tvojih albuma';
  }

  @override
  String get archivedSection => 'Arhivirano';

  @override
  String get hiddenPhotos => 'Skrivene fotke';

  @override
  String get hiddenPhotosSubtitle => 'Fotke koje si sakrio za sebe';

  @override
  String get leaveGroup => 'Napusti grupu';

  @override
  String get leaveGroupSubtitle => 'Tvoje fotke ostaju u grupi za ostale';

  @override
  String get deleteGroup => 'Izbriši grupu';

  @override
  String get deleteGroupSubtitle => 'Sve se fotke brišu za sve';

  @override
  String groupArchived(String groupName) {
    return '„$groupName” je arhivirana';
  }

  @override
  String groupUnarchived(String groupName) {
    return '„$groupName” je opet među tvojim albumima';
  }

  @override
  String get undo => 'Poništi';

  @override
  String get groupNameTitle => 'Naziv grupe';

  @override
  String get finishTripTitle => 'Završiti putovanje?';

  @override
  String get finishTripMessage =>
      'Datum završetka postaje danas. I dalje možeš dodavati fotke; sažetak je spreman.';

  @override
  String get finishTripConfirm => 'Završi';

  @override
  String get tripFinished => 'Putovanje je završeno';

  @override
  String leaveGroupTitle(String groupName) {
    return 'Napustiti „$groupName”?';
  }

  @override
  String get leaveGroupMessage =>
      'Tvoje fotke ostaju u grupi za ostale. Kasnije se možeš ponovno pridružiti kôdom.';

  @override
  String get leave => 'Napusti';

  @override
  String groupDeleted(String groupName) {
    return '„$groupName” je izbrisana';
  }

  @override
  String get youAreAdmin => 'ti si admin';

  @override
  String get open => 'Otvori';

  @override
  String get archiveMenuSubtitle => 'Samo za tebe, ostali neće primijetiti';

  @override
  String get deleteGroupMenuSubtitle => 'Za sve, sa svim fotkama';

  @override
  String get deleteGroupTitle => 'Izbrisati grupu?';

  @override
  String deleteGroupMessage(int count, String groupName, int memberCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Svih $count fotki i videa',
      few: 'Sve $count fotke i videi',
      one: '$count fotka ili video',
    );
    String _temp1 = intl.Intl.pluralLogic(
      memberCount,
      locale: localeName,
      other: 'svih $memberCount članova',
      few: 'sva $memberCount člana',
      one: '$memberCount člana',
    );
    return '$_temp0 u „$groupName” nestat će za $_temp1. Ovo se ne može poništiti.';
  }

  @override
  String get deleteGroupOwnRoll => 'Tvoja galerija ostaje nepromijenjena.';

  @override
  String get deleteGroupTypeName => 'Upiši naziv grupe za potvrdu:';

  @override
  String get deleteForEveryone => 'Izbriši za sve';

  @override
  String get save => 'Spremi';

  @override
  String get yourAlbums => 'Tvoji albumi';

  @override
  String get uploadQueue => 'Red za prijenos';

  @override
  String get noConnection => 'Nema veze';

  @override
  String get albumsOfflineMessage =>
      'Albumi će se učitati čim opet budeš online. Kamera i dalje radi.';

  @override
  String get retry => 'Pokušaj ponovno';

  @override
  String get noAlbumsTitle => 'Još nema albuma';

  @override
  String get noAlbumsMessage =>
      'Izradi grupu za sljedeće putovanje ili se pridruži prijateljevoj grupi pomoću njegova kôda.';

  @override
  String get haveCode => 'Imam kôd';

  @override
  String get joinWithCode => 'Pridruži se kôdom ili QR kôdom';

  @override
  String get camera => 'Kamera';

  @override
  String get restore => 'Vrati';

  @override
  String get more => 'Više';

  @override
  String get newAlbum => 'Novo';

  @override
  String get closedTag => 'zatvorena';

  @override
  String get activeTag => 'aktivna';

  @override
  String get uploadFailed => 'Prijenos nije uspio';

  @override
  String get queueNoSignal => 'Nema signala.';

  @override
  String get queueNoSignalMessage =>
      'Tvoje fotke već su u albumu i bit će podijeljene čim opet budeš online.';

  @override
  String get queueWaitingForWifi => 'Čeka se Wi-Fi.';

  @override
  String queueWifiOnlyOn(String setting) {
    return 'Uključeno ti je „$setting”.';
  }

  @override
  String get queueVideosWifiOnly => 'Videi idu samo preko Wi-Fija.';

  @override
  String get queueAllShared => 'Sve je podijeljeno ✓';

  @override
  String queuePending(String items) {
    return 'Još za podijeliti: $items';
  }

  @override
  String queuePendingBoth(String photos, String videos) {
    return 'Još za podijeliti: $photos i $videos';
  }

  @override
  String get retryUpload => 'Pokušaj ponovno';

  @override
  String get removeFromQueue => 'Ukloni iz reda';

  @override
  String get queueStatusWifi => 'Wi-Fi';

  @override
  String get queueStatusWaiting => 'čeka';

  @override
  String get videosWifiOnlyTitle => 'Videi samo preko Wi-Fija';

  @override
  String get videosWifiOnlySubtitle => 'Štedi mobilne podatke';

  @override
  String get retryNow => 'Pokušaj sada';

  @override
  String get yourName => 'Tvoje ime';

  @override
  String get settings => 'Postavke';

  @override
  String get tapToChangeName => 'Dodirni za promjenu imena';

  @override
  String get getCamTripPro => 'Uzmi CamTrip Pro';

  @override
  String get photos => 'Fotke';

  @override
  String get saveOwnPhotos => 'Spremaj moje fotke u album za svaku grupu';

  @override
  String get autoSaveOthers => 'Automatski spremaj fotke drugih';

  @override
  String get wifiOnlyTitle => 'Prijenos samo preko Wi-Fija';

  @override
  String get dateStamp => 'Datum na fotki';

  @override
  String get notifications => 'Obavijesti';

  @override
  String get notifyNewPhotos => 'Nove fotke (skupno)';

  @override
  String get notifyRecapReady => 'Sažetak je spreman';

  @override
  String get camTripTeam => 'CamTrip tim';

  @override
  String get adminEntrySubtitle =>
      'Korisnici, dodjela Pro, prijave i statistika';

  @override
  String get account => 'Račun';

  @override
  String get manageSubscription => 'Upravljaj pretplatom';

  @override
  String get blockedPeople => 'Blokirane osobe';

  @override
  String get nobody => 'Nitko';

  @override
  String peopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count osoba',
      few: '$count osobe',
      one: '$count osoba',
    );
    return '$_temp0';
  }

  @override
  String get privacyPolicy => 'Pravila privatnosti';

  @override
  String get contact => 'Kontakt';

  @override
  String get signOut => 'Odjava';

  @override
  String get deleteAccount => 'Izbriši račun';

  @override
  String get deleteAccountSubtitle => 'Briše tvoj račun i sve tvoje fotke';

  @override
  String get deleteAccountTitle => 'Izbrisati račun?';

  @override
  String get deleteAccountMessage =>
      'Tvoj račun i sve tvoje fotke i videi bit će izbrisani, i iz grupa. Otkaži aktivnu pretplatu u App Storeu ili na Google Playu.';

  @override
  String get blockedTitle => 'Blokirani';

  @override
  String get blockedSubtitle => 'Ne vidiš fotke ovih osoba.';

  @override
  String get blockedNone => 'Nikoga nisi blokirao.';

  @override
  String get unblockShort => 'Odblokiraj';

  @override
  String get groupGone => 'Ova grupa više ne postoji ili više nisi član.';

  @override
  String photosSavedToAlbum(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotki spremljeno u „$album”',
      few: '$count fotke spremljene u „$album”',
      one: '$count fotka spremljena u „$album”',
    );
    return '$_temp0';
  }

  @override
  String photosDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotki izbrisano',
      few: '$count fotke izbrisane',
      one: '$count fotka izbrisana',
    );
    return '$_temp0';
  }

  @override
  String photosDeletedSkipped(int count, int skipped) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotki izbrisano',
      few: '$count fotke izbrisane',
      one: '$count fotka izbrisana',
    );
    return '$_temp0, preskočeno: $skipped';
  }

  @override
  String photosHiddenForYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotki skriveno za tebe',
      few: '$count fotke skrivene za tebe',
      one: '$count fotka skrivena za tebe',
    );
    return '$_temp0';
  }

  @override
  String get addedToFavorites => 'Dodano u favorite';

  @override
  String get removedFromFavorites => 'Uklonjeno iz favorita';

  @override
  String get photoAccessSettings => 'Daj CamTripu pristup fotkama u Postavkama';

  @override
  String photosBeingAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Dodaje se $count fotki',
      few: 'Dodaju se $count fotke',
      one: 'Dodaje se $count fotka',
    );
    return '$_temp0';
  }

  @override
  String photosUnreadable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotki se nije moglo pročitati',
      few: '$count fotke se nisu mogle pročitati',
      one: '$count fotka se nije mogla pročitati',
    );
    return '$_temp0';
  }

  @override
  String get groupNotLoaded => 'Grupa nije učitana';

  @override
  String get noFavoritesTitle => 'Još nema favorita';

  @override
  String get noPhotosTitle => 'Još nema fotki';

  @override
  String get noFavoritesMessage =>
      'Dodirni zvjezdicu na fotki da je staviš ovdje.';

  @override
  String get noPhotosMessage => 'Snimi prvu fotku. Svi u grupi odmah je vide.';

  @override
  String get openCamera => 'Otvori kameru';

  @override
  String savingProgress(int done, int total) {
    return 'Spremanje... $done/$total';
  }

  @override
  String get sharePreparing => 'Priprema...';

  @override
  String sharingProgress(int done, int total) {
    return 'Priprema... $done/$total';
  }

  @override
  String get choosePhotos => 'Odaberi fotke';

  @override
  String selectedCount(int count) {
    return 'Odabrano: $count';
  }

  @override
  String get selectNone => 'Poništi odabir';

  @override
  String get selectAll => 'Odaberi sve';

  @override
  String photosWaitingToShare(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotki čeka dijeljenje',
      few: '$count fotke čekaju dijeljenje',
      one: '$count fotka čeka dijeljenje',
    );
    return '$_temp0';
  }

  @override
  String get recapReadyTitle => 'Tvoj sažetak je spreman';

  @override
  String get recapReadySubtitle => 'Video s glazbom s tvog putovanja';

  @override
  String get watch => 'Pogledaj';

  @override
  String get makeRecapNow => 'Napravi video sažetak sada';

  @override
  String freeGroupDeleteNotice(String date) {
    return 'Besplatna grupa: fotke se čuvaju do $date. Spremi ih ili uzmi Pro.';
  }

  @override
  String get filterAll => 'Sve';

  @override
  String get filterFavorites => 'Favoriti';

  @override
  String get filterPerPerson => 'Po osobi';

  @override
  String get filterPerson => 'Osoba';

  @override
  String get select => 'Odaberi';

  @override
  String get hiddenFilter => 'Skriveno';

  @override
  String get photosBy => 'Fotke od...';

  @override
  String get uploadedTag => 'preneseno';

  @override
  String get saveAll => 'Spremi sve';

  @override
  String get favorite => 'Favorit';

  @override
  String get unfavorite => 'Ukloni iz favorita';

  @override
  String get hide => 'Sakrij';

  @override
  String get delete => 'Izbriši';

  @override
  String deletePhotosTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Izbrisati $count fotki?',
      few: 'Izbrisati $count fotke?',
      one: 'Izbrisati fotku?',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Nestaju za sve u grupi. Ovo se ne može poništiti.',
      one: 'Nestaje za sve u grupi. Ovo se ne može poništiti.',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosNotAllowed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count fotki pripada nekom drugom. Ostaju; samo ih admin može izbrisati.',
      few:
          '$count fotke pripadaju nekom drugom. Ostaju; samo ih admin može izbrisati.',
      one:
          '$count fotka pripada nekom drugom. Ostaje; samo je admin može izbrisati.',
    );
    return '$_temp0';
  }

  @override
  String photosBackInGroup(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotki je opet u grupi',
      few: '$count fotke su opet u grupi',
      one: '$count fotka je opet u grupi',
    );
    return '$_temp0';
  }

  @override
  String get showAll => 'Prikaži sve';

  @override
  String get hiddenPhotosExplainer =>
      'Samo ti više ne vidiš ove fotke. Ostali u grupi i dalje ih vide.';

  @override
  String get nothingHidden => 'Ništa nije skriveno';

  @override
  String get nothingHiddenMessage => 'Fotke koje sakriješ pojavit će se ovdje.';

  @override
  String showAgainCount(int count) {
    return 'Ponovno prikaži ($count)';
  }

  @override
  String get someone => 'Netko';

  @override
  String get savedToAlbum => 'Spremljeno u foto album';

  @override
  String get share => 'Podijeli';

  @override
  String get shareFailed => 'Dijeljenje nije uspjelo';

  @override
  String get reportTitle => 'Zašto prijavljuješ ovu fotku?';

  @override
  String get reportSubtitle =>
      'Svaku prijavu pregledamo unutar 24 sata. Fotka se za tebe odmah skriva.';

  @override
  String get reportThanks => 'Hvala, pogledat ćemo';

  @override
  String blockMessageAllGroups(String name) {
    return 'Više nećeš vidjeti fotke i videe od $name ni u jednoj grupi niti dobivati obavijesti o njima. To možeš poništiti u Postavkama.';
  }

  @override
  String userBlocked(String name) {
    return '$name je blokiran';
  }

  @override
  String get videoHiddenForYou => 'Video je skriven za tebe';

  @override
  String get photoHiddenForYou => 'Fotka je skrivena za tebe';

  @override
  String get setAsCover => 'Postavi kao naslovnu';

  @override
  String get coverUpdated => 'Naslovna fotka je ažurirana';

  @override
  String get hideForMe => 'Sakrij za mene';

  @override
  String get hideForMeSubtitle => 'Ostali u grupi i dalje je vide';

  @override
  String get reportPhoto => 'Prijavi fotku';

  @override
  String blockName(String name) {
    return 'Blokiraj: $name';
  }

  @override
  String get forEveryoneInGroup => 'Za sve u grupi';

  @override
  String get videoDeleted => 'Video je izbrisan';

  @override
  String get photoDeleted => 'Fotka je izbrisana';

  @override
  String get photoAccessToSave =>
      'Daj CamTripu pristup fotkama u Postavkama da ih možeš spremiti';

  @override
  String get phoneFull => 'Mobitel ti je pun';

  @override
  String get albumSaveFailedShort => 'Spremanje u album nije uspjelo';

  @override
  String get recapTemplateGoldenHour => 'Golden Hour';

  @override
  String get recapTemplateFast => 'Brzo';

  @override
  String get recapTemplateFilmRoll => 'Filmska rola';

  @override
  String get recapTemplatePolaroid => 'Polaroid';

  @override
  String get trackSummerEvening => 'Ljetna večer';

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
      other: '$count prijatelja',
      few: '$count prijatelja',
      one: '$count prijatelj',
    );
    return '$_temp0';
  }

  @override
  String get madeWithCamTrip => 'Napravljeno s CamTripom';

  @override
  String get tagline => 'Jedan film za cijelu ekipu';

  @override
  String get videoUnsupportedDevice =>
      'Izrada videa nije uspjela na ovom uređaju';

  @override
  String get groupLoadFailed => 'Ova se grupa nije mogla učitati.';

  @override
  String recapNeedsPhotos(int count) {
    return 'Za sažetak trebaš barem $count fotki.';
  }

  @override
  String get recapFailed => 'Izrada sažetka nije uspjela. Pokušaj ponovno.';

  @override
  String get recapSaved => 'Sažetak je spremljen u foto album';

  @override
  String get recap => 'Sažetak';

  @override
  String get recapRendering => 'Izrada sažetka...';

  @override
  String get videoRendering => 'Izrada videa...';

  @override
  String get template => 'Predložak';

  @override
  String get musicLicense =>
      'CamTripova vlastita glazba · bez autorskih naknada';

  @override
  String get change => 'Promijeni';

  @override
  String get noWatermark => 'Bez vodenog žiga ✓';

  @override
  String get removeWatermarkPro => 'Ukloni vodeni žig uz Pro';

  @override
  String get proSourceSubscription => 'Pretplata';

  @override
  String get proSourceGift => 'Poklon';

  @override
  String get proSourceAdmin => 'Admin';

  @override
  String get proSourceGroup => 'Preko grupe';

  @override
  String get noPro => 'Bez Pro';

  @override
  String proStatusNoEnd(String source) {
    return 'Pro ($source), bez datuma isteka';
  }

  @override
  String proStatusUntil(String source, String date) {
    return 'Pro ($source), do $date';
  }

  @override
  String get lifetime => 'Doživotno';

  @override
  String get pickDate => 'Odaberi datum';

  @override
  String get noAccess => 'Nema pristupa';

  @override
  String get adminOnlyTeam => 'Upravljanje je samo za CamTrip tim.';

  @override
  String get adminOverview => 'Pregled';

  @override
  String get adminUsers => 'Korisnici';

  @override
  String get adminReports => 'Prijave';

  @override
  String adminsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count admina',
      few: '$count admina',
      one: '$count admin',
    );
    return '$_temp0';
  }

  @override
  String get adminNewThisWeek => 'Novi ovaj tjedan';

  @override
  String get adminGroups => 'Grupe';

  @override
  String get adminProSubscription => 'Pro preko pretplate';

  @override
  String get adminProGift => 'Pro kao poklon';

  @override
  String adminWithoutSubscription(int count) {
    return '$count bez pretplate';
  }

  @override
  String get adminOpenReports => 'Otvorene prijave';

  @override
  String get adminSearchHint => 'Traži po imenu ili e-adresi';

  @override
  String get nobodyFound => 'Nitko nije pronađen';

  @override
  String get loadMore => 'Učitaj još';

  @override
  String get noEmail => 'Nema e-adrese';

  @override
  String adminDeletePhotoMessage(String groupName) {
    return 'Fotka nestaje za sve u „$groupName”. Sve prijave za ovu fotku se rješavaju.';
  }

  @override
  String get adminBanMessage =>
      'Ovaj se račun više ne može prijaviti ni koristiti aplikaciju. To možeš kasnije poništiti.';

  @override
  String get adminDismissTitle => 'Odbaciti prijavu?';

  @override
  String get adminDismissMessage =>
      'Fotka ostaje. Prijava se označava kao riješena.';

  @override
  String get adminDismiss => 'Odbaci';

  @override
  String get adminAccountBlocked => 'Račun je blokiran';

  @override
  String get adminReportDismissed => 'Prijava je odbačena';

  @override
  String get adminNoReports => 'Nema otvorenih prijava';

  @override
  String get adminNoReportsMessage => 'Prijavljene fotke pojavljuju se ovdje.';

  @override
  String get deletedTag => 'Izbrisano';

  @override
  String adminReportedBy(String name) {
    return 'Prijavio: $name';
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
      other: '$count prijava',
      few: '$count prijave',
      one: '$count prijava',
    );
    return '$_temp0';
  }

  @override
  String get adminDeletePhoto => 'Izbriši fotku';

  @override
  String get adminBlockCreator => 'Blokiraj autora';

  @override
  String get loadFailed => 'Učitavanje nije uspjelo';

  @override
  String get adminLifetimeProGiven => 'Doživotni Pro dodijeljen';

  @override
  String get adminProGiven => 'Pro dodijeljen';

  @override
  String adminGiveProUntil(String date) {
    return 'Dodijeli Pro do $date';
  }

  @override
  String get adminGiveProLifetime => 'Dodijeli doživotni Pro';

  @override
  String adminGiveProFor(String period) {
    return 'Dodijeli Pro na $period';
  }

  @override
  String get adminReasonHint => 'Razlog, npr. prijatelj, tester, influencer';

  @override
  String get adminGivePro => 'Dodijeli Pro';

  @override
  String get adminRevokeTitle => 'Opozvati poklon?';

  @override
  String get adminRevokeMessage =>
      'Poklonjeni Pro odmah prestaje. Vlastita pretplata nastavlja se.';

  @override
  String get adminRevoke => 'Opozovi';

  @override
  String get adminGiftRevoked => 'Poklon je opozvan';

  @override
  String get adminUnbanTitle => 'Ukloniti blokadu?';

  @override
  String adminUnbanMessage(String name) {
    return '$name se opet može prijaviti.';
  }

  @override
  String get adminUnbanned => 'Blokada je uklonjena';

  @override
  String get adminBanUserMessage =>
      'Ovaj se račun više ne može prijaviti ni koristiti aplikaciju. Fotke ostaju.';

  @override
  String get adminUser => 'Korisnik';

  @override
  String get adminNotVerified => 'nije potvrđeno';

  @override
  String get adminRole => 'Uloga';

  @override
  String get adminCreated => 'Izrađeno';

  @override
  String get unknown => 'Nepoznato';

  @override
  String get adminSignInWith => 'Prijavljuje se putem';

  @override
  String get adminEmailMethod => 'E-pošta';

  @override
  String get adminPhotosAndVideos => 'Fotke i videi';

  @override
  String get adminStatus => 'Status';

  @override
  String get adminActive => 'Aktivno';

  @override
  String adminActiveUntil(String date) {
    return 'Aktivno do $date';
  }

  @override
  String adminGiftFrom(String name) {
    return 'Poklon od: $name';
  }

  @override
  String adminExpiredOn(String date) {
    return 'Isteklo $date';
  }

  @override
  String get adminExpired => 'Isteklo';

  @override
  String adminUntil(String date) {
    return 'Do $date';
  }

  @override
  String get adminGiveProTitle => 'Dodijeli Pro';

  @override
  String get adminGiveProNote =>
      'Vrijedi i za grupe ove osobe: jedan Pro u grupi = Pro za sve u toj grupi.';

  @override
  String get adminRevokeGift => 'Opozovi poklon';

  @override
  String get adminModeration => 'Moderiranje';

  @override
  String get adminCannotBanSelf => 'Ne možeš blokirati sebe.';

  @override
  String get adminCannotBanAdmin => 'Admin se ne može blokirati.';

  @override
  String get adminUnban => 'Ukloni blokadu';

  @override
  String get adminBanAccount => 'Blokiraj račun';

  @override
  String get googleSignInUnavailable =>
      'Prijava putem Googlea još nije dostupna';

  @override
  String get cameraPickerTitle => 'Odaberi kameru';

  @override
  String get cameraPickerSubtitle =>
      'Svaka kamera daje tvojim fotkama poseban izgled';

  @override
  String get cameraPickerChange => 'Promijeni kameru';

  @override
  String get cameraPickerUnlock => 'Otključaj uz Pro';

  @override
  String get cameraPickerSelected => 'Odabrano';

  @override
  String get cameraPickerStyleSummer => 'Ljeto';

  @override
  String get cameraPickerStyleSummerDescription =>
      'Tople, izblijedjele boje kao na fotki iz 90-ih';

  @override
  String get cameraPickerStyleNight => 'Noć 800';

  @override
  String get cameraPickerStyleNightDescription =>
      'Filmska vrpca: tirkizne sjene, toplo svjetlo, puno zrna';

  @override
  String get cameraPickerStyleSepia => 'Sepija';

  @override
  String get cameraPickerStyleSepiaDescription =>
      'Stara smeđa fotka iz kutije za cipele';

  @override
  String get cameraPickerStyleLomo => 'Lomo';

  @override
  String get cameraPickerStyleLomoDescription =>
      'Jarke boje, tamni kutovi i luda nijansa boje';

  @override
  String get cameraPickerStyleMint => 'Menta';

  @override
  String get cameraPickerStyleMintDescription =>
      'Mekano i svježe sa zelenom nijansom';

  @override
  String get cameraPickerStylePastel => 'Ružičasta';

  @override
  String get cameraPickerStylePastelDescription =>
      'Pastelne boje s ružičastim sjajem i bijelim okvirom';

  @override
  String get cameraPickerStyleSuper8 => 'Super 8';

  @override
  String get cameraPickerStyleSuper8Description =>
      'Zrnato i mekano, kao stari kućni film';

  @override
  String get paywallBenefitGroup => 'Jedan Pro = Pro za cijelu grupu';

  @override
  String get paywallBenefitUnlimited =>
      'Neograničeno članova, fotke ostaju zauvijek';

  @override
  String get paywallBenefitQuality => 'Bez vodenog žiga, izvorna kvaliteta';

  @override
  String paywallFreeTrial(String period) {
    return '$period besplatno';
  }

  @override
  String paywallPriceYear(String price) {
    return '$price godišnje.';
  }

  @override
  String paywallPriceYearTrial(String period, String price) {
    return '$period besplatno, zatim $price godišnje.';
  }

  @override
  String paywallPriceMonth(String price) {
    return '$price mjesečno.';
  }

  @override
  String paywallPriceMonthTrial(String period, String price) {
    return '$period besplatno, zatim $price mjesečno.';
  }

  @override
  String paywallAutoRenew(String store) {
    return 'Automatski se obnavlja. Otkaži najmanje 24 sata prije obnove u $store.';
  }

  @override
  String get paywallDetailsTitle => 'Sve u Pro';

  @override
  String get paywallBenefitStyles => 'Svi stilovi kamere';

  @override
  String get allPhotosTitle => 'Sve fotke';

  @override
  String get homeTabAlbums => 'Albumi';

  @override
  String get allPhotosEmptyTitle => 'Još nema fotki';

  @override
  String get allPhotosEmptyMessage => 'Otvori kameru i snimi svoju prvu fotku.';

  @override
  String get allPhotosLoadFailed => 'Tvoje fotke nisu se mogle učitati';

  @override
  String get cameraSettingsTitle => 'Postavke kamere';

  @override
  String get cameraSettingsMore => 'Više postavki';

  @override
  String get cameraSettingsGrid => 'Mreža';

  @override
  String get cameraSettingsHaptics => 'Vibracija pri snimanju';

  @override
  String get cameraSettingsDateStamp => 'Datum dolje desno';

  @override
  String get cameraSettingsSound => 'Zvuk okidača';

  @override
  String get cameraSettingsSoundHint => 'Tiho kad je mobitel na nečujnom';

  @override
  String get cameraSettingsTimer => 'Samookidač';

  @override
  String get cameraSettingsTimerOff => 'Isklj.';

  @override
  String cameraSettingsTimerSeconds(int seconds) {
    return '$seconds s';
  }

  @override
  String get cameraSettingsTimerCancelHint => 'Dodirni okidač za otkazivanje';

  @override
  String get cameraSettingsMirror => 'Zrcali selfije';

  @override
  String get cameraSettingsSaveToRoll => 'Spremaj u galeriju';

  @override
  String get cameraSettingsQuality => 'Kvaliteta';

  @override
  String get cameraSettingsQualityStandard => 'Standardna';

  @override
  String get cameraSettingsQualityHigh => 'Visoka';

  @override
  String get cameraLowLightHint => 'Slabo svjetlo - uključi bljeskalicu';

  @override
  String get cameraFlashUnavailable => 'Ova kamera nema bljeskalicu';

  @override
  String get cameraFlashScreen => 'Bljeskalica zaslona';

  @override
  String get cameraFlashCycleHint => 'Dodirni za izmjenu: isklj., uklj. i auto';

  @override
  String get cameraFlip => 'Prebaci između prednje i stražnje kamere';

  @override
  String get cameraFlipHint => 'Dvaput dodirni tražilo za okretanje kamere';

  @override
  String cameraPickerPaywallStyles(int count, String styles) {
    return 'Sve kamere ($count), uključujući $styles';
  }

  @override
  String get styleFlash => 'Bljesak 400';

  @override
  String get styleFlashDescription =>
      'Izravna bljeskalica na toplom filmu: jantarni sjaj, zrno, bogate crvene';

  @override
  String cameraTimerButton(String state) {
    return 'Samookidač: $state';
  }

  @override
  String get cameraTimerCycleHint => 'Dodirni za izmjenu: isklj., 3 s i 10 s';

  @override
  String get cameraLastShotOpen => 'Zadnja fotka, otvara album';

  @override
  String get cameraLastShotEmpty => 'Još nema fotki, otvara album';

  @override
  String get deleteOnlyOwnOrAdmin => 'Ovo može izbrisati samo autor ili admin';

  @override
  String get videoPlay => 'Reproduciraj';

  @override
  String get videoPause => 'Pauza';

  @override
  String get language => 'Jezik';

  @override
  String get languageSystem => 'Jezik sustava';

  @override
  String languageSystemCurrent(String language) {
    return 'Sustav ($language)';
  }

  @override
  String get languageSearchHint => 'Traži jezik';

  @override
  String get languageNoResults => 'Jezik nije pronađen';

  @override
  String get personalRollTitle => 'Moj film';

  @override
  String get personalRollSubtitle => 'Samo za tebe';

  @override
  String get personalRollPickerSubtitle => 'Pojedinačne fotke, samo za tebe';

  @override
  String get personalRollMove => 'U album';

  @override
  String get personalRollMoveTitle => 'Premjesti u album';

  @override
  String get personalRollMoveNoAlbums =>
      'Najprije izradi album ili se pridruži nekom kodom.';

  @override
  String personalRollMoved(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotki premješteno u $album',
      few: '$count fotke premještene u $album',
      one: '1 fotka premještena u $album',
    );
    return '$_temp0';
  }

  @override
  String get personalRollPrivateNote =>
      'Ove fotke vidiš samo ti. Premjesti ih u album da ih podijeliš.';

  @override
  String get paywallTripPassSub => 'Samo ovo putovanje, za cijelu grupu';

  @override
  String get paywallOneTime => 'jednokratno';

  @override
  String get paywallBestValue => 'Najisplativije';

  @override
  String paywallRollFullTitle(int used, int limit) {
    return 'Tvoj film je pun - $used/$limit fotografija';
  }

  @override
  String get paywallRollFullSub => 'Snimaj dalje uz Trip Pass ili Pro.';

  @override
  String get paywallCameraTitle => 'Ovaj fotoaparat dio je Pro';

  @override
  String paywallCameraSub(int count) {
    return 'Otključaj svih $count fotoaparata.';
  }

  @override
  String get paywallWatermarkTitle => 'Recap bez vodenog žiga';

  @override
  String get paywallWatermarkSub => 'Podijeli recap bez CamTrip logotipa.';

  @override
  String get paywallDeletionTitle => 'Sačuvaj putovanje';

  @override
  String paywallDeletionSub(String date) {
    return 'Besplatna putovanja brišu se $date. Uz Trip Pass ili Pro ostaje zauvijek.';
  }

  @override
  String paywallTripPassTerms(String price) {
    return 'Jednokratna kupnja za $price za ovo putovanje. Nije pretplata.';
  }

  @override
  String get buyTripPass => 'Kupi Trip Pass';

  @override
  String get tripPassActive => 'Trip Pass aktivan: putovanje je Pro za sve';

  @override
  String get tripPassActivating =>
      'Plaćanje primljeno. Trip Pass bit će aktivan za tren.';

  @override
  String proViaTripPass(String name) {
    return 'Trip Pass od $name';
  }

  @override
  String rollCounterSemantics(int used, int limit) {
    return '$used od $limit snimaka na tvom filmu';
  }

  @override
  String rollHeldTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Fotografija koje ne stanu na film: $count',
      one: '1 fotografija više ne stane na film',
    );
    return '$_temp0';
  }

  @override
  String get rollHeldBody => 'Sačuvaj ih uz Pro ili Trip Pass';

  @override
  String deletionBannerTitle(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Sačuvaj putovanje - još dana: $days',
      one: 'Sačuvaj putovanje - još 1 dan',
    );
    return '$_temp0';
  }

  @override
  String get deletionBannerBody =>
      'Besplatna putovanja brišu se 30 dana nakon kraja. Uz Trip Pass ili Pro ostaje zauvijek.';

  @override
  String apiRollFull(int limit) {
    return 'Tvoj film je pun ($limit snimaka). Uzmi Trip Pass ili Pro za nastavak.';
  }

  @override
  String get apiTripPassFailed =>
      'Trip Pass nije moguće aktivirati. Piši na support@camtrip.app.';

  @override
  String get apiTripPassExists => 'Ovo putovanje već ima Trip Pass.';

  @override
  String get tripPassUnavailable =>
      'Trip Pass trenutačno nije dostupan. Pokušaj kasnije.';

  @override
  String get tripMapTitle => 'Karta putovanja';

  @override
  String get tripMapOpen => 'Karta i statistika';

  @override
  String get tripMapLoadFailed => 'Karta se nije mogla učitati';

  @override
  String get tripMapStatDays => 'Dani';

  @override
  String get tripMapStatPhotos => 'Fotografije';

  @override
  String get tripMapStatVideos => 'Videozapisi';

  @override
  String get tripMapStatMembers => 'Članovi';

  @override
  String get tripMapStatDistance => 'prijeđenih km';

  @override
  String get tripMapStatCountries => 'Zemlje';

  @override
  String get tripMapStatPlaces => 'Mjesta';

  @override
  String tripMapBusiestDay(String day, int count) {
    return 'Najviše fotografija: $day ($count)';
  }

  @override
  String tripMapTopPhotographer(String name, int count) {
    return 'Najbolji fotograf: $name ($count)';
  }

  @override
  String get tripMapOffTitle => 'Karta putovanja je isključena';

  @override
  String get tripMapOffMessage =>
      'Administrator može uključiti kartu u postavkama grupe. Statistiku vidiš uvijek.';

  @override
  String get tripMapOffMessageAdmin =>
      'Uključi kartu da vidite gdje su nastale vaše fotografije. Svatko sam odlučuje hoće li sudjelovati.';

  @override
  String get tripMapEnable => 'Uključi kartu';

  @override
  String get tripMapEmptyTitle => 'Na karti još nema mjesta';

  @override
  String get tripMapEmptyMessage =>
      'Nove fotografije članova koji dijele lokaciju pojavljuju se ovdje, zaokružene na oko 100 m.';

  @override
  String get tripMapConsentTitle => 'Karta putovanja';

  @override
  String get tripMapConsentQuestion =>
      'Dijeliti gdje su nastale tvoje fotografije na karti ove grupe?';

  @override
  String get tripMapConsentDetail =>
      'Vide to samo članovi grupe, zaokruženo na oko 100 m. Lokacija se nikad ne sprema u samu fotografiju i to možeš isključiti bilo kada u postavkama grupe.';

  @override
  String get tripMapConsentYes => 'Da, dijeli';

  @override
  String get tripMapConsentNo => 'Ne';

  @override
  String get tripMapLocationDenied =>
      'Nema pristupa tvojoj lokaciji. Možeš ga dopustiti u postavkama telefona.';

  @override
  String get tripMapSettingSubtitle =>
      'Prikaži na karti gdje su nastale fotografije. Članovi sami odlučuju hoće li dijeliti.';

  @override
  String get tripMapDisableTitle => 'Isključiti kartu?';

  @override
  String get tripMapDisableMessage =>
      'Sve lokacije u ovoj grupi bit će izbrisane. Ako kasnije ponovno uključiš kartu, ponovno ćemo pitati sve.';

  @override
  String get tripMapDisable => 'Isključi';

  @override
  String get tripMapMySharing => 'Dijeli moju lokaciju';

  @override
  String get tripMapMySharingOn =>
      'Tvoje nove fotografije pojavljuju se na karti (zaokruženo na oko 100 m).';

  @override
  String get tripMapMySharingOff =>
      'Isključeno. Tvoje se fotografije ne pojavljuju na karti.';

  @override
  String get tripMapStopSharingTitle => 'Prestati dijeliti lokaciju?';

  @override
  String get tripMapStopSharingMessage =>
      'Lokacije svih tvojih fotografija u ovoj grupi bit će izbrisane.';

  @override
  String get tripMapStopSharing => 'Prestani dijeliti';
}
