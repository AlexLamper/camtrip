// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class AppLocalizationsEl extends AppLocalizations {
  AppLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get cancel => 'Ακύρωση';

  @override
  String get yes => 'Ναι';

  @override
  String inviteMessageIntro(String groupName) {
    return 'Θες να μπεις στο «$groupName» στο CamTrip; Έτσι βλέπουμε αμέσως ο ένας τις φωτογραφίες του άλλου.';
  }

  @override
  String inviteMessageCode(String code) {
    return 'Ή βάλε τον κωδικό: $code';
  }

  @override
  String get memberFallbackName => 'Φίλος';

  @override
  String get reportReasonInappropriate => 'Ακατάλληλο ή προσβλητικό';

  @override
  String get reportReasonSpam => 'Spam';

  @override
  String get reportReasonOther => 'Κάτι άλλο';

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
  String get errorOffline => 'Δεν υπάρχει σύνδεση. Δοκίμασε ξανά σε λίγο.';

  @override
  String errorSomethingWrongStatus(int status) {
    return 'Κάτι πήγε στραβά ($status)';
  }

  @override
  String get errorSomethingWrong => 'Κάτι πήγε στραβά';

  @override
  String get apiInvalidCredentials =>
      'Λάθος διεύθυνση email ή κωδικός πρόσβασης';

  @override
  String get apiInvalidCode =>
      'Ο κωδικός είναι λάθος ή έχει λήξει. Ζήτησε νέο κωδικό.';

  @override
  String get apiEmailTaken =>
      'Υπάρχει ήδη λογαριασμός με αυτό το email. Συνδέσου ή επίλεξε «Ξέχασες τον κωδικό;».';

  @override
  String apiEmailTakenProvider(String provider) {
    return 'Υπάρχει ήδη λογαριασμός με αυτό το email. Συνδέσου με $provider.';
  }

  @override
  String apiWeakPassword(int min) {
    return 'Επίλεξε κωδικό με τουλάχιστον $min χαρακτήρες';
  }

  @override
  String apiNameTooLong(int max) {
    return 'Το όνομά σου μπορεί να έχει έως $max χαρακτήρες';
  }

  @override
  String get apiRateLimited =>
      'Πάρα πολλές προσπάθειες. Δοκίμασε ξανά σε 15 λεπτά.';

  @override
  String apiAccountBanned(String email) {
    return 'Ο λογαριασμός σου έχει αποκλειστεί. Επικοινώνησε με $email αν πιστεύεις ότι είναι λάθος.';
  }

  @override
  String get apiProRequired => 'Αυτό το στιλ κάμερας ανήκει στο CamTrip Pro';

  @override
  String get apiGroupClosed => 'Αυτή η ομάδα έχει κλείσει';

  @override
  String get apiGroupCodeNotFound => 'Δεν βρέθηκε ομάδα με αυτόν τον κωδικό';

  @override
  String apiGroupFull(int max) {
    return 'Η ομάδα είναι γεμάτη (έως $max μέλη). Αν ένα μέλος έχει CamTrip Pro, μπορεί να μπει οποιοσδήποτε.';
  }

  @override
  String get apiLastMember =>
      'Είσαι το τελευταίο μέλος. Διάγραψε καλύτερα την ομάδα.';

  @override
  String get apiAdminRequired => 'Μόνο για διαχειριστές του CamTrip';

  @override
  String get apiUploadIncomplete => 'Η μεταφόρτωση δεν ολοκληρώθηκε';

  @override
  String get apiInvalidInput => 'Μη έγκυρα στοιχεία';

  @override
  String get apiNotSignedIn => 'Δεν έχεις συνδεθεί';

  @override
  String get apiAccountGone => 'Αυτός ο λογαριασμός δεν υπάρχει πια';

  @override
  String get apiPhotoNotFound => 'Η φωτογραφία δεν βρέθηκε';

  @override
  String get apiGroupNotFound => 'Η ομάδα δεν βρέθηκε';

  @override
  String get apiMemberNotFound => 'Το μέλος δεν βρέθηκε';

  @override
  String get apiPersonNotFound => 'Το άτομο δεν βρέθηκε';

  @override
  String get apiUserNotFound => 'Ο χρήστης δεν βρέθηκε';

  @override
  String get apiAdminOnly => 'Μόνο ένας διαχειριστής μπορεί να το κάνει αυτό';

  @override
  String get apiCannotBlockSelf => 'Δεν μπορείς να αποκλείσεις τον εαυτό σου';

  @override
  String get apiCannotReportOwn =>
      'Δεν μπορείς να αναφέρεις τη δική σου φωτογραφία';

  @override
  String get apiDeleteOwnOnly =>
      'Μπορείς να διαγράψεις μόνο τις δικές σου φωτογραφίες';

  @override
  String get apiOwnerCannotBeRemoved =>
      'Ο δημιουργός της ομάδας δεν μπορεί να αφαιρεθεί';

  @override
  String get apiOwnerStaysAdmin => 'Ο δημιουργός παραμένει πάντα διαχειριστής';

  @override
  String get apiNeedsOneAdmin =>
      'Μια ομάδα χρειάζεται τουλάχιστον έναν διαχειριστή';

  @override
  String get apiEndBeforeStart =>
      'Η ημερομηνία λήξης είναι πριν από την ημερομηνία έναρξης';

  @override
  String get apiPermanentNoEndDate =>
      'Μια ομάδα που είναι πάντα ανοιχτή δεν έχει ημερομηνία λήξης';

  @override
  String get apiCannotBanAdmin => 'Ένας διαχειριστής δεν μπορεί να αποκλειστεί';

  @override
  String get apiReportNotFound => 'Η αναφορά δεν βρέθηκε';

  @override
  String get apiPhotoOwnerUnknown =>
      'Αυτός που τράβηξε τη φωτογραφία δεν είναι πια γνωστός';

  @override
  String get validationNameRequired => 'Γράψε το όνομά σου';

  @override
  String validationMaxChars(int max) {
    return 'Έως $max χαρακτήρες';
  }

  @override
  String get validationEmailRequired => 'Γράψε τη διεύθυνση email σου';

  @override
  String get validationEmailInvalid =>
      'Αυτή η διεύθυνση email δεν είναι έγκυρη';

  @override
  String get validationPasswordRequired => 'Επίλεξε κωδικό πρόσβασης';

  @override
  String validationMinChars(int min) {
    return 'Τουλάχιστον $min χαρακτήρες';
  }

  @override
  String get validationPasswordTooLong => 'Ο κωδικός είναι πολύ μεγάλος';

  @override
  String get validationPasswordEmpty => 'Γράψε τον κωδικό σου';

  @override
  String get validationCodeRequired => 'Γράψε τον κωδικό από το email';

  @override
  String get validationCodeDigits => 'Ο κωδικός έχει 6 ψηφία';

  @override
  String get onboarding1Title => 'Ένα φιλμ\nγια όλη την παρέα.';

  @override
  String get onboarding1Body =>
      'Τράβα με μια ρετρό κάμερα. Όλοι βλέπουν αμέσως τις φωτογραφίες σου, και είναι αμέσως και στο δικό σου άλμπουμ.';

  @override
  String get onboarding2Title => 'Τέλος το\nστείλε-μου-φωτογραφίες.';

  @override
  String get onboarding2Body =>
      'Φτιάξε μια ομάδα, μοιράσου τον κωδικό, τέλος. Ποτέ ξανά «μου στέλνεις αυτές τις φωτογραφίες;»';

  @override
  String get onboarding3Title => 'Ένα βίντεο ανασκόπησης\nμετά.';

  @override
  String get onboarding3Body =>
      'Το CamTrip φτιάχνει ένα βίντεο με μουσική από τις καλύτερες κοινές σας στιγμές.';

  @override
  String get onboardingInvited => 'Σε προσκάλεσαν! Συνδέσου για να μπεις.';

  @override
  String get signInAppleFailed => 'Η σύνδεση με Apple δεν πέτυχε';

  @override
  String get signInGoogleFailed => 'Η σύνδεση με Google δεν πέτυχε';

  @override
  String get signInFailed => 'Η σύνδεση δεν πέτυχε';

  @override
  String get next => 'Επόμενο';

  @override
  String get legalPrefix => 'Συνεχίζοντας, αποδέχεσαι τους';

  @override
  String get legalTerms => 'όρους';

  @override
  String get legalAnd => ' και την';

  @override
  String get legalPrivacy => 'πολιτική απορρήτου';

  @override
  String get legalSuffix => '.';

  @override
  String get continueWithApple => 'Συνέχεια με Apple';

  @override
  String get continueWithGoogle => 'Συνέχεια με Google';

  @override
  String get createAccount => 'Δημιουργία λογαριασμού';

  @override
  String get signIn => 'Σύνδεση';

  @override
  String get or => 'ή';

  @override
  String get registerSubtitle =>
      'Για να βλέπουν οι φίλοι σου ποιος τράβηξε τις φωτογραφίες.';

  @override
  String get loginSubtitle => 'Καλώς ήρθες ξανά.';

  @override
  String get forgotPasswordTitle => 'Ξέχασες τον κωδικό';

  @override
  String get forgotPasswordPushSubtitle =>
      'Είσαι ακόμα συνδεδεμένος κάπου; Θα στείλουμε εκεί έναν 6ψήφιο κωδικό με ειδοποίηση push για να ορίσεις νέο κωδικό.';

  @override
  String get newPassword => 'Νέος κωδικός';

  @override
  String get resetPushInfo =>
      'Αν είσαι ακόμα συνδεδεμένος κάπου, θα λάβεις εκεί ειδοποίηση push με έναν κωδικό. Δεν μπορείς να μπεις; Συνδέσου με Apple ή Google με την ίδια διεύθυνση email - ο λογαριασμός σου θα συνδεθεί.';

  @override
  String get sendCode => 'Αποστολή κωδικού';

  @override
  String get savePassword => 'Αποθήκευση κωδικού';

  @override
  String get errorTryAgain => 'Κάτι πήγε στραβά. Δοκίμασε ξανά.';

  @override
  String get back => 'Πίσω';

  @override
  String get name => 'Όνομα';

  @override
  String get email => 'Διεύθυνση email';

  @override
  String get codeFromPush => 'Κωδικός από την ειδοποίηση';

  @override
  String get password => 'Κωδικός πρόσβασης';

  @override
  String get hidePassword => 'Απόκρυψη κωδικού';

  @override
  String get showPassword => 'Εμφάνιση κωδικού';

  @override
  String get forgotPasswordLink => 'Ξέχασες τον κωδικό;';

  @override
  String get haveAccount => 'Έχεις ήδη λογαριασμό;';

  @override
  String get newToCamTrip => 'Νέος στο CamTrip;';

  @override
  String get rememberedIt => 'Τον θυμήθηκες;';

  @override
  String get noCodeReceived => 'Δεν πήρες κωδικό;';

  @override
  String get resendCode => 'Στείλε ξανά';

  @override
  String onboardingDemoRoll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count φωτογράφοι, 1 φιλμ',
      one: '1 φωτογράφος, 1 φιλμ',
    );
    return '$_temp0';
  }

  @override
  String membersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count μέλη',
      one: '1 μέλος',
    );
    return '$_temp0';
  }

  @override
  String photosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count φωτογραφίες',
      one: '1 φωτογραφία',
    );
    return '$_temp0';
  }

  @override
  String videosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count βίντεο',
      one: '1 βίντεο',
    );
    return '$_temp0';
  }

  @override
  String get justNow => 'τώρα';

  @override
  String get badgeNew => 'Νέο';

  @override
  String recapTitle(String groupName) {
    return 'Ανασκόπηση $groupName';
  }

  @override
  String get styleFilm => 'Φιλμ';

  @override
  String get styleInstant => 'Instant';

  @override
  String get styleDisposable => 'Μιας χρήσης';

  @override
  String get styleBw => 'Α/Μ';

  @override
  String get styleGolden => 'Χρυσό';

  @override
  String get styleChrome => 'Χρώμιο';

  @override
  String get styleFilmDescription =>
      'Ζεστά χρώματα, κόκκος και πορτοκαλί ημερομηνία';

  @override
  String get styleInstantDescription => 'Απαλά χρώματα και λευκό περίγραμμα';

  @override
  String get styleDisposableDescription =>
      'Σκληρό φλας, βινιέτα και διαρροές φωτός';

  @override
  String get styleBwDescription => 'Ασπρόμαυρο με κόκκο και βαθιά αντίθεση';

  @override
  String get styleGoldenDescription => 'Πάντα χρυσή ώρα, μια απαλή χρυσή λάμψη';

  @override
  String get styleChromeDescription =>
      'Ψυχρό, κορεσμένο και καθαρό, σαν φιλμ διαφανειών';

  @override
  String get shutterStopRecording => 'Διακοπή εγγραφής';

  @override
  String get shutterStartRecording => 'Έναρξη εγγραφής βίντεο';

  @override
  String get shutterTakePhoto => 'Λήψη φωτογραφίας';

  @override
  String get modePhoto => 'Φωτογραφία';

  @override
  String get modeVideo => 'Βίντεο';

  @override
  String get cameraNotFound => 'Δεν βρέθηκε κάμερα';

  @override
  String get cameraAccessNeeded =>
      'Το CamTrip χρειάζεται πρόσβαση στην κάμερα. Ενεργοποίησέ την στις Ρυθμίσεις.';

  @override
  String get cameraStartFailed => 'Η κάμερα δεν μπόρεσε να ξεκινήσει';

  @override
  String get albumAccessNeeded =>
      'Δώσε στο CamTrip πρόσβαση στις φωτογραφίες σου για να τις αποθηκεύει και στο άλμπουμ σου';

  @override
  String get albumSaveFailed =>
      'Η αποθήκευση στο άλμπουμ δεν πέτυχε. Η φωτογραφία κοινοποιήθηκε κανονικά.';

  @override
  String styleProFallback(String style) {
    return 'Αυτό το στιλ ανήκει στο Pro. Σε αυτή την ομάδα τραβάς με $style.';
  }

  @override
  String get photoFailed => 'Η λήψη της φωτογραφίας δεν πέτυχε. Δοκίμασε ξανά.';

  @override
  String get recordingFailed => 'Η εγγραφή βίντεο δεν πέτυχε';

  @override
  String get videoFailed =>
      'Η δημιουργία του βίντεο δεν πέτυχε. Δοκίμασε ξανά.';

  @override
  String get shootInGroup => 'Λήψη στην ομάδα';

  @override
  String get close => 'Κλείσιμο';

  @override
  String get flash => 'Φλας';

  @override
  String get flashOn => 'Ναι';

  @override
  String get flashOff => 'Όχι';

  @override
  String get flashAuto => 'Αυτόματο';

  @override
  String get chooseGroup => 'Επιλογή ομάδας';

  @override
  String get switchCamera => 'Αλλαγή κάμερας';

  @override
  String get createOrJoinFirst => 'Φτιάξε πρώτα μια ομάδα ή μπες σε μία';

  @override
  String get proViaGroup => 'Pro μέσω της ομάδας';

  @override
  String proViaName(String name) {
    return 'Pro μέσω $name';
  }

  @override
  String get proStylesFreeViaMember =>
      'Τα στιλ Pro σε αυτή την ομάδα είναι δωρεάν για σένα χάρη σε ένα μέλος με Pro';

  @override
  String proStylesFreeViaName(String name) {
    return 'Στιλ Pro σε αυτή την ομάδα: δωρεάν για σένα χάρη στον/στην $name';
  }

  @override
  String get subscriptionsUnavailable =>
      'Οι συνδρομές δεν είναι διαθέσιμες αυτή τη στιγμή. Δοκίμασε ξανά αργότερα.';

  @override
  String get paymentPending =>
      'Η πληρωμή σου επεξεργάζεται ακόμα. Το Pro ενεργοποιείται μόλις ολοκληρωθεί.';

  @override
  String get purchaseFailed => 'Η αγορά δεν πέτυχε. Δοκίμασε ξανά αργότερα.';

  @override
  String get restoreUnavailable =>
      'Η επαναφορά αγορών δεν είναι δυνατή αυτή τη στιγμή. Δοκίμασε ξανά αργότερα.';

  @override
  String get restoreFailed => 'Η επαναφορά δεν πέτυχε. Δοκίμασε ξανά αργότερα.';

  @override
  String get welcomePro => 'Καλώς ήρθες στο CamTrip Pro! 🎉';

  @override
  String get proRestored => 'Το Pro επανήλθε';

  @override
  String get noPurchaseFound => 'Δεν βρέθηκε προηγούμενη αγορά';

  @override
  String periodDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ημέρες',
      one: '1 ημέρα',
    );
    return '$_temp0';
  }

  @override
  String periodWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count εβδομάδες',
      one: '1 εβδομάδα',
    );
    return '$_temp0';
  }

  @override
  String periodMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count μήνες',
      one: '1 μήνας',
    );
    return '$_temp0';
  }

  @override
  String periodYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count έτη',
      one: '1 έτος',
    );
    return '$_temp0';
  }

  @override
  String get paywallHavePro => 'Έχεις CamTrip Pro';

  @override
  String get paywallSubtitle => 'Όλα για το επόμενο ταξίδι σου.';

  @override
  String paywallFeatureStyles(String styles) {
    return 'Όλα τα στιλ κάμερας ($styles)';
  }

  @override
  String get paywallFeatureUnlimited =>
      'Απεριόριστα μέλη και χώρος, οι φωτογραφίες μένουν για πάντα';

  @override
  String get paywallFeatureNoWatermark => 'Ανασκοπήσεις χωρίς υδατογράφημα';

  @override
  String get paywallFeatureOriginal => 'Λήψη σε αρχική ποιότητα';

  @override
  String get planYear => 'Έτος';

  @override
  String get planMonth => 'Μήνας';

  @override
  String pricePerMonth(String price) {
    return '$price τον μήνα';
  }

  @override
  String paywallSaveBadge(int percent) {
    return 'ΕΞΟΙΚΟΝΟΜΗΣΗ $percent%';
  }

  @override
  String get planMonthCancelAnytime => 'ακύρωση οποτεδήποτε';

  @override
  String tryFree(String period) {
    return 'Δοκίμασε $period δωρεάν';
  }

  @override
  String get becomePro => 'Απόκτησε Pro';

  @override
  String get subscriptionsLoadFailed =>
      'Δεν φορτώθηκαν οι συνδρομές. Έλεγξε τη σύνδεσή σου.';

  @override
  String legalAnnual(String price) {
    return 'Ετήσια συνδρομή CamTrip Pro: $price τον χρόνο.';
  }

  @override
  String legalAnnualTrial(String period, String price) {
    return 'Ετήσια συνδρομή CamTrip Pro: $period δωρεάν, μετά $price τον χρόνο.';
  }

  @override
  String legalMonthly(String price) {
    return 'Μηνιαία συνδρομή CamTrip Pro: $price τον μήνα.';
  }

  @override
  String legalMonthlyTrial(String period, String price) {
    return 'Μηνιαία συνδρομή CamTrip Pro: $period δωρεάν, μετά $price τον μήνα.';
  }

  @override
  String get legalBillingApple =>
      'Η πληρωμή χρεώνεται στο Apple ID σου. Η συνδρομή ανανεώνεται αυτόματα, εκτός αν την ακυρώσεις τουλάχιστον 24 ώρες πριν από το τέλος της περιόδου. Μπορείς να την ακυρώσεις και να τη διαχειριστείς στις ρυθμίσεις λογαριασμού του App Store.';

  @override
  String get legalBillingGoogle =>
      'Η πληρωμή χρεώνεται στον λογαριασμό σου Google. Η συνδρομή ανανεώνεται αυτόματα, εκτός αν την ακυρώσεις τουλάχιστον 24 ώρες πριν από το τέλος της περιόδου. Μπορείς να την ακυρώσεις και να τη διαχειριστείς στις ρυθμίσεις λογαριασμού του Google Play.';

  @override
  String get restorePurchases => 'Επαναφορά αγορών';

  @override
  String get terms => 'Όροι';

  @override
  String get privacy => 'Απόρρητο';

  @override
  String get groupProTitle =>
      'Ένα Pro στην ομάδα = Pro για όλους σε αυτή την ομάδα';

  @override
  String get groupProBody =>
      'Αν ένα άτομο έχει Pro, όλη η ομάδα παίρνει όλα τα στιλ κάμερας, απεριόριστα μέλη, φωτογραφίες που μένουν, αρχική ποιότητα και ανασκοπήσεις χωρίς υδατογράφημα.';

  @override
  String get groupCreated => 'Η ομάδα δημιουργήθηκε ✓';

  @override
  String get inviteFriends => 'Κάλεσε τους φίλους σου';

  @override
  String get codeCopied => 'Ο κωδικός αντιγράφηκε';

  @override
  String get shareLink => 'Κοινοποίηση συνδέσμου';

  @override
  String inviteSubject(String groupName) {
    return 'Μπες στο $groupName στο CamTrip';
  }

  @override
  String inviteMembersUnlimited(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count μέλη',
      one: '1 μέλος',
    );
    return '$_temp0 · απεριόριστα (Pro)';
  }

  @override
  String inviteMembersLimit(int count, int limit) {
    return '$count από $limit μέλη · Pro: απεριόριστα';
  }

  @override
  String get toCamera => 'Στην κάμερα';

  @override
  String get done => 'Τέλος';

  @override
  String get joinEnterCode => 'Γράψε τον 6ψήφιο κωδικό';

  @override
  String get joinGroupTitle => 'Μπες σε μια ομάδα';

  @override
  String get joinGroupSubtitle =>
      'Γράψε τον κωδικό των φίλων σου ή σάρωσε τον κωδικό QR τους.';

  @override
  String get typeCode => 'Πληκτρολόγηση κωδικού';

  @override
  String get scanQr => 'Σάρωση QR';

  @override
  String get join => 'Είσοδος';

  @override
  String get groupNameRequired => 'Δώσε όνομα στην ομάδα σου';

  @override
  String get newGroup => 'Νέα ομάδα';

  @override
  String get groupType => 'Τύπος ομάδας';

  @override
  String get groupTypeVacation => 'Διακοπές';

  @override
  String get groupTypeVacationDescription =>
      'Με ημερομηνία έναρξης και λήξης, μετά αρχειοθετείται';

  @override
  String get groupTypeEvent => 'Εκδήλωση';

  @override
  String get groupTypeEventDescription => 'Μία μέρα ή βραδιά, π.χ. ένα πάρτι';

  @override
  String get groupTypePermanent => 'Πάντα ανοιχτή';

  @override
  String get groupTypePermanentDescription => 'Για τη σταθερή σου παρέα';

  @override
  String get date => 'Ημερομηνία';

  @override
  String get departure => 'Αναχώρηση';

  @override
  String get returnDate => 'Επιστροφή';

  @override
  String get defaultCameraStyle => 'Προεπιλεγμένο στιλ κάμερας';

  @override
  String freeLimitPermanent(int max) {
    return 'Δωρεάν: έως $max μέλη. Απεριόριστα με Pro.';
  }

  @override
  String freeLimitDated(int max, int days) {
    return 'Δωρεάν: έως $max μέλη, οι φωτογραφίες μένουν έως $days ημέρες μετά τη λήξη. Απεριόριστα και για πάντα με Pro.';
  }

  @override
  String get createGroup => 'Δημιουργία ομάδας';

  @override
  String get group => 'Ομάδα';

  @override
  String groupCode(String code) {
    return 'κωδικός $code';
  }

  @override
  String get manage => 'Διαχείριση';

  @override
  String get rename => 'Μετονομασία';

  @override
  String get changeDates => 'Αλλαγή ημερομηνιών';

  @override
  String get finishTrip => 'Τέλος ταξιδιού';

  @override
  String get finishTripSubtitle => 'Η ημερομηνία λήξης γίνεται σήμερα';

  @override
  String get reopenGroup => 'Επανάνοιγμα ομάδας';

  @override
  String get closeGroup => 'Κλείσιμο ομάδας';

  @override
  String get reopenGroupSubtitle =>
      'Τα μέλη μπορούν ξανά να προσθέτουν φωτογραφίες';

  @override
  String get closeGroupSubtitle =>
      'Κανείς δεν μπορεί να προσθέσει φωτογραφίες· όλα μπορούν ακόμα να προβληθούν';

  @override
  String get members => 'Μέλη';

  @override
  String memberYou(String name) {
    return '$name (εσύ)';
  }

  @override
  String get blockedTag => 'αποκλεισμένος';

  @override
  String get adminTag => 'διαχειριστής';

  @override
  String removeMemberTitle(String name) {
    return 'Αφαίρεση του/της $name;';
  }

  @override
  String get removeMemberMessage => 'Οι φωτογραφίες του/της μένουν στην ομάδα.';

  @override
  String get remove => 'Διαγραφή';

  @override
  String get removeMember => 'Αφαίρεση';

  @override
  String blockTitle(String name) {
    return 'Αποκλεισμός του/της $name;';
  }

  @override
  String blockMessage(String name) {
    return 'Δεν θα βλέπεις πια φωτογραφίες και βίντεο από $name ούτε θα λαμβάνεις ειδοποιήσεις γι\' αυτά. Μπορείς να το αναιρέσεις στις Ρυθμίσεις.';
  }

  @override
  String get block => 'Αποκλεισμός';

  @override
  String get makeMember => 'Κάνε απλό μέλος';

  @override
  String get makeAdmin => 'Κάνε διαχειριστή';

  @override
  String get removeFromGroup => 'Αφαίρεση από την ομάδα';

  @override
  String get unblock => 'Άρση αποκλεισμού';

  @override
  String get inviteFriendsButton => 'Κάλεσε φίλους';

  @override
  String get you => 'Εσύ';

  @override
  String get unarchive => 'Επαναφορά από το αρχείο';

  @override
  String get archive => 'Αρχειοθέτηση';

  @override
  String get unarchiveSubtitle => 'Η ομάδα είναι ξανά στα άλμπουμ σου';

  @override
  String archiveSubtitle(String section) {
    return 'Μόνο για σένα: η ομάδα μετακινείται στο «$section» στο κάτω μέρος των άλμπουμ σου';
  }

  @override
  String get archivedSection => 'Αρχειοθετημένα';

  @override
  String get hiddenPhotos => 'Κρυφές φωτογραφίες';

  @override
  String get hiddenPhotosSubtitle =>
      'Φωτογραφίες που έκρυψες για τον εαυτό σου';

  @override
  String get leaveGroup => 'Αποχώρηση από την ομάδα';

  @override
  String get leaveGroupSubtitle =>
      'Οι φωτογραφίες σου μένουν στην ομάδα για τους άλλους';

  @override
  String get deleteGroup => 'Διαγραφή ομάδας';

  @override
  String get deleteGroupSubtitle =>
      'Όλες οι φωτογραφίες διαγράφονται για όλους';

  @override
  String groupArchived(String groupName) {
    return 'Το «$groupName» αρχειοθετήθηκε';
  }

  @override
  String groupUnarchived(String groupName) {
    return 'Το «$groupName» είναι ξανά στα άλμπουμ σου';
  }

  @override
  String get undo => 'Αναίρεση';

  @override
  String get groupNameTitle => 'Όνομα ομάδας';

  @override
  String get finishTripTitle => 'Τέλος ταξιδιού;';

  @override
  String get finishTripMessage =>
      'Η ημερομηνία λήξης γίνεται σήμερα. Μπορείς ακόμα να προσθέτεις φωτογραφίες· η ανασκόπηση είναι έτοιμη.';

  @override
  String get finishTripConfirm => 'Τέλος';

  @override
  String get tripFinished => 'Το ταξίδι τελείωσε';

  @override
  String leaveGroupTitle(String groupName) {
    return 'Αποχώρηση από το «$groupName»;';
  }

  @override
  String get leaveGroupMessage =>
      'Οι φωτογραφίες σου μένουν στην ομάδα για τους άλλους. Μπορείς να ξαναμπείς αργότερα με τον κωδικό.';

  @override
  String get leave => 'Αποχώρηση';

  @override
  String groupDeleted(String groupName) {
    return 'Το «$groupName» διαγράφηκε';
  }

  @override
  String get youAreAdmin => 'είσαι διαχειριστής';

  @override
  String get open => 'Άνοιγμα';

  @override
  String get archiveMenuSubtitle =>
      'Μόνο για σένα, οι άλλοι δεν θα το καταλάβουν';

  @override
  String get deleteGroupMenuSubtitle => 'Για όλους, με όλες τις φωτογραφίες';

  @override
  String get deleteGroupTitle => 'Διαγραφή ομάδας;';

  @override
  String deleteGroupMessage(int count, String groupName, int memberCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Και οι $count φωτογραφίες και βίντεο',
      one: '1 φωτογραφία ή βίντεο',
    );
    String _temp1 = intl.Intl.pluralLogic(
      memberCount,
      locale: localeName,
      other: 'όλα τα $memberCount μέλη',
      one: '1 μέλος',
    );
    return '$_temp0 στο «$groupName» θα εξαφανιστούν για $_temp1. Αυτό δεν αναιρείται.';
  }

  @override
  String get deleteGroupOwnRoll =>
      'Το δικό σου άλμπουμ κάμερας μένει όπως είναι.';

  @override
  String get deleteGroupTypeName =>
      'Γράψε το όνομα της ομάδας για επιβεβαίωση:';

  @override
  String get deleteForEveryone => 'Διαγραφή για όλους';

  @override
  String get save => 'Αποθήκευση';

  @override
  String get yourAlbums => 'Τα άλμπουμ σου';

  @override
  String get uploadQueue => 'Ουρά μεταφόρτωσης';

  @override
  String get noConnection => 'Δεν υπάρχει σύνδεση';

  @override
  String get albumsOfflineMessage =>
      'Τα άλμπουμ σου θα φορτώσουν μόλις συνδεθείς ξανά. Η κάμερα λειτουργεί κανονικά.';

  @override
  String get retry => 'Δοκίμασε ξανά';

  @override
  String get noAlbumsTitle => 'Δεν υπάρχουν ακόμα άλμπουμ';

  @override
  String get noAlbumsMessage =>
      'Φτιάξε μια ομάδα για το επόμενο ταξίδι σου ή μπες στην ομάδα ενός φίλου με τον κωδικό του.';

  @override
  String get haveCode => 'Έχω κωδικό';

  @override
  String get joinWithCode => 'Είσοδος με κωδικό ή κωδικό QR';

  @override
  String get camera => 'Κάμερα';

  @override
  String get restore => 'Επαναφορά';

  @override
  String get more => 'Περισσότερα';

  @override
  String get newAlbum => 'Νέο';

  @override
  String get closedTag => 'κλειστή';

  @override
  String get activeTag => 'ενεργή';

  @override
  String get uploadFailed => 'Η μεταφόρτωση απέτυχε';

  @override
  String get queueNoSignal => 'Δεν υπάρχει σήμα.';

  @override
  String get queueNoSignalMessage =>
      'Οι φωτογραφίες σου είναι ήδη στο άλμπουμ σου και θα κοινοποιηθούν μόλις συνδεθείς ξανά.';

  @override
  String get queueWaitingForWifi => 'Αναμονή για Wi-Fi.';

  @override
  String queueWifiOnlyOn(String setting) {
    return 'Έχεις ενεργοποιήσει το «$setting».';
  }

  @override
  String get queueVideosWifiOnly => 'Τα βίντεο ανεβαίνουν μόνο μέσω Wi-Fi.';

  @override
  String get queueAllShared => 'Όλα κοινοποιήθηκαν ✓';

  @override
  String queuePending(String items) {
    return 'Απομένουν για κοινοποίηση: $items';
  }

  @override
  String queuePendingBoth(String photos, String videos) {
    return 'Απομένουν για κοινοποίηση: $photos και $videos';
  }

  @override
  String get retryUpload => 'Δοκίμασε ξανά';

  @override
  String get removeFromQueue => 'Αφαίρεση από την ουρά';

  @override
  String get queueStatusWifi => 'Wi-Fi';

  @override
  String get queueStatusWaiting => 'σε αναμονή';

  @override
  String get videosWifiOnlyTitle => 'Βίντεο μόνο μέσω Wi-Fi';

  @override
  String get videosWifiOnlySubtitle => 'Εξοικονομεί δεδομένα κινητής';

  @override
  String get retryNow => 'Δοκίμασε τώρα';

  @override
  String get yourName => 'Το όνομά σου';

  @override
  String get settings => 'Ρυθμίσεις';

  @override
  String get tapToChangeName => 'Πάτα για να αλλάξεις το όνομά σου';

  @override
  String get getCamTripPro => 'Απόκτησε CamTrip Pro';

  @override
  String get photos => 'Φωτογραφίες';

  @override
  String get saveOwnPhotos =>
      'Αποθήκευση των φωτογραφιών μου σε άλμπουμ ανά ομάδα';

  @override
  String get autoSaveOthers => 'Αυτόματη αποθήκευση φωτογραφιών των άλλων';

  @override
  String get wifiOnlyTitle => 'Μεταφόρτωση μόνο μέσω Wi-Fi';

  @override
  String get dateStamp => 'Σφραγίδα ημερομηνίας';

  @override
  String get notifications => 'Ειδοποιήσεις';

  @override
  String get notifyNewPhotos => 'Νέες φωτογραφίες (συγκεντρωτικά)';

  @override
  String get notifyRecapReady => 'Η ανασκόπηση είναι έτοιμη';

  @override
  String get camTripTeam => 'Ομάδα CamTrip';

  @override
  String get adminEntrySubtitle =>
      'Χρήστες, παροχή Pro, αναφορές και στατιστικά';

  @override
  String get account => 'Λογαριασμός';

  @override
  String get manageSubscription => 'Διαχείριση συνδρομής';

  @override
  String get blockedPeople => 'Αποκλεισμένα άτομα';

  @override
  String get nobody => 'Κανένας';

  @override
  String peopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count άτομα',
      one: '1 άτομο',
    );
    return '$_temp0';
  }

  @override
  String get privacyPolicy => 'Πολιτική απορρήτου';

  @override
  String get contact => 'Επικοινωνία';

  @override
  String get signOut => 'Αποσύνδεση';

  @override
  String get deleteAccount => 'Διαγραφή λογαριασμού';

  @override
  String get deleteAccountSubtitle =>
      'Διαγράφει τον λογαριασμό σου και όλες τις φωτογραφίες σου';

  @override
  String get deleteAccountTitle => 'Διαγραφή λογαριασμού;';

  @override
  String get deleteAccountMessage =>
      'Ο λογαριασμός σου και όλες οι φωτογραφίες και τα βίντεό σου θα διαγραφούν, και από τις ομάδες. Ακύρωσε τυχόν ενεργή συνδρομή στο App Store ή στο Google Play.';

  @override
  String get blockedTitle => 'Αποκλεισμένοι';

  @override
  String get blockedSubtitle => 'Δεν βλέπεις φωτογραφίες από αυτά τα άτομα.';

  @override
  String get blockedNone => 'Δεν έχεις αποκλείσει κανέναν.';

  @override
  String get unblockShort => 'Άρση';

  @override
  String get groupGone => 'Αυτή η ομάδα δεν υπάρχει πια ή δεν είσαι πια μέλος.';

  @override
  String photosSavedToAlbum(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count φωτογραφίες αποθηκεύτηκαν στο «$album»',
      one: '1 φωτογραφία αποθηκεύτηκε στο «$album»',
    );
    return '$_temp0';
  }

  @override
  String photosDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count φωτογραφίες διαγράφηκαν',
      one: '1 φωτογραφία διαγράφηκε',
    );
    return '$_temp0';
  }

  @override
  String photosDeletedSkipped(int count, int skipped) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count φωτογραφίες διαγράφηκαν',
      one: '1 φωτογραφία διαγράφηκε',
    );
    return '$_temp0, $skipped παραλείφθηκαν';
  }

  @override
  String photosHiddenForYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count φωτογραφίες κρύφτηκαν για σένα',
      one: '1 φωτογραφία κρύφτηκε για σένα',
    );
    return '$_temp0';
  }

  @override
  String get addedToFavorites => 'Προστέθηκε στα αγαπημένα';

  @override
  String get removedFromFavorites => 'Αφαιρέθηκε από τα αγαπημένα';

  @override
  String get photoAccessSettings =>
      'Δώσε στο CamTrip πρόσβαση στις φωτογραφίες σου στις Ρυθμίσεις';

  @override
  String photosBeingAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Προστίθενται $count φωτογραφίες',
      one: 'Προστίθεται 1 φωτογραφία',
    );
    return '$_temp0';
  }

  @override
  String photosUnreadable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count φωτογραφίες δεν διαβάστηκαν',
      one: '1 φωτογραφία δεν διαβάστηκε',
    );
    return '$_temp0';
  }

  @override
  String get groupNotLoaded => 'Η ομάδα δεν φορτώθηκε';

  @override
  String get noFavoritesTitle => 'Δεν υπάρχουν ακόμα αγαπημένα';

  @override
  String get noPhotosTitle => 'Δεν υπάρχουν ακόμα φωτογραφίες';

  @override
  String get noFavoritesMessage =>
      'Πάτα το αστέρι σε μια φωτογραφία για να μπει εδώ.';

  @override
  String get noPhotosMessage =>
      'Τράβα την πρώτη φωτογραφία. Όλοι στην ομάδα τη βλέπουν αμέσως.';

  @override
  String get openCamera => 'Άνοιγμα κάμερας';

  @override
  String savingProgress(int done, int total) {
    return 'Αποθήκευση... $done/$total';
  }

  @override
  String get sharePreparing => 'Προετοιμασία...';

  @override
  String sharingProgress(int done, int total) {
    return 'Προετοιμασία... $done/$total';
  }

  @override
  String get choosePhotos => 'Επιλογή φωτογραφιών';

  @override
  String selectedCount(int count) {
    return 'Επιλέχθηκαν $count';
  }

  @override
  String get selectNone => 'Καμία επιλογή';

  @override
  String get selectAll => 'Επιλογή όλων';

  @override
  String photosWaitingToShare(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count φωτογραφίες περιμένουν να κοινοποιηθούν',
      one: '1 φωτογραφία περιμένει να κοινοποιηθεί',
    );
    return '$_temp0';
  }

  @override
  String get recapReadyTitle => 'Η ανασκόπησή σου είναι έτοιμη';

  @override
  String get recapReadySubtitle => 'Ένα βίντεο με μουσική από το ταξίδι σου';

  @override
  String get watch => 'Δες';

  @override
  String get makeRecapNow => 'Φτιάξε βίντεο ανασκόπησης τώρα';

  @override
  String freeGroupDeleteNotice(String date) {
    return 'Δωρεάν ομάδα: οι φωτογραφίες μένουν έως $date. Αποθήκευσέ τες ή απόκτησε Pro.';
  }

  @override
  String get filterAll => 'Όλες';

  @override
  String get filterFavorites => 'Αγαπημένα';

  @override
  String get filterPerPerson => 'Ανά άτομο';

  @override
  String get filterPerson => 'Άτομο';

  @override
  String get select => 'Επιλογή';

  @override
  String get hiddenFilter => 'Κρυφές';

  @override
  String get photosBy => 'Φωτογραφίες από...';

  @override
  String get uploadedTag => 'ανέβηκε';

  @override
  String get saveAll => 'Αποθήκευση όλων';

  @override
  String get favorite => 'Αγαπημένο';

  @override
  String get unfavorite => 'Αφαίρεση από αγαπημένα';

  @override
  String get hide => 'Απόκρυψη';

  @override
  String get delete => 'Διαγραφή';

  @override
  String deletePhotosTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Διαγραφή $count φωτογραφιών;',
      one: 'Διαγραφή φωτογραφίας;',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Εξαφανίζονται για όλους στην ομάδα. Αυτό δεν αναιρείται.',
      one: 'Εξαφανίζεται για όλους στην ομάδα. Αυτό δεν αναιρείται.',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosNotAllowed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count φωτογραφίες ανήκουν σε κάποιον άλλο. Μένουν· μόνο ένας διαχειριστής μπορεί να τις διαγράψει.',
      one:
          '1 φωτογραφία ανήκει σε κάποιον άλλο. Μένει· μόνο ένας διαχειριστής μπορεί να τη διαγράψει.',
    );
    return '$_temp0';
  }

  @override
  String photosBackInGroup(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count φωτογραφίες είναι ξανά στην ομάδα',
      one: '1 φωτογραφία είναι ξανά στην ομάδα',
    );
    return '$_temp0';
  }

  @override
  String get showAll => 'Εμφάνιση όλων';

  @override
  String get hiddenPhotosExplainer =>
      'Μόνο εσύ δεν βλέπεις πια αυτές τις φωτογραφίες. Για τους άλλους στην ομάδα είναι ακόμα εκεί.';

  @override
  String get nothingHidden => 'Τίποτα κρυφό';

  @override
  String get nothingHiddenMessage =>
      'Οι φωτογραφίες που κρύβεις θα εμφανίζονται εδώ.';

  @override
  String showAgainCount(int count) {
    return 'Εμφάνιση ξανά ($count)';
  }

  @override
  String get someone => 'Κάποιος';

  @override
  String get savedToAlbum => 'Αποθηκεύτηκε στο άλμπουμ φωτογραφιών σου';

  @override
  String get share => 'Κοινοποίηση';

  @override
  String get shareFailed => 'Η κοινοποίηση δεν πέτυχε';

  @override
  String get reportTitle => 'Γιατί αναφέρεις αυτή τη φωτογραφία;';

  @override
  String get reportSubtitle =>
      'Ελέγχουμε κάθε αναφορά μέσα σε 24 ώρες. Η φωτογραφία κρύβεται αμέσως για σένα.';

  @override
  String get reportThanks => 'Ευχαριστούμε, θα το εξετάσουμε';

  @override
  String blockMessageAllGroups(String name) {
    return 'Δεν θα βλέπεις πια φωτογραφίες και βίντεο από $name σε καμία ομάδα ούτε θα λαμβάνεις ειδοποιήσεις γι\' αυτά. Μπορείς να το αναιρέσεις στις Ρυθμίσεις.';
  }

  @override
  String userBlocked(String name) {
    return '$name: αποκλείστηκε';
  }

  @override
  String get videoHiddenForYou => 'Το βίντεο κρύφτηκε για σένα';

  @override
  String get photoHiddenForYou => 'Η φωτογραφία κρύφτηκε για σένα';

  @override
  String get setAsCover => 'Ορισμός ως εξώφυλλο';

  @override
  String get coverUpdated => 'Το εξώφυλλο ενημερώθηκε';

  @override
  String get hideForMe => 'Απόκρυψη για μένα';

  @override
  String get hideForMeSubtitle => 'Οι άλλοι στην ομάδα τη βλέπουν ακόμα';

  @override
  String get reportPhoto => 'Αναφορά φωτογραφίας';

  @override
  String blockName(String name) {
    return 'Αποκλεισμός $name';
  }

  @override
  String get forEveryoneInGroup => 'Για όλους στην ομάδα';

  @override
  String get videoDeleted => 'Το βίντεο διαγράφηκε';

  @override
  String get photoDeleted => 'Η φωτογραφία διαγράφηκε';

  @override
  String get photoAccessToSave =>
      'Δώσε στο CamTrip πρόσβαση στις φωτογραφίες σου στις Ρυθμίσεις για να τις αποθηκεύεις';

  @override
  String get phoneFull => 'Το κινητό σου είναι γεμάτο';

  @override
  String get albumSaveFailedShort => 'Η αποθήκευση στο άλμπουμ δεν πέτυχε';

  @override
  String get recapTemplateGoldenHour => 'Χρυσή ώρα';

  @override
  String get recapTemplateFast => 'Γρήγορο';

  @override
  String get recapTemplateFilmRoll => 'Ρολό φιλμ';

  @override
  String get recapTemplatePolaroid => 'Polaroid';

  @override
  String get trackSummerEvening => 'Καλοκαιρινό βράδυ';

  @override
  String get trackGoldenHour => 'Χρυσή ώρα';

  @override
  String get trackRoadtrip => 'Οδικό ταξίδι';

  @override
  String get moodWarm => 'ζεστό';

  @override
  String get moodCheerful => 'κεφάτο';

  @override
  String friendsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count φίλοι',
      one: '1 φίλος',
    );
    return '$_temp0';
  }

  @override
  String get madeWithCamTrip => 'Φτιαγμένο με CamTrip';

  @override
  String get tagline => 'Ένα φιλμ για όλη την παρέα';

  @override
  String get videoUnsupportedDevice =>
      'Η δημιουργία βίντεο δεν πέτυχε σε αυτή τη συσκευή';

  @override
  String get groupLoadFailed => 'Αυτή η ομάδα δεν φορτώθηκε.';

  @override
  String recapNeedsPhotos(int count) {
    return 'Χρειάζεσαι τουλάχιστον $count φωτογραφίες για ανασκόπηση.';
  }

  @override
  String get recapFailed =>
      'Η δημιουργία της ανασκόπησης δεν πέτυχε. Δοκίμασε ξανά.';

  @override
  String get recapSaved =>
      'Η ανασκόπηση αποθηκεύτηκε στο άλμπουμ φωτογραφιών σου';

  @override
  String get recap => 'Ανασκόπηση';

  @override
  String get recapRendering => 'Δημιουργία ανασκόπησης...';

  @override
  String get videoRendering => 'Δημιουργία βίντεο...';

  @override
  String get template => 'Πρότυπο';

  @override
  String get musicLicense => 'Δική μας μουσική CamTrip · χωρίς δικαιώματα';

  @override
  String get change => 'Αλλαγή';

  @override
  String get noWatermark => 'Χωρίς υδατογράφημα ✓';

  @override
  String get removeWatermarkPro => 'Αφαίρεσε το υδατογράφημα με Pro';

  @override
  String get proSourceSubscription => 'Συνδρομή';

  @override
  String get proSourceGift => 'Δώρο';

  @override
  String get proSourceAdmin => 'Διαχειριστής';

  @override
  String get proSourceGroup => 'Μέσω ομάδας';

  @override
  String get noPro => 'Χωρίς Pro';

  @override
  String proStatusNoEnd(String source) {
    return 'Pro ($source), χωρίς λήξη';
  }

  @override
  String proStatusUntil(String source, String date) {
    return 'Pro ($source), έως $date';
  }

  @override
  String get lifetime => 'Εφ\' όρου ζωής';

  @override
  String get pickDate => 'Επίλεξε ημερομηνία';

  @override
  String get noAccess => 'Χωρίς πρόσβαση';

  @override
  String get adminOnlyTeam =>
      'Η διαχείριση είναι μόνο για την ομάδα του CamTrip.';

  @override
  String get adminOverview => 'Επισκόπηση';

  @override
  String get adminUsers => 'Χρήστες';

  @override
  String get adminReports => 'Αναφορές';

  @override
  String adminsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count διαχειριστές',
      one: '1 διαχειριστής',
    );
    return '$_temp0';
  }

  @override
  String get adminNewThisWeek => 'Νέοι αυτή την εβδομάδα';

  @override
  String get adminGroups => 'Ομάδες';

  @override
  String get adminProSubscription => 'Pro με συνδρομή';

  @override
  String get adminProGift => 'Pro ως δώρο';

  @override
  String adminWithoutSubscription(int count) {
    return '$count χωρίς συνδρομή';
  }

  @override
  String get adminOpenReports => 'Ανοιχτές αναφορές';

  @override
  String get adminSearchHint => 'Αναζήτηση με όνομα ή email';

  @override
  String get nobodyFound => 'Δεν βρέθηκε κανείς';

  @override
  String get loadMore => 'Φόρτωσε περισσότερα';

  @override
  String get noEmail => 'Χωρίς email';

  @override
  String adminDeletePhotoMessage(String groupName) {
    return 'Η φωτογραφία εξαφανίζεται για όλους στο «$groupName». Όλες οι αναφορές γι\' αυτή τη φωτογραφία κλείνουν.';
  }

  @override
  String get adminBanMessage =>
      'Αυτός ο λογαριασμός δεν μπορεί πια να συνδεθεί ή να χρησιμοποιήσει την εφαρμογή. Μπορείς να το αναιρέσεις αργότερα.';

  @override
  String get adminDismissTitle => 'Απόρριψη αναφοράς;';

  @override
  String get adminDismissMessage =>
      'Η φωτογραφία μένει. Η αναφορά σημειώνεται ως κλεισμένη.';

  @override
  String get adminDismiss => 'Απόρριψη';

  @override
  String get adminAccountBlocked => 'Ο λογαριασμός αποκλείστηκε';

  @override
  String get adminReportDismissed => 'Η αναφορά απορρίφθηκε';

  @override
  String get adminNoReports => 'Δεν υπάρχουν ανοιχτές αναφορές';

  @override
  String get adminNoReportsMessage =>
      'Οι φωτογραφίες που αναφέρονται εμφανίζονται εδώ.';

  @override
  String get deletedTag => 'Διαγράφηκε';

  @override
  String adminReportedBy(String name) {
    return 'Από $name';
  }

  @override
  String adminPhotoBy(String name) {
    return 'Φωτογραφία από $name';
  }

  @override
  String reportsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count αναφορές',
      one: '1 αναφορά',
    );
    return '$_temp0';
  }

  @override
  String get adminDeletePhoto => 'Διαγραφή φωτογραφίας';

  @override
  String get adminBlockCreator => 'Αποκλεισμός δημιουργού';

  @override
  String get loadFailed => 'Η φόρτωση δεν πέτυχε';

  @override
  String get adminLifetimeProGiven => 'Δόθηκε Pro εφ\' όρου ζωής';

  @override
  String get adminProGiven => 'Δόθηκε Pro';

  @override
  String adminGiveProUntil(String date) {
    return 'Δώσε Pro έως $date';
  }

  @override
  String get adminGiveProLifetime => 'Δώσε Pro εφ\' όρου ζωής';

  @override
  String adminGiveProFor(String period) {
    return 'Δώσε Pro για $period';
  }

  @override
  String get adminReasonHint => 'Λόγος, π.χ. φίλος, δοκιμαστής, influencer';

  @override
  String get adminGivePro => 'Δώσε Pro';

  @override
  String get adminRevokeTitle => 'Ανάκληση δώρου;';

  @override
  String get adminRevokeMessage =>
      'Το Pro δώρο σταματά αμέσως. Η δική τους συνδρομή συνεχίζεται.';

  @override
  String get adminRevoke => 'Ανάκληση';

  @override
  String get adminGiftRevoked => 'Το δώρο ανακλήθηκε';

  @override
  String get adminUnbanTitle => 'Άρση αποκλεισμού;';

  @override
  String adminUnbanMessage(String name) {
    return '$name μπορεί να συνδεθεί ξανά.';
  }

  @override
  String get adminUnbanned => 'Ο αποκλεισμός άρθηκε';

  @override
  String get adminBanUserMessage =>
      'Αυτός ο λογαριασμός δεν μπορεί πια να συνδεθεί ή να χρησιμοποιήσει την εφαρμογή. Οι φωτογραφίες μένουν.';

  @override
  String get adminUser => 'Χρήστης';

  @override
  String get adminNotVerified => 'μη επαληθευμένο';

  @override
  String get adminRole => 'Ρόλος';

  @override
  String get adminCreated => 'Δημιουργήθηκε';

  @override
  String get unknown => 'Άγνωστο';

  @override
  String get adminSignInWith => 'Συνδέεται με';

  @override
  String get adminEmailMethod => 'Email';

  @override
  String get adminPhotosAndVideos => 'Φωτογραφίες και βίντεο';

  @override
  String get adminStatus => 'Κατάσταση';

  @override
  String get adminActive => 'Ενεργό';

  @override
  String adminActiveUntil(String date) {
    return 'Ενεργό έως $date';
  }

  @override
  String adminGiftFrom(String name) {
    return 'Δώρο από $name';
  }

  @override
  String adminExpiredOn(String date) {
    return 'Έληξε στις $date';
  }

  @override
  String get adminExpired => 'Έληξε';

  @override
  String adminUntil(String date) {
    return 'Έως $date';
  }

  @override
  String get adminGiveProTitle => 'Δώσε Pro';

  @override
  String get adminGiveProNote =>
      'Ισχύει και για τις ομάδες αυτού του ατόμου: ένα Pro στην ομάδα = Pro για όλους σε αυτή την ομάδα.';

  @override
  String get adminRevokeGift => 'Ανάκληση δώρου';

  @override
  String get adminModeration => 'Εποπτεία';

  @override
  String get adminCannotBanSelf => 'Δεν μπορείς να αποκλείσεις τον εαυτό σου.';

  @override
  String get adminCannotBanAdmin =>
      'Ένας διαχειριστής δεν μπορεί να αποκλειστεί.';

  @override
  String get adminUnban => 'Άρση αποκλεισμού';

  @override
  String get adminBanAccount => 'Αποκλεισμός λογαριασμού';

  @override
  String get googleSignInUnavailable =>
      'Η σύνδεση με Google δεν είναι ακόμα διαθέσιμη';

  @override
  String get cameraPickerTitle => 'Διάλεξε κάμερα';

  @override
  String get cameraPickerSubtitle =>
      'Κάθε κάμερα δίνει στις φωτογραφίες σου το δικό της ύφος';

  @override
  String get cameraPickerChange => 'Αλλαγή κάμερας';

  @override
  String get cameraPickerUnlock => 'Ξεκλείδωμα με Pro';

  @override
  String get cameraPickerSelected => 'Επιλεγμένη';

  @override
  String get cameraPickerStyleSummer => 'Καλοκαίρι';

  @override
  String get cameraPickerStyleSummerDescription =>
      'Ζεστά, ξεθωριασμένα χρώματα σαν στιγμιότυπο των 90s';

  @override
  String get cameraPickerStyleNight => 'Νύχτα 800';

  @override
  String get cameraPickerStyleNightDescription =>
      'Κινηματογραφικό φιλμ: γαλαζοπράσινες σκιές, ζεστό φως, πολύς κόκκος';

  @override
  String get cameraPickerStyleSepia => 'Σέπια';

  @override
  String get cameraPickerStyleSepiaDescription =>
      'Μια παλιά καφετιά εκτύπωση από το κουτί παπουτσιών';

  @override
  String get cameraPickerStyleLomo => 'Lomo';

  @override
  String get cameraPickerStyleLomoDescription =>
      'Έντονα χρώματα, σκοτεινές γωνίες και μια τρελή χρωματική απόχρωση';

  @override
  String get cameraPickerStyleMint => 'Μέντα';

  @override
  String get cameraPickerStyleMintDescription =>
      'Απαλό και φρέσκο με πράσινη απόχρωση';

  @override
  String get cameraPickerStylePastel => 'Ροζ';

  @override
  String get cameraPickerStylePastelDescription =>
      'Παστέλ χρώματα με ροζ λάμψη και λευκό περίγραμμα';

  @override
  String get cameraPickerStyleSuper8 => 'Super 8';

  @override
  String get cameraPickerStyleSuper8Description =>
      'Με κόκκο και απαλό, σαν παλιά οικογενειακή ταινία';

  @override
  String get paywallBenefitGroup => 'Ένα Pro = Pro για όλη την ομάδα';

  @override
  String get paywallBenefitUnlimited =>
      'Απεριόριστα μέλη, οι φωτογραφίες μένουν για πάντα';

  @override
  String get paywallBenefitQuality => 'Χωρίς υδατογράφημα, αρχική ποιότητα';

  @override
  String paywallFreeTrial(String period) {
    return '$period δωρεάν';
  }

  @override
  String paywallPriceYear(String price) {
    return '$price τον χρόνο.';
  }

  @override
  String paywallPriceYearTrial(String period, String price) {
    return '$period δωρεάν, μετά $price τον χρόνο.';
  }

  @override
  String paywallPriceMonth(String price) {
    return '$price τον μήνα.';
  }

  @override
  String paywallPriceMonthTrial(String period, String price) {
    return '$period δωρεάν, μετά $price τον μήνα.';
  }

  @override
  String paywallAutoRenew(String store) {
    return 'Ανανεώνεται αυτόματα. Ακύρωσε τουλάχιστον 24 ώρες πριν από την ανανέωση στο $store.';
  }

  @override
  String get paywallDetailsTitle => 'Όλα στο Pro';

  @override
  String get paywallBenefitStyles => 'Όλα τα στιλ κάμερας';

  @override
  String get allPhotosTitle => 'Όλες οι φωτογραφίες';

  @override
  String get homeTabAlbums => 'Άλμπουμ';

  @override
  String get allPhotosEmptyTitle => 'Δεν υπάρχουν ακόμα φωτογραφίες';

  @override
  String get allPhotosEmptyMessage =>
      'Άνοιξε την κάμερα και τράβα την πρώτη σου φωτογραφία.';

  @override
  String get allPhotosLoadFailed => 'Οι φωτογραφίες σου δεν φορτώθηκαν';

  @override
  String get cameraSettingsTitle => 'Ρυθμίσεις κάμερας';

  @override
  String get cameraSettingsMore => 'Περισσότερες ρυθμίσεις';

  @override
  String get cameraSettingsGrid => 'Πλέγμα';

  @override
  String get cameraSettingsHaptics => 'Δόνηση κατά τη λήψη';

  @override
  String get cameraSettingsDateStamp => 'Ημερομηνία κάτω δεξιά';

  @override
  String get cameraSettingsSound => 'Ήχος κλείστρου';

  @override
  String get cameraSettingsSoundHint =>
      'Αθόρυβα όταν το κινητό είναι στο αθόρυβο';

  @override
  String get cameraSettingsTimer => 'Χρονοδιακόπτης';

  @override
  String get cameraSettingsTimerOff => 'Όχι';

  @override
  String cameraSettingsTimerSeconds(int seconds) {
    return '$seconds δ';
  }

  @override
  String get cameraSettingsTimerCancelHint => 'Πάτα το κλείστρο για ακύρωση';

  @override
  String get cameraSettingsMirror => 'Καθρέφτισμα selfie';

  @override
  String get cameraSettingsSaveToRoll => 'Αποθήκευση στο άλμπουμ κάμερας';

  @override
  String get cameraSettingsQuality => 'Ποιότητα';

  @override
  String get cameraSettingsQualityStandard => 'Τυπική';

  @override
  String get cameraSettingsQualityHigh => 'Υψηλή';

  @override
  String get cameraLowLightHint => 'Λίγο φως - άναψε το φλας';

  @override
  String get cameraFlashUnavailable => 'Αυτή η κάμερα δεν έχει φλας';

  @override
  String get cameraFlashScreen => 'Φλας οθόνης';

  @override
  String get cameraFlashCycleHint =>
      'Πάτα για εναλλαγή μεταξύ όχι, ναι και αυτόματο';

  @override
  String get cameraFlip => 'Εναλλαγή μπροστινής και πίσω κάμερας';

  @override
  String get cameraFlipHint =>
      'Πάτα δύο φορές το σκόπευτρο για να γυρίσεις την κάμερα';

  @override
  String cameraPickerPaywallStyles(int count, String styles) {
    return 'Και οι $count κάμερες, μαζί με $styles';
  }

  @override
  String get styleFlash => 'Φλας 400';

  @override
  String get styleFlashDescription =>
      'Άμεσο φλας σε ζεστό φιλμ: κεχριμπαρένια λάμψη, κόκκος, πλούσια κόκκινα';

  @override
  String cameraTimerButton(String state) {
    return 'Χρονοδιακόπτης: $state';
  }

  @override
  String get cameraTimerCycleHint =>
      'Πάτα για εναλλαγή μεταξύ όχι, 3 δ και 10 δ';

  @override
  String get cameraLastShotOpen => 'Τελευταία φωτογραφία, ανοίγει το άλμπουμ';

  @override
  String get cameraLastShotEmpty =>
      'Δεν υπάρχουν ακόμα φωτογραφίες, ανοίγει το άλμπουμ';

  @override
  String get deleteOnlyOwnOrAdmin =>
      'Μόνο αυτός που την τράβηξε ή ένας διαχειριστής μπορεί να τη διαγράψει';

  @override
  String get videoPlay => 'Αναπαραγωγή';

  @override
  String get videoPause => 'Παύση';

  @override
  String get language => 'Γλώσσα';

  @override
  String get languageSystem => 'Γλώσσα συστήματος';

  @override
  String languageSystemCurrent(String language) {
    return 'Σύστημα ($language)';
  }

  @override
  String get languageSearchHint => 'Αναζήτηση γλώσσας';

  @override
  String get languageNoResults => 'Δεν βρέθηκε γλώσσα';

  @override
  String get personalRollTitle => 'Το φιλμ μου';

  @override
  String get personalRollSubtitle => 'Μόνο για σένα';

  @override
  String get personalRollPickerSubtitle =>
      'Μεμονωμένες φωτογραφίες, μόνο για σένα';

  @override
  String get personalRollMove => 'Σε άλμπουμ';

  @override
  String get personalRollMoveTitle => 'Μετακίνηση σε άλμπουμ';

  @override
  String get personalRollMoveNoAlbums =>
      'Δημιούργησε πρώτα ένα άλμπουμ ή μπες σε ένα με κωδικό.';

  @override
  String personalRollMoved(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count φωτογραφίες μετακινήθηκαν στο $album',
      one: '1 φωτογραφία μετακινήθηκε στο $album',
    );
    return '$_temp0';
  }

  @override
  String get personalRollPrivateNote =>
      'Μόνο εσύ βλέπεις αυτές τις φωτογραφίες. Μετακίνησέ τες σε άλμπουμ για να τις μοιραστείς.';

  @override
  String get paywallTripPassSub => 'Μόνο αυτό το ταξίδι, για όλη την ομάδα';

  @override
  String get paywallOneTime => 'εφάπαξ';

  @override
  String get paywallBestValue => 'Καλύτερη τιμή';

  @override
  String paywallRollFullTitle(int used, int limit) {
    return 'Το φιλμ σου γέμισε - $used/$limit φωτογραφίες';
  }

  @override
  String get paywallRollFullSub => 'Συνέχισε με Trip Pass ή Pro.';

  @override
  String get paywallCameraTitle => 'Αυτή η κάμερα ανήκει στο Pro';

  @override
  String paywallCameraSub(int count) {
    return 'Ξεκλείδωσε και τις $count κάμερες.';
  }

  @override
  String get paywallWatermarkTitle => 'Recap χωρίς υδατογράφημα';

  @override
  String get paywallWatermarkSub =>
      'Μοιράσου το recap χωρίς το λογότυπο CamTrip.';

  @override
  String get paywallDeletionTitle => 'Κράτα το ταξίδι σου';

  @override
  String paywallDeletionSub(String date) {
    return 'Τα δωρεάν ταξίδια διαγράφονται στις $date. Με Trip Pass ή Pro μένει για πάντα.';
  }

  @override
  String paywallTripPassTerms(String price) {
    return 'Εφάπαξ αγορά $price για αυτό το ταξίδι. Όχι συνδρομή.';
  }

  @override
  String get buyTripPass => 'Αγόρασε Trip Pass';

  @override
  String get tripPassActive =>
      'Το Trip Pass είναι ενεργό: το ταξίδι είναι Pro για όλους';

  @override
  String get tripPassActivating =>
      'Η πληρωμή ελήφθη. Το Trip Pass ενεργοποιείται σε λίγο.';

  @override
  String proViaTripPass(String name) {
    return 'Trip Pass από $name';
  }

  @override
  String rollCounterSemantics(int used, int limit) {
    return '$used από $limit λήψεις στο φιλμ σου';
  }

  @override
  String rollHeldTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count φωτογραφίες δεν χωράνε στο φιλμ',
      one: '1 φωτογραφία δεν χωράει στο φιλμ',
    );
    return '$_temp0';
  }

  @override
  String get rollHeldBody => 'Κράτα τες με Pro ή Trip Pass';

  @override
  String deletionBannerTitle(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Κράτα το ταξίδι σου - μένουν $days μέρες',
      one: 'Κράτα το ταξίδι σου - μένει 1 μέρα',
    );
    return '$_temp0';
  }

  @override
  String get deletionBannerBody =>
      'Τα δωρεάν ταξίδια διαγράφονται 30 μέρες μετά το τέλος. Με Trip Pass ή Pro μένει για πάντα.';

  @override
  String apiRollFull(int limit) {
    return 'Το φιλμ σου γέμισε ($limit λήψεις). Πάρε Trip Pass ή Pro για να συνεχίσεις.';
  }

  @override
  String get apiTripPassFailed =>
      'Δεν ήταν δυνατή η ενεργοποίηση του Trip Pass. Γράψε στο support@camtrip.app.';

  @override
  String get apiTripPassExists => 'Αυτό το ταξίδι έχει ήδη Trip Pass.';

  @override
  String get tripPassUnavailable =>
      'Το Trip Pass δεν είναι διαθέσιμο τώρα. Δοκίμασε αργότερα.';

  @override
  String get tripMapTitle => 'Χάρτης ταξιδιού';

  @override
  String get tripMapOpen => 'Χάρτης και στατιστικά';

  @override
  String get tripMapLoadFailed => 'Δεν ήταν δυνατή η φόρτωση του χάρτη';

  @override
  String get tripMapStatDays => 'Ημέρες';

  @override
  String get tripMapStatPhotos => 'Φωτογραφίες';

  @override
  String get tripMapStatVideos => 'Βίντεο';

  @override
  String get tripMapStatMembers => 'Μέλη';

  @override
  String get tripMapStatDistance => 'χλμ διαδρομή';

  @override
  String get tripMapStatCountries => 'Χώρες';

  @override
  String get tripMapStatPlaces => 'Μέρη';

  @override
  String tripMapBusiestDay(String day, int count) {
    return 'Περισσότερες φωτογραφίες: $day ($count)';
  }

  @override
  String tripMapTopPhotographer(String name, int count) {
    return 'Κορυφαίος φωτογράφος: $name ($count)';
  }

  @override
  String get tripMapOffTitle => 'Ο χάρτης ταξιδιού είναι απενεργοποιημένος';

  @override
  String get tripMapOffMessage =>
      'Ένας διαχειριστής μπορεί να ενεργοποιήσει τον χάρτη στις ρυθμίσεις της ομάδας. Τα στατιστικά τα βλέπεις πάντα.';

  @override
  String get tripMapOffMessageAdmin =>
      'Ενεργοποίησε τον χάρτη για να δείτε πού τραβήχτηκαν οι φωτογραφίες σας. Ο καθένας αποφασίζει αν θα συμμετέχει.';

  @override
  String get tripMapEnable => 'Ενεργοποίηση χάρτη';

  @override
  String get tripMapEmptyTitle => 'Δεν υπάρχουν ακόμα μέρη στον χάρτη';

  @override
  String get tripMapEmptyMessage =>
      'Οι νέες φωτογραφίες των μελών που μοιράζονται την τοποθεσία τους εμφανίζονται εδώ, στρογγυλεμένες στα περίπου 100 μ.';

  @override
  String get tripMapConsentTitle => 'Χάρτης ταξιδιού';

  @override
  String get tripMapConsentQuestion =>
      'Να φαίνεται στον χάρτη αυτής της ομάδας πού τράβηξες τις φωτογραφίες σου;';

  @override
  String get tripMapConsentDetail =>
      'Το βλέπουν μόνο τα μέλη της ομάδας, στρογγυλεμένο στα περίπου 100 μ. Η τοποθεσία δεν μπαίνει ποτέ μέσα στη φωτογραφία και μπορείς να το απενεργοποιήσεις όποτε θέλεις στις ρυθμίσεις της ομάδας.';

  @override
  String get tripMapConsentYes => 'Ναι, κοινοποίηση';

  @override
  String get tripMapConsentNo => 'Όχι';

  @override
  String get tripMapLocationDenied =>
      'Δεν υπάρχει πρόσβαση στην τοποθεσία σου. Μπορείς να την επιτρέψεις στις ρυθμίσεις του τηλεφώνου.';

  @override
  String get tripMapSettingSubtitle =>
      'Δείχνει σε χάρτη πού τραβήχτηκαν οι φωτογραφίες. Τα μέλη αποφασίζουν μόνα τους αν θα μοιραστούν.';

  @override
  String get tripMapDisableTitle => 'Απενεργοποίηση του χάρτη;';

  @override
  String get tripMapDisableMessage =>
      'Όλες οι τοποθεσίες της ομάδας θα διαγραφούν. Αν ενεργοποιήσεις ξανά τον χάρτη, θα ρωτήσουμε ξανά όλους.';

  @override
  String get tripMapDisable => 'Απενεργοποίηση';

  @override
  String get tripMapMySharing => 'Κοινοποίηση της τοποθεσίας μου';

  @override
  String get tripMapMySharingOn =>
      'Οι νέες σου φωτογραφίες εμφανίζονται στον χάρτη (στρογγυλεμένες στα περίπου 100 μ.).';

  @override
  String get tripMapMySharingOff =>
      'Ανενεργό. Οι φωτογραφίες σου δεν εμφανίζονται στον χάρτη.';

  @override
  String get tripMapStopSharingTitle => 'Διακοπή κοινοποίησης τοποθεσίας;';

  @override
  String get tripMapStopSharingMessage =>
      'Οι τοποθεσίες όλων των φωτογραφιών σου σε αυτή την ομάδα θα διαγραφούν.';

  @override
  String get tripMapStopSharing => 'Διακοπή κοινοποίησης';
}
