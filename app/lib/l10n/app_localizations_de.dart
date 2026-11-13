// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get cancel => 'Abbrechen';

  @override
  String get yes => 'Ja';

  @override
  String inviteMessageIntro(String groupName) {
    return 'Machst du bei „$groupName“ auf CamTrip mit? Dann sehen wir unsere Fotos sofort.';
  }

  @override
  String inviteMessageCode(String code) {
    return 'Oder gib den Code ein: $code';
  }

  @override
  String get memberFallbackName => 'Freund';

  @override
  String get reportReasonInappropriate => 'Unangemessen oder anstößig';

  @override
  String get reportReasonSpam => 'Spam';

  @override
  String get reportReasonOther => 'Etwas anderes';

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
  String get errorOffline => 'Keine Verbindung. Versuch es gleich noch mal.';

  @override
  String errorSomethingWrongStatus(int status) {
    return 'Etwas ist schiefgelaufen ($status)';
  }

  @override
  String get errorSomethingWrong => 'Etwas ist schiefgelaufen';

  @override
  String get apiInvalidCredentials => 'E-Mail-Adresse oder Passwort ist falsch';

  @override
  String get apiInvalidCode =>
      'Dieser Code ist falsch oder abgelaufen. Fordere einen neuen Code an.';

  @override
  String get apiEmailTaken =>
      'Mit dieser E-Mail-Adresse gibt es schon ein Konto. Melde dich an oder wähle „Passwort vergessen?“.';

  @override
  String apiEmailTakenProvider(String provider) {
    return 'Mit dieser E-Mail-Adresse gibt es schon ein Konto. Melde dich mit $provider an.';
  }

  @override
  String apiWeakPassword(int min) {
    return 'Wähle ein Passwort mit mindestens $min Zeichen';
  }

  @override
  String apiNameTooLong(int max) {
    return 'Dein Name darf höchstens $max Zeichen lang sein';
  }

  @override
  String get apiRateLimited =>
      'Zu viele Versuche. Versuch es in einer Viertelstunde noch mal.';

  @override
  String apiAccountBanned(String email) {
    return 'Dein Konto wurde gesperrt. Schreib an $email, wenn du denkst, dass das ein Fehler ist.';
  }

  @override
  String get apiProRequired => 'Dieser Kamerastil gehört zu CamTrip Pro';

  @override
  String get apiGroupClosed => 'Diese Gruppe wurde geschlossen';

  @override
  String get apiGroupCodeNotFound => 'Keine Gruppe mit diesem Code gefunden';

  @override
  String apiGroupFull(int max) {
    return 'Diese Gruppe ist voll (max. $max Mitglieder). Hat ein Mitglied CamTrip Pro, können unbegrenzt viele Leute beitreten.';
  }

  @override
  String get apiLastMember =>
      'Du bist das letzte Mitglied. Lösch die Gruppe stattdessen.';

  @override
  String get apiAdminRequired => 'Nur für Admins von CamTrip';

  @override
  String get apiUploadIncomplete => 'Der Upload ist nicht vollständig';

  @override
  String get apiInvalidInput => 'Ungültige Eingabe';

  @override
  String get apiNotSignedIn => 'Nicht angemeldet';

  @override
  String get apiAccountGone => 'Dieses Konto gibt es nicht mehr';

  @override
  String get apiPhotoNotFound => 'Foto nicht gefunden';

  @override
  String get apiGroupNotFound => 'Gruppe nicht gefunden';

  @override
  String get apiMemberNotFound => 'Mitglied nicht gefunden';

  @override
  String get apiPersonNotFound => 'Person nicht gefunden';

  @override
  String get apiUserNotFound => 'Nutzer nicht gefunden';

  @override
  String get apiAdminOnly => 'Das kann nur ein Admin';

  @override
  String get apiCannotBlockSelf => 'Du kannst dich nicht selbst blockieren';

  @override
  String get apiCannotReportOwn => 'Du kannst dein eigenes Foto nicht melden';

  @override
  String get apiDeleteOwnOnly => 'Du kannst nur deine eigenen Fotos löschen';

  @override
  String get apiOwnerCannotBeRemoved =>
      'Wer die Gruppe erstellt hat, kann nicht entfernt werden';

  @override
  String get apiOwnerStaysAdmin => 'Wer die Gruppe erstellt hat, bleibt Admin';

  @override
  String get apiNeedsOneAdmin => 'Eine Gruppe braucht mindestens einen Admin';

  @override
  String get apiEndBeforeStart => 'Das Enddatum liegt vor dem Startdatum';

  @override
  String get apiPermanentNoEndDate =>
      'Eine Gruppe, die immer offen ist, hat kein Enddatum';

  @override
  String get apiCannotBanAdmin => 'Ein Admin kann nicht gesperrt werden';

  @override
  String get apiReportNotFound => 'Meldung nicht gefunden';

  @override
  String get apiPhotoOwnerUnknown =>
      'Wer dieses Foto gemacht hat, ist nicht mehr bekannt';

  @override
  String get validationNameRequired => 'Gib deinen Namen ein';

  @override
  String validationMaxChars(int max) {
    return 'Höchstens $max Zeichen';
  }

  @override
  String get validationEmailRequired => 'Gib deine E-Mail-Adresse ein';

  @override
  String get validationEmailInvalid => 'Diese E-Mail-Adresse stimmt nicht';

  @override
  String get validationPasswordRequired => 'Wähle ein Passwort';

  @override
  String validationMinChars(int min) {
    return 'Mindestens $min Zeichen';
  }

  @override
  String get validationPasswordTooLong => 'Dieses Passwort ist zu lang';

  @override
  String get validationPasswordEmpty => 'Gib dein Passwort ein';

  @override
  String get validationCodeRequired => 'Gib den Code aus der E-Mail ein';

  @override
  String get validationCodeDigits => 'Der Code hat 6 Ziffern';

  @override
  String get onboarding1Title => 'Ein Film\nfür die ganze Gruppe.';

  @override
  String get onboarding1Body =>
      'Fotografiere mit einer Retro-Kamera. Alle sehen deine Fotos sofort, und sie landen direkt in deinem eigenen Album.';

  @override
  String get onboarding2Title => 'Kein Hin- und\nHerschicken mehr.';

  @override
  String get onboarding2Body =>
      'Gruppe erstellen, Code teilen, fertig. Nie wieder „Schickst du mir noch die Fotos?“';

  @override
  String get onboarding3Title => 'Danach ein\nRecap-Video.';

  @override
  String get onboarding3Body =>
      'CamTrip macht aus euren schönsten Momenten ein Video mit Musik.';

  @override
  String get onboardingInvited =>
      'Du wurdest eingeladen! Melde dich an, um mitzumachen.';

  @override
  String get signInAppleFailed => 'Anmelden mit Apple hat nicht geklappt';

  @override
  String get signInGoogleFailed => 'Anmelden mit Google hat nicht geklappt';

  @override
  String get signInFailed => 'Anmelden hat nicht geklappt';

  @override
  String get next => 'Weiter';

  @override
  String get legalPrefix => 'Wenn du fortfährst, stimmst du den ';

  @override
  String get legalTerms => 'Nutzungsbedingungen';

  @override
  String get legalAnd => ' und der ';

  @override
  String get legalPrivacy => 'Datenschutzerklärung';

  @override
  String get legalSuffix => ' zu.';

  @override
  String get continueWithApple => 'Weiter mit Apple';

  @override
  String get continueWithGoogle => 'Weiter mit Google';

  @override
  String get createAccount => 'Konto erstellen';

  @override
  String get signIn => 'Anmelden';

  @override
  String get or => 'oder';

  @override
  String get registerSubtitle => 'So sehen deine Freunde, wer die Fotos macht.';

  @override
  String get loginSubtitle => 'Willkommen zurück.';

  @override
  String get forgotPasswordTitle => 'Passwort vergessen';

  @override
  String get forgotPasswordPushSubtitle =>
      'Bist du noch irgendwo angemeldet? Dann schicken wir dir dort einen 6-stelligen Code als Push-Mitteilung, um ein neues Passwort festzulegen.';

  @override
  String get newPassword => 'Neues Passwort';

  @override
  String get resetPushInfo =>
      'Wenn du noch irgendwo angemeldet bist, bekommst du dort eine Push-Mitteilung mit einem Code. Kommst du nicht rein? Melde dich mit Apple oder Google mit derselben E-Mail-Adresse an - dein Konto wird dann verknüpft.';

  @override
  String get sendCode => 'Code senden';

  @override
  String get savePassword => 'Passwort speichern';

  @override
  String get errorTryAgain => 'Etwas ist schiefgelaufen. Versuch es noch mal.';

  @override
  String get back => 'Zurück';

  @override
  String get name => 'Name';

  @override
  String get email => 'E-Mail-Adresse';

  @override
  String get codeFromPush => 'Code aus der Mitteilung';

  @override
  String get password => 'Passwort';

  @override
  String get hidePassword => 'Passwort verbergen';

  @override
  String get showPassword => 'Passwort anzeigen';

  @override
  String get forgotPasswordLink => 'Passwort vergessen?';

  @override
  String get haveAccount => 'Du hast schon ein Konto?';

  @override
  String get newToCamTrip => 'Neu bei CamTrip?';

  @override
  String get rememberedIt => 'Doch wieder eingefallen?';

  @override
  String get noCodeReceived => 'Keinen Code bekommen?';

  @override
  String get resendCode => 'Erneut senden';

  @override
  String onboardingDemoRoll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Fotografen, 1 Film',
      one: '1 Fotograf, 1 Film',
    );
    return '$_temp0';
  }

  @override
  String membersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Mitglieder',
      one: '1 Mitglied',
    );
    return '$_temp0';
  }

  @override
  String photosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Fotos',
      one: '1 Foto',
    );
    return '$_temp0';
  }

  @override
  String videosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Videos',
      one: '1 Video',
    );
    return '$_temp0';
  }

  @override
  String get justNow => 'jetzt';

  @override
  String get badgeNew => 'Neu';

  @override
  String recapTitle(String groupName) {
    return 'Recap $groupName';
  }

  @override
  String get styleFilm => 'Film';

  @override
  String get styleInstant => 'Instant';

  @override
  String get styleDisposable => 'Einweg';

  @override
  String get styleBw => 'S/W';

  @override
  String get styleGolden => 'Golden';

  @override
  String get styleChrome => 'Chrome';

  @override
  String get styleFilmDescription =>
      'Warme Farben, Körnung und ein oranger Datumsstempel';

  @override
  String get styleInstantDescription => 'Sanfte Farben und ein weißer Rahmen';

  @override
  String get styleDisposableDescription =>
      'Harter Blitz, Vignette und Lichtlecks';

  @override
  String get styleBwDescription => 'Körniges Schwarz-Weiß mit starkem Kontrast';

  @override
  String get styleGoldenDescription =>
      'Immer Golden Hour, ein sanfter goldener Schimmer';

  @override
  String get styleChromeDescription => 'Kühl, satt und scharf wie Diafilm';

  @override
  String get shutterStopRecording => 'Aufnahme stoppen';

  @override
  String get shutterStartRecording => 'Videoaufnahme starten';

  @override
  String get shutterTakePhoto => 'Foto aufnehmen';

  @override
  String get modePhoto => 'Foto';

  @override
  String get modeVideo => 'Video';

  @override
  String get cameraNotFound => 'Keine Kamera gefunden';

  @override
  String get cameraAccessNeeded =>
      'CamTrip braucht Zugriff auf deine Kamera. Schalte ihn in den Einstellungen ein.';

  @override
  String get cameraStartFailed => 'Die Kamera konnte nicht starten';

  @override
  String get albumAccessNeeded =>
      'Erlaube CamTrip den Zugriff auf deine Fotos, um sie auch in deinem Album zu speichern';

  @override
  String get albumSaveFailed =>
      'Speichern im Album hat nicht geklappt. Das Foto wird trotzdem geteilt.';

  @override
  String styleProFallback(String style) {
    return 'Dieser Stil gehört zu Pro. In dieser Gruppe fotografierst du mit $style.';
  }

  @override
  String get photoFailed => 'Das Foto hat nicht geklappt. Versuch es noch mal.';

  @override
  String get recordingFailed => 'Die Videoaufnahme hat nicht geklappt';

  @override
  String get videoFailed =>
      'Das Video hat nicht geklappt. Versuch es noch mal.';

  @override
  String get shootInGroup => 'In Gruppe fotografieren';

  @override
  String get close => 'Schließen';

  @override
  String get flash => 'Blitz';

  @override
  String get flashOn => 'An';

  @override
  String get flashOff => 'Aus';

  @override
  String get flashAuto => 'Auto';

  @override
  String get chooseGroup => 'Gruppe wählen';

  @override
  String get switchCamera => 'Kamera wechseln';

  @override
  String get createOrJoinFirst =>
      'Erstelle zuerst eine Gruppe oder tritt einer bei';

  @override
  String get proViaGroup => 'Pro über die Gruppe';

  @override
  String proViaName(String name) {
    return 'Pro über $name';
  }

  @override
  String get proStylesFreeViaMember =>
      'Pro-Stile sind in dieser Gruppe für dich gratis, dank eines Pro-Mitglieds';

  @override
  String proStylesFreeViaName(String name) {
    return 'Pro-Stile in dieser Gruppe: gratis für dich dank $name';
  }

  @override
  String get subscriptionsUnavailable =>
      'Abos sind gerade nicht verfügbar. Versuch es später noch mal.';

  @override
  String get paymentPending =>
      'Deine Zahlung wird noch verarbeitet. Pro wird aktiv, sobald sie abgeschlossen ist.';

  @override
  String get purchaseFailed =>
      'Der Kauf hat nicht geklappt. Versuch es später noch mal.';

  @override
  String get restoreUnavailable =>
      'Käufe wiederherstellen geht gerade nicht. Versuch es später noch mal.';

  @override
  String get restoreFailed =>
      'Wiederherstellen hat nicht geklappt. Versuch es später noch mal.';

  @override
  String get welcomePro => 'Willkommen bei CamTrip Pro! 🎉';

  @override
  String get proRestored => 'Pro wurde wiederhergestellt';

  @override
  String get noPurchaseFound => 'Kein früherer Kauf gefunden';

  @override
  String periodDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Tage',
      one: '1 Tag',
    );
    return '$_temp0';
  }

  @override
  String periodWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Wochen',
      one: '1 Woche',
    );
    return '$_temp0';
  }

  @override
  String periodMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Monate',
      one: '1 Monat',
    );
    return '$_temp0';
  }

  @override
  String periodYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Jahre',
      one: '1 Jahr',
    );
    return '$_temp0';
  }

  @override
  String get paywallHavePro => 'Du hast CamTrip Pro';

  @override
  String get paywallSubtitle => 'Alles für deinen nächsten Trip.';

  @override
  String paywallFeatureStyles(String styles) {
    return 'Alle Kamerastile ($styles)';
  }

  @override
  String get paywallFeatureUnlimited =>
      'Unbegrenzt Mitglieder und Speicher, Fotos bleiben für immer';

  @override
  String get paywallFeatureNoWatermark => 'Recaps ohne Wasserzeichen';

  @override
  String get paywallFeatureOriginal => 'Download in Originalqualität';

  @override
  String get planYear => 'Jahr';

  @override
  String get planMonth => 'Monat';

  @override
  String pricePerMonth(String price) {
    return '$price pro Monat';
  }

  @override
  String paywallSaveBadge(int percent) {
    return 'SPARE $percent %';
  }

  @override
  String get planMonthCancelAnytime => 'monatlich kündbar';

  @override
  String tryFree(String period) {
    return '$period gratis testen';
  }

  @override
  String get becomePro => 'Pro holen';

  @override
  String get subscriptionsLoadFailed =>
      'Abos konnten nicht geladen werden. Prüfe deine Verbindung.';

  @override
  String legalAnnual(String price) {
    return 'CamTrip Pro Jahresabo: $price pro Jahr.';
  }

  @override
  String legalAnnualTrial(String period, String price) {
    return 'CamTrip Pro Jahresabo: $period gratis, danach $price pro Jahr.';
  }

  @override
  String legalMonthly(String price) {
    return 'CamTrip Pro Monatsabo: $price pro Monat.';
  }

  @override
  String legalMonthlyTrial(String period, String price) {
    return 'CamTrip Pro Monatsabo: $period gratis, danach $price pro Monat.';
  }

  @override
  String get legalBillingApple =>
      'Die Zahlung läuft über deine Apple-ID. Das Abo verlängert sich automatisch, wenn du es nicht spätestens 24 Stunden vor Ende des Zeitraums kündigst. Kündigen und verwalten kannst du es in den Einstellungen deines App-Store-Kontos.';

  @override
  String get legalBillingGoogle =>
      'Die Zahlung läuft über dein Google-Konto. Das Abo verlängert sich automatisch, wenn du es nicht spätestens 24 Stunden vor Ende des Zeitraums kündigst. Kündigen und verwalten kannst du es in den Einstellungen deines Google-Play-Kontos.';

  @override
  String get restorePurchases => 'Käufe wiederherstellen';

  @override
  String get terms => 'Bedingungen';

  @override
  String get privacy => 'Datenschutz';

  @override
  String get groupProTitle =>
      'Ein Pro in der Gruppe = Pro für alle in dieser Gruppe';

  @override
  String get groupProBody =>
      'Hat eine Person Pro, bekommt die ganze Gruppe alle Kamerastile, unbegrenzt Mitglieder, Fotos, die bleiben, Originalqualität und Recaps ohne Wasserzeichen.';

  @override
  String get groupCreated => 'Gruppe erstellt ✓';

  @override
  String get inviteFriends => 'Lade deine Freunde ein';

  @override
  String get codeCopied => 'Code kopiert';

  @override
  String get shareLink => 'Link teilen';

  @override
  String inviteSubject(String groupName) {
    return 'Mach bei $groupName auf CamTrip mit';
  }

  @override
  String inviteMembersUnlimited(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Mitglieder',
      one: '1 Mitglied',
    );
    return '$_temp0 · unbegrenzt (Pro)';
  }

  @override
  String inviteMembersLimit(int count, int limit) {
    return '$count von $limit Mitgliedern · Pro: unbegrenzt';
  }

  @override
  String get toCamera => 'Zur Kamera';

  @override
  String get done => 'Fertig';

  @override
  String get joinEnterCode => 'Gib den 6-stelligen Code ein';

  @override
  String get joinGroupTitle => 'Einer Gruppe beitreten';

  @override
  String get joinGroupSubtitle =>
      'Gib den Code deiner Freunde ein oder scanne ihren QR-Code.';

  @override
  String get typeCode => 'Code eintippen';

  @override
  String get scanQr => 'QR scannen';

  @override
  String get join => 'Beitreten';

  @override
  String get groupNameRequired => 'Gib deiner Gruppe einen Namen';

  @override
  String get newGroup => 'Neue Gruppe';

  @override
  String get groupType => 'Art der Gruppe';

  @override
  String get groupTypeVacation => 'Urlaub';

  @override
  String get groupTypeVacationDescription =>
      'Mit Start- und Enddatum, danach im Archiv';

  @override
  String get groupTypeEvent => 'Event';

  @override
  String get groupTypeEventDescription =>
      'Ein Tag oder Abend, z. B. eine Party';

  @override
  String get groupTypePermanent => 'Immer offen';

  @override
  String get groupTypePermanentDescription => 'Für deinen festen Freundeskreis';

  @override
  String get date => 'Datum';

  @override
  String get departure => 'Abreise';

  @override
  String get returnDate => 'Rückkehr';

  @override
  String get defaultCameraStyle => 'Standard-Kamerastil';

  @override
  String freeLimitPermanent(int max) {
    return 'Gratis: bis zu $max Mitglieder. Mit Pro unbegrenzt.';
  }

  @override
  String freeLimitDated(int max, int days) {
    return 'Gratis: bis zu $max Mitglieder, Fotos bleiben bis $days Tage nach dem Enddatum. Mit Pro unbegrenzt und für immer.';
  }

  @override
  String get createGroup => 'Gruppe erstellen';

  @override
  String get group => 'Gruppe';

  @override
  String groupCode(String code) {
    return 'Code $code';
  }

  @override
  String get manage => 'Verwalten';

  @override
  String get rename => 'Umbenennen';

  @override
  String get changeDates => 'Datum ändern';

  @override
  String get finishTrip => 'Trip beenden';

  @override
  String get finishTripSubtitle => 'Setzt das Enddatum auf heute';

  @override
  String get reopenGroup => 'Gruppe wieder öffnen';

  @override
  String get closeGroup => 'Gruppe schließen';

  @override
  String get reopenGroupSubtitle => 'Mitglieder können wieder Fotos hinzufügen';

  @override
  String get closeGroupSubtitle =>
      'Niemand kann mehr Fotos hinzufügen; alles bleibt sichtbar';

  @override
  String get members => 'Mitglieder';

  @override
  String memberYou(String name) {
    return '$name (du)';
  }

  @override
  String get blockedTag => 'blockiert';

  @override
  String get adminTag => 'Admin';

  @override
  String removeMemberTitle(String name) {
    return '$name entfernen?';
  }

  @override
  String get removeMemberMessage => 'Die Fotos bleiben in der Gruppe.';

  @override
  String get remove => 'Löschen';

  @override
  String get removeMember => 'Entfernen';

  @override
  String blockTitle(String name) {
    return '$name blockieren?';
  }

  @override
  String blockMessage(String name) {
    return 'Du siehst keine Fotos und Videos von $name mehr und bekommst dazu keine Mitteilungen. Aufheben kannst du das in den Einstellungen.';
  }

  @override
  String get block => 'Blockieren';

  @override
  String get makeMember => 'Zum normalen Mitglied machen';

  @override
  String get makeAdmin => 'Zum Admin machen';

  @override
  String get removeFromGroup => 'Aus Gruppe entfernen';

  @override
  String get unblock => 'Blockierung aufheben';

  @override
  String get inviteFriendsButton => 'Freunde einladen';

  @override
  String get you => 'Du';

  @override
  String get unarchive => 'Aus dem Archiv holen';

  @override
  String get archive => 'Archivieren';

  @override
  String get unarchiveSubtitle => 'Die Gruppe steht wieder bei deinen Alben';

  @override
  String archiveSubtitle(String section) {
    return 'Nur für dich: Die Gruppe wandert nach „$section“ unten in deinen Alben';
  }

  @override
  String get archivedSection => 'Archiviert';

  @override
  String get hiddenPhotos => 'Ausgeblendete Fotos';

  @override
  String get hiddenPhotosSubtitle => 'Fotos, die du für dich ausgeblendet hast';

  @override
  String get leaveGroup => 'Gruppe verlassen';

  @override
  String get leaveGroupSubtitle =>
      'Deine Fotos bleiben für die anderen in der Gruppe';

  @override
  String get deleteGroup => 'Gruppe löschen';

  @override
  String get deleteGroupSubtitle => 'Alle Fotos werden für alle gelöscht';

  @override
  String groupArchived(String groupName) {
    return '„$groupName“ archiviert';
  }

  @override
  String groupUnarchived(String groupName) {
    return '„$groupName“ steht wieder bei deinen Alben';
  }

  @override
  String get undo => 'Rückgängig';

  @override
  String get groupNameTitle => 'Name der Gruppe';

  @override
  String get finishTripTitle => 'Trip beenden?';

  @override
  String get finishTripMessage =>
      'Das Enddatum wird heute. Fotos hinzufügen geht weiterhin; das Recap ist bereit.';

  @override
  String get finishTripConfirm => 'Beenden';

  @override
  String get tripFinished => 'Trip beendet';

  @override
  String leaveGroupTitle(String groupName) {
    return '„$groupName“ verlassen?';
  }

  @override
  String get leaveGroupMessage =>
      'Deine Fotos bleiben für die anderen in der Gruppe. Mit dem Code kannst du später wieder beitreten.';

  @override
  String get leave => 'Verlassen';

  @override
  String groupDeleted(String groupName) {
    return '„$groupName“ wurde gelöscht';
  }

  @override
  String get youAreAdmin => 'du bist Admin';

  @override
  String get open => 'Öffnen';

  @override
  String get archiveMenuSubtitle =>
      'Nur für dich, die anderen merken nichts davon';

  @override
  String get deleteGroupMenuSubtitle => 'Für alle, mit allen Fotos';

  @override
  String get deleteGroupTitle => 'Gruppe löschen?';

  @override
  String deleteGroupMessage(int count, String groupName, int memberCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Alle $count Fotos und Videos',
      one: 'Das 1 Foto bzw. Video',
    );
    String _temp1 = intl.Intl.pluralLogic(
      memberCount,
      locale: localeName,
      other: 'alle $memberCount Mitglieder',
      one: 'das 1 Mitglied',
    );
    return '$_temp0 in „$groupName“ verschwinden für $_temp1. Das kann nicht rückgängig gemacht werden.';
  }

  @override
  String get deleteGroupOwnRoll =>
      'Deine eigene Fotomediathek bleibt unverändert.';

  @override
  String get deleteGroupTypeName =>
      'Gib zur Bestätigung den Namen der Gruppe ein:';

  @override
  String get deleteForEveryone => 'Für alle löschen';

  @override
  String get save => 'Speichern';

  @override
  String get yourAlbums => 'Deine Alben';

  @override
  String get uploadQueue => 'Warteschlange';

  @override
  String get noConnection => 'Keine Verbindung';

  @override
  String get albumsOfflineMessage =>
      'Deine Alben laden, sobald du wieder Internet hast. Die Kamera funktioniert trotzdem.';

  @override
  String get retry => 'Erneut versuchen';

  @override
  String get noAlbumsTitle => 'Noch keine Alben';

  @override
  String get noAlbumsMessage =>
      'Erstelle eine Gruppe für deinen nächsten Trip oder tritt mit dem Code der Gruppe eines Freundes bei.';

  @override
  String get haveCode => 'Ich habe einen Code';

  @override
  String get joinWithCode => 'Mit Code oder QR-Code beitreten';

  @override
  String get camera => 'Kamera';

  @override
  String get restore => 'Zurückholen';

  @override
  String get more => 'Mehr';

  @override
  String get newAlbum => 'Neu';

  @override
  String get closedTag => 'geschlossen';

  @override
  String get activeTag => 'aktiv';

  @override
  String get uploadFailed => 'Upload fehlgeschlagen';

  @override
  String get queueNoSignal => 'Kein Empfang.';

  @override
  String get queueNoSignalMessage =>
      'Deine Fotos sind schon in deinem Album und werden geteilt, sobald du wieder Internet hast.';

  @override
  String get queueWaitingForWifi => 'Wartet auf WLAN.';

  @override
  String queueWifiOnlyOn(String setting) {
    return 'Du hast „$setting“ eingeschaltet.';
  }

  @override
  String get queueVideosWifiOnly => 'Videos werden nur über WLAN hochgeladen.';

  @override
  String get queueAllShared => 'Alles ist geteilt ✓';

  @override
  String queuePending(String items) {
    return '$items noch zu teilen';
  }

  @override
  String queuePendingBoth(String photos, String videos) {
    return '$photos und $videos noch zu teilen';
  }

  @override
  String get retryUpload => 'Erneut versuchen';

  @override
  String get removeFromQueue => 'Aus der Warteschlange entfernen';

  @override
  String get queueStatusWifi => 'WLAN';

  @override
  String get queueStatusWaiting => 'wartet';

  @override
  String get videosWifiOnlyTitle => 'Videos nur über WLAN';

  @override
  String get videosWifiOnlySubtitle => 'Spart mobile Daten';

  @override
  String get retryNow => 'Jetzt erneut versuchen';

  @override
  String get yourName => 'Dein Name';

  @override
  String get settings => 'Einstellungen';

  @override
  String get tapToChangeName => 'Tippe, um deinen Namen zu ändern';

  @override
  String get getCamTripPro => 'CamTrip Pro holen';

  @override
  String get photos => 'Fotos';

  @override
  String get saveOwnPhotos =>
      'Eigene Fotos pro Gruppe in einem Album speichern';

  @override
  String get autoSaveOthers => 'Fotos der anderen automatisch speichern';

  @override
  String get wifiOnlyTitle => 'Nur über WLAN hochladen';

  @override
  String get dateStamp => 'Datumsstempel';

  @override
  String get notifications => 'Mitteilungen';

  @override
  String get notifyNewPhotos => 'Neue Fotos (gebündelt)';

  @override
  String get notifyRecapReady => 'Recap fertig';

  @override
  String get camTripTeam => 'CamTrip-Team';

  @override
  String get adminEntrySubtitle => 'Nutzer, Pro vergeben, Meldungen und Zahlen';

  @override
  String get account => 'Konto';

  @override
  String get manageSubscription => 'Abo verwalten';

  @override
  String get blockedPeople => 'Blockierte Personen';

  @override
  String get nobody => 'Niemand';

  @override
  String peopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Personen',
      one: '1 Person',
    );
    return '$_temp0';
  }

  @override
  String get privacyPolicy => 'Datenschutzerklärung';

  @override
  String get contact => 'Kontakt';

  @override
  String get signOut => 'Abmelden';

  @override
  String get deleteAccount => 'Konto löschen';

  @override
  String get deleteAccountSubtitle => 'Löscht dein Konto und alle deine Fotos';

  @override
  String get deleteAccountTitle => 'Konto löschen?';

  @override
  String get deleteAccountMessage =>
      'Dein Konto und alle deine Fotos und Videos werden gelöscht, auch aus den Gruppen. Ein laufendes Abo kündigst du im App Store oder bei Google Play.';

  @override
  String get blockedTitle => 'Blockiert';

  @override
  String get blockedSubtitle => 'Du siehst keine Fotos von diesen Personen.';

  @override
  String get blockedNone => 'Du hast niemanden blockiert.';

  @override
  String get unblockShort => 'Aufheben';

  @override
  String get groupGone =>
      'Diese Gruppe gibt es nicht mehr, oder du bist kein Mitglied mehr.';

  @override
  String photosSavedToAlbum(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Fotos in „$album“ gespeichert',
      one: '1 Foto in „$album“ gespeichert',
    );
    return '$_temp0';
  }

  @override
  String photosDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Fotos gelöscht',
      one: '1 Foto gelöscht',
    );
    return '$_temp0';
  }

  @override
  String photosDeletedSkipped(int count, int skipped) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Fotos gelöscht',
      one: '1 Foto gelöscht',
    );
    return '$_temp0, $skipped übersprungen';
  }

  @override
  String photosHiddenForYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Fotos für dich ausgeblendet',
      one: '1 Foto für dich ausgeblendet',
    );
    return '$_temp0';
  }

  @override
  String get addedToFavorites => 'Zu Favoriten hinzugefügt';

  @override
  String get removedFromFavorites => 'Aus Favoriten entfernt';

  @override
  String get photoAccessSettings =>
      'Erlaube CamTrip in den Einstellungen den Zugriff auf deine Fotos';

  @override
  String photosBeingAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Fotos werden hinzugefügt',
      one: '1 Foto wird hinzugefügt',
    );
    return '$_temp0';
  }

  @override
  String photosUnreadable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Fotos konnten nicht gelesen werden',
      one: '1 Foto konnte nicht gelesen werden',
    );
    return '$_temp0';
  }

  @override
  String get groupNotLoaded => 'Gruppe nicht geladen';

  @override
  String get noFavoritesTitle => 'Noch keine Favoriten';

  @override
  String get noPhotosTitle => 'Noch keine Fotos';

  @override
  String get noFavoritesMessage =>
      'Tippe auf den Stern bei einem Foto, um es hier abzulegen.';

  @override
  String get noPhotosMessage =>
      'Mach das erste Foto. Alle in der Gruppe sehen es sofort.';

  @override
  String get openCamera => 'Kamera öffnen';

  @override
  String savingProgress(int done, int total) {
    return 'Speichern... $done/$total';
  }

  @override
  String get choosePhotos => 'Fotos auswählen';

  @override
  String selectedCount(int count) {
    return '$count ausgewählt';
  }

  @override
  String get selectNone => 'Keine auswählen';

  @override
  String get selectAll => 'Alle auswählen';

  @override
  String photosWaitingToShare(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Fotos warten aufs Teilen',
      one: '1 Foto wartet aufs Teilen',
    );
    return '$_temp0';
  }

  @override
  String get recapReadyTitle => 'Dein Recap ist fertig';

  @override
  String get recapReadySubtitle => 'Ein Video mit Musik von eurem Trip';

  @override
  String get watch => 'Ansehen';

  @override
  String get makeRecapNow => 'Jetzt ein Recap-Video machen';

  @override
  String freeGroupDeleteNotice(String date) {
    return 'Gratis-Gruppe: Fotos bleiben bis $date. Speichere sie oder hol dir Pro.';
  }

  @override
  String get filterAll => 'Alle';

  @override
  String get filterFavorites => 'Favoriten';

  @override
  String get filterPerPerson => 'Nach Person';

  @override
  String get filterPerson => 'Person';

  @override
  String get select => 'Auswählen';

  @override
  String get hiddenFilter => 'Ausgeblendet';

  @override
  String get photosBy => 'Fotos von...';

  @override
  String get uploadedTag => 'hochgeladen';

  @override
  String get saveAll => 'Alle speichern';

  @override
  String get favorite => 'Favorit';

  @override
  String get unfavorite => 'Kein Favorit';

  @override
  String get hide => 'Ausblenden';

  @override
  String get delete => 'Löschen';

  @override
  String deletePhotosTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Fotos löschen?',
      one: 'Foto löschen?',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Sie verschwinden für alle in der Gruppe. Das kann nicht rückgängig gemacht werden.',
      one:
          'Es verschwindet für alle in der Gruppe. Das kann nicht rückgängig gemacht werden.',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosNotAllowed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count Fotos gehören jemand anderem. Sie bleiben; nur ein Admin kann sie löschen.',
      one:
          '1 Foto gehört jemand anderem. Es bleibt; nur ein Admin kann es löschen.',
    );
    return '$_temp0';
  }

  @override
  String photosBackInGroup(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Fotos sind wieder in der Gruppe',
      one: '1 Foto ist wieder in der Gruppe',
    );
    return '$_temp0';
  }

  @override
  String get showAll => 'Alle anzeigen';

  @override
  String get hiddenPhotosExplainer =>
      'Nur du siehst diese Fotos nicht mehr. Für die anderen in der Gruppe sind sie weiterhin da.';

  @override
  String get nothingHidden => 'Nichts ausgeblendet';

  @override
  String get nothingHiddenMessage =>
      'Fotos, die du ausblendest, findest du hier wieder.';

  @override
  String showAgainCount(int count) {
    return 'Wieder anzeigen ($count)';
  }

  @override
  String get someone => 'Jemand';

  @override
  String get savedToAlbum => 'In deinem Fotoalbum gespeichert';

  @override
  String get share => 'Teilen';

  @override
  String get shareFailed => 'Teilen hat nicht geklappt';

  @override
  String get reportTitle => 'Warum meldest du dieses Foto?';

  @override
  String get reportSubtitle =>
      'Wir prüfen jede Meldung innerhalb von 24 Stunden. Das Foto ist für dich sofort ausgeblendet.';

  @override
  String get reportThanks => 'Danke, wir schauen es uns an';

  @override
  String blockMessageAllGroups(String name) {
    return 'Du siehst keine Fotos und Videos von $name mehr, in keiner Gruppe, und bekommst dazu keine Mitteilungen. Aufheben kannst du das in den Einstellungen.';
  }

  @override
  String userBlocked(String name) {
    return '$name wurde blockiert';
  }

  @override
  String get videoHiddenForYou => 'Video für dich ausgeblendet';

  @override
  String get photoHiddenForYou => 'Foto für dich ausgeblendet';

  @override
  String get setAsCover => 'Als Titelbild festlegen';

  @override
  String get coverUpdated => 'Titelbild geändert';

  @override
  String get hideForMe => 'Für mich ausblenden';

  @override
  String get hideForMeSubtitle =>
      'Die anderen in der Gruppe sehen es weiterhin';

  @override
  String get reportPhoto => 'Foto melden';

  @override
  String blockName(String name) {
    return '$name blockieren';
  }

  @override
  String get forEveryoneInGroup => 'Für alle in der Gruppe';

  @override
  String get videoDeleted => 'Video gelöscht';

  @override
  String get photoDeleted => 'Foto gelöscht';

  @override
  String get photoAccessToSave =>
      'Erlaube CamTrip in den Einstellungen den Zugriff auf deine Fotos, um zu speichern';

  @override
  String get phoneFull => 'Dein Handy ist voll';

  @override
  String get albumSaveFailedShort => 'Speichern im Album hat nicht geklappt';

  @override
  String get recapTemplateGoldenHour => 'Golden Hour';

  @override
  String get recapTemplateFast => 'Schnell';

  @override
  String get recapTemplateFilmRoll => 'Filmrolle';

  @override
  String get recapTemplatePolaroid => 'Polaroid';

  @override
  String get trackSummerEvening => 'Sommerabend';

  @override
  String get trackGoldenHour => 'Golden Hour';

  @override
  String get trackRoadtrip => 'Roadtrip';

  @override
  String get moodWarm => 'warm';

  @override
  String get moodCheerful => 'fröhlich';

  @override
  String friendsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Freunde',
      one: '1 Freund',
    );
    return '$_temp0';
  }

  @override
  String get madeWithCamTrip => 'Gemacht mit CamTrip';

  @override
  String get tagline => 'Ein Film für die ganze Gruppe';

  @override
  String get videoUnsupportedDevice =>
      'Das Video konnte auf diesem Gerät nicht erstellt werden';

  @override
  String get groupLoadFailed => 'Diese Gruppe konnte nicht geladen werden.';

  @override
  String recapNeedsPhotos(int count) {
    return 'Für ein Recap brauchst du mindestens $count Fotos.';
  }

  @override
  String get recapFailed =>
      'Das Recap hat nicht geklappt. Versuch es noch mal.';

  @override
  String get recapSaved => 'Recap in deinem Fotoalbum gespeichert';

  @override
  String get recap => 'Recap';

  @override
  String get recapRendering => 'Recap wird erstellt...';

  @override
  String get videoRendering => 'Video wird erstellt...';

  @override
  String get template => 'Vorlage';

  @override
  String get musicLicense => 'Eigene Musik von CamTrip · lizenzfrei';

  @override
  String get change => 'Wechseln';

  @override
  String get noWatermark => 'Kein Wasserzeichen ✓';

  @override
  String get removeWatermarkPro => 'Wasserzeichen mit Pro entfernen';

  @override
  String get proSourceSubscription => 'Abo';

  @override
  String get proSourceGift => 'Geschenk';

  @override
  String get proSourceAdmin => 'Admin';

  @override
  String get proSourceGroup => 'Über Gruppe';

  @override
  String get noPro => 'Kein Pro';

  @override
  String proStatusNoEnd(String source) {
    return 'Pro ($source), ohne Enddatum';
  }

  @override
  String proStatusUntil(String source, String date) {
    return 'Pro ($source), bis $date';
  }

  @override
  String get lifetime => 'Lebenslang';

  @override
  String get pickDate => 'Datum wählen';

  @override
  String get noAccess => 'Kein Zugriff';

  @override
  String get adminOnlyTeam => 'Die Verwaltung ist nur für das CamTrip-Team.';

  @override
  String get adminOverview => 'Übersicht';

  @override
  String get adminUsers => 'Nutzer';

  @override
  String get adminReports => 'Meldungen';

  @override
  String adminsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Admins',
      one: '1 Admin',
    );
    return '$_temp0';
  }

  @override
  String get adminNewThisWeek => 'Neu diese Woche';

  @override
  String get adminGroups => 'Gruppen';

  @override
  String get adminProSubscription => 'Pro per Abo';

  @override
  String get adminProGift => 'Pro als Geschenk';

  @override
  String adminWithoutSubscription(int count) {
    return '$count ohne Abo';
  }

  @override
  String get adminOpenReports => 'Offene Meldungen';

  @override
  String get adminSearchHint => 'Nach Name oder E-Mail suchen';

  @override
  String get nobodyFound => 'Niemand gefunden';

  @override
  String get loadMore => 'Mehr laden';

  @override
  String get noEmail => 'Keine E-Mail';

  @override
  String adminDeletePhotoMessage(String groupName) {
    return 'Das Foto verschwindet für alle in „$groupName“. Alle Meldungen zu diesem Foto werden erledigt.';
  }

  @override
  String get adminBanMessage =>
      'Dieses Konto kann sich nicht mehr anmelden und die App nicht mehr nutzen. Du kannst das später rückgängig machen.';

  @override
  String get adminDismissTitle => 'Meldung ignorieren?';

  @override
  String get adminDismissMessage =>
      'Das Foto bleibt. Die Meldung wird als erledigt markiert.';

  @override
  String get adminDismiss => 'Ignorieren';

  @override
  String get adminAccountBlocked => 'Konto gesperrt';

  @override
  String get adminReportDismissed => 'Meldung ignoriert';

  @override
  String get adminNoReports => 'Keine offenen Meldungen';

  @override
  String get adminNoReportsMessage => 'Gemeldete Fotos erscheinen hier.';

  @override
  String get deletedTag => 'Gelöscht';

  @override
  String adminReportedBy(String name) {
    return 'Von $name';
  }

  @override
  String adminPhotoBy(String name) {
    return 'Foto von $name';
  }

  @override
  String reportsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Meldungen',
      one: '1 Meldung',
    );
    return '$_temp0';
  }

  @override
  String get adminDeletePhoto => 'Foto löschen';

  @override
  String get adminBlockCreator => 'Urheber sperren';

  @override
  String get loadFailed => 'Laden hat nicht geklappt';

  @override
  String get adminLifetimeProGiven => 'Lebenslang Pro vergeben';

  @override
  String get adminProGiven => 'Pro vergeben';

  @override
  String adminGiveProUntil(String date) {
    return 'Pro vergeben bis $date';
  }

  @override
  String get adminGiveProLifetime => 'Pro lebenslang vergeben';

  @override
  String adminGiveProFor(String period) {
    return 'Pro vergeben für $period';
  }

  @override
  String get adminReasonHint => 'Grund, z. B. Freund, Tester, Influencer';

  @override
  String get adminGivePro => 'Pro vergeben';

  @override
  String get adminRevokeTitle => 'Geschenk zurückziehen?';

  @override
  String get adminRevokeMessage =>
      'Das geschenkte Pro endet sofort. Ein eigenes Abo läuft weiter.';

  @override
  String get adminRevoke => 'Zurückziehen';

  @override
  String get adminGiftRevoked => 'Geschenk zurückgezogen';

  @override
  String get adminUnbanTitle => 'Sperre aufheben?';

  @override
  String adminUnbanMessage(String name) {
    return '$name kann sich wieder anmelden.';
  }

  @override
  String get adminUnbanned => 'Sperre aufgehoben';

  @override
  String get adminBanUserMessage =>
      'Dieses Konto kann sich nicht mehr anmelden und die App nicht mehr nutzen. Fotos bleiben erhalten.';

  @override
  String get adminUser => 'Nutzer';

  @override
  String get adminNotVerified => 'nicht bestätigt';

  @override
  String get adminRole => 'Rolle';

  @override
  String get adminCreated => 'Erstellt';

  @override
  String get unknown => 'Unbekannt';

  @override
  String get adminSignInWith => 'Anmeldung mit';

  @override
  String get adminEmailMethod => 'E-Mail';

  @override
  String get adminPhotosAndVideos => 'Fotos und Videos';

  @override
  String get adminStatus => 'Status';

  @override
  String get adminActive => 'Aktiv';

  @override
  String adminActiveUntil(String date) {
    return 'Aktiv bis $date';
  }

  @override
  String adminGiftFrom(String name) {
    return 'Geschenk von $name';
  }

  @override
  String adminExpiredOn(String date) {
    return 'Abgelaufen am $date';
  }

  @override
  String get adminExpired => 'Abgelaufen';

  @override
  String adminUntil(String date) {
    return 'Bis $date';
  }

  @override
  String get adminGiveProTitle => 'Pro vergeben';

  @override
  String get adminGiveProNote =>
      'Gilt auch für die Gruppen dieser Person: ein Pro in der Gruppe = Pro für alle in dieser Gruppe.';

  @override
  String get adminRevokeGift => 'Geschenk zurückziehen';

  @override
  String get adminModeration => 'Moderation';

  @override
  String get adminCannotBanSelf => 'Du kannst dich nicht selbst sperren.';

  @override
  String get adminCannotBanAdmin => 'Ein Admin kann nicht gesperrt werden.';

  @override
  String get adminUnban => 'Sperre aufheben';

  @override
  String get adminBanAccount => 'Konto sperren';

  @override
  String get googleSignInUnavailable =>
      'Anmelden mit Google ist noch nicht verfügbar';

  @override
  String get cameraPickerTitle => 'Wähle deine Kamera';

  @override
  String get cameraPickerSubtitle =>
      'Jede Kamera gibt deinen Fotos einen eigenen Look';

  @override
  String get cameraPickerChange => 'Kamera wechseln';

  @override
  String get cameraPickerUnlock => 'Mit Pro freischalten';

  @override
  String get cameraPickerSelected => 'Ausgewählt';

  @override
  String get cameraPickerStyleSummer => 'Sommer';

  @override
  String get cameraPickerStyleSummerDescription =>
      'Warme, verblasste Farben eines 90er-Schnappschusses';

  @override
  String get cameraPickerStyleNight => 'Nacht 800';

  @override
  String get cameraPickerStyleNightDescription =>
      'Kinofilm: blaugrüne Schatten, warmes Licht, viel Korn';

  @override
  String get cameraPickerStyleSepia => 'Sepia';

  @override
  String get cameraPickerStyleSepiaDescription =>
      'Ein alter brauner Abzug aus dem Schuhkarton';

  @override
  String get cameraPickerStyleLomo => 'Lomo';

  @override
  String get cameraPickerStyleLomoDescription =>
      'Kräftige Farben, dunkle Ecken und ein wilder Farbstich';

  @override
  String get cameraPickerStyleMint => 'Mint';

  @override
  String get cameraPickerStyleMintDescription =>
      'Sanft und frisch mit grünem Schimmer';

  @override
  String get cameraPickerStylePastel => 'Rosa';

  @override
  String get cameraPickerStylePastelDescription =>
      'Pastellfarben mit rosa Schimmer und weißem Rand';

  @override
  String get cameraPickerStyleSuper8 => 'Super 8';

  @override
  String get cameraPickerStyleSuper8Description =>
      'Körnig und weich wie ein altes Heimvideo';

  @override
  String get paywallBenefitGroup => 'Ein Pro = Pro für die ganze Gruppe';

  @override
  String get paywallBenefitUnlimited =>
      'Unbegrenzte Mitglieder, Fotos für immer';

  @override
  String get paywallBenefitQuality => 'Kein Wasserzeichen, Originalqualität';

  @override
  String paywallFreeTrial(String period) {
    return '$period gratis';
  }

  @override
  String paywallPriceYear(String price) {
    return '$price pro Jahr.';
  }

  @override
  String paywallPriceYearTrial(String period, String price) {
    return '$period gratis, danach $price pro Jahr.';
  }

  @override
  String paywallPriceMonth(String price) {
    return '$price pro Monat.';
  }

  @override
  String paywallPriceMonthTrial(String period, String price) {
    return '$period gratis, danach $price pro Monat.';
  }

  @override
  String paywallAutoRenew(String store) {
    return 'Verlängert sich automatisch. Kündige mindestens 24 Stunden vor der Verlängerung in $store.';
  }

  @override
  String get paywallDetailsTitle => 'Alles in Pro';

  @override
  String get paywallBenefitStyles => 'Alle Kamerastile';

  @override
  String get allPhotosTitle => 'Alle Fotos';

  @override
  String get allPhotosSubtitle =>
      'Alles, was du selbst aufgenommen hast, aus jedem Album';

  @override
  String get allPhotosEmptyTitle => 'Noch keine Fotos';

  @override
  String get allPhotosEmptyMessage =>
      'Öffne die Kamera und mach dein erstes Foto.';

  @override
  String get allPhotosOpenCamera => 'Kamera öffnen';

  @override
  String get allPhotosChooseAlbum => 'Album wählen';

  @override
  String get allPhotosLoadFailed => 'Deine Fotos konnten nicht geladen werden';

  @override
  String get cameraSettingsTitle => 'Kamera-Einstellungen';

  @override
  String get cameraSettingsMore => 'Weitere Einstellungen';

  @override
  String get cameraSettingsGrid => 'Raster';

  @override
  String get cameraSettingsHaptics => 'Vibration beim Auslösen';

  @override
  String get cameraSettingsDateStamp => 'Datumsstempel unten rechts';

  @override
  String get cameraSettingsSound => 'Auslöseton';

  @override
  String get cameraSettingsSoundHint => 'Stumm, wenn dein Handy lautlos ist';

  @override
  String get cameraSettingsTimer => 'Selbstauslöser';

  @override
  String get cameraSettingsTimerOff => 'Aus';

  @override
  String cameraSettingsTimerSeconds(int seconds) {
    return '$seconds s';
  }

  @override
  String get cameraSettingsTimerCancelHint =>
      'Tippe auf den Auslöser zum Abbrechen';

  @override
  String get cameraSettingsMirror => 'Selfies spiegeln';

  @override
  String get cameraSettingsSaveToRoll => 'In Fotos speichern';

  @override
  String get cameraSettingsQuality => 'Qualität';

  @override
  String get cameraSettingsQualityStandard => 'Standard';

  @override
  String get cameraSettingsQualityHigh => 'Hoch';

  @override
  String get cameraLowLightHint => 'Wenig Licht - schalte den Blitz ein';

  @override
  String get cameraFlashUnavailable => 'Diese Kamera hat keinen Blitz';

  @override
  String get cameraFlashScreen => 'Bildschirmblitz';

  @override
  String get cameraFlashCycleHint =>
      'Tippe, um zwischen aus, an und auto zu wechseln';

  @override
  String cameraPickerPaywallStyles(int count, String styles) {
    return 'Alle $count Kameras, darunter $styles';
  }

  @override
  String get styleFlash => 'Blitz 400';

  @override
  String get styleFlashDescription =>
      'Direkter Blitz auf warmem Film: Bernsteinton, Korn, kräftiges Rot';
}
