// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bulgarian (`bg`).
class AppLocalizationsBg extends AppLocalizations {
  AppLocalizationsBg([String locale = 'bg']) : super(locale);

  @override
  String get cancel => 'Отказ';

  @override
  String get yes => 'Да';

  @override
  String inviteMessageIntro(String groupName) {
    return 'Ела в „$groupName“ в CamTrip! Така веднага ще виждаме снимките си.';
  }

  @override
  String inviteMessageCode(String code) {
    return 'Или въведи кода: $code';
  }

  @override
  String get memberFallbackName => 'Приятел';

  @override
  String get reportReasonInappropriate => 'Неподходящо или обидно';

  @override
  String get reportReasonSpam => 'Спам';

  @override
  String get reportReasonOther => 'Друго';

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
  String get errorOffline => 'Няма връзка. Опитай пак след малко.';

  @override
  String errorSomethingWrongStatus(int status) {
    return 'Нещо се обърка ($status)';
  }

  @override
  String get errorSomethingWrong => 'Нещо се обърка';

  @override
  String get apiInvalidCredentials => 'Грешен имейл адрес или парола';

  @override
  String get apiInvalidCode => 'Кодът е грешен или е изтекъл. Поискай нов код.';

  @override
  String get apiEmailTaken =>
      'Вече има акаунт с този имейл адрес. Влез или избери „Забравена парола?“.';

  @override
  String apiEmailTakenProvider(String provider) {
    return 'Вече има акаунт с този имейл адрес. Влез с $provider.';
  }

  @override
  String apiWeakPassword(int min) {
    return 'Избери парола от поне $min знака';
  }

  @override
  String apiNameTooLong(int max) {
    return 'Името ти може да е най-много $max знака';
  }

  @override
  String get apiRateLimited => 'Твърде много опити. Опитай пак след 15 минути.';

  @override
  String apiAccountBanned(String email) {
    return 'Акаунтът ти е блокиран. Пиши на $email, ако смяташ, че това е грешка.';
  }

  @override
  String get apiProRequired => 'Този стил на камерата е част от CamTrip Pro';

  @override
  String get apiGroupClosed => 'Тази група е затворена';

  @override
  String get apiGroupCodeNotFound => 'Няма група с този код';

  @override
  String apiGroupFull(int max) {
    return 'Групата е пълна (макс. $max членове). Ако един член има CamTrip Pro, всеки може да се присъедини.';
  }

  @override
  String get apiLastMember =>
      'Ти си последният член. Вместо това изтрий групата.';

  @override
  String get apiAdminRequired => 'Само за администратори на CamTrip';

  @override
  String get apiUploadIncomplete => 'Качването не е завършено';

  @override
  String get apiInvalidInput => 'Невалидни данни';

  @override
  String get apiNotSignedIn => 'Не си влязъл';

  @override
  String get apiAccountGone => 'Този акаунт вече не съществува';

  @override
  String get apiPhotoNotFound => 'Снимката не е намерена';

  @override
  String get apiGroupNotFound => 'Групата не е намерена';

  @override
  String get apiMemberNotFound => 'Членът не е намерен';

  @override
  String get apiPersonNotFound => 'Човекът не е намерен';

  @override
  String get apiUserNotFound => 'Потребителят не е намерен';

  @override
  String get apiAdminOnly => 'Само админ може да направи това';

  @override
  String get apiCannotBlockSelf => 'Не можеш да блокираш себе си';

  @override
  String get apiCannotReportOwn =>
      'Не можеш да докладваш собствената си снимка';

  @override
  String get apiDeleteOwnOnly => 'Можеш да изтриваш само свои снимки';

  @override
  String get apiOwnerCannotBeRemoved =>
      'Създателят на групата не може да бъде премахнат';

  @override
  String get apiOwnerStaysAdmin => 'Създателят винаги остава админ';

  @override
  String get apiNeedsOneAdmin => 'Групата трябва да има поне един админ';

  @override
  String get apiEndBeforeStart => 'Крайната дата е преди началната';

  @override
  String get apiPermanentNoEndDate =>
      'Винаги отворената група няма крайна дата';

  @override
  String get apiCannotBanAdmin => 'Администратор не може да бъде блокиран';

  @override
  String get apiReportNotFound => 'Сигналът не е намерен';

  @override
  String get apiPhotoOwnerUnknown =>
      'Авторът на тази снимка вече не е известен';

  @override
  String get validationNameRequired => 'Въведи името си';

  @override
  String validationMaxChars(int max) {
    return 'Най-много $max знака';
  }

  @override
  String get validationEmailRequired => 'Въведи имейл адреса си';

  @override
  String get validationEmailInvalid => 'Този имейл адрес не е валиден';

  @override
  String get validationPasswordRequired => 'Избери парола';

  @override
  String validationMinChars(int min) {
    return 'Поне $min знака';
  }

  @override
  String get validationPasswordTooLong => 'Паролата е твърде дълга';

  @override
  String get validationPasswordEmpty => 'Въведи паролата си';

  @override
  String get validationCodeRequired => 'Въведи кода от имейла';

  @override
  String get validationCodeDigits => 'Кодът е от 6 цифри';

  @override
  String get onboarding1Title => 'Една лента\nза цялата група.';

  @override
  String get onboarding1Body =>
      'Снимай с ретро камера. Всички виждат снимките ти веднага, а те са и в твоя албум.';

  @override
  String get onboarding2Title => 'Край на\nпращането на снимки.';

  @override
  String get onboarding2Body =>
      'Създай група, сподели кода, готово. Никога повече „ще ми пратиш ли снимките?“';

  @override
  String get onboarding3Title => 'Видео обобщение\nслед това.';

  @override
  String get onboarding3Body =>
      'CamTrip прави видео с музика от най-хубавите ви общи моменти.';

  @override
  String get onboardingInvited => 'Поканен си! Влез, за да се присъединиш.';

  @override
  String get signInAppleFailed => 'Влизането с Apple не успя';

  @override
  String get signInGoogleFailed => 'Влизането с Google не успя';

  @override
  String get signInFailed => 'Влизането не успя';

  @override
  String get next => 'Напред';

  @override
  String get legalPrefix => 'Продължавайки, приемаш';

  @override
  String get legalTerms => 'условията';

  @override
  String get legalAnd => ' и';

  @override
  String get legalPrivacy => 'политиката за поверителност';

  @override
  String get legalSuffix => '.';

  @override
  String get continueWithApple => 'Продължи с Apple';

  @override
  String get continueWithGoogle => 'Продължи с Google';

  @override
  String get createAccount => 'Създай акаунт';

  @override
  String get signIn => 'Вход';

  @override
  String get or => 'или';

  @override
  String get registerSubtitle =>
      'За да виждат приятелите ти кой е направил снимките.';

  @override
  String get loginSubtitle => 'Добре дошъл отново.';

  @override
  String get forgotPasswordTitle => 'Забравена парола';

  @override
  String get forgotPasswordPushSubtitle =>
      'Още си влязъл някъде? Ще ти изпратим там 6-цифрен код като push известие, за да зададеш нова парола.';

  @override
  String get newPassword => 'Нова парола';

  @override
  String get resetPushInfo =>
      'Ако още си влязъл някъде, там ще получиш push известие с код. Не можеш да влезеш? Влез с Apple или Google със същия имейл адрес - акаунтът ти ще бъде свързан.';

  @override
  String get sendCode => 'Изпрати код';

  @override
  String get savePassword => 'Запази паролата';

  @override
  String get errorTryAgain => 'Нещо се обърка. Опитай пак.';

  @override
  String get back => 'Назад';

  @override
  String get name => 'Име';

  @override
  String get email => 'Имейл адрес';

  @override
  String get codeFromPush => 'Код от известието';

  @override
  String get password => 'Парола';

  @override
  String get hidePassword => 'Скрий паролата';

  @override
  String get showPassword => 'Покажи паролата';

  @override
  String get forgotPasswordLink => 'Забравена парола?';

  @override
  String get haveAccount => 'Вече имаш акаунт?';

  @override
  String get newToCamTrip => 'Нов си в CamTrip?';

  @override
  String get rememberedIt => 'Сети ли се?';

  @override
  String get noCodeReceived => 'Не получи код?';

  @override
  String get resendCode => 'Изпрати отново';

  @override
  String onboardingDemoRoll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count фотографи, 1 лента',
      one: '1 фотограф, 1 лента',
    );
    return '$_temp0';
  }

  @override
  String membersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count членове',
      one: '1 член',
    );
    return '$_temp0';
  }

  @override
  String photosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count снимки',
      one: '1 снимка',
    );
    return '$_temp0';
  }

  @override
  String videosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count видеа',
      one: '1 видео',
    );
    return '$_temp0';
  }

  @override
  String get justNow => 'сега';

  @override
  String get badgeNew => 'Ново';

  @override
  String recapTitle(String groupName) {
    return 'Обобщение $groupName';
  }

  @override
  String get styleFilm => 'Филм';

  @override
  String get styleInstant => 'Инстант';

  @override
  String get styleDisposable => 'Еднократна';

  @override
  String get styleBw => 'Ч/Б';

  @override
  String get styleGolden => 'Златно';

  @override
  String get styleChrome => 'Хром';

  @override
  String get styleFilmDescription => 'Топли цветове, зърно и оранжева дата';

  @override
  String get styleInstantDescription => 'Меки цветове и бяла рамка';

  @override
  String get styleDisposableDescription =>
      'Рязка светкавица, винетка и светлинни петна';

  @override
  String get styleBwDescription => 'Зърнесто черно-бяло с дълбок контраст';

  @override
  String get styleGoldenDescription =>
      'Винаги златен час, меко златисто сияние';

  @override
  String get styleChromeDescription =>
      'Студено, наситено и рязко, като слайд филм';

  @override
  String get shutterStopRecording => 'Спри записа';

  @override
  String get shutterStartRecording => 'Започни видеозапис';

  @override
  String get shutterTakePhoto => 'Снимай';

  @override
  String get modePhoto => 'Снимка';

  @override
  String get modeVideo => 'Видео';

  @override
  String get cameraNotFound => 'Не е намерена камера';

  @override
  String get cameraAccessNeeded =>
      'CamTrip има нужда от достъп до камерата. Включи го в Настройки.';

  @override
  String get cameraStartFailed => 'Камерата не можа да се стартира';

  @override
  String get albumAccessNeeded =>
      'Дай на CamTrip достъп до снимките си, за да ги запазва и в албума ти';

  @override
  String get albumSaveFailed =>
      'Запазването в албума не успя. Снимката все пак е споделена.';

  @override
  String styleProFallback(String style) {
    return 'Този стил е част от Pro. В тази група снимаш със $style.';
  }

  @override
  String get photoFailed => 'Снимането не успя. Опитай пак.';

  @override
  String get recordingFailed => 'Видеозаписът не успя';

  @override
  String get videoFailed => 'Създаването на видеото не успя. Опитай пак.';

  @override
  String get shootInGroup => 'Снимай в група';

  @override
  String get close => 'Затвори';

  @override
  String get flash => 'Светкавица';

  @override
  String get flashOn => 'Вкл.';

  @override
  String get flashOff => 'Изкл.';

  @override
  String get flashAuto => 'Авто';

  @override
  String get chooseGroup => 'Избери група';

  @override
  String get switchCamera => 'Смени камерата';

  @override
  String get createOrJoinFirst =>
      'Първо създай група или се присъедини към такава';

  @override
  String get proViaGroup => 'Pro чрез групата';

  @override
  String proViaName(String name) {
    return 'Pro чрез $name';
  }

  @override
  String get proStylesFreeViaMember =>
      'Pro стиловете в тази група са безплатни за теб благодарение на член с Pro';

  @override
  String proStylesFreeViaName(String name) {
    return 'Pro стилове в тази група: безплатни за теб благодарение на $name';
  }

  @override
  String get subscriptionsUnavailable =>
      'Абонаментите не са налични в момента. Опитай пак по-късно.';

  @override
  String get paymentPending =>
      'Плащането ти още се обработва. Pro ще се включи веднага щом приключи.';

  @override
  String get purchaseFailed => 'Покупката не успя. Опитай пак по-късно.';

  @override
  String get restoreUnavailable =>
      'Възстановяването на покупки не е възможно в момента. Опитай пак по-късно.';

  @override
  String get restoreFailed => 'Възстановяването не успя. Опитай пак по-късно.';

  @override
  String get welcomePro => 'Добре дошъл в CamTrip Pro! 🎉';

  @override
  String get proRestored => 'Pro е възстановен';

  @override
  String get noPurchaseFound => 'Не е намерена предишна покупка';

  @override
  String periodDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count дни',
      one: '1 ден',
    );
    return '$_temp0';
  }

  @override
  String periodWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count седмици',
      one: '1 седмица',
    );
    return '$_temp0';
  }

  @override
  String periodMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count месеца',
      one: '1 месец',
    );
    return '$_temp0';
  }

  @override
  String periodYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count години',
      one: '1 година',
    );
    return '$_temp0';
  }

  @override
  String get paywallHavePro => 'Имаш CamTrip Pro';

  @override
  String get paywallSubtitle => 'Всичко за следващото ти пътуване.';

  @override
  String paywallFeatureStyles(String styles) {
    return 'Всички стилове на камерата ($styles)';
  }

  @override
  String get paywallFeatureUnlimited =>
      'Неограничени членове и място, снимките се пазят завинаги';

  @override
  String get paywallFeatureNoWatermark => 'Обобщения без воден знак';

  @override
  String get paywallFeatureOriginal => 'Изтегляне в оригинално качество';

  @override
  String get planYear => 'Година';

  @override
  String get planMonth => 'Месец';

  @override
  String pricePerMonth(String price) {
    return '$price на месец';
  }

  @override
  String paywallSaveBadge(int percent) {
    return 'СПЕСТИ $percent%';
  }

  @override
  String get planMonthCancelAnytime => 'отказ по всяко време';

  @override
  String tryFree(String period) {
    return 'Пробвай $period безплатно';
  }

  @override
  String get becomePro => 'Вземи Pro';

  @override
  String get subscriptionsLoadFailed =>
      'Абонаментите не можаха да се заредят. Провери връзката си.';

  @override
  String legalAnnual(String price) {
    return 'Годишен абонамент за CamTrip Pro: $price на година.';
  }

  @override
  String legalAnnualTrial(String period, String price) {
    return 'Годишен абонамент за CamTrip Pro: $period безплатно, след това $price на година.';
  }

  @override
  String legalMonthly(String price) {
    return 'Месечен абонамент за CamTrip Pro: $price на месец.';
  }

  @override
  String legalMonthlyTrial(String period, String price) {
    return 'Месечен абонамент за CamTrip Pro: $period безплатно, след това $price на месец.';
  }

  @override
  String get legalBillingApple =>
      'Плащането се таксува в твоя Apple ID. Абонаментът се подновява автоматично, освен ако не го откажеш поне 24 часа преди края на периода. Можеш да го откажеш и управляваш в настройките на акаунта си в App Store.';

  @override
  String get legalBillingGoogle =>
      'Плащането се таксува в твоя акаунт в Google. Абонаментът се подновява автоматично, освен ако не го откажеш поне 24 часа преди края на периода. Можеш да го откажеш и управляваш в настройките на акаунта си в Google Play.';

  @override
  String get restorePurchases => 'Възстанови покупките';

  @override
  String get terms => 'Условия';

  @override
  String get privacy => 'Поверителност';

  @override
  String get groupProTitle => 'Един Pro в групата = Pro за всички в тази група';

  @override
  String get groupProBody =>
      'Ако един човек има Pro, цялата група получава всички стилове на камерата, неограничени членове, запазени снимки, оригинално качество и обобщения без воден знак.';

  @override
  String get groupCreated => 'Групата е създадена ✓';

  @override
  String get inviteFriends => 'Покани приятелите си';

  @override
  String get codeCopied => 'Кодът е копиран';

  @override
  String get shareLink => 'Сподели връзката';

  @override
  String inviteSubject(String groupName) {
    return 'Ела в $groupName в CamTrip';
  }

  @override
  String inviteMembersUnlimited(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count членове',
      one: '1 член',
    );
    return '$_temp0 · неограничено (Pro)';
  }

  @override
  String inviteMembersLimit(int count, int limit) {
    return '$count от $limit членове · Pro: неограничено';
  }

  @override
  String get toCamera => 'Към камерата';

  @override
  String get done => 'Готово';

  @override
  String get joinEnterCode => 'Въведи кода от 6 знака';

  @override
  String get joinGroupTitle => 'Присъедини се към група';

  @override
  String get joinGroupSubtitle =>
      'Въведи кода на приятелите си или сканирай техния QR код.';

  @override
  String get typeCode => 'Въведи код';

  @override
  String get scanQr => 'Сканирай QR';

  @override
  String get join => 'Присъедини се';

  @override
  String get groupNameRequired => 'Дай име на групата си';

  @override
  String get newGroup => 'Нова група';

  @override
  String get groupType => 'Вид група';

  @override
  String get groupTypeVacation => 'Ваканция';

  @override
  String get groupTypeVacationDescription =>
      'С начална и крайна дата, после се архивира';

  @override
  String get groupTypeEvent => 'Събитие';

  @override
  String get groupTypeEventDescription => 'Един ден или вечер, напр. парти';

  @override
  String get groupTypePermanent => 'Винаги отворена';

  @override
  String get groupTypePermanentDescription => 'За постоянната ти компания';

  @override
  String get date => 'Дата';

  @override
  String get departure => 'Заминаване';

  @override
  String get returnDate => 'Връщане';

  @override
  String get defaultCameraStyle => 'Стил на камерата по подразбиране';

  @override
  String freeLimitPermanent(int max) {
    return 'Безплатно: до $max членове. Неограничено с Pro.';
  }

  @override
  String freeLimitDated(int max, int days) {
    return 'Безплатно: до $max членове, снимките се пазят до $days дни след крайната дата. Неограничено и завинаги с Pro.';
  }

  @override
  String get createGroup => 'Създай група';

  @override
  String get group => 'Група';

  @override
  String groupCode(String code) {
    return 'код $code';
  }

  @override
  String get manage => 'Управление';

  @override
  String get rename => 'Преименувай';

  @override
  String get changeDates => 'Промени датите';

  @override
  String get finishTrip => 'Приключи пътуването';

  @override
  String get finishTripSubtitle => 'Крайната дата става днес';

  @override
  String get reopenGroup => 'Отвори групата отново';

  @override
  String get closeGroup => 'Затвори групата';

  @override
  String get reopenGroupSubtitle => 'Членовете отново могат да добавят снимки';

  @override
  String get closeGroupSubtitle =>
      'Никой не може да добавя снимки; всичко още може да се разглежда';

  @override
  String get members => 'Членове';

  @override
  String memberYou(String name) {
    return '$name (ти)';
  }

  @override
  String get blockedTag => 'блокиран';

  @override
  String get adminTag => 'админ';

  @override
  String removeMemberTitle(String name) {
    return 'Да премахнеш ли $name?';
  }

  @override
  String get removeMemberMessage => 'Снимките им остават в групата.';

  @override
  String get remove => 'Изтрий';

  @override
  String get removeMember => 'Премахни';

  @override
  String blockTitle(String name) {
    return 'Да блокираш ли $name?';
  }

  @override
  String blockMessage(String name) {
    return 'Вече няма да виждаш снимки и видеа от $name и да получаваш известия за тях. Можеш да отмениш това в Настройки.';
  }

  @override
  String get block => 'Блокирай';

  @override
  String get makeMember => 'Направи обикновен член';

  @override
  String get makeAdmin => 'Направи админ';

  @override
  String get removeFromGroup => 'Премахни от групата';

  @override
  String get unblock => 'Отблокирай';

  @override
  String get inviteFriendsButton => 'Покани приятели';

  @override
  String get you => 'Ти';

  @override
  String get unarchive => 'Върни от архива';

  @override
  String get archive => 'Архивирай';

  @override
  String get unarchiveSubtitle => 'Групата е отново при албумите ти';

  @override
  String archiveSubtitle(String section) {
    return 'Само за теб: групата отива в „$section“ най-долу в албумите ти';
  }

  @override
  String get archivedSection => 'Архивирани';

  @override
  String get hiddenPhotos => 'Скрити снимки';

  @override
  String get hiddenPhotosSubtitle => 'Снимки, които си скрил за себе си';

  @override
  String get leaveGroup => 'Напусни групата';

  @override
  String get leaveGroupSubtitle => 'Снимките ти остават в групата за другите';

  @override
  String get deleteGroup => 'Изтрий групата';

  @override
  String get deleteGroupSubtitle => 'Всички снимки се изтриват за всички';

  @override
  String groupArchived(String groupName) {
    return '„$groupName“ е архивирана';
  }

  @override
  String groupUnarchived(String groupName) {
    return '„$groupName“ е отново при албумите ти';
  }

  @override
  String get undo => 'Отмени';

  @override
  String get groupNameTitle => 'Име на групата';

  @override
  String get finishTripTitle => 'Да приключиш ли пътуването?';

  @override
  String get finishTripMessage =>
      'Крайната дата става днес. Още можеш да добавяш снимки; обобщението е готово.';

  @override
  String get finishTripConfirm => 'Приключи';

  @override
  String get tripFinished => 'Пътуването приключи';

  @override
  String leaveGroupTitle(String groupName) {
    return 'Да напуснеш ли „$groupName“?';
  }

  @override
  String get leaveGroupMessage =>
      'Снимките ти остават в групата за другите. По-късно можеш да се присъединиш отново с кода.';

  @override
  String get leave => 'Напусни';

  @override
  String groupDeleted(String groupName) {
    return '„$groupName“ е изтрита';
  }

  @override
  String get youAreAdmin => 'ти си админ';

  @override
  String get open => 'Отвори';

  @override
  String get archiveMenuSubtitle => 'Само за теб, другите няма да забележат';

  @override
  String get deleteGroupMenuSubtitle => 'За всички, с всички снимки';

  @override
  String get deleteGroupTitle => 'Да изтриеш ли групата?';

  @override
  String deleteGroupMessage(int count, String groupName, int memberCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Всички $count снимки и видеа',
      one: '1 снимка или видео',
    );
    String _temp1 = intl.Intl.pluralLogic(
      memberCount,
      locale: localeName,
      other: 'всички $memberCount членове',
      one: '1 член',
    );
    return '$_temp0 в „$groupName“ ще изчезнат за $_temp1. Това не може да се отмени.';
  }

  @override
  String get deleteGroupOwnRoll => 'Собствената ти галерия остава непроменена.';

  @override
  String get deleteGroupTypeName => 'Въведи името на групата за потвърждение:';

  @override
  String get deleteForEveryone => 'Изтрий за всички';

  @override
  String get save => 'Запази';

  @override
  String get yourAlbums => 'Твоите албуми';

  @override
  String get uploadQueue => 'Опашка за качване';

  @override
  String get noConnection => 'Няма връзка';

  @override
  String get albumsOfflineMessage =>
      'Албумите ти ще се заредят, когато си отново онлайн. Камерата пак работи.';

  @override
  String get retry => 'Опитай пак';

  @override
  String get noAlbumsTitle => 'Още няма албуми';

  @override
  String get noAlbumsMessage =>
      'Създай група за следващото си пътуване или се присъедини към група на приятел с кода му.';

  @override
  String get haveCode => 'Имам код';

  @override
  String get joinWithCode => 'Присъедини се с код или QR код';

  @override
  String get camera => 'Камера';

  @override
  String get restore => 'Възстанови';

  @override
  String get more => 'Още';

  @override
  String get newAlbum => 'Нов';

  @override
  String get closedTag => 'затворена';

  @override
  String get activeTag => 'активна';

  @override
  String get uploadFailed => 'Качването не успя';

  @override
  String get queueNoSignal => 'Няма сигнал.';

  @override
  String get queueNoSignalMessage =>
      'Снимките ти вече са в албума ти и ще бъдат споделени веднага щом си отново онлайн.';

  @override
  String get queueWaitingForWifi => 'Изчакване на Wi-Fi.';

  @override
  String queueWifiOnlyOn(String setting) {
    return 'Включил си „$setting“.';
  }

  @override
  String get queueVideosWifiOnly => 'Видеата се качват само през Wi-Fi.';

  @override
  String get queueAllShared => 'Всичко е споделено ✓';

  @override
  String queuePending(String items) {
    return '$items остават за споделяне';
  }

  @override
  String queuePendingBoth(String photos, String videos) {
    return '$photos и $videos остават за споделяне';
  }

  @override
  String get retryUpload => 'Опитай пак';

  @override
  String get removeFromQueue => 'Премахни от опашката';

  @override
  String get queueStatusWifi => 'Wi-Fi';

  @override
  String get queueStatusWaiting => 'изчакване';

  @override
  String get videosWifiOnlyTitle => 'Видеа само през Wi-Fi';

  @override
  String get videosWifiOnlySubtitle => 'Пести мобилните ти данни';

  @override
  String get retryNow => 'Опитай пак сега';

  @override
  String get yourName => 'Твоето име';

  @override
  String get settings => 'Настройки';

  @override
  String get tapToChangeName => 'Докосни, за да смениш името си';

  @override
  String get getCamTripPro => 'Вземи CamTrip Pro';

  @override
  String get photos => 'Снимки';

  @override
  String get saveOwnPhotos => 'Запазвай моите снимки в албум за всяка група';

  @override
  String get autoSaveOthers => 'Автоматично запазвай снимките на другите';

  @override
  String get wifiOnlyTitle => 'Качване само през Wi-Fi';

  @override
  String get dateStamp => 'Дата върху снимката';

  @override
  String get notifications => 'Известия';

  @override
  String get notifyNewPhotos => 'Нови снимки (обобщено)';

  @override
  String get notifyRecapReady => 'Обобщението е готово';

  @override
  String get camTripTeam => 'Екипът на CamTrip';

  @override
  String get adminEntrySubtitle =>
      'Потребители, даване на Pro, сигнали и статистика';

  @override
  String get account => 'Акаунт';

  @override
  String get manageSubscription => 'Управлявай абонамента';

  @override
  String get blockedPeople => 'Блокирани хора';

  @override
  String get nobody => 'Никой';

  @override
  String peopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count души',
      one: '1 човек',
    );
    return '$_temp0';
  }

  @override
  String get privacyPolicy => 'Политика за поверителност';

  @override
  String get contact => 'Контакт';

  @override
  String get signOut => 'Изход';

  @override
  String get deleteAccount => 'Изтрий акаунта';

  @override
  String get deleteAccountSubtitle => 'Изтрива акаунта ти и всички твои снимки';

  @override
  String get deleteAccountTitle => 'Да изтриеш ли акаунта?';

  @override
  String get deleteAccountMessage =>
      'Акаунтът ти и всички твои снимки и видеа ще бъдат изтрити, включително от групите. Откажи активния си абонамент в App Store или Google Play.';

  @override
  String get blockedTitle => 'Блокирани';

  @override
  String get blockedSubtitle => 'Не виждаш снимки от тези хора.';

  @override
  String get blockedNone => 'Не си блокирал никого.';

  @override
  String get unblockShort => 'Отблокирай';

  @override
  String get groupGone => 'Тази група вече не съществува или вече не си член.';

  @override
  String photosSavedToAlbum(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count снимки са запазени в „$album“',
      one: '1 снимка е запазена в „$album“',
    );
    return '$_temp0';
  }

  @override
  String photosDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count снимки са изтрити',
      one: '1 снимка е изтрита',
    );
    return '$_temp0';
  }

  @override
  String photosDeletedSkipped(int count, int skipped) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count снимки са изтрити',
      one: '1 снимка е изтрита',
    );
    return '$_temp0, $skipped пропуснати';
  }

  @override
  String photosHiddenForYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count снимки са скрити за теб',
      one: '1 снимка е скрита за теб',
    );
    return '$_temp0';
  }

  @override
  String get addedToFavorites => 'Добавено в любими';

  @override
  String get removedFromFavorites => 'Премахнато от любими';

  @override
  String get photoAccessSettings =>
      'Дай на CamTrip достъп до снимките си в Настройки';

  @override
  String photosBeingAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count снимки се добавят',
      one: '1 снимка се добавя',
    );
    return '$_temp0';
  }

  @override
  String photosUnreadable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count снимки не можаха да се прочетат',
      one: '1 снимка не можа да се прочете',
    );
    return '$_temp0';
  }

  @override
  String get groupNotLoaded => 'Групата не е заредена';

  @override
  String get noFavoritesTitle => 'Още няма любими';

  @override
  String get noPhotosTitle => 'Още няма снимки';

  @override
  String get noFavoritesMessage =>
      'Докосни звездата на снимка, за да я сложиш тук.';

  @override
  String get noPhotosMessage =>
      'Направи първата снимка. Всички в групата я виждат веднага.';

  @override
  String get openCamera => 'Отвори камерата';

  @override
  String savingProgress(int done, int total) {
    return 'Запазване... $done/$total';
  }

  @override
  String get sharePreparing => 'Подготовка...';

  @override
  String sharingProgress(int done, int total) {
    return 'Подготовка... $done/$total';
  }

  @override
  String get choosePhotos => 'Избери снимки';

  @override
  String selectedCount(int count) {
    return '$count избрани';
  }

  @override
  String get selectNone => 'Без избор';

  @override
  String get selectAll => 'Избери всички';

  @override
  String photosWaitingToShare(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count снимки чакат да бъдат споделени',
      one: '1 снимка чака да бъде споделена',
    );
    return '$_temp0';
  }

  @override
  String get recapReadyTitle => 'Обобщението ти е готово';

  @override
  String get recapReadySubtitle => 'Видео с музика от пътуването ти';

  @override
  String get watch => 'Гледай';

  @override
  String get makeRecapNow => 'Направи видео обобщение сега';

  @override
  String freeGroupDeleteNotice(String date) {
    return 'Безплатна група: снимките се пазят до $date. Запази ги или вземи Pro.';
  }

  @override
  String get filterAll => 'Всички';

  @override
  String get filterFavorites => 'Любими';

  @override
  String get filterPerPerson => 'По човек';

  @override
  String get filterPerson => 'Човек';

  @override
  String get select => 'Избери';

  @override
  String get hiddenFilter => 'Скрити';

  @override
  String get photosBy => 'Снимки от...';

  @override
  String get uploadedTag => 'качено';

  @override
  String get saveAll => 'Запази всички';

  @override
  String get favorite => 'Любима';

  @override
  String get unfavorite => 'Махни от любими';

  @override
  String get hide => 'Скрий';

  @override
  String get delete => 'Изтрий';

  @override
  String deletePhotosTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Да изтриеш ли $count снимки?',
      one: 'Да изтриеш ли снимката?',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Те изчезват за всички в групата. Това не може да се отмени.',
      one: 'Тя изчезва за всички в групата. Това не може да се отмени.',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosNotAllowed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count снимки са на някой друг. Те остават; само админ може да ги изтрие.',
      one: '1 снимка е на някой друг. Тя остава; само админ може да я изтрие.',
    );
    return '$_temp0';
  }

  @override
  String photosBackInGroup(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count снимки са отново в групата',
      one: '1 снимка е отново в групата',
    );
    return '$_temp0';
  }

  @override
  String get showAll => 'Покажи всички';

  @override
  String get hiddenPhotosExplainer =>
      'Само ти вече не виждаш тези снимки. За другите в групата те все още са там.';

  @override
  String get nothingHidden => 'Нищо не е скрито';

  @override
  String get nothingHiddenMessage =>
      'Снимките, които скриеш, ще се появят тук.';

  @override
  String showAgainCount(int count) {
    return 'Покажи отново ($count)';
  }

  @override
  String get someone => 'Някой';

  @override
  String get savedToAlbum => 'Запазено в фотоалбума ти';

  @override
  String get share => 'Сподели';

  @override
  String get shareFailed => 'Споделянето не успя';

  @override
  String get reportTitle => 'Защо докладваш тази снимка?';

  @override
  String get reportSubtitle =>
      'Преглеждаме всеки сигнал до 24 часа. Снимката се скрива за теб веднага.';

  @override
  String get reportThanks => 'Благодарим, ще я прегледаме';

  @override
  String blockMessageAllGroups(String name) {
    return 'Вече няма да виждаш снимки и видеа от $name в никоя група и да получаваш известия за тях. Можеш да отмениш това в Настройки.';
  }

  @override
  String userBlocked(String name) {
    return '$name е блокиран';
  }

  @override
  String get videoHiddenForYou => 'Видеото е скрито за теб';

  @override
  String get photoHiddenForYou => 'Снимката е скрита за теб';

  @override
  String get setAsCover => 'Направи корица';

  @override
  String get coverUpdated => 'Корицата е обновена';

  @override
  String get hideForMe => 'Скрий за мен';

  @override
  String get hideForMeSubtitle => 'Другите в групата още я виждат';

  @override
  String get reportPhoto => 'Докладвай снимката';

  @override
  String blockName(String name) {
    return 'Блокирай $name';
  }

  @override
  String get forEveryoneInGroup => 'За всички в групата';

  @override
  String get videoDeleted => 'Видеото е изтрито';

  @override
  String get photoDeleted => 'Снимката е изтрита';

  @override
  String get photoAccessToSave =>
      'Дай на CamTrip достъп до снимките си в Настройки, за да ги запазваш';

  @override
  String get phoneFull => 'Телефонът ти е пълен';

  @override
  String get albumSaveFailedShort => 'Запазването в албума не успя';

  @override
  String get recapTemplateGoldenHour => 'Златен час';

  @override
  String get recapTemplateFast => 'Бързо';

  @override
  String get recapTemplateFilmRoll => 'Филмова лента';

  @override
  String get recapTemplatePolaroid => 'Полароид';

  @override
  String get trackSummerEvening => 'Лятна вечер';

  @override
  String get trackGoldenHour => 'Златен час';

  @override
  String get trackRoadtrip => 'Пътешествие';

  @override
  String get moodWarm => 'топло';

  @override
  String get moodCheerful => 'весело';

  @override
  String friendsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count приятели',
      one: '1 приятел',
    );
    return '$_temp0';
  }

  @override
  String get madeWithCamTrip => 'Направено с CamTrip';

  @override
  String get tagline => 'Една лента за цялата група';

  @override
  String get videoUnsupportedDevice =>
      'Създаването на видео не успя на това устройство';

  @override
  String get groupLoadFailed => 'Тази група не можа да се зареди.';

  @override
  String recapNeedsPhotos(int count) {
    return 'Трябват ти поне $count снимки за обобщение.';
  }

  @override
  String get recapFailed => 'Създаването на обобщението не успя. Опитай пак.';

  @override
  String get recapSaved => 'Обобщението е запазено в фотоалбума ти';

  @override
  String get recap => 'Обобщение';

  @override
  String get recapRendering => 'Създаване на обобщение...';

  @override
  String get videoRendering => 'Създаване на видео...';

  @override
  String get template => 'Шаблон';

  @override
  String get musicLicense => 'Собствена музика на CamTrip · без авторски такси';

  @override
  String get change => 'Промени';

  @override
  String get noWatermark => 'Без воден знак ✓';

  @override
  String get removeWatermarkPro => 'Махни водния знак с Pro';

  @override
  String get proSourceSubscription => 'Абонамент';

  @override
  String get proSourceGift => 'Подарък';

  @override
  String get proSourceAdmin => 'Админ';

  @override
  String get proSourceGroup => 'Чрез група';

  @override
  String get noPro => 'Без Pro';

  @override
  String proStatusNoEnd(String source) {
    return 'Pro ($source), без крайна дата';
  }

  @override
  String proStatusUntil(String source, String date) {
    return 'Pro ($source), до $date';
  }

  @override
  String get lifetime => 'Завинаги';

  @override
  String get pickDate => 'Избери дата';

  @override
  String get noAccess => 'Няма достъп';

  @override
  String get adminOnlyTeam => 'Управлението е само за екипа на CamTrip.';

  @override
  String get adminOverview => 'Преглед';

  @override
  String get adminUsers => 'Потребители';

  @override
  String get adminReports => 'Сигнали';

  @override
  String adminsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count админи',
      one: '1 админ',
    );
    return '$_temp0';
  }

  @override
  String get adminNewThisWeek => 'Нови тази седмица';

  @override
  String get adminGroups => 'Групи';

  @override
  String get adminProSubscription => 'Pro с абонамент';

  @override
  String get adminProGift => 'Pro като подарък';

  @override
  String adminWithoutSubscription(int count) {
    return '$count без абонамент';
  }

  @override
  String get adminOpenReports => 'Отворени сигнали';

  @override
  String get adminSearchHint => 'Търси по име или имейл';

  @override
  String get nobodyFound => 'Никой не е намерен';

  @override
  String get loadMore => 'Зареди още';

  @override
  String get noEmail => 'Без имейл';

  @override
  String adminDeletePhotoMessage(String groupName) {
    return 'Снимката изчезва за всички в „$groupName“. Всички сигнали за тази снимка се приключват.';
  }

  @override
  String get adminBanMessage =>
      'Този акаунт вече не може да влиза и да използва приложението. Можеш да отмениш това по-късно.';

  @override
  String get adminDismissTitle => 'Да отхвърлиш ли сигнала?';

  @override
  String get adminDismissMessage =>
      'Снимката остава. Сигналът се отбелязва като приключен.';

  @override
  String get adminDismiss => 'Отхвърли';

  @override
  String get adminAccountBlocked => 'Акаунтът е блокиран';

  @override
  String get adminReportDismissed => 'Сигналът е отхвърлен';

  @override
  String get adminNoReports => 'Няма отворени сигнали';

  @override
  String get adminNoReportsMessage => 'Докладваните снимки се появяват тук.';

  @override
  String get deletedTag => 'Изтрито';

  @override
  String adminReportedBy(String name) {
    return 'От $name';
  }

  @override
  String adminPhotoBy(String name) {
    return 'Снимка от $name';
  }

  @override
  String reportsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count сигнала',
      one: '1 сигнал',
    );
    return '$_temp0';
  }

  @override
  String get adminDeletePhoto => 'Изтрий снимката';

  @override
  String get adminBlockCreator => 'Блокирай автора';

  @override
  String get loadFailed => 'Зареждането не успя';

  @override
  String get adminLifetimeProGiven => 'Pro завинаги е даден';

  @override
  String get adminProGiven => 'Pro е даден';

  @override
  String adminGiveProUntil(String date) {
    return 'Дай Pro до $date';
  }

  @override
  String get adminGiveProLifetime => 'Дай Pro завинаги';

  @override
  String adminGiveProFor(String period) {
    return 'Дай Pro за $period';
  }

  @override
  String get adminReasonHint => 'Причина, напр. приятел, тестер, инфлуенсър';

  @override
  String get adminGivePro => 'Дай Pro';

  @override
  String get adminRevokeTitle => 'Да оттеглиш ли подаръка?';

  @override
  String get adminRevokeMessage =>
      'Подареният Pro спира веднага. Собственият им абонамент продължава.';

  @override
  String get adminRevoke => 'Оттегли';

  @override
  String get adminGiftRevoked => 'Подаръкът е оттеглен';

  @override
  String get adminUnbanTitle => 'Да премахнеш ли блокирането?';

  @override
  String adminUnbanMessage(String name) {
    return '$name може отново да влиза.';
  }

  @override
  String get adminUnbanned => 'Блокирането е премахнато';

  @override
  String get adminBanUserMessage =>
      'Този акаунт вече не може да влиза и да използва приложението. Снимките остават.';

  @override
  String get adminUser => 'Потребител';

  @override
  String get adminNotVerified => 'непотвърден';

  @override
  String get adminRole => 'Роля';

  @override
  String get adminCreated => 'Създаден';

  @override
  String get unknown => 'Неизвестно';

  @override
  String get adminSignInWith => 'Влиза с';

  @override
  String get adminEmailMethod => 'Имейл';

  @override
  String get adminPhotosAndVideos => 'Снимки и видеа';

  @override
  String get adminStatus => 'Статус';

  @override
  String get adminActive => 'Активен';

  @override
  String adminActiveUntil(String date) {
    return 'Активен до $date';
  }

  @override
  String adminGiftFrom(String name) {
    return 'Подарък от $name';
  }

  @override
  String adminExpiredOn(String date) {
    return 'Изтекъл на $date';
  }

  @override
  String get adminExpired => 'Изтекъл';

  @override
  String adminUntil(String date) {
    return 'До $date';
  }

  @override
  String get adminGiveProTitle => 'Дай Pro';

  @override
  String get adminGiveProNote =>
      'Важи и за групите на този човек: един Pro в групата = Pro за всички в тази група.';

  @override
  String get adminRevokeGift => 'Оттегли подаръка';

  @override
  String get adminModeration => 'Модериране';

  @override
  String get adminCannotBanSelf => 'Не можеш да блокираш себе си.';

  @override
  String get adminCannotBanAdmin => 'Админ не може да бъде блокиран.';

  @override
  String get adminUnban => 'Премахни блокирането';

  @override
  String get adminBanAccount => 'Блокирай акаунта';

  @override
  String get googleSignInUnavailable => 'Влизането с Google още не е налично';

  @override
  String get cameraPickerTitle => 'Избери камерата си';

  @override
  String get cameraPickerSubtitle =>
      'Всяка камера дава на снимките ти собствен облик';

  @override
  String get cameraPickerChange => 'Смени камерата';

  @override
  String get cameraPickerUnlock => 'Отключи с Pro';

  @override
  String get cameraPickerSelected => 'Избрана';

  @override
  String get cameraPickerStyleSummer => 'Лято';

  @override
  String get cameraPickerStyleSummerDescription =>
      'Топли, избледнели цветове като снимка от 90-те';

  @override
  String get cameraPickerStyleNight => 'Нощ 800';

  @override
  String get cameraPickerStyleNightDescription =>
      'Кинолента: синкави сенки, топла светлина, много зърно';

  @override
  String get cameraPickerStyleSepia => 'Сепия';

  @override
  String get cameraPickerStyleSepiaDescription =>
      'Стара кафява снимка от кутията за обувки';

  @override
  String get cameraPickerStyleLomo => 'Ломо';

  @override
  String get cameraPickerStyleLomoDescription =>
      'Ярки цветове, тъмни ъгли и див цветови оттенък';

  @override
  String get cameraPickerStyleMint => 'Мента';

  @override
  String get cameraPickerStyleMintDescription =>
      'Меко и свежо със зелен оттенък';

  @override
  String get cameraPickerStylePastel => 'Розово';

  @override
  String get cameraPickerStylePastelDescription =>
      'Пастелни цветове с розово сияние и бяла рамка';

  @override
  String get cameraPickerStyleSuper8 => 'Super 8';

  @override
  String get cameraPickerStyleSuper8Description =>
      'Зърнесто и меко като старо домашно видео';

  @override
  String get paywallBenefitGroup => 'Един Pro = Pro за цялата група';

  @override
  String get paywallBenefitUnlimited =>
      'Неограничени членове, снимките се пазят завинаги';

  @override
  String get paywallBenefitQuality => 'Без воден знак, оригинално качество';

  @override
  String paywallFreeTrial(String period) {
    return '$period безплатно';
  }

  @override
  String paywallPriceYear(String price) {
    return '$price на година.';
  }

  @override
  String paywallPriceYearTrial(String period, String price) {
    return '$period безплатно, след това $price на година.';
  }

  @override
  String paywallPriceMonth(String price) {
    return '$price на месец.';
  }

  @override
  String paywallPriceMonthTrial(String period, String price) {
    return '$period безплатно, след това $price на месец.';
  }

  @override
  String paywallAutoRenew(String store) {
    return 'Подновява се автоматично. Откажи поне 24 часа преди подновяването в $store.';
  }

  @override
  String get paywallDetailsTitle => 'Всичко в Pro';

  @override
  String get paywallBenefitStyles => 'Всички стилове на камерата';

  @override
  String get allPhotosTitle => 'Всички снимки';

  @override
  String get homeTabAlbums => 'Албуми';

  @override
  String get allPhotosEmptyTitle => 'Още няма снимки';

  @override
  String get allPhotosEmptyMessage =>
      'Отвори камерата и направи първата си снимка.';

  @override
  String get allPhotosLoadFailed => 'Снимките ти не можаха да се заредят';

  @override
  String get cameraSettingsTitle => 'Настройки на камерата';

  @override
  String get cameraSettingsMore => 'Още настройки';

  @override
  String get cameraSettingsGrid => 'Мрежа';

  @override
  String get cameraSettingsHaptics => 'Вибрация при снимане';

  @override
  String get cameraSettingsDateStamp => 'Дата долу вдясно';

  @override
  String get cameraSettingsSound => 'Звук на затвора';

  @override
  String get cameraSettingsSoundHint =>
      'Без звук, когато телефонът е на тих режим';

  @override
  String get cameraSettingsTimer => 'Самоснимачка';

  @override
  String get cameraSettingsTimerOff => 'Изкл.';

  @override
  String cameraSettingsTimerSeconds(int seconds) {
    return '$seconds сек';
  }

  @override
  String get cameraSettingsTimerCancelHint => 'Докосни затвора, за да отмениш';

  @override
  String get cameraSettingsMirror => 'Огледални селфита';

  @override
  String get cameraSettingsSaveToRoll => 'Запазвай в галерията';

  @override
  String get cameraSettingsQuality => 'Качество';

  @override
  String get cameraSettingsQualityStandard => 'Стандартно';

  @override
  String get cameraSettingsQualityHigh => 'Високо';

  @override
  String get cameraLowLightHint => 'Слаба светлина - включи светкавицата';

  @override
  String get cameraFlashUnavailable => 'Тази камера няма светкавица';

  @override
  String get cameraFlashScreen => 'Светкавица от екрана';

  @override
  String get cameraFlashCycleHint =>
      'Докосни, за да превключиш между изкл., вкл. и авто';

  @override
  String get cameraFlip => 'Превключи между предна и задна камера';

  @override
  String get cameraFlipHint =>
      'Докосни двукратно визьора, за да обърнеш камерата';

  @override
  String cameraPickerPaywallStyles(int count, String styles) {
    return 'Всички $count камери, включително $styles';
  }

  @override
  String get styleFlash => 'Флаш 400';

  @override
  String get styleFlashDescription =>
      'Директна светкавица върху топъл филм: кехлибарено сияние, зърно, наситено червено';

  @override
  String cameraTimerButton(String state) {
    return 'Самоснимачка: $state';
  }

  @override
  String get cameraTimerCycleHint =>
      'Докосни, за да превключиш между изкл., 3 сек и 10 сек';

  @override
  String get cameraLastShotOpen => 'Последна снимка, отваря албума';

  @override
  String get cameraLastShotEmpty => 'Още няма снимки, отваря албума';

  @override
  String get deleteOnlyOwnOrAdmin =>
      'Само авторът или админ може да изтрие това';

  @override
  String get videoPlay => 'Пусни';

  @override
  String get videoPause => 'Пауза';

  @override
  String get language => 'Език';

  @override
  String get languageSystem => 'Език на системата';

  @override
  String languageSystemCurrent(String language) {
    return 'Системен ($language)';
  }

  @override
  String get languageSearchHint => 'Търси език';

  @override
  String get languageNoResults => 'Не е намерен език';

  @override
  String get personalRollTitle => 'Моята лента';

  @override
  String get personalRollSubtitle => 'Само за теб';

  @override
  String get personalRollPickerSubtitle => 'Отделни снимки, само за теб';

  @override
  String get personalRollMove => 'В албум';

  @override
  String get personalRollMoveTitle => 'Премести в албум';

  @override
  String get personalRollMoveNoAlbums =>
      'Първо създай албум или се присъедини към такъв с код.';

  @override
  String personalRollMoved(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count снимки преместени в $album',
      one: '1 снимка преместена в $album',
    );
    return '$_temp0';
  }

  @override
  String get personalRollPrivateNote =>
      'Само ти виждаш тези снимки. Премести ги в албум, за да ги споделиш.';

  @override
  String get paywallTripPassSub => 'Само това пътуване, за цялата група';

  @override
  String get paywallOneTime => 'еднократно';

  @override
  String get paywallBestValue => 'Най-изгодно';

  @override
  String paywallRollFullTitle(int used, int limit) {
    return 'Лентата ти е пълна - $used/$limit снимки';
  }

  @override
  String get paywallRollFullSub => 'Снимай още с Trip Pass или Pro.';

  @override
  String get paywallCameraTitle => 'Тази камера е част от Pro';

  @override
  String paywallCameraSub(int count) {
    return 'Отключи всички $count камери.';
  }

  @override
  String get paywallWatermarkTitle => 'Recap без воден знак';

  @override
  String get paywallWatermarkSub => 'Сподели recap без логото на CamTrip.';

  @override
  String get paywallDeletionTitle => 'Запази пътуването';

  @override
  String paywallDeletionSub(String date) {
    return 'Безплатните пътувания се изтриват на $date. С Trip Pass или Pro остава завинаги.';
  }

  @override
  String paywallTripPassTerms(String price) {
    return 'Еднократна покупка за $price за това пътуване. Не е абонамент.';
  }

  @override
  String get buyTripPass => 'Купи Trip Pass';

  @override
  String get tripPassActive =>
      'Trip Pass е активен: пътуването е Pro за всички';

  @override
  String get tripPassActivating =>
      'Плащането е получено. Trip Pass ще е активен след малко.';

  @override
  String proViaTripPass(String name) {
    return 'Trip Pass от $name';
  }

  @override
  String rollCounterSemantics(int used, int limit) {
    return '$used от $limit кадъра на лентата ти';
  }

  @override
  String rollHeldTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count снимки не се побират на лентата',
      one: '1 снимка не се побира на лентата',
    );
    return '$_temp0';
  }

  @override
  String get rollHeldBody => 'Запази ги с Pro или Trip Pass';

  @override
  String deletionBannerTitle(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Запази пътуването - остават $days дни',
      one: 'Запази пътуването - остава 1 ден',
    );
    return '$_temp0';
  }

  @override
  String get deletionBannerBody =>
      'Безплатните пътувания се изтриват 30 дни след края. С Trip Pass или Pro остава завинаги.';

  @override
  String apiRollFull(int limit) {
    return 'Лентата ти е пълна ($limit кадъра). Вземи Trip Pass или Pro, за да продължиш.';
  }

  @override
  String get apiTripPassFailed =>
      'Trip Pass не можа да се активира. Пиши на support@camtrip.app.';

  @override
  String get apiTripPassExists => 'Това пътуване вече има Trip Pass.';

  @override
  String get tripPassUnavailable =>
      'Trip Pass не е наличен в момента. Опитай по-късно.';

  @override
  String get tripMapTitle => 'Карта на пътуването';

  @override
  String get tripMapOpen => 'Карта и статистика';

  @override
  String get tripMapLoadFailed => 'Картата не можа да се зареди';

  @override
  String get tripMapStatDays => 'Дни';

  @override
  String get tripMapStatPhotos => 'Снимки';

  @override
  String get tripMapStatVideos => 'Видеа';

  @override
  String get tripMapStatMembers => 'Членове';

  @override
  String get tripMapStatDistance => 'изминати км';

  @override
  String get tripMapStatCountries => 'Държави';

  @override
  String get tripMapStatPlaces => 'Места';

  @override
  String tripMapBusiestDay(String day, int count) {
    return 'Най-много снимки на $day ($count)';
  }

  @override
  String tripMapTopPhotographer(String name, int count) {
    return 'Най-добър фотограф: $name ($count)';
  }

  @override
  String get tripMapOffTitle => 'Картата на пътуването е изключена';

  @override
  String get tripMapOffMessage =>
      'Админ може да включи картата в настройките на групата. Статистиката виждаш винаги.';

  @override
  String get tripMapOffMessageAdmin =>
      'Включи картата, за да видите къде са направени снимките ви. Всеки сам решава дали да участва.';

  @override
  String get tripMapEnable => 'Включи картата';

  @override
  String get tripMapEmptyTitle => 'Още няма места на картата';

  @override
  String get tripMapEmptyMessage =>
      'Новите снимки на членовете, които споделят местоположението си, се появяват тук, закръглени до около 100 м.';

  @override
  String get tripMapConsentTitle => 'Карта на пътуването';

  @override
  String get tripMapConsentQuestion =>
      'Да показваме ли на картата на тази група къде са направени снимките ти?';

  @override
  String get tripMapConsentDetail =>
      'Виждат го само членовете на групата, закръглено до около 100 м. Местоположението никога не се записва в самата снимка и можеш да го изключиш по всяко време в настройките на групата.';

  @override
  String get tripMapConsentYes => 'Да, сподели';

  @override
  String get tripMapConsentNo => 'Не';

  @override
  String get tripMapLocationDenied =>
      'Няма достъп до местоположението ти. Можеш да го разрешиш в настройките на телефона.';

  @override
  String get tripMapSettingSubtitle =>
      'Показва на карта къде са направени снимките. Членовете сами решават дали да споделят.';

  @override
  String get tripMapDisableTitle => 'Да изключим ли картата?';

  @override
  String get tripMapDisableMessage =>
      'Всички местоположения в групата ще бъдат изтрити. Ако включиш картата отново по-късно, ще попитаме всички отново.';

  @override
  String get tripMapDisable => 'Изключи';

  @override
  String get tripMapMySharing => 'Споделяй местоположението ми';

  @override
  String get tripMapMySharingOn =>
      'Новите ти снимки се появяват на картата (закръглено до около 100 м).';

  @override
  String get tripMapMySharingOff =>
      'Изключено. Снимките ти не се появяват на картата.';

  @override
  String get tripMapStopSharingTitle =>
      'Да спреш ли да споделяш местоположението си?';

  @override
  String get tripMapStopSharingMessage =>
      'Местоположенията на всички твои снимки в тази група ще бъдат изтрити.';

  @override
  String get tripMapStopSharing => 'Спри споделянето';
}
