// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get cancel => 'Скасувати';

  @override
  String get yes => 'Так';

  @override
  String inviteMessageIntro(String groupName) {
    return 'Приєднуйся до «$groupName» у CamTrip! Тоді ми одразу бачитимемо фото одне одного.';
  }

  @override
  String inviteMessageCode(String code) {
    return 'Або введи код: $code';
  }

  @override
  String get memberFallbackName => 'Друг';

  @override
  String get reportReasonInappropriate => 'Недоречне або образливе';

  @override
  String get reportReasonSpam => 'Спам';

  @override
  String get reportReasonOther => 'Інше';

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
  String get errorOffline => 'Немає з\'єднання. Спробуй трохи пізніше.';

  @override
  String errorSomethingWrongStatus(int status) {
    return 'Щось пішло не так ($status)';
  }

  @override
  String get errorSomethingWrong => 'Щось пішло не так';

  @override
  String get apiInvalidCredentials =>
      'Неправильна електронна адреса або пароль';

  @override
  String get apiInvalidCode =>
      'Код неправильний або застарів. Запроси новий код.';

  @override
  String get apiEmailTaken =>
      'Акаунт із цією електронною адресою вже існує. Увійди або натисни «Забули пароль?».';

  @override
  String apiEmailTakenProvider(String provider) {
    return 'Акаунт із цією електронною адресою вже існує. Увійди через $provider.';
  }

  @override
  String apiWeakPassword(int min) {
    return 'Пароль має містити щонайменше $min символів';
  }

  @override
  String apiNameTooLong(int max) {
    return 'Ім\'я може містити не більше $max символів';
  }

  @override
  String get apiRateLimited => 'Забагато спроб. Спробуй знову через 15 хвилин.';

  @override
  String apiAccountBanned(String email) {
    return 'Твій акаунт заблоковано. Напиши на $email, якщо вважаєш, що це помилка.';
  }

  @override
  String get apiProRequired => 'Цей стиль камери входить до CamTrip Pro';

  @override
  String get apiGroupClosed => 'Цю групу закрито';

  @override
  String get apiGroupCodeNotFound => 'Групу з таким кодом не знайдено';

  @override
  String apiGroupFull(int max) {
    return 'Група заповнена (макс. $max учасників). Якщо в одного з учасників є CamTrip Pro, приєднатися може будь-хто.';
  }

  @override
  String get apiLastMember => 'Ти останній учасник. Краще видали групу.';

  @override
  String get apiAdminRequired => 'Лише для адміністраторів CamTrip';

  @override
  String get apiUploadIncomplete => 'Завантаження не завершено';

  @override
  String get apiInvalidInput => 'Неправильні дані';

  @override
  String get apiNotSignedIn => 'Вхід не виконано';

  @override
  String get apiAccountGone => 'Цього акаунта більше не існує';

  @override
  String get apiPhotoNotFound => 'Фото не знайдено';

  @override
  String get apiGroupNotFound => 'Групу не знайдено';

  @override
  String get apiMemberNotFound => 'Учасника не знайдено';

  @override
  String get apiPersonNotFound => 'Людину не знайдено';

  @override
  String get apiUserNotFound => 'Користувача не знайдено';

  @override
  String get apiAdminOnly => 'Це може зробити лише адмін';

  @override
  String get apiCannotBlockSelf => 'Не можна заблокувати себе';

  @override
  String get apiCannotReportOwn => 'Не можна поскаржитися на власне фото';

  @override
  String get apiDeleteOwnOnly => 'Видаляти можна лише власні фото';

  @override
  String get apiOwnerCannotBeRemoved => 'Творця групи не можна видалити';

  @override
  String get apiOwnerStaysAdmin => 'Творець завжди залишається адміном';

  @override
  String get apiNeedsOneAdmin => 'У групі має бути хоча б один адмін';

  @override
  String get apiEndBeforeStart => 'Дата завершення раніше за дату початку';

  @override
  String get apiPermanentNoEndDate => 'Постійна група не має дати завершення';

  @override
  String get apiCannotBanAdmin => 'Адміністратора не можна заблокувати';

  @override
  String get apiReportNotFound => 'Скаргу не знайдено';

  @override
  String get apiPhotoOwnerUnknown => 'Автор цього фото більше невідомий';

  @override
  String get validationNameRequired => 'Введи своє ім\'я';

  @override
  String validationMaxChars(int max) {
    return 'Не більше $max символів';
  }

  @override
  String get validationEmailRequired => 'Введи електронну адресу';

  @override
  String get validationEmailInvalid => 'Неправильна електронна адреса';

  @override
  String get validationPasswordRequired => 'Придумай пароль';

  @override
  String validationMinChars(int min) {
    return 'Щонайменше $min символів';
  }

  @override
  String get validationPasswordTooLong => 'Пароль задовгий';

  @override
  String get validationPasswordEmpty => 'Введи пароль';

  @override
  String get validationCodeRequired => 'Введи код із листа';

  @override
  String get validationCodeDigits => 'Код має 6 цифр';

  @override
  String get onboarding1Title => 'Одна плівка\nна всю компанію.';

  @override
  String get onboarding1Body =>
      'Знімай на ретрокамеру. Усі одразу бачать твої фото, і вони одразу ж є у твоєму альбомі.';

  @override
  String get onboarding2Title => 'Більше не треба\nпересилати фото.';

  @override
  String get onboarding2Body =>
      'Створи групу, поділися кодом - готово. Більше ніяких «скинь мені фотки».';

  @override
  String get onboarding3Title => 'Відеопідсумок\nпісля поїздки.';

  @override
  String get onboarding3Body =>
      'CamTrip зробить відео з музикою з ваших найкращих спільних моментів.';

  @override
  String get onboardingInvited => 'Тебе запросили! Увійди, щоб приєднатися.';

  @override
  String get signInAppleFailed => 'Не вдалося увійти через Apple';

  @override
  String get signInGoogleFailed => 'Не вдалося увійти через Google';

  @override
  String get signInFailed => 'Не вдалося увійти';

  @override
  String get next => 'Далі';

  @override
  String get legalPrefix => 'Продовжуючи, ти погоджуєшся з';

  @override
  String get legalTerms => 'умовами';

  @override
  String get legalAnd => ' і';

  @override
  String get legalPrivacy => 'політикою конфіденційності';

  @override
  String get legalSuffix => '.';

  @override
  String get continueWithApple => 'Продовжити з Apple';

  @override
  String get continueWithGoogle => 'Продовжити з Google';

  @override
  String get createAccount => 'Створити акаунт';

  @override
  String get signIn => 'Увійти';

  @override
  String get or => 'або';

  @override
  String get registerSubtitle => 'Щоб друзі бачили, хто зробив фото.';

  @override
  String get loginSubtitle => 'З поверненням.';

  @override
  String get forgotPasswordTitle => 'Забули пароль';

  @override
  String get forgotPasswordPushSubtitle =>
      'Ти ще десь увійшов? Ми надішлемо туди 6-значний код push-сповіщенням, щоб ти встановив новий пароль.';

  @override
  String get newPassword => 'Новий пароль';

  @override
  String get resetPushInfo =>
      'Якщо ти ще десь увійшов, туди прийде push-сповіщення з кодом. Не вдається увійти? Увійди через Apple або Google з тією самою електронною адресою - акаунт буде пов\'язано.';

  @override
  String get sendCode => 'Надіслати код';

  @override
  String get savePassword => 'Зберегти пароль';

  @override
  String get errorTryAgain => 'Щось пішло не так. Спробуй ще раз.';

  @override
  String get back => 'Назад';

  @override
  String get name => 'Ім\'я';

  @override
  String get email => 'Електронна адреса';

  @override
  String get codeFromPush => 'Код зі сповіщення';

  @override
  String get password => 'Пароль';

  @override
  String get hidePassword => 'Сховати пароль';

  @override
  String get showPassword => 'Показати пароль';

  @override
  String get forgotPasswordLink => 'Забули пароль?';

  @override
  String get haveAccount => 'Уже маєш акаунт?';

  @override
  String get newToCamTrip => 'Уперше в CamTrip?';

  @override
  String get rememberedIt => 'Згадав?';

  @override
  String get noCodeReceived => 'Не отримав код?';

  @override
  String get resendCode => 'Надіслати знову';

  @override
  String onboardingDemoRoll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count фотографа, 1 плівка',
      many: '$count фотографів, 1 плівка',
      few: '$count фотографи, 1 плівка',
      one: '$count фотограф, 1 плівка',
    );
    return '$_temp0';
  }

  @override
  String membersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count учасника',
      many: '$count учасників',
      few: '$count учасники',
      one: '$count учасник',
    );
    return '$_temp0';
  }

  @override
  String photosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count фото',
      many: '$count фото',
      few: '$count фото',
      one: '$count фото',
    );
    return '$_temp0';
  }

  @override
  String videosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count відео',
      many: '$count відео',
      few: '$count відео',
      one: '$count відео',
    );
    return '$_temp0';
  }

  @override
  String get justNow => 'зараз';

  @override
  String get badgeNew => 'Нове';

  @override
  String recapTitle(String groupName) {
    return 'Підсумок: $groupName';
  }

  @override
  String get styleFilm => 'Плівка';

  @override
  String get styleInstant => 'Інстант';

  @override
  String get styleDisposable => 'Одноразова';

  @override
  String get styleBw => 'Ч/Б';

  @override
  String get styleGolden => 'Золото';

  @override
  String get styleChrome => 'Хром';

  @override
  String get styleFilmDescription => 'Теплі кольори, зерно й помаранчева дата';

  @override
  String get styleInstantDescription => 'М\'які кольори й біла рамка';

  @override
  String get styleDisposableDescription => 'Різкий спалах, віньєтка й засвітки';

  @override
  String get styleBwDescription => 'Зернисте чорно-біле з глибоким контрастом';

  @override
  String get styleGoldenDescription =>
      'Вічна золота година, м\'яке золоте сяйво';

  @override
  String get styleChromeDescription =>
      'Холодний, насичений і різкий, як слайдова плівка';

  @override
  String get shutterStopRecording => 'Зупинити запис';

  @override
  String get shutterStartRecording => 'Почати запис відео';

  @override
  String get shutterTakePhoto => 'Зробити фото';

  @override
  String get modePhoto => 'Фото';

  @override
  String get modeVideo => 'Відео';

  @override
  String get cameraNotFound => 'Камеру не знайдено';

  @override
  String get cameraAccessNeeded =>
      'CamTrip потрібен доступ до камери. Увімкни його в Параметрах.';

  @override
  String get cameraStartFailed => 'Не вдалося запустити камеру';

  @override
  String get albumAccessNeeded =>
      'Дай CamTrip доступ до фото, щоб також зберігати їх у твій альбом';

  @override
  String get albumSaveFailed =>
      'Не вдалося зберегти в альбом. Фото все одно надіслано в групу.';

  @override
  String styleProFallback(String style) {
    return 'Цей стиль входить до Pro. У цій групі ти знімаєш у стилі $style.';
  }

  @override
  String get photoFailed => 'Не вдалося зробити фото. Спробуй ще раз.';

  @override
  String get recordingFailed => 'Не вдалося записати відео';

  @override
  String get videoFailed => 'Не вдалося створити відео. Спробуй ще раз.';

  @override
  String get shootInGroup => 'Знімати в групу';

  @override
  String get close => 'Закрити';

  @override
  String get flash => 'Спалах';

  @override
  String get flashOn => 'Увімк.';

  @override
  String get flashOff => 'Вимк.';

  @override
  String get flashAuto => 'Авто';

  @override
  String get chooseGroup => 'Вибрати групу';

  @override
  String get switchCamera => 'Змінити камеру';

  @override
  String get createOrJoinFirst => 'Спершу створи групу або приєднайся до неї';

  @override
  String get proViaGroup => 'Pro через групу';

  @override
  String proViaName(String name) {
    return 'Pro від $name';
  }

  @override
  String get proStylesFreeViaMember =>
      'Pro-стилі в цій групі безкоштовні для тебе завдяки учаснику з Pro';

  @override
  String proStylesFreeViaName(String name) {
    return 'Pro-стилі в цій групі: безкоштовно для тебе завдяки $name';
  }

  @override
  String get subscriptionsUnavailable =>
      'Підписки зараз недоступні. Спробуй пізніше.';

  @override
  String get paymentPending =>
      'Платіж ще обробляється. Pro увімкнеться, щойно він пройде.';

  @override
  String get purchaseFailed => 'Покупка не вдалася. Спробуй пізніше.';

  @override
  String get restoreUnavailable =>
      'Відновити покупки зараз неможливо. Спробуй пізніше.';

  @override
  String get restoreFailed => 'Не вдалося відновити. Спробуй пізніше.';

  @override
  String get welcomePro => 'Вітаємо в CamTrip Pro! 🎉';

  @override
  String get proRestored => 'Pro відновлено';

  @override
  String get noPurchaseFound => 'Попередніх покупок не знайдено';

  @override
  String periodDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count дня',
      many: '$count днів',
      few: '$count дні',
      one: '$count день',
    );
    return '$_temp0';
  }

  @override
  String periodWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count тижня',
      many: '$count тижнів',
      few: '$count тижні',
      one: '$count тиждень',
    );
    return '$_temp0';
  }

  @override
  String periodMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count місяця',
      many: '$count місяців',
      few: '$count місяці',
      one: '$count місяць',
    );
    return '$_temp0';
  }

  @override
  String periodYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count року',
      many: '$count років',
      few: '$count роки',
      one: '$count рік',
    );
    return '$_temp0';
  }

  @override
  String get paywallHavePro => 'У тебе CamTrip Pro';

  @override
  String get paywallSubtitle => 'Усе для наступної поїздки.';

  @override
  String paywallFeatureStyles(String styles) {
    return 'Усі стилі камери ($styles)';
  }

  @override
  String get paywallFeatureUnlimited =>
      'Без обмежень на учасників і пам\'ять, фото зберігаються назавжди';

  @override
  String get paywallFeatureNoWatermark => 'Підсумки без водяного знака';

  @override
  String get paywallFeatureOriginal => 'Завантаження в оригінальній якості';

  @override
  String get planYear => 'Рік';

  @override
  String get planMonth => 'Місяць';

  @override
  String pricePerMonth(String price) {
    return '$price на місяць';
  }

  @override
  String paywallSaveBadge(int percent) {
    return 'ЗАОЩАДЖУЙ $percent%';
  }

  @override
  String get planMonthCancelAnytime => 'скасування будь-коли';

  @override
  String tryFree(String period) {
    return 'Спробуй $period безкоштовно';
  }

  @override
  String get becomePro => 'Перейти на Pro';

  @override
  String get subscriptionsLoadFailed =>
      'Не вдалося завантажити підписки. Перевір з\'єднання.';

  @override
  String legalAnnual(String price) {
    return 'Річна підписка CamTrip Pro: $price на рік.';
  }

  @override
  String legalAnnualTrial(String period, String price) {
    return 'Річна підписка CamTrip Pro: $period безкоштовно, потім $price на рік.';
  }

  @override
  String legalMonthly(String price) {
    return 'Місячна підписка CamTrip Pro: $price на місяць.';
  }

  @override
  String legalMonthlyTrial(String period, String price) {
    return 'Місячна підписка CamTrip Pro: $period безкоштовно, потім $price на місяць.';
  }

  @override
  String get legalBillingApple =>
      'Оплата стягується з твого Apple ID. Підписка поновлюється автоматично, якщо не скасувати її щонайменше за 24 години до кінця періоду. Скасувати її та керувати нею можна в налаштуваннях акаунта App Store.';

  @override
  String get legalBillingGoogle =>
      'Оплата стягується з твого акаунта Google. Підписка поновлюється автоматично, якщо не скасувати її щонайменше за 24 години до кінця періоду. Скасувати її та керувати нею можна в налаштуваннях акаунта Google Play.';

  @override
  String get restorePurchases => 'Відновити покупки';

  @override
  String get terms => 'Умови';

  @override
  String get privacy => 'Конфіденційність';

  @override
  String get groupProTitle => 'Один Pro у групі = Pro для всіх у цій групі';

  @override
  String get groupProBody =>
      'Якщо в однієї людини є Pro, уся група отримує всі стилі камери, необмежену кількість учасників, збереження фото назавжди, оригінальну якість і підсумки без водяного знака.';

  @override
  String get groupCreated => 'Групу створено ✓';

  @override
  String get inviteFriends => 'Запроси друзів';

  @override
  String get codeCopied => 'Код скопійовано';

  @override
  String get shareLink => 'Поділитися посиланням';

  @override
  String inviteSubject(String groupName) {
    return 'Приєднуйся до $groupName у CamTrip';
  }

  @override
  String inviteMembersUnlimited(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count учасника',
      many: '$count учасників',
      few: '$count учасники',
      one: '$count учасник',
    );
    return '$_temp0 · без обмежень (Pro)';
  }

  @override
  String inviteMembersLimit(int count, int limit) {
    return '$count з $limit учасників · Pro: без обмежень';
  }

  @override
  String get toCamera => 'До камери';

  @override
  String get done => 'Готово';

  @override
  String get joinEnterCode => 'Введи 6-символьний код';

  @override
  String get joinGroupTitle => 'Приєднатися до групи';

  @override
  String get joinGroupSubtitle =>
      'Введи код друзів або відскануй їхній QR-код.';

  @override
  String get typeCode => 'Ввести код';

  @override
  String get scanQr => 'Сканувати QR';

  @override
  String get join => 'Приєднатися';

  @override
  String get groupNameRequired => 'Дай групі назву';

  @override
  String get newGroup => 'Нова група';

  @override
  String get groupType => 'Тип групи';

  @override
  String get groupTypeVacation => 'Відпустка';

  @override
  String get groupTypeVacationDescription =>
      'З датами початку й кінця, потім в архів';

  @override
  String get groupTypeEvent => 'Подія';

  @override
  String get groupTypeEventDescription =>
      'Один день або вечір, наприклад вечірка';

  @override
  String get groupTypePermanent => 'Завжди відкрита';

  @override
  String get groupTypePermanentDescription => 'Для твоєї постійної компанії';

  @override
  String get date => 'Дата';

  @override
  String get departure => 'Від\'їзд';

  @override
  String get returnDate => 'Повернення';

  @override
  String get defaultCameraStyle => 'Стиль камери за замовчуванням';

  @override
  String freeLimitPermanent(int max) {
    return 'Безкоштовно: до $max учасників. З Pro без обмежень.';
  }

  @override
  String freeLimitDated(int max, int days) {
    return 'Безкоштовно: до $max учасників, фото зберігаються $days дн. після дати завершення. З Pro без обмежень і назавжди.';
  }

  @override
  String get createGroup => 'Створити групу';

  @override
  String get group => 'Група';

  @override
  String groupCode(String code) {
    return 'код $code';
  }

  @override
  String get manage => 'Керування';

  @override
  String get rename => 'Перейменувати';

  @override
  String get changeDates => 'Змінити дати';

  @override
  String get finishTrip => 'Завершити поїздку';

  @override
  String get finishTripSubtitle => 'Датою завершення стане сьогодні';

  @override
  String get reopenGroup => 'Знову відкрити групу';

  @override
  String get closeGroup => 'Закрити групу';

  @override
  String get reopenGroupSubtitle => 'Учасники знову зможуть додавати фото';

  @override
  String get closeGroupSubtitle =>
      'Ніхто більше не зможе додавати фото; переглядати все можна й далі';

  @override
  String get members => 'Учасники';

  @override
  String memberYou(String name) {
    return '$name (ти)';
  }

  @override
  String get blockedTag => 'заблоковано';

  @override
  String get adminTag => 'адмін';

  @override
  String removeMemberTitle(String name) {
    return 'Видалити $name?';
  }

  @override
  String get removeMemberMessage => 'Фото цієї людини залишаться в групі.';

  @override
  String get remove => 'Видалити';

  @override
  String get removeMember => 'Видалити';

  @override
  String blockTitle(String name) {
    return 'Заблокувати $name?';
  }

  @override
  String blockMessage(String name) {
    return 'Ти більше не бачитимеш фото й відео від $name і не отримуватимеш сповіщень про них. Це можна скасувати в Налаштуваннях.';
  }

  @override
  String get block => 'Заблокувати';

  @override
  String get makeMember => 'Зробити звичайним учасником';

  @override
  String get makeAdmin => 'Зробити адміном';

  @override
  String get removeFromGroup => 'Видалити з групи';

  @override
  String get unblock => 'Розблокувати';

  @override
  String get inviteFriendsButton => 'Запросити друзів';

  @override
  String get you => 'Ти';

  @override
  String get unarchive => 'Повернути з архіву';

  @override
  String get archive => 'В архів';

  @override
  String get unarchiveSubtitle => 'Група знову серед твоїх альбомів';

  @override
  String archiveSubtitle(String section) {
    return 'Лише для тебе: група переміститься до «$section» унизу твоїх альбомів';
  }

  @override
  String get archivedSection => 'Архів';

  @override
  String get hiddenPhotos => 'Приховані фото';

  @override
  String get hiddenPhotosSubtitle => 'Фото, які ти приховав для себе';

  @override
  String get leaveGroup => 'Вийти з групи';

  @override
  String get leaveGroupSubtitle => 'Твої фото залишаться в групі для інших';

  @override
  String get deleteGroup => 'Видалити групу';

  @override
  String get deleteGroupSubtitle => 'Усі фото буде видалено для всіх';

  @override
  String groupArchived(String groupName) {
    return '«$groupName» в архіві';
  }

  @override
  String groupUnarchived(String groupName) {
    return '«$groupName» знову серед твоїх альбомів';
  }

  @override
  String get undo => 'Скасувати';

  @override
  String get groupNameTitle => 'Назва групи';

  @override
  String get finishTripTitle => 'Завершити поїздку?';

  @override
  String get finishTripMessage =>
      'Датою завершення стане сьогодні. Фото й далі можна додавати; підсумок готовий.';

  @override
  String get finishTripConfirm => 'Завершити';

  @override
  String get tripFinished => 'Поїздку завершено';

  @override
  String leaveGroupTitle(String groupName) {
    return 'Вийти з «$groupName»?';
  }

  @override
  String get leaveGroupMessage =>
      'Твої фото залишаться в групі для інших. Пізніше можна повернутися за кодом.';

  @override
  String get leave => 'Вийти';

  @override
  String groupDeleted(String groupName) {
    return '«$groupName» видалено';
  }

  @override
  String get youAreAdmin => 'ти адмін';

  @override
  String get open => 'Відкрити';

  @override
  String get archiveMenuSubtitle => 'Лише для тебе, інші не помітять';

  @override
  String get deleteGroupMenuSubtitle => 'Для всіх, разом з усіма фото';

  @override
  String get deleteGroupTitle => 'Видалити групу?';

  @override
  String deleteGroupMessage(int count, String groupName, int memberCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Усі $count фото й відео',
      many: 'Усі $count фото й відео',
      few: 'Усі $count фото й відео',
      one: '$count фото чи відео',
    );
    String _temp1 = intl.Intl.pluralLogic(
      memberCount,
      locale: localeName,
      other: 'усіх $memberCount учасників',
      many: 'усіх $memberCount учасників',
      few: 'усіх $memberCount учасників',
      one: '$memberCount учасника',
    );
    return '$_temp0 у «$groupName» зникнуть для $_temp1. Це не можна скасувати.';
  }

  @override
  String get deleteGroupOwnRoll => 'Твоя власна фотоплівка не зміниться.';

  @override
  String get deleteGroupTypeName => 'Введи назву групи для підтвердження:';

  @override
  String get deleteForEveryone => 'Видалити для всіх';

  @override
  String get save => 'Зберегти';

  @override
  String get yourAlbums => 'Твої альбоми';

  @override
  String get uploadQueue => 'Черга завантаження';

  @override
  String get noConnection => 'Немає з\'єднання';

  @override
  String get albumsOfflineMessage =>
      'Альбоми завантажаться, коли з\'явиться інтернет. Камера працює й так.';

  @override
  String get retry => 'Повторити';

  @override
  String get noAlbumsTitle => 'Альбомів ще немає';

  @override
  String get noAlbumsMessage =>
      'Створи групу для наступної поїздки або приєднайся до групи друга за кодом.';

  @override
  String get haveCode => 'У мене є код';

  @override
  String get joinWithCode => 'Приєднатися за кодом або QR-кодом';

  @override
  String get camera => 'Камера';

  @override
  String get restore => 'Відновити';

  @override
  String get more => 'Ще';

  @override
  String get newAlbum => 'Нова';

  @override
  String get closedTag => 'закрита';

  @override
  String get activeTag => 'активна';

  @override
  String get uploadFailed => 'Завантаження не вдалося';

  @override
  String get queueNoSignal => 'Немає мережі.';

  @override
  String get queueNoSignalMessage =>
      'Твої фото вже в альбомі й будуть надіслані, щойно з\'явиться інтернет.';

  @override
  String get queueWaitingForWifi => 'Очікування Wi-Fi.';

  @override
  String queueWifiOnlyOn(String setting) {
    return 'У тебе ввімкнено «$setting».';
  }

  @override
  String get queueVideosWifiOnly => 'Відео надсилаються лише через Wi-Fi.';

  @override
  String get queueAllShared => 'Усе надіслано ✓';

  @override
  String queuePending(String items) {
    return 'Залишилося надіслати: $items';
  }

  @override
  String queuePendingBoth(String photos, String videos) {
    return 'Залишилося надіслати: $photos і $videos';
  }

  @override
  String get retryUpload => 'Повторити';

  @override
  String get removeFromQueue => 'Прибрати з черги';

  @override
  String get queueStatusWifi => 'Wi-Fi';

  @override
  String get queueStatusWaiting => 'очікування';

  @override
  String get videosWifiOnlyTitle => 'Відео лише через Wi-Fi';

  @override
  String get videosWifiOnlySubtitle => 'Заощаджує мобільний трафік';

  @override
  String get retryNow => 'Повторити зараз';

  @override
  String get yourName => 'Твоє ім\'я';

  @override
  String get settings => 'Налаштування';

  @override
  String get tapToChangeName => 'Торкнися, щоб змінити ім\'я';

  @override
  String get getCamTripPro => 'Отримати CamTrip Pro';

  @override
  String get photos => 'Фото';

  @override
  String get saveOwnPhotos => 'Зберігати мої фото в альбом для кожної групи';

  @override
  String get autoSaveOthers => 'Автоматично зберігати фото інших';

  @override
  String get wifiOnlyTitle => 'Завантажувати лише через Wi-Fi';

  @override
  String get dateStamp => 'Дата на фото';

  @override
  String get notifications => 'Сповіщення';

  @override
  String get notifyNewPhotos => 'Нові фото (зведенням)';

  @override
  String get notifyRecapReady => 'Підсумок готовий';

  @override
  String get camTripTeam => 'Команда CamTrip';

  @override
  String get adminEntrySubtitle =>
      'Користувачі, видача Pro, скарги та статистика';

  @override
  String get account => 'Акаунт';

  @override
  String get manageSubscription => 'Керувати підпискою';

  @override
  String get blockedPeople => 'Заблоковані';

  @override
  String get nobody => 'Нікого';

  @override
  String peopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count людини',
      many: '$count людей',
      few: '$count людини',
      one: '$count людина',
    );
    return '$_temp0';
  }

  @override
  String get privacyPolicy => 'Політика конфіденційності';

  @override
  String get contact => 'Зв\'язатися';

  @override
  String get signOut => 'Вийти';

  @override
  String get deleteAccount => 'Видалити акаунт';

  @override
  String get deleteAccountSubtitle => 'Видаляє акаунт і всі твої фото';

  @override
  String get deleteAccountTitle => 'Видалити акаунт?';

  @override
  String get deleteAccountMessage =>
      'Твій акаунт і всі твої фото та відео буде видалено, зокрема з груп. Активну підписку скасуй в App Store або Google Play.';

  @override
  String get blockedTitle => 'Заблоковані';

  @override
  String get blockedSubtitle => 'Ти не бачиш фото цих людей.';

  @override
  String get blockedNone => 'Ти нікого не заблокував.';

  @override
  String get unblockShort => 'Розблокувати';

  @override
  String get groupGone => 'Цієї групи більше немає, або ти вже не учасник.';

  @override
  String photosSavedToAlbum(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count фото збережено в «$album»',
      many: '$count фото збережено в «$album»',
      few: '$count фото збережено в «$album»',
      one: '$count фото збережено в «$album»',
    );
    return '$_temp0';
  }

  @override
  String photosDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count фото видалено',
      many: '$count фото видалено',
      few: '$count фото видалено',
      one: '$count фото видалено',
    );
    return '$_temp0';
  }

  @override
  String photosDeletedSkipped(int count, int skipped) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count фото видалено',
      many: '$count фото видалено',
      few: '$count фото видалено',
      one: '$count фото видалено',
    );
    return '$_temp0, пропущено: $skipped';
  }

  @override
  String photosHiddenForYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count фото приховано для тебе',
      many: '$count фото приховано для тебе',
      few: '$count фото приховано для тебе',
      one: '$count фото приховано для тебе',
    );
    return '$_temp0';
  }

  @override
  String get addedToFavorites => 'Додано до вибраного';

  @override
  String get removedFromFavorites => 'Видалено з вибраного';

  @override
  String get photoAccessSettings => 'Дай CamTrip доступ до фото в Параметрах';

  @override
  String photosBeingAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Додаються $count фото',
      many: 'Додаються $count фото',
      few: 'Додаються $count фото',
      one: 'Додається $count фото',
    );
    return '$_temp0';
  }

  @override
  String photosUnreadable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Не вдалося прочитати $count фото',
      many: 'Не вдалося прочитати $count фото',
      few: 'Не вдалося прочитати $count фото',
      one: 'Не вдалося прочитати $count фото',
    );
    return '$_temp0';
  }

  @override
  String get groupNotLoaded => 'Групу не завантажено';

  @override
  String get noFavoritesTitle => 'Вибраного ще немає';

  @override
  String get noPhotosTitle => 'Фото ще немає';

  @override
  String get noFavoritesMessage =>
      'Торкнися зірочки на фото, щоб додати його сюди.';

  @override
  String get noPhotosMessage =>
      'Зроби перше фото. Усі в групі одразу його побачать.';

  @override
  String get openCamera => 'Відкрити камеру';

  @override
  String savingProgress(int done, int total) {
    return 'Збереження... $done/$total';
  }

  @override
  String get sharePreparing => 'Підготовка...';

  @override
  String sharingProgress(int done, int total) {
    return 'Підготовка... $done/$total';
  }

  @override
  String get choosePhotos => 'Вибрати фото';

  @override
  String selectedCount(int count) {
    return 'Вибрано: $count';
  }

  @override
  String get selectNone => 'Зняти вибір';

  @override
  String get selectAll => 'Вибрати все';

  @override
  String photosWaitingToShare(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count фото чекають на надсилання',
      many: '$count фото чекають на надсилання',
      few: '$count фото чекають на надсилання',
      one: '$count фото чекає на надсилання',
    );
    return '$_temp0';
  }

  @override
  String get recapReadyTitle => 'Твій підсумок готовий';

  @override
  String get recapReadySubtitle => 'Відео з музикою про твою поїздку';

  @override
  String get watch => 'Дивитися';

  @override
  String get makeRecapNow => 'Зробити відеопідсумок зараз';

  @override
  String freeGroupDeleteNotice(String date) {
    return 'Безкоштовна група: фото зберігаються до $date. Збережи їх або перейди на Pro.';
  }

  @override
  String get filterAll => 'Усі';

  @override
  String get filterFavorites => 'Вибране';

  @override
  String get filterPerPerson => 'За людьми';

  @override
  String get filterPerson => 'Людина';

  @override
  String get select => 'Вибрати';

  @override
  String get hiddenFilter => 'Приховані';

  @override
  String get photosBy => 'Фото від...';

  @override
  String get uploadedTag => 'завантажено';

  @override
  String get saveAll => 'Зберегти все';

  @override
  String get favorite => 'До вибраного';

  @override
  String get unfavorite => 'Прибрати з вибраного';

  @override
  String get hide => 'Приховати';

  @override
  String get delete => 'Видалити';

  @override
  String deletePhotosTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Видалити $count фото?',
      many: 'Видалити $count фото?',
      few: 'Видалити $count фото?',
      one: 'Видалити фото?',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Вони зникнуть для всіх у групі. Це не можна скасувати.',
      many: 'Вони зникнуть для всіх у групі. Це не можна скасувати.',
      few: 'Вони зникнуть для всіх у групі. Це не можна скасувати.',
      one: 'Воно зникне для всіх у групі. Це не можна скасувати.',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosNotAllowed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count фото належать іншим людям. Вони залишаться; видалити їх може лише адмін.',
      many:
          '$count фото належать іншим людям. Вони залишаться; видалити їх може лише адмін.',
      few:
          '$count фото належать іншим людям. Вони залишаться; видалити їх може лише адмін.',
      one:
          '$count фото належить іншій людині. Воно залишиться; видалити його може лише адмін.',
    );
    return '$_temp0';
  }

  @override
  String photosBackInGroup(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count фото знову в групі',
      many: '$count фото знову в групі',
      few: '$count фото знову в групі',
      one: '$count фото знову в групі',
    );
    return '$_temp0';
  }

  @override
  String get showAll => 'Показати всі';

  @override
  String get hiddenPhotosExplainer =>
      'Ці фото не бачиш лише ти. Для інших у групі вони на місці.';

  @override
  String get nothingHidden => 'Нічого не приховано';

  @override
  String get nothingHiddenMessage => 'Тут з\'являться фото, які ти приховаєш.';

  @override
  String showAgainCount(int count) {
    return 'Показати знову ($count)';
  }

  @override
  String get someone => 'Хтось';

  @override
  String get savedToAlbum => 'Збережено у фотоальбом';

  @override
  String get share => 'Поділитися';

  @override
  String get shareFailed => 'Не вдалося поділитися';

  @override
  String get reportTitle => 'Чому ти скаржишся на це фото?';

  @override
  String get reportSubtitle =>
      'Ми перевіряємо кожну скаргу протягом 24 годин. Для тебе фото приховано одразу.';

  @override
  String get reportThanks => 'Дякуємо, ми розберемося';

  @override
  String blockMessageAllGroups(String name) {
    return 'Ти більше не бачитимеш фото й відео від $name у жодній групі й не отримуватимеш сповіщень про них. Це можна скасувати в Налаштуваннях.';
  }

  @override
  String userBlocked(String name) {
    return '$name заблоковано';
  }

  @override
  String get videoHiddenForYou => 'Відео приховано для тебе';

  @override
  String get photoHiddenForYou => 'Фото приховано для тебе';

  @override
  String get setAsCover => 'Зробити обкладинкою';

  @override
  String get coverUpdated => 'Обкладинку оновлено';

  @override
  String get hideForMe => 'Приховати для мене';

  @override
  String get hideForMeSubtitle => 'Інші в групі й далі його бачать';

  @override
  String get reportPhoto => 'Поскаржитися на фото';

  @override
  String blockName(String name) {
    return 'Заблокувати $name';
  }

  @override
  String get forEveryoneInGroup => 'Для всіх у групі';

  @override
  String get videoDeleted => 'Відео видалено';

  @override
  String get photoDeleted => 'Фото видалено';

  @override
  String get photoAccessToSave =>
      'Дай CamTrip доступ до фото в Параметрах, щоб зберігати їх';

  @override
  String get phoneFull => 'Пам\'ять телефона заповнена';

  @override
  String get albumSaveFailedShort => 'Не вдалося зберегти в альбом';

  @override
  String get recapTemplateGoldenHour => 'Золота година';

  @override
  String get recapTemplateFast => 'Швидкий';

  @override
  String get recapTemplateFilmRoll => 'Плівка';

  @override
  String get recapTemplatePolaroid => 'Полароїд';

  @override
  String get trackSummerEvening => 'Літній вечір';

  @override
  String get trackGoldenHour => 'Золота година';

  @override
  String get trackRoadtrip => 'Роуд-трип';

  @override
  String get moodWarm => 'тепла';

  @override
  String get moodCheerful => 'бадьора';

  @override
  String friendsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count друга',
      many: '$count друзів',
      few: '$count друзі',
      one: '$count друг',
    );
    return '$_temp0';
  }

  @override
  String get madeWithCamTrip => 'Зроблено в CamTrip';

  @override
  String get tagline => 'Одна плівка на всю компанію';

  @override
  String get videoUnsupportedDevice =>
      'На цьому пристрої не вдалося створити відео';

  @override
  String get groupLoadFailed => 'Не вдалося завантажити групу.';

  @override
  String recapNeedsPhotos(int count) {
    return 'Для підсумку потрібно щонайменше $count фото.';
  }

  @override
  String get recapFailed => 'Не вдалося створити підсумок. Спробуй ще раз.';

  @override
  String get recapSaved => 'Підсумок збережено у фотоальбом';

  @override
  String get recap => 'Підсумок';

  @override
  String get recapRendering => 'Створюємо підсумок...';

  @override
  String get videoRendering => 'Створюємо відео...';

  @override
  String get template => 'Шаблон';

  @override
  String get musicLicense => 'Власна музика CamTrip · без роялті';

  @override
  String get change => 'Змінити';

  @override
  String get noWatermark => 'Без водяного знака ✓';

  @override
  String get removeWatermarkPro => 'Прибери водяний знак із Pro';

  @override
  String get proSourceSubscription => 'Підписка';

  @override
  String get proSourceGift => 'Подарунок';

  @override
  String get proSourceAdmin => 'Адмін';

  @override
  String get proSourceGroup => 'Через групу';

  @override
  String get noPro => 'Без Pro';

  @override
  String proStatusNoEnd(String source) {
    return 'Pro ($source), безстроково';
  }

  @override
  String proStatusUntil(String source, String date) {
    return 'Pro ($source), до $date';
  }

  @override
  String get lifetime => 'Назавжди';

  @override
  String get pickDate => 'Вибери дату';

  @override
  String get noAccess => 'Немає доступу';

  @override
  String get adminOnlyTeam => 'Керування лише для команди CamTrip.';

  @override
  String get adminOverview => 'Огляд';

  @override
  String get adminUsers => 'Користувачі';

  @override
  String get adminReports => 'Скарги';

  @override
  String adminsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count адміна',
      many: '$count адмінів',
      few: '$count адміни',
      one: '$count адмін',
    );
    return '$_temp0';
  }

  @override
  String get adminNewThisWeek => 'Нові за тиждень';

  @override
  String get adminGroups => 'Групи';

  @override
  String get adminProSubscription => 'Pro за підпискою';

  @override
  String get adminProGift => 'Pro в подарунок';

  @override
  String adminWithoutSubscription(int count) {
    return '$count без підписки';
  }

  @override
  String get adminOpenReports => 'Відкриті скарги';

  @override
  String get adminSearchHint => 'Пошук за ім\'ям або електронною адресою';

  @override
  String get nobodyFound => 'Нікого не знайдено';

  @override
  String get loadMore => 'Завантажити ще';

  @override
  String get noEmail => 'Немає електронної адреси';

  @override
  String adminDeletePhotoMessage(String groupName) {
    return 'Фото зникне для всіх у «$groupName». Усі скарги на це фото буде закрито.';
  }

  @override
  String get adminBanMessage =>
      'Цей акаунт більше не зможе входити й користуватися застосунком. Це можна скасувати пізніше.';

  @override
  String get adminDismissTitle => 'Відхилити скаргу?';

  @override
  String get adminDismissMessage =>
      'Фото залишиться. Скаргу буде позначено як закриту.';

  @override
  String get adminDismiss => 'Відхилити';

  @override
  String get adminAccountBlocked => 'Акаунт заблоковано';

  @override
  String get adminReportDismissed => 'Скаргу відхилено';

  @override
  String get adminNoReports => 'Відкритих скарг немає';

  @override
  String get adminNoReportsMessage =>
      'Тут з\'являться фото, на які поскаржилися.';

  @override
  String get deletedTag => 'Видалено';

  @override
  String adminReportedBy(String name) {
    return 'Від $name';
  }

  @override
  String adminPhotoBy(String name) {
    return 'Фото: $name';
  }

  @override
  String reportsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count скарги',
      many: '$count скарг',
      few: '$count скарги',
      one: '$count скарга',
    );
    return '$_temp0';
  }

  @override
  String get adminDeletePhoto => 'Видалити фото';

  @override
  String get adminBlockCreator => 'Заблокувати автора';

  @override
  String get loadFailed => 'Не вдалося завантажити';

  @override
  String get adminLifetimeProGiven => 'Pro назавжди видано';

  @override
  String get adminProGiven => 'Pro видано';

  @override
  String adminGiveProUntil(String date) {
    return 'Видати Pro до $date';
  }

  @override
  String get adminGiveProLifetime => 'Видати Pro назавжди';

  @override
  String adminGiveProFor(String period) {
    return 'Видати Pro на $period';
  }

  @override
  String get adminReasonHint =>
      'Причина, наприклад друг, тестувальник, інфлюенсер';

  @override
  String get adminGivePro => 'Видати Pro';

  @override
  String get adminRevokeTitle => 'Відкликати подарунок?';

  @override
  String get adminRevokeMessage =>
      'Подарований Pro одразу перестане діяти. Власна підписка працюватиме далі.';

  @override
  String get adminRevoke => 'Відкликати';

  @override
  String get adminGiftRevoked => 'Подарунок відкликано';

  @override
  String get adminUnbanTitle => 'Зняти блокування?';

  @override
  String adminUnbanMessage(String name) {
    return '$name знову зможе входити.';
  }

  @override
  String get adminUnbanned => 'Блокування знято';

  @override
  String get adminBanUserMessage =>
      'Цей акаунт більше не зможе входити й користуватися застосунком. Фото залишаться.';

  @override
  String get adminUser => 'Користувач';

  @override
  String get adminNotVerified => 'не підтверджено';

  @override
  String get adminRole => 'Роль';

  @override
  String get adminCreated => 'Створено';

  @override
  String get unknown => 'Невідомо';

  @override
  String get adminSignInWith => 'Входить через';

  @override
  String get adminEmailMethod => 'Ел. пошта';

  @override
  String get adminPhotosAndVideos => 'Фото й відео';

  @override
  String get adminStatus => 'Статус';

  @override
  String get adminActive => 'Активний';

  @override
  String adminActiveUntil(String date) {
    return 'Активний до $date';
  }

  @override
  String adminGiftFrom(String name) {
    return 'Подарунок від $name';
  }

  @override
  String adminExpiredOn(String date) {
    return 'Закінчився $date';
  }

  @override
  String get adminExpired => 'Закінчився';

  @override
  String adminUntil(String date) {
    return 'До $date';
  }

  @override
  String get adminGiveProTitle => 'Видати Pro';

  @override
  String get adminGiveProNote =>
      'Діє й для груп цієї людини: один Pro у групі = Pro для всіх у цій групі.';

  @override
  String get adminRevokeGift => 'Відкликати подарунок';

  @override
  String get adminModeration => 'Модерація';

  @override
  String get adminCannotBanSelf => 'Не можна заблокувати себе.';

  @override
  String get adminCannotBanAdmin => 'Адміна не можна заблокувати.';

  @override
  String get adminUnban => 'Зняти блокування';

  @override
  String get adminBanAccount => 'Заблокувати акаунт';

  @override
  String get googleSignInUnavailable => 'Вхід через Google поки недоступний';

  @override
  String get cameraPickerTitle => 'Вибери камеру';

  @override
  String get cameraPickerSubtitle => 'Кожна камера надає фото свого вигляду';

  @override
  String get cameraPickerChange => 'Змінити камеру';

  @override
  String get cameraPickerUnlock => 'Відкрити з Pro';

  @override
  String get cameraPickerSelected => 'Вибрано';

  @override
  String get cameraPickerStyleSummer => 'Літо';

  @override
  String get cameraPickerStyleSummerDescription =>
      'Теплі вицвілі кольори, як на знімку з 90-х';

  @override
  String get cameraPickerStyleNight => 'Ніч 800';

  @override
  String get cameraPickerStyleNightDescription =>
      'Кіноплівка: бірюзові тіні, тепле світло, багато зерна';

  @override
  String get cameraPickerStyleSepia => 'Сепія';

  @override
  String get cameraPickerStyleSepiaDescription =>
      'Старий коричневий знімок із коробки з-під взуття';

  @override
  String get cameraPickerStyleLomo => 'Ломо';

  @override
  String get cameraPickerStyleLomoDescription =>
      'Яскраві кольори, темні кути й дикий колірний відтінок';

  @override
  String get cameraPickerStyleMint => 'М\'ята';

  @override
  String get cameraPickerStyleMintDescription =>
      'М\'який і свіжий, із зеленим відтінком';

  @override
  String get cameraPickerStylePastel => 'Рожевий';

  @override
  String get cameraPickerStylePastelDescription =>
      'Пастельні кольори з рожевим сяйвом і білою рамкою';

  @override
  String get cameraPickerStyleSuper8 => 'Super 8';

  @override
  String get cameraPickerStyleSuper8Description =>
      'Зернистий і м\'який, як старе домашнє відео';

  @override
  String get paywallBenefitGroup => 'Один Pro = Pro для всієї групи';

  @override
  String get paywallBenefitUnlimited =>
      'Без обмежень на учасників, фото зберігаються назавжди';

  @override
  String get paywallBenefitQuality => 'Без водяного знака, оригінальна якість';

  @override
  String paywallFreeTrial(String period) {
    return '$period безкоштовно';
  }

  @override
  String paywallPriceYear(String price) {
    return '$price на рік.';
  }

  @override
  String paywallPriceYearTrial(String period, String price) {
    return '$period безкоштовно, потім $price на рік.';
  }

  @override
  String paywallPriceMonth(String price) {
    return '$price на місяць.';
  }

  @override
  String paywallPriceMonthTrial(String period, String price) {
    return '$period безкоштовно, потім $price на місяць.';
  }

  @override
  String paywallAutoRenew(String store) {
    return 'Поновлюється автоматично. Скасуй щонайменше за 24 години до поновлення в $store.';
  }

  @override
  String get paywallDetailsTitle => 'Усе в Pro';

  @override
  String get paywallBenefitStyles => 'Усі стилі камери';

  @override
  String get allPhotosTitle => 'Усі фото';

  @override
  String get homeTabAlbums => 'Альбоми';

  @override
  String get allPhotosEmptyTitle => 'Фото ще немає';

  @override
  String get allPhotosEmptyMessage => 'Відкрий камеру й зроби перше фото.';

  @override
  String get allPhotosLoadFailed => 'Не вдалося завантажити фото';

  @override
  String get cameraSettingsTitle => 'Налаштування камери';

  @override
  String get cameraSettingsMore => 'Інші налаштування';

  @override
  String get cameraSettingsGrid => 'Сітка';

  @override
  String get cameraSettingsHaptics => 'Вібрація під час зйомки';

  @override
  String get cameraSettingsDateStamp => 'Дата в правому нижньому куті';

  @override
  String get cameraSettingsSound => 'Звук затвора';

  @override
  String get cameraSettingsSoundHint =>
      'Без звуку, якщо телефон у беззвучному режимі';

  @override
  String get cameraSettingsTimer => 'Автоспуск';

  @override
  String get cameraSettingsTimerOff => 'Вимк.';

  @override
  String cameraSettingsTimerSeconds(int seconds) {
    return '$seconds с';
  }

  @override
  String get cameraSettingsTimerCancelHint => 'Торкнися затвора, щоб скасувати';

  @override
  String get cameraSettingsMirror => 'Віддзеркалювати селфі';

  @override
  String get cameraSettingsSaveToRoll => 'Зберігати у фотоплівку';

  @override
  String get cameraSettingsQuality => 'Якість';

  @override
  String get cameraSettingsQualityStandard => 'Стандартна';

  @override
  String get cameraSettingsQualityHigh => 'Висока';

  @override
  String get cameraLowLightHint => 'Мало світла - увімкни спалах';

  @override
  String get cameraFlashUnavailable => 'У цієї камери немає спалаху';

  @override
  String get cameraFlashScreen => 'Спалах екраном';

  @override
  String get cameraFlashCycleHint =>
      'Торкнися, щоб перемкнути: вимк., увімк. і авто';

  @override
  String get cameraFlip => 'Перемкнути фронтальну й основну камеру';

  @override
  String get cameraFlipHint => 'Двічі торкнися видошукача, щоб змінити камеру';

  @override
  String cameraPickerPaywallStyles(int count, String styles) {
    return 'Усі камери ($count), зокрема $styles';
  }

  @override
  String get styleFlash => 'Спалах 400';

  @override
  String get styleFlashDescription =>
      'Прямий спалах на теплій плівці: бурштинове сяйво, зерно, соковиті червоні';

  @override
  String cameraTimerButton(String state) {
    return 'Автоспуск: $state';
  }

  @override
  String get cameraTimerCycleHint =>
      'Торкнися, щоб перемкнути: вимк., 3 с і 10 с';

  @override
  String get cameraLastShotOpen => 'Останнє фото, відкриває альбом';

  @override
  String get cameraLastShotEmpty => 'Фото ще немає, відкриває альбом';

  @override
  String get deleteOnlyOwnOrAdmin => 'Видалити це може лише автор або адмін';

  @override
  String get videoPlay => 'Відтворити';

  @override
  String get videoPause => 'Пауза';

  @override
  String get language => 'Мова';

  @override
  String get languageSystem => 'Мова системи';

  @override
  String languageSystemCurrent(String language) {
    return 'Системна ($language)';
  }

  @override
  String get languageSearchHint => 'Пошук мови';

  @override
  String get languageNoResults => 'Мову не знайдено';

  @override
  String get personalRollTitle => 'Моя плівка';

  @override
  String get personalRollSubtitle => 'Лише для тебе';

  @override
  String get personalRollPickerSubtitle => 'Окремі фото, лише для тебе';

  @override
  String get personalRollMove => 'В альбом';

  @override
  String get personalRollMoveTitle => 'Перемістити в альбом';

  @override
  String get personalRollMoveNoAlbums =>
      'Спершу створи альбом або приєднайся до нього за кодом.';

  @override
  String personalRollMoved(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count фото переміщено в $album',
      one: '1 фото переміщено в $album',
    );
    return '$_temp0';
  }

  @override
  String get personalRollPrivateNote =>
      'Ці фото бачиш лише ти. Перемісти їх в альбом, щоб поділитися.';

  @override
  String get paywallTripPassSub => 'Лише ця подорож, для всієї групи';

  @override
  String get paywallOneTime => 'разово';

  @override
  String get paywallBestValue => 'Найвигідніше';

  @override
  String paywallRollFullTitle(int used, int limit) {
    return 'Твоя плівка закінчилась - $used/$limit фото';
  }

  @override
  String get paywallRollFullSub => 'Знімай далі з Trip Pass або Pro.';

  @override
  String get paywallCameraTitle => 'Ця камера входить до Pro';

  @override
  String paywallCameraSub(int count) {
    return 'Відкрий усі камери: $count.';
  }

  @override
  String get paywallWatermarkTitle => 'Recap без водяного знака';

  @override
  String get paywallWatermarkSub => 'Діліться recap без логотипа CamTrip.';

  @override
  String get paywallDeletionTitle => 'Збережи подорож';

  @override
  String paywallDeletionSub(String date) {
    return 'Безкоштовні подорожі видаляються $date. З Trip Pass або Pro вона залишиться назавжди.';
  }

  @override
  String paywallTripPassTerms(String price) {
    return 'Разова покупка за $price для цієї подорожі. Не підписка.';
  }

  @override
  String get buyTripPass => 'Купити Trip Pass';

  @override
  String get tripPassActive => 'Trip Pass активний: подорож Pro для всіх';

  @override
  String get tripPassActivating => 'Оплату отримано. Trip Pass скоро запрацює.';

  @override
  String proViaTripPass(String name) {
    return 'Trip Pass від $name';
  }

  @override
  String rollCounterSemantics(int used, int limit) {
    return '$used з $limit кадрів на плівці';
  }

  @override
  String rollHeldTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Не вміщається на плівку фото: $count',
      one: '1 фото не вміщається на плівку',
    );
    return '$_temp0';
  }

  @override
  String get rollHeldBody => 'Збережи їх з Pro або Trip Pass';

  @override
  String deletionBannerTitle(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Збережи подорож - залишилось днів: $days',
      one: 'Збережи подорож - залишився 1 день',
    );
    return '$_temp0';
  }

  @override
  String get deletionBannerBody =>
      'Безкоштовні подорожі видаляються через 30 днів після завершення. З Trip Pass або Pro вона залишиться назавжди.';

  @override
  String apiRollFull(int limit) {
    return 'Плівка закінчилась ($limit кадрів). Візьми Trip Pass або Pro, щоб знімати далі.';
  }

  @override
  String get apiTripPassFailed =>
      'Не вдалося активувати Trip Pass. Напиши на support@camtrip.app.';

  @override
  String get apiTripPassExists => 'У цієї подорожі вже є Trip Pass.';

  @override
  String get tripPassUnavailable =>
      'Trip Pass зараз недоступний. Спробуй пізніше.';

  @override
  String get tripMapTitle => 'Карта подорожі';

  @override
  String get tripMapOpen => 'Карта і статистика';

  @override
  String get tripMapLoadFailed => 'Не вдалося завантажити карту';

  @override
  String get tripMapStatDays => 'Дні';

  @override
  String get tripMapStatPhotos => 'Фото';

  @override
  String get tripMapStatVideos => 'Відео';

  @override
  String get tripMapStatMembers => 'Учасники';

  @override
  String get tripMapStatDistance => 'км шляху';

  @override
  String get tripMapStatCountries => 'Країни';

  @override
  String get tripMapStatPlaces => 'Місця';

  @override
  String tripMapBusiestDay(String day, int count) {
    return 'Найбільше фото: $day ($count)';
  }

  @override
  String tripMapTopPhotographer(String name, int count) {
    return 'Головний фотограф: $name ($count)';
  }

  @override
  String get tripMapOffTitle => 'Карту подорожі вимкнено';

  @override
  String get tripMapOffMessage =>
      'Адмін може ввімкнути карту в налаштуваннях групи. Статистику ти бачиш завжди.';

  @override
  String get tripMapOffMessageAdmin =>
      'Увімкни карту, щоб бачити, де зроблено ваші фото. Кожен сам вирішує, чи долучатися.';

  @override
  String get tripMapEnable => 'Увімкнути карту';

  @override
  String get tripMapEmptyTitle => 'На карті ще немає місць';

  @override
  String get tripMapEmptyMessage =>
      'Нові фото учасників, які діляться місцезнаходженням, з’являться тут з точністю близько 100 м.';

  @override
  String get tripMapConsentTitle => 'Карта подорожі';

  @override
  String get tripMapConsentQuestion =>
      'Показувати на карті цієї групи, де зроблено твої фото?';

  @override
  String get tripMapConsentDetail =>
      'Це бачать лише учасники групи, з точністю близько 100 м. Місцезнаходження ніколи не записується в саме фото, і це можна будь-коли вимкнути в налаштуваннях групи.';

  @override
  String get tripMapConsentYes => 'Так, ділитися';

  @override
  String get tripMapConsentNo => 'Ні';

  @override
  String get tripMapLocationDenied =>
      'Немає доступу до місцезнаходження. Дозволь його в налаштуваннях телефона.';

  @override
  String get tripMapSettingSubtitle =>
      'Показувати на карті, де зроблено фото. Учасники самі вирішують, чи ділитися.';

  @override
  String get tripMapDisableTitle => 'Вимкнути карту?';

  @override
  String get tripMapDisableMessage =>
      'Усі місцезнаходження в групі буде видалено. Якщо згодом знову ввімкнеш карту, ми запитаємо всіх знову.';

  @override
  String get tripMapDisable => 'Вимкнути';

  @override
  String get tripMapMySharing => 'Ділитися місцезнаходженням';

  @override
  String get tripMapMySharingOn =>
      'Твої нові фото з’являються на карті (з точністю близько 100 м).';

  @override
  String get tripMapMySharingOff =>
      'Вимкнено. Твої фото не з’являються на карті.';

  @override
  String get tripMapStopSharingTitle => 'Припинити ділитися місцезнаходженням?';

  @override
  String get tripMapStopSharingMessage =>
      'Місцезнаходження всіх твоїх фото в цій групі буде видалено.';

  @override
  String get tripMapStopSharing => 'Припинити';
}
