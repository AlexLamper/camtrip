// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get cancel => 'ביטול';

  @override
  String get yes => 'כן';

  @override
  String inviteMessageIntro(String groupName) {
    return 'מצטרפים ל\"$groupName\" ב-CamTrip? ככה נראה מיד את התמונות של כולם.';
  }

  @override
  String inviteMessageCode(String code) {
    return 'או להזין את הקוד: $code';
  }

  @override
  String get memberFallbackName => 'חבר';

  @override
  String get reportReasonInappropriate => 'לא הולם או פוגעני';

  @override
  String get reportReasonSpam => 'ספאם';

  @override
  String get reportReasonOther => 'משהו אחר';

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
  String get errorOffline => 'אין חיבור. כדאי לנסות שוב בעוד רגע.';

  @override
  String errorSomethingWrongStatus(int status) {
    return 'משהו השתבש ($status)';
  }

  @override
  String get errorSomethingWrong => 'משהו השתבש';

  @override
  String get apiInvalidCredentials => 'כתובת האימייל או הסיסמה שגויים';

  @override
  String get apiInvalidCode => 'הקוד שגוי או שפג תוקפו. אפשר לבקש קוד חדש.';

  @override
  String get apiEmailTaken =>
      'כבר קיים חשבון עם כתובת האימייל הזו. אפשר להתחבר, או לבחור \"שכחת את הסיסמה?\".';

  @override
  String apiEmailTakenProvider(String provider) {
    return 'כבר קיים חשבון עם כתובת האימייל הזו. אפשר להתחבר עם $provider.';
  }

  @override
  String apiWeakPassword(int min) {
    return 'יש לבחור סיסמה עם $min תווים לפחות';
  }

  @override
  String apiNameTooLong(int max) {
    return 'השם יכול להכיל עד $max תווים';
  }

  @override
  String get apiRateLimited =>
      'יותר מדי ניסיונות. אפשר לנסות שוב בעוד 15 דקות.';

  @override
  String apiAccountBanned(String email) {
    return 'החשבון שלך נחסם. אם לדעתך זו טעות, אפשר לפנות אל $email.';
  }

  @override
  String get apiProRequired => 'סגנון המצלמה הזה הוא חלק מ-CamTrip Pro';

  @override
  String get apiGroupClosed => 'הקבוצה הזו נסגרה';

  @override
  String get apiGroupCodeNotFound => 'לא נמצאה קבוצה עם הקוד הזה';

  @override
  String apiGroupFull(int max) {
    return 'הקבוצה מלאה (עד $max חברים). אם לאחד החברים יש CamTrip Pro, כל אחד יכול להצטרף.';
  }

  @override
  String get apiLastMember => 'נשארת החבר האחרון. עדיף למחוק את הקבוצה.';

  @override
  String get apiAdminRequired => 'למנהלי CamTrip בלבד';

  @override
  String get apiUploadIncomplete => 'ההעלאה לא הושלמה';

  @override
  String get apiInvalidInput => 'קלט לא תקין';

  @override
  String get apiNotSignedIn => 'לא מחובר';

  @override
  String get apiAccountGone => 'החשבון הזה כבר לא קיים';

  @override
  String get apiPhotoNotFound => 'התמונה לא נמצאה';

  @override
  String get apiGroupNotFound => 'הקבוצה לא נמצאה';

  @override
  String get apiMemberNotFound => 'החבר לא נמצא';

  @override
  String get apiPersonNotFound => 'האדם לא נמצא';

  @override
  String get apiUserNotFound => 'המשתמש לא נמצא';

  @override
  String get apiAdminOnly => 'רק מנהל יכול לעשות את זה';

  @override
  String get apiCannotBlockSelf => 'אי אפשר לחסום את עצמך';

  @override
  String get apiCannotReportOwn => 'אי אפשר לדווח על תמונה שלך';

  @override
  String get apiDeleteOwnOnly => 'אפשר למחוק רק תמונות שלך';

  @override
  String get apiOwnerCannotBeRemoved => 'אי אפשר להסיר את יוצר הקבוצה';

  @override
  String get apiOwnerStaysAdmin => 'יוצר הקבוצה תמיד נשאר מנהל';

  @override
  String get apiNeedsOneAdmin => 'לקבוצה צריך להיות לפחות מנהל אחד';

  @override
  String get apiEndBeforeStart => 'תאריך הסיום מוקדם מתאריך ההתחלה';

  @override
  String get apiPermanentNoEndDate => 'לקבוצה פתוחה תמיד אין תאריך סיום';

  @override
  String get apiCannotBanAdmin => 'אי אפשר לחסום מנהל מערכת';

  @override
  String get apiReportNotFound => 'הדיווח לא נמצא';

  @override
  String get apiPhotoOwnerUnknown => 'כבר לא ידוע מי צילם את התמונה הזו';

  @override
  String get validationNameRequired => 'יש להזין את השם שלך';

  @override
  String validationMaxChars(int max) {
    return 'עד $max תווים';
  }

  @override
  String get validationEmailRequired => 'יש להזין כתובת אימייל';

  @override
  String get validationEmailInvalid => 'כתובת האימייל הזו לא תקינה';

  @override
  String get validationPasswordRequired => 'יש לבחור סיסמה';

  @override
  String validationMinChars(int min) {
    return '$min תווים לפחות';
  }

  @override
  String get validationPasswordTooLong => 'הסיסמה ארוכה מדי';

  @override
  String get validationPasswordEmpty => 'יש להזין סיסמה';

  @override
  String get validationCodeRequired => 'יש להזין את הקוד מהאימייל';

  @override
  String get validationCodeDigits => 'הקוד כולל 6 ספרות';

  @override
  String get onboarding1Title => 'פילם אחד\nלכל החבורה.';

  @override
  String get onboarding1Body =>
      'מצלמים עם מצלמת רטרו. כולם רואים את התמונות שלך מיד, והן נשמרות גם באלבום שלך.';

  @override
  String get onboarding2Title => 'נגמר הסיפור\nשל שליחת תמונות.';

  @override
  String get onboarding2Body =>
      'יוצרים קבוצה, משתפים את הקוד, וזהו. אף פעם לא עוד \"תשלח לי את התמונות?\"';

  @override
  String get onboarding3Title => 'סרטון סיכום\nאחרי הטיול.';

  @override
  String get onboarding3Body =>
      'CamTrip יוצר סרטון עם מוזיקה מהרגעים הכי טובים שלכם יחד.';

  @override
  String get onboardingInvited => 'הוזמנת! יש להתחבר כדי להצטרף.';

  @override
  String get signInAppleFailed => 'ההתחברות עם Apple לא הצליחה';

  @override
  String get signInGoogleFailed => 'ההתחברות עם Google לא הצליחה';

  @override
  String get signInFailed => 'ההתחברות לא הצליחה';

  @override
  String get next => 'הבא';

  @override
  String get legalPrefix => 'המשך השימוש מהווה הסכמה ל';

  @override
  String get legalTerms => 'תנאים';

  @override
  String get legalAnd => ' ול';

  @override
  String get legalPrivacy => 'מדיניות הפרטיות';

  @override
  String get legalSuffix => '.';

  @override
  String get continueWithApple => 'המשך עם Apple';

  @override
  String get continueWithGoogle => 'המשך עם Google';

  @override
  String get createAccount => 'יצירת חשבון';

  @override
  String get signIn => 'התחברות';

  @override
  String get or => 'או';

  @override
  String get registerSubtitle => 'כדי שהחברים יראו מי צילם את התמונות.';

  @override
  String get loginSubtitle => 'טוב שחזרת.';

  @override
  String get forgotPasswordTitle => 'שכחתי סיסמה';

  @override
  String get forgotPasswordPushSubtitle =>
      'עדיין מחובר במקום אחר? נשלח לשם קוד בן 6 ספרות בהתראה, כדי שאפשר יהיה להגדיר סיסמה חדשה.';

  @override
  String get newPassword => 'סיסמה חדשה';

  @override
  String get resetPushInfo =>
      'אם עדיין מחובר במקום אחר, תגיע לשם התראה עם קוד. לא מצליח להיכנס? אפשר להתחבר עם Apple או Google עם אותה כתובת אימייל - החשבון יקושר.';

  @override
  String get sendCode => 'שליחת קוד';

  @override
  String get savePassword => 'שמירת סיסמה';

  @override
  String get errorTryAgain => 'משהו השתבש. כדאי לנסות שוב.';

  @override
  String get back => 'חזרה';

  @override
  String get name => 'שם';

  @override
  String get email => 'כתובת אימייל';

  @override
  String get codeFromPush => 'הקוד מההתראה';

  @override
  String get password => 'סיסמה';

  @override
  String get hidePassword => 'הסתרת הסיסמה';

  @override
  String get showPassword => 'הצגת הסיסמה';

  @override
  String get forgotPasswordLink => 'שכחת את הסיסמה?';

  @override
  String get haveAccount => 'כבר יש לך חשבון?';

  @override
  String get newToCamTrip => 'חדש ב-CamTrip?';

  @override
  String get rememberedIt => 'נזכרת?';

  @override
  String get noCodeReceived => 'לא הגיע קוד?';

  @override
  String get resendCode => 'שליחה חוזרת';

  @override
  String onboardingDemoRoll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count צלמים, פילם אחד',
      two: 'שני צלמים, פילם אחד',
      one: 'צלם אחד, פילם אחד',
    );
    return '$_temp0';
  }

  @override
  String membersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count חברים',
      two: 'שני חברים',
      one: 'חבר אחד',
    );
    return '$_temp0';
  }

  @override
  String photosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count תמונות',
      two: 'שתי תמונות',
      one: 'תמונה אחת',
    );
    return '$_temp0';
  }

  @override
  String videosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count סרטונים',
      two: 'שני סרטונים',
      one: 'סרטון אחד',
    );
    return '$_temp0';
  }

  @override
  String get justNow => 'עכשיו';

  @override
  String get badgeNew => 'חדש';

  @override
  String recapTitle(String groupName) {
    return 'סיכום $groupName';
  }

  @override
  String get styleFilm => 'פילם';

  @override
  String get styleInstant => 'אינסטנט';

  @override
  String get styleDisposable => 'חד־פעמית';

  @override
  String get styleBw => 'שחור־לבן';

  @override
  String get styleGolden => 'זהוב';

  @override
  String get styleChrome => 'כרום';

  @override
  String get styleFilmDescription => 'צבעים חמים, גרעיניות ותאריך כתום';

  @override
  String get styleInstantDescription => 'צבעים רכים ומסגרת לבנה';

  @override
  String get styleDisposableDescription => 'פלאש חזק, וינייטה ודליפות אור';

  @override
  String get styleBwDescription => 'שחור־לבן גרעיני עם ניגודיות עמוקה';

  @override
  String get styleGoldenDescription => 'תמיד שעת זהב, זוהר זהוב ורך';

  @override
  String get styleChromeDescription => 'קר, רווי וחד, כמו פילם שקופיות';

  @override
  String get shutterStopRecording => 'עצירת הצילום';

  @override
  String get shutterStartRecording => 'התחלת צילום וידאו';

  @override
  String get shutterTakePhoto => 'צילום תמונה';

  @override
  String get modePhoto => 'תמונה';

  @override
  String get modeVideo => 'וידאו';

  @override
  String get cameraNotFound => 'לא נמצאה מצלמה';

  @override
  String get cameraAccessNeeded =>
      'CamTrip צריך גישה למצלמה. אפשר להפעיל אותה בהגדרות.';

  @override
  String get cameraStartFailed => 'המצלמה לא הצליחה להיפתח';

  @override
  String get albumAccessNeeded =>
      'כדאי לתת ל-CamTrip גישה לתמונות כדי לשמור אותן גם באלבום שלך';

  @override
  String get albumSaveFailed =>
      'השמירה באלבום לא הצליחה. התמונה שותפה בכל זאת.';

  @override
  String styleProFallback(String style) {
    return 'הסגנון הזה הוא חלק מ-Pro. בקבוצה הזו מצלמים עם $style.';
  }

  @override
  String get photoFailed => 'הצילום לא הצליח. כדאי לנסות שוב.';

  @override
  String get recordingFailed => 'צילום הווידאו לא הצליח';

  @override
  String get videoFailed => 'יצירת הסרטון לא הצליחה. כדאי לנסות שוב.';

  @override
  String get shootInGroup => 'צילום בקבוצה';

  @override
  String get close => 'סגירה';

  @override
  String get flash => 'פלאש';

  @override
  String get flashOn => 'מופעל';

  @override
  String get flashOff => 'כבוי';

  @override
  String get flashAuto => 'אוטומטי';

  @override
  String get chooseGroup => 'בחירת קבוצה';

  @override
  String get switchCamera => 'החלפת מצלמה';

  @override
  String get createOrJoinFirst => 'קודם צריך ליצור קבוצה או להצטרף לאחת';

  @override
  String get proViaGroup => 'Pro דרך הקבוצה';

  @override
  String proViaName(String name) {
    return 'Pro דרך $name';
  }

  @override
  String get proStylesFreeViaMember =>
      'סגנונות Pro בקבוצה הזו בחינם בשבילך בזכות חבר עם Pro';

  @override
  String proStylesFreeViaName(String name) {
    return 'סגנונות Pro בקבוצה הזו: בחינם בשבילך בזכות $name';
  }

  @override
  String get subscriptionsUnavailable =>
      'המינויים לא זמינים כרגע. כדאי לנסות שוב מאוחר יותר.';

  @override
  String get paymentPending => 'התשלום עדיין בעיבוד. Pro יופעל ברגע שיסתיים.';

  @override
  String get purchaseFailed => 'הרכישה לא הצליחה. כדאי לנסות שוב מאוחר יותר.';

  @override
  String get restoreUnavailable =>
      'אי אפשר לשחזר רכישות כרגע. כדאי לנסות שוב מאוחר יותר.';

  @override
  String get restoreFailed => 'השחזור לא הצליח. כדאי לנסות שוב מאוחר יותר.';

  @override
  String get welcomePro => 'ברוכים הבאים ל-CamTrip Pro! 🎉';

  @override
  String get proRestored => 'Pro שוחזר';

  @override
  String get noPurchaseFound => 'לא נמצאה רכישה קודמת';

  @override
  String periodDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ימים',
      two: 'יומיים',
      one: 'יום אחד',
    );
    return '$_temp0';
  }

  @override
  String periodWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count שבועות',
      two: 'שבועיים',
      one: 'שבוע אחד',
    );
    return '$_temp0';
  }

  @override
  String periodMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count חודשים',
      two: 'חודשיים',
      one: 'חודש אחד',
    );
    return '$_temp0';
  }

  @override
  String periodYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count שנים',
      two: 'שנתיים',
      one: 'שנה אחת',
    );
    return '$_temp0';
  }

  @override
  String get paywallHavePro => 'יש לך CamTrip Pro';

  @override
  String get paywallSubtitle => 'כל מה שצריך לטיול הבא.';

  @override
  String paywallFeatureStyles(String styles) {
    return 'כל סגנונות המצלמה ($styles)';
  }

  @override
  String get paywallFeatureUnlimited =>
      'חברים ואחסון ללא הגבלה, התמונות נשמרות לתמיד';

  @override
  String get paywallFeatureNoWatermark => 'סיכומים בלי סימן מים';

  @override
  String get paywallFeatureOriginal => 'הורדה באיכות מקורית';

  @override
  String get planYear => 'שנתי';

  @override
  String get planMonth => 'חודשי';

  @override
  String pricePerMonth(String price) {
    return '$price לחודש';
  }

  @override
  String paywallSaveBadge(int percent) {
    return 'חיסכון של $percent%';
  }

  @override
  String get planMonthCancelAnytime => 'ביטול בכל עת';

  @override
  String tryFree(String period) {
    return '$period ניסיון בחינם';
  }

  @override
  String get becomePro => 'שדרוג ל-Pro';

  @override
  String get subscriptionsLoadFailed =>
      'לא הצלחנו לטעון את המינויים. כדאי לבדוק את החיבור.';

  @override
  String legalAnnual(String price) {
    return 'מינוי שנתי ל-CamTrip Pro: $price לשנה.';
  }

  @override
  String legalAnnualTrial(String period, String price) {
    return 'מינוי שנתי ל-CamTrip Pro: $period בחינם, ואז $price לשנה.';
  }

  @override
  String legalMonthly(String price) {
    return 'מינוי חודשי ל-CamTrip Pro: $price לחודש.';
  }

  @override
  String legalMonthlyTrial(String period, String price) {
    return 'מינוי חודשי ל-CamTrip Pro: $period בחינם, ואז $price לחודש.';
  }

  @override
  String get legalBillingApple =>
      'התשלום מחויב ב-Apple ID שלך. המינוי מתחדש אוטומטית, אלא אם מבטלים אותו לפחות 24 שעות לפני סוף התקופה. אפשר לבטל ולנהל אותו בהגדרות החשבון ב-App Store.';

  @override
  String get legalBillingGoogle =>
      'התשלום מחויב בחשבון Google שלך. המינוי מתחדש אוטומטית, אלא אם מבטלים אותו לפחות 24 שעות לפני סוף התקופה. אפשר לבטל ולנהל אותו בהגדרות החשבון ב-Google Play.';

  @override
  String get restorePurchases => 'שחזור רכישות';

  @override
  String get terms => 'תנאים';

  @override
  String get privacy => 'פרטיות';

  @override
  String get groupProTitle => 'Pro אחד בקבוצה = Pro לכולם באותה קבוצה';

  @override
  String get groupProBody =>
      'אם לאדם אחד יש Pro, כל הקבוצה מקבלת את כל סגנונות המצלמה, חברים ללא הגבלה, תמונות שנשמרות, איכות מקורית וסיכומים בלי סימן מים.';

  @override
  String get groupCreated => 'הקבוצה נוצרה ✓';

  @override
  String get inviteFriends => 'הזמנת חברים';

  @override
  String get codeCopied => 'הקוד הועתק';

  @override
  String get shareLink => 'שיתוף קישור';

  @override
  String inviteSubject(String groupName) {
    return 'מצטרפים ל-$groupName ב-CamTrip';
  }

  @override
  String inviteMembersUnlimited(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count חברים',
      two: 'שני חברים',
      one: 'חבר אחד',
    );
    return '$_temp0 · ללא הגבלה (Pro)';
  }

  @override
  String inviteMembersLimit(int count, int limit) {
    return '$count מתוך $limit חברים · Pro: ללא הגבלה';
  }

  @override
  String get toCamera => 'למצלמה';

  @override
  String get done => 'סיום';

  @override
  String get joinEnterCode => 'יש להזין את הקוד בן 6 התווים';

  @override
  String get joinGroupTitle => 'הצטרפות לקבוצה';

  @override
  String get joinGroupSubtitle =>
      'אפשר להזין את הקוד של החברים, או לסרוק את קוד ה-QR שלהם.';

  @override
  String get typeCode => 'הקלדת קוד';

  @override
  String get scanQr => 'סריקת QR';

  @override
  String get join => 'הצטרפות';

  @override
  String get groupNameRequired => 'צריך לתת לקבוצה שם';

  @override
  String get newGroup => 'קבוצה חדשה';

  @override
  String get groupType => 'סוג הקבוצה';

  @override
  String get groupTypeVacation => 'חופשה';

  @override
  String get groupTypeVacationDescription =>
      'עם תאריך התחלה וסיום, ואז לארכיון';

  @override
  String get groupTypeEvent => 'אירוע';

  @override
  String get groupTypeEventDescription => 'יום או ערב אחד, למשל מסיבה';

  @override
  String get groupTypePermanent => 'פתוחה תמיד';

  @override
  String get groupTypePermanentDescription => 'לחבר\'ה הקבועים שלך';

  @override
  String get date => 'תאריך';

  @override
  String get departure => 'יציאה';

  @override
  String get returnDate => 'חזרה';

  @override
  String get defaultCameraStyle => 'סגנון מצלמה ברירת מחדל';

  @override
  String freeLimitPermanent(int max) {
    return 'בחינם: עד $max חברים. ללא הגבלה עם Pro.';
  }

  @override
  String freeLimitDated(int max, int days) {
    return 'בחינם: עד $max חברים, התמונות נשמרות עד $days ימים אחרי תאריך הסיום. ללא הגבלה ולתמיד עם Pro.';
  }

  @override
  String get createGroup => 'יצירת קבוצה';

  @override
  String get group => 'קבוצה';

  @override
  String groupCode(String code) {
    return 'קוד $code';
  }

  @override
  String get manage => 'ניהול';

  @override
  String get rename => 'שינוי שם';

  @override
  String get changeDates => 'שינוי תאריכים';

  @override
  String get finishTrip => 'סיום הטיול';

  @override
  String get finishTripSubtitle => 'תאריך הסיום יהיה היום';

  @override
  String get reopenGroup => 'פתיחת הקבוצה מחדש';

  @override
  String get closeGroup => 'סגירת הקבוצה';

  @override
  String get reopenGroupSubtitle => 'החברים יוכלו להוסיף תמונות שוב';

  @override
  String get closeGroupSubtitle =>
      'אף אחד לא יוכל להוסיף תמונות; עדיין אפשר לצפות בהכול';

  @override
  String get members => 'חברים';

  @override
  String memberYou(String name) {
    return '$name (את/ה)';
  }

  @override
  String get blockedTag => 'חסום';

  @override
  String get adminTag => 'מנהל';

  @override
  String removeMemberTitle(String name) {
    return 'להסיר את $name?';
  }

  @override
  String get removeMemberMessage => 'התמונות שלו יישארו בקבוצה.';

  @override
  String get remove => 'מחיקה';

  @override
  String get removeMember => 'הסרה';

  @override
  String blockTitle(String name) {
    return 'לחסום את $name?';
  }

  @override
  String blockMessage(String name) {
    return 'לא יוצגו לך יותר תמונות וסרטונים של $name, ולא יגיעו התראות עליהם. אפשר לבטל את זה בהגדרות.';
  }

  @override
  String get block => 'חסימה';

  @override
  String get makeMember => 'הפיכה לחבר רגיל';

  @override
  String get makeAdmin => 'הפיכה למנהל';

  @override
  String get removeFromGroup => 'הסרה מהקבוצה';

  @override
  String get unblock => 'ביטול חסימה';

  @override
  String get inviteFriendsButton => 'הזמנת חברים';

  @override
  String get you => 'את/ה';

  @override
  String get unarchive => 'שחזור מהארכיון';

  @override
  String get archive => 'העברה לארכיון';

  @override
  String get unarchiveSubtitle => 'הקבוצה חזרה לאלבומים שלך';

  @override
  String archiveSubtitle(String section) {
    return 'רק בשבילך: הקבוצה עוברת ל\"$section\" בתחתית האלבומים שלך';
  }

  @override
  String get archivedSection => 'בארכיון';

  @override
  String get hiddenPhotos => 'תמונות מוסתרות';

  @override
  String get hiddenPhotosSubtitle => 'תמונות שהסתרת מעצמך';

  @override
  String get leaveGroup => 'יציאה מהקבוצה';

  @override
  String get leaveGroupSubtitle => 'התמונות שלך יישארו בקבוצה בשביל האחרים';

  @override
  String get deleteGroup => 'מחיקת הקבוצה';

  @override
  String get deleteGroupSubtitle => 'כל התמונות יימחקו אצל כולם';

  @override
  String groupArchived(String groupName) {
    return '\"$groupName\" הועברה לארכיון';
  }

  @override
  String groupUnarchived(String groupName) {
    return '\"$groupName\" חזרה לאלבומים שלך';
  }

  @override
  String get undo => 'ביטול';

  @override
  String get groupNameTitle => 'שם הקבוצה';

  @override
  String get finishTripTitle => 'לסיים את הטיול?';

  @override
  String get finishTripMessage =>
      'תאריך הסיום יהיה היום. עדיין אפשר להוסיף תמונות; הסיכום מוכן.';

  @override
  String get finishTripConfirm => 'סיום';

  @override
  String get tripFinished => 'הטיול הסתיים';

  @override
  String leaveGroupTitle(String groupName) {
    return 'לצאת מ\"$groupName\"?';
  }

  @override
  String get leaveGroupMessage =>
      'התמונות שלך יישארו בקבוצה בשביל האחרים. אפשר להצטרף שוב אחר כך עם הקוד.';

  @override
  String get leave => 'יציאה';

  @override
  String groupDeleted(String groupName) {
    return '\"$groupName\" נמחקה';
  }

  @override
  String get youAreAdmin => 'את/ה מנהל/ת';

  @override
  String get open => 'פתיחה';

  @override
  String get archiveMenuSubtitle => 'רק בשבילך, האחרים לא ישימו לב';

  @override
  String get deleteGroupMenuSubtitle => 'לכולם, עם כל התמונות';

  @override
  String get deleteGroupTitle => 'למחוק את הקבוצה?';

  @override
  String deleteGroupMessage(int count, String groupName, int memberCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'כל $count התמונות והסרטונים',
      two: 'שתי התמונות והסרטונים',
      one: 'תמונה או סרטון אחד',
    );
    String _temp1 = intl.Intl.pluralLogic(
      memberCount,
      locale: localeName,
      other: 'כל $memberCount החברים',
      two: 'שני החברים',
      one: 'החבר היחיד',
    );
    return '$_temp0 ב\"$groupName\" ייעלמו אצל $_temp1. אי אפשר לבטל את זה.';
  }

  @override
  String get deleteGroupOwnRoll => 'גלריית התמונות שלך לא תשתנה.';

  @override
  String get deleteGroupTypeName => 'כדי לאשר, יש להקליד את שם הקבוצה:';

  @override
  String get deleteForEveryone => 'מחיקה אצל כולם';

  @override
  String get save => 'שמירה';

  @override
  String get yourAlbums => 'האלבומים שלך';

  @override
  String get uploadQueue => 'תור ההעלאות';

  @override
  String get noConnection => 'אין חיבור';

  @override
  String get albumsOfflineMessage =>
      'האלבומים ייטענו כשהחיבור יחזור. המצלמה עדיין עובדת.';

  @override
  String get retry => 'ניסיון נוסף';

  @override
  String get noAlbumsTitle => 'עדיין אין אלבומים';

  @override
  String get noAlbumsMessage =>
      'אפשר ליצור קבוצה לטיול הבא, או להצטרף לקבוצה של חבר עם הקוד שלו.';

  @override
  String get haveCode => 'יש לי קוד';

  @override
  String get joinWithCode => 'הצטרפות עם קוד או קוד QR';

  @override
  String get camera => 'מצלמה';

  @override
  String get restore => 'שחזור';

  @override
  String get more => 'עוד';

  @override
  String get newAlbum => 'חדש';

  @override
  String get closedTag => 'סגורה';

  @override
  String get activeTag => 'פעילה';

  @override
  String get uploadFailed => 'ההעלאה נכשלה';

  @override
  String get queueNoSignal => 'אין קליטה.';

  @override
  String get queueNoSignalMessage =>
      'התמונות שלך כבר באלבום, והן ישותפו ברגע שהחיבור יחזור.';

  @override
  String get queueWaitingForWifi => 'ממתין ל-Wi-Fi.';

  @override
  String queueWifiOnlyOn(String setting) {
    return 'האפשרות \"$setting\" מופעלת אצלך.';
  }

  @override
  String get queueVideosWifiOnly => 'סרטונים נשלחים רק דרך Wi-Fi.';

  @override
  String get queueAllShared => 'הכול שותף ✓';

  @override
  String queuePending(String items) {
    return 'עוד $items לשיתוף';
  }

  @override
  String queuePendingBoth(String photos, String videos) {
    return 'עוד $photos ו-$videos לשיתוף';
  }

  @override
  String get retryUpload => 'ניסיון נוסף';

  @override
  String get removeFromQueue => 'הסרה מהתור';

  @override
  String get queueStatusWifi => 'Wi-Fi';

  @override
  String get queueStatusWaiting => 'בהמתנה';

  @override
  String get videosWifiOnlyTitle => 'סרטונים רק דרך Wi-Fi';

  @override
  String get videosWifiOnlySubtitle => 'חוסך בחבילת הגלישה';

  @override
  String get retryNow => 'ניסיון נוסף עכשיו';

  @override
  String get yourName => 'השם שלך';

  @override
  String get settings => 'הגדרות';

  @override
  String get tapToChangeName => 'אפשר להקיש כדי לשנות את השם';

  @override
  String get getCamTripPro => 'שדרוג ל-CamTrip Pro';

  @override
  String get photos => 'תמונות';

  @override
  String get saveOwnPhotos => 'שמירת התמונות שלי באלבום לכל קבוצה';

  @override
  String get autoSaveOthers => 'שמירה אוטומטית של תמונות של אחרים';

  @override
  String get wifiOnlyTitle => 'העלאה רק דרך Wi-Fi';

  @override
  String get dateStamp => 'חותמת תאריך';

  @override
  String get notifications => 'התראות';

  @override
  String get notifyNewPhotos => 'תמונות חדשות (מקובצות)';

  @override
  String get notifyRecapReady => 'הסיכום מוכן';

  @override
  String get camTripTeam => 'צוות CamTrip';

  @override
  String get adminEntrySubtitle => 'משתמשים, הענקת Pro, דיווחים ונתונים';

  @override
  String get account => 'חשבון';

  @override
  String get manageSubscription => 'ניהול המינוי';

  @override
  String get blockedPeople => 'אנשים חסומים';

  @override
  String get nobody => 'אף אחד';

  @override
  String peopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count אנשים',
      two: 'שני אנשים',
      one: 'אדם אחד',
    );
    return '$_temp0';
  }

  @override
  String get privacyPolicy => 'מדיניות הפרטיות';

  @override
  String get contact => 'יצירת קשר';

  @override
  String get signOut => 'התנתקות';

  @override
  String get deleteAccount => 'מחיקת החשבון';

  @override
  String get deleteAccountSubtitle => 'מוחק את החשבון ואת כל התמונות שלך';

  @override
  String get deleteAccountTitle => 'למחוק את החשבון?';

  @override
  String get deleteAccountMessage =>
      'החשבון שלך וכל התמונות והסרטונים שלך יימחקו, גם מהקבוצות. מינוי פעיל צריך לבטל ב-App Store או ב-Google Play.';

  @override
  String get blockedTitle => 'חסומים';

  @override
  String get blockedSubtitle => 'התמונות של האנשים האלה לא מוצגות לך.';

  @override
  String get blockedNone => 'לא חסמת אף אחד.';

  @override
  String get unblockShort => 'ביטול חסימה';

  @override
  String get groupGone => 'הקבוצה הזו כבר לא קיימת, או שכבר אינך חבר בה.';

  @override
  String photosSavedToAlbum(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count תמונות נשמרו ב\"$album\"',
      two: 'שתי תמונות נשמרו ב\"$album\"',
      one: 'תמונה אחת נשמרה ב\"$album\"',
    );
    return '$_temp0';
  }

  @override
  String photosDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count תמונות נמחקו',
      two: 'שתי תמונות נמחקו',
      one: 'תמונה אחת נמחקה',
    );
    return '$_temp0';
  }

  @override
  String photosDeletedSkipped(int count, int skipped) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count תמונות נמחקו',
      two: 'שתי תמונות נמחקו',
      one: 'תמונה אחת נמחקה',
    );
    return '$_temp0, $skipped דולגו';
  }

  @override
  String photosHiddenForYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count תמונות הוסתרו ממך',
      two: 'שתי תמונות הוסתרו ממך',
      one: 'תמונה אחת הוסתרה ממך',
    );
    return '$_temp0';
  }

  @override
  String get addedToFavorites => 'נוסף למועדפים';

  @override
  String get removedFromFavorites => 'הוסר מהמועדפים';

  @override
  String get photoAccessSettings => 'אפשר לתת ל-CamTrip גישה לתמונות בהגדרות';

  @override
  String photosBeingAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count תמונות נוספות',
      two: 'שתי תמונות נוספות',
      one: 'תמונה אחת נוספת',
    );
    return '$_temp0';
  }

  @override
  String photosUnreadable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'לא הצלחנו לקרוא $count תמונות',
      two: 'לא הצלחנו לקרוא שתי תמונות',
      one: 'לא הצלחנו לקרוא תמונה אחת',
    );
    return '$_temp0';
  }

  @override
  String get groupNotLoaded => 'הקבוצה לא נטענה';

  @override
  String get noFavoritesTitle => 'עדיין אין מועדפים';

  @override
  String get noPhotosTitle => 'עדיין אין תמונות';

  @override
  String get noFavoritesMessage =>
      'אפשר להקיש על הכוכב בתמונה כדי לשים אותה כאן.';

  @override
  String get noPhotosMessage =>
      'צלמו את התמונה הראשונה. כל מי שבקבוצה יראה אותה מיד.';

  @override
  String get openCamera => 'פתיחת המצלמה';

  @override
  String savingProgress(int done, int total) {
    return 'שומר... $done/$total';
  }

  @override
  String get sharePreparing => 'מכין...';

  @override
  String sharingProgress(int done, int total) {
    return 'מכין... $done/$total';
  }

  @override
  String get choosePhotos => 'בחירת תמונות';

  @override
  String selectedCount(int count) {
    return '$count נבחרו';
  }

  @override
  String get selectNone => 'ביטול הבחירה';

  @override
  String get selectAll => 'בחירת הכול';

  @override
  String photosWaitingToShare(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count תמונות ממתינות לשיתוף',
      two: 'שתי תמונות ממתינות לשיתוף',
      one: 'תמונה אחת ממתינה לשיתוף',
    );
    return '$_temp0';
  }

  @override
  String get recapReadyTitle => 'הסיכום שלך מוכן';

  @override
  String get recapReadySubtitle => 'סרטון עם מוזיקה מהטיול שלך';

  @override
  String get watch => 'צפייה';

  @override
  String get makeRecapNow => 'יצירת סרטון סיכום עכשיו';

  @override
  String freeGroupDeleteNotice(String date) {
    return 'קבוצה חינמית: התמונות נשמרות עד $date. כדאי לשמור אותן או לשדרג ל-Pro.';
  }

  @override
  String get filterAll => 'הכול';

  @override
  String get filterFavorites => 'מועדפים';

  @override
  String get filterPerPerson => 'לפי אדם';

  @override
  String get filterPerson => 'אדם';

  @override
  String get select => 'בחירה';

  @override
  String get hiddenFilter => 'מוסתרות';

  @override
  String get photosBy => 'תמונות של...';

  @override
  String get uploadedTag => 'הועלה';

  @override
  String get saveAll => 'שמירת הכול';

  @override
  String get favorite => 'מועדף';

  @override
  String get unfavorite => 'הסרה מהמועדפים';

  @override
  String get hide => 'הסתרה';

  @override
  String get delete => 'מחיקה';

  @override
  String deletePhotosTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'למחוק $count תמונות?',
      two: 'למחוק שתי תמונות?',
      one: 'למחוק את התמונה?',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'הן ייעלמו אצל כל מי שבקבוצה. אי אפשר לבטל את זה.',
      one: 'היא תיעלם אצל כל מי שבקבוצה. אי אפשר לבטל את זה.',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosNotAllowed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count תמונות שייכות למישהו אחר. הן יישארו; רק מנהל יכול למחוק אותן.',
      two: 'שתי תמונות שייכות למישהו אחר. הן יישארו; רק מנהל יכול למחוק אותן.',
      one: 'תמונה אחת שייכת למישהו אחר. היא תישאר; רק מנהל יכול למחוק אותה.',
    );
    return '$_temp0';
  }

  @override
  String photosBackInGroup(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count תמונות חזרו לקבוצה',
      two: 'שתי תמונות חזרו לקבוצה',
      one: 'תמונה אחת חזרה לקבוצה',
    );
    return '$_temp0';
  }

  @override
  String get showAll => 'הצגת הכול';

  @override
  String get hiddenPhotosExplainer =>
      'רק את/ה כבר לא רואה את התמונות האלה. אצל האחרים בקבוצה הן עדיין שם.';

  @override
  String get nothingHidden => 'אין תמונות מוסתרות';

  @override
  String get nothingHiddenMessage => 'תמונות שתסתירו יופיעו כאן.';

  @override
  String showAgainCount(int count) {
    return 'הצגה מחדש ($count)';
  }

  @override
  String get someone => 'מישהו';

  @override
  String get savedToAlbum => 'נשמר באלבום התמונות';

  @override
  String get share => 'שיתוף';

  @override
  String get shareFailed => 'השיתוף לא הצליח';

  @override
  String get reportTitle => 'למה לדווח על התמונה הזו?';

  @override
  String get reportSubtitle =>
      'אנחנו בודקים כל דיווח תוך 24 שעות. התמונה מוסתרת ממך מיד.';

  @override
  String get reportThanks => 'תודה, נבדוק את זה';

  @override
  String blockMessageAllGroups(String name) {
    return 'לא יוצגו לך יותר תמונות וסרטונים של $name באף קבוצה, ולא יגיעו התראות עליהם. אפשר לבטל את זה בהגדרות.';
  }

  @override
  String userBlocked(String name) {
    return '$name נחסם/ה';
  }

  @override
  String get videoHiddenForYou => 'הסרטון הוסתר ממך';

  @override
  String get photoHiddenForYou => 'התמונה הוסתרה ממך';

  @override
  String get setAsCover => 'הגדרה כתמונת שער';

  @override
  String get coverUpdated => 'תמונת השער עודכנה';

  @override
  String get hideForMe => 'הסתרה ממני';

  @override
  String get hideForMeSubtitle => 'האחרים בקבוצה עדיין רואים אותה';

  @override
  String get reportPhoto => 'דיווח על התמונה';

  @override
  String blockName(String name) {
    return 'חסימת $name';
  }

  @override
  String get forEveryoneInGroup => 'לכל מי שבקבוצה';

  @override
  String get videoDeleted => 'הסרטון נמחק';

  @override
  String get photoDeleted => 'התמונה נמחקה';

  @override
  String get photoAccessToSave =>
      'כדי לשמור תמונות, אפשר לתת ל-CamTrip גישה לתמונות בהגדרות';

  @override
  String get phoneFull => 'הזיכרון בטלפון מלא';

  @override
  String get albumSaveFailedShort => 'השמירה באלבום לא הצליחה';

  @override
  String get recapTemplateGoldenHour => 'שעת זהב';

  @override
  String get recapTemplateFast => 'מהיר';

  @override
  String get recapTemplateFilmRoll => 'גליל פילם';

  @override
  String get recapTemplatePolaroid => 'פולרואיד';

  @override
  String get trackSummerEvening => 'ערב קיץ';

  @override
  String get trackGoldenHour => 'שעת זהב';

  @override
  String get trackRoadtrip => 'טיול בדרכים';

  @override
  String get moodWarm => 'חם';

  @override
  String get moodCheerful => 'עליז';

  @override
  String friendsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count חברים',
      two: 'שני חברים',
      one: 'חבר אחד',
    );
    return '$_temp0';
  }

  @override
  String get madeWithCamTrip => 'נוצר עם CamTrip';

  @override
  String get tagline => 'פילם אחד לכל החבורה';

  @override
  String get videoUnsupportedDevice => 'לא ניתן ליצור את הסרטון במכשיר הזה';

  @override
  String get groupLoadFailed => 'לא הצלחנו לטעון את הקבוצה.';

  @override
  String recapNeedsPhotos(int count) {
    return 'לסיכום צריך לפחות $count תמונות.';
  }

  @override
  String get recapFailed => 'יצירת הסיכום לא הצליחה. כדאי לנסות שוב.';

  @override
  String get recapSaved => 'הסיכום נשמר באלבום התמונות';

  @override
  String get recap => 'סיכום';

  @override
  String get recapRendering => 'יוצר סיכום...';

  @override
  String get videoRendering => 'יוצר סרטון...';

  @override
  String get template => 'תבנית';

  @override
  String get musicLicense => 'מוזיקה של CamTrip · ללא תמלוגים';

  @override
  String get change => 'שינוי';

  @override
  String get noWatermark => 'בלי סימן מים ✓';

  @override
  String get removeWatermarkPro => 'הסרת סימן המים עם Pro';

  @override
  String get proSourceSubscription => 'מינוי';

  @override
  String get proSourceGift => 'מתנה';

  @override
  String get proSourceAdmin => 'מנהל';

  @override
  String get proSourceGroup => 'דרך הקבוצה';

  @override
  String get noPro => 'אין Pro';

  @override
  String proStatusNoEnd(String source) {
    return 'Pro ($source), ללא תאריך סיום';
  }

  @override
  String proStatusUntil(String source, String date) {
    return 'Pro ($source), עד $date';
  }

  @override
  String get lifetime => 'לכל החיים';

  @override
  String get pickDate => 'בחירת תאריך';

  @override
  String get noAccess => 'אין גישה';

  @override
  String get adminOnlyTeam => 'הניהול מיועד לצוות CamTrip בלבד.';

  @override
  String get adminOverview => 'סקירה';

  @override
  String get adminUsers => 'משתמשים';

  @override
  String get adminReports => 'דיווחים';

  @override
  String adminsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count מנהלים',
      two: 'שני מנהלים',
      one: 'מנהל אחד',
    );
    return '$_temp0';
  }

  @override
  String get adminNewThisWeek => 'חדשים השבוע';

  @override
  String get adminGroups => 'קבוצות';

  @override
  String get adminProSubscription => 'Pro דרך מינוי';

  @override
  String get adminProGift => 'Pro במתנה';

  @override
  String adminWithoutSubscription(int count) {
    return '$count בלי מינוי';
  }

  @override
  String get adminOpenReports => 'דיווחים פתוחים';

  @override
  String get adminSearchHint => 'חיפוש לפי שם או אימייל';

  @override
  String get nobodyFound => 'לא נמצא אף אחד';

  @override
  String get loadMore => 'טעינת עוד';

  @override
  String get noEmail => 'אין אימייל';

  @override
  String adminDeletePhotoMessage(String groupName) {
    return 'התמונה תיעלם אצל כולם ב\"$groupName\". כל הדיווחים על התמונה הזו ייסגרו.';
  }

  @override
  String get adminBanMessage =>
      'החשבון הזה לא יוכל יותר להתחבר או להשתמש באפליקציה. אפשר לבטל את זה מאוחר יותר.';

  @override
  String get adminDismissTitle => 'לדחות את הדיווח?';

  @override
  String get adminDismissMessage => 'התמונה תישאר. הדיווח יסומן כסגור.';

  @override
  String get adminDismiss => 'דחייה';

  @override
  String get adminAccountBlocked => 'החשבון נחסם';

  @override
  String get adminReportDismissed => 'הדיווח נדחה';

  @override
  String get adminNoReports => 'אין דיווחים פתוחים';

  @override
  String get adminNoReportsMessage => 'תמונות שדווחו יופיעו כאן.';

  @override
  String get deletedTag => 'נמחק';

  @override
  String adminReportedBy(String name) {
    return 'מאת $name';
  }

  @override
  String adminPhotoBy(String name) {
    return 'צילום: $name';
  }

  @override
  String reportsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count דיווחים',
      two: 'שני דיווחים',
      one: 'דיווח אחד',
    );
    return '$_temp0';
  }

  @override
  String get adminDeletePhoto => 'מחיקת התמונה';

  @override
  String get adminBlockCreator => 'חסימת הצלם';

  @override
  String get loadFailed => 'הטעינה נכשלה';

  @override
  String get adminLifetimeProGiven => 'הוענק Pro לכל החיים';

  @override
  String get adminProGiven => 'הוענק Pro';

  @override
  String adminGiveProUntil(String date) {
    return 'הענקת Pro עד $date';
  }

  @override
  String get adminGiveProLifetime => 'הענקת Pro לכל החיים';

  @override
  String adminGiveProFor(String period) {
    return 'הענקת Pro ל$period';
  }

  @override
  String get adminReasonHint => 'סיבה, למשל חבר, בודק, משפיען';

  @override
  String get adminGivePro => 'הענקת Pro';

  @override
  String get adminRevokeTitle => 'לבטל את המתנה?';

  @override
  String get adminRevokeMessage =>
      'ה-Pro שניתן במתנה יופסק מיד. המינוי העצמאי שלו ימשיך.';

  @override
  String get adminRevoke => 'ביטול';

  @override
  String get adminGiftRevoked => 'המתנה בוטלה';

  @override
  String get adminUnbanTitle => 'לבטל את החסימה?';

  @override
  String adminUnbanMessage(String name) {
    return '$name יוכל/תוכל להתחבר שוב.';
  }

  @override
  String get adminUnbanned => 'החסימה בוטלה';

  @override
  String get adminBanUserMessage =>
      'החשבון הזה לא יוכל יותר להתחבר או להשתמש באפליקציה. התמונות יישארו.';

  @override
  String get adminUser => 'משתמש';

  @override
  String get adminNotVerified => 'לא מאומת';

  @override
  String get adminRole => 'תפקיד';

  @override
  String get adminCreated => 'נוצר';

  @override
  String get unknown => 'לא ידוע';

  @override
  String get adminSignInWith => 'מתחבר עם';

  @override
  String get adminEmailMethod => 'אימייל';

  @override
  String get adminPhotosAndVideos => 'תמונות וסרטונים';

  @override
  String get adminStatus => 'סטטוס';

  @override
  String get adminActive => 'פעיל';

  @override
  String adminActiveUntil(String date) {
    return 'פעיל עד $date';
  }

  @override
  String adminGiftFrom(String name) {
    return 'מתנה מ$name';
  }

  @override
  String adminExpiredOn(String date) {
    return 'פג ב-$date';
  }

  @override
  String get adminExpired => 'פג תוקף';

  @override
  String adminUntil(String date) {
    return 'עד $date';
  }

  @override
  String get adminGiveProTitle => 'הענקת Pro';

  @override
  String get adminGiveProNote =>
      'תקף גם לקבוצות של האדם הזה: Pro אחד בקבוצה = Pro לכולם באותה קבוצה.';

  @override
  String get adminRevokeGift => 'ביטול המתנה';

  @override
  String get adminModeration => 'ניהול תוכן';

  @override
  String get adminCannotBanSelf => 'אי אפשר לחסום את עצמך.';

  @override
  String get adminCannotBanAdmin => 'אי אפשר לחסום מנהל.';

  @override
  String get adminUnban => 'ביטול חסימה';

  @override
  String get adminBanAccount => 'חסימת החשבון';

  @override
  String get googleSignInUnavailable => 'ההתחברות עם Google עדיין לא זמינה';

  @override
  String get cameraPickerTitle => 'בחירת מצלמה';

  @override
  String get cameraPickerSubtitle => 'כל מצלמה נותנת לתמונות מראה משלה';

  @override
  String get cameraPickerChange => 'החלפת מצלמה';

  @override
  String get cameraPickerUnlock => 'פתיחה עם Pro';

  @override
  String get cameraPickerSelected => 'נבחרה';

  @override
  String get cameraPickerStyleSummer => 'קיץ';

  @override
  String get cameraPickerStyleSummerDescription =>
      'צבעים חמים ודהויים של תמונה משנות ה-90';

  @override
  String get cameraPickerStyleNight => 'לילה 800';

  @override
  String get cameraPickerStyleNightDescription =>
      'פילם קולנוע: צללים טורקיז, אור חם, הרבה גרעיניות';

  @override
  String get cameraPickerStyleSepia => 'ספיה';

  @override
  String get cameraPickerStyleSepiaDescription =>
      'תמונה חומה וישנה מקופסת הנעליים';

  @override
  String get cameraPickerStyleLomo => 'לומו';

  @override
  String get cameraPickerStyleLomoDescription =>
      'צבעים עזים, פינות כהות וגוון צבע פרוע';

  @override
  String get cameraPickerStyleMint => 'מנטה';

  @override
  String get cameraPickerStyleMintDescription => 'רך ורענן עם גוון ירוק';

  @override
  String get cameraPickerStylePastel => 'ורוד';

  @override
  String get cameraPickerStylePastelDescription =>
      'צבעי פסטל עם זוהר ורוד ומסגרת לבנה';

  @override
  String get cameraPickerStyleSuper8 => 'סופר 8';

  @override
  String get cameraPickerStyleSuper8Description =>
      'גרעיני ורך, כמו סרט ביתי ישן';

  @override
  String get paywallBenefitGroup => 'Pro אחד = Pro לכל הקבוצה';

  @override
  String get paywallBenefitUnlimited => 'חברים ללא הגבלה, התמונות נשמרות לתמיד';

  @override
  String get paywallBenefitQuality => 'בלי סימן מים, איכות מקורית';

  @override
  String paywallFreeTrial(String period) {
    return '$period בחינם';
  }

  @override
  String paywallPriceYear(String price) {
    return '$price לשנה.';
  }

  @override
  String paywallPriceYearTrial(String period, String price) {
    return '$period בחינם, ואז $price לשנה.';
  }

  @override
  String paywallPriceMonth(String price) {
    return '$price לחודש.';
  }

  @override
  String paywallPriceMonthTrial(String period, String price) {
    return '$period בחינם, ואז $price לחודש.';
  }

  @override
  String paywallAutoRenew(String store) {
    return 'מתחדש אוטומטית. אפשר לבטל עד 24 שעות לפני החידוש ב-$store.';
  }

  @override
  String get paywallDetailsTitle => 'כל מה שיש ב-Pro';

  @override
  String get paywallBenefitStyles => 'כל סגנונות המצלמה';

  @override
  String get allPhotosTitle => 'כל התמונות';

  @override
  String get homeTabAlbums => 'אלבומים';

  @override
  String get allPhotosEmptyTitle => 'עדיין אין תמונות';

  @override
  String get allPhotosEmptyMessage =>
      'פותחים את המצלמה ומצלמים את התמונה הראשונה.';

  @override
  String get allPhotosLoadFailed => 'לא הצלחנו לטעון את התמונות שלך';

  @override
  String get cameraSettingsTitle => 'הגדרות מצלמה';

  @override
  String get cameraSettingsMore => 'הגדרות נוספות';

  @override
  String get cameraSettingsGrid => 'רשת';

  @override
  String get cameraSettingsHaptics => 'רטט בצילום';

  @override
  String get cameraSettingsDateStamp => 'תאריך בפינה הימנית התחתונה';

  @override
  String get cameraSettingsSound => 'צליל צמצם';

  @override
  String get cameraSettingsSoundHint => 'שקט כשהטלפון במצב שקט';

  @override
  String get cameraSettingsTimer => 'טיימר';

  @override
  String get cameraSettingsTimerOff => 'כבוי';

  @override
  String cameraSettingsTimerSeconds(int seconds) {
    return '$seconds שנ\'';
  }

  @override
  String get cameraSettingsTimerCancelHint => 'הקשה על הצמצם מבטלת';

  @override
  String get cameraSettingsMirror => 'היפוך סלפי';

  @override
  String get cameraSettingsSaveToRoll => 'שמירה בגלריה';

  @override
  String get cameraSettingsQuality => 'איכות';

  @override
  String get cameraSettingsQualityStandard => 'רגילה';

  @override
  String get cameraSettingsQualityHigh => 'גבוהה';

  @override
  String get cameraLowLightHint => 'מעט אור - כדאי להפעיל פלאש';

  @override
  String get cameraFlashUnavailable => 'למצלמה הזו אין פלאש';

  @override
  String get cameraFlashScreen => 'פלאש מסך';

  @override
  String get cameraFlashCycleHint => 'הקשה מחליפה בין כבוי, מופעל ואוטומטי';

  @override
  String get cameraFlip => 'מעבר בין המצלמה הקדמית לאחורית';

  @override
  String get cameraFlipHint => 'הקשה כפולה על העינית מחליפה מצלמה';

  @override
  String cameraPickerPaywallStyles(int count, String styles) {
    return 'כל $count המצלמות, כולל $styles';
  }

  @override
  String get styleFlash => 'פלאש 400';

  @override
  String get styleFlashDescription =>
      'פלאש ישיר על פילם חם: זוהר ענבר, גרעיניות, אדומים עשירים';

  @override
  String cameraTimerButton(String state) {
    return 'טיימר: $state';
  }

  @override
  String get cameraTimerCycleHint => 'הקשה מחליפה בין כבוי, 3 שנ\' ו-10 שנ\'';

  @override
  String get cameraLastShotOpen => 'התמונה האחרונה, פותח את האלבום';

  @override
  String get cameraLastShotEmpty => 'עדיין אין תמונות, פותח את האלבום';

  @override
  String get deleteOnlyOwnOrAdmin => 'רק מי שצילם או מנהל יכולים למחוק את זה';

  @override
  String get videoPlay => 'הפעלה';

  @override
  String get videoPause => 'השהיה';

  @override
  String get language => 'שפה';

  @override
  String get languageSystem => 'שפת המערכת';

  @override
  String languageSystemCurrent(String language) {
    return 'מערכת ($language)';
  }

  @override
  String get languageSearchHint => 'חיפוש שפה';

  @override
  String get languageNoResults => 'לא נמצאה שפה';

  @override
  String get personalRollTitle => 'הפילם שלי';

  @override
  String get personalRollSubtitle => 'רק בשבילך';

  @override
  String get personalRollPickerSubtitle => 'תמונות בודדות, רק בשבילך';

  @override
  String get personalRollMove => 'לאלבום';

  @override
  String get personalRollMoveTitle => 'העברה לאלבום';

  @override
  String get personalRollMoveNoAlbums =>
      'קודם צריך ליצור אלבום או להצטרף לאחד עם קוד.';

  @override
  String personalRollMoved(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count תמונות הועברו אל $album',
      one: 'תמונה אחת הועברה אל $album',
    );
    return '$_temp0';
  }

  @override
  String get personalRollPrivateNote =>
      'רק את/ה רואה את התמונות האלה. אפשר להעביר אותן לאלבום כדי לשתף.';

  @override
  String get paywallTripPassSub => 'רק הטיול הזה, לכל הקבוצה';

  @override
  String get paywallOneTime => 'חד־פעמי';

  @override
  String get paywallBestValue => 'הכי משתלם';

  @override
  String paywallRollFullTitle(int used, int limit) {
    return 'הפילם שלך מלא - $used/$limit תמונות';
  }

  @override
  String get paywallRollFullSub => 'אפשר להמשיך לצלם עם Trip Pass או Pro.';

  @override
  String get paywallCameraTitle => 'המצלמה הזו היא חלק מ-Pro';

  @override
  String paywallCameraSub(int count) {
    return 'פתיחת כל $count המצלמות.';
  }

  @override
  String get paywallWatermarkTitle => 'סיכום בלי סימן מים';

  @override
  String get paywallWatermarkSub => 'שיתוף הסיכום בלי הלוגו של CamTrip.';

  @override
  String get paywallDeletionTitle => 'לשמור את הטיול';

  @override
  String paywallDeletionSub(String date) {
    return 'טיולים חינמיים נמחקים ב-$date. עם Trip Pass או Pro הוא נשמר לתמיד.';
  }

  @override
  String paywallTripPassTerms(String price) {
    return 'רכישה חד־פעמית של $price לטיול הזה. לא מינוי.';
  }

  @override
  String get buyTripPass => 'רכישת Trip Pass';

  @override
  String get tripPassActive => 'Trip Pass פעיל: הטיול הזה Pro לכולם';

  @override
  String get tripPassActivating => 'התשלום התקבל. ה-Trip Pass יופעל בעוד רגע.';

  @override
  String proViaTripPass(String name) {
    return 'Trip Pass של $name';
  }

  @override
  String rollCounterSemantics(int used, int limit) {
    return '$used מתוך $limit צילומים בפילם שלך';
  }

  @override
  String rollHeldTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count תמונות לא נכנסות לפילם שלך',
      two: 'שתי תמונות לא נכנסות לפילם שלך',
      one: 'תמונה אחת לא נכנסת לפילם שלך',
    );
    return '$_temp0';
  }

  @override
  String get rollHeldBody => 'אפשר לשמור אותן עם Pro או Trip Pass';

  @override
  String deletionBannerTitle(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'לשמור את הטיול - נשארו $days ימים',
      two: 'לשמור את הטיול - נשארו יומיים',
      one: 'לשמור את הטיול - נשאר יום אחד',
    );
    return '$_temp0';
  }

  @override
  String get deletionBannerBody =>
      'טיולים חינמיים נמחקים 30 ימים אחרי שהם מסתיימים. עם Trip Pass או Pro הוא נשמר לתמיד.';

  @override
  String apiRollFull(int limit) {
    return 'הפילם שלך מלא ($limit צילומים). אפשר להמשיך לצלם עם Trip Pass או Pro.';
  }

  @override
  String get apiTripPassFailed =>
      'לא הצלחנו להפעיל את ה-Trip Pass. אפשר לפנות אל support@camtrip.app.';

  @override
  String get apiTripPassExists => 'לטיול הזה כבר יש Trip Pass.';

  @override
  String get tripPassUnavailable =>
      'ה-Trip Pass לא זמין כרגע. כדאי לנסות שוב מאוחר יותר.';

  @override
  String get tripMapTitle => 'מפת הטיול';

  @override
  String get tripMapOpen => 'מפה ונתונים';

  @override
  String get tripMapLoadFailed => 'לא הצלחנו לטעון את מפת הטיול';

  @override
  String get tripMapStatDays => 'ימים';

  @override
  String get tripMapStatPhotos => 'תמונות';

  @override
  String get tripMapStatVideos => 'סרטונים';

  @override
  String get tripMapStatMembers => 'חברים';

  @override
  String get tripMapStatDistance => 'ק\"מ בדרך';

  @override
  String get tripMapStatCountries => 'מדינות';

  @override
  String get tripMapStatPlaces => 'מקומות';

  @override
  String tripMapBusiestDay(String day, int count) {
    return 'הכי הרבה תמונות ב-$day ($count)';
  }

  @override
  String tripMapTopPhotographer(String name, int count) {
    return 'הצלם המוביל: $name ($count)';
  }

  @override
  String get tripMapOffTitle => 'מפת הטיול כבויה';

  @override
  String get tripMapOffMessage =>
      'מנהל הקבוצה יכול להפעיל את מפת הטיול בהגדרות הקבוצה. את הנתונים רואים תמיד.';

  @override
  String get tripMapOffMessageAdmin =>
      'הפעלת מפת הטיול מראה איפה צולמו התמונות. כל אחד מחליט בעצמו אם להשתתף.';

  @override
  String get tripMapEnable => 'הפעלת מפת הטיול';

  @override
  String get tripMapEmptyTitle => 'עדיין אין מקומות במפה';

  @override
  String get tripMapEmptyMessage =>
      'תמונות חדשות של חברים שמשתפים מיקום יופיעו כאן, מעוגלות לכ-100 מ\'.';

  @override
  String get tripMapConsentTitle => 'מפת הטיול';

  @override
  String get tripMapConsentQuestion =>
      'לשתף במפת הטיול של הקבוצה איפה צולמו התמונות שלך?';

  @override
  String get tripMapConsentDetail =>
      'רק חברי הקבוצה רואים, מעוגל לכ-100 מ\'. המיקום אף פעם לא נשמר בתוך התמונה עצמה, ואפשר לכבות את זה בכל רגע בהגדרות הקבוצה.';

  @override
  String get tripMapConsentYes => 'כן, לשתף';

  @override
  String get tripMapConsentNo => 'לא';

  @override
  String get tripMapLocationDenied =>
      'אין גישה למיקום שלך. אפשר לאשר אותה בהגדרות הטלפון.';

  @override
  String get tripMapSettingSubtitle =>
      'הצגה במפה של המקומות שבהם צולמו התמונות. כל חבר מחליט בעצמו אם לשתף.';

  @override
  String get tripMapDisableTitle => 'לכבות את מפת הטיול?';

  @override
  String get tripMapDisableMessage =>
      'כל המיקומים בקבוצה יימחקו. אם תפעילו את המפה שוב בהמשך, כולם יישאלו מחדש.';

  @override
  String get tripMapDisable => 'כיבוי';

  @override
  String get tripMapMySharing => 'שיתוף המיקום שלי';

  @override
  String get tripMapMySharingOn =>
      'התמונות החדשות שלך יופיעו במפת הטיול (מעוגלות לכ-100 מ\').';

  @override
  String get tripMapMySharingOff => 'כבוי. התמונות שלך לא מופיעות במפה.';

  @override
  String get tripMapStopSharingTitle => 'להפסיק לשתף את המיקום שלך?';

  @override
  String get tripMapStopSharingMessage =>
      'המיקומים של כל התמונות שלך בקבוצה יימחקו.';

  @override
  String get tripMapStopSharing => 'הפסקת השיתוף';
}
