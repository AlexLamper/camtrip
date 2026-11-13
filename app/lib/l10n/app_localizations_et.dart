// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Estonian (`et`).
class AppLocalizationsEt extends AppLocalizations {
  AppLocalizationsEt([String locale = 'et']) : super(locale);

  @override
  String get cancel => 'Tühista';

  @override
  String get yes => 'Jah';

  @override
  String inviteMessageIntro(String groupName) {
    return 'Kas liitud grupiga „$groupName” CamTripis? Siis näeme kohe üksteise pilte.';
  }

  @override
  String inviteMessageCode(String code) {
    return 'Või sisesta kood: $code';
  }

  @override
  String get memberFallbackName => 'Sõber';

  @override
  String get reportReasonInappropriate => 'Sobimatu või solvav';

  @override
  String get reportReasonSpam => 'Rämpspost';

  @override
  String get reportReasonOther => 'Midagi muud';

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
  String get errorOffline => 'Ühendus puudub. Proovi kohe uuesti.';

  @override
  String errorSomethingWrongStatus(int status) {
    return 'Midagi läks valesti ($status)';
  }

  @override
  String get errorSomethingWrong => 'Midagi läks valesti';

  @override
  String get apiInvalidCredentials => 'E-posti aadress või parool on vale';

  @override
  String get apiInvalidCode => 'See kood on vale või aegunud. Küsi uus kood.';

  @override
  String get apiEmailTaken =>
      'Selle e-posti aadressiga konto on juba olemas. Logi sisse või vali „Unustasid parooli?”.';

  @override
  String apiEmailTakenProvider(String provider) {
    return 'Selle e-posti aadressiga konto on juba olemas. Logi sisse teenusega $provider.';
  }

  @override
  String apiWeakPassword(int min) {
    return 'Vali vähemalt $min märgiga parool';
  }

  @override
  String apiNameTooLong(int max) {
    return 'Nimi võib olla kuni $max märki';
  }

  @override
  String get apiRateLimited =>
      'Liiga palju katseid. Proovi 15 minuti pärast uuesti.';

  @override
  String apiAccountBanned(String email) {
    return 'Sinu konto on blokeeritud. Kirjuta aadressile $email, kui arvad, et see on viga.';
  }

  @override
  String get apiProRequired => 'See kaamerastiil kuulub CamTrip Pro hulka';

  @override
  String get apiGroupClosed => 'See grupp on suletud';

  @override
  String get apiGroupCodeNotFound => 'Selle koodiga gruppi ei leitud';

  @override
  String apiGroupFull(int max) {
    return 'Grupp on täis (kuni $max liiget). Kui ühel liikmel on CamTrip Pro, võib liituda igaüks.';
  }

  @override
  String get apiLastMember => 'Oled viimane liige. Kustuta parem grupp.';

  @override
  String get apiAdminRequired => 'Ainult CamTripi administraatoritele';

  @override
  String get apiUploadIncomplete => 'Üleslaadimine pole lõpetatud';

  @override
  String get apiInvalidInput => 'Vigane sisend';

  @override
  String get apiNotSignedIn => 'Pole sisse logitud';

  @override
  String get apiAccountGone => 'Seda kontot enam pole';

  @override
  String get apiPhotoNotFound => 'Pilti ei leitud';

  @override
  String get apiGroupNotFound => 'Gruppi ei leitud';

  @override
  String get apiMemberNotFound => 'Liiget ei leitud';

  @override
  String get apiPersonNotFound => 'Inimest ei leitud';

  @override
  String get apiUserNotFound => 'Kasutajat ei leitud';

  @override
  String get apiAdminOnly => 'Seda saab teha ainult admin';

  @override
  String get apiCannotBlockSelf => 'Iseennast ei saa blokeerida';

  @override
  String get apiCannotReportOwn => 'Oma pilti ei saa teatada';

  @override
  String get apiDeleteOwnOnly => 'Saad kustutada ainult oma pilte';

  @override
  String get apiOwnerCannotBeRemoved => 'Grupi loojat ei saa eemaldada';

  @override
  String get apiOwnerStaysAdmin => 'Looja jääb alati adminiks';

  @override
  String get apiNeedsOneAdmin => 'Grupil peab olema vähemalt üks admin';

  @override
  String get apiEndBeforeStart => 'Lõppkuupäev on enne alguskuupäeva';

  @override
  String get apiPermanentNoEndDate => 'Alati avatud grupil pole lõppkuupäeva';

  @override
  String get apiCannotBanAdmin => 'Administraatorit ei saa blokeerida';

  @override
  String get apiReportNotFound => 'Teadet ei leitud';

  @override
  String get apiPhotoOwnerUnknown => 'Selle pildi tegija pole enam teada';

  @override
  String get validationNameRequired => 'Sisesta oma nimi';

  @override
  String validationMaxChars(int max) {
    return 'Kuni $max märki';
  }

  @override
  String get validationEmailRequired => 'Sisesta oma e-posti aadress';

  @override
  String get validationEmailInvalid => 'See e-posti aadress pole kehtiv';

  @override
  String get validationPasswordRequired => 'Vali parool';

  @override
  String validationMinChars(int min) {
    return 'Vähemalt $min märki';
  }

  @override
  String get validationPasswordTooLong => 'See parool on liiga pikk';

  @override
  String get validationPasswordEmpty => 'Sisesta parool';

  @override
  String get validationCodeRequired => 'Sisesta e-kirjas olev kood';

  @override
  String get validationCodeDigits => 'Koodis on 6 numbrit';

  @override
  String get onboarding1Title => 'Üks film\nkogu seltskonnale.';

  @override
  String get onboarding1Body =>
      'Pildista retrokaameraga. Kõik näevad su pilte kohe ja need on kohe ka sinu enda albumis.';

  @override
  String get onboarding2Title => 'Enam ei pea\npilte saatma.';

  @override
  String get onboarding2Body =>
      'Loo grupp, jaga koodi, valmis. Mitte kunagi enam „saadad mulle need pildid?”';

  @override
  String get onboarding3Title => 'Kokkuvõttevideo\npärast reisi.';

  @override
  String get onboarding3Body =>
      'CamTrip teeb teie parimatest ühistest hetkedest muusikaga video.';

  @override
  String get onboardingInvited => 'Sind kutsuti! Logi sisse, et liituda.';

  @override
  String get signInAppleFailed => 'Apple\'iga sisselogimine ei õnnestunud';

  @override
  String get signInGoogleFailed => 'Google\'iga sisselogimine ei õnnestunud';

  @override
  String get signInFailed => 'Sisselogimine ei õnnestunud';

  @override
  String get next => 'Edasi';

  @override
  String get legalPrefix => 'Jätkates nõustud';

  @override
  String get legalTerms => 'tingimustega';

  @override
  String get legalAnd => ' ja';

  @override
  String get legalPrivacy => 'privaatsuspoliitikaga';

  @override
  String get legalSuffix => '.';

  @override
  String get continueWithApple => 'Jätka Apple\'iga';

  @override
  String get continueWithGoogle => 'Jätka Google\'iga';

  @override
  String get createAccount => 'Loo konto';

  @override
  String get signIn => 'Logi sisse';

  @override
  String get or => 'või';

  @override
  String get registerSubtitle => 'Et sõbrad näeksid, kes pildid tegi.';

  @override
  String get loginSubtitle => 'Tere tulemast tagasi.';

  @override
  String get forgotPasswordTitle => 'Unustasid parooli';

  @override
  String get forgotPasswordPushSubtitle =>
      'Oled kuskil veel sisse logitud? Saadame sinna push-teavitusena 6-kohalise koodi, et saaksid uue parooli määrata.';

  @override
  String get newPassword => 'Uus parool';

  @override
  String get resetPushInfo =>
      'Kui oled kuskil veel sisse logitud, saad sinna koodiga push-teavituse. Ei pääse sisse? Logi sisse Apple\'i või Google\'iga sama e-posti aadressiga - sinu konto ühendatakse.';

  @override
  String get sendCode => 'Saada kood';

  @override
  String get savePassword => 'Salvesta parool';

  @override
  String get errorTryAgain => 'Midagi läks valesti. Proovi uuesti.';

  @override
  String get back => 'Tagasi';

  @override
  String get name => 'Nimi';

  @override
  String get email => 'E-posti aadress';

  @override
  String get codeFromPush => 'Kood teavitusest';

  @override
  String get password => 'Parool';

  @override
  String get hidePassword => 'Peida parool';

  @override
  String get showPassword => 'Näita parooli';

  @override
  String get forgotPasswordLink => 'Unustasid parooli?';

  @override
  String get haveAccount => 'Kas sul on juba konto?';

  @override
  String get newToCamTrip => 'Oled CamTripis uus?';

  @override
  String get rememberedIt => 'Tuli meelde?';

  @override
  String get noCodeReceived => 'Koodi ei tulnud?';

  @override
  String get resendCode => 'Saada uuesti';

  @override
  String onboardingDemoRoll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotograafi, 1 film',
      one: '1 fotograaf, 1 film',
    );
    return '$_temp0';
  }

  @override
  String membersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count liiget',
      one: '1 liige',
    );
    return '$_temp0';
  }

  @override
  String photosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pilti',
      one: '1 pilt',
    );
    return '$_temp0';
  }

  @override
  String videosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count videot',
      one: '1 video',
    );
    return '$_temp0';
  }

  @override
  String get justNow => 'nüüd';

  @override
  String get badgeNew => 'Uus';

  @override
  String recapTitle(String groupName) {
    return 'Kokkuvõte: $groupName';
  }

  @override
  String get styleFilm => 'Film';

  @override
  String get styleInstant => 'Instant';

  @override
  String get styleDisposable => 'Ühekordne';

  @override
  String get styleBw => 'MV';

  @override
  String get styleGolden => 'Golden';

  @override
  String get styleChrome => 'Chrome';

  @override
  String get styleFilmDescription =>
      'Soojad värvid, teralisus ja oranž kuupäev';

  @override
  String get styleInstantDescription => 'Pehmed värvid ja valge ääris';

  @override
  String get styleDisposableDescription =>
      'Terav välk, vinjett ja valguslekked';

  @override
  String get styleBwDescription => 'Teraline mustvalge sügava kontrastiga';

  @override
  String get styleGoldenDescription => 'Alati kuldne tund, pehme kuldne kuma';

  @override
  String get styleChromeDescription =>
      'Jahe, küllastunud ja terav nagu slaidifilm';

  @override
  String get shutterStopRecording => 'Peata salvestamine';

  @override
  String get shutterStartRecording => 'Alusta video salvestamist';

  @override
  String get shutterTakePhoto => 'Tee pilt';

  @override
  String get modePhoto => 'Pilt';

  @override
  String get modeVideo => 'Video';

  @override
  String get cameraNotFound => 'Kaamerat ei leitud';

  @override
  String get cameraAccessNeeded =>
      'CamTrip vajab ligipääsu kaamerale. Lülita see sisse seadetes.';

  @override
  String get cameraStartFailed => 'Kaamerat ei õnnestunud käivitada';

  @override
  String get albumAccessNeeded =>
      'Anna CamTripile ligipääs oma piltidele, et need salvestuksid ka sinu albumisse';

  @override
  String get albumSaveFailed =>
      'Albumisse salvestamine ei õnnestunud. Pilt on siiski jagatud.';

  @override
  String styleProFallback(String style) {
    return 'See stiil kuulub Pro hulka. Selles grupis pildistad stiiliga $style.';
  }

  @override
  String get photoFailed => 'Pildi tegemine ei õnnestunud. Proovi uuesti.';

  @override
  String get recordingFailed => 'Video salvestamine ei õnnestunud';

  @override
  String get videoFailed => 'Video tegemine ei õnnestunud. Proovi uuesti.';

  @override
  String get shootInGroup => 'Pildista gruppi';

  @override
  String get close => 'Sulge';

  @override
  String get flash => 'Välk';

  @override
  String get flashOn => 'Sees';

  @override
  String get flashOff => 'Väljas';

  @override
  String get flashAuto => 'Auto';

  @override
  String get chooseGroup => 'Vali grupp';

  @override
  String get switchCamera => 'Vaheta kaamerat';

  @override
  String get createOrJoinFirst => 'Loo kõigepealt grupp või liitu mõnega';

  @override
  String get proViaGroup => 'Pro grupi kaudu';

  @override
  String proViaName(String name) {
    return 'Pro kasutajalt $name';
  }

  @override
  String get proStylesFreeViaMember =>
      'Pro-stiilid on selles grupis sulle tasuta tänu Pro-liikmele';

  @override
  String proStylesFreeViaName(String name) {
    return 'Pro-stiilid selles grupis: sulle tasuta tänu kasutajale $name';
  }

  @override
  String get subscriptionsUnavailable =>
      'Tellimused pole praegu saadaval. Proovi hiljem uuesti.';

  @override
  String get paymentPending =>
      'Sinu makset alles töödeldakse. Pro lülitub sisse kohe, kui see on valmis.';

  @override
  String get purchaseFailed => 'Ost ei õnnestunud. Proovi hiljem uuesti.';

  @override
  String get restoreUnavailable =>
      'Oste ei saa praegu taastada. Proovi hiljem uuesti.';

  @override
  String get restoreFailed => 'Taastamine ei õnnestunud. Proovi hiljem uuesti.';

  @override
  String get welcomePro => 'Tere tulemast CamTrip Prosse! 🎉';

  @override
  String get proRestored => 'Pro on taastatud';

  @override
  String get noPurchaseFound => 'Varasemat ostu ei leitud';

  @override
  String periodDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count päeva',
      one: '1 päev',
    );
    return '$_temp0';
  }

  @override
  String periodWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nädalat',
      one: '1 nädal',
    );
    return '$_temp0';
  }

  @override
  String periodMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kuud',
      one: '1 kuu',
    );
    return '$_temp0';
  }

  @override
  String periodYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count aastat',
      one: '1 aasta',
    );
    return '$_temp0';
  }

  @override
  String get paywallHavePro => 'Sul on CamTrip Pro';

  @override
  String get paywallSubtitle => 'Kõik su järgmiseks reisiks.';

  @override
  String paywallFeatureStyles(String styles) {
    return 'Kõik kaamerastiilid ($styles)';
  }

  @override
  String get paywallFeatureUnlimited =>
      'Piiramatult liikmeid ja ruumi, pildid jäävad igaveseks';

  @override
  String get paywallFeatureNoWatermark => 'Kokkuvõtted ilma vesimärgita';

  @override
  String get paywallFeatureOriginal => 'Allalaadimine originaalkvaliteedis';

  @override
  String get planYear => 'Aasta';

  @override
  String get planMonth => 'Kuu';

  @override
  String pricePerMonth(String price) {
    return '$price kuus';
  }

  @override
  String paywallSaveBadge(int percent) {
    return 'SÄÄSTA $percent%';
  }

  @override
  String get planMonthCancelAnytime => 'tühista igal ajal';

  @override
  String tryFree(String period) {
    return 'Proovi $period tasuta';
  }

  @override
  String get becomePro => 'Hangi Pro';

  @override
  String get subscriptionsLoadFailed =>
      'Tellimusi ei õnnestunud laadida. Kontrolli ühendust.';

  @override
  String legalAnnual(String price) {
    return 'CamTrip Pro aastatellimus: $price aastas.';
  }

  @override
  String legalAnnualTrial(String period, String price) {
    return 'CamTrip Pro aastatellimus: $period tasuta, seejärel $price aastas.';
  }

  @override
  String legalMonthly(String price) {
    return 'CamTrip Pro kuutellimus: $price kuus.';
  }

  @override
  String legalMonthlyTrial(String period, String price) {
    return 'CamTrip Pro kuutellimus: $period tasuta, seejärel $price kuus.';
  }

  @override
  String get legalBillingApple =>
      'Makse võetakse sinu Apple ID-lt. Tellimus pikeneb automaatselt, kui sa ei tühista seda vähemalt 24 tundi enne perioodi lõppu. Saad seda tühistada ja hallata oma App Store\'i konto seadetes.';

  @override
  String get legalBillingGoogle =>
      'Makse võetakse sinu Google\'i kontolt. Tellimus pikeneb automaatselt, kui sa ei tühista seda vähemalt 24 tundi enne perioodi lõppu. Saad seda tühistada ja hallata oma Google Play konto seadetes.';

  @override
  String get restorePurchases => 'Taasta ostud';

  @override
  String get terms => 'Tingimused';

  @override
  String get privacy => 'Privaatsus';

  @override
  String get groupProTitle => 'Üks Pro grupis = Pro kõigile selles grupis';

  @override
  String get groupProBody =>
      'Kui ühel inimesel on Pro, saab kogu grupp kõik kaamerastiilid, piiramatult liikmeid, säilivad pildid, originaalkvaliteedi ja vesimärgita kokkuvõtted.';

  @override
  String get groupCreated => 'Grupp loodud ✓';

  @override
  String get inviteFriends => 'Kutsu sõbrad';

  @override
  String get codeCopied => 'Kood kopeeritud';

  @override
  String get shareLink => 'Jaga linki';

  @override
  String inviteSubject(String groupName) {
    return 'Liitu grupiga $groupName CamTripis';
  }

  @override
  String inviteMembersUnlimited(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count liiget',
      one: '1 liige',
    );
    return '$_temp0 · piiramatult (Pro)';
  }

  @override
  String inviteMembersLimit(int count, int limit) {
    return '$count/$limit liiget · Pro: piiramatult';
  }

  @override
  String get toCamera => 'Kaamerasse';

  @override
  String get done => 'Valmis';

  @override
  String get joinEnterCode => 'Sisesta 6-märgiline kood';

  @override
  String get joinGroupTitle => 'Liitu grupiga';

  @override
  String get joinGroupSubtitle =>
      'Sisesta sõprade kood või skanni nende QR-kood.';

  @override
  String get typeCode => 'Sisesta kood';

  @override
  String get scanQr => 'Skanni QR';

  @override
  String get join => 'Liitu';

  @override
  String get groupNameRequired => 'Anna grupile nimi';

  @override
  String get newGroup => 'Uus grupp';

  @override
  String get groupType => 'Grupi tüüp';

  @override
  String get groupTypeVacation => 'Puhkus';

  @override
  String get groupTypeVacationDescription =>
      'Algus- ja lõppkuupäevaga, seejärel arhiveeritakse';

  @override
  String get groupTypeEvent => 'Sündmus';

  @override
  String get groupTypeEventDescription => 'Üks päev või õhtu, nt pidu';

  @override
  String get groupTypePermanent => 'Alati avatud';

  @override
  String get groupTypePermanentDescription => 'Sinu püsiva sõpruskonna jaoks';

  @override
  String get date => 'Kuupäev';

  @override
  String get departure => 'Lahkumine';

  @override
  String get returnDate => 'Tagasitulek';

  @override
  String get defaultCameraStyle => 'Vaikimisi kaamerastiil';

  @override
  String freeLimitPermanent(int max) {
    return 'Tasuta: kuni $max liiget. Pro-ga piiramatult.';
  }

  @override
  String freeLimitDated(int max, int days) {
    return 'Tasuta: kuni $max liiget, pildid säilivad $days päeva pärast lõppkuupäeva. Pro-ga piiramatult ja igavesti.';
  }

  @override
  String get createGroup => 'Loo grupp';

  @override
  String get group => 'Grupp';

  @override
  String groupCode(String code) {
    return 'kood $code';
  }

  @override
  String get manage => 'Halda';

  @override
  String get rename => 'Nimeta ümber';

  @override
  String get changeDates => 'Muuda kuupäevi';

  @override
  String get finishTrip => 'Lõpeta reis';

  @override
  String get finishTripSubtitle => 'Lõppkuupäevaks saab täna';

  @override
  String get reopenGroup => 'Ava grupp uuesti';

  @override
  String get closeGroup => 'Sulge grupp';

  @override
  String get reopenGroupSubtitle => 'Liikmed saavad jälle pilte lisada';

  @override
  String get closeGroupSubtitle =>
      'Keegi ei saa enam pilte lisada; kõike saab endiselt vaadata';

  @override
  String get members => 'Liikmed';

  @override
  String memberYou(String name) {
    return '$name (sina)';
  }

  @override
  String get blockedTag => 'blokeeritud';

  @override
  String get adminTag => 'admin';

  @override
  String removeMemberTitle(String name) {
    return 'Eemaldad kasutaja $name?';
  }

  @override
  String get removeMemberMessage => 'Tema pildid jäävad gruppi.';

  @override
  String get remove => 'Kustuta';

  @override
  String get removeMember => 'Eemalda';

  @override
  String blockTitle(String name) {
    return 'Blokeerid kasutaja $name?';
  }

  @override
  String blockMessage(String name) {
    return 'Sa ei näe enam kasutaja $name pilte ja videoid ega saa nende kohta teavitusi. Saad selle seadetes tagasi võtta.';
  }

  @override
  String get block => 'Blokeeri';

  @override
  String get makeMember => 'Tee tavaliikmeks';

  @override
  String get makeAdmin => 'Tee adminiks';

  @override
  String get removeFromGroup => 'Eemalda grupist';

  @override
  String get unblock => 'Tühista blokeering';

  @override
  String get inviteFriendsButton => 'Kutsu sõpru';

  @override
  String get you => 'Sina';

  @override
  String get unarchive => 'Taasta arhiivist';

  @override
  String get archive => 'Arhiveeri';

  @override
  String get unarchiveSubtitle => 'Grupp on jälle su albumite juures';

  @override
  String archiveSubtitle(String section) {
    return 'Ainult sulle: grupp liigub sinu albumite alla jaotisse „$section”';
  }

  @override
  String get archivedSection => 'Arhiveeritud';

  @override
  String get hiddenPhotos => 'Peidetud pildid';

  @override
  String get hiddenPhotosSubtitle => 'Pildid, mille oled enda eest peitnud';

  @override
  String get leaveGroup => 'Lahku grupist';

  @override
  String get leaveGroupSubtitle => 'Sinu pildid jäävad teistele gruppi alles';

  @override
  String get deleteGroup => 'Kustuta grupp';

  @override
  String get deleteGroupSubtitle => 'Kõik pildid kustutatakse kõigi jaoks';

  @override
  String groupArchived(String groupName) {
    return '„$groupName” arhiveeritud';
  }

  @override
  String groupUnarchived(String groupName) {
    return '„$groupName” on jälle su albumite juures';
  }

  @override
  String get undo => 'Võta tagasi';

  @override
  String get groupNameTitle => 'Grupi nimi';

  @override
  String get finishTripTitle => 'Lõpetad reisi?';

  @override
  String get finishTripMessage =>
      'Lõppkuupäevaks saab täna. Pilte saad endiselt lisada; kokkuvõte on valmis.';

  @override
  String get finishTripConfirm => 'Lõpeta';

  @override
  String get tripFinished => 'Reis lõpetatud';

  @override
  String leaveGroupTitle(String groupName) {
    return 'Lahkud grupist „$groupName”?';
  }

  @override
  String get leaveGroupMessage =>
      'Sinu pildid jäävad teistele gruppi alles. Hiljem saad koodiga uuesti liituda.';

  @override
  String get leave => 'Lahku';

  @override
  String groupDeleted(String groupName) {
    return '„$groupName” on kustutatud';
  }

  @override
  String get youAreAdmin => 'oled admin';

  @override
  String get open => 'Ava';

  @override
  String get archiveMenuSubtitle => 'Ainult sulle, teised ei märka';

  @override
  String get deleteGroupMenuSubtitle => 'Kõigile, koos kõigi piltidega';

  @override
  String get deleteGroupTitle => 'Kustutad grupi?';

  @override
  String deleteGroupMessage(int count, String groupName, int memberCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Kõik $count pilti ja videot',
      one: '1 pilt või video',
    );
    String _temp1 = intl.Intl.pluralLogic(
      memberCount,
      locale: localeName,
      other: 'kõigi $memberCount liikme jaoks',
      one: '1 liikme jaoks',
    );
    return '$_temp0 grupis „$groupName” kaovad $_temp1. Seda ei saa tagasi võtta.';
  }

  @override
  String get deleteGroupOwnRoll => 'Sinu enda galerii jääb muutmata.';

  @override
  String get deleteGroupTypeName => 'Kinnitamiseks sisesta grupi nimi:';

  @override
  String get deleteForEveryone => 'Kustuta kõigi jaoks';

  @override
  String get save => 'Salvesta';

  @override
  String get yourAlbums => 'Sinu albumid';

  @override
  String get uploadQueue => 'Üleslaadimise järjekord';

  @override
  String get noConnection => 'Ühendus puudub';

  @override
  String get albumsOfflineMessage =>
      'Albumid laaditakse, kui oled jälle võrgus. Kaamera töötab ikka.';

  @override
  String get retry => 'Proovi uuesti';

  @override
  String get noAlbumsTitle => 'Albumeid veel pole';

  @override
  String get noAlbumsMessage =>
      'Loo grupp oma järgmiseks reisiks või liitu sõbra grupiga tema koodiga.';

  @override
  String get haveCode => 'Mul on kood';

  @override
  String get joinWithCode => 'Liitu koodi või QR-koodiga';

  @override
  String get camera => 'Kaamera';

  @override
  String get restore => 'Taasta';

  @override
  String get more => 'Rohkem';

  @override
  String get newAlbum => 'Uus';

  @override
  String get closedTag => 'suletud';

  @override
  String get activeTag => 'aktiivne';

  @override
  String get uploadFailed => 'Üleslaadimine ebaõnnestus';

  @override
  String get queueNoSignal => 'Levi pole.';

  @override
  String get queueNoSignalMessage =>
      'Sinu pildid on juba albumis ja jagatakse kohe, kui oled jälle võrgus.';

  @override
  String get queueWaitingForWifi => 'Ootab Wi-Fit.';

  @override
  String queueWifiOnlyOn(String setting) {
    return 'Sul on sisse lülitatud „$setting”.';
  }

  @override
  String get queueVideosWifiOnly => 'Videod lähevad ainult Wi-Fi kaudu.';

  @override
  String get queueAllShared => 'Kõik on jagatud ✓';

  @override
  String queuePending(String items) {
    return 'Veel jagada: $items';
  }

  @override
  String queuePendingBoth(String photos, String videos) {
    return 'Veel jagada: $photos ja $videos';
  }

  @override
  String get retryUpload => 'Proovi uuesti';

  @override
  String get removeFromQueue => 'Eemalda järjekorrast';

  @override
  String get queueStatusWifi => 'Wi-Fi';

  @override
  String get queueStatusWaiting => 'ootab';

  @override
  String get videosWifiOnlyTitle => 'Videod ainult Wi-Fi kaudu';

  @override
  String get videosWifiOnlySubtitle => 'Säästab mobiilset andmesidet';

  @override
  String get retryNow => 'Proovi kohe';

  @override
  String get yourName => 'Sinu nimi';

  @override
  String get settings => 'Seaded';

  @override
  String get tapToChangeName => 'Puuduta nime muutmiseks';

  @override
  String get getCamTripPro => 'Hangi CamTrip Pro';

  @override
  String get photos => 'Pildid';

  @override
  String get saveOwnPhotos =>
      'Salvesta mu pildid iga grupi jaoks eraldi albumisse';

  @override
  String get autoSaveOthers => 'Salvesta teiste pildid automaatselt';

  @override
  String get wifiOnlyTitle => 'Laadi üles ainult Wi-Fi kaudu';

  @override
  String get dateStamp => 'Kuupäevatempel';

  @override
  String get notifications => 'Teavitused';

  @override
  String get notifyNewPhotos => 'Uued pildid (koondatult)';

  @override
  String get notifyRecapReady => 'Kokkuvõte valmis';

  @override
  String get camTripTeam => 'CamTripi tiim';

  @override
  String get adminEntrySubtitle =>
      'Kasutajad, Pro andmine, teated ja statistika';

  @override
  String get account => 'Konto';

  @override
  String get manageSubscription => 'Halda tellimust';

  @override
  String get blockedPeople => 'Blokeeritud inimesed';

  @override
  String get nobody => 'Mitte keegi';

  @override
  String peopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count inimest',
      one: '1 inimene',
    );
    return '$_temp0';
  }

  @override
  String get privacyPolicy => 'Privaatsuspoliitika';

  @override
  String get contact => 'Kontakt';

  @override
  String get signOut => 'Logi välja';

  @override
  String get deleteAccount => 'Kustuta konto';

  @override
  String get deleteAccountSubtitle => 'Kustutab sinu konto ja kõik sinu pildid';

  @override
  String get deleteAccountTitle => 'Kustutad konto?';

  @override
  String get deleteAccountMessage =>
      'Sinu konto ning kõik sinu pildid ja videod kustutatakse, ka gruppidest. Tühista aktiivne tellimus App Store\'is või Google Plays.';

  @override
  String get blockedTitle => 'Blokeeritud';

  @override
  String get blockedSubtitle => 'Sa ei näe nende inimeste pilte.';

  @override
  String get blockedNone => 'Sa pole kedagi blokeerinud.';

  @override
  String get unblockShort => 'Tühista';

  @override
  String get groupGone => 'Seda gruppi enam pole või sa pole enam liige.';

  @override
  String photosSavedToAlbum(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pilti salvestati albumisse „$album”',
      one: '1 pilt salvestati albumisse „$album”',
    );
    return '$_temp0';
  }

  @override
  String photosDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pilti kustutatud',
      one: '1 pilt kustutatud',
    );
    return '$_temp0';
  }

  @override
  String photosDeletedSkipped(int count, int skipped) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pilti kustutatud',
      one: '1 pilt kustutatud',
    );
    return '$_temp0, $skipped vahele jäetud';
  }

  @override
  String photosHiddenForYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pilti sinu eest peidetud',
      one: '1 pilt sinu eest peidetud',
    );
    return '$_temp0';
  }

  @override
  String get addedToFavorites => 'Lisatud lemmikutesse';

  @override
  String get removedFromFavorites => 'Eemaldatud lemmikutest';

  @override
  String get photoAccessSettings =>
      'Anna CamTripile seadetes ligipääs oma piltidele';

  @override
  String photosBeingAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Lisatakse $count pilti',
      one: 'Lisatakse 1 pilt',
    );
    return '$_temp0';
  }

  @override
  String photosUnreadable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pilti ei õnnestunud lugeda',
      one: '1 pilti ei õnnestunud lugeda',
    );
    return '$_temp0';
  }

  @override
  String get groupNotLoaded => 'Grupp pole laaditud';

  @override
  String get noFavoritesTitle => 'Lemmikuid veel pole';

  @override
  String get noPhotosTitle => 'Pilte veel pole';

  @override
  String get noFavoritesMessage => 'Puuduta pildil tähte, et see siia lisada.';

  @override
  String get noPhotosMessage =>
      'Tee esimene pilt. Kõik grupis näevad seda kohe.';

  @override
  String get openCamera => 'Ava kaamera';

  @override
  String savingProgress(int done, int total) {
    return 'Salvestamine... $done/$total';
  }

  @override
  String get sharePreparing => 'Ettevalmistus...';

  @override
  String sharingProgress(int done, int total) {
    return 'Ettevalmistus... $done/$total';
  }

  @override
  String get choosePhotos => 'Vali pildid';

  @override
  String selectedCount(int count) {
    return '$count valitud';
  }

  @override
  String get selectNone => 'Tühista valik';

  @override
  String get selectAll => 'Vali kõik';

  @override
  String photosWaitingToShare(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pilti ootab jagamist',
      one: '1 pilt ootab jagamist',
    );
    return '$_temp0';
  }

  @override
  String get recapReadyTitle => 'Sinu kokkuvõte on valmis';

  @override
  String get recapReadySubtitle => 'Muusikaga video sinu reisist';

  @override
  String get watch => 'Vaata';

  @override
  String get makeRecapNow => 'Tee kokkuvõttevideo kohe';

  @override
  String freeGroupDeleteNotice(String date) {
    return 'Tasuta grupp: pildid säilivad kuni $date. Salvesta need või hangi Pro.';
  }

  @override
  String get filterAll => 'Kõik';

  @override
  String get filterFavorites => 'Lemmikud';

  @override
  String get filterPerPerson => 'Inimese järgi';

  @override
  String get filterPerson => 'Inimene';

  @override
  String get select => 'Vali';

  @override
  String get hiddenFilter => 'Peidetud';

  @override
  String get photosBy => 'Pildid kasutajalt...';

  @override
  String get uploadedTag => 'üles laaditud';

  @override
  String get saveAll => 'Salvesta kõik';

  @override
  String get favorite => 'Lemmik';

  @override
  String get unfavorite => 'Eemalda lemmikutest';

  @override
  String get hide => 'Peida';

  @override
  String get delete => 'Kustuta';

  @override
  String deletePhotosTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Kustutad $count pilti?',
      one: 'Kustutad pildi?',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Need kaovad kõigi jaoks grupis. Seda ei saa tagasi võtta.',
      one: 'See kaob kõigi jaoks grupis. Seda ei saa tagasi võtta.',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosNotAllowed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count pilti kuuluvad kellelegi teisele. Need jäävad alles; ainult admin saab need kustutada.',
      one:
          '1 pilt kuulub kellelegi teisele. See jääb alles; ainult admin saab selle kustutada.',
    );
    return '$_temp0';
  }

  @override
  String photosBackInGroup(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pilti on jälle grupis',
      one: '1 pilt on jälle grupis',
    );
    return '$_temp0';
  }

  @override
  String get showAll => 'Näita kõiki';

  @override
  String get hiddenPhotosExplainer =>
      'Ainult sina ei näe neid pilte enam. Teistele grupis on need endiselt olemas.';

  @override
  String get nothingHidden => 'Midagi pole peidetud';

  @override
  String get nothingHiddenMessage => 'Peidetud pildid ilmuvad siia.';

  @override
  String showAgainCount(int count) {
    return 'Näita uuesti ($count)';
  }

  @override
  String get someone => 'Keegi';

  @override
  String get savedToAlbum => 'Salvestatud sinu fotoalbumisse';

  @override
  String get share => 'Jaga';

  @override
  String get shareFailed => 'Jagamine ei õnnestunud';

  @override
  String get reportTitle => 'Miks sa sellest pildist teatad?';

  @override
  String get reportSubtitle =>
      'Vaatame iga teate läbi 24 tunni jooksul. Pilt peidetakse sinu eest kohe.';

  @override
  String get reportThanks => 'Aitäh, vaatame selle üle';

  @override
  String blockMessageAllGroups(String name) {
    return 'Sa ei näe enam kasutaja $name pilte ja videoid üheski grupis ega saa nende kohta teavitusi. Saad selle seadetes tagasi võtta.';
  }

  @override
  String userBlocked(String name) {
    return '$name on blokeeritud';
  }

  @override
  String get videoHiddenForYou => 'Video sinu eest peidetud';

  @override
  String get photoHiddenForYou => 'Pilt sinu eest peidetud';

  @override
  String get setAsCover => 'Määra kaanepildiks';

  @override
  String get coverUpdated => 'Kaanepilt uuendatud';

  @override
  String get hideForMe => 'Peida minu eest';

  @override
  String get hideForMeSubtitle => 'Teised grupis näevad seda endiselt';

  @override
  String get reportPhoto => 'Teata pildist';

  @override
  String blockName(String name) {
    return 'Blokeeri $name';
  }

  @override
  String get forEveryoneInGroup => 'Kõigile grupis';

  @override
  String get videoDeleted => 'Video kustutatud';

  @override
  String get photoDeleted => 'Pilt kustutatud';

  @override
  String get photoAccessToSave =>
      'Anna CamTripile seadetes ligipääs oma piltidele, et neid salvestada';

  @override
  String get phoneFull => 'Telefon on täis';

  @override
  String get albumSaveFailedShort => 'Albumisse salvestamine ei õnnestunud';

  @override
  String get recapTemplateGoldenHour => 'Golden Hour';

  @override
  String get recapTemplateFast => 'Kiire';

  @override
  String get recapTemplateFilmRoll => 'Filmirull';

  @override
  String get recapTemplatePolaroid => 'Polaroid';

  @override
  String get trackSummerEvening => 'Suveõhtu';

  @override
  String get trackGoldenHour => 'Golden Hour';

  @override
  String get trackRoadtrip => 'Autoreis';

  @override
  String get moodWarm => 'soe';

  @override
  String get moodCheerful => 'rõõmus';

  @override
  String friendsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sõpra',
      one: '1 sõber',
    );
    return '$_temp0';
  }

  @override
  String get madeWithCamTrip => 'Tehtud CamTripiga';

  @override
  String get tagline => 'Üks film kogu seltskonnale';

  @override
  String get videoUnsupportedDevice =>
      'Selles seadmes ei õnnestunud videot teha';

  @override
  String get groupLoadFailed => 'Seda gruppi ei õnnestunud laadida.';

  @override
  String recapNeedsPhotos(int count) {
    return 'Kokkuvõtteks on vaja vähemalt $count pilti.';
  }

  @override
  String get recapFailed => 'Kokkuvõtte tegemine ei õnnestunud. Proovi uuesti.';

  @override
  String get recapSaved => 'Kokkuvõte salvestati sinu fotoalbumisse';

  @override
  String get recap => 'Kokkuvõte';

  @override
  String get recapRendering => 'Kokkuvõtte tegemine...';

  @override
  String get videoRendering => 'Video tegemine...';

  @override
  String get template => 'Mall';

  @override
  String get musicLicense => 'CamTripi enda muusika · autoritasuta';

  @override
  String get change => 'Muuda';

  @override
  String get noWatermark => 'Vesimärgita ✓';

  @override
  String get removeWatermarkPro => 'Eemalda vesimärk Pro-ga';

  @override
  String get proSourceSubscription => 'Tellimus';

  @override
  String get proSourceGift => 'Kingitus';

  @override
  String get proSourceAdmin => 'Admin';

  @override
  String get proSourceGroup => 'Grupi kaudu';

  @override
  String get noPro => 'Pro puudub';

  @override
  String proStatusNoEnd(String source) {
    return 'Pro ($source), lõppkuupäevata';
  }

  @override
  String proStatusUntil(String source, String date) {
    return 'Pro ($source), kuni $date';
  }

  @override
  String get lifetime => 'Eluaegne';

  @override
  String get pickDate => 'Vali kuupäev';

  @override
  String get noAccess => 'Ligipääs puudub';

  @override
  String get adminOnlyTeam => 'Haldus on ainult CamTripi tiimile.';

  @override
  String get adminOverview => 'Ülevaade';

  @override
  String get adminUsers => 'Kasutajad';

  @override
  String get adminReports => 'Teated';

  @override
  String adminsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count adminit',
      one: '1 admin',
    );
    return '$_temp0';
  }

  @override
  String get adminNewThisWeek => 'Uued sel nädalal';

  @override
  String get adminGroups => 'Grupid';

  @override
  String get adminProSubscription => 'Pro tellimusega';

  @override
  String get adminProGift => 'Pro kingitusena';

  @override
  String adminWithoutSubscription(int count) {
    return '$count ilma tellimuseta';
  }

  @override
  String get adminOpenReports => 'Avatud teated';

  @override
  String get adminSearchHint => 'Otsi nime või e-posti järgi';

  @override
  String get nobodyFound => 'Kedagi ei leitud';

  @override
  String get loadMore => 'Laadi rohkem';

  @override
  String get noEmail => 'E-post puudub';

  @override
  String adminDeletePhotoMessage(String groupName) {
    return 'Pilt kaob kõigi jaoks grupis „$groupName”. Kõik selle pildi teated lahendatakse.';
  }

  @override
  String get adminBanMessage =>
      'See konto ei saa enam sisse logida ega rakendust kasutada. Saad selle hiljem tagasi võtta.';

  @override
  String get adminDismissTitle => 'Lükkad teate tagasi?';

  @override
  String get adminDismissMessage =>
      'Pilt jääb alles. Teade märgitakse lahendatuks.';

  @override
  String get adminDismiss => 'Lükka tagasi';

  @override
  String get adminAccountBlocked => 'Konto blokeeritud';

  @override
  String get adminReportDismissed => 'Teade tagasi lükatud';

  @override
  String get adminNoReports => 'Avatud teateid pole';

  @override
  String get adminNoReportsMessage => 'Teatatud pildid ilmuvad siia.';

  @override
  String get deletedTag => 'Kustutatud';

  @override
  String adminReportedBy(String name) {
    return 'Teataja: $name';
  }

  @override
  String adminPhotoBy(String name) {
    return 'Pildi tegi $name';
  }

  @override
  String reportsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count teadet',
      one: '1 teade',
    );
    return '$_temp0';
  }

  @override
  String get adminDeletePhoto => 'Kustuta pilt';

  @override
  String get adminBlockCreator => 'Blokeeri tegija';

  @override
  String get loadFailed => 'Laadimine ei õnnestunud';

  @override
  String get adminLifetimeProGiven => 'Eluaegne Pro antud';

  @override
  String get adminProGiven => 'Pro antud';

  @override
  String adminGiveProUntil(String date) {
    return 'Anna Pro kuni $date';
  }

  @override
  String get adminGiveProLifetime => 'Anna eluaegne Pro';

  @override
  String adminGiveProFor(String period) {
    return 'Anna Pro: $period';
  }

  @override
  String get adminReasonHint => 'Põhjus, nt sõber, testija, mõjuisik';

  @override
  String get adminGivePro => 'Anna Pro';

  @override
  String get adminRevokeTitle => 'Võtad kingituse tagasi?';

  @override
  String get adminRevokeMessage =>
      'Kingitud Pro lõpeb kohe. Nende oma tellimus jätkub.';

  @override
  String get adminRevoke => 'Võta tagasi';

  @override
  String get adminGiftRevoked => 'Kingitus tagasi võetud';

  @override
  String get adminUnbanTitle => 'Tühistad blokeeringu?';

  @override
  String adminUnbanMessage(String name) {
    return '$name saab jälle sisse logida.';
  }

  @override
  String get adminUnbanned => 'Blokeering tühistatud';

  @override
  String get adminBanUserMessage =>
      'See konto ei saa enam sisse logida ega rakendust kasutada. Pildid jäävad alles.';

  @override
  String get adminUser => 'Kasutaja';

  @override
  String get adminNotVerified => 'kinnitamata';

  @override
  String get adminRole => 'Roll';

  @override
  String get adminCreated => 'Loodud';

  @override
  String get unknown => 'Teadmata';

  @override
  String get adminSignInWith => 'Logib sisse';

  @override
  String get adminEmailMethod => 'E-post';

  @override
  String get adminPhotosAndVideos => 'Pildid ja videod';

  @override
  String get adminStatus => 'Olek';

  @override
  String get adminActive => 'Aktiivne';

  @override
  String adminActiveUntil(String date) {
    return 'Aktiivne kuni $date';
  }

  @override
  String adminGiftFrom(String name) {
    return 'Kingitus kasutajalt $name';
  }

  @override
  String adminExpiredOn(String date) {
    return 'Aegus $date';
  }

  @override
  String get adminExpired => 'Aegunud';

  @override
  String adminUntil(String date) {
    return 'Kuni $date';
  }

  @override
  String get adminGiveProTitle => 'Anna Pro';

  @override
  String get adminGiveProNote =>
      'Kehtib ka selle inimese gruppides: üks Pro grupis = Pro kõigile selles grupis.';

  @override
  String get adminRevokeGift => 'Võta kingitus tagasi';

  @override
  String get adminModeration => 'Modereerimine';

  @override
  String get adminCannotBanSelf => 'Iseennast ei saa blokeerida.';

  @override
  String get adminCannotBanAdmin => 'Adminit ei saa blokeerida.';

  @override
  String get adminUnban => 'Tühista blokeering';

  @override
  String get adminBanAccount => 'Blokeeri konto';

  @override
  String get googleSignInUnavailable =>
      'Google\'iga sisselogimine pole veel saadaval';

  @override
  String get cameraPickerTitle => 'Vali oma kaamera';

  @override
  String get cameraPickerSubtitle => 'Iga kaamera annab su piltidele oma ilme';

  @override
  String get cameraPickerChange => 'Vaheta kaamerat';

  @override
  String get cameraPickerUnlock => 'Ava Pro-ga';

  @override
  String get cameraPickerSelected => 'Valitud';

  @override
  String get cameraPickerStyleSummer => 'Suvi';

  @override
  String get cameraPickerStyleSummerDescription =>
      'Soojad, pleekinud värvid nagu 90ndate klõpsul';

  @override
  String get cameraPickerStyleNight => 'Öö 800';

  @override
  String get cameraPickerStyleNightDescription =>
      'Kinofilm: sinakasrohelised varjud, soe valgus, palju teralisust';

  @override
  String get cameraPickerStyleSepia => 'Seepia';

  @override
  String get cameraPickerStyleSepiaDescription =>
      'Vana pruun foto kingakarbist';

  @override
  String get cameraPickerStyleLomo => 'Lomo';

  @override
  String get cameraPickerStyleLomoDescription =>
      'Erksad värvid, tumedad nurgad ja metsik värvitoon';

  @override
  String get cameraPickerStyleMint => 'Münt';

  @override
  String get cameraPickerStyleMintDescription =>
      'Pehme ja värske rohelise tooniga';

  @override
  String get cameraPickerStylePastel => 'Roosa';

  @override
  String get cameraPickerStylePastelDescription =>
      'Pastelsed värvid roosa kuma ja valge äärisega';

  @override
  String get cameraPickerStyleSuper8 => 'Super 8';

  @override
  String get cameraPickerStyleSuper8Description =>
      'Teraline ja pehme nagu vana koduvideo';

  @override
  String get paywallBenefitGroup => 'Üks Pro = Pro kogu grupile';

  @override
  String get paywallBenefitUnlimited =>
      'Piiramatult liikmeid, pildid jäävad igaveseks';

  @override
  String get paywallBenefitQuality => 'Vesimärgita, originaalkvaliteet';

  @override
  String paywallFreeTrial(String period) {
    return '$period tasuta';
  }

  @override
  String paywallPriceYear(String price) {
    return '$price aastas.';
  }

  @override
  String paywallPriceYearTrial(String period, String price) {
    return '$period tasuta, seejärel $price aastas.';
  }

  @override
  String paywallPriceMonth(String price) {
    return '$price kuus.';
  }

  @override
  String paywallPriceMonthTrial(String period, String price) {
    return '$period tasuta, seejärel $price kuus.';
  }

  @override
  String paywallAutoRenew(String store) {
    return 'Pikeneb automaatselt. Tühista vähemalt 24 tundi enne pikenemist: $store.';
  }

  @override
  String get paywallDetailsTitle => 'Kõik, mis Pro-s on';

  @override
  String get paywallBenefitStyles => 'Kõik kaamerastiilid';

  @override
  String get allPhotosTitle => 'Kõik pildid';

  @override
  String get homeTabAlbums => 'Albumid';

  @override
  String get allPhotosEmptyTitle => 'Pilte veel pole';

  @override
  String get allPhotosEmptyMessage => 'Ava kaamera ja tee oma esimene pilt.';

  @override
  String get allPhotosLoadFailed => 'Sinu pilte ei õnnestunud laadida';

  @override
  String get cameraSettingsTitle => 'Kaamera seaded';

  @override
  String get cameraSettingsMore => 'Rohkem seadeid';

  @override
  String get cameraSettingsGrid => 'Ruudustik';

  @override
  String get cameraSettingsHaptics => 'Vibreeri pildistamisel';

  @override
  String get cameraSettingsDateStamp => 'Kuupäev all paremal';

  @override
  String get cameraSettingsSound => 'Katiku heli';

  @override
  String get cameraSettingsSoundHint => 'Vaikne, kui telefon on hääletu';

  @override
  String get cameraSettingsTimer => 'Taimer';

  @override
  String get cameraSettingsTimerOff => 'Väljas';

  @override
  String cameraSettingsTimerSeconds(int seconds) {
    return '$seconds s';
  }

  @override
  String get cameraSettingsTimerCancelHint => 'Tühistamiseks puuduta katikut';

  @override
  String get cameraSettingsMirror => 'Peegelda selfisid';

  @override
  String get cameraSettingsSaveToRoll => 'Salvesta galeriisse';

  @override
  String get cameraSettingsQuality => 'Kvaliteet';

  @override
  String get cameraSettingsQualityStandard => 'Tavaline';

  @override
  String get cameraSettingsQualityHigh => 'Kõrge';

  @override
  String get cameraLowLightHint => 'Vähe valgust - lülita välk sisse';

  @override
  String get cameraFlashUnavailable => 'Sellel kaameral pole välku';

  @override
  String get cameraFlashScreen => 'Ekraanivälk';

  @override
  String get cameraFlashCycleHint =>
      'Puuduta, et vahetada: väljas, sees ja auto';

  @override
  String get cameraFlip => 'Vaheta esi- ja tagakaamera vahel';

  @override
  String get cameraFlipHint => 'Kaamera pööramiseks topeltpuuduta pildiotsijat';

  @override
  String cameraPickerPaywallStyles(int count, String styles) {
    return 'Kõik $count kaamerat, sh $styles';
  }

  @override
  String get styleFlash => 'Välk 400';

  @override
  String get styleFlashDescription =>
      'Otsene välk soojal filmil: merevaigune kuma, teralisus, rikkalikud punased';

  @override
  String cameraTimerButton(String state) {
    return 'Taimer: $state';
  }

  @override
  String get cameraTimerCycleHint =>
      'Puuduta, et vahetada: väljas, 3 s ja 10 s';

  @override
  String get cameraLastShotOpen => 'Viimane pilt, avab albumi';

  @override
  String get cameraLastShotEmpty => 'Pilte veel pole, avab albumi';

  @override
  String get deleteOnlyOwnOrAdmin =>
      'Seda saab kustutada ainult pildistaja või admin';

  @override
  String get videoPlay => 'Esita';

  @override
  String get videoPause => 'Paus';

  @override
  String get language => 'Keel';

  @override
  String get languageSystem => 'Süsteemi keel';

  @override
  String languageSystemCurrent(String language) {
    return 'Süsteem ($language)';
  }

  @override
  String get languageSearchHint => 'Otsi keelt';

  @override
  String get languageNoResults => 'Keelt ei leitud';

  @override
  String get personalRollTitle => 'Minu film';

  @override
  String get personalRollSubtitle => 'Ainult sulle';

  @override
  String get personalRollPickerSubtitle => 'Üksikud fotod, ainult sulle';

  @override
  String get personalRollMove => 'Albumisse';

  @override
  String get personalRollMoveTitle => 'Teisalda albumisse';

  @override
  String get personalRollMoveNoAlbums =>
      'Loo esmalt album või liitu mõnega koodiga.';

  @override
  String personalRollMoved(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotot teisaldati albumisse $album',
      one: '1 foto teisaldati albumisse $album',
    );
    return '$_temp0';
  }

  @override
  String get personalRollPrivateNote =>
      'Neid fotosid näed ainult sina. Jagamiseks teisalda need albumisse.';

  @override
  String get paywallTripPassSub => 'Ainult see reis, kogu grupile';

  @override
  String get paywallOneTime => 'ühekordne';

  @override
  String get paywallBestValue => 'Parim hind';

  @override
  String paywallRollFullTitle(int used, int limit) {
    return 'Su film on täis - $used/$limit fotot';
  }

  @override
  String get paywallRollFullSub => 'Pildista edasi Trip Passi või Proga.';

  @override
  String get paywallCameraTitle => 'See kaamera kuulub Pro alla';

  @override
  String paywallCameraSub(int count) {
    return 'Ava kõik $count kaamerat.';
  }

  @override
  String get paywallWatermarkTitle => 'Recap ilma vesimärgita';

  @override
  String get paywallWatermarkSub => 'Jaga recapi ilma CamTripi logota.';

  @override
  String get paywallDeletionTitle => 'Hoia oma reis alles';

  @override
  String paywallDeletionSub(String date) {
    return 'Tasuta reisid kustutatakse $date. Trip Passi või Proga jääb see igaveseks.';
  }

  @override
  String paywallTripPassTerms(String price) {
    return 'Ühekordne ost $price selle reisi jaoks. Pole tellimus.';
  }

  @override
  String get buyTripPass => 'Osta Trip Pass';

  @override
  String get tripPassActive => 'Trip Pass aktiivne: reis on kõigile Pro';

  @override
  String get tripPassActivating => 'Makse käes. Trip Pass on kohe aktiivne.';

  @override
  String proViaTripPass(String name) {
    return 'Trip Pass: $name';
  }

  @override
  String rollCounterSemantics(int used, int limit) {
    return '$used/$limit kaadrit su filmil';
  }

  @override
  String rollHeldTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotot ei mahu enam filmile',
      one: '1 foto ei mahu enam filmile',
    );
    return '$_temp0';
  }

  @override
  String get rollHeldBody => 'Hoia need alles Pro või Trip Passiga';

  @override
  String deletionBannerTitle(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Hoia oma reis alles - $days päeva jäänud',
      one: 'Hoia oma reis alles - 1 päev jäänud',
    );
    return '$_temp0';
  }

  @override
  String get deletionBannerBody =>
      'Tasuta reisid kustutatakse 30 päeva pärast lõppu. Trip Passi või Proga jääb see igaveseks.';

  @override
  String apiRollFull(int limit) {
    return 'Su film on täis ($limit kaadrit). Võta Trip Pass või Pro, et jätkata.';
  }

  @override
  String get apiTripPassFailed =>
      'Trip Passi ei õnnestunud aktiveerida. Kirjuta support@camtrip.app.';

  @override
  String get apiTripPassExists => 'Sellel reisil on juba Trip Pass.';

  @override
  String get tripPassUnavailable =>
      'Trip Pass pole praegu saadaval. Proovi hiljem.';

  @override
  String get tripMapTitle => 'Reisikaart';

  @override
  String get tripMapOpen => 'Kaart ja statistika';

  @override
  String get tripMapLoadFailed => 'Kaarti ei õnnestunud laadida';

  @override
  String get tripMapStatDays => 'Päevad';

  @override
  String get tripMapStatPhotos => 'Fotod';

  @override
  String get tripMapStatVideos => 'Videod';

  @override
  String get tripMapStatMembers => 'Liikmed';

  @override
  String get tripMapStatDistance => 'läbitud km';

  @override
  String get tripMapStatCountries => 'Riigid';

  @override
  String get tripMapStatPlaces => 'Kohad';

  @override
  String tripMapBusiestDay(String day, int count) {
    return 'Kõige rohkem fotosid: $day ($count)';
  }

  @override
  String tripMapTopPhotographer(String name, int count) {
    return 'Parim fotograaf: $name ($count)';
  }

  @override
  String get tripMapOffTitle => 'Reisikaart on välja lülitatud';

  @override
  String get tripMapOffMessage =>
      'Administraator saab kaardi grupi seadetes sisse lülitada. Statistikat näed alati.';

  @override
  String get tripMapOffMessageAdmin =>
      'Lülita kaart sisse, et näha, kus teie fotod tehti. Igaüks otsustab ise, kas osaleb.';

  @override
  String get tripMapEnable => 'Lülita kaart sisse';

  @override
  String get tripMapEmptyTitle => 'Kaardil pole veel kohti';

  @override
  String get tripMapEmptyMessage =>
      'Asukohta jagavate liikmete uued fotod ilmuvad siia, ümardatuna umbes 100 m täpsusega.';

  @override
  String get tripMapConsentTitle => 'Reisikaart';

  @override
  String get tripMapConsentQuestion =>
      'Kas jagada selle grupi kaardil, kus su fotod tehti?';

  @override
  String get tripMapConsentDetail =>
      'Seda näevad ainult grupi liikmed, ümardatuna umbes 100 m täpsusega. Asukohta ei salvestata kunagi fotosse endasse ja saad selle igal ajal grupi seadetes välja lülitada.';

  @override
  String get tripMapConsentYes => 'Jah, jaga';

  @override
  String get tripMapConsentNo => 'Ei';

  @override
  String get tripMapLocationDenied =>
      'Puudub juurdepääs su asukohale. Saad selle lubada telefoni seadetes.';

  @override
  String get tripMapSettingSubtitle =>
      'Näitab kaardil, kus fotod tehti. Liikmed otsustavad ise, kas jagada.';

  @override
  String get tripMapDisableTitle => 'Kas lülitada kaart välja?';

  @override
  String get tripMapDisableMessage =>
      'Kõik selle grupi asukohad kustutatakse. Kui lülitad kaardi hiljem uuesti sisse, küsime kõigilt uuesti.';

  @override
  String get tripMapDisable => 'Lülita välja';

  @override
  String get tripMapMySharing => 'Jaga minu asukohta';

  @override
  String get tripMapMySharingOn =>
      'Su uued fotod ilmuvad kaardile (ümardatuna umbes 100 m täpsusega).';

  @override
  String get tripMapMySharingOff => 'Väljas. Su fotod kaardile ei ilmu.';

  @override
  String get tripMapStopSharingTitle => 'Kas lõpetada asukoha jagamine?';

  @override
  String get tripMapStopSharingMessage =>
      'Kõigi su selle grupi fotode asukohad kustutatakse.';

  @override
  String get tripMapStopSharing => 'Lõpeta jagamine';
}
