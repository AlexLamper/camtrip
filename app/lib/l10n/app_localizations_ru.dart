// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get cancel => 'Отмена';

  @override
  String get yes => 'Да';

  @override
  String inviteMessageIntro(String groupName) {
    return 'Присоединяйся к «$groupName» в CamTrip! Тогда мы сразу увидим фото друг друга.';
  }

  @override
  String inviteMessageCode(String code) {
    return 'Или введи код: $code';
  }

  @override
  String get memberFallbackName => 'Друг';

  @override
  String get reportReasonInappropriate => 'Неуместное или оскорбительное';

  @override
  String get reportReasonSpam => 'Спам';

  @override
  String get reportReasonOther => 'Другое';

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
  String get errorOffline => 'Нет подключения. Попробуй чуть позже.';

  @override
  String errorSomethingWrongStatus(int status) {
    return 'Что-то пошло не так ($status)';
  }

  @override
  String get errorSomethingWrong => 'Что-то пошло не так';

  @override
  String get apiInvalidCredentials => 'Неверный адрес эл. почты или пароль';

  @override
  String get apiInvalidCode => 'Код неверный или устарел. Запроси новый код.';

  @override
  String get apiEmailTaken =>
      'Аккаунт с этим адресом эл. почты уже существует. Войди или нажми «Забыли пароль?».';

  @override
  String apiEmailTakenProvider(String provider) {
    return 'Аккаунт с этим адресом эл. почты уже существует. Войди через $provider.';
  }

  @override
  String apiWeakPassword(int min) {
    return 'Пароль должен быть не короче $min символов';
  }

  @override
  String apiNameTooLong(int max) {
    return 'Имя может быть не длиннее $max символов';
  }

  @override
  String get apiRateLimited =>
      'Слишком много попыток. Попробуй снова через 15 минут.';

  @override
  String apiAccountBanned(String email) {
    return 'Твой аккаунт заблокирован. Напиши на $email, если считаешь, что это ошибка.';
  }

  @override
  String get apiProRequired => 'Этот стиль камеры входит в CamTrip Pro';

  @override
  String get apiGroupClosed => 'Эта группа закрыта';

  @override
  String get apiGroupCodeNotFound => 'Группа с таким кодом не найдена';

  @override
  String apiGroupFull(int max) {
    return 'Группа заполнена (макс. $max участников). Если у одного из участников есть CamTrip Pro, присоединиться может кто угодно.';
  }

  @override
  String get apiLastMember => 'Ты последний участник. Лучше удали группу.';

  @override
  String get apiAdminRequired => 'Только для администраторов CamTrip';

  @override
  String get apiUploadIncomplete => 'Загрузка не завершена';

  @override
  String get apiInvalidInput => 'Неверные данные';

  @override
  String get apiNotSignedIn => 'Вход не выполнен';

  @override
  String get apiAccountGone => 'Этого аккаунта больше нет';

  @override
  String get apiPhotoNotFound => 'Фото не найдено';

  @override
  String get apiGroupNotFound => 'Группа не найдена';

  @override
  String get apiMemberNotFound => 'Участник не найден';

  @override
  String get apiPersonNotFound => 'Человек не найден';

  @override
  String get apiUserNotFound => 'Пользователь не найден';

  @override
  String get apiAdminOnly => 'Это может сделать только админ';

  @override
  String get apiCannotBlockSelf => 'Нельзя заблокировать себя';

  @override
  String get apiCannotReportOwn => 'Нельзя пожаловаться на своё фото';

  @override
  String get apiDeleteOwnOnly => 'Удалять можно только свои фото';

  @override
  String get apiOwnerCannotBeRemoved => 'Создателя группы нельзя удалить';

  @override
  String get apiOwnerStaysAdmin => 'Создатель всегда остаётся админом';

  @override
  String get apiNeedsOneAdmin => 'В группе должен быть хотя бы один админ';

  @override
  String get apiEndBeforeStart => 'Дата окончания раньше даты начала';

  @override
  String get apiPermanentNoEndDate => 'У постоянной группы нет даты окончания';

  @override
  String get apiCannotBanAdmin => 'Администратора нельзя заблокировать';

  @override
  String get apiReportNotFound => 'Жалоба не найдена';

  @override
  String get apiPhotoOwnerUnknown => 'Автор этого фото больше неизвестен';

  @override
  String get validationNameRequired => 'Введи своё имя';

  @override
  String validationMaxChars(int max) {
    return 'Не более $max символов';
  }

  @override
  String get validationEmailRequired => 'Введи адрес эл. почты';

  @override
  String get validationEmailInvalid => 'Неверный адрес эл. почты';

  @override
  String get validationPasswordRequired => 'Придумай пароль';

  @override
  String validationMinChars(int min) {
    return 'Не менее $min символов';
  }

  @override
  String get validationPasswordTooLong => 'Пароль слишком длинный';

  @override
  String get validationPasswordEmpty => 'Введи пароль';

  @override
  String get validationCodeRequired => 'Введи код из письма';

  @override
  String get validationCodeDigits => 'Код состоит из 6 цифр';

  @override
  String get onboarding1Title => 'Одна плёнка\nна всю компанию.';

  @override
  String get onboarding1Body =>
      'Снимай на ретро-камеру. Все сразу видят твои фото, и они тут же оказываются в твоём альбоме.';

  @override
  String get onboarding2Title => 'Больше не нужно\nпересылать фото.';

  @override
  String get onboarding2Body =>
      'Создай группу, поделись кодом - готово. Больше никаких «скинь мне фотки».';

  @override
  String get onboarding3Title => 'Видео-итоги\nпосле поездки.';

  @override
  String get onboarding3Body =>
      'CamTrip сделает видео с музыкой из ваших лучших моментов.';

  @override
  String get onboardingInvited =>
      'Тебя пригласили! Войди, чтобы присоединиться.';

  @override
  String get signInAppleFailed => 'Не удалось войти через Apple';

  @override
  String get signInGoogleFailed => 'Не удалось войти через Google';

  @override
  String get signInFailed => 'Не удалось войти';

  @override
  String get next => 'Далее';

  @override
  String get legalPrefix => 'Продолжая, ты принимаешь';

  @override
  String get legalTerms => 'условия';

  @override
  String get legalAnd => ' и';

  @override
  String get legalPrivacy => 'политику конфиденциальности';

  @override
  String get legalSuffix => '.';

  @override
  String get continueWithApple => 'Продолжить с Apple';

  @override
  String get continueWithGoogle => 'Продолжить с Google';

  @override
  String get createAccount => 'Создать аккаунт';

  @override
  String get signIn => 'Войти';

  @override
  String get or => 'или';

  @override
  String get registerSubtitle => 'Чтобы друзья видели, кто сделал фото.';

  @override
  String get loginSubtitle => 'С возвращением.';

  @override
  String get forgotPasswordTitle => 'Забыли пароль';

  @override
  String get forgotPasswordPushSubtitle =>
      'Ты ещё где-то в аккаунте? Мы пришлём туда 6-значный код push-уведомлением, чтобы ты задал новый пароль.';

  @override
  String get newPassword => 'Новый пароль';

  @override
  String get resetPushInfo =>
      'Если ты ещё где-то в аккаунте, туда придёт push-уведомление с кодом. Не получается войти? Войди через Apple или Google с тем же адресом эл. почты - аккаунт будет связан.';

  @override
  String get sendCode => 'Отправить код';

  @override
  String get savePassword => 'Сохранить пароль';

  @override
  String get errorTryAgain => 'Что-то пошло не так. Попробуй ещё раз.';

  @override
  String get back => 'Назад';

  @override
  String get name => 'Имя';

  @override
  String get email => 'Адрес эл. почты';

  @override
  String get codeFromPush => 'Код из уведомления';

  @override
  String get password => 'Пароль';

  @override
  String get hidePassword => 'Скрыть пароль';

  @override
  String get showPassword => 'Показать пароль';

  @override
  String get forgotPasswordLink => 'Забыли пароль?';

  @override
  String get haveAccount => 'Уже есть аккаунт?';

  @override
  String get newToCamTrip => 'Впервые в CamTrip?';

  @override
  String get rememberedIt => 'Вспомнил?';

  @override
  String get noCodeReceived => 'Не пришёл код?';

  @override
  String get resendCode => 'Отправить снова';

  @override
  String onboardingDemoRoll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count фотографа, 1 плёнка',
      many: '$count фотографов, 1 плёнка',
      few: '$count фотографа, 1 плёнка',
      one: '$count фотограф, 1 плёнка',
    );
    return '$_temp0';
  }

  @override
  String membersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count участника',
      many: '$count участников',
      few: '$count участника',
      one: '$count участник',
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
      other: '$count видео',
      many: '$count видео',
      few: '$count видео',
      one: '$count видео',
    );
    return '$_temp0';
  }

  @override
  String get justNow => 'сейчас';

  @override
  String get badgeNew => 'Новое';

  @override
  String recapTitle(String groupName) {
    return 'Итоги: $groupName';
  }

  @override
  String get styleFilm => 'Плёнка';

  @override
  String get styleInstant => 'Инстант';

  @override
  String get styleDisposable => 'Одноразовая';

  @override
  String get styleBw => 'Ч/Б';

  @override
  String get styleGolden => 'Золото';

  @override
  String get styleChrome => 'Хром';

  @override
  String get styleFilmDescription => 'Тёплые цвета, зерно и оранжевая дата';

  @override
  String get styleInstantDescription => 'Мягкие цвета и белая рамка';

  @override
  String get styleDisposableDescription =>
      'Резкая вспышка, виньетка и засветки';

  @override
  String get styleBwDescription =>
      'Зернистый чёрно-белый с глубоким контрастом';

  @override
  String get styleGoldenDescription =>
      'Вечный золотой час, мягкое золотое сияние';

  @override
  String get styleChromeDescription =>
      'Холодный, насыщенный и резкий, как слайдовая плёнка';

  @override
  String get shutterStopRecording => 'Остановить запись';

  @override
  String get shutterStartRecording => 'Начать запись видео';

  @override
  String get shutterTakePhoto => 'Сделать фото';

  @override
  String get modePhoto => 'Фото';

  @override
  String get modeVideo => 'Видео';

  @override
  String get cameraNotFound => 'Камера не найдена';

  @override
  String get cameraAccessNeeded =>
      'CamTrip нужен доступ к камере. Включи его в Настройках.';

  @override
  String get cameraStartFailed => 'Не удалось запустить камеру';

  @override
  String get albumAccessNeeded =>
      'Дай CamTrip доступ к фото, чтобы сохранять их и в твой альбом';

  @override
  String get albumSaveFailed =>
      'Не удалось сохранить в альбом. Фото всё равно отправлено в группу.';

  @override
  String styleProFallback(String style) {
    return 'Этот стиль входит в Pro. В этой группе ты снимаешь в стиле $style.';
  }

  @override
  String get photoFailed => 'Не удалось сделать фото. Попробуй ещё раз.';

  @override
  String get recordingFailed => 'Не удалось записать видео';

  @override
  String get videoFailed => 'Не удалось создать видео. Попробуй ещё раз.';

  @override
  String get shootInGroup => 'Снимать в группу';

  @override
  String get close => 'Закрыть';

  @override
  String get flash => 'Вспышка';

  @override
  String get flashOn => 'Вкл.';

  @override
  String get flashOff => 'Выкл.';

  @override
  String get flashAuto => 'Авто';

  @override
  String get chooseGroup => 'Выбрать группу';

  @override
  String get switchCamera => 'Сменить камеру';

  @override
  String get createOrJoinFirst =>
      'Сначала создай группу или присоединись к ней';

  @override
  String get proViaGroup => 'Pro через группу';

  @override
  String proViaName(String name) {
    return 'Pro от $name';
  }

  @override
  String get proStylesFreeViaMember =>
      'Pro-стили в этой группе бесплатны для тебя благодаря участнику с Pro';

  @override
  String proStylesFreeViaName(String name) {
    return 'Pro-стили в этой группе: бесплатно для тебя благодаря $name';
  }

  @override
  String get subscriptionsUnavailable =>
      'Подписки сейчас недоступны. Попробуй позже.';

  @override
  String get paymentPending =>
      'Платёж ещё обрабатывается. Pro включится, как только он пройдёт.';

  @override
  String get purchaseFailed => 'Покупка не удалась. Попробуй позже.';

  @override
  String get restoreUnavailable =>
      'Восстановить покупки сейчас нельзя. Попробуй позже.';

  @override
  String get restoreFailed => 'Не удалось восстановить. Попробуй позже.';

  @override
  String get welcomePro => 'Добро пожаловать в CamTrip Pro! 🎉';

  @override
  String get proRestored => 'Pro восстановлен';

  @override
  String get noPurchaseFound => 'Прошлых покупок не найдено';

  @override
  String periodDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count дня',
      many: '$count дней',
      few: '$count дня',
      one: '$count день',
    );
    return '$_temp0';
  }

  @override
  String periodWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count недели',
      many: '$count недель',
      few: '$count недели',
      one: '$count неделя',
    );
    return '$_temp0';
  }

  @override
  String periodMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count месяца',
      many: '$count месяцев',
      few: '$count месяца',
      one: '$count месяц',
    );
    return '$_temp0';
  }

  @override
  String periodYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count года',
      many: '$count лет',
      few: '$count года',
      one: '$count год',
    );
    return '$_temp0';
  }

  @override
  String get paywallHavePro => 'У тебя CamTrip Pro';

  @override
  String get paywallSubtitle => 'Всё для следующей поездки.';

  @override
  String paywallFeatureStyles(String styles) {
    return 'Все стили камеры ($styles)';
  }

  @override
  String get paywallFeatureUnlimited =>
      'Без ограничений по участникам и памяти, фото хранятся навсегда';

  @override
  String get paywallFeatureNoWatermark => 'Итоги без водяного знака';

  @override
  String get paywallFeatureOriginal => 'Скачивание в исходном качестве';

  @override
  String get planYear => 'Год';

  @override
  String get planMonth => 'Месяц';

  @override
  String pricePerMonth(String price) {
    return '$price в месяц';
  }

  @override
  String paywallSaveBadge(int percent) {
    return 'ЭКОНОМИЯ $percent%';
  }

  @override
  String get planMonthCancelAnytime => 'отмена в любой момент';

  @override
  String tryFree(String period) {
    return 'Попробуй $period бесплатно';
  }

  @override
  String get becomePro => 'Перейти на Pro';

  @override
  String get subscriptionsLoadFailed =>
      'Не удалось загрузить подписки. Проверь подключение.';

  @override
  String legalAnnual(String price) {
    return 'Годовая подписка CamTrip Pro: $price в год.';
  }

  @override
  String legalAnnualTrial(String period, String price) {
    return 'Годовая подписка CamTrip Pro: $period бесплатно, затем $price в год.';
  }

  @override
  String legalMonthly(String price) {
    return 'Месячная подписка CamTrip Pro: $price в месяц.';
  }

  @override
  String legalMonthlyTrial(String period, String price) {
    return 'Месячная подписка CamTrip Pro: $period бесплатно, затем $price в месяц.';
  }

  @override
  String get legalBillingApple =>
      'Оплата списывается с твоего Apple ID. Подписка продлевается автоматически, если не отменить её минимум за 24 часа до конца периода. Отменить её и управлять ею можно в настройках аккаунта App Store.';

  @override
  String get legalBillingGoogle =>
      'Оплата списывается с твоего аккаунта Google. Подписка продлевается автоматически, если не отменить её минимум за 24 часа до конца периода. Отменить её и управлять ею можно в настройках аккаунта Google Play.';

  @override
  String get restorePurchases => 'Восстановить покупки';

  @override
  String get terms => 'Условия';

  @override
  String get privacy => 'Конфиденциальность';

  @override
  String get groupProTitle => 'Один Pro в группе = Pro для всех в этой группе';

  @override
  String get groupProBody =>
      'Если у одного человека есть Pro, вся группа получает все стили камеры, неограниченное число участников, вечное хранение фото, исходное качество и итоги без водяного знака.';

  @override
  String get groupCreated => 'Группа создана ✓';

  @override
  String get inviteFriends => 'Пригласи друзей';

  @override
  String get codeCopied => 'Код скопирован';

  @override
  String get shareLink => 'Поделиться ссылкой';

  @override
  String inviteSubject(String groupName) {
    return 'Присоединяйся к $groupName в CamTrip';
  }

  @override
  String inviteMembersUnlimited(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count участника',
      many: '$count участников',
      few: '$count участника',
      one: '$count участник',
    );
    return '$_temp0 · без ограничений (Pro)';
  }

  @override
  String inviteMembersLimit(int count, int limit) {
    return '$count из $limit участников · Pro: без ограничений';
  }

  @override
  String get toCamera => 'К камере';

  @override
  String get done => 'Готово';

  @override
  String get joinEnterCode => 'Введи код из 6 символов';

  @override
  String get joinGroupTitle => 'Присоединиться к группе';

  @override
  String get joinGroupSubtitle => 'Введи код друзей или отсканируй их QR-код.';

  @override
  String get typeCode => 'Ввести код';

  @override
  String get scanQr => 'Сканировать QR';

  @override
  String get join => 'Присоединиться';

  @override
  String get groupNameRequired => 'Дай группе название';

  @override
  String get newGroup => 'Новая группа';

  @override
  String get groupType => 'Тип группы';

  @override
  String get groupTypeVacation => 'Отпуск';

  @override
  String get groupTypeVacationDescription =>
      'С датами начала и конца, потом в архив';

  @override
  String get groupTypeEvent => 'Событие';

  @override
  String get groupTypeEventDescription =>
      'Один день или вечер, например вечеринка';

  @override
  String get groupTypePermanent => 'Всегда открыта';

  @override
  String get groupTypePermanentDescription => 'Для твоей постоянной компании';

  @override
  String get date => 'Дата';

  @override
  String get departure => 'Отъезд';

  @override
  String get returnDate => 'Возвращение';

  @override
  String get defaultCameraStyle => 'Стиль камеры по умолчанию';

  @override
  String freeLimitPermanent(int max) {
    return 'Бесплатно: до $max участников. С Pro без ограничений.';
  }

  @override
  String freeLimitDated(int max, int days) {
    return 'Бесплатно: до $max участников, фото хранятся $days дн. после даты окончания. С Pro без ограничений и навсегда.';
  }

  @override
  String get createGroup => 'Создать группу';

  @override
  String get group => 'Группа';

  @override
  String groupCode(String code) {
    return 'код $code';
  }

  @override
  String get manage => 'Управление';

  @override
  String get rename => 'Переименовать';

  @override
  String get changeDates => 'Изменить даты';

  @override
  String get finishTrip => 'Завершить поездку';

  @override
  String get finishTripSubtitle => 'Дата окончания станет сегодняшней';

  @override
  String get reopenGroup => 'Открыть группу снова';

  @override
  String get closeGroup => 'Закрыть группу';

  @override
  String get reopenGroupSubtitle => 'Участники снова смогут добавлять фото';

  @override
  String get closeGroupSubtitle =>
      'Никто больше не сможет добавлять фото; смотреть всё можно по-прежнему';

  @override
  String get members => 'Участники';

  @override
  String memberYou(String name) {
    return '$name (ты)';
  }

  @override
  String get blockedTag => 'заблокирован';

  @override
  String get adminTag => 'админ';

  @override
  String removeMemberTitle(String name) {
    return 'Удалить $name?';
  }

  @override
  String get removeMemberMessage => 'Фото этого человека останутся в группе.';

  @override
  String get remove => 'Удалить';

  @override
  String get removeMember => 'Удалить';

  @override
  String blockTitle(String name) {
    return 'Заблокировать $name?';
  }

  @override
  String blockMessage(String name) {
    return 'Ты больше не будешь видеть фото и видео от $name и получать уведомления о них. Это можно отменить в Настройках.';
  }

  @override
  String get block => 'Заблокировать';

  @override
  String get makeMember => 'Сделать обычным участником';

  @override
  String get makeAdmin => 'Сделать админом';

  @override
  String get removeFromGroup => 'Удалить из группы';

  @override
  String get unblock => 'Разблокировать';

  @override
  String get inviteFriendsButton => 'Пригласить друзей';

  @override
  String get you => 'Ты';

  @override
  String get unarchive => 'Вернуть из архива';

  @override
  String get archive => 'В архив';

  @override
  String get unarchiveSubtitle => 'Группа снова среди твоих альбомов';

  @override
  String archiveSubtitle(String section) {
    return 'Только для тебя: группа переместится в «$section» внизу твоих альбомов';
  }

  @override
  String get archivedSection => 'Архив';

  @override
  String get hiddenPhotos => 'Скрытые фото';

  @override
  String get hiddenPhotosSubtitle => 'Фото, которые ты скрыл для себя';

  @override
  String get leaveGroup => 'Покинуть группу';

  @override
  String get leaveGroupSubtitle => 'Твои фото останутся в группе для остальных';

  @override
  String get deleteGroup => 'Удалить группу';

  @override
  String get deleteGroupSubtitle => 'Все фото удалятся для всех';

  @override
  String groupArchived(String groupName) {
    return '«$groupName» в архиве';
  }

  @override
  String groupUnarchived(String groupName) {
    return '«$groupName» снова среди твоих альбомов';
  }

  @override
  String get undo => 'Отменить';

  @override
  String get groupNameTitle => 'Название группы';

  @override
  String get finishTripTitle => 'Завершить поездку?';

  @override
  String get finishTripMessage =>
      'Дата окончания станет сегодняшней. Фото по-прежнему можно добавлять; итоги готовы.';

  @override
  String get finishTripConfirm => 'Завершить';

  @override
  String get tripFinished => 'Поездка завершена';

  @override
  String leaveGroupTitle(String groupName) {
    return 'Покинуть «$groupName»?';
  }

  @override
  String get leaveGroupMessage =>
      'Твои фото останутся в группе для остальных. Позже можно вернуться по коду.';

  @override
  String get leave => 'Покинуть';

  @override
  String groupDeleted(String groupName) {
    return '«$groupName» удалена';
  }

  @override
  String get youAreAdmin => 'ты админ';

  @override
  String get open => 'Открыть';

  @override
  String get archiveMenuSubtitle => 'Только для тебя, остальные не заметят';

  @override
  String get deleteGroupMenuSubtitle => 'Для всех, вместе со всеми фото';

  @override
  String get deleteGroupTitle => 'Удалить группу?';

  @override
  String deleteGroupMessage(int count, String groupName, int memberCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Все $count фото и видео',
      many: 'Все $count фото и видео',
      few: 'Все $count фото и видео',
      one: '$count фото или видео',
    );
    String _temp1 = intl.Intl.pluralLogic(
      memberCount,
      locale: localeName,
      other: 'всех $memberCount участников',
      many: 'всех $memberCount участников',
      few: 'всех $memberCount участников',
      one: '$memberCount участника',
    );
    return '$_temp0 в «$groupName» исчезнут для $_temp1. Это нельзя отменить.';
  }

  @override
  String get deleteGroupOwnRoll => 'Твоя собственная фотоплёнка не изменится.';

  @override
  String get deleteGroupTypeName => 'Введи название группы для подтверждения:';

  @override
  String get deleteForEveryone => 'Удалить для всех';

  @override
  String get save => 'Сохранить';

  @override
  String get yourAlbums => 'Твои альбомы';

  @override
  String get uploadQueue => 'Очередь загрузки';

  @override
  String get noConnection => 'Нет подключения';

  @override
  String get albumsOfflineMessage =>
      'Альбомы загрузятся, когда появится интернет. Камера работает и так.';

  @override
  String get retry => 'Повторить';

  @override
  String get noAlbumsTitle => 'Альбомов пока нет';

  @override
  String get noAlbumsMessage =>
      'Создай группу для следующей поездки или присоединись к группе друга по коду.';

  @override
  String get haveCode => 'У меня есть код';

  @override
  String get joinWithCode => 'Присоединиться по коду или QR-коду';

  @override
  String get camera => 'Камера';

  @override
  String get restore => 'Восстановить';

  @override
  String get more => 'Ещё';

  @override
  String get newAlbum => 'Новый';

  @override
  String get closedTag => 'закрыта';

  @override
  String get activeTag => 'активна';

  @override
  String get uploadFailed => 'Загрузка не удалась';

  @override
  String get queueNoSignal => 'Нет сети.';

  @override
  String get queueNoSignalMessage =>
      'Твои фото уже в альбоме и будут отправлены, как только появится интернет.';

  @override
  String get queueWaitingForWifi => 'Ожидание Wi-Fi.';

  @override
  String queueWifiOnlyOn(String setting) {
    return 'У тебя включено «$setting».';
  }

  @override
  String get queueVideosWifiOnly => 'Видео отправляются только через Wi-Fi.';

  @override
  String get queueAllShared => 'Всё отправлено ✓';

  @override
  String queuePending(String items) {
    return 'Осталось отправить: $items';
  }

  @override
  String queuePendingBoth(String photos, String videos) {
    return 'Осталось отправить: $photos и $videos';
  }

  @override
  String get retryUpload => 'Повторить';

  @override
  String get removeFromQueue => 'Убрать из очереди';

  @override
  String get queueStatusWifi => 'Wi-Fi';

  @override
  String get queueStatusWaiting => 'ожидание';

  @override
  String get videosWifiOnlyTitle => 'Видео только через Wi-Fi';

  @override
  String get videosWifiOnlySubtitle => 'Экономит мобильный трафик';

  @override
  String get retryNow => 'Повторить сейчас';

  @override
  String get yourName => 'Твоё имя';

  @override
  String get settings => 'Настройки';

  @override
  String get tapToChangeName => 'Нажми, чтобы изменить имя';

  @override
  String get getCamTripPro => 'Получить CamTrip Pro';

  @override
  String get photos => 'Фото';

  @override
  String get saveOwnPhotos => 'Сохранять мои фото в альбом для каждой группы';

  @override
  String get autoSaveOthers => 'Автоматически сохранять фото других';

  @override
  String get wifiOnlyTitle => 'Загружать только через Wi-Fi';

  @override
  String get dateStamp => 'Дата на фото';

  @override
  String get notifications => 'Уведомления';

  @override
  String get notifyNewPhotos => 'Новые фото (сводкой)';

  @override
  String get notifyRecapReady => 'Итоги готовы';

  @override
  String get camTripTeam => 'Команда CamTrip';

  @override
  String get adminEntrySubtitle =>
      'Пользователи, выдача Pro, жалобы и статистика';

  @override
  String get account => 'Аккаунт';

  @override
  String get manageSubscription => 'Управление подпиской';

  @override
  String get blockedPeople => 'Заблокированные';

  @override
  String get nobody => 'Никого';

  @override
  String peopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count человека',
      many: '$count человек',
      few: '$count человека',
      one: '$count человек',
    );
    return '$_temp0';
  }

  @override
  String get privacyPolicy => 'Политика конфиденциальности';

  @override
  String get contact => 'Связаться';

  @override
  String get signOut => 'Выйти';

  @override
  String get deleteAccount => 'Удалить аккаунт';

  @override
  String get deleteAccountSubtitle => 'Удаляет аккаунт и все твои фото';

  @override
  String get deleteAccountTitle => 'Удалить аккаунт?';

  @override
  String get deleteAccountMessage =>
      'Твой аккаунт и все твои фото и видео будут удалены, в том числе из групп. Активную подписку отмени в App Store или Google Play.';

  @override
  String get blockedTitle => 'Заблокированные';

  @override
  String get blockedSubtitle => 'Ты не видишь фото этих людей.';

  @override
  String get blockedNone => 'Ты никого не заблокировал.';

  @override
  String get unblockShort => 'Разблокировать';

  @override
  String get groupGone => 'Этой группы больше нет, или ты больше не участник.';

  @override
  String photosSavedToAlbum(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count фото сохранено в «$album»',
      many: '$count фото сохранено в «$album»',
      few: '$count фото сохранено в «$album»',
      one: '$count фото сохранено в «$album»',
    );
    return '$_temp0';
  }

  @override
  String photosDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count фото удалено',
      many: '$count фото удалено',
      few: '$count фото удалено',
      one: '$count фото удалено',
    );
    return '$_temp0';
  }

  @override
  String photosDeletedSkipped(int count, int skipped) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count фото удалено',
      many: '$count фото удалено',
      few: '$count фото удалено',
      one: '$count фото удалено',
    );
    return '$_temp0, пропущено: $skipped';
  }

  @override
  String photosHiddenForYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count фото скрыто для тебя',
      many: '$count фото скрыто для тебя',
      few: '$count фото скрыто для тебя',
      one: '$count фото скрыто для тебя',
    );
    return '$_temp0';
  }

  @override
  String get addedToFavorites => 'Добавлено в избранное';

  @override
  String get removedFromFavorites => 'Удалено из избранного';

  @override
  String get photoAccessSettings => 'Дай CamTrip доступ к фото в Настройках';

  @override
  String photosBeingAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Добавляются $count фото',
      many: 'Добавляются $count фото',
      few: 'Добавляются $count фото',
      one: 'Добавляется $count фото',
    );
    return '$_temp0';
  }

  @override
  String photosUnreadable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Не удалось прочитать $count фото',
      many: 'Не удалось прочитать $count фото',
      few: 'Не удалось прочитать $count фото',
      one: 'Не удалось прочитать $count фото',
    );
    return '$_temp0';
  }

  @override
  String get groupNotLoaded => 'Группа не загружена';

  @override
  String get noFavoritesTitle => 'Избранного пока нет';

  @override
  String get noPhotosTitle => 'Фото пока нет';

  @override
  String get noFavoritesMessage =>
      'Нажми на звёздочку на фото, чтобы добавить его сюда.';

  @override
  String get noPhotosMessage =>
      'Сделай первое фото. Все в группе сразу его увидят.';

  @override
  String get openCamera => 'Открыть камеру';

  @override
  String savingProgress(int done, int total) {
    return 'Сохранение... $done/$total';
  }

  @override
  String get sharePreparing => 'Подготовка...';

  @override
  String sharingProgress(int done, int total) {
    return 'Подготовка... $done/$total';
  }

  @override
  String get choosePhotos => 'Выбрать фото';

  @override
  String selectedCount(int count) {
    return 'Выбрано: $count';
  }

  @override
  String get selectNone => 'Снять выбор';

  @override
  String get selectAll => 'Выбрать все';

  @override
  String photosWaitingToShare(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count фото ждут отправки',
      many: '$count фото ждут отправки',
      few: '$count фото ждут отправки',
      one: '$count фото ждёт отправки',
    );
    return '$_temp0';
  }

  @override
  String get recapReadyTitle => 'Твои итоги готовы';

  @override
  String get recapReadySubtitle => 'Видео с музыкой о твоей поездке';

  @override
  String get watch => 'Смотреть';

  @override
  String get makeRecapNow => 'Сделать видео-итоги сейчас';

  @override
  String freeGroupDeleteNotice(String date) {
    return 'Бесплатная группа: фото хранятся до $date. Сохрани их или перейди на Pro.';
  }

  @override
  String get filterAll => 'Все';

  @override
  String get filterFavorites => 'Избранное';

  @override
  String get filterPerPerson => 'По людям';

  @override
  String get filterPerson => 'Человек';

  @override
  String get select => 'Выбрать';

  @override
  String get hiddenFilter => 'Скрытые';

  @override
  String get photosBy => 'Фото от...';

  @override
  String get uploadedTag => 'загружено';

  @override
  String get saveAll => 'Сохранить все';

  @override
  String get favorite => 'В избранное';

  @override
  String get unfavorite => 'Убрать из избранного';

  @override
  String get hide => 'Скрыть';

  @override
  String get delete => 'Удалить';

  @override
  String deletePhotosTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Удалить $count фото?',
      many: 'Удалить $count фото?',
      few: 'Удалить $count фото?',
      one: 'Удалить фото?',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Они исчезнут для всех в группе. Это нельзя отменить.',
      many: 'Они исчезнут для всех в группе. Это нельзя отменить.',
      few: 'Они исчезнут для всех в группе. Это нельзя отменить.',
      one: 'Оно исчезнет для всех в группе. Это нельзя отменить.',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosNotAllowed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count фото принадлежат другим людям. Они останутся; удалить их может только админ.',
      many:
          '$count фото принадлежат другим людям. Они останутся; удалить их может только админ.',
      few:
          '$count фото принадлежат другим людям. Они останутся; удалить их может только админ.',
      one:
          '$count фото принадлежит другому человеку. Оно останется; удалить его может только админ.',
    );
    return '$_temp0';
  }

  @override
  String photosBackInGroup(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count фото снова в группе',
      many: '$count фото снова в группе',
      few: '$count фото снова в группе',
      one: '$count фото снова в группе',
    );
    return '$_temp0';
  }

  @override
  String get showAll => 'Показать все';

  @override
  String get hiddenPhotosExplainer =>
      'Эти фото не видишь только ты. Для остальных в группе они на месте.';

  @override
  String get nothingHidden => 'Ничего не скрыто';

  @override
  String get nothingHiddenMessage => 'Здесь появятся фото, которые ты скроешь.';

  @override
  String showAgainCount(int count) {
    return 'Показать снова ($count)';
  }

  @override
  String get someone => 'Кто-то';

  @override
  String get savedToAlbum => 'Сохранено в фотоальбом';

  @override
  String get share => 'Поделиться';

  @override
  String get shareFailed => 'Не удалось поделиться';

  @override
  String get reportTitle => 'Почему ты жалуешься на это фото?';

  @override
  String get reportSubtitle =>
      'Мы проверяем каждую жалобу в течение 24 часов. Для тебя фото скрыто сразу.';

  @override
  String get reportThanks => 'Спасибо, мы разберёмся';

  @override
  String blockMessageAllGroups(String name) {
    return 'Ты больше не будешь видеть фото и видео от $name ни в одной группе и получать уведомления о них. Это можно отменить в Настройках.';
  }

  @override
  String userBlocked(String name) {
    return '$name заблокирован(а)';
  }

  @override
  String get videoHiddenForYou => 'Видео скрыто для тебя';

  @override
  String get photoHiddenForYou => 'Фото скрыто для тебя';

  @override
  String get setAsCover => 'Сделать обложкой';

  @override
  String get coverUpdated => 'Обложка обновлена';

  @override
  String get hideForMe => 'Скрыть для меня';

  @override
  String get hideForMeSubtitle => 'Остальные в группе по-прежнему его видят';

  @override
  String get reportPhoto => 'Пожаловаться на фото';

  @override
  String blockName(String name) {
    return 'Заблокировать $name';
  }

  @override
  String get forEveryoneInGroup => 'Для всех в группе';

  @override
  String get videoDeleted => 'Видео удалено';

  @override
  String get photoDeleted => 'Фото удалено';

  @override
  String get photoAccessToSave =>
      'Дай CamTrip доступ к фото в Настройках, чтобы сохранять их';

  @override
  String get phoneFull => 'Память телефона заполнена';

  @override
  String get albumSaveFailedShort => 'Не удалось сохранить в альбом';

  @override
  String get recapTemplateGoldenHour => 'Золотой час';

  @override
  String get recapTemplateFast => 'Быстрый';

  @override
  String get recapTemplateFilmRoll => 'Плёнка';

  @override
  String get recapTemplatePolaroid => 'Полароид';

  @override
  String get trackSummerEvening => 'Летний вечер';

  @override
  String get trackGoldenHour => 'Золотой час';

  @override
  String get trackRoadtrip => 'Роуд-трип';

  @override
  String get moodWarm => 'тёплая';

  @override
  String get moodCheerful => 'бодрая';

  @override
  String friendsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count друга',
      many: '$count друзей',
      few: '$count друга',
      one: '$count друг',
    );
    return '$_temp0';
  }

  @override
  String get madeWithCamTrip => 'Сделано в CamTrip';

  @override
  String get tagline => 'Одна плёнка на всю компанию';

  @override
  String get videoUnsupportedDevice =>
      'На этом устройстве не удалось создать видео';

  @override
  String get groupLoadFailed => 'Не удалось загрузить группу.';

  @override
  String recapNeedsPhotos(int count) {
    return 'Для итогов нужно минимум $count фото.';
  }

  @override
  String get recapFailed => 'Не удалось создать итоги. Попробуй ещё раз.';

  @override
  String get recapSaved => 'Итоги сохранены в фотоальбом';

  @override
  String get recap => 'Итоги';

  @override
  String get recapRendering => 'Создаём итоги...';

  @override
  String get videoRendering => 'Создаём видео...';

  @override
  String get template => 'Шаблон';

  @override
  String get musicLicense => 'Собственная музыка CamTrip · без отчислений';

  @override
  String get change => 'Изменить';

  @override
  String get noWatermark => 'Без водяного знака ✓';

  @override
  String get removeWatermarkPro => 'Убери водяной знак с Pro';

  @override
  String get proSourceSubscription => 'Подписка';

  @override
  String get proSourceGift => 'Подарок';

  @override
  String get proSourceAdmin => 'Админ';

  @override
  String get proSourceGroup => 'Через группу';

  @override
  String get noPro => 'Без Pro';

  @override
  String proStatusNoEnd(String source) {
    return 'Pro ($source), бессрочно';
  }

  @override
  String proStatusUntil(String source, String date) {
    return 'Pro ($source), до $date';
  }

  @override
  String get lifetime => 'Навсегда';

  @override
  String get pickDate => 'Выбери дату';

  @override
  String get noAccess => 'Нет доступа';

  @override
  String get adminOnlyTeam => 'Раздел «Управление» только для команды CamTrip.';

  @override
  String get adminOverview => 'Обзор';

  @override
  String get adminUsers => 'Пользователи';

  @override
  String get adminReports => 'Жалобы';

  @override
  String adminsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count админа',
      many: '$count админов',
      few: '$count админа',
      one: '$count админ',
    );
    return '$_temp0';
  }

  @override
  String get adminNewThisWeek => 'Новые за неделю';

  @override
  String get adminGroups => 'Группы';

  @override
  String get adminProSubscription => 'Pro по подписке';

  @override
  String get adminProGift => 'Pro в подарок';

  @override
  String adminWithoutSubscription(int count) {
    return '$count без подписки';
  }

  @override
  String get adminOpenReports => 'Открытые жалобы';

  @override
  String get adminSearchHint => 'Поиск по имени или эл. почте';

  @override
  String get nobodyFound => 'Никого не найдено';

  @override
  String get loadMore => 'Загрузить ещё';

  @override
  String get noEmail => 'Нет эл. почты';

  @override
  String adminDeletePhotoMessage(String groupName) {
    return 'Фото исчезнет для всех в «$groupName». Все жалобы на это фото будут закрыты.';
  }

  @override
  String get adminBanMessage =>
      'Этот аккаунт больше не сможет входить и пользоваться приложением. Это можно отменить позже.';

  @override
  String get adminDismissTitle => 'Отклонить жалобу?';

  @override
  String get adminDismissMessage =>
      'Фото останется. Жалоба будет отмечена как закрытая.';

  @override
  String get adminDismiss => 'Отклонить';

  @override
  String get adminAccountBlocked => 'Аккаунт заблокирован';

  @override
  String get adminReportDismissed => 'Жалоба отклонена';

  @override
  String get adminNoReports => 'Открытых жалоб нет';

  @override
  String get adminNoReportsMessage =>
      'Здесь появятся фото, на которые пожаловались.';

  @override
  String get deletedTag => 'Удалено';

  @override
  String adminReportedBy(String name) {
    return 'От $name';
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
      other: '$count жалобы',
      many: '$count жалоб',
      few: '$count жалобы',
      one: '$count жалоба',
    );
    return '$_temp0';
  }

  @override
  String get adminDeletePhoto => 'Удалить фото';

  @override
  String get adminBlockCreator => 'Заблокировать автора';

  @override
  String get loadFailed => 'Не удалось загрузить';

  @override
  String get adminLifetimeProGiven => 'Pro навсегда выдан';

  @override
  String get adminProGiven => 'Pro выдан';

  @override
  String adminGiveProUntil(String date) {
    return 'Выдать Pro до $date';
  }

  @override
  String get adminGiveProLifetime => 'Выдать Pro навсегда';

  @override
  String adminGiveProFor(String period) {
    return 'Выдать Pro на $period';
  }

  @override
  String get adminReasonHint =>
      'Причина, например друг, тестировщик, инфлюенсер';

  @override
  String get adminGivePro => 'Выдать Pro';

  @override
  String get adminRevokeTitle => 'Отозвать подарок?';

  @override
  String get adminRevokeMessage =>
      'Подаренный Pro сразу перестанет действовать. Собственная подписка продолжит работать.';

  @override
  String get adminRevoke => 'Отозвать';

  @override
  String get adminGiftRevoked => 'Подарок отозван';

  @override
  String get adminUnbanTitle => 'Снять блокировку?';

  @override
  String adminUnbanMessage(String name) {
    return '$name снова сможет входить.';
  }

  @override
  String get adminUnbanned => 'Блокировка снята';

  @override
  String get adminBanUserMessage =>
      'Этот аккаунт больше не сможет входить и пользоваться приложением. Фото останутся.';

  @override
  String get adminUser => 'Пользователь';

  @override
  String get adminNotVerified => 'не подтверждён';

  @override
  String get adminRole => 'Роль';

  @override
  String get adminCreated => 'Создан';

  @override
  String get unknown => 'Неизвестно';

  @override
  String get adminSignInWith => 'Входит через';

  @override
  String get adminEmailMethod => 'Эл. почта';

  @override
  String get adminPhotosAndVideos => 'Фото и видео';

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
    return 'Подарок от $name';
  }

  @override
  String adminExpiredOn(String date) {
    return 'Истёк $date';
  }

  @override
  String get adminExpired => 'Истёк';

  @override
  String adminUntil(String date) {
    return 'До $date';
  }

  @override
  String get adminGiveProTitle => 'Выдать Pro';

  @override
  String get adminGiveProNote =>
      'Действует и для групп этого человека: один Pro в группе = Pro для всех в этой группе.';

  @override
  String get adminRevokeGift => 'Отозвать подарок';

  @override
  String get adminModeration => 'Модерация';

  @override
  String get adminCannotBanSelf => 'Нельзя заблокировать себя.';

  @override
  String get adminCannotBanAdmin => 'Админа нельзя заблокировать.';

  @override
  String get adminUnban => 'Снять блокировку';

  @override
  String get adminBanAccount => 'Заблокировать аккаунт';

  @override
  String get googleSignInUnavailable => 'Вход через Google пока недоступен';

  @override
  String get cameraPickerTitle => 'Выбери камеру';

  @override
  String get cameraPickerSubtitle => 'Каждая камера придаёт фото свой стиль';

  @override
  String get cameraPickerChange => 'Сменить камеру';

  @override
  String get cameraPickerUnlock => 'Открыть с Pro';

  @override
  String get cameraPickerSelected => 'Выбрана';

  @override
  String get cameraPickerStyleSummer => 'Лето';

  @override
  String get cameraPickerStyleSummerDescription =>
      'Тёплые выцветшие цвета, как на снимке из 90-х';

  @override
  String get cameraPickerStyleNight => 'Ночь 800';

  @override
  String get cameraPickerStyleNightDescription =>
      'Киноплёнка: бирюзовые тени, тёплый свет, много зерна';

  @override
  String get cameraPickerStyleSepia => 'Сепия';

  @override
  String get cameraPickerStyleSepiaDescription =>
      'Старый коричневый снимок из коробки из-под обуви';

  @override
  String get cameraPickerStyleLomo => 'Ломо';

  @override
  String get cameraPickerStyleLomoDescription =>
      'Яркие цвета, тёмные углы и дикий цветовой оттенок';

  @override
  String get cameraPickerStyleMint => 'Мята';

  @override
  String get cameraPickerStyleMintDescription =>
      'Мягкий и свежий, с зелёным оттенком';

  @override
  String get cameraPickerStylePastel => 'Розовый';

  @override
  String get cameraPickerStylePastelDescription =>
      'Пастельные цвета с розовым сиянием и белой рамкой';

  @override
  String get cameraPickerStyleSuper8 => 'Super 8';

  @override
  String get cameraPickerStyleSuper8Description =>
      'Зернистый и мягкий, как старое домашнее видео';

  @override
  String get paywallBenefitGroup => 'Один Pro = Pro для всей группы';

  @override
  String get paywallBenefitUnlimited =>
      'Без ограничений по участникам, фото хранятся навсегда';

  @override
  String get paywallBenefitQuality => 'Без водяного знака, исходное качество';

  @override
  String paywallFreeTrial(String period) {
    return '$period бесплатно';
  }

  @override
  String paywallPriceYear(String price) {
    return '$price в год.';
  }

  @override
  String paywallPriceYearTrial(String period, String price) {
    return '$period бесплатно, затем $price в год.';
  }

  @override
  String paywallPriceMonth(String price) {
    return '$price в месяц.';
  }

  @override
  String paywallPriceMonthTrial(String period, String price) {
    return '$period бесплатно, затем $price в месяц.';
  }

  @override
  String paywallAutoRenew(String store) {
    return 'Продлевается автоматически. Отмени минимум за 24 часа до продления в $store.';
  }

  @override
  String get paywallDetailsTitle => 'Всё в Pro';

  @override
  String get paywallBenefitStyles => 'Все стили камеры';

  @override
  String get allPhotosTitle => 'Все фото';

  @override
  String get homeTabAlbums => 'Альбомы';

  @override
  String get allPhotosEmptyTitle => 'Фото пока нет';

  @override
  String get allPhotosEmptyMessage => 'Открой камеру и сделай первое фото.';

  @override
  String get allPhotosLoadFailed => 'Не удалось загрузить фото';

  @override
  String get cameraSettingsTitle => 'Настройки камеры';

  @override
  String get cameraSettingsMore => 'Другие настройки';

  @override
  String get cameraSettingsGrid => 'Сетка';

  @override
  String get cameraSettingsHaptics => 'Вибрация при съёмке';

  @override
  String get cameraSettingsDateStamp => 'Дата в правом нижнем углу';

  @override
  String get cameraSettingsSound => 'Звук затвора';

  @override
  String get cameraSettingsSoundHint =>
      'Без звука, если телефон в беззвучном режиме';

  @override
  String get cameraSettingsTimer => 'Автоспуск';

  @override
  String get cameraSettingsTimerOff => 'Выкл.';

  @override
  String cameraSettingsTimerSeconds(int seconds) {
    return '$seconds с';
  }

  @override
  String get cameraSettingsTimerCancelHint => 'Нажми на затвор, чтобы отменить';

  @override
  String get cameraSettingsMirror => 'Зеркалить селфи';

  @override
  String get cameraSettingsSaveToRoll => 'Сохранять в фотоплёнку';

  @override
  String get cameraSettingsQuality => 'Качество';

  @override
  String get cameraSettingsQualityStandard => 'Стандартное';

  @override
  String get cameraSettingsQualityHigh => 'Высокое';

  @override
  String get cameraLowLightHint => 'Мало света - включи вспышку';

  @override
  String get cameraFlashUnavailable => 'У этой камеры нет вспышки';

  @override
  String get cameraFlashScreen => 'Вспышка экраном';

  @override
  String get cameraFlashCycleHint =>
      'Нажми, чтобы переключить: выкл., вкл. и авто';

  @override
  String get cameraFlip => 'Переключить фронтальную и основную камеру';

  @override
  String get cameraFlipHint =>
      'Дважды коснись видоискателя, чтобы сменить камеру';

  @override
  String cameraPickerPaywallStyles(int count, String styles) {
    return 'Все $count камер, включая $styles';
  }

  @override
  String get styleFlash => 'Вспышка 400';

  @override
  String get styleFlashDescription =>
      'Прямая вспышка на тёплой плёнке: янтарное сияние, зерно, сочные красные';

  @override
  String cameraTimerButton(String state) {
    return 'Автоспуск: $state';
  }

  @override
  String get cameraTimerCycleHint =>
      'Нажми, чтобы переключить: выкл., 3 с и 10 с';

  @override
  String get cameraLastShotOpen => 'Последнее фото, открывает альбом';

  @override
  String get cameraLastShotEmpty => 'Фото пока нет, открывает альбом';

  @override
  String get deleteOnlyOwnOrAdmin => 'Удалить это может только автор или админ';

  @override
  String get videoPlay => 'Воспроизвести';

  @override
  String get videoPause => 'Пауза';

  @override
  String get language => 'Язык';

  @override
  String get languageSystem => 'Язык системы';

  @override
  String languageSystemCurrent(String language) {
    return 'Системный ($language)';
  }

  @override
  String get languageSearchHint => 'Поиск языка';

  @override
  String get languageNoResults => 'Язык не найден';

  @override
  String get personalRollTitle => 'Моя плёнка';

  @override
  String get personalRollSubtitle => 'Только для тебя';

  @override
  String get personalRollPickerSubtitle => 'Отдельные фото, только для тебя';

  @override
  String get personalRollMove => 'В альбом';

  @override
  String get personalRollMoveTitle => 'Переместить в альбом';

  @override
  String get personalRollMoveNoAlbums =>
      'Сначала создай альбом или присоединись к нему по коду.';

  @override
  String personalRollMoved(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count фото перемещено в $album',
      one: '1 фото перемещено в $album',
    );
    return '$_temp0';
  }

  @override
  String get personalRollPrivateNote =>
      'Эти фото видишь только ты. Перемести их в альбом, чтобы поделиться.';

  @override
  String get paywallTripPassSub => 'Только эта поездка, для всей группы';

  @override
  String get paywallOneTime => 'разово';

  @override
  String get paywallBestValue => 'Выгоднее всего';

  @override
  String paywallRollFullTitle(int used, int limit) {
    return 'Твоя плёнка закончилась - $used/$limit фото';
  }

  @override
  String get paywallRollFullSub => 'Снимай дальше с Trip Pass или Pro.';

  @override
  String get paywallCameraTitle => 'Эта камера входит в Pro';

  @override
  String paywallCameraSub(int count) {
    return 'Открой все камеры: $count.';
  }

  @override
  String get paywallWatermarkTitle => 'Recap без водяного знака';

  @override
  String get paywallWatermarkSub => 'Делись recap без логотипа CamTrip.';

  @override
  String get paywallDeletionTitle => 'Сохрани поездку';

  @override
  String paywallDeletionSub(String date) {
    return 'Бесплатные поездки удаляются $date. С Trip Pass или Pro она останется навсегда.';
  }

  @override
  String paywallTripPassTerms(String price) {
    return 'Разовая покупка за $price для этой поездки. Не подписка.';
  }

  @override
  String get buyTripPass => 'Купить Trip Pass';

  @override
  String get tripPassActive => 'Trip Pass активен: поездка Pro для всех';

  @override
  String get tripPassActivating =>
      'Оплата получена. Trip Pass скоро заработает.';

  @override
  String proViaTripPass(String name) {
    return 'Trip Pass от $name';
  }

  @override
  String rollCounterSemantics(int used, int limit) {
    return '$used из $limit кадров на плёнке';
  }

  @override
  String rollHeldTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Не помещается на плёнку фото: $count',
      one: '1 фото не помещается на плёнку',
    );
    return '$_temp0';
  }

  @override
  String get rollHeldBody => 'Сохрани их с Pro или Trip Pass';

  @override
  String deletionBannerTitle(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Сохрани поездку - осталось дней: $days',
      one: 'Сохрани поездку - остался 1 день',
    );
    return '$_temp0';
  }

  @override
  String get deletionBannerBody =>
      'Бесплатные поездки удаляются через 30 дней после окончания. С Trip Pass или Pro она останется навсегда.';

  @override
  String apiRollFull(int limit) {
    return 'Плёнка закончилась ($limit кадров). Возьми Trip Pass или Pro, чтобы снимать дальше.';
  }

  @override
  String get apiTripPassFailed =>
      'Не удалось активировать Trip Pass. Напиши на support@camtrip.app.';

  @override
  String get apiTripPassExists => 'У этой поездки уже есть Trip Pass.';

  @override
  String get tripPassUnavailable =>
      'Trip Pass сейчас недоступен. Попробуй позже.';

  @override
  String get tripMapTitle => 'Карта поездки';

  @override
  String get tripMapOpen => 'Карта и статистика';

  @override
  String get tripMapLoadFailed => 'Не удалось загрузить карту';

  @override
  String get tripMapStatDays => 'Дни';

  @override
  String get tripMapStatPhotos => 'Фото';

  @override
  String get tripMapStatVideos => 'Видео';

  @override
  String get tripMapStatMembers => 'Участники';

  @override
  String get tripMapStatDistance => 'км пути';

  @override
  String get tripMapStatCountries => 'Страны';

  @override
  String get tripMapStatPlaces => 'Места';

  @override
  String tripMapBusiestDay(String day, int count) {
    return 'Больше всего фото: $day ($count)';
  }

  @override
  String tripMapTopPhotographer(String name, int count) {
    return 'Главный фотограф: $name ($count)';
  }

  @override
  String get tripMapOffTitle => 'Карта поездки выключена';

  @override
  String get tripMapOffMessage =>
      'Админ может включить карту в настройках группы. Статистику ты видишь всегда.';

  @override
  String get tripMapOffMessageAdmin =>
      'Включи карту, чтобы видеть, где сделаны ваши фото. Каждый сам решает, участвовать ли.';

  @override
  String get tripMapEnable => 'Включить карту';

  @override
  String get tripMapEmptyTitle => 'На карте пока нет мест';

  @override
  String get tripMapEmptyMessage =>
      'Новые фото участников, которые делятся местоположением, появятся здесь с точностью около 100 м.';

  @override
  String get tripMapConsentTitle => 'Карта поездки';

  @override
  String get tripMapConsentQuestion =>
      'Показывать на карте этой группы, где сделаны твои фото?';

  @override
  String get tripMapConsentDetail =>
      'Это видят только участники группы, с точностью около 100 м. Местоположение никогда не записывается в само фото, и это можно выключить в любой момент в настройках группы.';

  @override
  String get tripMapConsentYes => 'Да, делиться';

  @override
  String get tripMapConsentNo => 'Нет';

  @override
  String get tripMapLocationDenied =>
      'Нет доступа к местоположению. Разреши его в настройках телефона.';

  @override
  String get tripMapSettingSubtitle =>
      'Показывать на карте, где сделаны фото. Участники сами решают, делиться ли.';

  @override
  String get tripMapDisableTitle => 'Выключить карту?';

  @override
  String get tripMapDisableMessage =>
      'Все местоположения в группе будут удалены. Если потом снова включишь карту, мы спросим всех заново.';

  @override
  String get tripMapDisable => 'Выключить';

  @override
  String get tripMapMySharing => 'Делиться местоположением';

  @override
  String get tripMapMySharingOn =>
      'Твои новые фото появляются на карте (с точностью около 100 м).';

  @override
  String get tripMapMySharingOff =>
      'Выключено. Твои фото не появляются на карте.';

  @override
  String get tripMapStopSharingTitle => 'Перестать делиться местоположением?';

  @override
  String get tripMapStopSharingMessage =>
      'Местоположения всех твоих фото в этой группе будут удалены.';

  @override
  String get tripMapStopSharing => 'Перестать';
}
