// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian Bokmål (`nb`).
class AppLocalizationsNb extends AppLocalizations {
  AppLocalizationsNb([String locale = 'nb']) : super(locale);

  @override
  String get cancel => 'Avbryt';

  @override
  String get yes => 'Ja';

  @override
  String inviteMessageIntro(String groupName) {
    return 'Blir du med i «$groupName» på CamTrip? Da ser vi bildene til hverandre med en gang.';
  }

  @override
  String inviteMessageCode(String code) {
    return 'Eller skriv inn koden: $code';
  }

  @override
  String get memberFallbackName => 'Venn';

  @override
  String get reportReasonInappropriate => 'Upassende eller støtende';

  @override
  String get reportReasonSpam => 'Spam';

  @override
  String get reportReasonOther => 'Noe annet';

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
  String get errorOffline => 'Ingen tilkobling. Prøv igjen om litt.';

  @override
  String errorSomethingWrongStatus(int status) {
    return 'Noe gikk galt ($status)';
  }

  @override
  String get errorSomethingWrong => 'Noe gikk galt';

  @override
  String get apiInvalidCredentials => 'Feil e-postadresse eller passord';

  @override
  String get apiInvalidCode => 'Koden er feil eller utløpt. Be om en ny kode.';

  @override
  String get apiEmailTaken =>
      'Det finnes allerede en konto med denne e-postadressen. Logg inn, eller velg «Glemt passordet?».';

  @override
  String apiEmailTakenProvider(String provider) {
    return 'Det finnes allerede en konto med denne e-postadressen. Logg inn med $provider.';
  }

  @override
  String apiWeakPassword(int min) {
    return 'Velg et passord på minst $min tegn';
  }

  @override
  String apiNameTooLong(int max) {
    return 'Navnet ditt kan være på maks $max tegn';
  }

  @override
  String get apiRateLimited => 'For mange forsøk. Prøv igjen om et kvarter.';

  @override
  String apiAccountBanned(String email) {
    return 'Kontoen din er blokkert. Kontakt $email hvis du mener dette er feil.';
  }

  @override
  String get apiProRequired => 'Denne kamerastilen er en del av CamTrip Pro';

  @override
  String get apiGroupClosed => 'Denne gruppen er stengt';

  @override
  String get apiGroupCodeNotFound => 'Fant ingen gruppe med denne koden';

  @override
  String apiGroupFull(int max) {
    return 'Gruppen er full (maks $max medlemmer). Har ett medlem CamTrip Pro, kan ubegrenset mange bli med.';
  }

  @override
  String get apiLastMember =>
      'Du er det siste medlemmet. Slett heller gruppen.';

  @override
  String get apiAdminRequired => 'Bare for administratorer hos CamTrip';

  @override
  String get apiUploadIncomplete => 'Opplastingen er ikke fullført';

  @override
  String get apiInvalidInput => 'Ugyldig inndata';

  @override
  String get apiNotSignedIn => 'Ikke logget inn';

  @override
  String get apiAccountGone => 'Kontoen finnes ikke lenger';

  @override
  String get apiPhotoNotFound => 'Fant ikke bildet';

  @override
  String get apiGroupNotFound => 'Fant ikke gruppen';

  @override
  String get apiMemberNotFound => 'Fant ikke medlemmet';

  @override
  String get apiPersonNotFound => 'Fant ikke personen';

  @override
  String get apiUserNotFound => 'Fant ikke brukeren';

  @override
  String get apiAdminOnly => 'Bare en admin kan gjøre dette';

  @override
  String get apiCannotBlockSelf => 'Du kan ikke blokkere deg selv';

  @override
  String get apiCannotReportOwn => 'Du kan ikke rapportere ditt eget bilde';

  @override
  String get apiDeleteOwnOnly => 'Du kan bare slette dine egne bilder';

  @override
  String get apiOwnerCannotBeRemoved =>
      'Den som opprettet gruppen, kan ikke fjernes';

  @override
  String get apiOwnerStaysAdmin => 'Den som opprettet gruppen, forblir admin';

  @override
  String get apiNeedsOneAdmin => 'En gruppe trenger minst én admin';

  @override
  String get apiEndBeforeStart => 'Sluttdatoen er før startdatoen';

  @override
  String get apiPermanentNoEndDate =>
      'En gruppe som alltid er åpen, har ingen sluttdato';

  @override
  String get apiCannotBanAdmin => 'En administrator kan ikke blokkeres';

  @override
  String get apiReportNotFound => 'Fant ikke rapporten';

  @override
  String get apiPhotoOwnerUnknown =>
      'Det er ikke lenger kjent hvem som tok bildet';

  @override
  String get validationNameRequired => 'Skriv inn navnet ditt';

  @override
  String validationMaxChars(int max) {
    return 'Maks $max tegn';
  }

  @override
  String get validationEmailRequired => 'Skriv inn e-postadressen din';

  @override
  String get validationEmailInvalid => 'E-postadressen er ikke gyldig';

  @override
  String get validationPasswordRequired => 'Velg et passord';

  @override
  String validationMinChars(int min) {
    return 'Minst $min tegn';
  }

  @override
  String get validationPasswordTooLong => 'Passordet er for langt';

  @override
  String get validationPasswordEmpty => 'Skriv inn passordet ditt';

  @override
  String get validationCodeRequired => 'Skriv inn koden fra e-posten';

  @override
  String get validationCodeDigits => 'Koden består av 6 sifre';

  @override
  String get onboarding1Title => 'Én filmrull\nfor hele gjengen.';

  @override
  String get onboarding1Body =>
      'Ta bilder med et retrokamera. Alle ser bildene dine med en gang, og de havner rett i ditt eget album.';

  @override
  String get onboarding2Title => 'Slutt på å\nsende bilder rundt.';

  @override
  String get onboarding2Body =>
      'Lag en gruppe, del koden, ferdig. Aldri mer «kan du sende meg de bildene?»';

  @override
  String get onboarding3Title => 'Etterpå en\ntilbakeblikk-video.';

  @override
  String get onboarding3Body =>
      'CamTrip lager en video med musikk av de beste øyeblikkene deres.';

  @override
  String get onboardingInvited => 'Du er invitert! Logg inn for å bli med.';

  @override
  String get signInAppleFailed => 'Kunne ikke logge inn med Apple';

  @override
  String get signInGoogleFailed => 'Kunne ikke logge inn med Google';

  @override
  String get signInFailed => 'Kunne ikke logge inn';

  @override
  String get next => 'Neste';

  @override
  String get legalPrefix => 'Ved å fortsette godtar du ';

  @override
  String get legalTerms => 'vilkårene';

  @override
  String get legalAnd => ' og ';

  @override
  String get legalPrivacy => 'personvernerklæringen';

  @override
  String get legalSuffix => '.';

  @override
  String get continueWithApple => 'Fortsett med Apple';

  @override
  String get continueWithGoogle => 'Fortsett med Google';

  @override
  String get createAccount => 'Opprett konto';

  @override
  String get signIn => 'Logg inn';

  @override
  String get or => 'eller';

  @override
  String get registerSubtitle => 'Slik ser vennene dine hvem som tar bildene.';

  @override
  String get loginSubtitle => 'Velkommen tilbake.';

  @override
  String get forgotPasswordTitle => 'Glemt passord';

  @override
  String get forgotPasswordPushSubtitle =>
      'Er du fortsatt logget inn et sted? Da sender vi en 6-sifret kode dit som et varsel, så du kan velge et nytt passord.';

  @override
  String get newPassword => 'Nytt passord';

  @override
  String get resetPushInfo =>
      'Hvis du fortsatt er logget inn et sted, får du et varsel med en kode der. Kommer du ikke inn? Logg inn med Apple eller Google med samme e-postadresse - da blir kontoen din koblet sammen.';

  @override
  String get sendCode => 'Send kode';

  @override
  String get savePassword => 'Lagre passord';

  @override
  String get errorTryAgain => 'Noe gikk galt. Prøv igjen.';

  @override
  String get back => 'Tilbake';

  @override
  String get name => 'Navn';

  @override
  String get email => 'E-postadresse';

  @override
  String get codeFromPush => 'Kode fra varselet';

  @override
  String get password => 'Passord';

  @override
  String get hidePassword => 'Skjul passord';

  @override
  String get showPassword => 'Vis passord';

  @override
  String get forgotPasswordLink => 'Glemt passordet?';

  @override
  String get haveAccount => 'Har du allerede en konto?';

  @override
  String get newToCamTrip => 'Ny på CamTrip?';

  @override
  String get rememberedIt => 'Husker du det likevel?';

  @override
  String get noCodeReceived => 'Fikk du ingen kode?';

  @override
  String get resendCode => 'Send på nytt';

  @override
  String onboardingDemoRoll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotografer, 1 filmrull',
      one: '1 fotograf, 1 filmrull',
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
      other: '$count bilder',
      one: '1 bilde',
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
  String get justNow => 'nå';

  @override
  String get badgeNew => 'Ny';

  @override
  String recapTitle(String groupName) {
    return 'Tilbakeblikk $groupName';
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
      'Varme farger, korn og et oransje datostempel';

  @override
  String get styleInstantDescription => 'Myke farger og en hvit kant';

  @override
  String get styleDisposableDescription =>
      'Hard blits, vignett og lyslekkasjer';

  @override
  String get styleBwDescription => 'Kornete svart-hvitt med dyp kontrast';

  @override
  String get styleGoldenDescription =>
      'Alltid gyllen time, et mykt gyllent skjær';

  @override
  String get styleChromeDescription =>
      'Kjølig, mettet og skarp som lysbildefilm';

  @override
  String get shutterStopRecording => 'Stopp opptak';

  @override
  String get shutterStartRecording => 'Start videoopptak';

  @override
  String get shutterTakePhoto => 'Ta bilde';

  @override
  String get modePhoto => 'Foto';

  @override
  String get modeVideo => 'Video';

  @override
  String get cameraNotFound => 'Fant ikke noe kamera';

  @override
  String get cameraAccessNeeded =>
      'CamTrip trenger tilgang til kameraet. Slå det på i Innstillinger.';

  @override
  String get cameraStartFailed => 'Kameraet kunne ikke starte';

  @override
  String get albumAccessNeeded =>
      'Gi CamTrip tilgang til bildene dine for å lagre dem i albumet ditt også';

  @override
  String get albumSaveFailed =>
      'Kunne ikke lagre i albumet. Bildet deles likevel.';

  @override
  String styleProFallback(String style) {
    return 'Denne stilen er en del av Pro. I denne gruppen fotograferer du med $style.';
  }

  @override
  String get photoFailed => 'Kunne ikke ta bildet. Prøv igjen.';

  @override
  String get recordingFailed => 'Kunne ikke ta opp video';

  @override
  String get videoFailed => 'Kunne ikke lage videoen. Prøv igjen.';

  @override
  String get shootInGroup => 'Fotografer i gruppe';

  @override
  String get close => 'Lukk';

  @override
  String get flash => 'Blits';

  @override
  String get flashOn => 'På';

  @override
  String get flashOff => 'Av';

  @override
  String get flashAuto => 'Auto';

  @override
  String get chooseGroup => 'Velg gruppe';

  @override
  String get switchCamera => 'Bytt kamera';

  @override
  String get createOrJoinFirst => 'Lag eller bli med i en gruppe først';

  @override
  String get proViaGroup => 'Pro via gruppen';

  @override
  String proViaName(String name) {
    return 'Pro via $name';
  }

  @override
  String get proStylesFreeViaMember =>
      'Pro-stiler i denne gruppen er gratis for deg takket være et Pro-medlem';

  @override
  String proStylesFreeViaName(String name) {
    return 'Pro-stiler i denne gruppen: gratis for deg takket være $name';
  }

  @override
  String get subscriptionsUnavailable =>
      'Abonnementer er ikke tilgjengelige akkurat nå. Prøv igjen senere.';

  @override
  String get paymentPending =>
      'Betalingen behandles fortsatt. Pro slås på så snart den er fullført.';

  @override
  String get purchaseFailed => 'Kjøpet mislyktes. Prøv igjen senere.';

  @override
  String get restoreUnavailable =>
      'Kan ikke gjenopprette kjøp akkurat nå. Prøv igjen senere.';

  @override
  String get restoreFailed => 'Gjenopprettingen mislyktes. Prøv igjen senere.';

  @override
  String get welcomePro => 'Velkommen til CamTrip Pro! 🎉';

  @override
  String get proRestored => 'Pro er gjenopprettet';

  @override
  String get noPurchaseFound => 'Fant ikke noe tidligere kjøp';

  @override
  String periodDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dager',
      one: '1 dag',
    );
    return '$_temp0';
  }

  @override
  String periodWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count uker',
      one: '1 uke',
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
  String get paywallSubtitle => 'Alt til neste tur.';

  @override
  String paywallFeatureStyles(String styles) {
    return 'Alle kamerastiler ($styles)';
  }

  @override
  String get paywallFeatureUnlimited =>
      'Ubegrenset med medlemmer og lagring, bildene lagres for alltid';

  @override
  String get paywallFeatureNoWatermark => 'Tilbakeblikk uten vannmerke';

  @override
  String get paywallFeatureOriginal => 'Last ned i originalkvalitet';

  @override
  String get planYear => 'År';

  @override
  String get planMonth => 'Måned';

  @override
  String pricePerMonth(String price) {
    return '$price per måned';
  }

  @override
  String paywallSaveBadge(int percent) {
    return 'SPAR $percent %';
  }

  @override
  String get planMonthCancelAnytime => 'kan sies opp månedlig';

  @override
  String tryFree(String period) {
    return 'Prøv $period gratis';
  }

  @override
  String get becomePro => 'Skaff Pro';

  @override
  String get subscriptionsLoadFailed =>
      'Kunne ikke laste inn abonnementene. Sjekk tilkoblingen.';

  @override
  String legalAnnual(String price) {
    return 'CamTrip Pro årsabonnement: $price per år.';
  }

  @override
  String legalAnnualTrial(String period, String price) {
    return 'CamTrip Pro årsabonnement: $period gratis, deretter $price per år.';
  }

  @override
  String legalMonthly(String price) {
    return 'CamTrip Pro månedsabonnement: $price per måned.';
  }

  @override
  String legalMonthlyTrial(String period, String price) {
    return 'CamTrip Pro månedsabonnement: $period gratis, deretter $price per måned.';
  }

  @override
  String get legalBillingApple =>
      'Betalingen belastes Apple-ID-en din. Abonnementet fornyes automatisk med mindre du sier det opp minst 24 timer før perioden er slutt. Du kan si opp og administrere det i innstillingene for App Store-kontoen din.';

  @override
  String get legalBillingGoogle =>
      'Betalingen belastes Google-kontoen din. Abonnementet fornyes automatisk med mindre du sier det opp minst 24 timer før perioden er slutt. Du kan si opp og administrere det i innstillingene for Google Play-kontoen din.';

  @override
  String get restorePurchases => 'Gjenopprett kjøp';

  @override
  String get terms => 'Vilkår';

  @override
  String get privacy => 'Personvern';

  @override
  String get groupProTitle => 'Én Pro i gruppen = Pro for alle i gruppen';

  @override
  String get groupProBody =>
      'Har én person Pro, får hele gruppen alle kamerastiler, ubegrenset med medlemmer, bilder som lagres, originalkvalitet og tilbakeblikk uten vannmerke.';

  @override
  String get groupCreated => 'Gruppen er opprettet ✓';

  @override
  String get inviteFriends => 'Inviter vennene dine';

  @override
  String get codeCopied => 'Koden er kopiert';

  @override
  String get shareLink => 'Del lenke';

  @override
  String inviteSubject(String groupName) {
    return 'Bli med i $groupName på CamTrip';
  }

  @override
  String inviteMembersUnlimited(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count medlemmer',
      one: '1 medlem',
    );
    return '$_temp0 · ubegrenset (Pro)';
  }

  @override
  String inviteMembersLimit(int count, int limit) {
    return '$count av $limit medlemmer · Pro: ubegrenset';
  }

  @override
  String get toCamera => 'Til kameraet';

  @override
  String get done => 'Ferdig';

  @override
  String get joinEnterCode => 'Skriv inn koden på 6 tegn';

  @override
  String get joinGroupTitle => 'Bli med i en gruppe';

  @override
  String get joinGroupSubtitle =>
      'Skriv inn koden fra vennene dine, eller skann QR-koden deres.';

  @override
  String get typeCode => 'Skriv kode';

  @override
  String get scanQr => 'Skann QR';

  @override
  String get join => 'Bli med';

  @override
  String get groupNameRequired => 'Gi gruppen et navn';

  @override
  String get newGroup => 'Ny gruppe';

  @override
  String get groupType => 'Type gruppe';

  @override
  String get groupTypeVacation => 'Ferie';

  @override
  String get groupTypeVacationDescription =>
      'Med start- og sluttdato, deretter arkiv';

  @override
  String get groupTypeEvent => 'Arrangement';

  @override
  String get groupTypeEventDescription => 'Én dag eller kveld, f.eks. en fest';

  @override
  String get groupTypePermanent => 'Alltid åpen';

  @override
  String get groupTypePermanentDescription => 'For den faste vennegjengen din';

  @override
  String get date => 'Dato';

  @override
  String get departure => 'Avreise';

  @override
  String get returnDate => 'Hjemreise';

  @override
  String get defaultCameraStyle => 'Standard kamerastil';

  @override
  String freeLimitPermanent(int max) {
    return 'Gratis: opptil $max medlemmer. Ubegrenset med Pro.';
  }

  @override
  String freeLimitDated(int max, int days) {
    return 'Gratis: opptil $max medlemmer, bildene lagres til $days dager etter sluttdatoen. Ubegrenset og for alltid med Pro.';
  }

  @override
  String get createGroup => 'Opprett gruppe';

  @override
  String get group => 'Gruppe';

  @override
  String groupCode(String code) {
    return 'kode $code';
  }

  @override
  String get manage => 'Administrer';

  @override
  String get rename => 'Gi nytt navn';

  @override
  String get changeDates => 'Endre dato';

  @override
  String get finishTrip => 'Avslutt turen';

  @override
  String get finishTripSubtitle => 'Setter sluttdatoen til i dag';

  @override
  String get reopenGroup => 'Åpne gruppen igjen';

  @override
  String get closeGroup => 'Steng gruppen';

  @override
  String get reopenGroupSubtitle => 'Medlemmene kan legge til bilder igjen';

  @override
  String get closeGroupSubtitle =>
      'Ingen kan legge til flere bilder; alt kan fortsatt ses';

  @override
  String get members => 'Medlemmer';

  @override
  String memberYou(String name) {
    return '$name (deg)';
  }

  @override
  String get blockedTag => 'blokkert';

  @override
  String get adminTag => 'admin';

  @override
  String removeMemberTitle(String name) {
    return 'Fjerne $name?';
  }

  @override
  String get removeMemberMessage => 'Bildene deres blir i gruppen.';

  @override
  String get remove => 'Slett';

  @override
  String get removeMember => 'Fjern';

  @override
  String blockTitle(String name) {
    return 'Blokkere $name?';
  }

  @override
  String blockMessage(String name) {
    return 'Du ser ikke lenger bilder og videoer fra $name og får ingen varsler om dem. Du kan angre dette i Innstillinger.';
  }

  @override
  String get block => 'Blokker';

  @override
  String get makeMember => 'Gjør til vanlig medlem';

  @override
  String get makeAdmin => 'Gjør til admin';

  @override
  String get removeFromGroup => 'Fjern fra gruppen';

  @override
  String get unblock => 'Opphev blokkering';

  @override
  String get inviteFriendsButton => 'Inviter venner';

  @override
  String get you => 'Deg';

  @override
  String get unarchive => 'Hent fra arkivet';

  @override
  String get archive => 'Arkiver';

  @override
  String get unarchiveSubtitle => 'Gruppen er tilbake blant albumene dine';

  @override
  String archiveSubtitle(String section) {
    return 'Bare for deg: gruppen flyttes til «$section» nederst i albumene dine';
  }

  @override
  String get archivedSection => 'Arkivert';

  @override
  String get hiddenPhotos => 'Skjulte bilder';

  @override
  String get hiddenPhotosSubtitle => 'Bilder du har skjult for deg selv';

  @override
  String get leaveGroup => 'Forlat gruppen';

  @override
  String get leaveGroupSubtitle => 'Bildene dine blir i gruppen for de andre';

  @override
  String get deleteGroup => 'Slett gruppen';

  @override
  String get deleteGroupSubtitle => 'Alle bilder slettes for alle';

  @override
  String groupArchived(String groupName) {
    return '«$groupName» er arkivert';
  }

  @override
  String groupUnarchived(String groupName) {
    return '«$groupName» er tilbake blant albumene dine';
  }

  @override
  String get undo => 'Angre';

  @override
  String get groupNameTitle => 'Navn på gruppen';

  @override
  String get finishTripTitle => 'Avslutte turen?';

  @override
  String get finishTripMessage =>
      'Sluttdatoen blir i dag. Du kan fortsatt legge til bilder; tilbakeblikket er klart.';

  @override
  String get finishTripConfirm => 'Avslutt';

  @override
  String get tripFinished => 'Turen er avsluttet';

  @override
  String leaveGroupTitle(String groupName) {
    return 'Forlate «$groupName»?';
  }

  @override
  String get leaveGroupMessage =>
      'Bildene dine blir i gruppen for de andre. Du kan bli med igjen senere med koden.';

  @override
  String get leave => 'Forlat';

  @override
  String groupDeleted(String groupName) {
    return '«$groupName» er slettet';
  }

  @override
  String get youAreAdmin => 'du er admin';

  @override
  String get open => 'Åpne';

  @override
  String get archiveMenuSubtitle => 'Bare for deg, de andre merker ingenting';

  @override
  String get deleteGroupMenuSubtitle => 'For alle, med alle bilder';

  @override
  String get deleteGroupTitle => 'Slette gruppen?';

  @override
  String deleteGroupMessage(int count, String groupName, int memberCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Alle $count bilder og videoer',
      one: 'Bildet eller videoen',
    );
    String _temp1 = intl.Intl.pluralLogic(
      memberCount,
      locale: localeName,
      other: 'alle $memberCount medlemmer',
      one: 'det eneste medlemmet',
    );
    return '$_temp0 i «$groupName» forsvinner for $_temp1. Dette kan ikke angres.';
  }

  @override
  String get deleteGroupOwnRoll => 'Din egen kamerarull forblir uendret.';

  @override
  String get deleteGroupTypeName => 'Skriv navnet på gruppen for å bekrefte:';

  @override
  String get deleteForEveryone => 'Slett for alle';

  @override
  String get save => 'Lagre';

  @override
  String get yourAlbums => 'Albumene dine';

  @override
  String get uploadQueue => 'Opplastingskø';

  @override
  String get noConnection => 'Ingen tilkobling';

  @override
  String get albumsOfflineMessage =>
      'Albumene dine lastes inn når du har internett igjen. Kameraet fungerer likevel.';

  @override
  String get retry => 'Prøv igjen';

  @override
  String get noAlbumsTitle => 'Ingen album ennå';

  @override
  String get noAlbumsMessage =>
      'Lag en gruppe for neste tur, eller bli med i gruppen til en venn med koden.';

  @override
  String get haveCode => 'Jeg har en kode';

  @override
  String get joinWithCode => 'Bli med med kode eller QR-kode';

  @override
  String get camera => 'Kamera';

  @override
  String get restore => 'Gjenopprett';

  @override
  String get more => 'Mer';

  @override
  String get newAlbum => 'Ny';

  @override
  String get closedTag => 'stengt';

  @override
  String get activeTag => 'aktiv';

  @override
  String get uploadFailed => 'Opplastingen mislyktes';

  @override
  String get queueNoSignal => 'Ingen dekning.';

  @override
  String get queueNoSignalMessage =>
      'Bildene dine ligger allerede i albumet ditt og deles så snart du har internett igjen.';

  @override
  String get queueWaitingForWifi => 'Venter på Wi-Fi.';

  @override
  String queueWifiOnlyOn(String setting) {
    return 'Du har slått på «$setting».';
  }

  @override
  String get queueVideosWifiOnly => 'Videoer lastes bare opp via Wi-Fi.';

  @override
  String get queueAllShared => 'Alt er delt ✓';

  @override
  String queuePending(String items) {
    return '$items gjenstår å dele';
  }

  @override
  String queuePendingBoth(String photos, String videos) {
    return '$photos og $videos gjenstår å dele';
  }

  @override
  String get retryUpload => 'Prøv igjen';

  @override
  String get removeFromQueue => 'Fjern fra køen';

  @override
  String get queueStatusWifi => 'Wi-Fi';

  @override
  String get queueStatusWaiting => 'venter';

  @override
  String get videosWifiOnlyTitle => 'Videoer bare via Wi-Fi';

  @override
  String get videosWifiOnlySubtitle => 'Sparer mobildata';

  @override
  String get retryNow => 'Prøv igjen nå';

  @override
  String get yourName => 'Navnet ditt';

  @override
  String get settings => 'Innstillinger';

  @override
  String get tapToChangeName => 'Trykk for å endre navnet ditt';

  @override
  String get getCamTripPro => 'Skaff CamTrip Pro';

  @override
  String get photos => 'Bilder';

  @override
  String get saveOwnPhotos => 'Lagre egne bilder i ett album per gruppe';

  @override
  String get autoSaveOthers => 'Lagre andres bilder automatisk';

  @override
  String get wifiOnlyTitle => 'Last opp bare via Wi-Fi';

  @override
  String get dateStamp => 'Datostempel';

  @override
  String get notifications => 'Varsler';

  @override
  String get notifyNewPhotos => 'Nye bilder (samlet)';

  @override
  String get notifyRecapReady => 'Tilbakeblikk klart';

  @override
  String get camTripTeam => 'CamTrip-teamet';

  @override
  String get adminEntrySubtitle => 'Brukere, gi Pro, rapporter og tall';

  @override
  String get account => 'Konto';

  @override
  String get manageSubscription => 'Administrer abonnement';

  @override
  String get blockedPeople => 'Blokkerte personer';

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
  String get privacyPolicy => 'Personvernerklæring';

  @override
  String get contact => 'Kontakt';

  @override
  String get signOut => 'Logg ut';

  @override
  String get deleteAccount => 'Slett konto';

  @override
  String get deleteAccountSubtitle =>
      'Sletter kontoen din og alle bildene dine';

  @override
  String get deleteAccountTitle => 'Slette kontoen?';

  @override
  String get deleteAccountMessage =>
      'Kontoen din og alle bildene og videoene dine slettes, også fra gruppene. Et aktivt abonnement sier du opp i App Store eller Google Play.';

  @override
  String get blockedTitle => 'Blokkert';

  @override
  String get blockedSubtitle => 'Du ser ikke bilder fra disse personene.';

  @override
  String get blockedNone => 'Du har ikke blokkert noen.';

  @override
  String get unblockShort => 'Opphev';

  @override
  String get groupGone =>
      'Denne gruppen finnes ikke lenger, eller du er ikke lenger medlem.';

  @override
  String photosSavedToAlbum(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bilder lagret i «$album»',
      one: '1 bilde lagret i «$album»',
    );
    return '$_temp0';
  }

  @override
  String photosDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bilder slettet',
      one: '1 bilde slettet',
    );
    return '$_temp0';
  }

  @override
  String photosDeletedSkipped(int count, int skipped) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bilder slettet',
      one: '1 bilde slettet',
    );
    return '$_temp0, $skipped hoppet over';
  }

  @override
  String photosHiddenForYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bilder skjult for deg',
      one: '1 bilde skjult for deg',
    );
    return '$_temp0';
  }

  @override
  String get addedToFavorites => 'Lagt til i favoritter';

  @override
  String get removedFromFavorites => 'Fjernet fra favoritter';

  @override
  String get photoAccessSettings =>
      'Gi CamTrip tilgang til bildene dine i Innstillinger';

  @override
  String photosBeingAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bilder legges til',
      one: '1 bilde legges til',
    );
    return '$_temp0';
  }

  @override
  String photosUnreadable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bilder kunne ikke leses',
      one: '1 bilde kunne ikke leses',
    );
    return '$_temp0';
  }

  @override
  String get groupNotLoaded => 'Gruppen ble ikke lastet inn';

  @override
  String get noFavoritesTitle => 'Ingen favoritter ennå';

  @override
  String get noPhotosTitle => 'Ingen bilder ennå';

  @override
  String get noFavoritesMessage =>
      'Trykk på stjernen ved et bilde for å legge det her.';

  @override
  String get noPhotosMessage =>
      'Ta det første bildet. Alle i gruppen ser det med en gang.';

  @override
  String get openCamera => 'Åpne kameraet';

  @override
  String savingProgress(int done, int total) {
    return 'Lagrer... $done/$total';
  }

  @override
  String get choosePhotos => 'Velg bilder';

  @override
  String selectedCount(int count) {
    return '$count valgt';
  }

  @override
  String get selectNone => 'Velg ingen';

  @override
  String get selectAll => 'Velg alle';

  @override
  String photosWaitingToShare(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bilder venter på å bli delt',
      one: '1 bilde venter på å bli delt',
    );
    return '$_temp0';
  }

  @override
  String get recapReadyTitle => 'Tilbakeblikket ditt er klart';

  @override
  String get recapReadySubtitle => 'En video med musikk fra turen deres';

  @override
  String get watch => 'Se';

  @override
  String get makeRecapNow => 'Lag en tilbakeblikk-video nå';

  @override
  String freeGroupDeleteNotice(String date) {
    return 'Gratisgruppe: bildene lagres til $date. Lagre dem eller skaff Pro.';
  }

  @override
  String get filterAll => 'Alle';

  @override
  String get filterFavorites => 'Favoritter';

  @override
  String get filterPerPerson => 'Per person';

  @override
  String get filterPerson => 'Person';

  @override
  String get select => 'Velg';

  @override
  String get hiddenFilter => 'Skjulte';

  @override
  String get photosBy => 'Bilder av...';

  @override
  String get uploadedTag => 'lastet opp';

  @override
  String get saveAll => 'Lagre alle';

  @override
  String get favorite => 'Favoritt';

  @override
  String get unfavorite => 'Ikke favoritt';

  @override
  String get hide => 'Skjul';

  @override
  String get delete => 'Slett';

  @override
  String deletePhotosTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Slette $count bilder?',
      one: 'Slette bildet?',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'De forsvinner for alle i gruppen. Dette kan ikke angres.',
      one: 'Det forsvinner for alle i gruppen. Dette kan ikke angres.',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosNotAllowed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count bilder tilhører noen andre. De blir værende; bare en admin kan slette dem.',
      one:
          '1 bilde tilhører noen andre. Det blir værende; bare en admin kan slette det.',
    );
    return '$_temp0';
  }

  @override
  String photosBackInGroup(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bilder er tilbake i gruppen',
      one: '1 bilde er tilbake i gruppen',
    );
    return '$_temp0';
  }

  @override
  String get showAll => 'Vis alle';

  @override
  String get hiddenPhotosExplainer =>
      'Bare du ser ikke lenger disse bildene. For de andre i gruppen er de der fortsatt.';

  @override
  String get nothingHidden => 'Ingenting skjult';

  @override
  String get nothingHiddenMessage => 'Bilder du skjuler, finner du her.';

  @override
  String showAgainCount(int count) {
    return 'Vis igjen ($count)';
  }

  @override
  String get someone => 'Noen';

  @override
  String get savedToAlbum => 'Lagret i fotoalbumet ditt';

  @override
  String get share => 'Del';

  @override
  String get shareFailed => 'Kunne ikke dele';

  @override
  String get reportTitle => 'Hvorfor rapporterer du dette bildet?';

  @override
  String get reportSubtitle =>
      'Vi går gjennom alle rapporter innen 24 timer. Bildet skjules for deg med en gang.';

  @override
  String get reportThanks => 'Takk, vi ser på det';

  @override
  String blockMessageAllGroups(String name) {
    return 'Du ser ikke lenger bilder og videoer fra $name i noen gruppe og får ingen varsler om dem. Du kan angre dette i Innstillinger.';
  }

  @override
  String userBlocked(String name) {
    return '$name er blokkert';
  }

  @override
  String get videoHiddenForYou => 'Video skjult for deg';

  @override
  String get photoHiddenForYou => 'Bilde skjult for deg';

  @override
  String get setAsCover => 'Bruk som omslag';

  @override
  String get coverUpdated => 'Omslagsbildet er endret';

  @override
  String get hideForMe => 'Skjul for meg';

  @override
  String get hideForMeSubtitle => 'De andre i gruppen ser det fortsatt';

  @override
  String get reportPhoto => 'Rapporter bilde';

  @override
  String blockName(String name) {
    return 'Blokker $name';
  }

  @override
  String get forEveryoneInGroup => 'For alle i gruppen';

  @override
  String get videoDeleted => 'Video slettet';

  @override
  String get photoDeleted => 'Bilde slettet';

  @override
  String get photoAccessToSave =>
      'Gi CamTrip tilgang til bildene dine i Innstillinger for å lagre';

  @override
  String get phoneFull => 'Telefonen din er full';

  @override
  String get albumSaveFailedShort => 'Kunne ikke lagre i albumet';

  @override
  String get recapTemplateGoldenHour => 'Golden Hour';

  @override
  String get recapTemplateFast => 'Rask';

  @override
  String get recapTemplateFilmRoll => 'Filmrull';

  @override
  String get recapTemplatePolaroid => 'Polaroid';

  @override
  String get trackSummerEvening => 'Sommerkveld';

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
      one: '1 venn',
    );
    return '$_temp0';
  }

  @override
  String get madeWithCamTrip => 'Laget med CamTrip';

  @override
  String get tagline => 'Én filmrull for hele gjengen';

  @override
  String get videoUnsupportedDevice =>
      'Kunne ikke lage videoen på denne enheten';

  @override
  String get groupLoadFailed => 'Kunne ikke laste inn gruppen.';

  @override
  String recapNeedsPhotos(int count) {
    return 'Du trenger minst $count bilder for et tilbakeblikk.';
  }

  @override
  String get recapFailed => 'Kunne ikke lage tilbakeblikket. Prøv igjen.';

  @override
  String get recapSaved => 'Tilbakeblikket er lagret i fotoalbumet ditt';

  @override
  String get recap => 'Tilbakeblikk';

  @override
  String get recapRendering => 'Lager tilbakeblikk...';

  @override
  String get videoRendering => 'Lager video...';

  @override
  String get template => 'Mal';

  @override
  String get musicLicense => 'CamTrips egen musikk · royaltyfri';

  @override
  String get change => 'Bytt';

  @override
  String get noWatermark => 'Uten vannmerke ✓';

  @override
  String get removeWatermarkPro => 'Fjern vannmerket med Pro';

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
    return 'Pro ($source), ingen sluttdato';
  }

  @override
  String proStatusUntil(String source, String date) {
    return 'Pro ($source), til $date';
  }

  @override
  String get lifetime => 'Livstid';

  @override
  String get pickDate => 'Velg dato';

  @override
  String get noAccess => 'Ingen tilgang';

  @override
  String get adminOnlyTeam => 'Administrasjon er bare for CamTrip-teamet.';

  @override
  String get adminOverview => 'Oversikt';

  @override
  String get adminUsers => 'Brukere';

  @override
  String get adminReports => 'Rapporter';

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
  String get adminNewThisWeek => 'Nye denne uken';

  @override
  String get adminGroups => 'Grupper';

  @override
  String get adminProSubscription => 'Pro via abonnement';

  @override
  String get adminProGift => 'Pro i gave';

  @override
  String adminWithoutSubscription(int count) {
    return '$count uten abonnement';
  }

  @override
  String get adminOpenReports => 'Åpne rapporter';

  @override
  String get adminSearchHint => 'Søk på navn eller e-post';

  @override
  String get nobodyFound => 'Fant ingen';

  @override
  String get loadMore => 'Last inn flere';

  @override
  String get noEmail => 'Ingen e-post';

  @override
  String adminDeletePhotoMessage(String groupName) {
    return 'Bildet forsvinner for alle i «$groupName». Alle rapporter om bildet blir behandlet.';
  }

  @override
  String get adminBanMessage =>
      'Kontoen kan ikke lenger logge inn eller bruke appen. Du kan angre dette senere.';

  @override
  String get adminDismissTitle => 'Avvise rapporten?';

  @override
  String get adminDismissMessage =>
      'Bildet blir værende. Rapporten merkes som behandlet.';

  @override
  String get adminDismiss => 'Avvis';

  @override
  String get adminAccountBlocked => 'Kontoen er blokkert';

  @override
  String get adminReportDismissed => 'Rapporten er avvist';

  @override
  String get adminNoReports => 'Ingen åpne rapporter';

  @override
  String get adminNoReportsMessage => 'Rapporterte bilder vises her.';

  @override
  String get deletedTag => 'Slettet';

  @override
  String adminReportedBy(String name) {
    return 'Av $name';
  }

  @override
  String adminPhotoBy(String name) {
    return 'Bilde av $name';
  }

  @override
  String reportsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count rapporter',
      one: '1 rapport',
    );
    return '$_temp0';
  }

  @override
  String get adminDeletePhoto => 'Slett bilde';

  @override
  String get adminBlockCreator => 'Blokker fotografen';

  @override
  String get loadFailed => 'Kunne ikke laste inn';

  @override
  String get adminLifetimeProGiven => 'Livstids-Pro gitt';

  @override
  String get adminProGiven => 'Pro gitt';

  @override
  String adminGiveProUntil(String date) {
    return 'Gi Pro til $date';
  }

  @override
  String get adminGiveProLifetime => 'Gi Pro på livstid';

  @override
  String adminGiveProFor(String period) {
    return 'Gi Pro i $period';
  }

  @override
  String get adminReasonHint => 'Grunn, f.eks. venn, tester, influencer';

  @override
  String get adminGivePro => 'Gi Pro';

  @override
  String get adminRevokeTitle => 'Trekke tilbake gaven?';

  @override
  String get adminRevokeMessage =>
      'Den gitte Pro-tilgangen stopper med en gang. Et eget abonnement fortsetter som vanlig.';

  @override
  String get adminRevoke => 'Trekk tilbake';

  @override
  String get adminGiftRevoked => 'Gaven er trukket tilbake';

  @override
  String get adminUnbanTitle => 'Oppheve blokkeringen?';

  @override
  String adminUnbanMessage(String name) {
    return '$name kan logge inn igjen.';
  }

  @override
  String get adminUnbanned => 'Blokkeringen er opphevet';

  @override
  String get adminBanUserMessage =>
      'Kontoen kan ikke lenger logge inn eller bruke appen. Bildene blir værende.';

  @override
  String get adminUser => 'Bruker';

  @override
  String get adminNotVerified => 'ikke bekreftet';

  @override
  String get adminRole => 'Rolle';

  @override
  String get adminCreated => 'Opprettet';

  @override
  String get unknown => 'Ukjent';

  @override
  String get adminSignInWith => 'Logger inn med';

  @override
  String get adminEmailMethod => 'E-post';

  @override
  String get adminPhotosAndVideos => 'Bilder og videoer';

  @override
  String get adminStatus => 'Status';

  @override
  String get adminActive => 'Aktivt';

  @override
  String adminActiveUntil(String date) {
    return 'Aktivt til $date';
  }

  @override
  String adminGiftFrom(String name) {
    return 'Gave fra $name';
  }

  @override
  String adminExpiredOn(String date) {
    return 'Utløp $date';
  }

  @override
  String get adminExpired => 'Utløpt';

  @override
  String adminUntil(String date) {
    return 'Til $date';
  }

  @override
  String get adminGiveProTitle => 'Gi Pro';

  @override
  String get adminGiveProNote =>
      'Gjelder også for gruppene til denne personen: én Pro i gruppen = Pro for alle i gruppen.';

  @override
  String get adminRevokeGift => 'Trekk tilbake gaven';

  @override
  String get adminModeration => 'Moderering';

  @override
  String get adminCannotBanSelf => 'Du kan ikke blokkere deg selv.';

  @override
  String get adminCannotBanAdmin => 'En admin kan ikke blokkeres.';

  @override
  String get adminUnban => 'Opphev blokkering';

  @override
  String get adminBanAccount => 'Blokker konto';

  @override
  String get googleSignInUnavailable =>
      'Innlogging med Google er ikke tilgjengelig ennå';
}
