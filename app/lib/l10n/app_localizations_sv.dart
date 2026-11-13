// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get cancel => 'Avbryt';

  @override
  String get yes => 'Ja';

  @override
  String inviteMessageIntro(String groupName) {
    return 'Hänger du med i ”$groupName” på CamTrip? Då ser vi varandras bilder direkt.';
  }

  @override
  String inviteMessageCode(String code) {
    return 'Eller ange koden: $code';
  }

  @override
  String get memberFallbackName => 'Vän';

  @override
  String get reportReasonInappropriate => 'Olämpligt eller stötande';

  @override
  String get reportReasonSpam => 'Spam';

  @override
  String get reportReasonOther => 'Något annat';

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
  String get errorOffline => 'Ingen anslutning. Försök igen om en stund.';

  @override
  String errorSomethingWrongStatus(int status) {
    return 'Något gick fel ($status)';
  }

  @override
  String get errorSomethingWrong => 'Något gick fel';

  @override
  String get apiInvalidCredentials => 'Fel e-postadress eller lösenord';

  @override
  String get apiInvalidCode =>
      'Koden är fel eller har gått ut. Begär en ny kod.';

  @override
  String get apiEmailTaken =>
      'Det finns redan ett konto med den här e-postadressen. Logga in eller välj ”Glömt lösenordet?”.';

  @override
  String apiEmailTakenProvider(String provider) {
    return 'Det finns redan ett konto med den här e-postadressen. Logga in med $provider.';
  }

  @override
  String apiWeakPassword(int min) {
    return 'Välj ett lösenord med minst $min tecken';
  }

  @override
  String apiNameTooLong(int max) {
    return 'Ditt namn får vara högst $max tecken';
  }

  @override
  String get apiRateLimited => 'För många försök. Försök igen om en kvart.';

  @override
  String apiAccountBanned(String email) {
    return 'Ditt konto har blockerats. Kontakta $email om du tror att det är fel.';
  }

  @override
  String get apiProRequired => 'Den här kamerastilen ingår i CamTrip Pro';

  @override
  String get apiGroupClosed => 'Den här gruppen är stängd';

  @override
  String get apiGroupCodeNotFound => 'Ingen grupp hittades med den här koden';

  @override
  String apiGroupFull(int max) {
    return 'Gruppen är full (max $max medlemmar). Om en medlem har CamTrip Pro kan hur många som helst gå med.';
  }

  @override
  String get apiLastMember =>
      'Du är sista medlemmen. Radera gruppen i stället.';

  @override
  String get apiAdminRequired => 'Bara för CamTrips administratörer';

  @override
  String get apiUploadIncomplete => 'Uppladdningen är inte klar';

  @override
  String get apiInvalidInput => 'Ogiltig inmatning';

  @override
  String get apiNotSignedIn => 'Inte inloggad';

  @override
  String get apiAccountGone => 'Kontot finns inte längre';

  @override
  String get apiPhotoNotFound => 'Bilden hittades inte';

  @override
  String get apiGroupNotFound => 'Gruppen hittades inte';

  @override
  String get apiMemberNotFound => 'Medlemmen hittades inte';

  @override
  String get apiPersonNotFound => 'Personen hittades inte';

  @override
  String get apiUserNotFound => 'Användaren hittades inte';

  @override
  String get apiAdminOnly => 'Bara en admin kan göra det';

  @override
  String get apiCannotBlockSelf => 'Du kan inte blockera dig själv';

  @override
  String get apiCannotReportOwn => 'Du kan inte anmäla din egen bild';

  @override
  String get apiDeleteOwnOnly => 'Du kan bara radera dina egna bilder';

  @override
  String get apiOwnerCannotBeRemoved =>
      'Den som skapade gruppen kan inte tas bort';

  @override
  String get apiOwnerStaysAdmin => 'Den som skapade gruppen förblir admin';

  @override
  String get apiNeedsOneAdmin => 'En grupp behöver minst en admin';

  @override
  String get apiEndBeforeStart => 'Slutdatumet ligger före startdatumet';

  @override
  String get apiPermanentNoEndDate =>
      'En grupp som alltid är öppen har inget slutdatum';

  @override
  String get apiCannotBanAdmin => 'En administratör kan inte blockeras';

  @override
  String get apiReportNotFound => 'Anmälan hittades inte';

  @override
  String get apiPhotoOwnerUnknown =>
      'Det är inte längre känt vem som tog bilden';

  @override
  String get validationNameRequired => 'Ange ditt namn';

  @override
  String validationMaxChars(int max) {
    return 'Högst $max tecken';
  }

  @override
  String get validationEmailRequired => 'Ange din e-postadress';

  @override
  String get validationEmailInvalid => 'E-postadressen stämmer inte';

  @override
  String get validationPasswordRequired => 'Välj ett lösenord';

  @override
  String validationMinChars(int min) {
    return 'Minst $min tecken';
  }

  @override
  String get validationPasswordTooLong => 'Lösenordet är för långt';

  @override
  String get validationPasswordEmpty => 'Ange ditt lösenord';

  @override
  String get validationCodeRequired => 'Ange koden från mejlet';

  @override
  String get validationCodeDigits => 'Koden består av 6 siffror';

  @override
  String get onboarding1Title => 'En filmrulle\nför hela gänget.';

  @override
  String get onboarding1Body =>
      'Fota med en retrokamera. Alla ser dina bilder direkt, och de hamnar samtidigt i ditt eget album.';

  @override
  String get onboarding2Title => 'Slut på att\nskicka bilder.';

  @override
  String get onboarding2Body =>
      'Skapa en grupp, dela koden, klart. Aldrig mer ”kan du skicka de där bilderna?”';

  @override
  String get onboarding3Title => 'Efteråt en\nåterblicksvideo.';

  @override
  String get onboarding3Body =>
      'CamTrip gör en video med musik av era bästa stunder.';

  @override
  String get onboardingInvited =>
      'Du har blivit inbjuden! Logga in för att vara med.';

  @override
  String get signInAppleFailed => 'Det gick inte att logga in med Apple';

  @override
  String get signInGoogleFailed => 'Det gick inte att logga in med Google';

  @override
  String get signInFailed => 'Det gick inte att logga in';

  @override
  String get next => 'Nästa';

  @override
  String get legalPrefix => 'Genom att fortsätta godkänner du ';

  @override
  String get legalTerms => 'villkoren';

  @override
  String get legalAnd => ' och ';

  @override
  String get legalPrivacy => 'integritetspolicyn';

  @override
  String get legalSuffix => '.';

  @override
  String get continueWithApple => 'Fortsätt med Apple';

  @override
  String get continueWithGoogle => 'Fortsätt med Google';

  @override
  String get createAccount => 'Skapa konto';

  @override
  String get signIn => 'Logga in';

  @override
  String get or => 'eller';

  @override
  String get registerSubtitle => 'Så ser dina vänner vem som tar bilderna.';

  @override
  String get loginSubtitle => 'Välkommen tillbaka.';

  @override
  String get forgotPasswordTitle => 'Glömt lösenordet';

  @override
  String get forgotPasswordPushSubtitle =>
      'Är du fortfarande inloggad någonstans? Då skickar vi en 6-siffrig kod dit som en notis så att du kan välja ett nytt lösenord.';

  @override
  String get newPassword => 'Nytt lösenord';

  @override
  String get resetPushInfo =>
      'Om du fortfarande är inloggad någonstans får du en notis med en kod där. Kommer du inte in? Logga in med Apple eller Google med samma e-postadress - då kopplas ditt konto ihop.';

  @override
  String get sendCode => 'Skicka kod';

  @override
  String get savePassword => 'Spara lösenord';

  @override
  String get errorTryAgain => 'Något gick fel. Försök igen.';

  @override
  String get back => 'Tillbaka';

  @override
  String get name => 'Namn';

  @override
  String get email => 'E-postadress';

  @override
  String get codeFromPush => 'Kod från notisen';

  @override
  String get password => 'Lösenord';

  @override
  String get hidePassword => 'Dölj lösenord';

  @override
  String get showPassword => 'Visa lösenord';

  @override
  String get forgotPasswordLink => 'Glömt lösenordet?';

  @override
  String get haveAccount => 'Har du redan ett konto?';

  @override
  String get newToCamTrip => 'Ny på CamTrip?';

  @override
  String get rememberedIt => 'Kom du på det?';

  @override
  String get noCodeReceived => 'Fick du ingen kod?';

  @override
  String get resendCode => 'Skicka igen';

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
      other: '$count medlemmar',
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
      one: '1 bild',
    );
    return '$_temp0';
  }

  @override
  String videosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count videor',
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
    return 'Återblick $groupName';
  }

  @override
  String get styleFilm => 'Film';

  @override
  String get styleInstant => 'Instant';

  @override
  String get styleDisposable => 'Engångs';

  @override
  String get styleBw => 'S/V';

  @override
  String get styleGolden => 'Golden';

  @override
  String get styleChrome => 'Chrome';

  @override
  String get styleFilmDescription =>
      'Varma färger, korn och en orange datumstämpel';

  @override
  String get styleInstantDescription => 'Mjuka färger och en vit ram';

  @override
  String get styleDisposableDescription => 'Hård blixt, vinjett och ljusläckor';

  @override
  String get styleBwDescription => 'Kornig svartvit med djup kontrast';

  @override
  String get styleGoldenDescription =>
      'Alltid gyllene timmen, ett mjukt gyllene sken';

  @override
  String get styleChromeDescription => 'Kall, mättad och skarp som diafilm';

  @override
  String get shutterStopRecording => 'Stoppa inspelning';

  @override
  String get shutterStartRecording => 'Starta videoinspelning';

  @override
  String get shutterTakePhoto => 'Ta bild';

  @override
  String get modePhoto => 'Foto';

  @override
  String get modeVideo => 'Video';

  @override
  String get cameraNotFound => 'Ingen kamera hittades';

  @override
  String get cameraAccessNeeded =>
      'CamTrip behöver åtkomst till kameran. Slå på det i Inställningar.';

  @override
  String get cameraStartFailed => 'Kameran kunde inte starta';

  @override
  String get albumAccessNeeded =>
      'Ge CamTrip åtkomst till dina bilder för att även spara dem i ditt album';

  @override
  String get albumSaveFailed =>
      'Det gick inte att spara i albumet. Bilden delas ändå.';

  @override
  String styleProFallback(String style) {
    return 'Den här stilen ingår i Pro. I den här gruppen fotar du med $style.';
  }

  @override
  String get photoFailed => 'Det gick inte att ta bilden. Försök igen.';

  @override
  String get recordingFailed => 'Det gick inte att spela in video';

  @override
  String get videoFailed => 'Det gick inte att skapa videon. Försök igen.';

  @override
  String get shootInGroup => 'Fota i grupp';

  @override
  String get close => 'Stäng';

  @override
  String get flash => 'Blixt';

  @override
  String get flashOn => 'På';

  @override
  String get flashOff => 'Av';

  @override
  String get flashAuto => 'Auto';

  @override
  String get chooseGroup => 'Välj grupp';

  @override
  String get switchCamera => 'Byt kamera';

  @override
  String get createOrJoinFirst => 'Skapa eller gå med i en grupp först';

  @override
  String get proViaGroup => 'Pro via gruppen';

  @override
  String proViaName(String name) {
    return 'Pro via $name';
  }

  @override
  String get proStylesFreeViaMember =>
      'Pro-stilar i den här gruppen är gratis för dig tack vare en Pro-medlem';

  @override
  String proStylesFreeViaName(String name) {
    return 'Pro-stilar i gruppen: gratis för dig tack vare $name';
  }

  @override
  String get subscriptionsUnavailable =>
      'Prenumerationer är inte tillgängliga just nu. Försök senare.';

  @override
  String get paymentPending =>
      'Din betalning behandlas fortfarande. Pro aktiveras så snart den är klar.';

  @override
  String get purchaseFailed => 'Köpet gick inte igenom. Försök igen senare.';

  @override
  String get restoreUnavailable =>
      'Det går inte att återställa köp just nu. Försök senare.';

  @override
  String get restoreFailed =>
      'Återställningen misslyckades. Försök igen senare.';

  @override
  String get welcomePro => 'Välkommen till CamTrip Pro! 🎉';

  @override
  String get proRestored => 'Pro har återställts';

  @override
  String get noPurchaseFound => 'Inget tidigare köp hittades';

  @override
  String periodDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dagar',
      one: '1 dag',
    );
    return '$_temp0';
  }

  @override
  String periodWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count veckor',
      one: '1 vecka',
    );
    return '$_temp0';
  }

  @override
  String periodMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count månader',
      one: '1 månad',
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
  String get paywallSubtitle => 'Allt för din nästa resa.';

  @override
  String paywallFeatureStyles(String styles) {
    return 'Alla kamerastilar ($styles)';
  }

  @override
  String get paywallFeatureUnlimited =>
      'Obegränsat antal medlemmar och lagring, bilderna sparas för alltid';

  @override
  String get paywallFeatureNoWatermark => 'Återblickar utan vattenstämpel';

  @override
  String get paywallFeatureOriginal => 'Ladda ner i originalkvalitet';

  @override
  String get planYear => 'År';

  @override
  String get planMonth => 'Månad';

  @override
  String pricePerMonth(String price) {
    return '$price per månad';
  }

  @override
  String paywallSaveBadge(int percent) {
    return 'SPARA $percent %';
  }

  @override
  String get planMonthCancelAnytime => 'säg upp när du vill';

  @override
  String tryFree(String period) {
    return 'Prova $period gratis';
  }

  @override
  String get becomePro => 'Skaffa Pro';

  @override
  String get subscriptionsLoadFailed =>
      'Prenumerationerna kunde inte laddas. Kontrollera din anslutning.';

  @override
  String legalAnnual(String price) {
    return 'CamTrip Pro årsprenumeration: $price per år.';
  }

  @override
  String legalAnnualTrial(String period, String price) {
    return 'CamTrip Pro årsprenumeration: $period gratis, sedan $price per år.';
  }

  @override
  String legalMonthly(String price) {
    return 'CamTrip Pro månadsprenumeration: $price per månad.';
  }

  @override
  String legalMonthlyTrial(String period, String price) {
    return 'CamTrip Pro månadsprenumeration: $period gratis, sedan $price per månad.';
  }

  @override
  String get legalBillingApple =>
      'Betalningen dras från ditt Apple-ID. Prenumerationen förnyas automatiskt om du inte säger upp den minst 24 timmar innan perioden tar slut. Du kan säga upp och hantera den i inställningarna för ditt App Store-konto.';

  @override
  String get legalBillingGoogle =>
      'Betalningen dras från ditt Google-konto. Prenumerationen förnyas automatiskt om du inte säger upp den minst 24 timmar innan perioden tar slut. Du kan säga upp och hantera den i inställningarna för ditt Google Play-konto.';

  @override
  String get restorePurchases => 'Återställ köp';

  @override
  String get terms => 'Villkor';

  @override
  String get privacy => 'Integritet';

  @override
  String get groupProTitle => 'En Pro i gruppen = Pro för alla i gruppen';

  @override
  String get groupProBody =>
      'Om en person har Pro får hela gruppen alla kamerastilar, obegränsat antal medlemmar, bilder som sparas, originalkvalitet och återblickar utan vattenstämpel.';

  @override
  String get groupCreated => 'Gruppen skapad ✓';

  @override
  String get inviteFriends => 'Bjud in dina vänner';

  @override
  String get codeCopied => 'Koden kopierad';

  @override
  String get shareLink => 'Dela länk';

  @override
  String inviteSubject(String groupName) {
    return 'Gå med i $groupName på CamTrip';
  }

  @override
  String inviteMembersUnlimited(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count medlemmar',
      one: '1 medlem',
    );
    return '$_temp0 · obegränsat (Pro)';
  }

  @override
  String inviteMembersLimit(int count, int limit) {
    return '$count av $limit medlemmar · Pro: obegränsat';
  }

  @override
  String get toCamera => 'Till kameran';

  @override
  String get done => 'Klar';

  @override
  String get joinEnterCode => 'Ange koden på 6 tecken';

  @override
  String get joinGroupTitle => 'Gå med i en grupp';

  @override
  String get joinGroupSubtitle =>
      'Ange dina vänners kod eller skanna deras QR-kod.';

  @override
  String get typeCode => 'Skriv kod';

  @override
  String get scanQr => 'Skanna QR';

  @override
  String get join => 'Gå med';

  @override
  String get groupNameRequired => 'Ge din grupp ett namn';

  @override
  String get newGroup => 'Ny grupp';

  @override
  String get groupType => 'Typ av grupp';

  @override
  String get groupTypeVacation => 'Semester';

  @override
  String get groupTypeVacationDescription =>
      'Med start- och slutdatum, sedan arkiv';

  @override
  String get groupTypeEvent => 'Evenemang';

  @override
  String get groupTypeEventDescription => 'En dag eller kväll, t.ex. en fest';

  @override
  String get groupTypePermanent => 'Alltid öppen';

  @override
  String get groupTypePermanentDescription => 'För ditt vanliga kompisgäng';

  @override
  String get date => 'Datum';

  @override
  String get departure => 'Avresa';

  @override
  String get returnDate => 'Hemresa';

  @override
  String get defaultCameraStyle => 'Standardkamerastil';

  @override
  String freeLimitPermanent(int max) {
    return 'Gratis: upp till $max medlemmar. Obegränsat med Pro.';
  }

  @override
  String freeLimitDated(int max, int days) {
    return 'Gratis: upp till $max medlemmar, bilderna sparas till $days dagar efter slutdatumet. Obegränsat och för alltid med Pro.';
  }

  @override
  String get createGroup => 'Skapa grupp';

  @override
  String get group => 'Grupp';

  @override
  String groupCode(String code) {
    return 'kod $code';
  }

  @override
  String get manage => 'Hantera';

  @override
  String get rename => 'Byt namn';

  @override
  String get changeDates => 'Ändra datum';

  @override
  String get finishTrip => 'Avsluta resan';

  @override
  String get finishTripSubtitle => 'Sätter slutdatumet till i dag';

  @override
  String get reopenGroup => 'Öppna gruppen igen';

  @override
  String get closeGroup => 'Stäng gruppen';

  @override
  String get reopenGroupSubtitle => 'Medlemmarna kan lägga till bilder igen';

  @override
  String get closeGroupSubtitle =>
      'Ingen kan lägga till fler bilder; allt kan fortfarande visas';

  @override
  String get members => 'Medlemmar';

  @override
  String memberYou(String name) {
    return '$name (du)';
  }

  @override
  String get blockedTag => 'blockerad';

  @override
  String get adminTag => 'admin';

  @override
  String removeMemberTitle(String name) {
    return 'Ta bort $name?';
  }

  @override
  String get removeMemberMessage => 'Deras bilder stannar i gruppen.';

  @override
  String get remove => 'Radera';

  @override
  String get removeMember => 'Ta bort';

  @override
  String blockTitle(String name) {
    return 'Blockera $name?';
  }

  @override
  String blockMessage(String name) {
    return 'Du ser inte längre bilder och videor från $name och får inga notiser om dem. Du kan ångra det i Inställningar.';
  }

  @override
  String get block => 'Blockera';

  @override
  String get makeMember => 'Gör till vanlig medlem';

  @override
  String get makeAdmin => 'Gör till admin';

  @override
  String get removeFromGroup => 'Ta bort från gruppen';

  @override
  String get unblock => 'Häv blockering';

  @override
  String get inviteFriendsButton => 'Bjud in vänner';

  @override
  String get you => 'Du';

  @override
  String get unarchive => 'Hämta från arkivet';

  @override
  String get archive => 'Arkivera';

  @override
  String get unarchiveSubtitle => 'Gruppen är tillbaka bland dina album';

  @override
  String archiveSubtitle(String section) {
    return 'Bara för dig: gruppen flyttas till ”$section” längst ned bland dina album';
  }

  @override
  String get archivedSection => 'Arkiverade';

  @override
  String get hiddenPhotos => 'Dolda bilder';

  @override
  String get hiddenPhotosSubtitle => 'Bilder som du har dolt för dig själv';

  @override
  String get leaveGroup => 'Lämna gruppen';

  @override
  String get leaveGroupSubtitle => 'Dina bilder stannar i gruppen för de andra';

  @override
  String get deleteGroup => 'Radera gruppen';

  @override
  String get deleteGroupSubtitle => 'Alla bilder raderas för alla';

  @override
  String groupArchived(String groupName) {
    return '”$groupName” arkiverad';
  }

  @override
  String groupUnarchived(String groupName) {
    return '”$groupName” är tillbaka bland dina album';
  }

  @override
  String get undo => 'Ångra';

  @override
  String get groupNameTitle => 'Gruppens namn';

  @override
  String get finishTripTitle => 'Avsluta resan?';

  @override
  String get finishTripMessage =>
      'Slutdatumet blir i dag. Du kan fortfarande lägga till bilder; återblicken är klar.';

  @override
  String get finishTripConfirm => 'Avsluta';

  @override
  String get tripFinished => 'Resan avslutad';

  @override
  String leaveGroupTitle(String groupName) {
    return 'Lämna ”$groupName”?';
  }

  @override
  String get leaveGroupMessage =>
      'Dina bilder stannar i gruppen för de andra. Du kan gå med igen senare med koden.';

  @override
  String get leave => 'Lämna';

  @override
  String groupDeleted(String groupName) {
    return '”$groupName” har raderats';
  }

  @override
  String get youAreAdmin => 'du är admin';

  @override
  String get open => 'Öppna';

  @override
  String get archiveMenuSubtitle => 'Bara för dig, de andra märker inget';

  @override
  String get deleteGroupMenuSubtitle => 'För alla, med alla bilder';

  @override
  String get deleteGroupTitle => 'Radera gruppen?';

  @override
  String deleteGroupMessage(int count, String groupName, int memberCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Alla $count bilder och videor',
      one: 'Bilden eller videon',
    );
    String _temp1 = intl.Intl.pluralLogic(
      memberCount,
      locale: localeName,
      other: 'alla $memberCount medlemmar',
      one: 'den enda medlemmen',
    );
    return '$_temp0 i ”$groupName” försvinner för $_temp1. Det går inte att ångra.';
  }

  @override
  String get deleteGroupOwnRoll => 'Din egen kamerarulle förblir oförändrad.';

  @override
  String get deleteGroupTypeName => 'Skriv gruppens namn för att bekräfta:';

  @override
  String get deleteForEveryone => 'Radera för alla';

  @override
  String get save => 'Spara';

  @override
  String get yourAlbums => 'Dina album';

  @override
  String get uploadQueue => 'Uppladdningskö';

  @override
  String get noConnection => 'Ingen anslutning';

  @override
  String get albumsOfflineMessage =>
      'Dina album laddas när du har internet igen. Kameran fungerar ändå.';

  @override
  String get retry => 'Försök igen';

  @override
  String get noAlbumsTitle => 'Inga album än';

  @override
  String get noAlbumsMessage =>
      'Skapa en grupp för din nästa resa, eller gå med i en väns grupp med koden.';

  @override
  String get haveCode => 'Jag har en kod';

  @override
  String get joinWithCode => 'Gå med via kod eller QR-kod';

  @override
  String get camera => 'Kamera';

  @override
  String get restore => 'Återställ';

  @override
  String get more => 'Mer';

  @override
  String get newAlbum => 'Ny';

  @override
  String get closedTag => 'stängd';

  @override
  String get activeTag => 'aktiv';

  @override
  String get uploadFailed => 'Uppladdningen misslyckades';

  @override
  String get queueNoSignal => 'Ingen täckning.';

  @override
  String get queueNoSignalMessage =>
      'Dina bilder finns redan i ditt album och delas så snart du har internet igen.';

  @override
  String get queueWaitingForWifi => 'Väntar på wifi.';

  @override
  String queueWifiOnlyOn(String setting) {
    return 'Du har ”$setting” påslaget.';
  }

  @override
  String get queueVideosWifiOnly => 'Videor laddas bara upp via wifi.';

  @override
  String get queueAllShared => 'Allt är delat ✓';

  @override
  String queuePending(String items) {
    return '$items kvar att dela';
  }

  @override
  String queuePendingBoth(String photos, String videos) {
    return '$photos och $videos kvar att dela';
  }

  @override
  String get retryUpload => 'Försök igen';

  @override
  String get removeFromQueue => 'Ta bort från kön';

  @override
  String get queueStatusWifi => 'wifi';

  @override
  String get queueStatusWaiting => 'väntar';

  @override
  String get videosWifiOnlyTitle => 'Videor bara via wifi';

  @override
  String get videosWifiOnlySubtitle => 'Sparar mobildata';

  @override
  String get retryNow => 'Försök igen nu';

  @override
  String get yourName => 'Ditt namn';

  @override
  String get settings => 'Inställningar';

  @override
  String get tapToChangeName => 'Tryck för att ändra ditt namn';

  @override
  String get getCamTripPro => 'Skaffa CamTrip Pro';

  @override
  String get photos => 'Bilder';

  @override
  String get saveOwnPhotos => 'Spara mina bilder i ett album per grupp';

  @override
  String get autoSaveOthers => 'Spara andras bilder automatiskt';

  @override
  String get wifiOnlyTitle => 'Ladda upp bara via wifi';

  @override
  String get dateStamp => 'Datumstämpel';

  @override
  String get notifications => 'Notiser';

  @override
  String get notifyNewPhotos => 'Nya bilder (samlade)';

  @override
  String get notifyRecapReady => 'Återblick klar';

  @override
  String get camTripTeam => 'CamTrip-teamet';

  @override
  String get adminEntrySubtitle => 'Användare, ge Pro, anmälningar och siffror';

  @override
  String get account => 'Konto';

  @override
  String get manageSubscription => 'Hantera prenumeration';

  @override
  String get blockedPeople => 'Blockerade personer';

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
  String get privacyPolicy => 'Integritetspolicy';

  @override
  String get contact => 'Kontakt';

  @override
  String get signOut => 'Logga ut';

  @override
  String get deleteAccount => 'Radera konto';

  @override
  String get deleteAccountSubtitle => 'Raderar ditt konto och alla dina bilder';

  @override
  String get deleteAccountTitle => 'Radera kontot?';

  @override
  String get deleteAccountMessage =>
      'Ditt konto och alla dina bilder och videor raderas, även från grupperna. En pågående prenumeration säger du upp i App Store eller Google Play.';

  @override
  String get blockedTitle => 'Blockerade';

  @override
  String get blockedSubtitle => 'Du ser inte bilder från de här personerna.';

  @override
  String get blockedNone => 'Du har inte blockerat någon.';

  @override
  String get unblockShort => 'Häv';

  @override
  String get groupGone =>
      'Gruppen finns inte längre, eller så är du inte medlem längre.';

  @override
  String photosSavedToAlbum(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bilder sparade i ”$album”',
      one: '1 bild sparad i ”$album”',
    );
    return '$_temp0';
  }

  @override
  String photosDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bilder raderade',
      one: '1 bild raderad',
    );
    return '$_temp0';
  }

  @override
  String photosDeletedSkipped(int count, int skipped) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bilder raderade',
      one: '1 bild raderad',
    );
    return '$_temp0, $skipped hoppades över';
  }

  @override
  String photosHiddenForYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bilder dolda för dig',
      one: '1 bild dold för dig',
    );
    return '$_temp0';
  }

  @override
  String get addedToFavorites => 'Tillagd i favoriter';

  @override
  String get removedFromFavorites => 'Borttagen från favoriter';

  @override
  String get photoAccessSettings =>
      'Ge CamTrip åtkomst till dina bilder i Inställningar';

  @override
  String photosBeingAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bilder läggs till',
      one: '1 bild läggs till',
    );
    return '$_temp0';
  }

  @override
  String photosUnreadable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bilder kunde inte läsas',
      one: '1 bild kunde inte läsas',
    );
    return '$_temp0';
  }

  @override
  String get groupNotLoaded => 'Gruppen laddades inte';

  @override
  String get noFavoritesTitle => 'Inga favoriter än';

  @override
  String get noPhotosTitle => 'Inga bilder än';

  @override
  String get noFavoritesMessage =>
      'Tryck på stjärnan vid en bild för att lägga den här.';

  @override
  String get noPhotosMessage =>
      'Ta den första bilden. Alla i gruppen ser den direkt.';

  @override
  String get openCamera => 'Öppna kameran';

  @override
  String savingProgress(int done, int total) {
    return 'Sparar... $done/$total';
  }

  @override
  String get choosePhotos => 'Välj bilder';

  @override
  String selectedCount(int count) {
    return '$count valda';
  }

  @override
  String get selectNone => 'Avmarkera alla';

  @override
  String get selectAll => 'Markera alla';

  @override
  String photosWaitingToShare(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bilder väntar på att delas',
      one: '1 bild väntar på att delas',
    );
    return '$_temp0';
  }

  @override
  String get recapReadyTitle => 'Din återblick är klar';

  @override
  String get recapReadySubtitle => 'En video med musik från er resa';

  @override
  String get watch => 'Titta';

  @override
  String get makeRecapNow => 'Gör en återblicksvideo nu';

  @override
  String freeGroupDeleteNotice(String date) {
    return 'Gratisgrupp: bilderna sparas till $date. Spara dem eller skaffa Pro.';
  }

  @override
  String get filterAll => 'Alla';

  @override
  String get filterFavorites => 'Favoriter';

  @override
  String get filterPerPerson => 'Per person';

  @override
  String get filterPerson => 'Person';

  @override
  String get select => 'Välj';

  @override
  String get hiddenFilter => 'Dolda';

  @override
  String get photosBy => 'Bilder av...';

  @override
  String get uploadedTag => 'uppladdad';

  @override
  String get saveAll => 'Spara alla';

  @override
  String get favorite => 'Favorit';

  @override
  String get unfavorite => 'Ej favorit';

  @override
  String get hide => 'Dölj';

  @override
  String get delete => 'Radera';

  @override
  String deletePhotosTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Radera $count bilder?',
      one: 'Radera bilden?',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'De försvinner för alla i gruppen. Det går inte att ångra.',
      one: 'Den försvinner för alla i gruppen. Det går inte att ångra.',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosNotAllowed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count bilder är någon annans. De stannar kvar; bara en admin kan radera dem.',
      one:
          '1 bild är någon annans. Den stannar kvar; bara en admin kan radera den.',
    );
    return '$_temp0';
  }

  @override
  String photosBackInGroup(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bilder är tillbaka i gruppen',
      one: '1 bild är tillbaka i gruppen',
    );
    return '$_temp0';
  }

  @override
  String get showAll => 'Visa alla';

  @override
  String get hiddenPhotosExplainer =>
      'Bara du ser inte längre de här bilderna. För de andra i gruppen finns de kvar.';

  @override
  String get nothingHidden => 'Inget dolt';

  @override
  String get nothingHiddenMessage => 'Bilder som du döljer hittar du här.';

  @override
  String showAgainCount(int count) {
    return 'Visa igen ($count)';
  }

  @override
  String get someone => 'Någon';

  @override
  String get savedToAlbum => 'Sparad i ditt bildalbum';

  @override
  String get share => 'Dela';

  @override
  String get shareFailed => 'Det gick inte att dela';

  @override
  String get reportTitle => 'Varför anmäler du den här bilden?';

  @override
  String get reportSubtitle =>
      'Vi går igenom varje anmälan inom 24 timmar. Bilden döljs direkt för dig.';

  @override
  String get reportThanks => 'Tack, vi tittar på det';

  @override
  String blockMessageAllGroups(String name) {
    return 'Du ser inte längre bilder och videor från $name i någon grupp och får inga notiser om dem. Du kan ångra det i Inställningar.';
  }

  @override
  String userBlocked(String name) {
    return '$name har blockerats';
  }

  @override
  String get videoHiddenForYou => 'Videon dold för dig';

  @override
  String get photoHiddenForYou => 'Bilden dold för dig';

  @override
  String get setAsCover => 'Använd som omslag';

  @override
  String get coverUpdated => 'Omslagsbilden har ändrats';

  @override
  String get hideForMe => 'Dölj för mig';

  @override
  String get hideForMeSubtitle => 'De andra i gruppen ser den fortfarande';

  @override
  String get reportPhoto => 'Anmäl bild';

  @override
  String blockName(String name) {
    return 'Blockera $name';
  }

  @override
  String get forEveryoneInGroup => 'För alla i gruppen';

  @override
  String get videoDeleted => 'Videon raderad';

  @override
  String get photoDeleted => 'Bilden raderad';

  @override
  String get photoAccessToSave =>
      'Ge CamTrip åtkomst till dina bilder i Inställningar för att spara';

  @override
  String get phoneFull => 'Din telefon är full';

  @override
  String get albumSaveFailedShort => 'Det gick inte att spara i albumet';

  @override
  String get recapTemplateGoldenHour => 'Golden Hour';

  @override
  String get recapTemplateFast => 'Snabb';

  @override
  String get recapTemplateFilmRoll => 'Filmrulle';

  @override
  String get recapTemplatePolaroid => 'Polaroid';

  @override
  String get trackSummerEvening => 'Sommarkväll';

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
      other: '$count vänner',
      one: '1 vän',
    );
    return '$_temp0';
  }

  @override
  String get madeWithCamTrip => 'Gjord med CamTrip';

  @override
  String get tagline => 'En filmrulle för hela gänget';

  @override
  String get videoUnsupportedDevice =>
      'Det gick inte att skapa videon på den här enheten';

  @override
  String get groupLoadFailed => 'Gruppen kunde inte laddas.';

  @override
  String recapNeedsPhotos(int count) {
    return 'Du behöver minst $count bilder för en återblick.';
  }

  @override
  String get recapFailed => 'Det gick inte att skapa återblicken. Försök igen.';

  @override
  String get recapSaved => 'Återblicken sparad i ditt bildalbum';

  @override
  String get recap => 'Återblick';

  @override
  String get recapRendering => 'Skapar återblick...';

  @override
  String get videoRendering => 'Skapar video...';

  @override
  String get template => 'Mall';

  @override
  String get musicLicense => 'CamTrips egen musik · royaltyfri';

  @override
  String get change => 'Byt';

  @override
  String get noWatermark => 'Ingen vattenstämpel ✓';

  @override
  String get removeWatermarkPro => 'Ta bort vattenstämpeln med Pro';

  @override
  String get proSourceSubscription => 'Prenumeration';

  @override
  String get proSourceGift => 'Gåva';

  @override
  String get proSourceAdmin => 'Admin';

  @override
  String get proSourceGroup => 'Via grupp';

  @override
  String get noPro => 'Ingen Pro';

  @override
  String proStatusNoEnd(String source) {
    return 'Pro ($source), inget slutdatum';
  }

  @override
  String proStatusUntil(String source, String date) {
    return 'Pro ($source), till $date';
  }

  @override
  String get lifetime => 'Livstid';

  @override
  String get pickDate => 'Välj datum';

  @override
  String get noAccess => 'Ingen åtkomst';

  @override
  String get adminOnlyTeam => 'Hanteringen är bara för CamTrip-teamet.';

  @override
  String get adminOverview => 'Översikt';

  @override
  String get adminUsers => 'Användare';

  @override
  String get adminReports => 'Anmälningar';

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
  String get adminNewThisWeek => 'Nya den här veckan';

  @override
  String get adminGroups => 'Grupper';

  @override
  String get adminProSubscription => 'Pro via prenumeration';

  @override
  String get adminProGift => 'Pro i gåva';

  @override
  String adminWithoutSubscription(int count) {
    return '$count utan prenumeration';
  }

  @override
  String get adminOpenReports => 'Öppna anmälningar';

  @override
  String get adminSearchHint => 'Sök på namn eller e-post';

  @override
  String get nobodyFound => 'Ingen hittades';

  @override
  String get loadMore => 'Ladda fler';

  @override
  String get noEmail => 'Ingen e-post';

  @override
  String adminDeletePhotoMessage(String groupName) {
    return 'Bilden försvinner för alla i ”$groupName”. Alla anmälningar om bilden hanteras.';
  }

  @override
  String get adminBanMessage =>
      'Kontot kan inte längre logga in eller använda appen. Du kan ångra det senare.';

  @override
  String get adminDismissTitle => 'Avfärda anmälan?';

  @override
  String get adminDismissMessage =>
      'Bilden stannar kvar. Anmälan markeras som hanterad.';

  @override
  String get adminDismiss => 'Avfärda';

  @override
  String get adminAccountBlocked => 'Kontot blockerat';

  @override
  String get adminReportDismissed => 'Anmälan avfärdad';

  @override
  String get adminNoReports => 'Inga öppna anmälningar';

  @override
  String get adminNoReportsMessage => 'Anmälda bilder visas här.';

  @override
  String get deletedTag => 'Raderad';

  @override
  String adminReportedBy(String name) {
    return 'Av $name';
  }

  @override
  String adminPhotoBy(String name) {
    return 'Bild av $name';
  }

  @override
  String reportsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count anmälningar',
      one: '1 anmälan',
    );
    return '$_temp0';
  }

  @override
  String get adminDeletePhoto => 'Radera bild';

  @override
  String get adminBlockCreator => 'Blockera fotografen';

  @override
  String get loadFailed => 'Det gick inte att ladda';

  @override
  String get adminLifetimeProGiven => 'Livstids-Pro har getts';

  @override
  String get adminProGiven => 'Pro har getts';

  @override
  String adminGiveProUntil(String date) {
    return 'Ge Pro till $date';
  }

  @override
  String get adminGiveProLifetime => 'Ge Pro på livstid';

  @override
  String adminGiveProFor(String period) {
    return 'Ge Pro i $period';
  }

  @override
  String get adminReasonHint => 'Anledning, t.ex. vän, testare, influencer';

  @override
  String get adminGivePro => 'Ge Pro';

  @override
  String get adminRevokeTitle => 'Dra tillbaka gåvan?';

  @override
  String get adminRevokeMessage =>
      'Den givna Pro slutar direkt. En egen prenumeration fortsätter som vanligt.';

  @override
  String get adminRevoke => 'Dra tillbaka';

  @override
  String get adminGiftRevoked => 'Gåvan har dragits tillbaka';

  @override
  String get adminUnbanTitle => 'Häva blockeringen?';

  @override
  String adminUnbanMessage(String name) {
    return '$name kan logga in igen.';
  }

  @override
  String get adminUnbanned => 'Blockeringen hävd';

  @override
  String get adminBanUserMessage =>
      'Kontot kan inte längre logga in eller använda appen. Bilderna finns kvar.';

  @override
  String get adminUser => 'Användare';

  @override
  String get adminNotVerified => 'ej bekräftad';

  @override
  String get adminRole => 'Roll';

  @override
  String get adminCreated => 'Skapad';

  @override
  String get unknown => 'Okänt';

  @override
  String get adminSignInWith => 'Loggar in med';

  @override
  String get adminEmailMethod => 'E-post';

  @override
  String get adminPhotosAndVideos => 'Bilder och videor';

  @override
  String get adminStatus => 'Status';

  @override
  String get adminActive => 'Aktiv';

  @override
  String adminActiveUntil(String date) {
    return 'Aktiv till $date';
  }

  @override
  String adminGiftFrom(String name) {
    return 'Gåva från $name';
  }

  @override
  String adminExpiredOn(String date) {
    return 'Gick ut $date';
  }

  @override
  String get adminExpired => 'Utgången';

  @override
  String adminUntil(String date) {
    return 'Till $date';
  }

  @override
  String get adminGiveProTitle => 'Ge Pro';

  @override
  String get adminGiveProNote =>
      'Gäller även den här personens grupper: en Pro i gruppen = Pro för alla i gruppen.';

  @override
  String get adminRevokeGift => 'Dra tillbaka gåvan';

  @override
  String get adminModeration => 'Moderering';

  @override
  String get adminCannotBanSelf => 'Du kan inte blockera dig själv.';

  @override
  String get adminCannotBanAdmin => 'En admin kan inte blockeras.';

  @override
  String get adminUnban => 'Häv blockering';

  @override
  String get adminBanAccount => 'Blockera konto';

  @override
  String get googleSignInUnavailable =>
      'Inloggning med Google är inte tillgänglig än';

  @override
  String get cameraPickerTitle => 'Välj din kamera';

  @override
  String get cameraPickerSubtitle =>
      'Varje kamera ger dina bilder en egen look';

  @override
  String get cameraPickerChange => 'Byt kamera';

  @override
  String get cameraPickerUnlock => 'Lås upp med Pro';

  @override
  String get cameraPickerSelected => 'Vald';

  @override
  String get cameraPickerStyleSummer => 'Sommar';

  @override
  String get cameraPickerStyleSummerDescription =>
      'Varma, blekta färger från en 90-talsbild';

  @override
  String get cameraPickerStyleNight => 'Natt 800';

  @override
  String get cameraPickerStyleNightDescription =>
      'Biofilm: blågröna skuggor, varmt ljus, mycket korn';

  @override
  String get cameraPickerStyleSepia => 'Sepia';

  @override
  String get cameraPickerStyleSepiaDescription =>
      'En gammal brun kopia från skokartongen';

  @override
  String get cameraPickerStyleLomo => 'Lomo';

  @override
  String get cameraPickerStyleLomoDescription =>
      'Starka färger, mörka hörn och en galen färgton';

  @override
  String get cameraPickerStyleMint => 'Mint';

  @override
  String get cameraPickerStyleMintDescription =>
      'Mjukt och fräscht med en grön ton';

  @override
  String get cameraPickerStylePastel => 'Rosa';

  @override
  String get cameraPickerStylePastelDescription =>
      'Pastellfärger med ett rosa sken och vit kant';

  @override
  String get cameraPickerStyleSuper8 => 'Super 8';

  @override
  String get cameraPickerStyleSuper8Description =>
      'Kornigt och mjukt, som en gammal hemmavideo';

  @override
  String get paywallBenefitGroup => 'En Pro = Pro för hela gruppen';

  @override
  String get paywallBenefitUnlimited =>
      'Obegränsat med medlemmar, bilder för alltid';

  @override
  String get paywallBenefitQuality => 'Utan vattenstämpel, originalkvalitet';

  @override
  String paywallFreeTrial(String period) {
    return '$period gratis';
  }

  @override
  String paywallPriceYear(String price) {
    return '$price per år.';
  }

  @override
  String paywallPriceYearTrial(String period, String price) {
    return '$period gratis, sedan $price per år.';
  }

  @override
  String paywallPriceMonth(String price) {
    return '$price per månad.';
  }

  @override
  String paywallPriceMonthTrial(String period, String price) {
    return '$period gratis, sedan $price per månad.';
  }

  @override
  String paywallAutoRenew(String store) {
    return 'Förnyas automatiskt. Avsluta senast 24 timmar före förnyelsen i $store.';
  }

  @override
  String get paywallDetailsTitle => 'Allt i Pro';

  @override
  String get paywallBenefitStyles => 'Alla kamerastilar';

  @override
  String get allPhotosTitle => 'Alla foton';

  @override
  String get homeTabAlbums => 'Album';

  @override
  String get allPhotosEmptyTitle => 'Inga foton än';

  @override
  String get allPhotosEmptyMessage => 'Öppna kameran och ta ditt första foto.';

  @override
  String get allPhotosLoadFailed => 'Dina foton kunde inte laddas';

  @override
  String get cameraSettingsTitle => 'Kamerainställningar';

  @override
  String get cameraSettingsMore => 'Fler inställningar';

  @override
  String get cameraSettingsGrid => 'Rutnät';

  @override
  String get cameraSettingsHaptics => 'Vibrera vid fotografering';

  @override
  String get cameraSettingsDateStamp => 'Datumstämpel nere till höger';

  @override
  String get cameraSettingsSound => 'Slutarljud';

  @override
  String get cameraSettingsSoundHint => 'Tyst när telefonen är på ljudlöst';

  @override
  String get cameraSettingsTimer => 'Självutlösare';

  @override
  String get cameraSettingsTimerOff => 'Av';

  @override
  String cameraSettingsTimerSeconds(int seconds) {
    return '$seconds s';
  }

  @override
  String get cameraSettingsTimerCancelHint =>
      'Tryck på slutaren för att avbryta';

  @override
  String get cameraSettingsMirror => 'Spegelvänd selfies';

  @override
  String get cameraSettingsSaveToRoll => 'Spara i kamerarullen';

  @override
  String get cameraSettingsQuality => 'Kvalitet';

  @override
  String get cameraSettingsQualityStandard => 'Standard';

  @override
  String get cameraSettingsQualityHigh => 'Hög';

  @override
  String get cameraLowLightHint => 'Lite ljus - slå på blixten';

  @override
  String get cameraFlashUnavailable => 'Den här kameran har ingen blixt';

  @override
  String get cameraFlashScreen => 'Skärmblixt';

  @override
  String get cameraFlashCycleHint =>
      'Tryck för att växla mellan av, på och auto';

  @override
  String get cameraFlip => 'Växla mellan främre och bakre kamera';

  @override
  String get cameraFlipHint => 'Dubbeltryck på sökaren för att vända kameran';

  @override
  String cameraPickerPaywallStyles(int count, String styles) {
    return 'Alla $count kameror, bland annat $styles';
  }

  @override
  String get styleFlash => 'Blixt 400';

  @override
  String get styleFlashDescription =>
      'Direkt blixt på varm film: bärnstensglöd, korn, djupa röda';
}
