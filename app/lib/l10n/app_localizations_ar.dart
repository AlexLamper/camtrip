// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get cancel => 'إلغاء';

  @override
  String get yes => 'نعم';

  @override
  String inviteMessageIntro(String groupName) {
    return 'هل تنضم إلى \"$groupName\" على CamTrip؟ هكذا نرى صور بعضنا فورًا.';
  }

  @override
  String inviteMessageCode(String code) {
    return 'أو أدخل الرمز: $code';
  }

  @override
  String get memberFallbackName => 'صديق';

  @override
  String get reportReasonInappropriate => 'غير لائق أو مسيء';

  @override
  String get reportReasonSpam => 'رسائل مزعجة';

  @override
  String get reportReasonOther => 'سبب آخر';

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
  String get errorOffline => 'لا يوجد اتصال. حاول مرة أخرى بعد قليل.';

  @override
  String errorSomethingWrongStatus(int status) {
    return 'حدث خطأ ما ($status)';
  }

  @override
  String get errorSomethingWrong => 'حدث خطأ ما';

  @override
  String get apiInvalidCredentials =>
      'البريد الإلكتروني أو كلمة المرور غير صحيحة';

  @override
  String get apiInvalidCode =>
      'هذا الرمز غير صحيح أو انتهت صلاحيته. اطلب رمزًا جديدًا.';

  @override
  String get apiEmailTaken =>
      'يوجد حساب بهذا البريد الإلكتروني بالفعل. سجّل الدخول، أو اختر \"نسيت كلمة المرور؟\".';

  @override
  String apiEmailTakenProvider(String provider) {
    return 'يوجد حساب بهذا البريد الإلكتروني بالفعل. سجّل الدخول باستخدام $provider.';
  }

  @override
  String apiWeakPassword(int min) {
    return 'اختر كلمة مرور من $min أحرف على الأقل';
  }

  @override
  String apiNameTooLong(int max) {
    return 'يمكن أن يتكون اسمك من $max حرفًا كحد أقصى';
  }

  @override
  String get apiRateLimited =>
      'محاولات كثيرة جدًا. حاول مرة أخرى بعد 15 دقيقة.';

  @override
  String apiAccountBanned(String email) {
    return 'تم حظر حسابك. تواصل مع $email إذا كنت تعتقد أن هذا خطأ.';
  }

  @override
  String get apiProRequired => 'نمط الكاميرا هذا جزء من CamTrip Pro';

  @override
  String get apiGroupClosed => 'تم إغلاق هذه المجموعة';

  @override
  String get apiGroupCodeNotFound => 'لا توجد مجموعة بهذا الرمز';

  @override
  String apiGroupFull(int max) {
    return 'هذه المجموعة ممتلئة (الحد الأقصى $max أعضاء). إذا كان لدى أحد الأعضاء CamTrip Pro، يمكن لأي شخص الانضمام.';
  }

  @override
  String get apiLastMember => 'أنت آخر عضو. احذف المجموعة بدلًا من ذلك.';

  @override
  String get apiAdminRequired => 'لمسؤولي CamTrip فقط';

  @override
  String get apiUploadIncomplete => 'لم يكتمل الرفع';

  @override
  String get apiInvalidInput => 'إدخال غير صالح';

  @override
  String get apiNotSignedIn => 'لم تسجّل الدخول';

  @override
  String get apiAccountGone => 'هذا الحساب لم يعد موجودًا';

  @override
  String get apiPhotoNotFound => 'الصورة غير موجودة';

  @override
  String get apiGroupNotFound => 'المجموعة غير موجودة';

  @override
  String get apiMemberNotFound => 'العضو غير موجود';

  @override
  String get apiPersonNotFound => 'الشخص غير موجود';

  @override
  String get apiUserNotFound => 'المستخدم غير موجود';

  @override
  String get apiAdminOnly => 'يمكن للمشرف فقط فعل ذلك';

  @override
  String get apiCannotBlockSelf => 'لا يمكنك حظر نفسك';

  @override
  String get apiCannotReportOwn => 'لا يمكنك الإبلاغ عن صورتك';

  @override
  String get apiDeleteOwnOnly => 'يمكنك حذف صورك فقط';

  @override
  String get apiOwnerCannotBeRemoved => 'لا يمكن إزالة منشئ المجموعة';

  @override
  String get apiOwnerStaysAdmin => 'يبقى المنشئ مشرفًا دائمًا';

  @override
  String get apiNeedsOneAdmin => 'تحتاج المجموعة إلى مشرف واحد على الأقل';

  @override
  String get apiEndBeforeStart => 'تاريخ الانتهاء قبل تاريخ البدء';

  @override
  String get apiPermanentNoEndDate =>
      'المجموعة المفتوحة دائمًا ليس لها تاريخ انتهاء';

  @override
  String get apiCannotBanAdmin => 'لا يمكن حظر مسؤول';

  @override
  String get apiReportNotFound => 'البلاغ غير موجود';

  @override
  String get apiPhotoOwnerUnknown => 'لم يعد معروفًا من التقط هذه الصورة';

  @override
  String get validationNameRequired => 'أدخل اسمك';

  @override
  String validationMaxChars(int max) {
    return '$max حرفًا كحد أقصى';
  }

  @override
  String get validationEmailRequired => 'أدخل بريدك الإلكتروني';

  @override
  String get validationEmailInvalid => 'هذا البريد الإلكتروني غير صالح';

  @override
  String get validationPasswordRequired => 'اختر كلمة مرور';

  @override
  String validationMinChars(int min) {
    return '$min أحرف على الأقل';
  }

  @override
  String get validationPasswordTooLong => 'كلمة المرور هذه طويلة جدًا';

  @override
  String get validationPasswordEmpty => 'أدخل كلمة المرور';

  @override
  String get validationCodeRequired => 'أدخل الرمز الموجود في البريد';

  @override
  String get validationCodeDigits => 'يتكون الرمز من 6 أرقام';

  @override
  String get onboarding1Title => 'فيلم واحد\nللمجموعة كلها.';

  @override
  String get onboarding1Body =>
      'صوّر بكاميرا كلاسيكية. يرى الجميع صورك فورًا، وتكون في ألبومك أيضًا.';

  @override
  String get onboarding2Title => 'لا مزيد من\nإرسال الصور.';

  @override
  String get onboarding2Body =>
      'أنشئ مجموعة، شارك الرمز، وانتهى الأمر. لا مزيد من \"أرسل لي تلك الصور؟\"';

  @override
  String get onboarding3Title => 'فيديو ملخّص\nبعد الرحلة.';

  @override
  String get onboarding3Body =>
      'يصنع CamTrip فيديو بموسيقى من أجمل لحظاتكم معًا.';

  @override
  String get onboardingInvited => 'لقد تمت دعوتك! سجّل الدخول للانضمام.';

  @override
  String get signInAppleFailed => 'تعذّر تسجيل الدخول باستخدام Apple';

  @override
  String get signInGoogleFailed => 'تعذّر تسجيل الدخول باستخدام Google';

  @override
  String get signInFailed => 'تعذّر تسجيل الدخول';

  @override
  String get next => 'التالي';

  @override
  String get legalPrefix => 'بالمتابعة فإنك توافق على';

  @override
  String get legalTerms => 'الشروط';

  @override
  String get legalAnd => ' و';

  @override
  String get legalPrivacy => 'سياسة الخصوصية';

  @override
  String get legalSuffix => '.';

  @override
  String get continueWithApple => 'المتابعة باستخدام Apple';

  @override
  String get continueWithGoogle => 'المتابعة باستخدام Google';

  @override
  String get createAccount => 'إنشاء حساب';

  @override
  String get signIn => 'تسجيل الدخول';

  @override
  String get or => 'أو';

  @override
  String get registerSubtitle => 'حتى يعرف أصدقاؤك من التقط الصور.';

  @override
  String get loginSubtitle => 'مرحبًا بعودتك.';

  @override
  String get forgotPasswordTitle => 'نسيت كلمة المرور';

  @override
  String get forgotPasswordPushSubtitle =>
      'هل ما زلت مسجّلًا في مكان آخر؟ سنرسل إليه رمزًا من 6 أرقام كإشعار لتعيين كلمة مرور جديدة.';

  @override
  String get newPassword => 'كلمة مرور جديدة';

  @override
  String get resetPushInfo =>
      'إذا كنت ما زلت مسجّلًا في مكان آخر، فستصلك هناك رسالة إشعار برمز. لا تستطيع الدخول؟ سجّل الدخول باستخدام Apple أو Google بالبريد الإلكتروني نفسه - وسيتم ربط حسابك.';

  @override
  String get sendCode => 'إرسال الرمز';

  @override
  String get savePassword => 'حفظ كلمة المرور';

  @override
  String get errorTryAgain => 'حدث خطأ ما. حاول مرة أخرى.';

  @override
  String get back => 'رجوع';

  @override
  String get name => 'الاسم';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get codeFromPush => 'الرمز من الإشعار';

  @override
  String get password => 'كلمة المرور';

  @override
  String get hidePassword => 'إخفاء كلمة المرور';

  @override
  String get showPassword => 'إظهار كلمة المرور';

  @override
  String get forgotPasswordLink => 'نسيت كلمة المرور؟';

  @override
  String get haveAccount => 'لديك حساب بالفعل؟';

  @override
  String get newToCamTrip => 'جديد على CamTrip؟';

  @override
  String get rememberedIt => 'تذكّرتها؟';

  @override
  String get noCodeReceived => 'لم يصلك الرمز؟';

  @override
  String get resendCode => 'إرسال مرة أخرى';

  @override
  String onboardingDemoRoll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count مصوّر، فيلم واحد',
      many: '$count مصورًا، فيلم واحد',
      few: '$count مصورين، فيلم واحد',
      two: 'مصوّران، فيلم واحد',
      one: 'مصوّر واحد، فيلم واحد',
      zero: 'لا مصورين، فيلم واحد',
    );
    return '$_temp0';
  }

  @override
  String membersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count عضو',
      many: '$count عضوًا',
      few: '$count أعضاء',
      two: 'عضوان',
      one: 'عضو واحد',
      zero: 'لا أعضاء',
    );
    return '$_temp0';
  }

  @override
  String photosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count صورة',
      many: '$count صورة',
      few: '$count صور',
      two: 'صورتان',
      one: 'صورة واحدة',
      zero: 'لا صور',
    );
    return '$_temp0';
  }

  @override
  String videosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count فيديو',
      many: '$count فيديو',
      few: '$count فيديوهات',
      two: 'فيديوهان',
      one: 'فيديو واحد',
      zero: 'لا فيديوهات',
    );
    return '$_temp0';
  }

  @override
  String get justNow => 'الآن';

  @override
  String get badgeNew => 'جديد';

  @override
  String recapTitle(String groupName) {
    return 'ملخّص $groupName';
  }

  @override
  String get styleFilm => 'فيلم';

  @override
  String get styleInstant => 'فوري';

  @override
  String get styleDisposable => 'لمرة واحدة';

  @override
  String get styleBw => 'أبيض وأسود';

  @override
  String get styleGolden => 'ذهبي';

  @override
  String get styleChrome => 'كروم';

  @override
  String get styleFilmDescription => 'ألوان دافئة وحبيبات وتاريخ برتقالي';

  @override
  String get styleInstantDescription => 'ألوان ناعمة وإطار أبيض';

  @override
  String get styleDisposableDescription => 'فلاش قوي وتظليل للحواف وتسرّب ضوء';

  @override
  String get styleBwDescription => 'أبيض وأسود محبّب بتباين عميق';

  @override
  String get styleGoldenDescription => 'ساعة ذهبية دائمًا، توهج ذهبي ناعم';

  @override
  String get styleChromeDescription => 'بارد ومشبع وحاد، مثل فيلم الشرائح';

  @override
  String get shutterStopRecording => 'إيقاف التسجيل';

  @override
  String get shutterStartRecording => 'بدء تسجيل الفيديو';

  @override
  String get shutterTakePhoto => 'التقاط صورة';

  @override
  String get modePhoto => 'صورة';

  @override
  String get modeVideo => 'فيديو';

  @override
  String get cameraNotFound => 'لم يتم العثور على كاميرا';

  @override
  String get cameraAccessNeeded =>
      'يحتاج CamTrip إلى الوصول إلى الكاميرا. فعّله في الإعدادات.';

  @override
  String get cameraStartFailed => 'تعذّر تشغيل الكاميرا';

  @override
  String get albumAccessNeeded =>
      'اسمح لـ CamTrip بالوصول إلى صورك لحفظها في ألبومك أيضًا';

  @override
  String get albumSaveFailed =>
      'تعذّر الحفظ في الألبوم. تمت مشاركة الصورة رغم ذلك.';

  @override
  String styleProFallback(String style) {
    return 'هذا النمط جزء من Pro. في هذه المجموعة تصوّر بنمط $style.';
  }

  @override
  String get photoFailed => 'تعذّر التقاط الصورة. حاول مرة أخرى.';

  @override
  String get recordingFailed => 'تعذّر تسجيل الفيديو';

  @override
  String get videoFailed => 'تعذّر إنشاء الفيديو. حاول مرة أخرى.';

  @override
  String get shootInGroup => 'التصوير في مجموعة';

  @override
  String get close => 'إغلاق';

  @override
  String get flash => 'الفلاش';

  @override
  String get flashOn => 'تشغيل';

  @override
  String get flashOff => 'إيقاف';

  @override
  String get flashAuto => 'تلقائي';

  @override
  String get chooseGroup => 'اختر مجموعة';

  @override
  String get switchCamera => 'تبديل الكاميرا';

  @override
  String get createOrJoinFirst => 'أنشئ مجموعة أو انضم إلى واحدة أولًا';

  @override
  String get proViaGroup => 'Pro عبر المجموعة';

  @override
  String proViaName(String name) {
    return 'Pro عبر $name';
  }

  @override
  String get proStylesFreeViaMember =>
      'أنماط Pro في هذه المجموعة مجانية لك بفضل عضو لديه Pro';

  @override
  String proStylesFreeViaName(String name) {
    return 'أنماط Pro في هذه المجموعة: مجانية لك بفضل $name';
  }

  @override
  String get subscriptionsUnavailable =>
      'الاشتراكات غير متاحة حاليًا. حاول لاحقًا.';

  @override
  String get paymentPending =>
      'لا تزال دفعتك قيد المعالجة. سيتم تفعيل Pro فور اكتمالها.';

  @override
  String get purchaseFailed => 'لم تتم عملية الشراء. حاول لاحقًا.';

  @override
  String get restoreUnavailable =>
      'لا يمكن استعادة المشتريات حاليًا. حاول لاحقًا.';

  @override
  String get restoreFailed => 'تعذّرت الاستعادة. حاول لاحقًا.';

  @override
  String get welcomePro => 'مرحبًا بك في CamTrip Pro! 🎉';

  @override
  String get proRestored => 'تمت استعادة Pro';

  @override
  String get noPurchaseFound => 'لم يتم العثور على عملية شراء سابقة';

  @override
  String periodDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count يوم',
      many: '$count يومًا',
      few: '$count أيام',
      two: 'يومان',
      one: 'يوم واحد',
      zero: '$count يوم',
    );
    return '$_temp0';
  }

  @override
  String periodWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count أسبوع',
      many: '$count أسبوعًا',
      few: '$count أسابيع',
      two: 'أسبوعان',
      one: 'أسبوع واحد',
      zero: '$count أسبوع',
    );
    return '$_temp0';
  }

  @override
  String periodMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count شهر',
      many: '$count شهرًا',
      few: '$count أشهر',
      two: 'شهران',
      one: 'شهر واحد',
      zero: '$count شهر',
    );
    return '$_temp0';
  }

  @override
  String periodYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count سنة',
      many: '$count سنة',
      few: '$count سنوات',
      two: 'سنتان',
      one: 'سنة واحدة',
      zero: '$count سنة',
    );
    return '$_temp0';
  }

  @override
  String get paywallHavePro => 'لديك CamTrip Pro';

  @override
  String get paywallSubtitle => 'كل ما تحتاجه لرحلتك القادمة.';

  @override
  String paywallFeatureStyles(String styles) {
    return 'كل أنماط الكاميرا ($styles)';
  }

  @override
  String get paywallFeatureUnlimited =>
      'أعضاء ومساحة بلا حدود، وتُحفظ الصور للأبد';

  @override
  String get paywallFeatureNoWatermark => 'ملخّصات بدون علامة مائية';

  @override
  String get paywallFeatureOriginal => 'التنزيل بالجودة الأصلية';

  @override
  String get planYear => 'سنوي';

  @override
  String get planMonth => 'شهري';

  @override
  String pricePerMonth(String price) {
    return '$price شهريًا';
  }

  @override
  String paywallSaveBadge(int percent) {
    return 'وفّر $percent%';
  }

  @override
  String get planMonthCancelAnytime => 'ألغِ في أي وقت';

  @override
  String tryFree(String period) {
    return 'جرّب $period مجانًا';
  }

  @override
  String get becomePro => 'احصل على Pro';

  @override
  String get subscriptionsLoadFailed =>
      'تعذّر تحميل الاشتراكات. تحقّق من اتصالك.';

  @override
  String legalAnnual(String price) {
    return 'اشتراك CamTrip Pro السنوي: $price سنويًا.';
  }

  @override
  String legalAnnualTrial(String period, String price) {
    return 'اشتراك CamTrip Pro السنوي: $period مجانًا، ثم $price سنويًا.';
  }

  @override
  String legalMonthly(String price) {
    return 'اشتراك CamTrip Pro الشهري: $price شهريًا.';
  }

  @override
  String legalMonthlyTrial(String period, String price) {
    return 'اشتراك CamTrip Pro الشهري: $period مجانًا، ثم $price شهريًا.';
  }

  @override
  String get legalBillingApple =>
      'يتم تحصيل الدفعة من Apple ID الخاص بك. يتجدد الاشتراك تلقائيًا ما لم تلغه قبل 24 ساعة على الأقل من نهاية الفترة. يمكنك إلغاؤه وإدارته من إعدادات حسابك في App Store.';

  @override
  String get legalBillingGoogle =>
      'يتم تحصيل الدفعة من حسابك على Google. يتجدد الاشتراك تلقائيًا ما لم تلغه قبل 24 ساعة على الأقل من نهاية الفترة. يمكنك إلغاؤه وإدارته من إعدادات حسابك في Google Play.';

  @override
  String get restorePurchases => 'استعادة المشتريات';

  @override
  String get terms => 'الشروط';

  @override
  String get privacy => 'الخصوصية';

  @override
  String get groupProTitle =>
      'Pro واحد في المجموعة = Pro للجميع في تلك المجموعة';

  @override
  String get groupProBody =>
      'إذا كان لدى شخص واحد Pro، تحصل المجموعة كلها على كل أنماط الكاميرا وأعضاء بلا حدود وصور محفوظة وجودة أصلية وملخّصات بدون علامة مائية.';

  @override
  String get groupCreated => 'تم إنشاء المجموعة ✓';

  @override
  String get inviteFriends => 'ادعُ أصدقاءك';

  @override
  String get codeCopied => 'تم نسخ الرمز';

  @override
  String get shareLink => 'مشاركة الرابط';

  @override
  String inviteSubject(String groupName) {
    return 'انضم إلى $groupName على CamTrip';
  }

  @override
  String inviteMembersUnlimited(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count عضو',
      many: '$count عضوًا',
      few: '$count أعضاء',
      two: 'عضوان',
      one: 'عضو واحد',
      zero: 'لا أعضاء',
    );
    return '$_temp0 · بلا حدود (Pro)';
  }

  @override
  String inviteMembersLimit(int count, int limit) {
    return '$count من $limit أعضاء · Pro: بلا حدود';
  }

  @override
  String get toCamera => 'إلى الكاميرا';

  @override
  String get done => 'تم';

  @override
  String get joinEnterCode => 'أدخل الرمز المكوّن من 6 خانات';

  @override
  String get joinGroupTitle => 'الانضمام إلى مجموعة';

  @override
  String get joinGroupSubtitle => 'أدخل رمز أصدقائك، أو امسح رمز QR الخاص بهم.';

  @override
  String get typeCode => 'اكتب الرمز';

  @override
  String get scanQr => 'مسح QR';

  @override
  String get join => 'انضمام';

  @override
  String get groupNameRequired => 'أعطِ مجموعتك اسمًا';

  @override
  String get newGroup => 'مجموعة جديدة';

  @override
  String get groupType => 'نوع المجموعة';

  @override
  String get groupTypeVacation => 'عطلة';

  @override
  String get groupTypeVacationDescription => 'بتاريخ بداية ونهاية، ثم تُؤرشف';

  @override
  String get groupTypeEvent => 'مناسبة';

  @override
  String get groupTypeEventDescription => 'يوم أو أمسية واحدة، مثل حفلة';

  @override
  String get groupTypePermanent => 'مفتوحة دائمًا';

  @override
  String get groupTypePermanentDescription => 'لشلّة أصدقائك الدائمة';

  @override
  String get date => 'التاريخ';

  @override
  String get departure => 'المغادرة';

  @override
  String get returnDate => 'العودة';

  @override
  String get defaultCameraStyle => 'نمط الكاميرا الافتراضي';

  @override
  String freeLimitPermanent(int max) {
    return 'مجانًا: حتى $max أعضاء. بلا حدود مع Pro.';
  }

  @override
  String freeLimitDated(int max, int days) {
    return 'مجانًا: حتى $max أعضاء، وتُحفظ الصور حتى $days يومًا بعد تاريخ الانتهاء. بلا حدود وللأبد مع Pro.';
  }

  @override
  String get createGroup => 'إنشاء المجموعة';

  @override
  String get group => 'المجموعة';

  @override
  String groupCode(String code) {
    return 'الرمز $code';
  }

  @override
  String get manage => 'إدارة';

  @override
  String get rename => 'إعادة التسمية';

  @override
  String get changeDates => 'تغيير التواريخ';

  @override
  String get finishTrip => 'إنهاء الرحلة';

  @override
  String get finishTripSubtitle => 'يجعل تاريخ الانتهاء اليوم';

  @override
  String get reopenGroup => 'إعادة فتح المجموعة';

  @override
  String get closeGroup => 'إغلاق المجموعة';

  @override
  String get reopenGroupSubtitle => 'يمكن للأعضاء إضافة صور مجددًا';

  @override
  String get closeGroupSubtitle =>
      'لا يمكن لأحد إضافة صور بعد الآن؛ ويبقى كل شيء قابلًا للعرض';

  @override
  String get members => 'الأعضاء';

  @override
  String memberYou(String name) {
    return '$name (أنت)';
  }

  @override
  String get blockedTag => 'محظور';

  @override
  String get adminTag => 'مشرف';

  @override
  String removeMemberTitle(String name) {
    return 'إزالة $name؟';
  }

  @override
  String get removeMemberMessage => 'تبقى صوره في المجموعة.';

  @override
  String get remove => 'حذف';

  @override
  String get removeMember => 'إزالة';

  @override
  String blockTitle(String name) {
    return 'حظر $name؟';
  }

  @override
  String blockMessage(String name) {
    return 'لن ترى بعد الآن صور $name وفيديوهاته ولن تصلك إشعارات عنها. يمكنك التراجع عن ذلك في الإعدادات.';
  }

  @override
  String get block => 'حظر';

  @override
  String get makeMember => 'جعله عضوًا عاديًا';

  @override
  String get makeAdmin => 'جعله مشرفًا';

  @override
  String get removeFromGroup => 'إزالة من المجموعة';

  @override
  String get unblock => 'إلغاء الحظر';

  @override
  String get inviteFriendsButton => 'دعوة الأصدقاء';

  @override
  String get you => 'أنت';

  @override
  String get unarchive => 'استعادة من الأرشيف';

  @override
  String get archive => 'أرشفة';

  @override
  String get unarchiveSubtitle => 'عادت المجموعة إلى ألبوماتك';

  @override
  String archiveSubtitle(String section) {
    return 'لك فقط: تنتقل المجموعة إلى \"$section\" أسفل ألبوماتك';
  }

  @override
  String get archivedSection => 'المؤرشفة';

  @override
  String get hiddenPhotos => 'الصور المخفية';

  @override
  String get hiddenPhotosSubtitle => 'صور أخفيتها عن نفسك';

  @override
  String get leaveGroup => 'مغادرة المجموعة';

  @override
  String get leaveGroupSubtitle => 'تبقى صورك في المجموعة للآخرين';

  @override
  String get deleteGroup => 'حذف المجموعة';

  @override
  String get deleteGroupSubtitle => 'تُحذف كل الصور لدى الجميع';

  @override
  String groupArchived(String groupName) {
    return 'تمت أرشفة \"$groupName\"';
  }

  @override
  String groupUnarchived(String groupName) {
    return 'عادت \"$groupName\" إلى ألبوماتك';
  }

  @override
  String get undo => 'تراجع';

  @override
  String get groupNameTitle => 'اسم المجموعة';

  @override
  String get finishTripTitle => 'إنهاء الرحلة؟';

  @override
  String get finishTripMessage =>
      'يصبح تاريخ الانتهاء اليوم. لا يزال بإمكانك إضافة صور؛ والملخّص جاهز.';

  @override
  String get finishTripConfirm => 'إنهاء';

  @override
  String get tripFinished => 'انتهت الرحلة';

  @override
  String leaveGroupTitle(String groupName) {
    return 'مغادرة \"$groupName\"؟';
  }

  @override
  String get leaveGroupMessage =>
      'تبقى صورك في المجموعة للآخرين. يمكنك الانضمام مجددًا لاحقًا بالرمز.';

  @override
  String get leave => 'مغادرة';

  @override
  String groupDeleted(String groupName) {
    return 'تم حذف \"$groupName\"';
  }

  @override
  String get youAreAdmin => 'أنت مشرف';

  @override
  String get open => 'فتح';

  @override
  String get archiveMenuSubtitle => 'لك فقط، ولن يلاحظ الآخرون';

  @override
  String get deleteGroupMenuSubtitle => 'للجميع، مع كل الصور';

  @override
  String get deleteGroupTitle => 'حذف المجموعة؟';

  @override
  String deleteGroupMessage(int count, String groupName, int memberCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count صورة وفيديو',
      many: '$count صورة وفيديو',
      few: '$count صور وفيديوهات',
      two: 'صورتان أو فيديوهان',
      one: 'صورة أو فيديو واحد',
      zero: 'كل الصور والفيديوهات',
    );
    String _temp1 = intl.Intl.pluralLogic(
      memberCount,
      locale: localeName,
      other: 'الأعضاء الـ$memberCount',
      many: 'الأعضاء الـ$memberCount',
      few: 'الأعضاء الـ$memberCount',
      two: 'العضوين',
      one: 'العضو الوحيد',
      zero: 'كل الأعضاء',
    );
    return 'ستختفي $_temp0 في \"$groupName\" لدى $_temp1. لا يمكن التراجع عن ذلك.';
  }

  @override
  String get deleteGroupOwnRoll => 'يبقى ألبوم الكاميرا لديك دون تغيير.';

  @override
  String get deleteGroupTypeName => 'اكتب اسم المجموعة للتأكيد:';

  @override
  String get deleteForEveryone => 'حذف لدى الجميع';

  @override
  String get save => 'حفظ';

  @override
  String get yourAlbums => 'ألبوماتك';

  @override
  String get uploadQueue => 'قائمة الرفع';

  @override
  String get noConnection => 'لا يوجد اتصال';

  @override
  String get albumsOfflineMessage =>
      'ستُحمَّل ألبوماتك عند عودة الاتصال. الكاميرا تعمل كالمعتاد.';

  @override
  String get retry => 'حاول مرة أخرى';

  @override
  String get noAlbumsTitle => 'لا توجد ألبومات بعد';

  @override
  String get noAlbumsMessage =>
      'أنشئ مجموعة لرحلتك القادمة، أو انضم إلى مجموعة صديق برمزها.';

  @override
  String get haveCode => 'لديّ رمز';

  @override
  String get joinWithCode => 'الانضمام برمز أو رمز QR';

  @override
  String get camera => 'الكاميرا';

  @override
  String get restore => 'استعادة';

  @override
  String get more => 'المزيد';

  @override
  String get newAlbum => 'جديد';

  @override
  String get closedTag => 'مغلقة';

  @override
  String get activeTag => 'نشطة';

  @override
  String get uploadFailed => 'فشل الرفع';

  @override
  String get queueNoSignal => 'لا توجد إشارة.';

  @override
  String get queueNoSignalMessage =>
      'صورك موجودة في ألبومك بالفعل، وستُشارك فور عودة الاتصال.';

  @override
  String get queueWaitingForWifi => 'في انتظار Wi-Fi.';

  @override
  String queueWifiOnlyOn(String setting) {
    return 'لقد فعّلت \"$setting\".';
  }

  @override
  String get queueVideosWifiOnly => 'تُرسل الفيديوهات عبر Wi-Fi فقط.';

  @override
  String get queueAllShared => 'تمت مشاركة كل شيء ✓';

  @override
  String queuePending(String items) {
    return 'متبقٍ للمشاركة: $items';
  }

  @override
  String queuePendingBoth(String photos, String videos) {
    return 'متبقٍ للمشاركة: $photos و$videos';
  }

  @override
  String get retryUpload => 'حاول مرة أخرى';

  @override
  String get removeFromQueue => 'إزالة من القائمة';

  @override
  String get queueStatusWifi => 'Wi-Fi';

  @override
  String get queueStatusWaiting => 'في الانتظار';

  @override
  String get videosWifiOnlyTitle => 'الفيديوهات عبر Wi-Fi فقط';

  @override
  String get videosWifiOnlySubtitle => 'يوفّر بيانات الجوال';

  @override
  String get retryNow => 'حاول الآن';

  @override
  String get yourName => 'اسمك';

  @override
  String get settings => 'الإعدادات';

  @override
  String get tapToChangeName => 'اضغط لتغيير اسمك';

  @override
  String get getCamTripPro => 'احصل على CamTrip Pro';

  @override
  String get photos => 'الصور';

  @override
  String get saveOwnPhotos => 'حفظ صوري في ألبوم لكل مجموعة';

  @override
  String get autoSaveOthers => 'حفظ صور الآخرين تلقائيًا';

  @override
  String get wifiOnlyTitle => 'الرفع عبر Wi-Fi فقط';

  @override
  String get dateStamp => 'ختم التاريخ';

  @override
  String get notifications => 'الإشعارات';

  @override
  String get notifyNewPhotos => 'صور جديدة (مجمّعة)';

  @override
  String get notifyRecapReady => 'الملخّص جاهز';

  @override
  String get camTripTeam => 'فريق CamTrip';

  @override
  String get adminEntrySubtitle => 'المستخدمون ومنح Pro والبلاغات والإحصاءات';

  @override
  String get account => 'الحساب';

  @override
  String get manageSubscription => 'إدارة الاشتراك';

  @override
  String get blockedPeople => 'الأشخاص المحظورون';

  @override
  String get nobody => 'لا أحد';

  @override
  String peopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count شخص',
      many: '$count شخصًا',
      few: '$count أشخاص',
      two: 'شخصان',
      one: 'شخص واحد',
      zero: 'لا أحد',
    );
    return '$_temp0';
  }

  @override
  String get privacyPolicy => 'سياسة الخصوصية';

  @override
  String get contact => 'تواصل معنا';

  @override
  String get signOut => 'تسجيل الخروج';

  @override
  String get deleteAccount => 'حذف الحساب';

  @override
  String get deleteAccountSubtitle => 'يحذف حسابك وكل صورك';

  @override
  String get deleteAccountTitle => 'حذف الحساب؟';

  @override
  String get deleteAccountMessage =>
      'سيُحذف حسابك وكل صورك وفيديوهاتك، بما في ذلك من المجموعات. ألغِ أي اشتراك نشط في App Store أو Google Play.';

  @override
  String get blockedTitle => 'المحظورون';

  @override
  String get blockedSubtitle => 'لا ترى صور هؤلاء الأشخاص.';

  @override
  String get blockedNone => 'لم تحظر أحدًا.';

  @override
  String get unblockShort => 'إلغاء الحظر';

  @override
  String get groupGone => 'هذه المجموعة لم تعد موجودة، أو لم تعد عضوًا فيها.';

  @override
  String photosSavedToAlbum(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تم حفظ $count صورة في \"$album\"',
      many: 'تم حفظ $count صورة في \"$album\"',
      few: 'تم حفظ $count صور في \"$album\"',
      two: 'تم حفظ صورتين في \"$album\"',
      one: 'تم حفظ صورة واحدة في \"$album\"',
      zero: 'لم تُحفظ أي صورة في \"$album\"',
    );
    return '$_temp0';
  }

  @override
  String photosDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تم حذف $count صورة',
      many: 'تم حذف $count صورة',
      few: 'تم حذف $count صور',
      two: 'تم حذف صورتين',
      one: 'تم حذف صورة واحدة',
      zero: 'لم تُحذف أي صورة',
    );
    return '$_temp0';
  }

  @override
  String photosDeletedSkipped(int count, int skipped) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تم حذف $count صورة',
      many: 'تم حذف $count صورة',
      few: 'تم حذف $count صور',
      two: 'تم حذف صورتين',
      one: 'تم حذف صورة واحدة',
      zero: 'لم تُحذف أي صورة',
    );
    return '$_temp0، وتم تخطي $skipped';
  }

  @override
  String photosHiddenForYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تم إخفاء $count صورة عنك',
      many: 'تم إخفاء $count صورة عنك',
      few: 'تم إخفاء $count صور عنك',
      two: 'تم إخفاء صورتين عنك',
      one: 'تم إخفاء صورة واحدة عنك',
      zero: 'لم تُخفَ أي صورة',
    );
    return '$_temp0';
  }

  @override
  String get addedToFavorites => 'أُضيفت إلى المفضلة';

  @override
  String get removedFromFavorites => 'أُزيلت من المفضلة';

  @override
  String get photoAccessSettings =>
      'اسمح لـ CamTrip بالوصول إلى صورك من الإعدادات';

  @override
  String photosBeingAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تتم إضافة $count صورة',
      many: 'تتم إضافة $count صورة',
      few: 'تتم إضافة $count صور',
      two: 'تتم إضافة صورتين',
      one: 'تتم إضافة صورة واحدة',
      zero: 'لا تتم إضافة صور',
    );
    return '$_temp0';
  }

  @override
  String photosUnreadable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تعذّرت قراءة $count صورة',
      many: 'تعذّرت قراءة $count صورة',
      few: 'تعذّرت قراءة $count صور',
      two: 'تعذّرت قراءة صورتين',
      one: 'تعذّرت قراءة صورة واحدة',
      zero: 'قُرئت كل الصور',
    );
    return '$_temp0';
  }

  @override
  String get groupNotLoaded => 'لم يتم تحميل المجموعة';

  @override
  String get noFavoritesTitle => 'لا توجد مفضلات بعد';

  @override
  String get noPhotosTitle => 'لا توجد صور بعد';

  @override
  String get noFavoritesMessage => 'اضغط على النجمة في صورة لوضعها هنا.';

  @override
  String get noPhotosMessage =>
      'التقط الصورة الأولى. سيراها الجميع في المجموعة فورًا.';

  @override
  String get openCamera => 'فتح الكاميرا';

  @override
  String savingProgress(int done, int total) {
    return 'جارٍ الحفظ... $done/$total';
  }

  @override
  String get sharePreparing => 'جارٍ التحضير...';

  @override
  String sharingProgress(int done, int total) {
    return 'جارٍ التحضير... $done/$total';
  }

  @override
  String get choosePhotos => 'اختيار الصور';

  @override
  String selectedCount(int count) {
    return 'تم تحديد $count';
  }

  @override
  String get selectNone => 'إلغاء التحديد';

  @override
  String get selectAll => 'تحديد الكل';

  @override
  String photosWaitingToShare(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count صورة بانتظار المشاركة',
      many: '$count صورة بانتظار المشاركة',
      few: '$count صور بانتظار المشاركة',
      two: 'صورتان بانتظار المشاركة',
      one: 'صورة واحدة بانتظار المشاركة',
      zero: 'لا صور بانتظار المشاركة',
    );
    return '$_temp0';
  }

  @override
  String get recapReadyTitle => 'ملخّصك جاهز';

  @override
  String get recapReadySubtitle => 'فيديو بموسيقى من رحلتك';

  @override
  String get watch => 'مشاهدة';

  @override
  String get makeRecapNow => 'اصنع فيديو ملخّص الآن';

  @override
  String freeGroupDeleteNotice(String date) {
    return 'مجموعة مجانية: تُحفظ الصور حتى $date. احفظها أو احصل على Pro.';
  }

  @override
  String get filterAll => 'الكل';

  @override
  String get filterFavorites => 'المفضلة';

  @override
  String get filterPerPerson => 'حسب الشخص';

  @override
  String get filterPerson => 'الشخص';

  @override
  String get select => 'تحديد';

  @override
  String get hiddenFilter => 'المخفية';

  @override
  String get photosBy => 'صور من...';

  @override
  String get uploadedTag => 'تم الرفع';

  @override
  String get saveAll => 'حفظ الكل';

  @override
  String get favorite => 'مفضلة';

  @override
  String get unfavorite => 'إزالة من المفضلة';

  @override
  String get hide => 'إخفاء';

  @override
  String get delete => 'حذف';

  @override
  String deletePhotosTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'حذف $count صورة؟',
      many: 'حذف $count صورة؟',
      few: 'حذف $count صور؟',
      two: 'حذف الصورتين؟',
      one: 'حذف الصورة؟',
      zero: 'حذف الصور؟',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ستختفي لدى الجميع في المجموعة. لا يمكن التراجع عن ذلك.',
      one: 'ستختفي لدى الجميع في المجموعة. لا يمكن التراجع عن ذلك.',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosNotAllowed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count صورة تخص شخصًا آخر. ستبقى؛ يمكن للمشرف فقط حذفها.',
      many: '$count صورة تخص شخصًا آخر. ستبقى؛ يمكن للمشرف فقط حذفها.',
      few: '$count صور تخص شخصًا آخر. ستبقى؛ يمكن للمشرف فقط حذفها.',
      two: 'صورتان تخصان شخصًا آخر. ستبقيان؛ يمكن للمشرف فقط حذفهما.',
      one: 'صورة واحدة تخص شخصًا آخر. ستبقى؛ يمكن للمشرف فقط حذفها.',
      zero: 'لا توجد صور لأشخاص آخرين.',
    );
    return '$_temp0';
  }

  @override
  String photosBackInGroup(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'عادت $count صورة إلى المجموعة',
      many: 'عادت $count صورة إلى المجموعة',
      few: 'عادت $count صور إلى المجموعة',
      two: 'عادت صورتان إلى المجموعة',
      one: 'عادت صورة واحدة إلى المجموعة',
      zero: 'لم تعد أي صورة',
    );
    return '$_temp0';
  }

  @override
  String get showAll => 'عرض الكل';

  @override
  String get hiddenPhotosExplainer =>
      'أنت وحدك لم تعد ترى هذه الصور. أما الآخرون في المجموعة فلا تزال موجودة لديهم.';

  @override
  String get nothingHidden => 'لا شيء مخفي';

  @override
  String get nothingHiddenMessage => 'ستظهر هنا الصور التي تخفيها.';

  @override
  String showAgainCount(int count) {
    return 'إظهار مجددًا ($count)';
  }

  @override
  String get someone => 'شخص ما';

  @override
  String get savedToAlbum => 'تم الحفظ في ألبوم الصور';

  @override
  String get share => 'مشاركة';

  @override
  String get shareFailed => 'تعذّرت المشاركة';

  @override
  String get reportTitle => 'لماذا تبلغ عن هذه الصورة؟';

  @override
  String get reportSubtitle =>
      'نراجع كل بلاغ خلال 24 ساعة. تُخفى الصورة عنك فورًا.';

  @override
  String get reportThanks => 'شكرًا، سنراجع الأمر';

  @override
  String blockMessageAllGroups(String name) {
    return 'لن ترى بعد الآن صور $name وفيديوهاته في أي مجموعة ولن تصلك إشعارات عنها. يمكنك التراجع عن ذلك في الإعدادات.';
  }

  @override
  String userBlocked(String name) {
    return 'تم حظر $name';
  }

  @override
  String get videoHiddenForYou => 'تم إخفاء الفيديو عنك';

  @override
  String get photoHiddenForYou => 'تم إخفاء الصورة عنك';

  @override
  String get setAsCover => 'تعيين كغلاف';

  @override
  String get coverUpdated => 'تم تحديث صورة الغلاف';

  @override
  String get hideForMe => 'إخفاء عني';

  @override
  String get hideForMeSubtitle => 'لا يزال الآخرون في المجموعة يرونها';

  @override
  String get reportPhoto => 'الإبلاغ عن الصورة';

  @override
  String blockName(String name) {
    return 'حظر $name';
  }

  @override
  String get forEveryoneInGroup => 'لدى الجميع في المجموعة';

  @override
  String get videoDeleted => 'تم حذف الفيديو';

  @override
  String get photoDeleted => 'تم حذف الصورة';

  @override
  String get photoAccessToSave =>
      'اسمح لـ CamTrip بالوصول إلى صورك من الإعدادات لحفظها';

  @override
  String get phoneFull => 'ذاكرة هاتفك ممتلئة';

  @override
  String get albumSaveFailedShort => 'تعذّر الحفظ في الألبوم';

  @override
  String get recapTemplateGoldenHour => 'الساعة الذهبية';

  @override
  String get recapTemplateFast => 'سريع';

  @override
  String get recapTemplateFilmRoll => 'بكرة فيلم';

  @override
  String get recapTemplatePolaroid => 'بولارويد';

  @override
  String get trackSummerEvening => 'أمسية صيفية';

  @override
  String get trackGoldenHour => 'الساعة الذهبية';

  @override
  String get trackRoadtrip => 'رحلة برية';

  @override
  String get moodWarm => 'دافئ';

  @override
  String get moodCheerful => 'مبهج';

  @override
  String friendsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count صديق',
      many: '$count صديقًا',
      few: '$count أصدقاء',
      two: 'صديقان',
      one: 'صديق واحد',
      zero: 'لا أصدقاء',
    );
    return '$_temp0';
  }

  @override
  String get madeWithCamTrip => 'صُنع باستخدام CamTrip';

  @override
  String get tagline => 'فيلم واحد للمجموعة كلها';

  @override
  String get videoUnsupportedDevice => 'تعذّر إنشاء الفيديو على هذا الجهاز';

  @override
  String get groupLoadFailed => 'تعذّر تحميل هذه المجموعة.';

  @override
  String recapNeedsPhotos(int count) {
    return 'تحتاج إلى $count صور على الأقل لصنع ملخّص.';
  }

  @override
  String get recapFailed => 'تعذّر إنشاء الملخّص. حاول مرة أخرى.';

  @override
  String get recapSaved => 'تم حفظ الملخّص في ألبوم الصور';

  @override
  String get recap => 'الملخّص';

  @override
  String get recapRendering => 'جارٍ إنشاء الملخّص...';

  @override
  String get videoRendering => 'جارٍ إنشاء الفيديو...';

  @override
  String get template => 'القالب';

  @override
  String get musicLicense => 'موسيقى CamTrip الخاصة · بلا حقوق ملكية';

  @override
  String get change => 'تغيير';

  @override
  String get noWatermark => 'بدون علامة مائية ✓';

  @override
  String get removeWatermarkPro => 'أزل العلامة المائية مع Pro';

  @override
  String get proSourceSubscription => 'اشتراك';

  @override
  String get proSourceGift => 'هدية';

  @override
  String get proSourceAdmin => 'مشرف';

  @override
  String get proSourceGroup => 'عبر المجموعة';

  @override
  String get noPro => 'بدون Pro';

  @override
  String proStatusNoEnd(String source) {
    return 'Pro ($source)، بدون تاريخ انتهاء';
  }

  @override
  String proStatusUntil(String source, String date) {
    return 'Pro ($source)، حتى $date';
  }

  @override
  String get lifetime => 'مدى الحياة';

  @override
  String get pickDate => 'اختر تاريخًا';

  @override
  String get noAccess => 'لا يوجد وصول';

  @override
  String get adminOnlyTeam => 'الإدارة لفريق CamTrip فقط.';

  @override
  String get adminOverview => 'نظرة عامة';

  @override
  String get adminUsers => 'المستخدمون';

  @override
  String get adminReports => 'البلاغات';

  @override
  String adminsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count مشرف',
      many: '$count مشرفًا',
      few: '$count مشرفين',
      two: 'مشرفان',
      one: 'مشرف واحد',
      zero: 'لا مشرفين',
    );
    return '$_temp0';
  }

  @override
  String get adminNewThisWeek => 'جديد هذا الأسبوع';

  @override
  String get adminGroups => 'المجموعات';

  @override
  String get adminProSubscription => 'Pro عبر الاشتراك';

  @override
  String get adminProGift => 'Pro كهدية';

  @override
  String adminWithoutSubscription(int count) {
    return '$count بدون اشتراك';
  }

  @override
  String get adminOpenReports => 'البلاغات المفتوحة';

  @override
  String get adminSearchHint => 'ابحث بالاسم أو البريد الإلكتروني';

  @override
  String get nobodyFound => 'لم يتم العثور على أحد';

  @override
  String get loadMore => 'تحميل المزيد';

  @override
  String get noEmail => 'لا يوجد بريد إلكتروني';

  @override
  String adminDeletePhotoMessage(String groupName) {
    return 'تختفي الصورة لدى الجميع في \"$groupName\". وتُغلق كل البلاغات عن هذه الصورة.';
  }

  @override
  String get adminBanMessage =>
      'لن يتمكن هذا الحساب من تسجيل الدخول أو استخدام التطبيق. يمكنك التراجع عن ذلك لاحقًا.';

  @override
  String get adminDismissTitle => 'رفض البلاغ؟';

  @override
  String get adminDismissMessage => 'تبقى الصورة. ويُعلَّم البلاغ كمُعالَج.';

  @override
  String get adminDismiss => 'رفض';

  @override
  String get adminAccountBlocked => 'تم حظر الحساب';

  @override
  String get adminReportDismissed => 'تم رفض البلاغ';

  @override
  String get adminNoReports => 'لا توجد بلاغات مفتوحة';

  @override
  String get adminNoReportsMessage => 'تظهر هنا الصور المُبلَّغ عنها.';

  @override
  String get deletedTag => 'محذوف';

  @override
  String adminReportedBy(String name) {
    return 'من $name';
  }

  @override
  String adminPhotoBy(String name) {
    return 'صورة من $name';
  }

  @override
  String reportsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count بلاغ',
      many: '$count بلاغًا',
      few: '$count بلاغات',
      two: 'بلاغان',
      one: 'بلاغ واحد',
      zero: 'لا بلاغات',
    );
    return '$_temp0';
  }

  @override
  String get adminDeletePhoto => 'حذف الصورة';

  @override
  String get adminBlockCreator => 'حظر الملتقِط';

  @override
  String get loadFailed => 'تعذّر التحميل';

  @override
  String get adminLifetimeProGiven => 'تم منح Pro مدى الحياة';

  @override
  String get adminProGiven => 'تم منح Pro';

  @override
  String adminGiveProUntil(String date) {
    return 'منح Pro حتى $date';
  }

  @override
  String get adminGiveProLifetime => 'منح Pro مدى الحياة';

  @override
  String adminGiveProFor(String period) {
    return 'منح Pro لمدة $period';
  }

  @override
  String get adminReasonHint => 'السبب، مثل صديق أو مختبِر أو مؤثّر';

  @override
  String get adminGivePro => 'منح Pro';

  @override
  String get adminRevokeTitle => 'سحب الهدية؟';

  @override
  String get adminRevokeMessage =>
      'يتوقف Pro المُهدى فورًا. ويستمر اشتراكه الخاص.';

  @override
  String get adminRevoke => 'سحب';

  @override
  String get adminGiftRevoked => 'تم سحب الهدية';

  @override
  String get adminUnbanTitle => 'رفع الحظر؟';

  @override
  String adminUnbanMessage(String name) {
    return 'يمكن لـ $name تسجيل الدخول مجددًا.';
  }

  @override
  String get adminUnbanned => 'تم رفع الحظر';

  @override
  String get adminBanUserMessage =>
      'لن يتمكن هذا الحساب من تسجيل الدخول أو استخدام التطبيق. تبقى الصور.';

  @override
  String get adminUser => 'المستخدم';

  @override
  String get adminNotVerified => 'غير مؤكَّد';

  @override
  String get adminRole => 'الدور';

  @override
  String get adminCreated => 'تاريخ الإنشاء';

  @override
  String get unknown => 'غير معروف';

  @override
  String get adminSignInWith => 'يسجّل الدخول عبر';

  @override
  String get adminEmailMethod => 'البريد الإلكتروني';

  @override
  String get adminPhotosAndVideos => 'الصور والفيديوهات';

  @override
  String get adminStatus => 'الحالة';

  @override
  String get adminActive => 'نشط';

  @override
  String adminActiveUntil(String date) {
    return 'نشط حتى $date';
  }

  @override
  String adminGiftFrom(String name) {
    return 'هدية من $name';
  }

  @override
  String adminExpiredOn(String date) {
    return 'انتهى في $date';
  }

  @override
  String get adminExpired => 'منتهٍ';

  @override
  String adminUntil(String date) {
    return 'حتى $date';
  }

  @override
  String get adminGiveProTitle => 'منح Pro';

  @override
  String get adminGiveProNote =>
      'يسري أيضًا على مجموعات هذا الشخص: Pro واحد في المجموعة = Pro للجميع في تلك المجموعة.';

  @override
  String get adminRevokeGift => 'سحب الهدية';

  @override
  String get adminModeration => 'الإشراف';

  @override
  String get adminCannotBanSelf => 'لا يمكنك حظر نفسك.';

  @override
  String get adminCannotBanAdmin => 'لا يمكن حظر مشرف.';

  @override
  String get adminUnban => 'رفع الحظر';

  @override
  String get adminBanAccount => 'حظر الحساب';

  @override
  String get googleSignInUnavailable => 'تسجيل الدخول عبر Google غير متاح بعد';

  @override
  String get cameraPickerTitle => 'اختر كاميرتك';

  @override
  String get cameraPickerSubtitle => 'كل كاميرا تمنح صورك طابعًا خاصًا';

  @override
  String get cameraPickerChange => 'تبديل الكاميرا';

  @override
  String get cameraPickerUnlock => 'افتح مع Pro';

  @override
  String get cameraPickerSelected => 'محددة';

  @override
  String get cameraPickerStyleSummer => 'صيف';

  @override
  String get cameraPickerStyleSummerDescription =>
      'ألوان دافئة باهتة كلقطة من التسعينيات';

  @override
  String get cameraPickerStyleNight => 'ليل 800';

  @override
  String get cameraPickerStyleNightDescription =>
      'فيلم سينمائي: ظلال فيروزية وضوء دافئ وحبيبات كثيرة';

  @override
  String get cameraPickerStyleSepia => 'سيبيا';

  @override
  String get cameraPickerStyleSepiaDescription =>
      'صورة بنية قديمة من علبة الأحذية';

  @override
  String get cameraPickerStyleLomo => 'لومو';

  @override
  String get cameraPickerStyleLomoDescription =>
      'ألوان جريئة وزوايا داكنة وصبغة لونية جامحة';

  @override
  String get cameraPickerStyleMint => 'نعناع';

  @override
  String get cameraPickerStyleMintDescription => 'ناعم ومنعش بلمسة خضراء';

  @override
  String get cameraPickerStylePastel => 'وردي';

  @override
  String get cameraPickerStylePastelDescription =>
      'ألوان باستيل بتوهج وردي وإطار أبيض';

  @override
  String get cameraPickerStyleSuper8 => 'سوبر 8';

  @override
  String get cameraPickerStyleSuper8Description =>
      'محبّب وناعم، كفيلم عائلي قديم';

  @override
  String get paywallBenefitGroup => 'Pro واحد = Pro للمجموعة كلها';

  @override
  String get paywallBenefitUnlimited => 'أعضاء بلا حدود، وتُحفظ الصور للأبد';

  @override
  String get paywallBenefitQuality => 'بدون علامة مائية، بالجودة الأصلية';

  @override
  String paywallFreeTrial(String period) {
    return '$period مجانًا';
  }

  @override
  String paywallPriceYear(String price) {
    return '$price سنويًا.';
  }

  @override
  String paywallPriceYearTrial(String period, String price) {
    return '$period مجانًا، ثم $price سنويًا.';
  }

  @override
  String paywallPriceMonth(String price) {
    return '$price شهريًا.';
  }

  @override
  String paywallPriceMonthTrial(String period, String price) {
    return '$period مجانًا، ثم $price شهريًا.';
  }

  @override
  String paywallAutoRenew(String store) {
    return 'يتجدد تلقائيًا. ألغِ قبل 24 ساعة على الأقل من التجديد في $store.';
  }

  @override
  String get paywallDetailsTitle => 'كل ما في Pro';

  @override
  String get paywallBenefitStyles => 'كل أنماط الكاميرا';

  @override
  String get allPhotosTitle => 'كل الصور';

  @override
  String get homeTabAlbums => 'الألبومات';

  @override
  String get allPhotosEmptyTitle => 'لا توجد صور بعد';

  @override
  String get allPhotosEmptyMessage => 'افتح الكاميرا والتقط صورتك الأولى.';

  @override
  String get allPhotosLoadFailed => 'تعذّر تحميل صورك';

  @override
  String get cameraSettingsTitle => 'إعدادات الكاميرا';

  @override
  String get cameraSettingsMore => 'إعدادات أخرى';

  @override
  String get cameraSettingsGrid => 'الشبكة';

  @override
  String get cameraSettingsHaptics => 'الاهتزاز عند التصوير';

  @override
  String get cameraSettingsDateStamp => 'التاريخ أسفل اليمين';

  @override
  String get cameraSettingsSound => 'صوت الغالق';

  @override
  String get cameraSettingsSoundHint =>
      'صامت عندما يكون الهاتف على الوضع الصامت';

  @override
  String get cameraSettingsTimer => 'المؤقّت الذاتي';

  @override
  String get cameraSettingsTimerOff => 'إيقاف';

  @override
  String cameraSettingsTimerSeconds(int seconds) {
    return '$seconds ث';
  }

  @override
  String get cameraSettingsTimerCancelHint => 'اضغط على الغالق للإلغاء';

  @override
  String get cameraSettingsMirror => 'عكس صور السيلفي';

  @override
  String get cameraSettingsSaveToRoll => 'الحفظ في ألبوم الكاميرا';

  @override
  String get cameraSettingsQuality => 'الجودة';

  @override
  String get cameraSettingsQualityStandard => 'عادية';

  @override
  String get cameraSettingsQualityHigh => 'عالية';

  @override
  String get cameraLowLightHint => 'إضاءة منخفضة - شغّل الفلاش';

  @override
  String get cameraFlashUnavailable => 'لا يوجد فلاش في هذه الكاميرا';

  @override
  String get cameraFlashScreen => 'فلاش الشاشة';

  @override
  String get cameraFlashCycleHint =>
      'اضغط للتبديل بين الإيقاف والتشغيل والتلقائي';

  @override
  String get cameraFlip => 'التبديل بين الكاميرا الأمامية والخلفية';

  @override
  String get cameraFlipHint => 'اضغط مرتين على العدسة لقلب الكاميرا';

  @override
  String cameraPickerPaywallStyles(int count, String styles) {
    return 'كل الكاميرات ($count)، بما فيها $styles';
  }

  @override
  String get styleFlash => 'فلاش 400';

  @override
  String get styleFlashDescription =>
      'فلاش مباشر على فيلم دافئ: توهج كهرماني وحبيبات وأحمر غني';

  @override
  String cameraTimerButton(String state) {
    return 'المؤقّت الذاتي: $state';
  }

  @override
  String get cameraTimerCycleHint => 'اضغط للتبديل بين الإيقاف و3 ث و10 ث';

  @override
  String get cameraLastShotOpen => 'أحدث صورة، يفتح الألبوم';

  @override
  String get cameraLastShotEmpty => 'لا توجد صور بعد، يفتح الألبوم';

  @override
  String get deleteOnlyOwnOrAdmin => 'يمكن لملتقط الصورة أو المشرف فقط حذفها';

  @override
  String get videoPlay => 'تشغيل';

  @override
  String get videoPause => 'إيقاف مؤقت';

  @override
  String get language => 'اللغة';

  @override
  String get languageSystem => 'لغة النظام';

  @override
  String languageSystemCurrent(String language) {
    return 'النظام ($language)';
  }

  @override
  String get languageSearchHint => 'ابحث عن لغة';

  @override
  String get languageNoResults => 'لم يتم العثور على لغة';

  @override
  String get personalRollTitle => 'فيلمي';

  @override
  String get personalRollSubtitle => 'لك وحدك';

  @override
  String get personalRollPickerSubtitle => 'صور متفرقة، لك وحدك';

  @override
  String get personalRollMove => 'إلى ألبوم';

  @override
  String get personalRollMoveTitle => 'نقل إلى ألبوم';

  @override
  String get personalRollMoveNoAlbums =>
      'أنشئ ألبومًا أولًا أو انضم إلى ألبوم برمز.';

  @override
  String personalRollMoved(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تم نقل $count صور إلى $album',
      one: 'تم نقل صورة واحدة إلى $album',
    );
    return '$_temp0';
  }

  @override
  String get personalRollPrivateNote =>
      'أنت وحدك ترى هذه الصور. انقلها إلى ألبوم لمشاركتها.';

  @override
  String get paywallTripPassSub => 'لهذه الرحلة فقط، للمجموعة كلها';

  @override
  String get paywallOneTime => 'مرة واحدة';

  @override
  String get paywallBestValue => 'الأوفر';

  @override
  String paywallRollFullTitle(int used, int limit) {
    return 'امتلأ فيلمك - $used/$limit صورة';
  }

  @override
  String get paywallRollFullSub => 'واصل التصوير مع Trip Pass أو Pro.';

  @override
  String get paywallCameraTitle => 'هذه الكاميرا جزء من Pro';

  @override
  String paywallCameraSub(int count) {
    return 'افتح كل الكاميرات ($count).';
  }

  @override
  String get paywallWatermarkTitle => 'ملخّص بدون علامة مائية';

  @override
  String get paywallWatermarkSub => 'شارك ملخّصك بدون شعار CamTrip.';

  @override
  String get paywallDeletionTitle => 'احتفظ برحلتك';

  @override
  String paywallDeletionSub(String date) {
    return 'تُحذف الرحلات المجانية في $date. مع Trip Pass أو Pro تبقى للأبد.';
  }

  @override
  String paywallTripPassTerms(String price) {
    return 'شراء لمرة واحدة بسعر $price لهذه الرحلة. ليس اشتراكًا.';
  }

  @override
  String get buyTripPass => 'احصل على Trip Pass';

  @override
  String get tripPassActive => 'Trip Pass نشط: هذه الرحلة Pro للجميع';

  @override
  String get tripPassActivating =>
      'تم استلام الدفعة. سيُفعَّل Trip Pass خلال لحظات.';

  @override
  String proViaTripPass(String name) {
    return 'Trip Pass من $name';
  }

  @override
  String rollCounterSemantics(int used, int limit) {
    return '$used من $limit لقطة على فيلمك';
  }

  @override
  String rollHeldTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count صورة لا تتسع على فيلمك',
      many: '$count صورة لا تتسع على فيلمك',
      few: '$count صور لا تتسع على فيلمك',
      two: 'صورتان لا تتسعان على فيلمك',
      one: 'صورة واحدة لا تتسع على فيلمك',
      zero: 'كل الصور على الفيلم',
    );
    return '$_temp0';
  }

  @override
  String get rollHeldBody => 'احتفظ بها مع Pro أو Trip Pass';

  @override
  String deletionBannerTitle(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'احتفظ برحلتك - بقي $days يوم',
      many: 'احتفظ برحلتك - بقي $days يومًا',
      few: 'احتفظ برحلتك - بقي $days أيام',
      two: 'احتفظ برحلتك - بقي يومان',
      one: 'احتفظ برحلتك - بقي يوم واحد',
      zero: 'احتفظ برحلتك - اليوم الأخير',
    );
    return '$_temp0';
  }

  @override
  String get deletionBannerBody =>
      'تُحذف الرحلات المجانية بعد 30 يومًا من انتهائها. مع Trip Pass أو Pro تبقى للأبد.';

  @override
  String apiRollFull(int limit) {
    return 'امتلأ فيلمك ($limit لقطة). احصل على Trip Pass أو Pro لمواصلة التصوير.';
  }

  @override
  String get apiTripPassFailed =>
      'تعذّر تفعيل Trip Pass. تواصل مع support@camtrip.app.';

  @override
  String get apiTripPassExists => 'لهذه الرحلة Trip Pass بالفعل.';

  @override
  String get tripPassUnavailable => 'Trip Pass غير متاح حاليًا. حاول لاحقًا.';

  @override
  String get tripMapTitle => 'خريطة الرحلة';

  @override
  String get tripMapOpen => 'الخريطة والإحصاءات';

  @override
  String get tripMapLoadFailed => 'تعذّر تحميل خريطة الرحلة';

  @override
  String get tripMapStatDays => 'الأيام';

  @override
  String get tripMapStatPhotos => 'الصور';

  @override
  String get tripMapStatVideos => 'الفيديوهات';

  @override
  String get tripMapStatMembers => 'الأعضاء';

  @override
  String get tripMapStatDistance => 'كم مقطوعة';

  @override
  String get tripMapStatCountries => 'الدول';

  @override
  String get tripMapStatPlaces => 'الأماكن';

  @override
  String tripMapBusiestDay(String day, int count) {
    return 'أكثر الصور في $day ($count)';
  }

  @override
  String tripMapTopPhotographer(String name, int count) {
    return 'أفضل مصوّر: $name ($count)';
  }

  @override
  String get tripMapOffTitle => 'خريطة الرحلة متوقفة';

  @override
  String get tripMapOffMessage =>
      'يمكن لمشرف المجموعة تشغيل خريطة الرحلة من إعدادات المجموعة. الإحصاءات تظهر لك دائمًا.';

  @override
  String get tripMapOffMessageAdmin =>
      'شغّل خريطة الرحلة لترى أين التُقطت صوركم. يقرر كل شخص بنفسه إن كان سيشارك.';

  @override
  String get tripMapEnable => 'تشغيل خريطة الرحلة';

  @override
  String get tripMapEmptyTitle => 'لا أماكن على الخريطة بعد';

  @override
  String get tripMapEmptyMessage =>
      'تظهر هنا الصور الجديدة من الأعضاء الذين يشاركون موقعهم، مقرّبة إلى نحو 100 م.';

  @override
  String get tripMapConsentTitle => 'خريطة الرحلة';

  @override
  String get tripMapConsentQuestion =>
      'هل تشارك أماكن التقاط صورك على خريطة رحلة هذه المجموعة؟';

  @override
  String get tripMapConsentDetail =>
      'يراها أعضاء المجموعة فقط، مقرّبة إلى نحو 100 م. لا يُحفظ الموقع داخل الصورة نفسها أبدًا، ويمكنك إيقاف ذلك في أي وقت من إعدادات المجموعة.';

  @override
  String get tripMapConsentYes => 'نعم، شارك';

  @override
  String get tripMapConsentNo => 'لا';

  @override
  String get tripMapLocationDenied =>
      'لا يوجد وصول إلى موقعك. يمكنك السماح به من إعدادات هاتفك.';

  @override
  String get tripMapSettingSubtitle =>
      'عرض أماكن التقاط الصور على خريطة. يقرر الأعضاء بأنفسهم إن كانوا سيشاركون.';

  @override
  String get tripMapDisableTitle => 'إيقاف خريطة الرحلة؟';

  @override
  String get tripMapDisableMessage =>
      'تُحذف كل المواقع في هذه المجموعة. إذا شغّلت الخريطة لاحقًا، سيُسأل الجميع مجددًا.';

  @override
  String get tripMapDisable => 'إيقاف';

  @override
  String get tripMapMySharing => 'مشاركة موقعي';

  @override
  String get tripMapMySharingOn =>
      'تظهر صورك الجديدة على خريطة الرحلة (مقرّبة إلى نحو 100 م).';

  @override
  String get tripMapMySharingOff => 'متوقف. لا تظهر صورك على الخريطة.';

  @override
  String get tripMapStopSharingTitle => 'إيقاف مشاركة موقعك؟';

  @override
  String get tripMapStopSharingMessage =>
      'تُحذف مواقع كل صورك في هذه المجموعة.';

  @override
  String get tripMapStopSharing => 'إيقاف المشاركة';
}
