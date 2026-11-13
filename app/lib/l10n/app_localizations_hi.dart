// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get cancel => 'रद्द करें';

  @override
  String get yes => 'हाँ';

  @override
  String inviteMessageIntro(String groupName) {
    return 'CamTrip पर \"$groupName\" से जुड़ेंगे? फिर हम एक-दूसरे की फ़ोटो तुरंत देख पाएँगे।';
  }

  @override
  String inviteMessageCode(String code) {
    return 'या कोड डालें: $code';
  }

  @override
  String get memberFallbackName => 'दोस्त';

  @override
  String get reportReasonInappropriate => 'अनुचित या आपत्तिजनक';

  @override
  String get reportReasonSpam => 'स्पैम';

  @override
  String get reportReasonOther => 'कुछ और';

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
  String get errorOffline => 'कनेक्शन नहीं है। थोड़ी देर में फिर कोशिश करें।';

  @override
  String errorSomethingWrongStatus(int status) {
    return 'कुछ गड़बड़ हो गई ($status)';
  }

  @override
  String get errorSomethingWrong => 'कुछ गड़बड़ हो गई';

  @override
  String get apiInvalidCredentials => 'ईमेल पता या पासवर्ड गलत है';

  @override
  String get apiInvalidCode =>
      'यह कोड गलत है या इसकी समय-सीमा खत्म हो गई है। नया कोड मँगाएँ।';

  @override
  String get apiEmailTaken =>
      'इस ईमेल पते से एक खाता पहले से है। साइन इन करें, या \"पासवर्ड भूल गए?\" चुनें।';

  @override
  String apiEmailTakenProvider(String provider) {
    return 'इस ईमेल पते से एक खाता पहले से है। $provider से साइन इन करें।';
  }

  @override
  String apiWeakPassword(int min) {
    return 'कम से कम $min अक्षरों का पासवर्ड चुनें';
  }

  @override
  String apiNameTooLong(int max) {
    return 'आपका नाम ज़्यादा से ज़्यादा $max अक्षरों का हो सकता है';
  }

  @override
  String get apiRateLimited =>
      'बहुत ज़्यादा कोशिशें। 15 मिनट बाद फिर कोशिश करें।';

  @override
  String apiAccountBanned(String email) {
    return 'आपका खाता ब्लॉक कर दिया गया है। अगर आपको लगता है कि यह गलती है, तो $email पर संपर्क करें।';
  }

  @override
  String get apiProRequired => 'यह कैमरा स्टाइल CamTrip Pro का हिस्सा है';

  @override
  String get apiGroupClosed => 'यह ग्रुप बंद हो चुका है';

  @override
  String get apiGroupCodeNotFound => 'इस कोड से कोई ग्रुप नहीं मिला';

  @override
  String apiGroupFull(int max) {
    return 'यह ग्रुप भर गया है (अधिकतम $max सदस्य)। अगर किसी एक सदस्य के पास CamTrip Pro है, तो कोई भी जुड़ सकता है।';
  }

  @override
  String get apiLastMember => 'आप आखिरी सदस्य हैं। इसकी बजाय ग्रुप हटा दें।';

  @override
  String get apiAdminRequired => 'सिर्फ़ CamTrip एडमिनिस्ट्रेटर के लिए';

  @override
  String get apiUploadIncomplete => 'अपलोड पूरा नहीं हुआ';

  @override
  String get apiInvalidInput => 'अमान्य इनपुट';

  @override
  String get apiNotSignedIn => 'साइन इन नहीं है';

  @override
  String get apiAccountGone => 'यह खाता अब मौजूद नहीं है';

  @override
  String get apiPhotoNotFound => 'फ़ोटो नहीं मिली';

  @override
  String get apiGroupNotFound => 'ग्रुप नहीं मिला';

  @override
  String get apiMemberNotFound => 'सदस्य नहीं मिला';

  @override
  String get apiPersonNotFound => 'व्यक्ति नहीं मिला';

  @override
  String get apiUserNotFound => 'यूज़र नहीं मिला';

  @override
  String get apiAdminOnly => 'यह सिर्फ़ एडमिन कर सकता है';

  @override
  String get apiCannotBlockSelf => 'आप खुद को ब्लॉक नहीं कर सकते';

  @override
  String get apiCannotReportOwn => 'आप अपनी फ़ोटो की रिपोर्ट नहीं कर सकते';

  @override
  String get apiDeleteOwnOnly => 'आप सिर्फ़ अपनी फ़ोटो हटा सकते हैं';

  @override
  String get apiOwnerCannotBeRemoved =>
      'ग्रुप बनाने वाले को हटाया नहीं जा सकता';

  @override
  String get apiOwnerStaysAdmin => 'ग्रुप बनाने वाला हमेशा एडमिन रहता है';

  @override
  String get apiNeedsOneAdmin => 'ग्रुप में कम से कम एक एडमिन होना चाहिए';

  @override
  String get apiEndBeforeStart =>
      'खत्म होने की तारीख शुरू होने की तारीख से पहले है';

  @override
  String get apiPermanentNoEndDate =>
      'हमेशा खुले रहने वाले ग्रुप की कोई आखिरी तारीख नहीं होती';

  @override
  String get apiCannotBanAdmin => 'एडमिनिस्ट्रेटर को ब्लॉक नहीं किया जा सकता';

  @override
  String get apiReportNotFound => 'रिपोर्ट नहीं मिली';

  @override
  String get apiPhotoOwnerUnknown => 'यह फ़ोटो किसने ली, अब पता नहीं है';

  @override
  String get validationNameRequired => 'अपना नाम डालें';

  @override
  String validationMaxChars(int max) {
    return 'ज़्यादा से ज़्यादा $max अक्षर';
  }

  @override
  String get validationEmailRequired => 'अपना ईमेल पता डालें';

  @override
  String get validationEmailInvalid => 'यह ईमेल पता मान्य नहीं है';

  @override
  String get validationPasswordRequired => 'पासवर्ड चुनें';

  @override
  String validationMinChars(int min) {
    return 'कम से कम $min अक्षर';
  }

  @override
  String get validationPasswordTooLong => 'यह पासवर्ड बहुत लंबा है';

  @override
  String get validationPasswordEmpty => 'अपना पासवर्ड डालें';

  @override
  String get validationCodeRequired => 'ईमेल में आया कोड डालें';

  @override
  String get validationCodeDigits => 'कोड 6 अंकों का है';

  @override
  String get onboarding1Title => 'पूरे ग्रुप के लिए\nएक रोल।';

  @override
  String get onboarding1Body =>
      'रेट्रो कैमरे से फ़ोटो लें। सबको आपकी फ़ोटो तुरंत दिखती हैं, और वे आपके अपने एल्बम में भी आ जाती हैं।';

  @override
  String get onboarding2Title => 'अब फ़ोटो\nभेजने का झंझट नहीं।';

  @override
  String get onboarding2Body =>
      'ग्रुप बनाएँ, कोड शेयर करें, बस। फिर कभी \"वो फ़ोटो भेज दोगे?\" नहीं।';

  @override
  String get onboarding3Title => 'बाद में एक\nरीकैप वीडियो।';

  @override
  String get onboarding3Body =>
      'CamTrip आपके सबसे अच्छे पलों से म्यूज़िक वाला वीडियो बनाता है।';

  @override
  String get onboardingInvited =>
      'आपको बुलाया गया है! जुड़ने के लिए साइन इन करें।';

  @override
  String get signInAppleFailed => 'Apple से साइन इन नहीं हो पाया';

  @override
  String get signInGoogleFailed => 'Google से साइन इन नहीं हो पाया';

  @override
  String get signInFailed => 'साइन इन नहीं हो पाया';

  @override
  String get next => 'आगे';

  @override
  String get legalPrefix => 'जारी रखकर आप';

  @override
  String get legalTerms => 'शर्तों';

  @override
  String get legalAnd => ' और';

  @override
  String get legalPrivacy => 'गोपनीयता नीति';

  @override
  String get legalSuffix => ' से सहमत होते हैं।';

  @override
  String get continueWithApple => 'Apple से जारी रखें';

  @override
  String get continueWithGoogle => 'Google से जारी रखें';

  @override
  String get createAccount => 'खाता बनाएँ';

  @override
  String get signIn => 'साइन इन करें';

  @override
  String get or => 'या';

  @override
  String get registerSubtitle => 'ताकि आपके दोस्त देख सकें कि फ़ोटो किसने ली।';

  @override
  String get loginSubtitle => 'फिर से स्वागत है।';

  @override
  String get forgotPasswordTitle => 'पासवर्ड भूल गए';

  @override
  String get forgotPasswordPushSubtitle =>
      'क्या आप अभी भी कहीं साइन इन हैं? हम वहाँ पुश नोटिफ़िकेशन से 6 अंकों का कोड भेजेंगे, ताकि आप नया पासवर्ड बना सकें।';

  @override
  String get newPassword => 'नया पासवर्ड';

  @override
  String get resetPushInfo =>
      'अगर आप अभी भी कहीं साइन इन हैं, तो वहाँ कोड के साथ पुश नोटिफ़िकेशन आएगा। अंदर नहीं जा पा रहे? उसी ईमेल पते से Apple या Google के साथ साइन इन करें - आपका खाता लिंक हो जाएगा।';

  @override
  String get sendCode => 'कोड भेजें';

  @override
  String get savePassword => 'पासवर्ड सेव करें';

  @override
  String get errorTryAgain => 'कुछ गड़बड़ हो गई। फिर से कोशिश करें।';

  @override
  String get back => 'वापस';

  @override
  String get name => 'नाम';

  @override
  String get email => 'ईमेल पता';

  @override
  String get codeFromPush => 'नोटिफ़िकेशन वाला कोड';

  @override
  String get password => 'पासवर्ड';

  @override
  String get hidePassword => 'पासवर्ड छिपाएँ';

  @override
  String get showPassword => 'पासवर्ड दिखाएँ';

  @override
  String get forgotPasswordLink => 'पासवर्ड भूल गए?';

  @override
  String get haveAccount => 'पहले से खाता है?';

  @override
  String get newToCamTrip => 'CamTrip पर नए हैं?';

  @override
  String get rememberedIt => 'याद आ गया?';

  @override
  String get noCodeReceived => 'कोड नहीं मिला?';

  @override
  String get resendCode => 'फिर से भेजें';

  @override
  String onboardingDemoRoll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count फ़ोटोग्राफ़र, 1 रोल',
      one: '$count फ़ोटोग्राफ़र, 1 रोल',
    );
    return '$_temp0';
  }

  @override
  String membersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count सदस्य',
      one: '$count सदस्य',
    );
    return '$_temp0';
  }

  @override
  String photosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count फ़ोटो',
      one: '$count फ़ोटो',
    );
    return '$_temp0';
  }

  @override
  String videosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count वीडियो',
      one: '$count वीडियो',
    );
    return '$_temp0';
  }

  @override
  String get justNow => 'अभी';

  @override
  String get badgeNew => 'नया';

  @override
  String recapTitle(String groupName) {
    return 'रीकैप $groupName';
  }

  @override
  String get styleFilm => 'फ़िल्म';

  @override
  String get styleInstant => 'इंस्टेंट';

  @override
  String get styleDisposable => 'डिस्पोज़ेबल';

  @override
  String get styleBw => 'मोनो';

  @override
  String get styleGolden => 'गोल्डन';

  @override
  String get styleChrome => 'क्रोम';

  @override
  String get styleFilmDescription => 'गर्म रंग, ग्रेन और नारंगी तारीख';

  @override
  String get styleInstantDescription => 'हल्के रंग और सफ़ेद बॉर्डर';

  @override
  String get styleDisposableDescription => 'तेज़ फ़्लैश, विनेट और लाइट लीक';

  @override
  String get styleBwDescription =>
      'गहरे कंट्रास्ट वाला ग्रेनी ब्लैक एंड व्हाइट';

  @override
  String get styleGoldenDescription => 'हमेशा गोल्डन आवर, हल्की सुनहरी चमक';

  @override
  String get styleChromeDescription =>
      'ठंडा, गाढ़ा और शार्प, स्लाइड फ़िल्म जैसा';

  @override
  String get shutterStopRecording => 'रिकॉर्डिंग रोकें';

  @override
  String get shutterStartRecording => 'वीडियो रिकॉर्डिंग शुरू करें';

  @override
  String get shutterTakePhoto => 'फ़ोटो लें';

  @override
  String get modePhoto => 'फ़ोटो';

  @override
  String get modeVideo => 'वीडियो';

  @override
  String get cameraNotFound => 'कोई कैमरा नहीं मिला';

  @override
  String get cameraAccessNeeded =>
      'CamTrip को आपके कैमरे की ऐक्सेस चाहिए। इसे सेटिंग में चालू करें।';

  @override
  String get cameraStartFailed => 'कैमरा शुरू नहीं हो सका';

  @override
  String get albumAccessNeeded =>
      'CamTrip को अपनी फ़ोटो की ऐक्सेस दें, ताकि वे आपके एल्बम में भी सेव हों';

  @override
  String get albumSaveFailed =>
      'एल्बम में सेव नहीं हो पाया। फ़ोटो फिर भी शेयर हो गई है।';

  @override
  String styleProFallback(String style) {
    return 'यह स्टाइल Pro का हिस्सा है। इस ग्रुप में आप $style से फ़ोटो लेते हैं।';
  }

  @override
  String get photoFailed => 'फ़ोटो नहीं ली जा सकी। फिर से कोशिश करें।';

  @override
  String get recordingFailed => 'वीडियो रिकॉर्ड नहीं हो पाया';

  @override
  String get videoFailed => 'वीडियो नहीं बन पाया। फिर से कोशिश करें।';

  @override
  String get shootInGroup => 'ग्रुप में फ़ोटो लें';

  @override
  String get close => 'बंद करें';

  @override
  String get flash => 'फ़्लैश';

  @override
  String get flashOn => 'चालू';

  @override
  String get flashOff => 'बंद';

  @override
  String get flashAuto => 'ऑटो';

  @override
  String get chooseGroup => 'ग्रुप चुनें';

  @override
  String get switchCamera => 'कैमरा बदलें';

  @override
  String get createOrJoinFirst => 'पहले कोई ग्रुप बनाएँ या उससे जुड़ें';

  @override
  String get proViaGroup => 'ग्रुप से Pro';

  @override
  String proViaName(String name) {
    return '$name से Pro';
  }

  @override
  String get proStylesFreeViaMember =>
      'एक Pro सदस्य की वजह से इस ग्रुप में Pro स्टाइल आपके लिए मुफ़्त हैं';

  @override
  String proStylesFreeViaName(String name) {
    return 'इस ग्रुप में Pro स्टाइल: $name की वजह से आपके लिए मुफ़्त';
  }

  @override
  String get subscriptionsUnavailable =>
      'सब्सक्रिप्शन अभी उपलब्ध नहीं हैं। बाद में फिर कोशिश करें।';

  @override
  String get paymentPending =>
      'आपका पेमेंट अभी प्रोसेस हो रहा है। पूरा होते ही Pro चालू हो जाएगा।';

  @override
  String get purchaseFailed => 'खरीदारी नहीं हो पाई। बाद में फिर कोशिश करें।';

  @override
  String get restoreUnavailable =>
      'खरीदारी अभी रीस्टोर नहीं हो सकती। बाद में फिर कोशिश करें।';

  @override
  String get restoreFailed => 'रीस्टोर नहीं हो पाया। बाद में फिर कोशिश करें।';

  @override
  String get welcomePro => 'CamTrip Pro में आपका स्वागत है! 🎉';

  @override
  String get proRestored => 'Pro रीस्टोर हो गया';

  @override
  String get noPurchaseFound => 'कोई पिछली खरीदारी नहीं मिली';

  @override
  String periodDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count दिन',
      one: '$count दिन',
    );
    return '$_temp0';
  }

  @override
  String periodWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count हफ़्ते',
      one: '$count हफ़्ता',
    );
    return '$_temp0';
  }

  @override
  String periodMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count महीने',
      one: '$count महीना',
    );
    return '$_temp0';
  }

  @override
  String periodYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count साल',
      one: '$count साल',
    );
    return '$_temp0';
  }

  @override
  String get paywallHavePro => 'आपके पास CamTrip Pro है';

  @override
  String get paywallSubtitle => 'आपकी अगली ट्रिप के लिए सब कुछ।';

  @override
  String paywallFeatureStyles(String styles) {
    return 'सभी कैमरा स्टाइल ($styles)';
  }

  @override
  String get paywallFeatureUnlimited =>
      'अनलिमिटेड सदस्य और स्टोरेज, फ़ोटो हमेशा के लिए सुरक्षित';

  @override
  String get paywallFeatureNoWatermark => 'बिना वॉटरमार्क के रीकैप';

  @override
  String get paywallFeatureOriginal => 'ओरिजिनल क्वालिटी में डाउनलोड';

  @override
  String get planYear => 'सालाना';

  @override
  String get planMonth => 'मासिक';

  @override
  String pricePerMonth(String price) {
    return '$price प्रति माह';
  }

  @override
  String paywallSaveBadge(int percent) {
    return '$percent% बचाएँ';
  }

  @override
  String get planMonthCancelAnytime => 'कभी भी रद्द करें';

  @override
  String tryFree(String period) {
    return '$period मुफ़्त आज़माएँ';
  }

  @override
  String get becomePro => 'Pro लें';

  @override
  String get subscriptionsLoadFailed =>
      'सब्सक्रिप्शन लोड नहीं हो सके। अपना कनेक्शन जाँचें।';

  @override
  String legalAnnual(String price) {
    return 'CamTrip Pro सालाना सब्सक्रिप्शन: $price प्रति वर्ष।';
  }

  @override
  String legalAnnualTrial(String period, String price) {
    return 'CamTrip Pro सालाना सब्सक्रिप्शन: $period मुफ़्त, फिर $price प्रति वर्ष।';
  }

  @override
  String legalMonthly(String price) {
    return 'CamTrip Pro मासिक सब्सक्रिप्शन: $price प्रति माह।';
  }

  @override
  String legalMonthlyTrial(String period, String price) {
    return 'CamTrip Pro मासिक सब्सक्रिप्शन: $period मुफ़्त, फिर $price प्रति माह।';
  }

  @override
  String get legalBillingApple =>
      'भुगतान आपकी Apple ID से लिया जाता है। सब्सक्रिप्शन अपने-आप रिन्यू होता है, जब तक आप अवधि खत्म होने से कम से कम 24 घंटे पहले इसे रद्द न करें। आप इसे App Store खाते की सेटिंग में रद्द और मैनेज कर सकते हैं।';

  @override
  String get legalBillingGoogle =>
      'भुगतान आपके Google खाते से लिया जाता है। सब्सक्रिप्शन अपने-आप रिन्यू होता है, जब तक आप अवधि खत्म होने से कम से कम 24 घंटे पहले इसे रद्द न करें। आप इसे Google Play खाते की सेटिंग में रद्द और मैनेज कर सकते हैं।';

  @override
  String get restorePurchases => 'खरीदारी रीस्टोर करें';

  @override
  String get terms => 'शर्तें';

  @override
  String get privacy => 'गोपनीयता';

  @override
  String get groupProTitle => 'ग्रुप में एक Pro = उस ग्रुप में सबके लिए Pro';

  @override
  String get groupProBody =>
      'अगर एक व्यक्ति के पास Pro है, तो पूरे ग्रुप को सभी कैमरा स्टाइल, अनलिमिटेड सदस्य, सुरक्षित रहने वाली फ़ोटो, ओरिजिनल क्वालिटी और बिना वॉटरमार्क के रीकैप मिलते हैं।';

  @override
  String get groupCreated => 'ग्रुप बन गया ✓';

  @override
  String get inviteFriends => 'अपने दोस्तों को बुलाएँ';

  @override
  String get codeCopied => 'कोड कॉपी हो गया';

  @override
  String get shareLink => 'लिंक शेयर करें';

  @override
  String inviteSubject(String groupName) {
    return 'CamTrip पर $groupName से जुड़ें';
  }

  @override
  String inviteMembersUnlimited(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count सदस्य',
      one: '$count सदस्य',
    );
    return '$_temp0 · अनलिमिटेड (Pro)';
  }

  @override
  String inviteMembersLimit(int count, int limit) {
    return '$limit में से $count सदस्य · Pro: अनलिमिटेड';
  }

  @override
  String get toCamera => 'कैमरे पर जाएँ';

  @override
  String get done => 'हो गया';

  @override
  String get joinEnterCode => '6 अक्षरों का कोड डालें';

  @override
  String get joinGroupTitle => 'ग्रुप से जुड़ें';

  @override
  String get joinGroupSubtitle =>
      'अपने दोस्तों का कोड डालें, या उनका QR कोड स्कैन करें।';

  @override
  String get typeCode => 'कोड टाइप करें';

  @override
  String get scanQr => 'QR स्कैन करें';

  @override
  String get join => 'जुड़ें';

  @override
  String get groupNameRequired => 'अपने ग्रुप को नाम दें';

  @override
  String get newGroup => 'नया ग्रुप';

  @override
  String get groupType => 'ग्रुप का प्रकार';

  @override
  String get groupTypeVacation => 'छुट्टियाँ';

  @override
  String get groupTypeVacationDescription =>
      'शुरू और खत्म होने की तारीख के साथ, फिर आर्काइव';

  @override
  String get groupTypeEvent => 'इवेंट';

  @override
  String get groupTypeEventDescription => 'एक दिन या शाम, जैसे कोई पार्टी';

  @override
  String get groupTypePermanent => 'हमेशा खुला';

  @override
  String get groupTypePermanentDescription =>
      'आपके पक्के दोस्तों के ग्रुप के लिए';

  @override
  String get date => 'तारीख';

  @override
  String get departure => 'रवानगी';

  @override
  String get returnDate => 'वापसी';

  @override
  String get defaultCameraStyle => 'डिफ़ॉल्ट कैमरा स्टाइल';

  @override
  String freeLimitPermanent(int max) {
    return 'मुफ़्त: $max सदस्य तक। Pro के साथ अनलिमिटेड।';
  }

  @override
  String freeLimitDated(int max, int days) {
    return 'मुफ़्त: $max सदस्य तक, फ़ोटो आखिरी तारीख के $days दिन बाद तक रहती हैं। Pro के साथ अनलिमिटेड और हमेशा के लिए।';
  }

  @override
  String get createGroup => 'ग्रुप बनाएँ';

  @override
  String get group => 'ग्रुप';

  @override
  String groupCode(String code) {
    return 'कोड $code';
  }

  @override
  String get manage => 'मैनेज करें';

  @override
  String get rename => 'नाम बदलें';

  @override
  String get changeDates => 'तारीखें बदलें';

  @override
  String get finishTrip => 'ट्रिप खत्म करें';

  @override
  String get finishTripSubtitle => 'आखिरी तारीख आज कर देता है';

  @override
  String get reopenGroup => 'ग्रुप फिर से खोलें';

  @override
  String get closeGroup => 'ग्रुप बंद करें';

  @override
  String get reopenGroupSubtitle => 'सदस्य फिर से फ़ोटो जोड़ सकते हैं';

  @override
  String get closeGroupSubtitle =>
      'अब कोई फ़ोटो नहीं जोड़ सकता; सब कुछ अब भी देखा जा सकता है';

  @override
  String get members => 'सदस्य';

  @override
  String memberYou(String name) {
    return '$name (आप)';
  }

  @override
  String get blockedTag => 'ब्लॉक किया गया';

  @override
  String get adminTag => 'एडमिन';

  @override
  String removeMemberTitle(String name) {
    return '$name को हटाएँ?';
  }

  @override
  String get removeMemberMessage => 'उनकी फ़ोटो ग्रुप में बनी रहेंगी।';

  @override
  String get remove => 'हटाएँ';

  @override
  String get removeMember => 'हटाएँ';

  @override
  String blockTitle(String name) {
    return '$name को ब्लॉक करें?';
  }

  @override
  String blockMessage(String name) {
    return 'अब आपको $name की फ़ोटो और वीडियो नहीं दिखेंगे और उनके बारे में नोटिफ़िकेशन भी नहीं आएँगे। आप इसे सेटिंग में वापस बदल सकते हैं।';
  }

  @override
  String get block => 'ब्लॉक करें';

  @override
  String get makeMember => 'सामान्य सदस्य बनाएँ';

  @override
  String get makeAdmin => 'एडमिन बनाएँ';

  @override
  String get removeFromGroup => 'ग्रुप से हटाएँ';

  @override
  String get unblock => 'अनब्लॉक करें';

  @override
  String get inviteFriendsButton => 'दोस्तों को बुलाएँ';

  @override
  String get you => 'आप';

  @override
  String get unarchive => 'आर्काइव से वापस लाएँ';

  @override
  String get archive => 'आर्काइव करें';

  @override
  String get unarchiveSubtitle => 'ग्रुप फिर से आपके एल्बम में है';

  @override
  String archiveSubtitle(String section) {
    return 'सिर्फ़ आपके लिए: ग्रुप आपके एल्बम में सबसे नीचे \"$section\" में चला जाता है';
  }

  @override
  String get archivedSection => 'आर्काइव किए गए';

  @override
  String get hiddenPhotos => 'छिपी हुई फ़ोटो';

  @override
  String get hiddenPhotosSubtitle => 'वे फ़ोटो जो आपने अपने लिए छिपाई हैं';

  @override
  String get leaveGroup => 'ग्रुप छोड़ें';

  @override
  String get leaveGroupSubtitle =>
      'आपकी फ़ोटो दूसरों के लिए ग्रुप में बनी रहेंगी';

  @override
  String get deleteGroup => 'ग्रुप हटाएँ';

  @override
  String get deleteGroupSubtitle => 'सबके लिए सभी फ़ोटो हट जाएँगी';

  @override
  String groupArchived(String groupName) {
    return '\"$groupName\" आर्काइव हो गया';
  }

  @override
  String groupUnarchived(String groupName) {
    return '\"$groupName\" फिर से आपके एल्बम में है';
  }

  @override
  String get undo => 'वापस लें';

  @override
  String get groupNameTitle => 'ग्रुप का नाम';

  @override
  String get finishTripTitle => 'ट्रिप खत्म करें?';

  @override
  String get finishTripMessage =>
      'आखिरी तारीख आज हो जाएगी। आप फिर भी फ़ोटो जोड़ सकते हैं; रीकैप तैयार है।';

  @override
  String get finishTripConfirm => 'खत्म करें';

  @override
  String get tripFinished => 'ट्रिप खत्म हुई';

  @override
  String leaveGroupTitle(String groupName) {
    return '\"$groupName\" छोड़ें?';
  }

  @override
  String get leaveGroupMessage =>
      'आपकी फ़ोटो दूसरों के लिए ग्रुप में बनी रहेंगी। आप बाद में कोड से फिर जुड़ सकते हैं।';

  @override
  String get leave => 'छोड़ें';

  @override
  String groupDeleted(String groupName) {
    return '\"$groupName\" हटा दिया गया';
  }

  @override
  String get youAreAdmin => 'आप एडमिन हैं';

  @override
  String get open => 'खोलें';

  @override
  String get archiveMenuSubtitle => 'सिर्फ़ आपके लिए, दूसरों को पता नहीं चलेगा';

  @override
  String get deleteGroupMenuSubtitle => 'सबके लिए, सभी फ़ोटो के साथ';

  @override
  String get deleteGroupTitle => 'ग्रुप हटाएँ?';

  @override
  String deleteGroupMessage(int count, String groupName, int memberCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'सभी $count फ़ोटो और वीडियो',
      one: '$count फ़ोटो या वीडियो',
    );
    String _temp1 = intl.Intl.pluralLogic(
      memberCount,
      locale: localeName,
      other: 'सभी $memberCount सदस्यों',
      one: '$memberCount सदस्य',
    );
    return '\"$groupName\" की $_temp0 $_temp1 के लिए गायब हो जाएँगे। इसे वापस नहीं लिया जा सकता।';
  }

  @override
  String get deleteGroupOwnRoll => 'आपकी अपनी गैलरी में कोई बदलाव नहीं होगा।';

  @override
  String get deleteGroupTypeName => 'पुष्टि के लिए ग्रुप का नाम टाइप करें:';

  @override
  String get deleteForEveryone => 'सबके लिए हटाएँ';

  @override
  String get save => 'सेव करें';

  @override
  String get yourAlbums => 'आपके एल्बम';

  @override
  String get uploadQueue => 'अपलोड कतार';

  @override
  String get noConnection => 'कनेक्शन नहीं है';

  @override
  String get albumsOfflineMessage =>
      'ऑनलाइन होते ही आपके एल्बम लोड हो जाएँगे। कैमरा फिर भी काम करता है।';

  @override
  String get retry => 'फिर कोशिश करें';

  @override
  String get noAlbumsTitle => 'अभी कोई एल्बम नहीं';

  @override
  String get noAlbumsMessage =>
      'अपनी अगली ट्रिप के लिए ग्रुप बनाएँ, या किसी दोस्त के कोड से उसके ग्रुप से जुड़ें।';

  @override
  String get haveCode => 'मेरे पास कोड है';

  @override
  String get joinWithCode => 'कोड या QR कोड से जुड़ें';

  @override
  String get camera => 'कैमरा';

  @override
  String get restore => 'रीस्टोर करें';

  @override
  String get more => 'और';

  @override
  String get newAlbum => 'नया';

  @override
  String get closedTag => 'बंद';

  @override
  String get activeTag => 'चालू';

  @override
  String get uploadFailed => 'अपलोड नहीं हुआ';

  @override
  String get queueNoSignal => 'सिग्नल नहीं है।';

  @override
  String get queueNoSignalMessage =>
      'आपकी फ़ोटो पहले से आपके एल्बम में हैं और ऑनलाइन होते ही शेयर हो जाएँगी।';

  @override
  String get queueWaitingForWifi => 'वाई-फ़ाई का इंतज़ार।';

  @override
  String queueWifiOnlyOn(String setting) {
    return 'आपने \"$setting\" चालू किया है।';
  }

  @override
  String get queueVideosWifiOnly => 'वीडियो सिर्फ़ वाई-फ़ाई पर जाते हैं।';

  @override
  String get queueAllShared => 'सब कुछ शेयर हो गया ✓';

  @override
  String queuePending(String items) {
    return '$items शेयर होना बाकी है';
  }

  @override
  String queuePendingBoth(String photos, String videos) {
    return '$photos और $videos शेयर होना बाकी है';
  }

  @override
  String get retryUpload => 'फिर कोशिश करें';

  @override
  String get removeFromQueue => 'कतार से हटाएँ';

  @override
  String get queueStatusWifi => 'वाई-फ़ाई';

  @override
  String get queueStatusWaiting => 'इंतज़ार में';

  @override
  String get videosWifiOnlyTitle => 'वीडियो सिर्फ़ वाई-फ़ाई पर';

  @override
  String get videosWifiOnlySubtitle => 'आपका मोबाइल डेटा बचाता है';

  @override
  String get retryNow => 'अभी फिर कोशिश करें';

  @override
  String get yourName => 'आपका नाम';

  @override
  String get settings => 'सेटिंग';

  @override
  String get tapToChangeName => 'नाम बदलने के लिए टैप करें';

  @override
  String get getCamTripPro => 'CamTrip Pro लें';

  @override
  String get photos => 'फ़ोटो';

  @override
  String get saveOwnPhotos => 'मेरी फ़ोटो हर ग्रुप के अलग एल्बम में सेव करें';

  @override
  String get autoSaveOthers => 'दूसरों की फ़ोटो अपने-आप सेव करें';

  @override
  String get wifiOnlyTitle => 'सिर्फ़ वाई-फ़ाई पर अपलोड करें';

  @override
  String get dateStamp => 'तारीख की मोहर';

  @override
  String get notifications => 'नोटिफ़िकेशन';

  @override
  String get notifyNewPhotos => 'नई फ़ोटो (एक साथ)';

  @override
  String get notifyRecapReady => 'रीकैप तैयार';

  @override
  String get camTripTeam => 'CamTrip टीम';

  @override
  String get adminEntrySubtitle => 'यूज़र, Pro देना, रिपोर्ट और आँकड़े';

  @override
  String get account => 'खाता';

  @override
  String get manageSubscription => 'सब्सक्रिप्शन मैनेज करें';

  @override
  String get blockedPeople => 'ब्लॉक किए गए लोग';

  @override
  String get nobody => 'कोई नहीं';

  @override
  String peopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count लोग',
      one: '$count व्यक्ति',
    );
    return '$_temp0';
  }

  @override
  String get privacyPolicy => 'गोपनीयता नीति';

  @override
  String get contact => 'संपर्क';

  @override
  String get signOut => 'साइन आउट करें';

  @override
  String get deleteAccount => 'खाता हटाएँ';

  @override
  String get deleteAccountSubtitle => 'आपका खाता और आपकी सभी फ़ोटो हटा देता है';

  @override
  String get deleteAccountTitle => 'खाता हटाएँ?';

  @override
  String get deleteAccountMessage =>
      'आपका खाता और आपकी सभी फ़ोटो और वीडियो हटा दिए जाएँगे, ग्रुप से भी। कोई भी चालू सब्सक्रिप्शन App Store या Google Play में रद्द करें।';

  @override
  String get blockedTitle => 'ब्लॉक किए गए';

  @override
  String get blockedSubtitle => 'आपको इन लोगों की फ़ोटो नहीं दिखतीं।';

  @override
  String get blockedNone => 'आपने किसी को ब्लॉक नहीं किया है।';

  @override
  String get unblockShort => 'अनब्लॉक करें';

  @override
  String get groupGone =>
      'यह ग्रुप अब मौजूद नहीं है, या आप अब इसके सदस्य नहीं हैं।';

  @override
  String photosSavedToAlbum(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count फ़ोटो \"$album\" में सेव हुईं',
      one: '$count फ़ोटो \"$album\" में सेव हुई',
    );
    return '$_temp0';
  }

  @override
  String photosDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count फ़ोटो हटाई गईं',
      one: '$count फ़ोटो हटाई गई',
    );
    return '$_temp0';
  }

  @override
  String photosDeletedSkipped(int count, int skipped) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count फ़ोटो हटाई गईं',
      one: '$count फ़ोटो हटाई गई',
    );
    return '$_temp0, $skipped छोड़ी गईं';
  }

  @override
  String photosHiddenForYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count फ़ोटो आपके लिए छिपाई गईं',
      one: '$count फ़ोटो आपके लिए छिपाई गई',
    );
    return '$_temp0';
  }

  @override
  String get addedToFavorites => 'पसंदीदा में जोड़ा गया';

  @override
  String get removedFromFavorites => 'पसंदीदा से हटाया गया';

  @override
  String get photoAccessSettings =>
      'सेटिंग में CamTrip को अपनी फ़ोटो की ऐक्सेस दें';

  @override
  String photosBeingAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count फ़ोटो जोड़ी जा रही हैं',
      one: '$count फ़ोटो जोड़ी जा रही है',
    );
    return '$_temp0';
  }

  @override
  String photosUnreadable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count फ़ोटो पढ़ी नहीं जा सकीं',
      one: '$count फ़ोटो पढ़ी नहीं जा सकी',
    );
    return '$_temp0';
  }

  @override
  String get groupNotLoaded => 'ग्रुप लोड नहीं हुआ';

  @override
  String get noFavoritesTitle => 'अभी कोई पसंदीदा नहीं';

  @override
  String get noPhotosTitle => 'अभी कोई फ़ोटो नहीं';

  @override
  String get noFavoritesMessage =>
      'किसी फ़ोटो को यहाँ लाने के लिए उस पर स्टार टैप करें।';

  @override
  String get noPhotosMessage =>
      'पहली फ़ोटो लें। ग्रुप में सभी उसे तुरंत देखेंगे।';

  @override
  String get openCamera => 'कैमरा खोलें';

  @override
  String savingProgress(int done, int total) {
    return 'सेव हो रहा है... $done/$total';
  }

  @override
  String get sharePreparing => 'तैयार हो रहा है...';

  @override
  String sharingProgress(int done, int total) {
    return 'तैयार हो रहा है... $done/$total';
  }

  @override
  String get choosePhotos => 'फ़ोटो चुनें';

  @override
  String selectedCount(int count) {
    return '$count चुनी गईं';
  }

  @override
  String get selectNone => 'कोई नहीं चुनें';

  @override
  String get selectAll => 'सभी चुनें';

  @override
  String photosWaitingToShare(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count फ़ोटो शेयर होने का इंतज़ार कर रही हैं',
      one: '$count फ़ोटो शेयर होने का इंतज़ार कर रही है',
    );
    return '$_temp0';
  }

  @override
  String get recapReadyTitle => 'आपका रीकैप तैयार है';

  @override
  String get recapReadySubtitle => 'आपकी ट्रिप का म्यूज़िक वाला वीडियो';

  @override
  String get watch => 'देखें';

  @override
  String get makeRecapNow => 'अभी रीकैप वीडियो बनाएँ';

  @override
  String freeGroupDeleteNotice(String date) {
    return 'मुफ़्त ग्रुप: फ़ोटो $date तक रहेंगी। उन्हें सेव करें या Pro लें।';
  }

  @override
  String get filterAll => 'सभी';

  @override
  String get filterFavorites => 'पसंदीदा';

  @override
  String get filterPerPerson => 'व्यक्ति के हिसाब से';

  @override
  String get filterPerson => 'व्यक्ति';

  @override
  String get select => 'चुनें';

  @override
  String get hiddenFilter => 'छिपी हुई';

  @override
  String get photosBy => 'इनकी फ़ोटो...';

  @override
  String get uploadedTag => 'अपलोड हुई';

  @override
  String get saveAll => 'सभी सेव करें';

  @override
  String get favorite => 'पसंदीदा';

  @override
  String get unfavorite => 'पसंदीदा से हटाएँ';

  @override
  String get hide => 'छिपाएँ';

  @override
  String get delete => 'हटाएँ';

  @override
  String deletePhotosTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count फ़ोटो हटाएँ?',
      one: 'फ़ोटो हटाएँ?',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'ये ग्रुप में सबके लिए गायब हो जाएँगी। इसे वापस नहीं लिया जा सकता।',
      one: 'यह ग्रुप में सबके लिए गायब हो जाएगी। इसे वापस नहीं लिया जा सकता।',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosNotAllowed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count फ़ोटो किसी और की हैं। ये बनी रहेंगी; सिर्फ़ एडमिन इन्हें हटा सकता है।',
      one:
          '$count फ़ोटो किसी और की है। यह बनी रहेगी; सिर्फ़ एडमिन इसे हटा सकता है।',
    );
    return '$_temp0';
  }

  @override
  String photosBackInGroup(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count फ़ोटो फिर से ग्रुप में हैं',
      one: '$count फ़ोटो फिर से ग्रुप में है',
    );
    return '$_temp0';
  }

  @override
  String get showAll => 'सभी दिखाएँ';

  @override
  String get hiddenPhotosExplainer =>
      'सिर्फ़ आपको ये फ़ोटो अब नहीं दिखतीं। ग्रुप के दूसरों के लिए ये अब भी मौजूद हैं।';

  @override
  String get nothingHidden => 'कुछ भी छिपा नहीं है';

  @override
  String get nothingHiddenMessage => 'आप जो फ़ोटो छिपाएँगे, वे यहाँ दिखेंगी।';

  @override
  String showAgainCount(int count) {
    return 'फिर से दिखाएँ ($count)';
  }

  @override
  String get someone => 'कोई';

  @override
  String get savedToAlbum => 'आपके फ़ोटो एल्बम में सेव हुई';

  @override
  String get share => 'शेयर करें';

  @override
  String get shareFailed => 'शेयर नहीं हो पाया';

  @override
  String get reportTitle => 'आप इस फ़ोटो की रिपोर्ट क्यों कर रहे हैं?';

  @override
  String get reportSubtitle =>
      'हम हर रिपोर्ट 24 घंटे के भीतर देखते हैं। फ़ोटो आपके लिए तुरंत छिप जाती है।';

  @override
  String get reportThanks => 'धन्यवाद, हम इसे देखेंगे';

  @override
  String blockMessageAllGroups(String name) {
    return 'अब आपको किसी भी ग्रुप में $name की फ़ोटो और वीडियो नहीं दिखेंगे और उनके बारे में नोटिफ़िकेशन भी नहीं आएँगे। आप इसे सेटिंग में वापस बदल सकते हैं।';
  }

  @override
  String userBlocked(String name) {
    return '$name ब्लॉक कर दिया गया';
  }

  @override
  String get videoHiddenForYou => 'वीडियो आपके लिए छिपाया गया';

  @override
  String get photoHiddenForYou => 'फ़ोटो आपके लिए छिपाई गई';

  @override
  String get setAsCover => 'कवर बनाएँ';

  @override
  String get coverUpdated => 'कवर फ़ोटो अपडेट हो गई';

  @override
  String get hideForMe => 'मेरे लिए छिपाएँ';

  @override
  String get hideForMeSubtitle => 'ग्रुप के दूसरे लोग इसे अब भी देख सकते हैं';

  @override
  String get reportPhoto => 'फ़ोटो की रिपोर्ट करें';

  @override
  String blockName(String name) {
    return '$name को ब्लॉक करें';
  }

  @override
  String get forEveryoneInGroup => 'ग्रुप में सबके लिए';

  @override
  String get videoDeleted => 'वीडियो हटाया गया';

  @override
  String get photoDeleted => 'फ़ोटो हटाई गई';

  @override
  String get photoAccessToSave =>
      'फ़ोटो सेव करने के लिए सेटिंग में CamTrip को अपनी फ़ोटो की ऐक्सेस दें';

  @override
  String get phoneFull => 'आपके फ़ोन का स्टोरेज भर गया है';

  @override
  String get albumSaveFailedShort => 'एल्बम में सेव नहीं हो पाया';

  @override
  String get recapTemplateGoldenHour => 'गोल्डन आवर';

  @override
  String get recapTemplateFast => 'तेज़';

  @override
  String get recapTemplateFilmRoll => 'फ़िल्म रोल';

  @override
  String get recapTemplatePolaroid => 'पोलरॉइड';

  @override
  String get trackSummerEvening => 'गर्मियों की शाम';

  @override
  String get trackGoldenHour => 'गोल्डन आवर';

  @override
  String get trackRoadtrip => 'रोड ट्रिप';

  @override
  String get moodWarm => 'गर्मजोशी भरा';

  @override
  String get moodCheerful => 'खुशनुमा';

  @override
  String friendsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count दोस्त',
      one: '$count दोस्त',
    );
    return '$_temp0';
  }

  @override
  String get madeWithCamTrip => 'CamTrip से बनाया गया';

  @override
  String get tagline => 'पूरे ग्रुप के लिए एक रोल';

  @override
  String get videoUnsupportedDevice => 'इस डिवाइस पर वीडियो नहीं बन पाया';

  @override
  String get groupLoadFailed => 'यह ग्रुप लोड नहीं हो सका।';

  @override
  String recapNeedsPhotos(int count) {
    return 'रीकैप के लिए कम से कम $count फ़ोटो चाहिए।';
  }

  @override
  String get recapFailed => 'रीकैप नहीं बन पाया। फिर से कोशिश करें।';

  @override
  String get recapSaved => 'रीकैप आपके फ़ोटो एल्बम में सेव हो गया';

  @override
  String get recap => 'रीकैप';

  @override
  String get recapRendering => 'रीकैप बन रहा है...';

  @override
  String get videoRendering => 'वीडियो बन रहा है...';

  @override
  String get template => 'टेम्पलेट';

  @override
  String get musicLicense => 'CamTrip का अपना म्यूज़िक · रॉयल्टी-फ़्री';

  @override
  String get change => 'बदलें';

  @override
  String get noWatermark => 'कोई वॉटरमार्क नहीं ✓';

  @override
  String get removeWatermarkPro => 'Pro से वॉटरमार्क हटाएँ';

  @override
  String get proSourceSubscription => 'सब्सक्रिप्शन';

  @override
  String get proSourceGift => 'तोहफ़ा';

  @override
  String get proSourceAdmin => 'एडमिन';

  @override
  String get proSourceGroup => 'ग्रुप से';

  @override
  String get noPro => 'Pro नहीं';

  @override
  String proStatusNoEnd(String source) {
    return 'Pro ($source), कोई आखिरी तारीख नहीं';
  }

  @override
  String proStatusUntil(String source, String date) {
    return 'Pro ($source), $date तक';
  }

  @override
  String get lifetime => 'आजीवन';

  @override
  String get pickDate => 'तारीख चुनें';

  @override
  String get noAccess => 'ऐक्सेस नहीं है';

  @override
  String get adminOnlyTeam => 'मैनेज सिर्फ़ CamTrip टीम के लिए है।';

  @override
  String get adminOverview => 'ओवरव्यू';

  @override
  String get adminUsers => 'यूज़र';

  @override
  String get adminReports => 'रिपोर्ट';

  @override
  String adminsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count एडमिन',
      one: '$count एडमिन',
    );
    return '$_temp0';
  }

  @override
  String get adminNewThisWeek => 'इस हफ़्ते नए';

  @override
  String get adminGroups => 'ग्रुप';

  @override
  String get adminProSubscription => 'सब्सक्रिप्शन से Pro';

  @override
  String get adminProGift => 'तोहफ़े में Pro';

  @override
  String adminWithoutSubscription(int count) {
    return '$count बिना सब्सक्रिप्शन';
  }

  @override
  String get adminOpenReports => 'खुली रिपोर्ट';

  @override
  String get adminSearchHint => 'नाम या ईमेल से खोजें';

  @override
  String get nobodyFound => 'कोई नहीं मिला';

  @override
  String get loadMore => 'और लोड करें';

  @override
  String get noEmail => 'ईमेल नहीं';

  @override
  String adminDeletePhotoMessage(String groupName) {
    return 'फ़ोटो \"$groupName\" में सबके लिए गायब हो जाएगी। इस फ़ोटो की सभी रिपोर्ट निपटा दी जाएँगी।';
  }

  @override
  String get adminBanMessage =>
      'यह खाता अब साइन इन या ऐप का इस्तेमाल नहीं कर पाएगा। आप इसे बाद में वापस बदल सकते हैं।';

  @override
  String get adminDismissTitle => 'रिपोर्ट खारिज करें?';

  @override
  String get adminDismissMessage =>
      'फ़ोटो बनी रहेगी। रिपोर्ट को निपटा हुआ मार्क किया जाएगा।';

  @override
  String get adminDismiss => 'खारिज करें';

  @override
  String get adminAccountBlocked => 'खाता ब्लॉक किया गया';

  @override
  String get adminReportDismissed => 'रिपोर्ट खारिज की गई';

  @override
  String get adminNoReports => 'कोई खुली रिपोर्ट नहीं';

  @override
  String get adminNoReportsMessage =>
      'जिन फ़ोटो की रिपोर्ट हुई है, वे यहाँ दिखती हैं।';

  @override
  String get deletedTag => 'हटाया गया';

  @override
  String adminReportedBy(String name) {
    return '$name द्वारा';
  }

  @override
  String adminPhotoBy(String name) {
    return 'फ़ोटो: $name';
  }

  @override
  String reportsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count रिपोर्ट',
      one: '$count रिपोर्ट',
    );
    return '$_temp0';
  }

  @override
  String get adminDeletePhoto => 'फ़ोटो हटाएँ';

  @override
  String get adminBlockCreator => 'फ़ोटो लेने वाले को ब्लॉक करें';

  @override
  String get loadFailed => 'लोड नहीं हो पाया';

  @override
  String get adminLifetimeProGiven => 'आजीवन Pro दिया गया';

  @override
  String get adminProGiven => 'Pro दिया गया';

  @override
  String adminGiveProUntil(String date) {
    return '$date तक Pro दें';
  }

  @override
  String get adminGiveProLifetime => 'आजीवन Pro दें';

  @override
  String adminGiveProFor(String period) {
    return '$period के लिए Pro दें';
  }

  @override
  String get adminReasonHint => 'वजह, जैसे दोस्त, टेस्टर, इन्फ़्लुएंसर';

  @override
  String get adminGivePro => 'Pro दें';

  @override
  String get adminRevokeTitle => 'तोहफ़ा वापस लें?';

  @override
  String get adminRevokeMessage =>
      'तोहफ़े वाला Pro तुरंत बंद हो जाएगा। उनका अपना सब्सक्रिप्शन चलता रहेगा।';

  @override
  String get adminRevoke => 'वापस लें';

  @override
  String get adminGiftRevoked => 'तोहफ़ा वापस लिया गया';

  @override
  String get adminUnbanTitle => 'ब्लॉक हटाएँ?';

  @override
  String adminUnbanMessage(String name) {
    return '$name फिर से साइन इन कर सकते हैं।';
  }

  @override
  String get adminUnbanned => 'ब्लॉक हटाया गया';

  @override
  String get adminBanUserMessage =>
      'यह खाता अब साइन इन या ऐप का इस्तेमाल नहीं कर पाएगा। फ़ोटो बनी रहेंगी।';

  @override
  String get adminUser => 'यूज़र';

  @override
  String get adminNotVerified => 'सत्यापित नहीं';

  @override
  String get adminRole => 'भूमिका';

  @override
  String get adminCreated => 'बनाया गया';

  @override
  String get unknown => 'अज्ञात';

  @override
  String get adminSignInWith => 'साइन इन का तरीका';

  @override
  String get adminEmailMethod => 'ईमेल';

  @override
  String get adminPhotosAndVideos => 'फ़ोटो और वीडियो';

  @override
  String get adminStatus => 'स्थिति';

  @override
  String get adminActive => 'चालू';

  @override
  String adminActiveUntil(String date) {
    return '$date तक चालू';
  }

  @override
  String adminGiftFrom(String name) {
    return '$name से तोहफ़ा';
  }

  @override
  String adminExpiredOn(String date) {
    return '$date को खत्म हुआ';
  }

  @override
  String get adminExpired => 'खत्म हो गया';

  @override
  String adminUntil(String date) {
    return '$date तक';
  }

  @override
  String get adminGiveProTitle => 'Pro दें';

  @override
  String get adminGiveProNote =>
      'इस व्यक्ति के ग्रुप पर भी लागू: ग्रुप में एक Pro = उस ग्रुप में सबके लिए Pro।';

  @override
  String get adminRevokeGift => 'तोहफ़ा वापस लें';

  @override
  String get adminModeration => 'मॉडरेशन';

  @override
  String get adminCannotBanSelf => 'आप खुद को ब्लॉक नहीं कर सकते।';

  @override
  String get adminCannotBanAdmin => 'एडमिन को ब्लॉक नहीं किया जा सकता।';

  @override
  String get adminUnban => 'ब्लॉक हटाएँ';

  @override
  String get adminBanAccount => 'खाता ब्लॉक करें';

  @override
  String get googleSignInUnavailable => 'Google से साइन इन अभी उपलब्ध नहीं है';

  @override
  String get cameraPickerTitle => 'अपना कैमरा चुनें';

  @override
  String get cameraPickerSubtitle =>
      'हर कैमरा आपकी फ़ोटो को अपना अलग लुक देता है';

  @override
  String get cameraPickerChange => 'कैमरा बदलें';

  @override
  String get cameraPickerUnlock => 'Pro से अनलॉक करें';

  @override
  String get cameraPickerSelected => 'चुना गया';

  @override
  String get cameraPickerStyleSummer => 'समर';

  @override
  String get cameraPickerStyleSummerDescription =>
      '90 के दशक की तस्वीर जैसे गर्म, फीके रंग';

  @override
  String get cameraPickerStyleNight => 'नाइट 800';

  @override
  String get cameraPickerStyleNightDescription =>
      'सिनेमा फ़िल्म: टील परछाइयाँ, गर्म रोशनी, खूब ग्रेन';

  @override
  String get cameraPickerStyleSepia => 'सीपिया';

  @override
  String get cameraPickerStyleSepiaDescription =>
      'जूतों के डिब्बे से निकली पुरानी भूरी तस्वीर';

  @override
  String get cameraPickerStyleLomo => 'लोमो';

  @override
  String get cameraPickerStyleLomoDescription =>
      'गहरे रंग, अँधेरे कोने और जंगली रंगत';

  @override
  String get cameraPickerStyleMint => 'मिंट';

  @override
  String get cameraPickerStyleMintDescription =>
      'हल्का और ताज़ा, हरी रंगत के साथ';

  @override
  String get cameraPickerStylePastel => 'पिंक';

  @override
  String get cameraPickerStylePastelDescription =>
      'गुलाबी चमक और सफ़ेद बॉर्डर के साथ पेस्टल रंग';

  @override
  String get cameraPickerStyleSuper8 => 'सुपर 8';

  @override
  String get cameraPickerStyleSuper8Description =>
      'ग्रेनी और हल्का, पुरानी घरेलू फ़िल्म जैसा';

  @override
  String get paywallBenefitGroup => 'एक Pro = पूरे ग्रुप के लिए Pro';

  @override
  String get paywallBenefitUnlimited =>
      'अनलिमिटेड सदस्य, फ़ोटो हमेशा के लिए सुरक्षित';

  @override
  String get paywallBenefitQuality => 'वॉटरमार्क नहीं, ओरिजिनल क्वालिटी';

  @override
  String paywallFreeTrial(String period) {
    return '$period मुफ़्त';
  }

  @override
  String paywallPriceYear(String price) {
    return '$price प्रति वर्ष।';
  }

  @override
  String paywallPriceYearTrial(String period, String price) {
    return '$period मुफ़्त, फिर $price प्रति वर्ष।';
  }

  @override
  String paywallPriceMonth(String price) {
    return '$price प्रति माह।';
  }

  @override
  String paywallPriceMonthTrial(String period, String price) {
    return '$period मुफ़्त, फिर $price प्रति माह।';
  }

  @override
  String paywallAutoRenew(String store) {
    return 'अपने-आप रिन्यू होता है। रिन्यू होने से कम से कम 24 घंटे पहले $store में रद्द करें।';
  }

  @override
  String get paywallDetailsTitle => 'Pro में सब कुछ';

  @override
  String get paywallBenefitStyles => 'सभी कैमरा स्टाइल';

  @override
  String get allPhotosTitle => 'सभी फ़ोटो';

  @override
  String get homeTabAlbums => 'एल्बम';

  @override
  String get allPhotosEmptyTitle => 'अभी कोई फ़ोटो नहीं';

  @override
  String get allPhotosEmptyMessage => 'कैमरा खोलें और अपनी पहली फ़ोटो लें।';

  @override
  String get allPhotosLoadFailed => 'आपकी फ़ोटो लोड नहीं हो सकीं';

  @override
  String get cameraSettingsTitle => 'कैमरा सेटिंग';

  @override
  String get cameraSettingsMore => 'और सेटिंग';

  @override
  String get cameraSettingsGrid => 'ग्रिड';

  @override
  String get cameraSettingsHaptics => 'फ़ोटो लेते समय वाइब्रेट करें';

  @override
  String get cameraSettingsDateStamp => 'नीचे दाईं ओर तारीख';

  @override
  String get cameraSettingsSound => 'शटर की आवाज़';

  @override
  String get cameraSettingsSoundHint => 'फ़ोन साइलेंट पर हो तो आवाज़ नहीं';

  @override
  String get cameraSettingsTimer => 'सेल्फ़-टाइमर';

  @override
  String get cameraSettingsTimerOff => 'बंद';

  @override
  String cameraSettingsTimerSeconds(int seconds) {
    return '$seconds से.';
  }

  @override
  String get cameraSettingsTimerCancelHint => 'रद्द करने के लिए शटर टैप करें';

  @override
  String get cameraSettingsMirror => 'सेल्फ़ी मिरर करें';

  @override
  String get cameraSettingsSaveToRoll => 'गैलरी में सेव करें';

  @override
  String get cameraSettingsQuality => 'क्वालिटी';

  @override
  String get cameraSettingsQualityStandard => 'स्टैंडर्ड';

  @override
  String get cameraSettingsQualityHigh => 'हाई';

  @override
  String get cameraLowLightHint => 'कम रोशनी - फ़्लैश चालू करें';

  @override
  String get cameraFlashUnavailable => 'इस कैमरे में फ़्लैश नहीं है';

  @override
  String get cameraFlashScreen => 'स्क्रीन फ़्लैश';

  @override
  String get cameraFlashCycleHint =>
      'बंद, चालू और ऑटो के बीच बदलने के लिए टैप करें';

  @override
  String get cameraFlip => 'आगे और पीछे के कैमरे के बीच बदलें';

  @override
  String get cameraFlipHint =>
      'कैमरा पलटने के लिए व्यूफ़ाइंडर पर दो बार टैप करें';

  @override
  String cameraPickerPaywallStyles(int count, String styles) {
    return 'सभी $count कैमरे, $styles समेत';
  }

  @override
  String get styleFlash => 'फ़्लैश 400';

  @override
  String get styleFlashDescription =>
      'गर्म फ़िल्म पर सीधा फ़्लैश: एम्बर चमक, ग्रेन, गहरे लाल';

  @override
  String cameraTimerButton(String state) {
    return 'सेल्फ़-टाइमर: $state';
  }

  @override
  String get cameraTimerCycleHint =>
      'बंद, 3 से. और 10 से. के बीच बदलने के लिए टैप करें';

  @override
  String get cameraLastShotOpen => 'आखिरी फ़ोटो, एल्बम खोलता है';

  @override
  String get cameraLastShotEmpty => 'अभी कोई फ़ोटो नहीं, एल्बम खोलता है';

  @override
  String get deleteOnlyOwnOrAdmin =>
      'इसे सिर्फ़ फ़ोटो लेने वाला या एडमिन हटा सकता है';

  @override
  String get videoPlay => 'चलाएँ';

  @override
  String get videoPause => 'रोकें';

  @override
  String get language => 'भाषा';

  @override
  String get languageSystem => 'सिस्टम की भाषा';

  @override
  String languageSystemCurrent(String language) {
    return 'सिस्टम ($language)';
  }

  @override
  String get languageSearchHint => 'भाषा खोजें';

  @override
  String get languageNoResults => 'कोई भाषा नहीं मिली';

  @override
  String get personalRollTitle => 'मेरा रोल';

  @override
  String get personalRollSubtitle => 'सिर्फ़ आपके लिए';

  @override
  String get personalRollPickerSubtitle => 'अलग फ़ोटो, सिर्फ़ आपके लिए';

  @override
  String get personalRollMove => 'एल्बम में';

  @override
  String get personalRollMoveTitle => 'एल्बम में ले जाएँ';

  @override
  String get personalRollMoveNoAlbums =>
      'पहले एक एल्बम बनाएँ या कोड से किसी में शामिल हों।';

  @override
  String personalRollMoved(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count फ़ोटो $album में ले जाई गईं',
      one: '1 फ़ोटो $album में ले जाई गई',
    );
    return '$_temp0';
  }

  @override
  String get personalRollPrivateNote =>
      'ये फ़ोटो सिर्फ़ आप देख सकते हैं। शेयर करने के लिए इन्हें एल्बम में ले जाएँ।';

  @override
  String get paywallTripPassSub => 'सिर्फ़ इस ट्रिप के लिए, पूरे ग्रुप के लिए';

  @override
  String get paywallOneTime => 'एक बार';

  @override
  String get paywallBestValue => 'सबसे किफ़ायती';

  @override
  String paywallRollFullTitle(int used, int limit) {
    return 'आपका रोल भर गया - $used/$limit फ़ोटो';
  }

  @override
  String get paywallRollFullSub => 'Trip Pass या Pro के साथ फ़ोटो लेते रहें।';

  @override
  String get paywallCameraTitle => 'यह कैमरा Pro का हिस्सा है';

  @override
  String paywallCameraSub(int count) {
    return 'सभी $count कैमरे अनलॉक करें।';
  }

  @override
  String get paywallWatermarkTitle => 'बिना वॉटरमार्क का रीकैप';

  @override
  String get paywallWatermarkSub =>
      'अपना रीकैप CamTrip लोगो के बिना शेयर करें।';

  @override
  String get paywallDeletionTitle => 'अपनी ट्रिप रखें';

  @override
  String paywallDeletionSub(String date) {
    return 'मुफ़्त ट्रिप $date को हट जाती हैं। Trip Pass या Pro से यह हमेशा रहती है।';
  }

  @override
  String paywallTripPassTerms(String price) {
    return 'इस ट्रिप के लिए $price की एक बार की खरीदारी। सब्सक्रिप्शन नहीं।';
  }

  @override
  String get buyTripPass => 'Trip Pass लें';

  @override
  String get tripPassActive => 'Trip Pass चालू: यह ट्रिप सबके लिए Pro है';

  @override
  String get tripPassActivating =>
      'पेमेंट मिल गया। आपका Trip Pass थोड़ी देर में चालू हो जाएगा।';

  @override
  String proViaTripPass(String name) {
    return '$name का Trip Pass';
  }

  @override
  String rollCounterSemantics(int used, int limit) {
    return 'आपके रोल पर $limit में से $used शॉट';
  }

  @override
  String rollHeldTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count फ़ोटो आपके रोल पर नहीं आ रहीं',
      one: '$count फ़ोटो आपके रोल पर नहीं आ रही',
    );
    return '$_temp0';
  }

  @override
  String get rollHeldBody => 'इन्हें Pro या Trip Pass से रखें';

  @override
  String deletionBannerTitle(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'अपनी ट्रिप रखें - $days दिन बाकी',
      one: 'अपनी ट्रिप रखें - $days दिन बाकी',
    );
    return '$_temp0';
  }

  @override
  String get deletionBannerBody =>
      'मुफ़्त ट्रिप खत्म होने के 30 दिन बाद हट जाती हैं। Trip Pass या Pro से यह हमेशा रहती है।';

  @override
  String apiRollFull(int limit) {
    return 'आपका रोल भर गया ($limit शॉट)। फ़ोटो लेते रहने के लिए Trip Pass या Pro लें।';
  }

  @override
  String get apiTripPassFailed =>
      'Trip Pass चालू नहीं हो सका। support@camtrip.app से संपर्क करें।';

  @override
  String get apiTripPassExists => 'इस ट्रिप के पास पहले से Trip Pass है।';

  @override
  String get tripPassUnavailable =>
      'Trip Pass अभी उपलब्ध नहीं है। बाद में फिर कोशिश करें।';

  @override
  String get tripMapTitle => 'ट्रिप मैप';

  @override
  String get tripMapOpen => 'मैप और आँकड़े';

  @override
  String get tripMapLoadFailed => 'ट्रिप मैप लोड नहीं हो सका';

  @override
  String get tripMapStatDays => 'दिन';

  @override
  String get tripMapStatPhotos => 'फ़ोटो';

  @override
  String get tripMapStatVideos => 'वीडियो';

  @override
  String get tripMapStatMembers => 'सदस्य';

  @override
  String get tripMapStatDistance => 'किमी यात्रा';

  @override
  String get tripMapStatCountries => 'देश';

  @override
  String get tripMapStatPlaces => 'जगहें';

  @override
  String tripMapBusiestDay(String day, int count) {
    return 'सबसे ज़्यादा फ़ोटो $day को ($count)';
  }

  @override
  String tripMapTopPhotographer(String name, int count) {
    return 'टॉप फ़ोटोग्राफ़र: $name ($count)';
  }

  @override
  String get tripMapOffTitle => 'ट्रिप मैप बंद है';

  @override
  String get tripMapOffMessage =>
      'ग्रुप का एडमिन ग्रुप सेटिंग में ट्रिप मैप चालू कर सकता है। आँकड़े आपको हमेशा दिखते हैं।';

  @override
  String get tripMapOffMessageAdmin =>
      'ट्रिप मैप चालू करें और देखें कि आपकी फ़ोटो कहाँ ली गईं। हर व्यक्ति खुद तय करता है कि वह शामिल हो या नहीं।';

  @override
  String get tripMapEnable => 'ट्रिप मैप चालू करें';

  @override
  String get tripMapEmptyTitle => 'अभी मैप पर कोई जगह नहीं';

  @override
  String get tripMapEmptyMessage =>
      'लोकेशन शेयर करने वाले सदस्यों की नई फ़ोटो यहाँ दिखेंगी, लगभग 100 मीटर तक राउंड करके।';

  @override
  String get tripMapConsentTitle => 'ट्रिप मैप';

  @override
  String get tripMapConsentQuestion =>
      'क्या आप इस ग्रुप के ट्रिप मैप पर दिखाना चाहते हैं कि आपकी फ़ोटो कहाँ ली गईं?';

  @override
  String get tripMapConsentDetail =>
      'सिर्फ़ ग्रुप के सदस्य देखते हैं, लगभग 100 मीटर तक राउंड करके। लोकेशन कभी फ़ोटो में नहीं डाली जाती, और आप इसे ग्रुप सेटिंग में कभी भी बंद कर सकते हैं।';

  @override
  String get tripMapConsentYes => 'हाँ, शेयर करें';

  @override
  String get tripMapConsentNo => 'नहीं';

  @override
  String get tripMapLocationDenied =>
      'आपकी लोकेशन की ऐक्सेस नहीं है। आप इसे फ़ोन की सेटिंग में दे सकते हैं।';

  @override
  String get tripMapSettingSubtitle =>
      'मैप पर दिखाएँ कि फ़ोटो कहाँ ली गईं। सदस्य खुद तय करते हैं कि शेयर करें या नहीं।';

  @override
  String get tripMapDisableTitle => 'ट्रिप मैप बंद करें?';

  @override
  String get tripMapDisableMessage =>
      'इस ग्रुप की सभी लोकेशन हट जाएँगी। बाद में मैप फिर चालू करने पर सबसे दोबारा पूछा जाएगा।';

  @override
  String get tripMapDisable => 'बंद करें';

  @override
  String get tripMapMySharing => 'मेरी लोकेशन शेयर करें';

  @override
  String get tripMapMySharingOn =>
      'आपकी नई फ़ोटो ट्रिप मैप पर दिखेंगी (लगभग 100 मीटर तक राउंड करके)।';

  @override
  String get tripMapMySharingOff => 'बंद। आपकी फ़ोटो मैप पर नहीं दिखतीं।';

  @override
  String get tripMapStopSharingTitle => 'अपनी लोकेशन शेयर करना बंद करें?';

  @override
  String get tripMapStopSharingMessage =>
      'इस ग्रुप में आपकी सभी फ़ोटो की लोकेशन हट जाएँगी।';

  @override
  String get tripMapStopSharing => 'शेयर करना बंद करें';
}
