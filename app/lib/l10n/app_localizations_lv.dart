// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Latvian (`lv`).
class AppLocalizationsLv extends AppLocalizations {
  AppLocalizationsLv([String locale = 'lv']) : super(locale);

  @override
  String get cancel => 'Atcelt';

  @override
  String get yes => 'Jā';

  @override
  String inviteMessageIntro(String groupName) {
    return 'Pievienosies “$groupName” lietotnē CamTrip? Tad uzreiz redzēsim viens otra bildes.';
  }

  @override
  String inviteMessageCode(String code) {
    return 'Vai ievadi kodu: $code';
  }

  @override
  String get memberFallbackName => 'Draugs';

  @override
  String get reportReasonInappropriate => 'Nepiemērots vai aizskarošs';

  @override
  String get reportReasonSpam => 'Mēstule';

  @override
  String get reportReasonOther => 'Kas cits';

  @override
  String dateRangeSameMonth(
    String startDay,
    String endDay,
    String month,
    String monthNum,
    String endDate,
  ) {
    return '$startDay.-$endDate';
  }

  @override
  String get errorOffline => 'Nav savienojuma. Pamēģini vēlreiz pēc brīža.';

  @override
  String errorSomethingWrongStatus(int status) {
    return 'Kaut kas nogāja greizi ($status)';
  }

  @override
  String get errorSomethingWrong => 'Kaut kas nogāja greizi';

  @override
  String get apiInvalidCredentials => 'Nepareiza e-pasta adrese vai parole';

  @override
  String get apiInvalidCode =>
      'Kods ir nepareizs vai beidzies. Pieprasi jaunu kodu.';

  @override
  String get apiEmailTaken =>
      'Konts ar šo e-pasta adresi jau pastāv. Pieslēdzies vai izvēlies “Aizmirsi paroli?”.';

  @override
  String apiEmailTakenProvider(String provider) {
    return 'Konts ar šo e-pasta adresi jau pastāv. Pieslēdzies ar $provider.';
  }

  @override
  String apiWeakPassword(int min) {
    return 'Izvēlies paroli ar vismaz $min rakstzīmēm';
  }

  @override
  String apiNameTooLong(int max) {
    return 'Vārdā var būt ne vairāk kā $max rakstzīmes';
  }

  @override
  String get apiRateLimited =>
      'Pārāk daudz mēģinājumu. Pamēģini vēlreiz pēc 15 minūtēm.';

  @override
  String apiAccountBanned(String email) {
    return 'Tavs konts ir bloķēts. Raksti uz $email, ja domā, ka tā ir kļūda.';
  }

  @override
  String get apiProRequired => 'Šis kameras stils ir daļa no CamTrip Pro';

  @override
  String get apiGroupClosed => 'Šī grupa ir slēgta';

  @override
  String get apiGroupCodeNotFound => 'Grupa ar šo kodu netika atrasta';

  @override
  String apiGroupFull(int max) {
    return 'Grupa ir pilna (maks. $max dalībnieki). Ja vienam dalībniekam ir CamTrip Pro, pievienoties var ikviens.';
  }

  @override
  String get apiLastMember => 'Tu esi pēdējais dalībnieks. Labāk izdzēs grupu.';

  @override
  String get apiAdminRequired => 'Tikai CamTrip administratoriem';

  @override
  String get apiUploadIncomplete => 'Augšupielāde nav pabeigta';

  @override
  String get apiInvalidInput => 'Nederīgi dati';

  @override
  String get apiNotSignedIn => 'Neesi pieslēdzies';

  @override
  String get apiAccountGone => 'Šis konts vairs nepastāv';

  @override
  String get apiPhotoNotFound => 'Bilde nav atrasta';

  @override
  String get apiGroupNotFound => 'Grupa nav atrasta';

  @override
  String get apiMemberNotFound => 'Dalībnieks nav atrasts';

  @override
  String get apiPersonNotFound => 'Persona nav atrasta';

  @override
  String get apiUserNotFound => 'Lietotājs nav atrasts';

  @override
  String get apiAdminOnly => 'To var izdarīt tikai administrators';

  @override
  String get apiCannotBlockSelf => 'Sevi bloķēt nevar';

  @override
  String get apiCannotReportOwn => 'Par savu bildi ziņot nevar';

  @override
  String get apiDeleteOwnOnly => 'Dzēst vari tikai savas bildes';

  @override
  String get apiOwnerCannotBeRemoved => 'Grupas veidotāju nevar noņemt';

  @override
  String get apiOwnerStaysAdmin => 'Veidotājs vienmēr paliek administrators';

  @override
  String get apiNeedsOneAdmin => 'Grupai vajag vismaz vienu administratoru';

  @override
  String get apiEndBeforeStart => 'Beigu datums ir pirms sākuma datuma';

  @override
  String get apiPermanentNoEndDate =>
      'Vienmēr atvērtai grupai nav beigu datuma';

  @override
  String get apiCannotBanAdmin => 'Administratoru nevar bloķēt';

  @override
  String get apiReportNotFound => 'Ziņojums nav atrasts';

  @override
  String get apiPhotoOwnerUnknown => 'Šīs bildes autors vairs nav zināms';

  @override
  String get validationNameRequired => 'Ievadi savu vārdu';

  @override
  String validationMaxChars(int max) {
    return 'Ne vairāk kā $max rakstzīmes';
  }

  @override
  String get validationEmailRequired => 'Ievadi e-pasta adresi';

  @override
  String get validationEmailInvalid => 'Šī e-pasta adrese nav derīga';

  @override
  String get validationPasswordRequired => 'Izvēlies paroli';

  @override
  String validationMinChars(int min) {
    return 'Vismaz $min rakstzīmes';
  }

  @override
  String get validationPasswordTooLong => 'Parole ir pārāk gara';

  @override
  String get validationPasswordEmpty => 'Ievadi paroli';

  @override
  String get validationCodeRequired => 'Ievadi kodu no e-pasta';

  @override
  String get validationCodeDigits => 'Kodā ir 6 cipari';

  @override
  String get onboarding1Title => 'Viena filmiņa\nvisai kompānijai.';

  @override
  String get onboarding1Body =>
      'Fotografē ar retro kameru. Visi uzreiz redz tavas bildes, un tās uzreiz ir arī tavā albumā.';

  @override
  String get onboarding2Title => 'Beidzot nav\njāsūta bildes.';

  @override
  String get onboarding2Body =>
      'Izveido grupu, padalies ar kodu, gatavs. Nekad vairs “atsūtīsi man tās bildes?”';

  @override
  String get onboarding3Title => 'Video kopsavilkums\npēc tam.';

  @override
  String get onboarding3Body =>
      'CamTrip izveido video ar mūziku no jūsu labākajiem kopīgajiem mirkļiem.';

  @override
  String get onboardingInvited =>
      'Tevi uzaicināja! Pieslēdzies, lai pievienotos.';

  @override
  String get signInAppleFailed => 'Neizdevās pieslēgties ar Apple';

  @override
  String get signInGoogleFailed => 'Neizdevās pieslēgties ar Google';

  @override
  String get signInFailed => 'Neizdevās pieslēgties';

  @override
  String get next => 'Tālāk';

  @override
  String get legalPrefix => 'Turpinot tu piekrīti';

  @override
  String get legalTerms => 'noteikumiem';

  @override
  String get legalAnd => ' un';

  @override
  String get legalPrivacy => 'privātuma politikai';

  @override
  String get legalSuffix => '.';

  @override
  String get continueWithApple => 'Turpināt ar Apple';

  @override
  String get continueWithGoogle => 'Turpināt ar Google';

  @override
  String get createAccount => 'Izveidot kontu';

  @override
  String get signIn => 'Pieslēgties';

  @override
  String get or => 'vai';

  @override
  String get registerSubtitle => 'Lai draugi redz, kurš uzņēma bildes.';

  @override
  String get loginSubtitle => 'Prieks tevi atkal redzēt.';

  @override
  String get forgotPasswordTitle => 'Aizmirsta parole';

  @override
  String get forgotPasswordPushSubtitle =>
      'Vēl esi kaut kur pieslēdzies? Mēs tur nosūtīsim 6 ciparu kodu kā push paziņojumu, lai tu iestatītu jaunu paroli.';

  @override
  String get newPassword => 'Jaunā parole';

  @override
  String get resetPushInfo =>
      'Ja vēl esi kaut kur pieslēdzies, tur saņemsi push paziņojumu ar kodu. Nevari tikt iekšā? Pieslēdzies ar Apple vai Google, izmantojot to pašu e-pasta adresi - konts tiks sasaistīts.';

  @override
  String get sendCode => 'Sūtīt kodu';

  @override
  String get savePassword => 'Saglabāt paroli';

  @override
  String get errorTryAgain => 'Kaut kas nogāja greizi. Pamēģini vēlreiz.';

  @override
  String get back => 'Atpakaļ';

  @override
  String get name => 'Vārds';

  @override
  String get email => 'E-pasta adrese';

  @override
  String get codeFromPush => 'Kods no paziņojuma';

  @override
  String get password => 'Parole';

  @override
  String get hidePassword => 'Slēpt paroli';

  @override
  String get showPassword => 'Rādīt paroli';

  @override
  String get forgotPasswordLink => 'Aizmirsi paroli?';

  @override
  String get haveAccount => 'Tev jau ir konts?';

  @override
  String get newToCamTrip => 'Pirmo reizi CamTrip?';

  @override
  String get rememberedIt => 'Atcerējies?';

  @override
  String get noCodeReceived => 'Nesaņēmi kodu?';

  @override
  String get resendCode => 'Sūtīt vēlreiz';

  @override
  String onboardingDemoRoll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotogrāfi, 1 filmiņa',
      one: '$count fotogrāfs, 1 filmiņa',
      zero: '$count fotogrāfu, 1 filmiņa',
    );
    return '$_temp0';
  }

  @override
  String membersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dalībnieki',
      one: '$count dalībnieks',
      zero: '$count dalībnieku',
    );
    return '$_temp0';
  }

  @override
  String photosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bildes',
      one: '$count bilde',
      zero: '$count bilžu',
    );
    return '$_temp0';
  }

  @override
  String videosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count video',
      one: '$count video',
      zero: '$count video',
    );
    return '$_temp0';
  }

  @override
  String get justNow => 'tagad';

  @override
  String get badgeNew => 'Jauns';

  @override
  String recapTitle(String groupName) {
    return 'Kopsavilkums: $groupName';
  }

  @override
  String get styleFilm => 'Film';

  @override
  String get styleInstant => 'Instant';

  @override
  String get styleDisposable => 'Vienreizējā';

  @override
  String get styleBw => 'M/B';

  @override
  String get styleGolden => 'Golden';

  @override
  String get styleChrome => 'Chrome';

  @override
  String get styleFilmDescription =>
      'Siltas krāsas, graudainība un oranžs datums';

  @override
  String get styleInstantDescription => 'Maigas krāsas un balta mala';

  @override
  String get styleDisposableDescription =>
      'Ass zibspuldzes gaisma, vinjete un gaismas noplūdes';

  @override
  String get styleBwDescription => 'Graudaina melnbalta ar dziļu kontrastu';

  @override
  String get styleGoldenDescription =>
      'Vienmēr zelta stunda, maigs zeltains mirdzums';

  @override
  String get styleChromeDescription =>
      'Vēss, piesātināts un ass kā diapozitīvu filma';

  @override
  String get shutterStopRecording => 'Apturēt ierakstu';

  @override
  String get shutterStartRecording => 'Sākt video ierakstu';

  @override
  String get shutterTakePhoto => 'Uzņemt bildi';

  @override
  String get modePhoto => 'Bilde';

  @override
  String get modeVideo => 'Video';

  @override
  String get cameraNotFound => 'Kamera nav atrasta';

  @override
  String get cameraAccessNeeded =>
      'CamTrip vajag piekļuvi kamerai. Ieslēdz to Iestatījumos.';

  @override
  String get cameraStartFailed => 'Kameru neizdevās palaist';

  @override
  String get albumAccessNeeded =>
      'Dod CamTrip piekļuvi bildēm, lai tās saglabātu arī tavā albumā';

  @override
  String get albumSaveFailed =>
      'Neizdevās saglabāt albumā. Bilde tik un tā ir kopīgota.';

  @override
  String styleProFallback(String style) {
    return 'Šis stils ir daļa no Pro. Šajā grupā tu fotografē ar $style.';
  }

  @override
  String get photoFailed => 'Bildi neizdevās uzņemt. Pamēģini vēlreiz.';

  @override
  String get recordingFailed => 'Video ierakstīt neizdevās';

  @override
  String get videoFailed => 'Video neizdevās izveidot. Pamēģini vēlreiz.';

  @override
  String get shootInGroup => 'Fotografēt grupā';

  @override
  String get close => 'Aizvērt';

  @override
  String get flash => 'Zibspuldze';

  @override
  String get flashOn => 'Iesl.';

  @override
  String get flashOff => 'Izsl.';

  @override
  String get flashAuto => 'Auto';

  @override
  String get chooseGroup => 'Izvēlēties grupu';

  @override
  String get switchCamera => 'Mainīt kameru';

  @override
  String get createOrJoinFirst =>
      'Vispirms izveido grupu vai pievienojies kādai';

  @override
  String get proViaGroup => 'Pro caur grupu';

  @override
  String proViaName(String name) {
    return 'Pro caur: $name';
  }

  @override
  String get proStylesFreeViaMember =>
      'Pro stili šajā grupā tev ir bez maksas, pateicoties dalībniekam ar Pro';

  @override
  String proStylesFreeViaName(String name) {
    return 'Pro stili šajā grupā: tev bez maksas, pateicoties: $name';
  }

  @override
  String get subscriptionsUnavailable =>
      'Abonementi pašlaik nav pieejami. Pamēģini vēlāk.';

  @override
  String get paymentPending =>
      'Maksājums vēl tiek apstrādāts. Pro ieslēgsies, tiklīdz tas būs pabeigts.';

  @override
  String get purchaseFailed => 'Pirkums neizdevās. Pamēģini vēlāk.';

  @override
  String get restoreUnavailable =>
      'Atjaunot pirkumus pašlaik nevar. Pamēģini vēlāk.';

  @override
  String get restoreFailed => 'Atjaunot neizdevās. Pamēģini vēlāk.';

  @override
  String get welcomePro => 'Laipni lūdzam CamTrip Pro! 🎉';

  @override
  String get proRestored => 'Pro ir atjaunots';

  @override
  String get noPurchaseFound => 'Iepriekšējs pirkums nav atrasts';

  @override
  String periodDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dienas',
      one: '$count diena',
      zero: '$count dienu',
    );
    return '$_temp0';
  }

  @override
  String periodWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nedēļas',
      one: '$count nedēļa',
      zero: '$count nedēļu',
    );
    return '$_temp0';
  }

  @override
  String periodMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mēneši',
      one: '$count mēnesis',
      zero: '$count mēnešu',
    );
    return '$_temp0';
  }

  @override
  String periodYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gadi',
      one: '$count gads',
      zero: '$count gadu',
    );
    return '$_temp0';
  }

  @override
  String get paywallHavePro => 'Tev ir CamTrip Pro';

  @override
  String get paywallSubtitle => 'Viss tavam nākamajam ceļojumam.';

  @override
  String paywallFeatureStyles(String styles) {
    return 'Visi kameras stili ($styles)';
  }

  @override
  String get paywallFeatureUnlimited =>
      'Neierobežoti dalībnieki un krātuve, bildes glabājas mūžīgi';

  @override
  String get paywallFeatureNoWatermark => 'Kopsavilkumi bez ūdenszīmes';

  @override
  String get paywallFeatureOriginal => 'Lejupielāde oriģinālajā kvalitātē';

  @override
  String get planYear => 'Gads';

  @override
  String get planMonth => 'Mēnesis';

  @override
  String pricePerMonth(String price) {
    return '$price mēnesī';
  }

  @override
  String paywallSaveBadge(int percent) {
    return 'IETAUPI $percent%';
  }

  @override
  String get planMonthCancelAnytime => 'atcel jebkurā laikā';

  @override
  String tryFree(String period) {
    return 'Izmēģini $period bez maksas';
  }

  @override
  String get becomePro => 'Iegūt Pro';

  @override
  String get subscriptionsLoadFailed =>
      'Abonementus neizdevās ielādēt. Pārbaudi savienojumu.';

  @override
  String legalAnnual(String price) {
    return 'CamTrip Pro gada abonements: $price gadā.';
  }

  @override
  String legalAnnualTrial(String period, String price) {
    return 'CamTrip Pro gada abonements: $period bez maksas, pēc tam $price gadā.';
  }

  @override
  String legalMonthly(String price) {
    return 'CamTrip Pro mēneša abonements: $price mēnesī.';
  }

  @override
  String legalMonthlyTrial(String period, String price) {
    return 'CamTrip Pro mēneša abonements: $period bez maksas, pēc tam $price mēnesī.';
  }

  @override
  String get legalBillingApple =>
      'Maksa tiek iekasēta no tava Apple ID. Abonements atjaunojas automātiski, ja vien to neatcel vismaz 24 stundas pirms perioda beigām. Atcelt un pārvaldīt to vari App Store konta iestatījumos.';

  @override
  String get legalBillingGoogle =>
      'Maksa tiek iekasēta no tava Google konta. Abonements atjaunojas automātiski, ja vien to neatcel vismaz 24 stundas pirms perioda beigām. Atcelt un pārvaldīt to vari Google Play konta iestatījumos.';

  @override
  String get restorePurchases => 'Atjaunot pirkumus';

  @override
  String get terms => 'Noteikumi';

  @override
  String get privacy => 'Privātums';

  @override
  String get groupProTitle => 'Viens Pro grupā = Pro visiem šajā grupā';

  @override
  String get groupProBody =>
      'Ja vienam cilvēkam ir Pro, visa grupa saņem visus kameras stilus, neierobežotu dalībnieku skaitu, saglabātas bildes, oriģinālo kvalitāti un kopsavilkumus bez ūdenszīmes.';

  @override
  String get groupCreated => 'Grupa izveidota ✓';

  @override
  String get inviteFriends => 'Uzaicini draugus';

  @override
  String get codeCopied => 'Kods nokopēts';

  @override
  String get shareLink => 'Kopīgot saiti';

  @override
  String inviteSubject(String groupName) {
    return 'Pievienojies $groupName lietotnē CamTrip';
  }

  @override
  String inviteMembersUnlimited(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dalībnieki',
      one: '$count dalībnieks',
      zero: '$count dalībnieku',
    );
    return '$_temp0 · neierobežoti (Pro)';
  }

  @override
  String inviteMembersLimit(int count, int limit) {
    return '$count no $limit dalībniekiem · Pro: neierobežoti';
  }

  @override
  String get toCamera => 'Uz kameru';

  @override
  String get done => 'Gatavs';

  @override
  String get joinEnterCode => 'Ievadi 6 rakstzīmju kodu';

  @override
  String get joinGroupTitle => 'Pievienoties grupai';

  @override
  String get joinGroupSubtitle =>
      'Ievadi draugu kodu vai noskenē viņu QR kodu.';

  @override
  String get typeCode => 'Ievadīt kodu';

  @override
  String get scanQr => 'Skenēt QR';

  @override
  String get join => 'Pievienoties';

  @override
  String get groupNameRequired => 'Dod grupai nosaukumu';

  @override
  String get newGroup => 'Jauna grupa';

  @override
  String get groupType => 'Grupas veids';

  @override
  String get groupTypeVacation => 'Atvaļinājums';

  @override
  String get groupTypeVacationDescription =>
      'Ar sākuma un beigu datumu, pēc tam arhivēta';

  @override
  String get groupTypeEvent => 'Pasākums';

  @override
  String get groupTypeEventDescription =>
      'Viena diena vai vakars, piem., ballīte';

  @override
  String get groupTypePermanent => 'Vienmēr atvērta';

  @override
  String get groupTypePermanentDescription =>
      'Tavai pastāvīgajai draugu kompānijai';

  @override
  String get date => 'Datums';

  @override
  String get departure => 'Izbraukšana';

  @override
  String get returnDate => 'Atgriešanās';

  @override
  String get defaultCameraStyle => 'Noklusējuma kameras stils';

  @override
  String freeLimitPermanent(int max) {
    return 'Bez maksas: līdz $max dalībniekiem. Ar Pro neierobežoti.';
  }

  @override
  String freeLimitDated(int max, int days) {
    return 'Bez maksas: līdz $max dalībniekiem, bildes glabājas līdz $days dienām pēc beigu datuma. Ar Pro neierobežoti un mūžīgi.';
  }

  @override
  String get createGroup => 'Izveidot grupu';

  @override
  String get group => 'Grupa';

  @override
  String groupCode(String code) {
    return 'kods $code';
  }

  @override
  String get manage => 'Pārvaldīt';

  @override
  String get rename => 'Pārdēvēt';

  @override
  String get changeDates => 'Mainīt datumus';

  @override
  String get finishTrip => 'Pabeigt ceļojumu';

  @override
  String get finishTripSubtitle => 'Beigu datums kļūst par šodienu';

  @override
  String get reopenGroup => 'Atkal atvērt grupu';

  @override
  String get closeGroup => 'Slēgt grupu';

  @override
  String get reopenGroupSubtitle => 'Dalībnieki atkal var pievienot bildes';

  @override
  String get closeGroupSubtitle =>
      'Neviens vairs nevar pievienot bildes; visu joprojām var apskatīt';

  @override
  String get members => 'Dalībnieki';

  @override
  String memberYou(String name) {
    return '$name (tu)';
  }

  @override
  String get blockedTag => 'bloķēts';

  @override
  String get adminTag => 'administrators';

  @override
  String removeMemberTitle(String name) {
    return 'Noņemt: $name?';
  }

  @override
  String get removeMemberMessage => 'Viņa bildes paliek grupā.';

  @override
  String get remove => 'Dzēst';

  @override
  String get removeMember => 'Noņemt';

  @override
  String blockTitle(String name) {
    return 'Bloķēt: $name?';
  }

  @override
  String blockMessage(String name) {
    return 'Tu vairs neredzēsi $name bildes un video un nesaņemsi par tiem paziņojumus. To var atsaukt Iestatījumos.';
  }

  @override
  String get block => 'Bloķēt';

  @override
  String get makeMember => 'Padarīt par parastu dalībnieku';

  @override
  String get makeAdmin => 'Padarīt par administratoru';

  @override
  String get removeFromGroup => 'Noņemt no grupas';

  @override
  String get unblock => 'Atbloķēt';

  @override
  String get inviteFriendsButton => 'Uzaicināt draugus';

  @override
  String get you => 'Tu';

  @override
  String get unarchive => 'Atjaunot no arhīva';

  @override
  String get archive => 'Arhivēt';

  @override
  String get unarchiveSubtitle => 'Grupa atkal ir starp taviem albumiem';

  @override
  String archiveSubtitle(String section) {
    return 'Tikai tev: grupa pārvietojas uz “$section” albumu apakšā';
  }

  @override
  String get archivedSection => 'Arhivētās';

  @override
  String get hiddenPhotos => 'Paslēptās bildes';

  @override
  String get hiddenPhotosSubtitle => 'Bildes, ko paslēpi sev';

  @override
  String get leaveGroup => 'Pamest grupu';

  @override
  String get leaveGroupSubtitle => 'Tavas bildes paliek grupā citiem';

  @override
  String get deleteGroup => 'Dzēst grupu';

  @override
  String get deleteGroupSubtitle => 'Visas bildes tiek dzēstas visiem';

  @override
  String groupArchived(String groupName) {
    return '“$groupName” arhivēta';
  }

  @override
  String groupUnarchived(String groupName) {
    return '“$groupName” atkal ir starp taviem albumiem';
  }

  @override
  String get undo => 'Atsaukt';

  @override
  String get groupNameTitle => 'Grupas nosaukums';

  @override
  String get finishTripTitle => 'Pabeigt ceļojumu?';

  @override
  String get finishTripMessage =>
      'Beigu datums kļūst par šodienu. Bildes vēl vari pievienot; kopsavilkums ir gatavs.';

  @override
  String get finishTripConfirm => 'Pabeigt';

  @override
  String get tripFinished => 'Ceļojums pabeigts';

  @override
  String leaveGroupTitle(String groupName) {
    return 'Pamest “$groupName”?';
  }

  @override
  String get leaveGroupMessage =>
      'Tavas bildes paliek grupā citiem. Vēlāk vari atkal pievienoties ar kodu.';

  @override
  String get leave => 'Pamest';

  @override
  String groupDeleted(String groupName) {
    return '“$groupName” izdzēsta';
  }

  @override
  String get youAreAdmin => 'tu esi administrators';

  @override
  String get open => 'Atvērt';

  @override
  String get archiveMenuSubtitle => 'Tikai tev, citi to nepamanīs';

  @override
  String get deleteGroupMenuSubtitle => 'Visiem, ar visām bildēm';

  @override
  String get deleteGroupTitle => 'Dzēst grupu?';

  @override
  String deleteGroupMessage(int count, String groupName, int memberCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Visas $count bildes un video',
      one: '$count bilde vai video',
      zero: 'Visas $count bildes un video',
    );
    String _temp1 = intl.Intl.pluralLogic(
      memberCount,
      locale: localeName,
      other: 'visiem $memberCount dalībniekiem',
      one: '$memberCount dalībniekam',
      zero: 'visiem $memberCount dalībniekiem',
    );
    return '$_temp0 grupā “$groupName” pazudīs $_temp1. To nevar atsaukt.';
  }

  @override
  String get deleteGroupOwnRoll => 'Tava galerija paliek nemainīga.';

  @override
  String get deleteGroupTypeName =>
      'Apstiprināšanai ieraksti grupas nosaukumu:';

  @override
  String get deleteForEveryone => 'Dzēst visiem';

  @override
  String get save => 'Saglabāt';

  @override
  String get yourAlbums => 'Tavi albumi';

  @override
  String get uploadQueue => 'Augšupielādes rinda';

  @override
  String get noConnection => 'Nav savienojuma';

  @override
  String get albumsOfflineMessage =>
      'Albumi ielādēsies, kad atkal būsi tiešsaistē. Kamera joprojām darbojas.';

  @override
  String get retry => 'Mēģināt vēlreiz';

  @override
  String get noAlbumsTitle => 'Vēl nav albumu';

  @override
  String get noAlbumsMessage =>
      'Izveido grupu nākamajam ceļojumam vai pievienojies drauga grupai ar viņa kodu.';

  @override
  String get haveCode => 'Man ir kods';

  @override
  String get joinWithCode => 'Pievienoties ar kodu vai QR kodu';

  @override
  String get camera => 'Kamera';

  @override
  String get restore => 'Atjaunot';

  @override
  String get more => 'Vairāk';

  @override
  String get newAlbum => 'Jauns';

  @override
  String get closedTag => 'slēgta';

  @override
  String get activeTag => 'aktīva';

  @override
  String get uploadFailed => 'Augšupielāde neizdevās';

  @override
  String get queueNoSignal => 'Nav signāla.';

  @override
  String get queueNoSignalMessage =>
      'Tavas bildes jau ir albumā un tiks kopīgotas, tiklīdz būsi tiešsaistē.';

  @override
  String get queueWaitingForWifi => 'Gaida Wi-Fi.';

  @override
  String queueWifiOnlyOn(String setting) {
    return 'Tev ir ieslēgts “$setting”.';
  }

  @override
  String get queueVideosWifiOnly => 'Video tiek sūtīti tikai caur Wi-Fi.';

  @override
  String get queueAllShared => 'Viss kopīgots ✓';

  @override
  String queuePending(String items) {
    return 'Vēl jākopīgo: $items';
  }

  @override
  String queuePendingBoth(String photos, String videos) {
    return 'Vēl jākopīgo: $photos un $videos';
  }

  @override
  String get retryUpload => 'Mēģināt vēlreiz';

  @override
  String get removeFromQueue => 'Noņemt no rindas';

  @override
  String get queueStatusWifi => 'Wi-Fi';

  @override
  String get queueStatusWaiting => 'gaida';

  @override
  String get videosWifiOnlyTitle => 'Video tikai caur Wi-Fi';

  @override
  String get videosWifiOnlySubtitle => 'Taupa mobilos datus';

  @override
  String get retryNow => 'Mēģināt tagad';

  @override
  String get yourName => 'Tavs vārds';

  @override
  String get settings => 'Iestatījumi';

  @override
  String get tapToChangeName => 'Pieskaries, lai mainītu vārdu';

  @override
  String get getCamTripPro => 'Iegūt CamTrip Pro';

  @override
  String get photos => 'Bildes';

  @override
  String get saveOwnPhotos => 'Saglabāt manas bildes albumā katrai grupai';

  @override
  String get autoSaveOthers => 'Automātiski saglabāt citu bildes';

  @override
  String get wifiOnlyTitle => 'Augšupielādēt tikai caur Wi-Fi';

  @override
  String get dateStamp => 'Datuma zīmogs';

  @override
  String get notifications => 'Paziņojumi';

  @override
  String get notifyNewPhotos => 'Jaunas bildes (apkopoti)';

  @override
  String get notifyRecapReady => 'Kopsavilkums gatavs';

  @override
  String get camTripTeam => 'CamTrip komanda';

  @override
  String get adminEntrySubtitle =>
      'Lietotāji, Pro piešķiršana, ziņojumi un statistika';

  @override
  String get account => 'Konts';

  @override
  String get manageSubscription => 'Pārvaldīt abonementu';

  @override
  String get blockedPeople => 'Bloķētie cilvēki';

  @override
  String get nobody => 'Neviens';

  @override
  String peopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count cilvēki',
      one: '$count cilvēks',
      zero: '$count cilvēku',
    );
    return '$_temp0';
  }

  @override
  String get privacyPolicy => 'Privātuma politika';

  @override
  String get contact => 'Kontakti';

  @override
  String get signOut => 'Atslēgties';

  @override
  String get deleteAccount => 'Dzēst kontu';

  @override
  String get deleteAccountSubtitle => 'Izdzēš tavu kontu un visas tavas bildes';

  @override
  String get deleteAccountTitle => 'Dzēst kontu?';

  @override
  String get deleteAccountMessage =>
      'Tavs konts un visas tavas bildes un video tiks dzēsti, arī no grupām. Aktīvo abonementu atcel App Store vai Google Play.';

  @override
  String get blockedTitle => 'Bloķētie';

  @override
  String get blockedSubtitle => 'Tu neredzi šo cilvēku bildes.';

  @override
  String get blockedNone => 'Tu neesi nevienu bloķējis.';

  @override
  String get unblockShort => 'Atbloķēt';

  @override
  String get groupGone =>
      'Šī grupa vairs nepastāv, vai tu vairs neesi dalībnieks.';

  @override
  String photosSavedToAlbum(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bildes saglabātas “$album”',
      one: '$count bilde saglabāta “$album”',
      zero: '$count bilžu saglabāts “$album”',
    );
    return '$_temp0';
  }

  @override
  String photosDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bildes izdzēstas',
      one: '$count bilde izdzēsta',
      zero: '$count bilžu izdzēsts',
    );
    return '$_temp0';
  }

  @override
  String photosDeletedSkipped(int count, int skipped) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bildes izdzēstas',
      one: '$count bilde izdzēsta',
      zero: '$count bilžu izdzēsts',
    );
    return '$_temp0, izlaistas: $skipped';
  }

  @override
  String photosHiddenForYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bildes paslēptas no tevis',
      one: '$count bilde paslēpta no tevis',
      zero: '$count bilžu paslēpts no tevis',
    );
    return '$_temp0';
  }

  @override
  String get addedToFavorites => 'Pievienots izlasei';

  @override
  String get removedFromFavorites => 'Noņemts no izlases';

  @override
  String get photoAccessSettings => 'Dod CamTrip piekļuvi bildēm Iestatījumos';

  @override
  String photosBeingAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Tiek pievienotas $count bildes',
      one: 'Tiek pievienota $count bilde',
      zero: 'Tiek pievienotas $count bildes',
    );
    return '$_temp0';
  }

  @override
  String photosUnreadable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bildes neizdevās nolasīt',
      one: '$count bildi neizdevās nolasīt',
      zero: '$count bildes neizdevās nolasīt',
    );
    return '$_temp0';
  }

  @override
  String get groupNotLoaded => 'Grupa nav ielādēta';

  @override
  String get noFavoritesTitle => 'Izlasē vēl nekā nav';

  @override
  String get noPhotosTitle => 'Vēl nav bilžu';

  @override
  String get noFavoritesMessage =>
      'Pieskaries zvaigznītei uz bildes, lai to ieliktu šeit.';

  @override
  String get noPhotosMessage => 'Uzņem pirmo bildi. Visi grupā to uzreiz redz.';

  @override
  String get openCamera => 'Atvērt kameru';

  @override
  String savingProgress(int done, int total) {
    return 'Saglabā... $done/$total';
  }

  @override
  String get sharePreparing => 'Sagatavo...';

  @override
  String sharingProgress(int done, int total) {
    return 'Sagatavo... $done/$total';
  }

  @override
  String get choosePhotos => 'Izvēlēties bildes';

  @override
  String selectedCount(int count) {
    return 'Atlasītas: $count';
  }

  @override
  String get selectNone => 'Noņemt atlasi';

  @override
  String get selectAll => 'Atlasīt visas';

  @override
  String photosWaitingToShare(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bildes gaida kopīgošanu',
      one: '$count bilde gaida kopīgošanu',
      zero: '$count bilžu gaida kopīgošanu',
    );
    return '$_temp0';
  }

  @override
  String get recapReadyTitle => 'Tavs kopsavilkums ir gatavs';

  @override
  String get recapReadySubtitle => 'Video ar mūziku no tava ceļojuma';

  @override
  String get watch => 'Skatīties';

  @override
  String get makeRecapNow => 'Izveidot video kopsavilkumu tagad';

  @override
  String freeGroupDeleteNotice(String date) {
    return 'Bezmaksas grupa: bildes glabājas līdz $date. Saglabā tās vai iegūsti Pro.';
  }

  @override
  String get filterAll => 'Visas';

  @override
  String get filterFavorites => 'Izlase';

  @override
  String get filterPerPerson => 'Pēc cilvēka';

  @override
  String get filterPerson => 'Cilvēks';

  @override
  String get select => 'Atlasīt';

  @override
  String get hiddenFilter => 'Paslēptās';

  @override
  String get photosBy => 'Bildes no...';

  @override
  String get uploadedTag => 'augšupielādēts';

  @override
  String get saveAll => 'Saglabāt visas';

  @override
  String get favorite => 'Izlasē';

  @override
  String get unfavorite => 'Noņemt no izlases';

  @override
  String get hide => 'Paslēpt';

  @override
  String get delete => 'Dzēst';

  @override
  String deletePhotosTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Dzēst $count bildes?',
      one: 'Dzēst bildi?',
      zero: 'Dzēst $count bildes?',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Tās pazudīs visiem grupā. To nevar atsaukt.',
      one: 'Tā pazudīs visiem grupā. To nevar atsaukt.',
      zero: 'Tās pazudīs visiem grupā. To nevar atsaukt.',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosNotAllowed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count bildes pieder kādam citam. Tās paliek; dzēst var tikai administrators.',
      one:
          '$count bilde pieder kādam citam. Tā paliek; dzēst var tikai administrators.',
      zero:
          '$count bildes pieder kādam citam. Tās paliek; dzēst var tikai administrators.',
    );
    return '$_temp0';
  }

  @override
  String photosBackInGroup(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bildes atkal grupā',
      one: '$count bilde atkal grupā',
      zero: '$count bildes atkal grupā',
    );
    return '$_temp0';
  }

  @override
  String get showAll => 'Rādīt visas';

  @override
  String get hiddenPhotosExplainer =>
      'Šīs bildes neredzi tikai tu. Citiem grupā tās joprojām ir.';

  @override
  String get nothingHidden => 'Nekas nav paslēpts';

  @override
  String get nothingHiddenMessage => 'Šeit parādīsies bildes, ko paslēpsi.';

  @override
  String showAgainCount(int count) {
    return 'Rādīt atkal ($count)';
  }

  @override
  String get someone => 'Kāds';

  @override
  String get savedToAlbum => 'Saglabāts tavā foto albumā';

  @override
  String get share => 'Kopīgot';

  @override
  String get shareFailed => 'Kopīgot neizdevās';

  @override
  String get reportTitle => 'Kāpēc ziņo par šo bildi?';

  @override
  String get reportSubtitle =>
      'Katru ziņojumu pārskatām 24 stundu laikā. Bilde no tevis tiek paslēpta uzreiz.';

  @override
  String get reportThanks => 'Paldies, mēs to apskatīsim';

  @override
  String blockMessageAllGroups(String name) {
    return 'Tu vairs neredzēsi $name bildes un video nevienā grupā un nesaņemsi par tiem paziņojumus. To var atsaukt Iestatījumos.';
  }

  @override
  String userBlocked(String name) {
    return '$name bloķēts';
  }

  @override
  String get videoHiddenForYou => 'Video paslēpts no tevis';

  @override
  String get photoHiddenForYou => 'Bilde paslēpta no tevis';

  @override
  String get setAsCover => 'Iestatīt kā vāku';

  @override
  String get coverUpdated => 'Vāka bilde atjaunināta';

  @override
  String get hideForMe => 'Paslēpt man';

  @override
  String get hideForMeSubtitle => 'Citi grupā to joprojām redz';

  @override
  String get reportPhoto => 'Ziņot par bildi';

  @override
  String blockName(String name) {
    return 'Bloķēt: $name';
  }

  @override
  String get forEveryoneInGroup => 'Visiem grupā';

  @override
  String get videoDeleted => 'Video izdzēsts';

  @override
  String get photoDeleted => 'Bilde izdzēsta';

  @override
  String get photoAccessToSave =>
      'Dod CamTrip piekļuvi bildēm Iestatījumos, lai tās saglabātu';

  @override
  String get phoneFull => 'Telefona atmiņa ir pilna';

  @override
  String get albumSaveFailedShort => 'Neizdevās saglabāt albumā';

  @override
  String get recapTemplateGoldenHour => 'Golden Hour';

  @override
  String get recapTemplateFast => 'Ātrs';

  @override
  String get recapTemplateFilmRoll => 'Filmiņa';

  @override
  String get recapTemplatePolaroid => 'Polaroid';

  @override
  String get trackSummerEvening => 'Vasaras vakars';

  @override
  String get trackGoldenHour => 'Golden Hour';

  @override
  String get trackRoadtrip => 'Ceļojums';

  @override
  String get moodWarm => 'silts';

  @override
  String get moodCheerful => 'jautrs';

  @override
  String friendsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count draugi',
      one: '$count draugs',
      zero: '$count draugu',
    );
    return '$_temp0';
  }

  @override
  String get madeWithCamTrip => 'Veidots ar CamTrip';

  @override
  String get tagline => 'Viena filmiņa visai kompānijai';

  @override
  String get videoUnsupportedDevice => 'Šajā ierīcē video neizdevās izveidot';

  @override
  String get groupLoadFailed => 'Šo grupu neizdevās ielādēt.';

  @override
  String recapNeedsPhotos(int count) {
    return 'Kopsavilkumam vajag vismaz $count bildes.';
  }

  @override
  String get recapFailed =>
      'Kopsavilkumu neizdevās izveidot. Pamēģini vēlreiz.';

  @override
  String get recapSaved => 'Kopsavilkums saglabāts foto albumā';

  @override
  String get recap => 'Kopsavilkums';

  @override
  String get recapRendering => 'Veido kopsavilkumu...';

  @override
  String get videoRendering => 'Veido video...';

  @override
  String get template => 'Veidne';

  @override
  String get musicLicense => 'CamTrip pašu mūzika · bez autoratlīdzības';

  @override
  String get change => 'Mainīt';

  @override
  String get noWatermark => 'Bez ūdenszīmes ✓';

  @override
  String get removeWatermarkPro => 'Noņem ūdenszīmi ar Pro';

  @override
  String get proSourceSubscription => 'Abonements';

  @override
  String get proSourceGift => 'Dāvana';

  @override
  String get proSourceAdmin => 'Administrators';

  @override
  String get proSourceGroup => 'Caur grupu';

  @override
  String get noPro => 'Bez Pro';

  @override
  String proStatusNoEnd(String source) {
    return 'Pro ($source), bez beigu datuma';
  }

  @override
  String proStatusUntil(String source, String date) {
    return 'Pro ($source), līdz $date';
  }

  @override
  String get lifetime => 'Uz mūžu';

  @override
  String get pickDate => 'Izvēlies datumu';

  @override
  String get noAccess => 'Nav piekļuves';

  @override
  String get adminOnlyTeam => 'Pārvaldība ir tikai CamTrip komandai.';

  @override
  String get adminOverview => 'Pārskats';

  @override
  String get adminUsers => 'Lietotāji';

  @override
  String get adminReports => 'Ziņojumi';

  @override
  String adminsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count administratori',
      one: '$count administrators',
      zero: '$count administratoru',
    );
    return '$_temp0';
  }

  @override
  String get adminNewThisWeek => 'Jauni šonedēļ';

  @override
  String get adminGroups => 'Grupas';

  @override
  String get adminProSubscription => 'Pro ar abonementu';

  @override
  String get adminProGift => 'Pro dāvanā';

  @override
  String adminWithoutSubscription(int count) {
    return '$count bez abonementa';
  }

  @override
  String get adminOpenReports => 'Atvērtie ziņojumi';

  @override
  String get adminSearchHint => 'Meklēt pēc vārda vai e-pasta';

  @override
  String get nobodyFound => 'Neviens nav atrasts';

  @override
  String get loadMore => 'Ielādēt vairāk';

  @override
  String get noEmail => 'Nav e-pasta';

  @override
  String adminDeletePhotoMessage(String groupName) {
    return 'Bilde pazudīs visiem grupā “$groupName”. Visi ziņojumi par šo bildi tiks atrisināti.';
  }

  @override
  String get adminBanMessage =>
      'Šis konts vairs nevarēs pieslēgties un lietot lietotni. Vēlāk to var atsaukt.';

  @override
  String get adminDismissTitle => 'Noraidīt ziņojumu?';

  @override
  String get adminDismissMessage =>
      'Bilde paliek. Ziņojums tiek atzīmēts kā atrisināts.';

  @override
  String get adminDismiss => 'Noraidīt';

  @override
  String get adminAccountBlocked => 'Konts bloķēts';

  @override
  String get adminReportDismissed => 'Ziņojums noraidīts';

  @override
  String get adminNoReports => 'Nav atvērtu ziņojumu';

  @override
  String get adminNoReportsMessage => 'Šeit parādās bildes, par kurām ziņots.';

  @override
  String get deletedTag => 'Izdzēsts';

  @override
  String adminReportedBy(String name) {
    return 'Ziņoja: $name';
  }

  @override
  String adminPhotoBy(String name) {
    return 'Bilde: $name';
  }

  @override
  String reportsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ziņojumi',
      one: '$count ziņojums',
      zero: '$count ziņojumu',
    );
    return '$_temp0';
  }

  @override
  String get adminDeletePhoto => 'Dzēst bildi';

  @override
  String get adminBlockCreator => 'Bloķēt autoru';

  @override
  String get loadFailed => 'Ielāde neizdevās';

  @override
  String get adminLifetimeProGiven => 'Piešķirts Pro uz mūžu';

  @override
  String get adminProGiven => 'Pro piešķirts';

  @override
  String adminGiveProUntil(String date) {
    return 'Piešķirt Pro līdz $date';
  }

  @override
  String get adminGiveProLifetime => 'Piešķirt Pro uz mūžu';

  @override
  String adminGiveProFor(String period) {
    return 'Piešķirt Pro uz $period';
  }

  @override
  String get adminReasonHint =>
      'Iemesls, piem., draugs, testētājs, influenceris';

  @override
  String get adminGivePro => 'Piešķirt Pro';

  @override
  String get adminRevokeTitle => 'Atsaukt dāvanu?';

  @override
  String get adminRevokeMessage =>
      'Dāvinātais Pro beidzas uzreiz. Paša abonements turpinās.';

  @override
  String get adminRevoke => 'Atsaukt';

  @override
  String get adminGiftRevoked => 'Dāvana atsaukta';

  @override
  String get adminUnbanTitle => 'Atcelt bloķēšanu?';

  @override
  String adminUnbanMessage(String name) {
    return '$name atkal varēs pieslēgties.';
  }

  @override
  String get adminUnbanned => 'Bloķēšana atcelta';

  @override
  String get adminBanUserMessage =>
      'Šis konts vairs nevarēs pieslēgties un lietot lietotni. Bildes paliek.';

  @override
  String get adminUser => 'Lietotājs';

  @override
  String get adminNotVerified => 'nav apstiprināts';

  @override
  String get adminRole => 'Loma';

  @override
  String get adminCreated => 'Izveidots';

  @override
  String get unknown => 'Nezināms';

  @override
  String get adminSignInWith => 'Pieslēdzas ar';

  @override
  String get adminEmailMethod => 'E-pasts';

  @override
  String get adminPhotosAndVideos => 'Bildes un video';

  @override
  String get adminStatus => 'Statuss';

  @override
  String get adminActive => 'Aktīvs';

  @override
  String adminActiveUntil(String date) {
    return 'Aktīvs līdz $date';
  }

  @override
  String adminGiftFrom(String name) {
    return 'Dāvana no $name';
  }

  @override
  String adminExpiredOn(String date) {
    return 'Beidzās $date';
  }

  @override
  String get adminExpired => 'Beidzies';

  @override
  String adminUntil(String date) {
    return 'Līdz $date';
  }

  @override
  String get adminGiveProTitle => 'Piešķirt Pro';

  @override
  String get adminGiveProNote =>
      'Darbojas arī šī cilvēka grupās: viens Pro grupā = Pro visiem šajā grupā.';

  @override
  String get adminRevokeGift => 'Atsaukt dāvanu';

  @override
  String get adminModeration => 'Moderēšana';

  @override
  String get adminCannotBanSelf => 'Sevi bloķēt nevar.';

  @override
  String get adminCannotBanAdmin => 'Administratoru nevar bloķēt.';

  @override
  String get adminUnban => 'Atcelt bloķēšanu';

  @override
  String get adminBanAccount => 'Bloķēt kontu';

  @override
  String get googleSignInUnavailable =>
      'Pieslēgšanās ar Google vēl nav pieejama';

  @override
  String get cameraPickerTitle => 'Izvēlies kameru';

  @override
  String get cameraPickerSubtitle => 'Katra kamera piešķir bildēm savu izskatu';

  @override
  String get cameraPickerChange => 'Mainīt kameru';

  @override
  String get cameraPickerUnlock => 'Atbloķēt ar Pro';

  @override
  String get cameraPickerSelected => 'Izvēlēta';

  @override
  String get cameraPickerStyleSummer => 'Vasara';

  @override
  String get cameraPickerStyleSummerDescription =>
      'Siltas, izbalējušas krāsas kā 90. gadu momentuzņēmumā';

  @override
  String get cameraPickerStyleNight => 'Nakts 800';

  @override
  String get cameraPickerStyleNightDescription =>
      'Kino filma: zilganzaļas ēnas, silta gaisma, daudz graudu';

  @override
  String get cameraPickerStyleSepia => 'Sēpija';

  @override
  String get cameraPickerStyleSepiaDescription =>
      'Veca brūna bilde no kurpju kastes';

  @override
  String get cameraPickerStyleLomo => 'Lomo';

  @override
  String get cameraPickerStyleLomoDescription =>
      'Spilgtas krāsas, tumši stūri un traka krāsu nokrāsa';

  @override
  String get cameraPickerStyleMint => 'Piparmētra';

  @override
  String get cameraPickerStyleMintDescription =>
      'Maigs un svaigs ar zaļganu nokrāsu';

  @override
  String get cameraPickerStylePastel => 'Rozā';

  @override
  String get cameraPickerStylePastelDescription =>
      'Pasteļkrāsas ar rozā mirdzumu un baltu malu';

  @override
  String get cameraPickerStyleSuper8 => 'Super 8';

  @override
  String get cameraPickerStyleSuper8Description =>
      'Graudaina un maiga kā sena mājas filma';

  @override
  String get paywallBenefitGroup => 'Viens Pro = Pro visai grupai';

  @override
  String get paywallBenefitUnlimited =>
      'Neierobežoti dalībnieki, bildes glabājas mūžīgi';

  @override
  String get paywallBenefitQuality => 'Bez ūdenszīmes, oriģinālā kvalitāte';

  @override
  String paywallFreeTrial(String period) {
    return '$period bez maksas';
  }

  @override
  String paywallPriceYear(String price) {
    return '$price gadā.';
  }

  @override
  String paywallPriceYearTrial(String period, String price) {
    return '$period bez maksas, pēc tam $price gadā.';
  }

  @override
  String paywallPriceMonth(String price) {
    return '$price mēnesī.';
  }

  @override
  String paywallPriceMonthTrial(String period, String price) {
    return '$period bez maksas, pēc tam $price mēnesī.';
  }

  @override
  String paywallAutoRenew(String store) {
    return 'Atjaunojas automātiski. Atcel vismaz 24 stundas pirms atjaunošanas: $store.';
  }

  @override
  String get paywallDetailsTitle => 'Viss, kas ir Pro';

  @override
  String get paywallBenefitStyles => 'Visi kameras stili';

  @override
  String get allPhotosTitle => 'Visas bildes';

  @override
  String get homeTabAlbums => 'Albumi';

  @override
  String get allPhotosEmptyTitle => 'Vēl nav bilžu';

  @override
  String get allPhotosEmptyMessage => 'Atver kameru un uzņem savu pirmo bildi.';

  @override
  String get allPhotosLoadFailed => 'Tavas bildes neizdevās ielādēt';

  @override
  String get cameraSettingsTitle => 'Kameras iestatījumi';

  @override
  String get cameraSettingsMore => 'Vairāk iestatījumu';

  @override
  String get cameraSettingsGrid => 'Režģis';

  @override
  String get cameraSettingsHaptics => 'Vibrēt uzņemot';

  @override
  String get cameraSettingsDateStamp => 'Datums apakšā pa labi';

  @override
  String get cameraSettingsSound => 'Slēdža skaņa';

  @override
  String get cameraSettingsSoundHint => 'Kluss, kad telefons ir klusuma režīmā';

  @override
  String get cameraSettingsTimer => 'Taimeris';

  @override
  String get cameraSettingsTimerOff => 'Izsl.';

  @override
  String cameraSettingsTimerSeconds(int seconds) {
    return '$seconds s';
  }

  @override
  String get cameraSettingsTimerCancelHint => 'Pieskaries slēdzim, lai atceltu';

  @override
  String get cameraSettingsMirror => 'Spoguļot pašbildes';

  @override
  String get cameraSettingsSaveToRoll => 'Saglabāt galerijā';

  @override
  String get cameraSettingsQuality => 'Kvalitāte';

  @override
  String get cameraSettingsQualityStandard => 'Standarta';

  @override
  String get cameraSettingsQualityHigh => 'Augsta';

  @override
  String get cameraLowLightHint => 'Maz gaismas - ieslēdz zibspuldzi';

  @override
  String get cameraFlashUnavailable => 'Šai kamerai nav zibspuldzes';

  @override
  String get cameraFlashScreen => 'Ekrāna zibspuldze';

  @override
  String get cameraFlashCycleHint =>
      'Pieskaries, lai pārslēgtu: izsl., iesl. un auto';

  @override
  String get cameraFlip => 'Pārslēgt priekšējo un aizmugurējo kameru';

  @override
  String get cameraFlipHint =>
      'Divreiz pieskaries skatu meklētājam, lai apgrieztu kameru';

  @override
  String cameraPickerPaywallStyles(int count, String styles) {
    return 'Visas kameras ($count), tostarp $styles';
  }

  @override
  String get styleFlash => 'Zibsnis 400';

  @override
  String get styleFlashDescription =>
      'Tieša zibspuldze uz siltas filmas: dzintara mirdzums, graudi, bagāti sarkanie';

  @override
  String cameraTimerButton(String state) {
    return 'Taimeris: $state';
  }

  @override
  String get cameraTimerCycleHint =>
      'Pieskaries, lai pārslēgtu: izsl., 3 s un 10 s';

  @override
  String get cameraLastShotOpen => 'Pēdējā bilde, atver albumu';

  @override
  String get cameraLastShotEmpty => 'Vēl nav bilžu, atver albumu';

  @override
  String get deleteOnlyOwnOrAdmin =>
      'Dzēst var tikai autors vai administrators';

  @override
  String get videoPlay => 'Atskaņot';

  @override
  String get videoPause => 'Pauze';

  @override
  String get language => 'Valoda';

  @override
  String get languageSystem => 'Sistēmas valoda';

  @override
  String languageSystemCurrent(String language) {
    return 'Sistēmas ($language)';
  }

  @override
  String get languageSearchHint => 'Meklēt valodu';

  @override
  String get languageNoResults => 'Valoda nav atrasta';

  @override
  String get personalRollTitle => 'Mana filmiņa';

  @override
  String get personalRollSubtitle => 'Tikai tev';

  @override
  String get personalRollPickerSubtitle => 'Atsevišķi foto, tikai tev';

  @override
  String get personalRollMove => 'Uz albumu';

  @override
  String get personalRollMoveTitle => 'Pārvietot uz albumu';

  @override
  String get personalRollMoveNoAlbums =>
      'Vispirms izveido albumu vai pievienojies kādam ar kodu.';

  @override
  String personalRollMoved(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto pārvietoti uz $album',
      one: '1 foto pārvietots uz $album',
    );
    return '$_temp0';
  }

  @override
  String get personalRollPrivateNote =>
      'Šos foto redzi tikai tu. Pārvieto tos uz albumu, lai dalītos.';

  @override
  String get paywallTripPassSub => 'Tikai šis ceļojums, visai grupai';

  @override
  String get paywallOneTime => 'vienreizēji';

  @override
  String get paywallBestValue => 'Izdevīgākais';

  @override
  String paywallRollFullTitle(int used, int limit) {
    return 'Tava filmiņa ir pilna - $used/$limit foto';
  }

  @override
  String get paywallRollFullSub => 'Fotografē tālāk ar Trip Pass vai Pro.';

  @override
  String get paywallCameraTitle => 'Šī kamera ir daļa no Pro';

  @override
  String paywallCameraSub(int count) {
    return 'Atbloķē visas $count kameras.';
  }

  @override
  String get paywallWatermarkTitle => 'Recap bez ūdenszīmes';

  @override
  String get paywallWatermarkSub => 'Kopīgo recap bez CamTrip logo.';

  @override
  String get paywallDeletionTitle => 'Saglabā savu ceļojumu';

  @override
  String paywallDeletionSub(String date) {
    return 'Bezmaksas ceļojumi tiek dzēsti $date. Ar Trip Pass vai Pro tas paliek uz visiem laikiem.';
  }

  @override
  String paywallTripPassTerms(String price) {
    return 'Vienreizējs pirkums par $price šim ceļojumam. Nav abonements.';
  }

  @override
  String get buyTripPass => 'Pirkt Trip Pass';

  @override
  String get tripPassActive => 'Trip Pass aktīvs: ceļojums ir Pro visiem';

  @override
  String get tripPassActivating =>
      'Maksājums saņemts. Trip Pass drīz būs aktīvs.';

  @override
  String proViaTripPass(String name) {
    return 'Trip Pass no $name';
  }

  @override
  String rollCounterSemantics(int used, int limit) {
    return '$used no $limit kadriem tavā filmiņā';
  }

  @override
  String rollHeldTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Foto, kas neietilpst filmiņā: $count',
      one: '1 foto vairs neietilpst filmiņā',
    );
    return '$_temp0';
  }

  @override
  String get rollHeldBody => 'Saglabā tos ar Pro vai Trip Pass';

  @override
  String deletionBannerTitle(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Saglabā savu ceļojumu - atlikušas dienas: $days',
      one: 'Saglabā savu ceļojumu - atlikusi 1 diena',
    );
    return '$_temp0';
  }

  @override
  String get deletionBannerBody =>
      'Bezmaksas ceļojumi tiek dzēsti 30 dienas pēc beigām. Ar Trip Pass vai Pro tas paliek uz visiem laikiem.';

  @override
  String apiRollFull(int limit) {
    return 'Tava filmiņa ir pilna ($limit kadri). Iegūsti Trip Pass vai Pro, lai turpinātu.';
  }

  @override
  String get apiTripPassFailed =>
      'Trip Pass neizdevās aktivizēt. Raksti uz support@camtrip.app.';

  @override
  String get apiTripPassExists => 'Šim ceļojumam jau ir Trip Pass.';

  @override
  String get tripPassUnavailable =>
      'Trip Pass pašlaik nav pieejams. Mēģini vēlāk.';

  @override
  String get tripMapTitle => 'Ceļojuma karte';

  @override
  String get tripMapOpen => 'Karte un statistika';

  @override
  String get tripMapLoadFailed => 'Neizdevās ielādēt karti';

  @override
  String get tripMapStatDays => 'Dienas';

  @override
  String get tripMapStatPhotos => 'Foto';

  @override
  String get tripMapStatVideos => 'Video';

  @override
  String get tripMapStatMembers => 'Dalībnieki';

  @override
  String get tripMapStatDistance => 'nobraukti km';

  @override
  String get tripMapStatCountries => 'Valstis';

  @override
  String get tripMapStatPlaces => 'Vietas';

  @override
  String tripMapBusiestDay(String day, int count) {
    return 'Visvairāk foto: $day ($count)';
  }

  @override
  String tripMapTopPhotographer(String name, int count) {
    return 'Labākais fotogrāfs: $name ($count)';
  }

  @override
  String get tripMapOffTitle => 'Ceļojuma karte ir izslēgta';

  @override
  String get tripMapOffMessage =>
      'Administrators var ieslēgt karti grupas iestatījumos. Statistiku tu redzi vienmēr.';

  @override
  String get tripMapOffMessageAdmin =>
      'Ieslēdz karti, lai redzētu, kur tapa jūsu foto. Katrs pats izlemj, vai piedalīties.';

  @override
  String get tripMapEnable => 'Ieslēgt karti';

  @override
  String get tripMapEmptyTitle => 'Kartē vēl nav vietu';

  @override
  String get tripMapEmptyMessage =>
      'Šeit parādās to dalībnieku jaunie foto, kuri kopīgo atrašanās vietu, noapaļoti līdz aptuveni 100 m.';

  @override
  String get tripMapConsentTitle => 'Ceļojuma karte';

  @override
  String get tripMapConsentQuestion =>
      'Rādīt šīs grupas kartē, kur tapa tavi foto?';

  @override
  String get tripMapConsentDetail =>
      'To redz tikai grupas dalībnieki, noapaļotu līdz aptuveni 100 m. Atrašanās vieta nekad netiek ierakstīta pašā foto, un to vari jebkurā laikā izslēgt grupas iestatījumos.';

  @override
  String get tripMapConsentYes => 'Jā, kopīgot';

  @override
  String get tripMapConsentNo => 'Nē';

  @override
  String get tripMapLocationDenied =>
      'Nav piekļuves tavai atrašanās vietai. To vari atļaut tālruņa iestatījumos.';

  @override
  String get tripMapSettingSubtitle =>
      'Rāda kartē, kur tapuši foto. Dalībnieki paši izlemj, vai kopīgot.';

  @override
  String get tripMapDisableTitle => 'Izslēgt karti?';

  @override
  String get tripMapDisableMessage =>
      'Visas šīs grupas atrašanās vietas tiks dzēstas. Ja vēlāk karti ieslēgsi atkal, visiem jautāsim vēlreiz.';

  @override
  String get tripMapDisable => 'Izslēgt';

  @override
  String get tripMapMySharing => 'Kopīgot manu atrašanās vietu';

  @override
  String get tripMapMySharingOn =>
      'Tavi jaunie foto parādās kartē (noapaļoti līdz aptuveni 100 m).';

  @override
  String get tripMapMySharingOff => 'Izslēgts. Tavi foto kartē neparādās.';

  @override
  String get tripMapStopSharingTitle => 'Pārtraukt kopīgot atrašanās vietu?';

  @override
  String get tripMapStopSharingMessage =>
      'Visu tavu foto atrašanās vietas šajā grupā tiks dzēstas.';

  @override
  String get tripMapStopSharing => 'Pārtraukt kopīgošanu';
}
