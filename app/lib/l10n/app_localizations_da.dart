// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Danish (`da`).
class AppLocalizationsDa extends AppLocalizations {
  AppLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get cancel => 'Annuller';

  @override
  String get yes => 'Ja';

  @override
  String inviteMessageIntro(String groupName) {
    return 'Er du med i \"$groupName\" på CamTrip? Så ser vi hinandens billeder med det samme.';
  }

  @override
  String inviteMessageCode(String code) {
    return 'Eller indtast koden: $code';
  }

  @override
  String get memberFallbackName => 'Ven';

  @override
  String get reportReasonInappropriate => 'Upassende eller stødende';

  @override
  String get reportReasonSpam => 'Spam';

  @override
  String get reportReasonOther => 'Noget andet';

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
  String get errorOffline => 'Ingen forbindelse. Prøv igen om lidt.';

  @override
  String errorSomethingWrongStatus(int status) {
    return 'Noget gik galt ($status)';
  }

  @override
  String get errorSomethingWrong => 'Noget gik galt';

  @override
  String get apiInvalidCredentials => 'Forkert e-mailadresse eller adgangskode';

  @override
  String get apiInvalidCode =>
      'Koden er forkert eller udløbet. Bed om en ny kode.';

  @override
  String get apiEmailTaken =>
      'Der findes allerede en konto med denne e-mailadresse. Log ind, eller vælg \"Glemt adgangskode?\".';

  @override
  String apiEmailTakenProvider(String provider) {
    return 'Der findes allerede en konto med denne e-mailadresse. Log ind med $provider.';
  }

  @override
  String apiWeakPassword(int min) {
    return 'Vælg en adgangskode på mindst $min tegn';
  }

  @override
  String apiNameTooLong(int max) {
    return 'Dit navn må højst være $max tegn';
  }

  @override
  String get apiRateLimited => 'For mange forsøg. Prøv igen om et kvarter.';

  @override
  String apiAccountBanned(String email) {
    return 'Din konto er blevet blokeret. Kontakt $email, hvis du mener, det er en fejl.';
  }

  @override
  String get apiProRequired => 'Denne kamerastil hører til CamTrip Pro';

  @override
  String get apiGroupClosed => 'Denne gruppe er lukket';

  @override
  String get apiGroupCodeNotFound => 'Ingen gruppe fundet med denne kode';

  @override
  String apiGroupFull(int max) {
    return 'Gruppen er fuld (maks. $max medlemmer). Hvis ét medlem har CamTrip Pro, kan alle komme med.';
  }

  @override
  String get apiLastMember => 'Du er det sidste medlem. Slet gruppen i stedet.';

  @override
  String get apiAdminRequired => 'Kun for CamTrips administratorer';

  @override
  String get apiUploadIncomplete => 'Uploaden er ikke færdig';

  @override
  String get apiInvalidInput => 'Ugyldigt input';

  @override
  String get apiNotSignedIn => 'Ikke logget ind';

  @override
  String get apiAccountGone => 'Kontoen findes ikke længere';

  @override
  String get apiPhotoNotFound => 'Billedet blev ikke fundet';

  @override
  String get apiGroupNotFound => 'Gruppen blev ikke fundet';

  @override
  String get apiMemberNotFound => 'Medlemmet blev ikke fundet';

  @override
  String get apiPersonNotFound => 'Personen blev ikke fundet';

  @override
  String get apiUserNotFound => 'Brugeren blev ikke fundet';

  @override
  String get apiAdminOnly => 'Kun en admin kan gøre det';

  @override
  String get apiCannotBlockSelf => 'Du kan ikke blokere dig selv';

  @override
  String get apiCannotReportOwn => 'Du kan ikke anmelde dit eget billede';

  @override
  String get apiDeleteOwnOnly => 'Du kan kun slette dine egne billeder';

  @override
  String get apiOwnerCannotBeRemoved =>
      'Den, der oprettede gruppen, kan ikke fjernes';

  @override
  String get apiOwnerStaysAdmin =>
      'Den, der oprettede gruppen, forbliver admin';

  @override
  String get apiNeedsOneAdmin => 'En gruppe skal have mindst én admin';

  @override
  String get apiEndBeforeStart => 'Slutdatoen ligger før startdatoen';

  @override
  String get apiPermanentNoEndDate =>
      'En gruppe, der altid er åben, har ingen slutdato';

  @override
  String get apiCannotBanAdmin => 'En administrator kan ikke blokeres';

  @override
  String get apiReportNotFound => 'Anmeldelsen blev ikke fundet';

  @override
  String get apiPhotoOwnerUnknown =>
      'Det vides ikke længere, hvem der tog billedet';

  @override
  String get validationNameRequired => 'Skriv dit navn';

  @override
  String validationMaxChars(int max) {
    return 'Højst $max tegn';
  }

  @override
  String get validationEmailRequired => 'Skriv din e-mailadresse';

  @override
  String get validationEmailInvalid => 'E-mailadressen er ikke gyldig';

  @override
  String get validationPasswordRequired => 'Vælg en adgangskode';

  @override
  String validationMinChars(int min) {
    return 'Mindst $min tegn';
  }

  @override
  String get validationPasswordTooLong => 'Adgangskoden er for lang';

  @override
  String get validationPasswordEmpty => 'Skriv din adgangskode';

  @override
  String get validationCodeRequired => 'Indtast koden fra mailen';

  @override
  String get validationCodeDigits => 'Koden består af 6 cifre';

  @override
  String get onboarding1Title => 'Én filmrulle\ntil hele flokken.';

  @override
  String get onboarding1Body =>
      'Tag billeder med et retrokamera. Alle ser dine billeder med det samme, og de ligger også i dit eget album.';

  @override
  String get onboarding2Title => 'Slut med at\nsende billeder rundt.';

  @override
  String get onboarding2Body =>
      'Opret en gruppe, del koden, færdig. Aldrig mere \"gider du lige sende de billeder?\"';

  @override
  String get onboarding3Title => 'Bagefter en\ntilbageblik-video.';

  @override
  String get onboarding3Body =>
      'CamTrip laver en video med musik af jeres bedste øjeblikke.';

  @override
  String get onboardingInvited => 'Du er inviteret! Log ind for at være med.';

  @override
  String get signInAppleFailed => 'Login med Apple mislykkedes';

  @override
  String get signInGoogleFailed => 'Login med Google mislykkedes';

  @override
  String get signInFailed => 'Login mislykkedes';

  @override
  String get next => 'Videre';

  @override
  String get legalPrefix => 'Ved at fortsætte accepterer du ';

  @override
  String get legalTerms => 'vilkårene';

  @override
  String get legalAnd => ' og ';

  @override
  String get legalPrivacy => 'privatlivspolitikken';

  @override
  String get legalSuffix => '.';

  @override
  String get continueWithApple => 'Fortsæt med Apple';

  @override
  String get continueWithGoogle => 'Fortsæt med Google';

  @override
  String get createAccount => 'Opret konto';

  @override
  String get signIn => 'Log ind';

  @override
  String get or => 'eller';

  @override
  String get registerSubtitle =>
      'Så kan dine venner se, hvem der tager billederne.';

  @override
  String get loginSubtitle => 'Velkommen tilbage.';

  @override
  String get forgotPasswordTitle => 'Glemt adgangskode';

  @override
  String get forgotPasswordPushSubtitle =>
      'Er du stadig logget ind et sted? Så sender vi en 6-cifret kode dertil som en notifikation, så du kan vælge en ny adgangskode.';

  @override
  String get newPassword => 'Ny adgangskode';

  @override
  String get resetPushInfo =>
      'Hvis du stadig er logget ind et sted, får du en notifikation med en kode der. Kan du ikke komme ind? Log ind med Apple eller Google med den samme e-mailadresse - så bliver din konto forbundet.';

  @override
  String get sendCode => 'Send kode';

  @override
  String get savePassword => 'Gem adgangskode';

  @override
  String get errorTryAgain => 'Noget gik galt. Prøv igen.';

  @override
  String get back => 'Tilbage';

  @override
  String get name => 'Navn';

  @override
  String get email => 'E-mailadresse';

  @override
  String get codeFromPush => 'Kode fra notifikationen';

  @override
  String get password => 'Adgangskode';

  @override
  String get hidePassword => 'Skjul adgangskode';

  @override
  String get showPassword => 'Vis adgangskode';

  @override
  String get forgotPasswordLink => 'Glemt adgangskode?';

  @override
  String get haveAccount => 'Har du allerede en konto?';

  @override
  String get newToCamTrip => 'Ny på CamTrip?';

  @override
  String get rememberedIt => 'Kan du huske den igen?';

  @override
  String get noCodeReceived => 'Fik du ingen kode?';

  @override
  String get resendCode => 'Send igen';

  @override
  String onboardingDemoRoll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotografer, 1 filmrulle',
      one: '1 fotograf, 1 filmrulle',
    );
    return '$_temp0';
  }

  @override
  String membersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count medlemmer',
      one: '1 medlem',
    );
    return '$_temp0';
  }

  @override
  String photosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count billeder',
      one: '1 billede',
    );
    return '$_temp0';
  }

  @override
  String videosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count videoer',
      one: '1 video',
    );
    return '$_temp0';
  }

  @override
  String get justNow => 'nu';

  @override
  String get badgeNew => 'Ny';

  @override
  String recapTitle(String groupName) {
    return 'Tilbageblik $groupName';
  }

  @override
  String get styleFilm => 'Film';

  @override
  String get styleInstant => 'Instant';

  @override
  String get styleDisposable => 'Engangs';

  @override
  String get styleBw => 'S/H';

  @override
  String get styleGolden => 'Golden';

  @override
  String get styleChrome => 'Chrome';

  @override
  String get styleFilmDescription =>
      'Varme farver, korn og et orange datostempel';

  @override
  String get styleInstantDescription => 'Bløde farver og en hvid kant';

  @override
  String get styleDisposableDescription => 'Hård blitz, vignet og lyslæk';

  @override
  String get styleBwDescription => 'Kornet sort-hvid med dyb kontrast';

  @override
  String get styleGoldenDescription =>
      'Altid golden hour, et blødt gyldent skær';

  @override
  String get styleChromeDescription => 'Kølig, mættet og skarp som diasfilm';

  @override
  String get shutterStopRecording => 'Stop optagelse';

  @override
  String get shutterStartRecording => 'Start videooptagelse';

  @override
  String get shutterTakePhoto => 'Tag billede';

  @override
  String get modePhoto => 'Foto';

  @override
  String get modeVideo => 'Video';

  @override
  String get cameraNotFound => 'Intet kamera fundet';

  @override
  String get cameraAccessNeeded =>
      'CamTrip skal have adgang til dit kamera. Slå det til i Indstillinger.';

  @override
  String get cameraStartFailed => 'Kameraet kunne ikke starte';

  @override
  String get albumAccessNeeded =>
      'Giv CamTrip adgang til dine billeder for også at gemme dem i dit album';

  @override
  String get albumSaveFailed =>
      'Gem i albummet mislykkedes. Billedet bliver stadig delt.';

  @override
  String styleProFallback(String style) {
    return 'Denne stil hører til Pro. I denne gruppe fotograferer du med $style.';
  }

  @override
  String get photoFailed => 'Billedet blev ikke taget. Prøv igen.';

  @override
  String get recordingFailed => 'Videooptagelsen mislykkedes';

  @override
  String get videoFailed => 'Videoen kunne ikke laves. Prøv igen.';

  @override
  String get shootInGroup => 'Fotografér i gruppe';

  @override
  String get close => 'Luk';

  @override
  String get flash => 'Blitz';

  @override
  String get flashOn => 'Til';

  @override
  String get flashOff => 'Fra';

  @override
  String get flashAuto => 'Auto';

  @override
  String get chooseGroup => 'Vælg gruppe';

  @override
  String get switchCamera => 'Skift kamera';

  @override
  String get createOrJoinFirst => 'Opret eller deltag i en gruppe først';

  @override
  String get proViaGroup => 'Pro via gruppen';

  @override
  String proViaName(String name) {
    return 'Pro via $name';
  }

  @override
  String get proStylesFreeViaMember =>
      'Pro-stilarter i denne gruppe er gratis for dig takket være et Pro-medlem';

  @override
  String proStylesFreeViaName(String name) {
    return 'Pro-stilarter i denne gruppe: gratis for dig takket være $name';
  }

  @override
  String get subscriptionsUnavailable =>
      'Abonnementer er ikke tilgængelige lige nu. Prøv igen senere.';

  @override
  String get paymentPending =>
      'Din betaling bliver stadig behandlet. Pro slås til, så snart den er gennemført.';

  @override
  String get purchaseFailed => 'Købet mislykkedes. Prøv igen senere.';

  @override
  String get restoreUnavailable =>
      'Køb kan ikke gendannes lige nu. Prøv igen senere.';

  @override
  String get restoreFailed => 'Gendannelsen mislykkedes. Prøv igen senere.';

  @override
  String get welcomePro => 'Velkommen til CamTrip Pro! 🎉';

  @override
  String get proRestored => 'Pro er gendannet';

  @override
  String get noPurchaseFound => 'Intet tidligere køb fundet';

  @override
  String periodDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dage',
      one: '1 dag',
    );
    return '$_temp0';
  }

  @override
  String periodWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count uger',
      one: '1 uge',
    );
    return '$_temp0';
  }

  @override
  String periodMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count måneder',
      one: '1 måned',
    );
    return '$_temp0';
  }

  @override
  String periodYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count år',
      one: '1 år',
    );
    return '$_temp0';
  }

  @override
  String get paywallHavePro => 'Du har CamTrip Pro';

  @override
  String get paywallSubtitle => 'Alt til din næste tur.';

  @override
  String paywallFeatureStyles(String styles) {
    return 'Alle kamerastilarter ($styles)';
  }

  @override
  String get paywallFeatureUnlimited =>
      'Ubegrænset antal medlemmer og lagerplads, billederne gemmes for altid';

  @override
  String get paywallFeatureNoWatermark => 'Tilbageblik uden vandmærke';

  @override
  String get paywallFeatureOriginal => 'Download i original kvalitet';

  @override
  String get planYear => 'År';

  @override
  String get planMonth => 'Måned';

  @override
  String pricePerMonth(String price) {
    return '$price om måneden';
  }

  @override
  String paywallSaveBadge(int percent) {
    return 'SPAR $percent %';
  }

  @override
  String get planMonthCancelAnytime => 'kan opsiges månedligt';

  @override
  String tryFree(String period) {
    return 'Prøv $period gratis';
  }

  @override
  String get becomePro => 'Få Pro';

  @override
  String get subscriptionsLoadFailed =>
      'Abonnementerne kunne ikke indlæses. Tjek din forbindelse.';

  @override
  String legalAnnual(String price) {
    return 'CamTrip Pro årsabonnement: $price om året.';
  }

  @override
  String legalAnnualTrial(String period, String price) {
    return 'CamTrip Pro årsabonnement: $period gratis, derefter $price om året.';
  }

  @override
  String legalMonthly(String price) {
    return 'CamTrip Pro månedsabonnement: $price om måneden.';
  }

  @override
  String legalMonthlyTrial(String period, String price) {
    return 'CamTrip Pro månedsabonnement: $period gratis, derefter $price om måneden.';
  }

  @override
  String get legalBillingApple =>
      'Betalingen trækkes via dit Apple-id. Abonnementet fornyes automatisk, medmindre du opsiger det senest 24 timer før periodens udløb. Du kan opsige og administrere det i indstillingerne for din App Store-konto.';

  @override
  String get legalBillingGoogle =>
      'Betalingen trækkes via din Google-konto. Abonnementet fornyes automatisk, medmindre du opsiger det senest 24 timer før periodens udløb. Du kan opsige og administrere det i indstillingerne for din Google Play-konto.';

  @override
  String get restorePurchases => 'Gendan køb';

  @override
  String get terms => 'Vilkår';

  @override
  String get privacy => 'Privatliv';

  @override
  String get groupProTitle => 'Én Pro i gruppen = Pro for alle i gruppen';

  @override
  String get groupProBody =>
      'Hvis én person har Pro, får hele gruppen alle kamerastilarter, ubegrænset antal medlemmer, billeder der bliver gemt, original kvalitet og tilbageblik uden vandmærke.';

  @override
  String get groupCreated => 'Gruppen er oprettet ✓';

  @override
  String get inviteFriends => 'Inviter dine venner';

  @override
  String get codeCopied => 'Koden er kopieret';

  @override
  String get shareLink => 'Del link';

  @override
  String inviteSubject(String groupName) {
    return 'Vær med i $groupName på CamTrip';
  }

  @override
  String inviteMembersUnlimited(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count medlemmer',
      one: '1 medlem',
    );
    return '$_temp0 · ubegrænset (Pro)';
  }

  @override
  String inviteMembersLimit(int count, int limit) {
    return '$count af $limit medlemmer · Pro: ubegrænset';
  }

  @override
  String get toCamera => 'Til kameraet';

  @override
  String get done => 'Færdig';

  @override
  String get joinEnterCode => 'Indtast koden på 6 tegn';

  @override
  String get joinGroupTitle => 'Deltag i en gruppe';

  @override
  String get joinGroupSubtitle =>
      'Indtast dine venners kode, eller scan deres QR-kode.';

  @override
  String get typeCode => 'Skriv kode';

  @override
  String get scanQr => 'Scan QR';

  @override
  String get join => 'Deltag';

  @override
  String get groupNameRequired => 'Giv din gruppe et navn';

  @override
  String get newGroup => 'Ny gruppe';

  @override
  String get groupType => 'Type gruppe';

  @override
  String get groupTypeVacation => 'Ferie';

  @override
  String get groupTypeVacationDescription =>
      'Med start- og slutdato, derefter arkiv';

  @override
  String get groupTypeEvent => 'Begivenhed';

  @override
  String get groupTypeEventDescription => 'Én dag eller aften, f.eks. en fest';

  @override
  String get groupTypePermanent => 'Altid åben';

  @override
  String get groupTypePermanentDescription => 'Til din faste vennegruppe';

  @override
  String get date => 'Dato';

  @override
  String get departure => 'Afrejse';

  @override
  String get returnDate => 'Hjemrejse';

  @override
  String get defaultCameraStyle => 'Standardkamerastil';

  @override
  String freeLimitPermanent(int max) {
    return 'Gratis: op til $max medlemmer. Ubegrænset med Pro.';
  }

  @override
  String freeLimitDated(int max, int days) {
    return 'Gratis: op til $max medlemmer, billederne gemmes indtil $days dage efter slutdatoen. Ubegrænset og for altid med Pro.';
  }

  @override
  String get createGroup => 'Opret gruppe';

  @override
  String get group => 'Gruppe';

  @override
  String groupCode(String code) {
    return 'kode $code';
  }

  @override
  String get manage => 'Administrer';

  @override
  String get rename => 'Omdøb';

  @override
  String get changeDates => 'Skift dato';

  @override
  String get finishTrip => 'Afslut turen';

  @override
  String get finishTripSubtitle => 'Sætter slutdatoen til i dag';

  @override
  String get reopenGroup => 'Genåbn gruppen';

  @override
  String get closeGroup => 'Luk gruppen';

  @override
  String get reopenGroupSubtitle => 'Medlemmerne kan tilføje billeder igen';

  @override
  String get closeGroupSubtitle =>
      'Ingen kan tilføje flere billeder; alt kan stadig ses';

  @override
  String get members => 'Medlemmer';

  @override
  String memberYou(String name) {
    return '$name (dig)';
  }

  @override
  String get blockedTag => 'blokeret';

  @override
  String get adminTag => 'admin';

  @override
  String removeMemberTitle(String name) {
    return 'Fjern $name?';
  }

  @override
  String get removeMemberMessage => 'Personens billeder bliver i gruppen.';

  @override
  String get remove => 'Slet';

  @override
  String get removeMember => 'Fjern';

  @override
  String blockTitle(String name) {
    return 'Bloker $name?';
  }

  @override
  String blockMessage(String name) {
    return 'Du ser ikke længere billeder og videoer fra $name og får ingen notifikationer om dem. Du kan fortryde det i Indstillinger.';
  }

  @override
  String get block => 'Bloker';

  @override
  String get makeMember => 'Gør til almindeligt medlem';

  @override
  String get makeAdmin => 'Gør til admin';

  @override
  String get removeFromGroup => 'Fjern fra gruppen';

  @override
  String get unblock => 'Ophæv blokering';

  @override
  String get inviteFriendsButton => 'Inviter venner';

  @override
  String get you => 'Dig';

  @override
  String get unarchive => 'Hent fra arkivet';

  @override
  String get archive => 'Arkivér';

  @override
  String get unarchiveSubtitle => 'Gruppen er tilbage blandt dine albummer';

  @override
  String archiveSubtitle(String section) {
    return 'Kun for dig: gruppen flyttes til \"$section\" nederst i dine albummer';
  }

  @override
  String get archivedSection => 'Arkiveret';

  @override
  String get hiddenPhotos => 'Skjulte billeder';

  @override
  String get hiddenPhotosSubtitle => 'Billeder, du har skjult for dig selv';

  @override
  String get leaveGroup => 'Forlad gruppen';

  @override
  String get leaveGroupSubtitle =>
      'Dine billeder bliver i gruppen for de andre';

  @override
  String get deleteGroup => 'Slet gruppen';

  @override
  String get deleteGroupSubtitle => 'Alle billeder slettes for alle';

  @override
  String groupArchived(String groupName) {
    return '\"$groupName\" er arkiveret';
  }

  @override
  String groupUnarchived(String groupName) {
    return '\"$groupName\" er tilbage blandt dine albummer';
  }

  @override
  String get undo => 'Fortryd';

  @override
  String get groupNameTitle => 'Gruppens navn';

  @override
  String get finishTripTitle => 'Afslut turen?';

  @override
  String get finishTripMessage =>
      'Slutdatoen bliver i dag. Du kan stadig tilføje billeder; tilbageblikket er klar.';

  @override
  String get finishTripConfirm => 'Afslut';

  @override
  String get tripFinished => 'Turen er afsluttet';

  @override
  String leaveGroupTitle(String groupName) {
    return 'Forlad \"$groupName\"?';
  }

  @override
  String get leaveGroupMessage =>
      'Dine billeder bliver i gruppen for de andre. Du kan deltage igen senere med koden.';

  @override
  String get leave => 'Forlad';

  @override
  String groupDeleted(String groupName) {
    return '\"$groupName\" er slettet';
  }

  @override
  String get youAreAdmin => 'du er admin';

  @override
  String get open => 'Åbn';

  @override
  String get archiveMenuSubtitle => 'Kun for dig, de andre mærker intet';

  @override
  String get deleteGroupMenuSubtitle => 'For alle, med alle billeder';

  @override
  String get deleteGroupTitle => 'Slet gruppen?';

  @override
  String deleteGroupMessage(int count, String groupName, int memberCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Alle $count billeder og videoer',
      one: 'Billedet eller videoen',
    );
    String _temp1 = intl.Intl.pluralLogic(
      memberCount,
      locale: localeName,
      other: 'alle $memberCount medlemmer',
      one: 'det eneste medlem',
    );
    return '$_temp0 i \"$groupName\" forsvinder for $_temp1. Det kan ikke fortrydes.';
  }

  @override
  String get deleteGroupOwnRoll => 'Din egen kamerarulle forbliver uændret.';

  @override
  String get deleteGroupTypeName => 'Skriv gruppens navn for at bekræfte:';

  @override
  String get deleteForEveryone => 'Slet for alle';

  @override
  String get save => 'Gem';

  @override
  String get yourAlbums => 'Dine albummer';

  @override
  String get uploadQueue => 'Uploadkø';

  @override
  String get noConnection => 'Ingen forbindelse';

  @override
  String get albumsOfflineMessage =>
      'Dine albummer indlæses, når du har internet igen. Kameraet virker stadig.';

  @override
  String get retry => 'Prøv igen';

  @override
  String get noAlbumsTitle => 'Ingen albummer endnu';

  @override
  String get noAlbumsMessage =>
      'Opret en gruppe til din næste tur, eller deltag i en vens gruppe med koden.';

  @override
  String get haveCode => 'Jeg har en kode';

  @override
  String get joinWithCode => 'Deltag med kode eller QR-kode';

  @override
  String get camera => 'Kamera';

  @override
  String get restore => 'Gendan';

  @override
  String get more => 'Mere';

  @override
  String get newAlbum => 'Ny';

  @override
  String get closedTag => 'lukket';

  @override
  String get activeTag => 'aktiv';

  @override
  String get uploadFailed => 'Upload mislykkedes';

  @override
  String get queueNoSignal => 'Ingen dækning.';

  @override
  String get queueNoSignalMessage =>
      'Dine billeder ligger allerede i dit album og bliver delt, så snart du har internet igen.';

  @override
  String get queueWaitingForWifi => 'Venter på wi-fi.';

  @override
  String queueWifiOnlyOn(String setting) {
    return 'Du har slået \"$setting\" til.';
  }

  @override
  String get queueVideosWifiOnly => 'Videoer uploades kun via wi-fi.';

  @override
  String get queueAllShared => 'Alt er delt ✓';

  @override
  String queuePending(String items) {
    return '$items mangler at blive delt';
  }

  @override
  String queuePendingBoth(String photos, String videos) {
    return '$photos og $videos mangler at blive delt';
  }

  @override
  String get retryUpload => 'Prøv igen';

  @override
  String get removeFromQueue => 'Fjern fra køen';

  @override
  String get queueStatusWifi => 'wi-fi';

  @override
  String get queueStatusWaiting => 'venter';

  @override
  String get videosWifiOnlyTitle => 'Videoer kun via wi-fi';

  @override
  String get videosWifiOnlySubtitle => 'Sparer mobildata';

  @override
  String get retryNow => 'Prøv igen nu';

  @override
  String get yourName => 'Dit navn';

  @override
  String get settings => 'Indstillinger';

  @override
  String get tapToChangeName => 'Tryk for at ændre dit navn';

  @override
  String get getCamTripPro => 'Få CamTrip Pro';

  @override
  String get photos => 'Billeder';

  @override
  String get saveOwnPhotos => 'Gem mine egne billeder i et album pr. gruppe';

  @override
  String get autoSaveOthers => 'Gem andres billeder automatisk';

  @override
  String get wifiOnlyTitle => 'Upload kun via wi-fi';

  @override
  String get dateStamp => 'Datostempel';

  @override
  String get notifications => 'Notifikationer';

  @override
  String get notifyNewPhotos => 'Nye billeder (samlet)';

  @override
  String get notifyRecapReady => 'Tilbageblik klar';

  @override
  String get camTripTeam => 'CamTrip-teamet';

  @override
  String get adminEntrySubtitle => 'Brugere, giv Pro, anmeldelser og tal';

  @override
  String get account => 'Konto';

  @override
  String get manageSubscription => 'Administrer abonnement';

  @override
  String get blockedPeople => 'Blokerede personer';

  @override
  String get nobody => 'Ingen';

  @override
  String peopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count personer',
      one: '1 person',
    );
    return '$_temp0';
  }

  @override
  String get privacyPolicy => 'Privatlivspolitik';

  @override
  String get contact => 'Kontakt';

  @override
  String get signOut => 'Log ud';

  @override
  String get deleteAccount => 'Slet konto';

  @override
  String get deleteAccountSubtitle => 'Sletter din konto og alle dine billeder';

  @override
  String get deleteAccountTitle => 'Slet kontoen?';

  @override
  String get deleteAccountMessage =>
      'Din konto og alle dine billeder og videoer slettes, også fra grupperne. Et aktivt abonnement opsiger du i App Store eller Google Play.';

  @override
  String get blockedTitle => 'Blokeret';

  @override
  String get blockedSubtitle => 'Du ser ikke billeder fra disse personer.';

  @override
  String get blockedNone => 'Du har ikke blokeret nogen.';

  @override
  String get unblockShort => 'Ophæv';

  @override
  String get groupGone =>
      'Gruppen findes ikke længere, eller du er ikke længere medlem.';

  @override
  String photosSavedToAlbum(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count billeder gemt i \"$album\"',
      one: '1 billede gemt i \"$album\"',
    );
    return '$_temp0';
  }

  @override
  String photosDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count billeder slettet',
      one: '1 billede slettet',
    );
    return '$_temp0';
  }

  @override
  String photosDeletedSkipped(int count, int skipped) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count billeder slettet',
      one: '1 billede slettet',
    );
    return '$_temp0, $skipped sprunget over';
  }

  @override
  String photosHiddenForYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count billeder skjult for dig',
      one: '1 billede skjult for dig',
    );
    return '$_temp0';
  }

  @override
  String get addedToFavorites => 'Tilføjet til favoritter';

  @override
  String get removedFromFavorites => 'Fjernet fra favoritter';

  @override
  String get photoAccessSettings =>
      'Giv CamTrip adgang til dine billeder i Indstillinger';

  @override
  String photosBeingAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count billeder tilføjes',
      one: '1 billede tilføjes',
    );
    return '$_temp0';
  }

  @override
  String photosUnreadable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count billeder kunne ikke læses',
      one: '1 billede kunne ikke læses',
    );
    return '$_temp0';
  }

  @override
  String get groupNotLoaded => 'Gruppen blev ikke indlæst';

  @override
  String get noFavoritesTitle => 'Ingen favoritter endnu';

  @override
  String get noPhotosTitle => 'Ingen billeder endnu';

  @override
  String get noFavoritesMessage =>
      'Tryk på stjernen ved et billede for at lægge det her.';

  @override
  String get noPhotosMessage =>
      'Tag det første billede. Alle i gruppen ser det med det samme.';

  @override
  String get openCamera => 'Åbn kameraet';

  @override
  String savingProgress(int done, int total) {
    return 'Gemmer... $done/$total';
  }

  @override
  String get sharePreparing => 'Forbereder...';

  @override
  String sharingProgress(int done, int total) {
    return 'Forbereder... $done/$total';
  }

  @override
  String get choosePhotos => 'Vælg billeder';

  @override
  String selectedCount(int count) {
    return '$count valgt';
  }

  @override
  String get selectNone => 'Fravælg alle';

  @override
  String get selectAll => 'Vælg alle';

  @override
  String photosWaitingToShare(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count billeder venter på at blive delt',
      one: '1 billede venter på at blive delt',
    );
    return '$_temp0';
  }

  @override
  String get recapReadyTitle => 'Dit tilbageblik er klar';

  @override
  String get recapReadySubtitle => 'En video med musik fra jeres tur';

  @override
  String get watch => 'Se';

  @override
  String get makeRecapNow => 'Lav en tilbageblik-video nu';

  @override
  String freeGroupDeleteNotice(String date) {
    return 'Gratis gruppe: billederne gemmes indtil $date. Gem dem, eller få Pro.';
  }

  @override
  String get filterAll => 'Alle';

  @override
  String get filterFavorites => 'Favoritter';

  @override
  String get filterPerPerson => 'Pr. person';

  @override
  String get filterPerson => 'Person';

  @override
  String get select => 'Vælg';

  @override
  String get hiddenFilter => 'Skjulte';

  @override
  String get photosBy => 'Billeder af...';

  @override
  String get uploadedTag => 'uploadet';

  @override
  String get saveAll => 'Gem alle';

  @override
  String get favorite => 'Favorit';

  @override
  String get unfavorite => 'Ikke favorit';

  @override
  String get hide => 'Skjul';

  @override
  String get delete => 'Slet';

  @override
  String deletePhotosTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Slet $count billeder?',
      one: 'Slet billedet?',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'De forsvinder for alle i gruppen. Det kan ikke fortrydes.',
      one: 'Det forsvinder for alle i gruppen. Det kan ikke fortrydes.',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosNotAllowed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count billeder er andres. De bliver; kun en admin kan slette dem.',
      one: '1 billede er en andens. Det bliver; kun en admin kan slette det.',
    );
    return '$_temp0';
  }

  @override
  String photosBackInGroup(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count billeder er tilbage i gruppen',
      one: '1 billede er tilbage i gruppen',
    );
    return '$_temp0';
  }

  @override
  String get showAll => 'Vis alle';

  @override
  String get hiddenPhotosExplainer =>
      'Kun du ser ikke længere disse billeder. For de andre i gruppen er de der stadig.';

  @override
  String get nothingHidden => 'Intet skjult';

  @override
  String get nothingHiddenMessage => 'Billeder, du skjuler, finder du her.';

  @override
  String showAgainCount(int count) {
    return 'Vis igen ($count)';
  }

  @override
  String get someone => 'Nogen';

  @override
  String get savedToAlbum => 'Gemt i dit fotoalbum';

  @override
  String get share => 'Del';

  @override
  String get shareFailed => 'Deling mislykkedes';

  @override
  String get reportTitle => 'Hvorfor anmelder du dette billede?';

  @override
  String get reportSubtitle =>
      'Vi gennemgår alle anmeldelser inden for 24 timer. Billedet skjules med det samme for dig.';

  @override
  String get reportThanks => 'Tak, vi kigger på det';

  @override
  String blockMessageAllGroups(String name) {
    return 'Du ser ikke længere billeder og videoer fra $name i nogen gruppe og får ingen notifikationer om dem. Du kan fortryde det i Indstillinger.';
  }

  @override
  String userBlocked(String name) {
    return '$name er blokeret';
  }

  @override
  String get videoHiddenForYou => 'Video skjult for dig';

  @override
  String get photoHiddenForYou => 'Billede skjult for dig';

  @override
  String get setAsCover => 'Brug som cover';

  @override
  String get coverUpdated => 'Coverbilledet er ændret';

  @override
  String get hideForMe => 'Skjul for mig';

  @override
  String get hideForMeSubtitle => 'De andre i gruppen kan stadig se det';

  @override
  String get reportPhoto => 'Anmeld billede';

  @override
  String blockName(String name) {
    return 'Bloker $name';
  }

  @override
  String get forEveryoneInGroup => 'For alle i gruppen';

  @override
  String get videoDeleted => 'Video slettet';

  @override
  String get photoDeleted => 'Billede slettet';

  @override
  String get photoAccessToSave =>
      'Giv CamTrip adgang til dine billeder i Indstillinger for at gemme';

  @override
  String get phoneFull => 'Din telefon er fuld';

  @override
  String get albumSaveFailedShort => 'Gem i albummet mislykkedes';

  @override
  String get recapTemplateGoldenHour => 'Golden Hour';

  @override
  String get recapTemplateFast => 'Hurtig';

  @override
  String get recapTemplateFilmRoll => 'Filmrulle';

  @override
  String get recapTemplatePolaroid => 'Polaroid';

  @override
  String get trackSummerEvening => 'Sommeraften';

  @override
  String get trackGoldenHour => 'Golden Hour';

  @override
  String get trackRoadtrip => 'Roadtrip';

  @override
  String get moodWarm => 'varm';

  @override
  String get moodCheerful => 'glad';

  @override
  String friendsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count venner',
      one: '1 ven',
    );
    return '$_temp0';
  }

  @override
  String get madeWithCamTrip => 'Lavet med CamTrip';

  @override
  String get tagline => 'Én filmrulle til hele flokken';

  @override
  String get videoUnsupportedDevice =>
      'Videoen kunne ikke laves på denne enhed';

  @override
  String get groupLoadFailed => 'Gruppen kunne ikke indlæses.';

  @override
  String recapNeedsPhotos(int count) {
    return 'Du skal bruge mindst $count billeder til et tilbageblik.';
  }

  @override
  String get recapFailed => 'Tilbageblikket kunne ikke laves. Prøv igen.';

  @override
  String get recapSaved => 'Tilbageblikket er gemt i dit fotoalbum';

  @override
  String get recap => 'Tilbageblik';

  @override
  String get recapRendering => 'Laver tilbageblik...';

  @override
  String get videoRendering => 'Laver video...';

  @override
  String get template => 'Skabelon';

  @override
  String get musicLicense => 'CamTrips egen musik · royaltyfri';

  @override
  String get change => 'Skift';

  @override
  String get noWatermark => 'Intet vandmærke ✓';

  @override
  String get removeWatermarkPro => 'Fjern vandmærket med Pro';

  @override
  String get proSourceSubscription => 'Abonnement';

  @override
  String get proSourceGift => 'Gave';

  @override
  String get proSourceAdmin => 'Admin';

  @override
  String get proSourceGroup => 'Via gruppe';

  @override
  String get noPro => 'Ingen Pro';

  @override
  String proStatusNoEnd(String source) {
    return 'Pro ($source), ingen slutdato';
  }

  @override
  String proStatusUntil(String source, String date) {
    return 'Pro ($source), indtil $date';
  }

  @override
  String get lifetime => 'Livstid';

  @override
  String get pickDate => 'Vælg dato';

  @override
  String get noAccess => 'Ingen adgang';

  @override
  String get adminOnlyTeam => 'Administration er kun for CamTrip-teamet.';

  @override
  String get adminOverview => 'Oversigt';

  @override
  String get adminUsers => 'Brugere';

  @override
  String get adminReports => 'Anmeldelser';

  @override
  String adminsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count admins',
      one: '1 admin',
    );
    return '$_temp0';
  }

  @override
  String get adminNewThisWeek => 'Nye i denne uge';

  @override
  String get adminGroups => 'Grupper';

  @override
  String get adminProSubscription => 'Pro via abonnement';

  @override
  String get adminProGift => 'Pro som gave';

  @override
  String adminWithoutSubscription(int count) {
    return '$count uden abonnement';
  }

  @override
  String get adminOpenReports => 'Åbne anmeldelser';

  @override
  String get adminSearchHint => 'Søg på navn eller e-mail';

  @override
  String get nobodyFound => 'Ingen fundet';

  @override
  String get loadMore => 'Indlæs flere';

  @override
  String get noEmail => 'Ingen e-mail';

  @override
  String adminDeletePhotoMessage(String groupName) {
    return 'Billedet forsvinder for alle i \"$groupName\". Alle anmeldelser af billedet bliver afsluttet.';
  }

  @override
  String get adminBanMessage =>
      'Kontoen kan ikke længere logge ind eller bruge appen. Du kan fortryde det senere.';

  @override
  String get adminDismissTitle => 'Afvis anmeldelse?';

  @override
  String get adminDismissMessage =>
      'Billedet bliver. Anmeldelsen markeres som afsluttet.';

  @override
  String get adminDismiss => 'Afvis';

  @override
  String get adminAccountBlocked => 'Kontoen er blokeret';

  @override
  String get adminReportDismissed => 'Anmeldelsen er afvist';

  @override
  String get adminNoReports => 'Ingen åbne anmeldelser';

  @override
  String get adminNoReportsMessage => 'Anmeldte billeder vises her.';

  @override
  String get deletedTag => 'Slettet';

  @override
  String adminReportedBy(String name) {
    return 'Af $name';
  }

  @override
  String adminPhotoBy(String name) {
    return 'Billede af $name';
  }

  @override
  String reportsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count anmeldelser',
      one: '1 anmeldelse',
    );
    return '$_temp0';
  }

  @override
  String get adminDeletePhoto => 'Slet billede';

  @override
  String get adminBlockCreator => 'Bloker fotografen';

  @override
  String get loadFailed => 'Indlæsning mislykkedes';

  @override
  String get adminLifetimeProGiven => 'Livstids-Pro givet';

  @override
  String get adminProGiven => 'Pro givet';

  @override
  String adminGiveProUntil(String date) {
    return 'Giv Pro indtil $date';
  }

  @override
  String get adminGiveProLifetime => 'Giv Pro på livstid';

  @override
  String adminGiveProFor(String period) {
    return 'Giv Pro i $period';
  }

  @override
  String get adminReasonHint => 'Grund, f.eks. ven, tester, influencer';

  @override
  String get adminGivePro => 'Giv Pro';

  @override
  String get adminRevokeTitle => 'Tilbagekald gave?';

  @override
  String get adminRevokeMessage =>
      'Den givne Pro stopper med det samme. Et eget abonnement fortsætter som normalt.';

  @override
  String get adminRevoke => 'Tilbagekald';

  @override
  String get adminGiftRevoked => 'Gaven er tilbagekaldt';

  @override
  String get adminUnbanTitle => 'Ophæv blokering?';

  @override
  String adminUnbanMessage(String name) {
    return '$name kan logge ind igen.';
  }

  @override
  String get adminUnbanned => 'Blokeringen er ophævet';

  @override
  String get adminBanUserMessage =>
      'Kontoen kan ikke længere logge ind eller bruge appen. Billederne bliver.';

  @override
  String get adminUser => 'Bruger';

  @override
  String get adminNotVerified => 'ikke bekræftet';

  @override
  String get adminRole => 'Rolle';

  @override
  String get adminCreated => 'Oprettet';

  @override
  String get unknown => 'Ukendt';

  @override
  String get adminSignInWith => 'Logger ind med';

  @override
  String get adminEmailMethod => 'E-mail';

  @override
  String get adminPhotosAndVideos => 'Billeder og videoer';

  @override
  String get adminStatus => 'Status';

  @override
  String get adminActive => 'Aktiv';

  @override
  String adminActiveUntil(String date) {
    return 'Aktiv indtil $date';
  }

  @override
  String adminGiftFrom(String name) {
    return 'Gave fra $name';
  }

  @override
  String adminExpiredOn(String date) {
    return 'Udløb $date';
  }

  @override
  String get adminExpired => 'Udløbet';

  @override
  String adminUntil(String date) {
    return 'Indtil $date';
  }

  @override
  String get adminGiveProTitle => 'Giv Pro';

  @override
  String get adminGiveProNote =>
      'Gælder også for personens grupper: én Pro i gruppen = Pro for alle i gruppen.';

  @override
  String get adminRevokeGift => 'Tilbagekald gave';

  @override
  String get adminModeration => 'Moderering';

  @override
  String get adminCannotBanSelf => 'Du kan ikke blokere dig selv.';

  @override
  String get adminCannotBanAdmin => 'En admin kan ikke blokeres.';

  @override
  String get adminUnban => 'Ophæv blokering';

  @override
  String get adminBanAccount => 'Bloker konto';

  @override
  String get googleSignInUnavailable =>
      'Login med Google er ikke tilgængeligt endnu';

  @override
  String get cameraPickerTitle => 'Vælg dit kamera';

  @override
  String get cameraPickerSubtitle =>
      'Hvert kamera giver dine billeder sit eget look';

  @override
  String get cameraPickerChange => 'Skift kamera';

  @override
  String get cameraPickerUnlock => 'Lås op med Pro';

  @override
  String get cameraPickerSelected => 'Valgt';

  @override
  String get cameraPickerStyleSummer => 'Sommer';

  @override
  String get cameraPickerStyleSummerDescription =>
      'Varme, falmede farver fra et 90\'er-billede';

  @override
  String get cameraPickerStyleNight => 'Nat 800';

  @override
  String get cameraPickerStyleNightDescription =>
      'Biograffilm: blågrønne skygger, varmt lys, masser af korn';

  @override
  String get cameraPickerStyleSepia => 'Sepia';

  @override
  String get cameraPickerStyleSepiaDescription =>
      'Et gammelt brunt aftryk fra skoæsken';

  @override
  String get cameraPickerStyleLomo => 'Lomo';

  @override
  String get cameraPickerStyleLomoDescription =>
      'Stærke farver, mørke hjørner og et vildt farveskær';

  @override
  String get cameraPickerStyleMint => 'Mint';

  @override
  String get cameraPickerStyleMintDescription =>
      'Blødt og friskt med et grønt skær';

  @override
  String get cameraPickerStylePastel => 'Lyserød';

  @override
  String get cameraPickerStylePastelDescription =>
      'Pastelfarver med et lyserødt skær og hvid kant';

  @override
  String get cameraPickerStyleSuper8 => 'Super 8';

  @override
  String get cameraPickerStyleSuper8Description =>
      'Kornet og blødt, som en gammel hjemmevideo';

  @override
  String get paywallBenefitGroup => 'Én Pro = Pro for hele gruppen';

  @override
  String get paywallBenefitUnlimited =>
      'Ubegrænset medlemmer, billeder for altid';

  @override
  String get paywallBenefitQuality => 'Uden vandmærke, original kvalitet';

  @override
  String paywallFreeTrial(String period) {
    return '$period gratis';
  }

  @override
  String paywallPriceYear(String price) {
    return '$price om året.';
  }

  @override
  String paywallPriceYearTrial(String period, String price) {
    return '$period gratis, derefter $price om året.';
  }

  @override
  String paywallPriceMonth(String price) {
    return '$price om måneden.';
  }

  @override
  String paywallPriceMonthTrial(String period, String price) {
    return '$period gratis, derefter $price om måneden.';
  }

  @override
  String paywallAutoRenew(String store) {
    return 'Fornyes automatisk. Opsig senest 24 timer før fornyelsen i $store.';
  }

  @override
  String get paywallDetailsTitle => 'Alt i Pro';

  @override
  String get paywallBenefitStyles => 'Alle kamerastilarter';

  @override
  String get allPhotosTitle => 'Alle billeder';

  @override
  String get homeTabAlbums => 'Albummer';

  @override
  String get allPhotosEmptyTitle => 'Ingen billeder endnu';

  @override
  String get allPhotosEmptyMessage =>
      'Åbn kameraet, og tag dit første billede.';

  @override
  String get allPhotosLoadFailed => 'Dine billeder kunne ikke indlæses';

  @override
  String get cameraSettingsTitle => 'Kameraindstillinger';

  @override
  String get cameraSettingsMore => 'Flere indstillinger';

  @override
  String get cameraSettingsGrid => 'Gitter';

  @override
  String get cameraSettingsHaptics => 'Vibrér ved optagelse';

  @override
  String get cameraSettingsDateStamp => 'Datostempel nederst til højre';

  @override
  String get cameraSettingsSound => 'Lukkerlyd';

  @override
  String get cameraSettingsSoundHint => 'Lydløs, når din telefon er på lydløs';

  @override
  String get cameraSettingsTimer => 'Selvudløser';

  @override
  String get cameraSettingsTimerOff => 'Fra';

  @override
  String cameraSettingsTimerSeconds(int seconds) {
    return '$seconds s';
  }

  @override
  String get cameraSettingsTimerCancelHint =>
      'Tryk på udløseren for at annullere';

  @override
  String get cameraSettingsMirror => 'Spejlvend selfies';

  @override
  String get cameraSettingsSaveToRoll => 'Gem i kamerarullen';

  @override
  String get cameraSettingsQuality => 'Kvalitet';

  @override
  String get cameraSettingsQualityStandard => 'Standard';

  @override
  String get cameraSettingsQualityHigh => 'Høj';

  @override
  String get cameraLowLightHint => 'Lidt lys - tænd for blitzen';

  @override
  String get cameraFlashUnavailable => 'Dette kamera har ingen blitz';

  @override
  String get cameraFlashScreen => 'Skærmblitz';

  @override
  String get cameraFlashCycleHint =>
      'Tryk for at skifte mellem fra, til og auto';

  @override
  String get cameraFlip => 'Skift mellem front- og bagkamera';

  @override
  String get cameraFlipHint => 'Dobbelttryk på søgeren for at vende kameraet';

  @override
  String cameraPickerPaywallStyles(int count, String styles) {
    return 'Alle $count kameraer, blandt andet $styles';
  }

  @override
  String get styleFlash => 'Blitz 400';

  @override
  String get styleFlashDescription =>
      'Direkte blitz på varm film: ravfarvet glød, korn, dybe røde';
}
