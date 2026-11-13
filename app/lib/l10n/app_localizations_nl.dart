// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get cancel => 'Annuleer';

  @override
  String get yes => 'Ja';

  @override
  String inviteMessageIntro(String groupName) {
    return 'Doe je mee met \"$groupName\" op CamTrip? Dan zien we elkaars foto\'s meteen.';
  }

  @override
  String inviteMessageCode(String code) {
    return 'Of vul de code in: $code';
  }

  @override
  String get memberFallbackName => 'Vriend';

  @override
  String get reportReasonInappropriate => 'Ongepast of aanstootgevend';

  @override
  String get reportReasonSpam => 'Spam';

  @override
  String get reportReasonOther => 'Iets anders';

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
  String get errorOffline => 'Geen verbinding. Probeer het zo nog eens.';

  @override
  String errorSomethingWrongStatus(int status) {
    return 'Er ging iets mis ($status)';
  }

  @override
  String get errorSomethingWrong => 'Er ging iets mis';

  @override
  String get apiInvalidCredentials => 'E-mailadres of wachtwoord klopt niet';

  @override
  String get apiInvalidCode =>
      'Deze code klopt niet of is verlopen. Vraag een nieuwe code aan.';

  @override
  String get apiEmailTaken =>
      'Er bestaat al een account met dit e-mailadres. Log in, of kies \"Wachtwoord vergeten?\".';

  @override
  String apiEmailTakenProvider(String provider) {
    return 'Er bestaat al een account met dit e-mailadres. Log in met $provider.';
  }

  @override
  String apiWeakPassword(int min) {
    return 'Kies een wachtwoord van minstens $min tekens';
  }

  @override
  String apiNameTooLong(int max) {
    return 'Je naam mag maximaal $max tekens zijn';
  }

  @override
  String get apiRateLimited =>
      'Te veel pogingen. Probeer het over een kwartier opnieuw.';

  @override
  String apiAccountBanned(String email) {
    return 'Je account is geblokkeerd. Neem contact op met $email als je denkt dat dit niet klopt.';
  }

  @override
  String get apiProRequired => 'Deze camerastijl hoort bij CamTrip Pro';

  @override
  String get apiGroupClosed => 'Deze groep is afgesloten';

  @override
  String get apiGroupCodeNotFound => 'Geen groep gevonden met deze code';

  @override
  String apiGroupFull(int max) {
    return 'Deze groep zit vol (max. $max leden). Heeft één lid CamTrip Pro, dan kunnen er onbeperkt mensen bij.';
  }

  @override
  String get apiLastMember =>
      'Je bent het laatste lid. Verwijder de groep in plaats daarvan.';

  @override
  String get apiAdminRequired => 'Alleen voor beheerders van CamTrip';

  @override
  String get apiUploadIncomplete => 'Upload is niet compleet';

  @override
  String get apiInvalidInput => 'Ongeldige invoer';

  @override
  String get apiNotSignedIn => 'Niet ingelogd';

  @override
  String get apiAccountGone => 'Account bestaat niet meer';

  @override
  String get apiPhotoNotFound => 'Foto niet gevonden';

  @override
  String get apiGroupNotFound => 'Groep niet gevonden';

  @override
  String get apiMemberNotFound => 'Lid niet gevonden';

  @override
  String get apiPersonNotFound => 'Persoon niet gevonden';

  @override
  String get apiUserNotFound => 'Gebruiker niet gevonden';

  @override
  String get apiAdminOnly => 'Alleen de beheerder kan dit doen';

  @override
  String get apiCannotBlockSelf => 'Je kunt jezelf niet blokkeren';

  @override
  String get apiCannotReportOwn => 'Je kunt je eigen foto niet rapporteren';

  @override
  String get apiDeleteOwnOnly => 'Je kunt alleen je eigen foto\'s verwijderen';

  @override
  String get apiOwnerCannotBeRemoved =>
      'De maker van de groep kan niet verwijderd worden';

  @override
  String get apiOwnerStaysAdmin => 'De maker blijft beheerder';

  @override
  String get apiNeedsOneAdmin => 'Een groep heeft minstens één beheerder nodig';

  @override
  String get apiEndBeforeStart => 'Einddatum ligt voor de begindatum';

  @override
  String get apiPermanentNoEndDate =>
      'Een groep die altijd open is heeft geen einddatum';

  @override
  String get apiCannotBanAdmin => 'Een beheerder kan niet geblokkeerd worden';

  @override
  String get apiReportNotFound => 'Melding niet gevonden';

  @override
  String get apiPhotoOwnerUnknown =>
      'De maker van deze foto is niet meer bekend';

  @override
  String get validationNameRequired => 'Vul je naam in';

  @override
  String validationMaxChars(int max) {
    return 'Maximaal $max tekens';
  }

  @override
  String get validationEmailRequired => 'Vul je e-mailadres in';

  @override
  String get validationEmailInvalid => 'Dit e-mailadres klopt niet';

  @override
  String get validationPasswordRequired => 'Kies een wachtwoord';

  @override
  String validationMinChars(int min) {
    return 'Minstens $min tekens';
  }

  @override
  String get validationPasswordTooLong => 'Dit wachtwoord is te lang';

  @override
  String get validationPasswordEmpty => 'Vul je wachtwoord in';

  @override
  String get validationCodeRequired => 'Vul de code uit de mail in';

  @override
  String get validationCodeDigits => 'De code bestaat uit 6 cijfers';

  @override
  String get onboarding1Title => 'Eén rolletje\nvoor de hele groep.';

  @override
  String get onboarding1Body =>
      'Schiet met een retro-camera. Iedereen ziet je foto\'s direct, en ze staan meteen in je eigen album.';

  @override
  String get onboarding2Title => 'Geen gedoe met\ndoorsturen.';

  @override
  String get onboarding2Body =>
      'Maak een groep, deel de code, klaar. Nooit meer \"stuur je die foto\'s nog even?\"';

  @override
  String get onboarding3Title => 'Na afloop een\nrecap-video.';

  @override
  String get onboarding3Body =>
      'CamTrip maakt een video met muziek van jullie mooiste momenten.';

  @override
  String get onboardingInvited => 'Je bent uitgenodigd! Log in om mee te doen.';

  @override
  String get signInAppleFailed => 'Inloggen met Apple lukte niet';

  @override
  String get signInGoogleFailed => 'Inloggen met Google lukte niet';

  @override
  String get signInFailed => 'Inloggen lukte niet';

  @override
  String get next => 'Verder';

  @override
  String get legalPrefix => 'Door verder te gaan ga je akkoord met de ';

  @override
  String get legalTerms => 'voorwaarden';

  @override
  String get legalAnd => ' en het ';

  @override
  String get legalPrivacy => 'privacybeleid';

  @override
  String get legalSuffix => '.';

  @override
  String get continueWithApple => 'Doorgaan met Apple';

  @override
  String get continueWithGoogle => 'Doorgaan met Google';

  @override
  String get createAccount => 'Account aanmaken';

  @override
  String get signIn => 'Inloggen';

  @override
  String get or => 'of';

  @override
  String get registerSubtitle => 'Zo zien je vrienden wie de foto\'s maakt.';

  @override
  String get loginSubtitle => 'Welkom terug.';

  @override
  String get forgotPasswordTitle => 'Wachtwoord vergeten';

  @override
  String get forgotPasswordPushSubtitle =>
      'Ben je nog ergens ingelogd? Dan sturen we daar een code van 6 cijfers als pushmelding om een nieuw wachtwoord in te stellen.';

  @override
  String get newPassword => 'Nieuw wachtwoord';

  @override
  String get resetPushInfo =>
      'Als je nog ergens ingelogd bent, krijg je daar een pushmelding met een code. Kom je er niet in? Log in met Apple of Google met hetzelfde e-mailadres - je account wordt dan gekoppeld.';

  @override
  String get sendCode => 'Stuur code';

  @override
  String get savePassword => 'Wachtwoord opslaan';

  @override
  String get errorTryAgain => 'Er ging iets mis. Probeer het opnieuw.';

  @override
  String get back => 'Terug';

  @override
  String get name => 'Naam';

  @override
  String get email => 'E-mailadres';

  @override
  String get codeFromPush => 'Code uit de pushmelding';

  @override
  String get password => 'Wachtwoord';

  @override
  String get hidePassword => 'Verberg wachtwoord';

  @override
  String get showPassword => 'Toon wachtwoord';

  @override
  String get forgotPasswordLink => 'Wachtwoord vergeten?';

  @override
  String get haveAccount => 'Heb je al een account?';

  @override
  String get newToCamTrip => 'Nieuw bij CamTrip?';

  @override
  String get rememberedIt => 'Weet je het weer?';

  @override
  String get noCodeReceived => 'Geen code gekregen?';

  @override
  String get resendCode => 'Opnieuw sturen';

  @override
  String onboardingDemoRoll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotografen, 1 rolletje',
      one: '1 fotograaf, 1 rolletje',
    );
    return '$_temp0';
  }

  @override
  String membersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count leden',
      one: '1 lid',
    );
    return '$_temp0';
  }

  @override
  String photosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto\'s',
      one: '1 foto',
    );
    return '$_temp0';
  }

  @override
  String videosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count video\'s',
      one: '1 video',
    );
    return '$_temp0';
  }

  @override
  String get justNow => 'nu';

  @override
  String get badgeNew => 'Nieuw';

  @override
  String recapTitle(String groupName) {
    return 'Recap $groupName';
  }

  @override
  String get styleFilm => 'Film';

  @override
  String get styleInstant => 'Instant';

  @override
  String get styleDisposable => 'Wegwerp';

  @override
  String get styleBw => 'Z/W';

  @override
  String get styleGolden => 'Golden';

  @override
  String get styleChrome => 'Chrome';

  @override
  String get styleFilmDescription =>
      'Warme kleuren, korrel en een oranje datumstempel';

  @override
  String get styleInstantDescription => 'Zachte kleuren en een witte rand';

  @override
  String get styleDisposableDescription => 'Harde flits, vignet en lichtlekken';

  @override
  String get styleBwDescription => 'Korrelig zwart-wit met diep contrast';

  @override
  String get styleGoldenDescription =>
      'Altijd golden hour, zachte gouden gloed';

  @override
  String get styleChromeDescription =>
      'Koel, verzadigd en scherp, als dia-film';

  @override
  String get shutterStopRecording => 'Stop opname';

  @override
  String get shutterStartRecording => 'Start video-opname';

  @override
  String get shutterTakePhoto => 'Maak foto';

  @override
  String get modePhoto => 'Foto';

  @override
  String get modeVideo => 'Video';

  @override
  String get cameraNotFound => 'Geen camera gevonden';

  @override
  String get cameraAccessNeeded =>
      'CamTrip heeft toegang tot je camera nodig. Zet dit aan in Instellingen.';

  @override
  String get cameraStartFailed => 'Camera kon niet starten';

  @override
  String get albumAccessNeeded =>
      'Geef CamTrip toegang tot je foto\'s om ze ook in je album op te slaan';

  @override
  String get albumSaveFailed =>
      'Opslaan in je album lukte niet. De foto wordt wel gedeeld.';

  @override
  String styleProFallback(String style) {
    return 'Deze stijl hoort bij Pro. In deze groep schiet je met $style.';
  }

  @override
  String get photoFailed => 'Foto maken lukte niet. Probeer het nog eens.';

  @override
  String get recordingFailed => 'Video opnemen lukte niet';

  @override
  String get videoFailed => 'Video maken lukte niet. Probeer het nog eens.';

  @override
  String get shootInGroup => 'Schiet in groep';

  @override
  String get close => 'Sluiten';

  @override
  String get flash => 'Flits';

  @override
  String get flashOn => 'Aan';

  @override
  String get flashOff => 'Uit';

  @override
  String get flashAuto => 'Auto';

  @override
  String get chooseGroup => 'Kies groep';

  @override
  String get switchCamera => 'Wissel camera';

  @override
  String get createOrJoinFirst => 'Maak of join eerst een groep';

  @override
  String get proViaGroup => 'Pro via de groep';

  @override
  String proViaName(String name) {
    return 'Pro via $name';
  }

  @override
  String get proStylesFreeViaMember =>
      'Pro-stijlen in deze groep zijn gratis voor jou dankzij een Pro-lid';

  @override
  String proStylesFreeViaName(String name) {
    return 'Pro-stijlen in deze groep: gratis voor jou dankzij $name';
  }

  @override
  String get subscriptionsUnavailable =>
      'Abonnementen zijn nu niet beschikbaar. Probeer het later.';

  @override
  String get paymentPending =>
      'Je betaling wordt nog verwerkt. Pro gaat aan zodra die rond is.';

  @override
  String get purchaseFailed =>
      'Aankoop lukte niet. Probeer het later nog eens.';

  @override
  String get restoreUnavailable =>
      'Aankopen herstellen kan nu niet. Probeer het later.';

  @override
  String get restoreFailed =>
      'Herstellen lukte niet. Probeer het later nog eens.';

  @override
  String get welcomePro => 'Welkom bij CamTrip Pro! 🎉';

  @override
  String get proRestored => 'Pro is hersteld';

  @override
  String get noPurchaseFound => 'Geen eerdere aankoop gevonden';

  @override
  String periodDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dagen',
      one: '1 dag',
    );
    return '$_temp0';
  }

  @override
  String periodWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count weken',
      one: '1 week',
    );
    return '$_temp0';
  }

  @override
  String periodMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count maanden',
      one: '1 maand',
    );
    return '$_temp0';
  }

  @override
  String periodYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count jaar',
      one: '1 jaar',
    );
    return '$_temp0';
  }

  @override
  String get paywallHavePro => 'Je hebt CamTrip Pro';

  @override
  String get paywallSubtitle => 'Alles voor je volgende trip.';

  @override
  String paywallFeatureStyles(String styles) {
    return 'Alle camerastijlen ($styles)';
  }

  @override
  String get paywallFeatureUnlimited =>
      'Onbeperkt leden en opslag, foto\'s blijven altijd bewaard';

  @override
  String get paywallFeatureNoWatermark => 'Recaps zonder watermerk';

  @override
  String get paywallFeatureOriginal => 'Originele kwaliteit downloaden';

  @override
  String get planYear => 'Jaar';

  @override
  String get planMonth => 'Maand';

  @override
  String pricePerMonth(String price) {
    return '$price per maand';
  }

  @override
  String paywallSaveBadge(int percent) {
    return 'BESPAAR $percent%';
  }

  @override
  String get planMonthCancelAnytime => 'maandelijks opzegbaar';

  @override
  String tryFree(String period) {
    return 'Probeer $period gratis';
  }

  @override
  String get becomePro => 'Word Pro';

  @override
  String get subscriptionsLoadFailed =>
      'Abonnementen konden niet geladen worden. Controleer je verbinding.';

  @override
  String legalAnnual(String price) {
    return 'CamTrip Pro jaarabonnement: $price per jaar.';
  }

  @override
  String legalAnnualTrial(String period, String price) {
    return 'CamTrip Pro jaarabonnement: $period gratis, daarna $price per jaar.';
  }

  @override
  String legalMonthly(String price) {
    return 'CamTrip Pro maandabonnement: $price per maand.';
  }

  @override
  String legalMonthlyTrial(String period, String price) {
    return 'CamTrip Pro maandabonnement: $period gratis, daarna $price per maand.';
  }

  @override
  String get legalBillingApple =>
      'De betaling loopt via je Apple ID. Het abonnement verlengt automatisch, tenzij je het uiterlijk 24 uur voor het einde van de periode opzegt. Opzeggen en beheren kan in de instellingen van je App Store-account.';

  @override
  String get legalBillingGoogle =>
      'De betaling loopt via je Google-account. Het abonnement verlengt automatisch, tenzij je het uiterlijk 24 uur voor het einde van de periode opzegt. Opzeggen en beheren kan in de instellingen van je Google Play-account.';

  @override
  String get restorePurchases => 'Herstel aankopen';

  @override
  String get terms => 'Voorwaarden';

  @override
  String get privacy => 'Privacy';

  @override
  String get groupProTitle =>
      'Eén Pro in de groep = Pro voor iedereen in die groep';

  @override
  String get groupProBody =>
      'Heeft één iemand Pro, dan krijgt de hele groep alle camerastijlen, onbeperkt leden, foto\'s die bewaard blijven, originele kwaliteit en recaps zonder watermerk.';

  @override
  String get groupCreated => 'Groep aangemaakt ✓';

  @override
  String get inviteFriends => 'Nodig je vrienden uit';

  @override
  String get codeCopied => 'Code gekopieerd';

  @override
  String get shareLink => 'Deel link';

  @override
  String inviteSubject(String groupName) {
    return 'Doe mee met $groupName op CamTrip';
  }

  @override
  String inviteMembersUnlimited(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count leden',
      one: '1 lid',
    );
    return '$_temp0 · onbeperkt (Pro)';
  }

  @override
  String inviteMembersLimit(int count, int limit) {
    return '$count van $limit leden · Pro: onbeperkt';
  }

  @override
  String get toCamera => 'Naar de camera';

  @override
  String get done => 'Klaar';

  @override
  String get joinEnterCode => 'Vul de code van 6 tekens in';

  @override
  String get joinGroupTitle => 'Join een groep';

  @override
  String get joinGroupSubtitle =>
      'Vul de code van je vrienden in, of scan hun QR-code.';

  @override
  String get typeCode => 'Typ code';

  @override
  String get scanQr => 'Scan QR';

  @override
  String get join => 'Join';

  @override
  String get groupNameRequired => 'Geef je groep een naam';

  @override
  String get newGroup => 'Nieuwe groep';

  @override
  String get groupType => 'Soort groep';

  @override
  String get groupTypeVacation => 'Vakantie';

  @override
  String get groupTypeVacationDescription =>
      'Met begin- en einddatum, daarna archief';

  @override
  String get groupTypeEvent => 'Event';

  @override
  String get groupTypeEventDescription => 'Eén dag of avond, bijv. een feest';

  @override
  String get groupTypePermanent => 'Altijd open';

  @override
  String get groupTypePermanentDescription => 'Voor je vaste vriendengroep';

  @override
  String get date => 'Datum';

  @override
  String get departure => 'Vertrek';

  @override
  String get returnDate => 'Terug';

  @override
  String get defaultCameraStyle => 'Standaard camerastijl';

  @override
  String freeLimitPermanent(int max) {
    return 'Gratis: tot $max leden. Met Pro onbeperkt.';
  }

  @override
  String freeLimitDated(int max, int days) {
    return 'Gratis: tot $max leden, foto\'s blijven tot $days dagen na de einddatum. Met Pro onbeperkt en voor altijd.';
  }

  @override
  String get createGroup => 'Groep aanmaken';

  @override
  String get group => 'Groep';

  @override
  String groupCode(String code) {
    return 'code $code';
  }

  @override
  String get manage => 'Beheer';

  @override
  String get rename => 'Naam wijzigen';

  @override
  String get changeDates => 'Datum wijzigen';

  @override
  String get finishTrip => 'Reis afronden';

  @override
  String get finishTripSubtitle => 'Zet de einddatum op vandaag';

  @override
  String get reopenGroup => 'Groep heropenen';

  @override
  String get closeGroup => 'Groep afsluiten';

  @override
  String get reopenGroupSubtitle => 'Leden kunnen weer foto\'s toevoegen';

  @override
  String get closeGroupSubtitle =>
      'Niemand kan nog foto\'s toevoegen; alles blijft te bekijken';

  @override
  String get members => 'Leden';

  @override
  String memberYou(String name) {
    return '$name (jij)';
  }

  @override
  String get blockedTag => 'geblokkeerd';

  @override
  String get adminTag => 'beheerder';

  @override
  String removeMemberTitle(String name) {
    return '$name verwijderen?';
  }

  @override
  String get removeMemberMessage => 'Hun foto\'s blijven in de groep.';

  @override
  String get remove => 'Verwijder';

  @override
  String get removeMember => 'Verwijder';

  @override
  String blockTitle(String name) {
    return '$name blokkeren?';
  }

  @override
  String blockMessage(String name) {
    return 'Je ziet geen foto\'s en video\'s van $name meer en krijgt er geen meldingen over. Opheffen kan in Instellingen.';
  }

  @override
  String get block => 'Blokkeer';

  @override
  String get makeMember => 'Maak gewoon lid';

  @override
  String get makeAdmin => 'Maak beheerder';

  @override
  String get removeFromGroup => 'Verwijder uit groep';

  @override
  String get unblock => 'Blokkering opheffen';

  @override
  String get inviteFriendsButton => 'Vrienden uitnodigen';

  @override
  String get you => 'Jij';

  @override
  String get unarchive => 'Terugzetten uit archief';

  @override
  String get archive => 'Archiveren';

  @override
  String get unarchiveSubtitle => 'De groep staat weer gewoon bij je albums';

  @override
  String archiveSubtitle(String section) {
    return 'Alleen voor jou: de groep gaat naar \"$section\" onderaan je albums';
  }

  @override
  String get archivedSection => 'Gearchiveerd';

  @override
  String get hiddenPhotos => 'Verborgen foto\'s';

  @override
  String get hiddenPhotosSubtitle =>
      'Foto\'s die je voor jezelf hebt verborgen';

  @override
  String get leaveGroup => 'Groep verlaten';

  @override
  String get leaveGroupSubtitle =>
      'Je foto\'s blijven in de groep voor de anderen';

  @override
  String get deleteGroup => 'Groep verwijderen';

  @override
  String get deleteGroupSubtitle =>
      'Alle foto\'s worden voor iedereen verwijderd';

  @override
  String groupArchived(String groupName) {
    return '\"$groupName\" gearchiveerd';
  }

  @override
  String groupUnarchived(String groupName) {
    return '\"$groupName\" staat weer bij je albums';
  }

  @override
  String get undo => 'Ongedaan maken';

  @override
  String get groupNameTitle => 'Naam van de groep';

  @override
  String get finishTripTitle => 'Reis afronden?';

  @override
  String get finishTripMessage =>
      'De einddatum wordt vandaag. Foto\'s toevoegen kan nog steeds; de recap staat klaar.';

  @override
  String get finishTripConfirm => 'Rond af';

  @override
  String get tripFinished => 'Reis afgerond';

  @override
  String leaveGroupTitle(String groupName) {
    return '\"$groupName\" verlaten?';
  }

  @override
  String get leaveGroupMessage =>
      'Je foto\'s blijven in de groep voor de anderen. Je kunt later weer joinen met de code.';

  @override
  String get leave => 'Verlaat';

  @override
  String groupDeleted(String groupName) {
    return '\"$groupName\" is verwijderd';
  }

  @override
  String get youAreAdmin => 'jij bent beheerder';

  @override
  String get open => 'Openen';

  @override
  String get archiveMenuSubtitle =>
      'Alleen voor jou, de anderen merken er niets van';

  @override
  String get deleteGroupMenuSubtitle => 'Voor iedereen, met alle foto\'s';

  @override
  String get deleteGroupTitle => 'Groep verwijderen?';

  @override
  String deleteGroupMessage(int count, String groupName, int memberCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto\'s en video\'s',
      one: '1 foto en video',
    );
    String _temp1 = intl.Intl.pluralLogic(
      memberCount,
      locale: localeName,
      other: '$memberCount leden',
      one: '1 lid',
    );
    return 'Alle $_temp0 in \"$groupName\" verdwijnen voor alle $_temp1. Dit kan niet ongedaan worden.';
  }

  @override
  String get deleteGroupOwnRoll => 'Je eigen fotorol blijft ongewijzigd.';

  @override
  String get deleteGroupTypeName =>
      'Typ de naam van de groep om te bevestigen:';

  @override
  String get deleteForEveryone => 'Verwijder voor iedereen';

  @override
  String get save => 'Opslaan';

  @override
  String get yourAlbums => 'Je albums';

  @override
  String get uploadQueue => 'Wachtrij';

  @override
  String get noConnection => 'Geen verbinding';

  @override
  String get albumsOfflineMessage =>
      'Je albums laden zodra je weer internet hebt. De camera werkt gewoon.';

  @override
  String get retry => 'Opnieuw';

  @override
  String get noAlbumsTitle => 'Nog geen albums';

  @override
  String get noAlbumsMessage =>
      'Maak een groep voor je volgende trip, of join die van een vriend met de code.';

  @override
  String get haveCode => 'Ik heb een code';

  @override
  String get joinWithCode => 'Join met een code of QR-code';

  @override
  String get camera => 'Camera';

  @override
  String get restore => 'Terugzetten';

  @override
  String get more => 'Meer';

  @override
  String get newAlbum => 'Nieuw';

  @override
  String get closedTag => 'afgesloten';

  @override
  String get activeTag => 'actief';

  @override
  String get uploadFailed => 'Upload mislukt';

  @override
  String get queueNoSignal => 'Geen bereik.';

  @override
  String get queueNoSignalMessage =>
      'Je foto\'s staan al in je album en worden gedeeld zodra je weer internet hebt.';

  @override
  String get queueWaitingForWifi => 'Wacht op wifi.';

  @override
  String queueWifiOnlyOn(String setting) {
    return 'Je hebt \"$setting\" aan staan.';
  }

  @override
  String get queueVideosWifiOnly => 'Video\'s gaan alleen via wifi.';

  @override
  String get queueAllShared => 'Alles is gedeeld ✓';

  @override
  String queuePending(String items) {
    return '$items nog te delen';
  }

  @override
  String queuePendingBoth(String photos, String videos) {
    return '$photos en $videos nog te delen';
  }

  @override
  String get retryUpload => 'Opnieuw proberen';

  @override
  String get removeFromQueue => 'Uit wachtrij halen';

  @override
  String get queueStatusWifi => 'wifi';

  @override
  String get queueStatusWaiting => 'wacht';

  @override
  String get videosWifiOnlyTitle => 'Video\'s alleen via wifi';

  @override
  String get videosWifiOnlySubtitle => 'Spaart je mobiele data';

  @override
  String get retryNow => 'Nu opnieuw proberen';

  @override
  String get yourName => 'Je naam';

  @override
  String get settings => 'Instellingen';

  @override
  String get tapToChangeName => 'Tik om je naam te wijzigen';

  @override
  String get getCamTripPro => 'Word CamTrip Pro';

  @override
  String get photos => 'Foto\'s';

  @override
  String get saveOwnPhotos => 'Eigen foto\'s opslaan in album per groep';

  @override
  String get autoSaveOthers => 'Foto\'s van anderen automatisch opslaan';

  @override
  String get wifiOnlyTitle => 'Alleen uploaden via wifi';

  @override
  String get dateStamp => 'Datumstempel';

  @override
  String get notifications => 'Meldingen';

  @override
  String get notifyNewPhotos => 'Nieuwe foto\'s (gebundeld)';

  @override
  String get notifyRecapReady => 'Recap klaar';

  @override
  String get camTripTeam => 'CamTrip-team';

  @override
  String get adminEntrySubtitle =>
      'Gebruikers, Pro geven, meldingen en cijfers';

  @override
  String get account => 'Account';

  @override
  String get manageSubscription => 'Abonnement beheren';

  @override
  String get blockedPeople => 'Geblokkeerde personen';

  @override
  String get nobody => 'Niemand';

  @override
  String peopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count personen',
      one: '1 persoon',
    );
    return '$_temp0';
  }

  @override
  String get privacyPolicy => 'Privacybeleid';

  @override
  String get contact => 'Contact';

  @override
  String get signOut => 'Uitloggen';

  @override
  String get deleteAccount => 'Account verwijderen';

  @override
  String get deleteAccountSubtitle => 'Verwijdert je account en al je foto\'s';

  @override
  String get deleteAccountTitle => 'Account verwijderen?';

  @override
  String get deleteAccountMessage =>
      'Je account en al je foto\'s en video\'s worden verwijderd, ook uit de groepen. Een lopend abonnement zeg je op via de App Store of Google Play.';

  @override
  String get blockedTitle => 'Geblokkeerd';

  @override
  String get blockedSubtitle => 'Je ziet geen foto\'s van deze mensen.';

  @override
  String get blockedNone => 'Je hebt niemand geblokkeerd.';

  @override
  String get unblockShort => 'Opheffen';

  @override
  String get groupGone =>
      'Deze groep bestaat niet meer, of je bent geen lid meer.';

  @override
  String photosSavedToAlbum(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto\'s opgeslagen in \"$album\"',
      one: '1 foto opgeslagen in \"$album\"',
    );
    return '$_temp0';
  }

  @override
  String photosDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto\'s verwijderd',
      one: '1 foto verwijderd',
    );
    return '$_temp0';
  }

  @override
  String photosDeletedSkipped(int count, int skipped) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto\'s verwijderd',
      one: '1 foto verwijderd',
    );
    return '$_temp0, $skipped overgeslagen';
  }

  @override
  String photosHiddenForYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto\'s verborgen voor jou',
      one: '1 foto verborgen voor jou',
    );
    return '$_temp0';
  }

  @override
  String get addedToFavorites => 'Toegevoegd aan favorieten';

  @override
  String get removedFromFavorites => 'Uit favorieten gehaald';

  @override
  String get photoAccessSettings =>
      'Geef CamTrip toegang tot je foto\'s in Instellingen';

  @override
  String photosBeingAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto\'s worden toegevoegd',
      one: '1 foto wordt toegevoegd',
    );
    return '$_temp0';
  }

  @override
  String photosUnreadable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto\'s konden niet worden gelezen',
      one: '1 foto kon niet worden gelezen',
    );
    return '$_temp0';
  }

  @override
  String get groupNotLoaded => 'Groep niet geladen';

  @override
  String get noFavoritesTitle => 'Nog geen favorieten';

  @override
  String get noPhotosTitle => 'Nog geen foto\'s';

  @override
  String get noFavoritesMessage =>
      'Tik op het sterretje bij een foto om hem hier te zetten.';

  @override
  String get noPhotosMessage =>
      'Maak de eerste foto. Iedereen in de groep ziet hem meteen.';

  @override
  String get openCamera => 'Open de camera';

  @override
  String savingProgress(int done, int total) {
    return 'Opslaan... $done/$total';
  }

  @override
  String get choosePhotos => 'Kies foto\'s';

  @override
  String selectedCount(int count) {
    return '$count geselecteerd';
  }

  @override
  String get selectNone => 'Niets selecteren';

  @override
  String get selectAll => 'Alles selecteren';

  @override
  String photosWaitingToShare(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto\'s wachten om gedeeld te worden',
      one: '1 foto wacht om gedeeld te worden',
    );
    return '$_temp0';
  }

  @override
  String get recapReadyTitle => 'Je recap is klaar';

  @override
  String get recapReadySubtitle => 'Video met muziek van jullie trip';

  @override
  String get watch => 'Bekijk';

  @override
  String get makeRecapNow => 'Maak nu een recap-video';

  @override
  String freeGroupDeleteNotice(String date) {
    return 'Gratis groep: foto\'s blijven tot $date. Sla ze op of neem Pro.';
  }

  @override
  String get filterAll => 'Alles';

  @override
  String get filterFavorites => 'Favorieten';

  @override
  String get filterPerPerson => 'Per persoon';

  @override
  String get filterPerson => 'Persoon';

  @override
  String get select => 'Selecteer';

  @override
  String get hiddenFilter => 'Verborgen';

  @override
  String get photosBy => 'Foto\'s van...';

  @override
  String get uploadedTag => 'geüpload';

  @override
  String get saveAll => 'Alles opslaan';

  @override
  String get favorite => 'Favoriet';

  @override
  String get unfavorite => 'Geen favoriet';

  @override
  String get hide => 'Verbergen';

  @override
  String get delete => 'Verwijderen';

  @override
  String deletePhotosTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto\'s verwijderen?',
      one: 'Foto verwijderen?',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Ze verdwijnen voor iedereen in de groep. Dit kan niet ongedaan worden.',
      one:
          'Hij verdwijnt voor iedereen in de groep. Dit kan niet ongedaan worden.',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosNotAllowed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count foto\'s zijn van iemand anders. Die blijven staan; alleen een beheerder kan ze verwijderen.',
      one:
          '1 foto is van iemand anders. Die blijft staan; alleen een beheerder kan hem verwijderen.',
    );
    return '$_temp0';
  }

  @override
  String photosBackInGroup(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto\'s staan weer in de groep',
      one: '1 foto staat weer in de groep',
    );
    return '$_temp0';
  }

  @override
  String get showAll => 'Alles tonen';

  @override
  String get hiddenPhotosExplainer =>
      'Alleen jij ziet deze foto\'s niet meer. Voor de anderen in de groep staan ze er gewoon.';

  @override
  String get nothingHidden => 'Niets verborgen';

  @override
  String get nothingHiddenMessage =>
      'Foto\'s die je verbergt, vind je hier terug.';

  @override
  String showAgainCount(int count) {
    return 'Weer tonen ($count)';
  }

  @override
  String get someone => 'Iemand';

  @override
  String get savedToAlbum => 'Opgeslagen in je fotoalbum';

  @override
  String get share => 'Delen';

  @override
  String get shareFailed => 'Delen lukte niet';

  @override
  String get reportTitle => 'Waarom rapporteer je deze foto?';

  @override
  String get reportSubtitle =>
      'We bekijken elke melding binnen 24 uur. De foto is meteen verborgen voor jou.';

  @override
  String get reportThanks => 'Bedankt, we kijken ernaar';

  @override
  String blockMessageAllGroups(String name) {
    return 'Je ziet geen foto\'s en video\'s van $name meer, in geen enkele groep, en krijgt er geen meldingen over. Opheffen kan in Instellingen.';
  }

  @override
  String userBlocked(String name) {
    return '$name is geblokkeerd';
  }

  @override
  String get videoHiddenForYou => 'Video verborgen voor jou';

  @override
  String get photoHiddenForYou => 'Foto verborgen voor jou';

  @override
  String get setAsCover => 'Als omslag instellen';

  @override
  String get coverUpdated => 'Omslagfoto aangepast';

  @override
  String get hideForMe => 'Verbergen voor mij';

  @override
  String get hideForMeSubtitle => 'De anderen in de groep zien hem nog wel';

  @override
  String get reportPhoto => 'Foto rapporteren';

  @override
  String blockName(String name) {
    return '$name blokkeren';
  }

  @override
  String get forEveryoneInGroup => 'Voor iedereen in de groep';

  @override
  String get videoDeleted => 'Video verwijderd';

  @override
  String get photoDeleted => 'Foto verwijderd';

  @override
  String get photoAccessToSave =>
      'Geef CamTrip toegang tot je foto\'s in Instellingen om op te slaan';

  @override
  String get phoneFull => 'Je telefoon is vol';

  @override
  String get albumSaveFailedShort => 'Opslaan in je album lukte niet';

  @override
  String get recapTemplateGoldenHour => 'Golden Hour';

  @override
  String get recapTemplateFast => 'Snel';

  @override
  String get recapTemplateFilmRoll => 'Filmrol';

  @override
  String get recapTemplatePolaroid => 'Polaroid';

  @override
  String get trackSummerEvening => 'Zomeravond';

  @override
  String get trackGoldenHour => 'Golden Hour';

  @override
  String get trackRoadtrip => 'Roadtrip';

  @override
  String get moodWarm => 'warm';

  @override
  String get moodCheerful => 'vrolijk';

  @override
  String friendsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count vrienden',
      one: '1 vriend',
    );
    return '$_temp0';
  }

  @override
  String get madeWithCamTrip => 'Gemaakt met CamTrip';

  @override
  String get tagline => 'Eén rolletje voor de hele groep';

  @override
  String get videoUnsupportedDevice => 'Video maken lukte niet op dit toestel';

  @override
  String get groupLoadFailed => 'Deze groep kon niet geladen worden.';

  @override
  String recapNeedsPhotos(int count) {
    return 'Je hebt minstens $count foto\'s nodig voor een recap.';
  }

  @override
  String get recapFailed => 'Recap maken lukte niet. Probeer het nog eens.';

  @override
  String get recapSaved => 'Recap opgeslagen in je fotoalbum';

  @override
  String get recap => 'Recap';

  @override
  String get recapRendering => 'Recap maken...';

  @override
  String get videoRendering => 'Video maken...';

  @override
  String get template => 'Template';

  @override
  String get musicLicense => 'eigen muziek van CamTrip · rechtenvrij';

  @override
  String get change => 'Wissel';

  @override
  String get noWatermark => 'Geen watermerk ✓';

  @override
  String get removeWatermarkPro => 'Watermerk weghalen met Pro';

  @override
  String get proSourceSubscription => 'Abonnement';

  @override
  String get proSourceGift => 'Cadeau';

  @override
  String get proSourceAdmin => 'Beheerder';

  @override
  String get proSourceGroup => 'Via groep';

  @override
  String get noPro => 'Geen Pro';

  @override
  String proStatusNoEnd(String source) {
    return 'Pro ($source), geen einddatum';
  }

  @override
  String proStatusUntil(String source, String date) {
    return 'Pro ($source), tot $date';
  }

  @override
  String get lifetime => 'Levenslang';

  @override
  String get pickDate => 'Kies datum';

  @override
  String get noAccess => 'Geen toegang';

  @override
  String get adminOnlyTeam => 'Beheer is alleen voor het CamTrip-team.';

  @override
  String get adminOverview => 'Overzicht';

  @override
  String get adminUsers => 'Gebruikers';

  @override
  String get adminReports => 'Meldingen';

  @override
  String adminsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count beheerders',
      one: '1 beheerder',
    );
    return '$_temp0';
  }

  @override
  String get adminNewThisWeek => 'Nieuw deze week';

  @override
  String get adminGroups => 'Groepen';

  @override
  String get adminProSubscription => 'Pro via abonnement';

  @override
  String get adminProGift => 'Pro als cadeau';

  @override
  String adminWithoutSubscription(int count) {
    return '$count zonder abonnement';
  }

  @override
  String get adminOpenReports => 'Open meldingen';

  @override
  String get adminSearchHint => 'Zoek op naam of e-mail';

  @override
  String get nobodyFound => 'Niemand gevonden';

  @override
  String get loadMore => 'Meer laden';

  @override
  String get noEmail => 'Geen e-mail';

  @override
  String adminDeletePhotoMessage(String groupName) {
    return 'De foto verdwijnt voor iedereen in \"$groupName\". Alle meldingen op deze foto worden afgehandeld.';
  }

  @override
  String get adminBanMessage =>
      'Dit account kan niet meer inloggen en de app niet meer gebruiken. Je kunt dit later terugdraaien.';

  @override
  String get adminDismissTitle => 'Melding negeren?';

  @override
  String get adminDismissMessage =>
      'De foto blijft staan. De melding wordt als afgehandeld gemarkeerd.';

  @override
  String get adminDismiss => 'Negeer';

  @override
  String get adminAccountBlocked => 'Account geblokkeerd';

  @override
  String get adminReportDismissed => 'Melding genegeerd';

  @override
  String get adminNoReports => 'Geen open meldingen';

  @override
  String get adminNoReportsMessage =>
      'Gerapporteerde foto\'s verschijnen hier.';

  @override
  String get deletedTag => 'Verwijderd';

  @override
  String adminReportedBy(String name) {
    return 'Door $name';
  }

  @override
  String adminPhotoBy(String name) {
    return 'Foto van $name';
  }

  @override
  String reportsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count meldingen',
      one: '1 melding',
    );
    return '$_temp0';
  }

  @override
  String get adminDeletePhoto => 'Verwijder foto';

  @override
  String get adminBlockCreator => 'Blokkeer maker';

  @override
  String get loadFailed => 'Laden lukte niet';

  @override
  String get adminLifetimeProGiven => 'Levenslang Pro gegeven';

  @override
  String get adminProGiven => 'Pro gegeven';

  @override
  String adminGiveProUntil(String date) {
    return 'Pro geven tot $date';
  }

  @override
  String get adminGiveProLifetime => 'Pro geven levenslang';

  @override
  String adminGiveProFor(String period) {
    return 'Pro geven voor $period';
  }

  @override
  String get adminReasonHint => 'Reden, bijv. vriend, tester, influencer';

  @override
  String get adminGivePro => 'Geef Pro';

  @override
  String get adminRevokeTitle => 'Cadeau intrekken?';

  @override
  String get adminRevokeMessage =>
      'Het gegeven Pro stopt meteen. Een eigen abonnement blijft gewoon lopen.';

  @override
  String get adminRevoke => 'Intrekken';

  @override
  String get adminGiftRevoked => 'Cadeau ingetrokken';

  @override
  String get adminUnbanTitle => 'Blokkade opheffen?';

  @override
  String adminUnbanMessage(String name) {
    return '$name kan weer inloggen.';
  }

  @override
  String get adminUnbanned => 'Blokkade opgeheven';

  @override
  String get adminBanUserMessage =>
      'Dit account kan niet meer inloggen en de app niet meer gebruiken. Foto\'s blijven staan.';

  @override
  String get adminUser => 'Gebruiker';

  @override
  String get adminNotVerified => 'niet bevestigd';

  @override
  String get adminRole => 'Rol';

  @override
  String get adminCreated => 'Aangemaakt';

  @override
  String get unknown => 'Onbekend';

  @override
  String get adminSignInWith => 'Inloggen met';

  @override
  String get adminEmailMethod => 'E-mail';

  @override
  String get adminPhotosAndVideos => 'Foto\'s en video\'s';

  @override
  String get adminStatus => 'Status';

  @override
  String get adminActive => 'Actief';

  @override
  String adminActiveUntil(String date) {
    return 'Actief tot $date';
  }

  @override
  String adminGiftFrom(String name) {
    return 'Cadeau van $name';
  }

  @override
  String adminExpiredOn(String date) {
    return 'Verlopen op $date';
  }

  @override
  String get adminExpired => 'Verlopen';

  @override
  String adminUntil(String date) {
    return 'Tot $date';
  }

  @override
  String get adminGiveProTitle => 'Pro geven';

  @override
  String get adminGiveProNote =>
      'Werkt ook voor de groepen van deze persoon: één Pro in de groep = Pro voor iedereen in die groep.';

  @override
  String get adminRevokeGift => 'Cadeau intrekken';

  @override
  String get adminModeration => 'Moderatie';

  @override
  String get adminCannotBanSelf => 'Je kunt jezelf niet blokkeren.';

  @override
  String get adminCannotBanAdmin =>
      'Een beheerder kan niet geblokkeerd worden.';

  @override
  String get adminUnban => 'Blokkade opheffen';

  @override
  String get adminBanAccount => 'Account blokkeren';

  @override
  String get googleSignInUnavailable =>
      'Inloggen met Google is nog niet beschikbaar';
}
