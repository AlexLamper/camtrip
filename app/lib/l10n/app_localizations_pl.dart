// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get cancel => 'Anuluj';

  @override
  String get yes => 'Tak';

  @override
  String inviteMessageIntro(String groupName) {
    return 'Dołączysz do „$groupName” w CamTrip? Wtedy od razu widzimy swoje zdjęcia.';
  }

  @override
  String inviteMessageCode(String code) {
    return 'Albo wpisz kod: $code';
  }

  @override
  String get memberFallbackName => 'Znajomy';

  @override
  String get reportReasonInappropriate => 'Nieodpowiednie lub obraźliwe';

  @override
  String get reportReasonSpam => 'Spam';

  @override
  String get reportReasonOther => 'Coś innego';

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
  String get errorOffline => 'Brak połączenia. Spróbuj za chwilę.';

  @override
  String errorSomethingWrongStatus(int status) {
    return 'Coś poszło nie tak ($status)';
  }

  @override
  String get errorSomethingWrong => 'Coś poszło nie tak';

  @override
  String get apiInvalidCredentials => 'Nieprawidłowy e-mail lub hasło';

  @override
  String get apiInvalidCode =>
      'Ten kod jest nieprawidłowy lub wygasł. Poproś o nowy kod.';

  @override
  String get apiEmailTaken =>
      'Konto z tym adresem e-mail już istnieje. Zaloguj się albo wybierz „Nie pamiętasz hasła?”.';

  @override
  String apiEmailTakenProvider(String provider) {
    return 'Konto z tym adresem e-mail już istnieje. Zaloguj się przez $provider.';
  }

  @override
  String apiWeakPassword(int min) {
    return 'Wybierz hasło o długości co najmniej $min znaków';
  }

  @override
  String apiNameTooLong(int max) {
    return 'Twoje imię może mieć maksymalnie $max znaków';
  }

  @override
  String get apiRateLimited => 'Zbyt wiele prób. Spróbuj ponownie za kwadrans.';

  @override
  String apiAccountBanned(String email) {
    return 'Twoje konto zostało zablokowane. Napisz na $email, jeśli uważasz, że to pomyłka.';
  }

  @override
  String get apiProRequired => 'Ten styl aparatu należy do CamTrip Pro';

  @override
  String get apiGroupClosed => 'Ta grupa została zamknięta';

  @override
  String get apiGroupCodeNotFound => 'Nie znaleziono grupy z tym kodem';

  @override
  String apiGroupFull(int max) {
    return 'Ta grupa jest pełna (maks. $max członków). Jeśli ktoś w grupie ma CamTrip Pro, może dołączyć dowolnie wiele osób.';
  }

  @override
  String get apiLastMember =>
      'Jesteś ostatnim członkiem. Zamiast tego usuń grupę.';

  @override
  String get apiAdminRequired => 'Tylko dla administratorów CamTrip';

  @override
  String get apiUploadIncomplete => 'Przesyłanie nie zostało ukończone';

  @override
  String get apiInvalidInput => 'Nieprawidłowe dane';

  @override
  String get apiNotSignedIn => 'Nie zalogowano';

  @override
  String get apiAccountGone => 'To konto już nie istnieje';

  @override
  String get apiPhotoNotFound => 'Nie znaleziono zdjęcia';

  @override
  String get apiGroupNotFound => 'Nie znaleziono grupy';

  @override
  String get apiMemberNotFound => 'Nie znaleziono członka';

  @override
  String get apiPersonNotFound => 'Nie znaleziono osoby';

  @override
  String get apiUserNotFound => 'Nie znaleziono użytkownika';

  @override
  String get apiAdminOnly => 'Tylko admin może to zrobić';

  @override
  String get apiCannotBlockSelf => 'Nie możesz zablokować samego siebie';

  @override
  String get apiCannotReportOwn => 'Nie możesz zgłosić własnego zdjęcia';

  @override
  String get apiDeleteOwnOnly => 'Możesz usuwać tylko własne zdjęcia';

  @override
  String get apiOwnerCannotBeRemoved => 'Twórcy grupy nie można usunąć';

  @override
  String get apiOwnerStaysAdmin => 'Twórca grupy pozostaje adminem';

  @override
  String get apiNeedsOneAdmin => 'Grupa potrzebuje co najmniej jednego admina';

  @override
  String get apiEndBeforeStart =>
      'Data końcowa jest wcześniejsza niż początkowa';

  @override
  String get apiPermanentNoEndDate =>
      'Grupa zawsze otwarta nie ma daty końcowej';

  @override
  String get apiCannotBanAdmin => 'Administratora nie można zablokować';

  @override
  String get apiReportNotFound => 'Nie znaleziono zgłoszenia';

  @override
  String get apiPhotoOwnerUnknown => 'Nie wiadomo już, kto zrobił to zdjęcie';

  @override
  String get validationNameRequired => 'Wpisz swoje imię';

  @override
  String validationMaxChars(int max) {
    return 'Maksymalnie $max znaków';
  }

  @override
  String get validationEmailRequired => 'Wpisz swój adres e-mail';

  @override
  String get validationEmailInvalid => 'Ten adres e-mail jest nieprawidłowy';

  @override
  String get validationPasswordRequired => 'Wybierz hasło';

  @override
  String validationMinChars(int min) {
    return 'Co najmniej $min znaków';
  }

  @override
  String get validationPasswordTooLong => 'To hasło jest za długie';

  @override
  String get validationPasswordEmpty => 'Wpisz hasło';

  @override
  String get validationCodeRequired => 'Wpisz kod z e-maila';

  @override
  String get validationCodeDigits => 'Kod ma 6 cyfr';

  @override
  String get onboarding1Title => 'Jedna klisza\ndla całej grupy.';

  @override
  String get onboarding1Body =>
      'Rób zdjęcia aparatem retro. Wszyscy od razu je widzą, a do tego trafiają prosto do twojego albumu.';

  @override
  String get onboarding2Title => 'Koniec z\nprzesyłaniem zdjęć.';

  @override
  String get onboarding2Body =>
      'Załóż grupę, udostępnij kod i gotowe. Nigdy więcej „podeślesz mi te zdjęcia?”';

  @override
  String get onboarding3Title => 'Na koniec\nwideo-podsumowanie.';

  @override
  String get onboarding3Body =>
      'CamTrip robi wideo z muzyką z waszych najlepszych chwil.';

  @override
  String get onboardingInvited =>
      'Masz zaproszenie! Zaloguj się, żeby dołączyć.';

  @override
  String get signInAppleFailed => 'Logowanie przez Apple nie powiodło się';

  @override
  String get signInGoogleFailed => 'Logowanie przez Google nie powiodło się';

  @override
  String get signInFailed => 'Logowanie nie powiodło się';

  @override
  String get next => 'Dalej';

  @override
  String get legalPrefix => 'Kontynuując, akceptujesz ';

  @override
  String get legalTerms => 'regulamin';

  @override
  String get legalAnd => ' i ';

  @override
  String get legalPrivacy => 'politykę prywatności';

  @override
  String get legalSuffix => '.';

  @override
  String get continueWithApple => 'Kontynuuj z Apple';

  @override
  String get continueWithGoogle => 'Kontynuuj z Google';

  @override
  String get createAccount => 'Załóż konto';

  @override
  String get signIn => 'Zaloguj się';

  @override
  String get or => 'lub';

  @override
  String get registerSubtitle => 'Dzięki temu znajomi widzą, kto robi zdjęcia.';

  @override
  String get loginSubtitle => 'Witaj ponownie.';

  @override
  String get forgotPasswordTitle => 'Nie pamiętasz hasła';

  @override
  String get forgotPasswordPushSubtitle =>
      'Masz jeszcze aktywną sesję na jakimś urządzeniu? Wyślemy tam 6-cyfrowy kod w powiadomieniu, aby ustawić nowe hasło.';

  @override
  String get newPassword => 'Nowe hasło';

  @override
  String get resetPushInfo =>
      'Jeśli masz jeszcze aktywną sesję na jakimś urządzeniu, dostaniesz tam powiadomienie z kodem. Nie możesz się zalogować? Zaloguj się przez Apple lub Google tym samym adresem e-mail - Twoje konto zostanie wtedy połączone.';

  @override
  String get sendCode => 'Wyślij kod';

  @override
  String get savePassword => 'Zapisz hasło';

  @override
  String get errorTryAgain => 'Coś poszło nie tak. Spróbuj ponownie.';

  @override
  String get back => 'Wstecz';

  @override
  String get name => 'Imię';

  @override
  String get email => 'Adres e-mail';

  @override
  String get codeFromPush => 'Kod z powiadomienia';

  @override
  String get password => 'Hasło';

  @override
  String get hidePassword => 'Ukryj hasło';

  @override
  String get showPassword => 'Pokaż hasło';

  @override
  String get forgotPasswordLink => 'Nie pamiętasz hasła?';

  @override
  String get haveAccount => 'Masz już konto?';

  @override
  String get newToCamTrip => 'Nowy w CamTrip?';

  @override
  String get rememberedIt => 'Przypomniało ci się?';

  @override
  String get noCodeReceived => 'Nie dostałeś kodu?';

  @override
  String get resendCode => 'Wyślij ponownie';

  @override
  String onboardingDemoRoll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotografa, 1 klisza',
      many: '$count fotografów, 1 klisza',
      few: '$count fotografów, 1 klisza',
      one: '1 fotograf, 1 klisza',
    );
    return '$_temp0';
  }

  @override
  String membersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count członka',
      many: '$count członków',
      few: '$count członków',
      one: '1 członek',
    );
    return '$_temp0';
  }

  @override
  String photosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count zdjęcia',
      many: '$count zdjęć',
      few: '$count zdjęcia',
      one: '1 zdjęcie',
    );
    return '$_temp0';
  }

  @override
  String videosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count wideo',
      many: '$count wideo',
      few: '$count wideo',
      one: '1 wideo',
    );
    return '$_temp0';
  }

  @override
  String get justNow => 'teraz';

  @override
  String get badgeNew => 'Nowe';

  @override
  String recapTitle(String groupName) {
    return 'Podsumowanie: $groupName';
  }

  @override
  String get styleFilm => 'Film';

  @override
  String get styleInstant => 'Instant';

  @override
  String get styleDisposable => 'Jednorazowy';

  @override
  String get styleBw => 'Cz-B';

  @override
  String get styleGolden => 'Golden';

  @override
  String get styleChrome => 'Chrome';

  @override
  String get styleFilmDescription =>
      'Ciepłe kolory, ziarno i pomarańczowa data na zdjęciu';

  @override
  String get styleInstantDescription => 'Miękkie kolory i biała ramka';

  @override
  String get styleDisposableDescription =>
      'Ostry flesz, winieta i prześwietlenia';

  @override
  String get styleBwDescription =>
      'Ziarniste czarno-białe z głębokim kontrastem';

  @override
  String get styleGoldenDescription =>
      'Zawsze złota godzina, miękka złota poświata';

  @override
  String get styleChromeDescription => 'Chłodny, nasycony i ostry jak slajd';

  @override
  String get shutterStopRecording => 'Zatrzymaj nagrywanie';

  @override
  String get shutterStartRecording => 'Zacznij nagrywać wideo';

  @override
  String get shutterTakePhoto => 'Zrób zdjęcie';

  @override
  String get modePhoto => 'Zdjęcie';

  @override
  String get modeVideo => 'Wideo';

  @override
  String get cameraNotFound => 'Nie znaleziono aparatu';

  @override
  String get cameraAccessNeeded =>
      'CamTrip potrzebuje dostępu do aparatu. Włącz go w Ustawieniach.';

  @override
  String get cameraStartFailed => 'Nie udało się uruchomić aparatu';

  @override
  String get albumAccessNeeded =>
      'Daj CamTrip dostęp do zdjęć, żeby zapisywać je też w albumie';

  @override
  String get albumSaveFailed =>
      'Nie udało się zapisać w albumie. Zdjęcie i tak zostanie udostępnione.';

  @override
  String styleProFallback(String style) {
    return 'Ten styl należy do Pro. W tej grupie robisz zdjęcia stylem $style.';
  }

  @override
  String get photoFailed => 'Nie udało się zrobić zdjęcia. Spróbuj ponownie.';

  @override
  String get recordingFailed => 'Nie udało się nagrać wideo';

  @override
  String get videoFailed => 'Nie udało się utworzyć wideo. Spróbuj ponownie.';

  @override
  String get shootInGroup => 'Rób zdjęcia w grupie';

  @override
  String get close => 'Zamknij';

  @override
  String get flash => 'Flesz';

  @override
  String get flashOn => 'Wł.';

  @override
  String get flashOff => 'Wył.';

  @override
  String get flashAuto => 'Auto';

  @override
  String get chooseGroup => 'Wybierz grupę';

  @override
  String get switchCamera => 'Przełącz aparat';

  @override
  String get createOrJoinFirst => 'Najpierw załóż grupę lub do jakiejś dołącz';

  @override
  String get proViaGroup => 'Pro dzięki grupie';

  @override
  String proViaName(String name) {
    return 'Pro dzięki: $name';
  }

  @override
  String get proStylesFreeViaMember =>
      'Style Pro w tej grupie są dla ciebie darmowe dzięki członkowi z Pro';

  @override
  String proStylesFreeViaName(String name) {
    return 'Style Pro w tej grupie: darmowe dla ciebie dzięki $name';
  }

  @override
  String get subscriptionsUnavailable =>
      'Subskrypcje są teraz niedostępne. Spróbuj później.';

  @override
  String get paymentPending =>
      'Płatność jest jeszcze przetwarzana. Pro włączy się, gdy się zakończy.';

  @override
  String get purchaseFailed => 'Zakup nie powiódł się. Spróbuj później.';

  @override
  String get restoreUnavailable =>
      'Przywracanie zakupów jest teraz niemożliwe. Spróbuj później.';

  @override
  String get restoreFailed => 'Przywracanie nie powiodło się. Spróbuj później.';

  @override
  String get welcomePro => 'Witaj w CamTrip Pro! 🎉';

  @override
  String get proRestored => 'Pro zostało przywrócone';

  @override
  String get noPurchaseFound => 'Nie znaleziono wcześniejszego zakupu';

  @override
  String periodDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dnia',
      many: '$count dni',
      few: '$count dni',
      one: '1 dzień',
    );
    return '$_temp0';
  }

  @override
  String periodWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tygodnia',
      many: '$count tygodni',
      few: '$count tygodnie',
      one: '1 tydzień',
    );
    return '$_temp0';
  }

  @override
  String periodMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count miesiąca',
      many: '$count miesięcy',
      few: '$count miesiące',
      one: '1 miesiąc',
    );
    return '$_temp0';
  }

  @override
  String periodYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count roku',
      many: '$count lat',
      few: '$count lata',
      one: '1 rok',
    );
    return '$_temp0';
  }

  @override
  String get paywallHavePro => 'Masz CamTrip Pro';

  @override
  String get paywallSubtitle => 'Wszystko na twoją następną podróż.';

  @override
  String paywallFeatureStyles(String styles) {
    return 'Wszystkie style aparatu ($styles)';
  }

  @override
  String get paywallFeatureUnlimited =>
      'Bez limitu członków i miejsca, zdjęcia zostają na zawsze';

  @override
  String get paywallFeatureNoWatermark => 'Podsumowania bez znaku wodnego';

  @override
  String get paywallFeatureOriginal => 'Pobieranie w oryginalnej jakości';

  @override
  String get planYear => 'Rok';

  @override
  String get planMonth => 'Miesiąc';

  @override
  String pricePerMonth(String price) {
    return '$price miesięcznie';
  }

  @override
  String paywallSaveBadge(int percent) {
    return 'OSZCZĘDZASZ $percent%';
  }

  @override
  String get planMonthCancelAnytime => 'anulujesz w każdej chwili';

  @override
  String tryFree(String period) {
    return 'Wypróbuj $period za darmo';
  }

  @override
  String get becomePro => 'Przejdź na Pro';

  @override
  String get subscriptionsLoadFailed =>
      'Nie udało się wczytać subskrypcji. Sprawdź połączenie.';

  @override
  String legalAnnual(String price) {
    return 'Roczna subskrypcja CamTrip Pro: $price rocznie.';
  }

  @override
  String legalAnnualTrial(String period, String price) {
    return 'Roczna subskrypcja CamTrip Pro: $period za darmo, potem $price rocznie.';
  }

  @override
  String legalMonthly(String price) {
    return 'Miesięczna subskrypcja CamTrip Pro: $price miesięcznie.';
  }

  @override
  String legalMonthlyTrial(String period, String price) {
    return 'Miesięczna subskrypcja CamTrip Pro: $period za darmo, potem $price miesięcznie.';
  }

  @override
  String get legalBillingApple =>
      'Płatność zostanie pobrana z twojego Apple ID. Subskrypcja odnawia się automatycznie, chyba że anulujesz ją co najmniej 24 godziny przed końcem okresu. Możesz ją anulować i zarządzać nią w ustawieniach konta App Store.';

  @override
  String get legalBillingGoogle =>
      'Płatność zostanie pobrana z twojego konta Google. Subskrypcja odnawia się automatycznie, chyba że anulujesz ją co najmniej 24 godziny przed końcem okresu. Możesz ją anulować i zarządzać nią w ustawieniach konta Google Play.';

  @override
  String get restorePurchases => 'Przywróć zakupy';

  @override
  String get terms => 'Regulamin';

  @override
  String get privacy => 'Prywatność';

  @override
  String get groupProTitle => 'Jedno Pro w grupie = Pro dla całej grupy';

  @override
  String get groupProBody =>
      'Jeśli jedna osoba ma Pro, cała grupa dostaje wszystkie style aparatu, brak limitu członków, zdjęcia, które zostają, oryginalną jakość i podsumowania bez znaku wodnego.';

  @override
  String get groupCreated => 'Grupa utworzona ✓';

  @override
  String get inviteFriends => 'Zaproś znajomych';

  @override
  String get codeCopied => 'Kod skopiowany';

  @override
  String get shareLink => 'Udostępnij link';

  @override
  String inviteSubject(String groupName) {
    return 'Dołącz do $groupName w CamTrip';
  }

  @override
  String inviteMembersUnlimited(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count członka',
      many: '$count członków',
      few: '$count członków',
      one: '1 członek',
    );
    return '$_temp0 · bez limitu (Pro)';
  }

  @override
  String inviteMembersLimit(int count, int limit) {
    return '$count z $limit członków · Pro: bez limitu';
  }

  @override
  String get toCamera => 'Do aparatu';

  @override
  String get done => 'Gotowe';

  @override
  String get joinEnterCode => 'Wpisz 6-znakowy kod';

  @override
  String get joinGroupTitle => 'Dołącz do grupy';

  @override
  String get joinGroupSubtitle =>
      'Wpisz kod od znajomych albo zeskanuj ich kod QR.';

  @override
  String get typeCode => 'Wpisz kod';

  @override
  String get scanQr => 'Skanuj QR';

  @override
  String get join => 'Dołącz';

  @override
  String get groupNameRequired => 'Nadaj grupie nazwę';

  @override
  String get newGroup => 'Nowa grupa';

  @override
  String get groupType => 'Rodzaj grupy';

  @override
  String get groupTypeVacation => 'Wakacje';

  @override
  String get groupTypeVacationDescription =>
      'Z datą początku i końca, potem do archiwum';

  @override
  String get groupTypeEvent => 'Wydarzenie';

  @override
  String get groupTypeEventDescription =>
      'Jeden dzień lub wieczór, np. impreza';

  @override
  String get groupTypePermanent => 'Zawsze otwarta';

  @override
  String get groupTypePermanentDescription =>
      'Dla twojej stałej paczki znajomych';

  @override
  String get date => 'Data';

  @override
  String get departure => 'Wyjazd';

  @override
  String get returnDate => 'Powrót';

  @override
  String get defaultCameraStyle => 'Domyślny styl aparatu';

  @override
  String freeLimitPermanent(int max) {
    return 'Za darmo: do $max członków. Z Pro bez limitu.';
  }

  @override
  String freeLimitDated(int max, int days) {
    return 'Za darmo: do $max członków, zdjęcia zostają do $days dni po dacie końcowej. Z Pro bez limitu i na zawsze.';
  }

  @override
  String get createGroup => 'Utwórz grupę';

  @override
  String get group => 'Grupa';

  @override
  String groupCode(String code) {
    return 'kod $code';
  }

  @override
  String get manage => 'Zarządzanie';

  @override
  String get rename => 'Zmień nazwę';

  @override
  String get changeDates => 'Zmień daty';

  @override
  String get finishTrip => 'Zakończ podróż';

  @override
  String get finishTripSubtitle => 'Ustawia datę końcową na dziś';

  @override
  String get reopenGroup => 'Otwórz grupę ponownie';

  @override
  String get closeGroup => 'Zamknij grupę';

  @override
  String get reopenGroupSubtitle => 'Członkowie znów mogą dodawać zdjęcia';

  @override
  String get closeGroupSubtitle =>
      'Nikt nie może już dodawać zdjęć; wszystko nadal można oglądać';

  @override
  String get members => 'Członkowie';

  @override
  String memberYou(String name) {
    return '$name (ty)';
  }

  @override
  String get blockedTag => 'zablokowany';

  @override
  String get adminTag => 'admin';

  @override
  String removeMemberTitle(String name) {
    return 'Usunąć $name?';
  }

  @override
  String get removeMemberMessage => 'Zdjęcia tej osoby zostaną w grupie.';

  @override
  String get remove => 'Usuń';

  @override
  String get removeMember => 'Usuń';

  @override
  String blockTitle(String name) {
    return 'Zablokować $name?';
  }

  @override
  String blockMessage(String name) {
    return 'Nie będziesz już widzieć zdjęć i filmów od $name ani dostawać o nich powiadomień. Możesz to cofnąć w Ustawieniach.';
  }

  @override
  String get block => 'Zablokuj';

  @override
  String get makeMember => 'Zmień na zwykłego członka';

  @override
  String get makeAdmin => 'Zrób adminem';

  @override
  String get removeFromGroup => 'Usuń z grupy';

  @override
  String get unblock => 'Odblokuj';

  @override
  String get inviteFriendsButton => 'Zaproś znajomych';

  @override
  String get you => 'Ty';

  @override
  String get unarchive => 'Przywróć z archiwum';

  @override
  String get archive => 'Archiwizuj';

  @override
  String get unarchiveSubtitle => 'Grupa wraca do twoich albumów';

  @override
  String archiveSubtitle(String section) {
    return 'Tylko dla ciebie: grupa trafia do sekcji „$section” na dole albumów';
  }

  @override
  String get archivedSection => 'Zarchiwizowane';

  @override
  String get hiddenPhotos => 'Ukryte zdjęcia';

  @override
  String get hiddenPhotosSubtitle => 'Zdjęcia, które ukryłeś dla siebie';

  @override
  String get leaveGroup => 'Opuść grupę';

  @override
  String get leaveGroupSubtitle => 'Twoje zdjęcia zostaną w grupie dla innych';

  @override
  String get deleteGroup => 'Usuń grupę';

  @override
  String get deleteGroupSubtitle =>
      'Wszystkie zdjęcia zostaną usunięte dla wszystkich';

  @override
  String groupArchived(String groupName) {
    return 'Zarchiwizowano „$groupName”';
  }

  @override
  String groupUnarchived(String groupName) {
    return '„$groupName” wraca do twoich albumów';
  }

  @override
  String get undo => 'Cofnij';

  @override
  String get groupNameTitle => 'Nazwa grupy';

  @override
  String get finishTripTitle => 'Zakończyć podróż?';

  @override
  String get finishTripMessage =>
      'Datą końcową będzie dzisiaj. Nadal możesz dodawać zdjęcia; podsumowanie jest gotowe.';

  @override
  String get finishTripConfirm => 'Zakończ';

  @override
  String get tripFinished => 'Podróż zakończona';

  @override
  String leaveGroupTitle(String groupName) {
    return 'Opuścić „$groupName”?';
  }

  @override
  String get leaveGroupMessage =>
      'Twoje zdjęcia zostaną w grupie dla innych. Później możesz dołączyć ponownie kodem.';

  @override
  String get leave => 'Opuść';

  @override
  String groupDeleted(String groupName) {
    return 'Usunięto „$groupName”';
  }

  @override
  String get youAreAdmin => 'jesteś adminem';

  @override
  String get open => 'Otwórz';

  @override
  String get archiveMenuSubtitle =>
      'Tylko dla ciebie, inni niczego nie zauważą';

  @override
  String get deleteGroupMenuSubtitle =>
      'Dla wszystkich, ze wszystkimi zdjęciami';

  @override
  String get deleteGroupTitle => 'Usunąć grupę?';

  @override
  String deleteGroupMessage(int count, String groupName, int memberCount) {
    return 'Wszystkie zdjęcia i filmy ($count) z „$groupName” znikną dla wszystkich członków ($memberCount). Tego nie można cofnąć.';
  }

  @override
  String get deleteGroupOwnRoll =>
      'Twoja własna rolka aparatu pozostaje bez zmian.';

  @override
  String get deleteGroupTypeName => 'Wpisz nazwę grupy, aby potwierdzić:';

  @override
  String get deleteForEveryone => 'Usuń dla wszystkich';

  @override
  String get save => 'Zapisz';

  @override
  String get yourAlbums => 'Twoje albumy';

  @override
  String get uploadQueue => 'Kolejka wysyłania';

  @override
  String get noConnection => 'Brak połączenia';

  @override
  String get albumsOfflineMessage =>
      'Albumy wczytają się, gdy znów będziesz online. Aparat działa normalnie.';

  @override
  String get retry => 'Spróbuj ponownie';

  @override
  String get noAlbumsTitle => 'Nie masz jeszcze albumów';

  @override
  String get noAlbumsMessage =>
      'Załóż grupę na następną podróż albo dołącz do grupy znajomego jego kodem.';

  @override
  String get haveCode => 'Mam kod';

  @override
  String get joinWithCode => 'Dołącz kodem lub kodem QR';

  @override
  String get camera => 'Aparat';

  @override
  String get restore => 'Przywróć';

  @override
  String get more => 'Więcej';

  @override
  String get newAlbum => 'Nowa';

  @override
  String get closedTag => 'zamknięta';

  @override
  String get activeTag => 'aktywna';

  @override
  String get uploadFailed => 'Wysyłanie nie powiodło się';

  @override
  String get queueNoSignal => 'Brak zasięgu.';

  @override
  String get queueNoSignalMessage =>
      'Twoje zdjęcia są już w albumie i zostaną udostępnione, gdy znów będziesz online.';

  @override
  String get queueWaitingForWifi => 'Czekam na Wi-Fi.';

  @override
  String queueWifiOnlyOn(String setting) {
    return 'Masz włączone „$setting”.';
  }

  @override
  String get queueVideosWifiOnly => 'Filmy są wysyłane tylko przez Wi-Fi.';

  @override
  String get queueAllShared => 'Wszystko udostępnione ✓';

  @override
  String queuePending(String items) {
    return 'Do udostępnienia: $items';
  }

  @override
  String queuePendingBoth(String photos, String videos) {
    return 'Do udostępnienia: $photos i $videos';
  }

  @override
  String get retryUpload => 'Spróbuj ponownie';

  @override
  String get removeFromQueue => 'Usuń z kolejki';

  @override
  String get queueStatusWifi => 'Wi-Fi';

  @override
  String get queueStatusWaiting => 'czeka';

  @override
  String get videosWifiOnlyTitle => 'Filmy tylko przez Wi-Fi';

  @override
  String get videosWifiOnlySubtitle => 'Oszczędza dane komórkowe';

  @override
  String get retryNow => 'Spróbuj teraz';

  @override
  String get yourName => 'Twoje imię';

  @override
  String get settings => 'Ustawienia';

  @override
  String get tapToChangeName => 'Stuknij, aby zmienić imię';

  @override
  String get getCamTripPro => 'Przejdź na CamTrip Pro';

  @override
  String get photos => 'Zdjęcia';

  @override
  String get saveOwnPhotos => 'Zapisuj moje zdjęcia w albumie dla każdej grupy';

  @override
  String get autoSaveOthers => 'Automatycznie zapisuj zdjęcia innych';

  @override
  String get wifiOnlyTitle => 'Wysyłaj tylko przez Wi-Fi';

  @override
  String get dateStamp => 'Data na zdjęciu';

  @override
  String get notifications => 'Powiadomienia';

  @override
  String get notifyNewPhotos => 'Nowe zdjęcia (zbiorczo)';

  @override
  String get notifyRecapReady => 'Podsumowanie gotowe';

  @override
  String get camTripTeam => 'Zespół CamTrip';

  @override
  String get adminEntrySubtitle =>
      'Użytkownicy, przyznawanie Pro, zgłoszenia i liczby';

  @override
  String get account => 'Konto';

  @override
  String get manageSubscription => 'Zarządzaj subskrypcją';

  @override
  String get blockedPeople => 'Zablokowane osoby';

  @override
  String get nobody => 'Nikt';

  @override
  String peopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count osoby',
      many: '$count osób',
      few: '$count osoby',
      one: '1 osoba',
    );
    return '$_temp0';
  }

  @override
  String get privacyPolicy => 'Polityka prywatności';

  @override
  String get contact => 'Kontakt';

  @override
  String get signOut => 'Wyloguj się';

  @override
  String get deleteAccount => 'Usuń konto';

  @override
  String get deleteAccountSubtitle =>
      'Usuwa twoje konto i wszystkie twoje zdjęcia';

  @override
  String get deleteAccountTitle => 'Usunąć konto?';

  @override
  String get deleteAccountMessage =>
      'Twoje konto oraz wszystkie zdjęcia i filmy zostaną usunięte, także z grup. Aktywną subskrypcję anulujesz w App Store lub Google Play.';

  @override
  String get blockedTitle => 'Zablokowani';

  @override
  String get blockedSubtitle => 'Nie widzisz zdjęć tych osób.';

  @override
  String get blockedNone => 'Nikogo nie blokujesz.';

  @override
  String get unblockShort => 'Odblokuj';

  @override
  String get groupGone =>
      'Ta grupa już nie istnieje albo nie jesteś już jej członkiem.';

  @override
  String photosSavedToAlbum(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Zapisano $count zdjęcia w „$album”',
      many: 'Zapisano $count zdjęć w „$album”',
      few: 'Zapisano $count zdjęcia w „$album”',
      one: 'Zapisano 1 zdjęcie w „$album”',
    );
    return '$_temp0';
  }

  @override
  String photosDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Usunięto $count zdjęcia',
      many: 'Usunięto $count zdjęć',
      few: 'Usunięto $count zdjęcia',
      one: 'Usunięto 1 zdjęcie',
    );
    return '$_temp0';
  }

  @override
  String photosDeletedSkipped(int count, int skipped) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Usunięto $count zdjęcia',
      many: 'Usunięto $count zdjęć',
      few: 'Usunięto $count zdjęcia',
      one: 'Usunięto 1 zdjęcie',
    );
    return '$_temp0, pominięto: $skipped';
  }

  @override
  String photosHiddenForYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ukryto dla ciebie $count zdjęcia',
      many: 'Ukryto dla ciebie $count zdjęć',
      few: 'Ukryto dla ciebie $count zdjęcia',
      one: 'Ukryto dla ciebie 1 zdjęcie',
    );
    return '$_temp0';
  }

  @override
  String get addedToFavorites => 'Dodano do ulubionych';

  @override
  String get removedFromFavorites => 'Usunięto z ulubionych';

  @override
  String get photoAccessSettings =>
      'Daj CamTrip dostęp do zdjęć w Ustawieniach';

  @override
  String photosBeingAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Dodawanie zdjęć: $count',
      one: 'Dodawanie 1 zdjęcia',
    );
    return '$_temp0';
  }

  @override
  String photosUnreadable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Nie udało się odczytać zdjęć: $count',
      one: 'Nie udało się odczytać 1 zdjęcia',
    );
    return '$_temp0';
  }

  @override
  String get groupNotLoaded => 'Nie wczytano grupy';

  @override
  String get noFavoritesTitle => 'Nie masz jeszcze ulubionych';

  @override
  String get noPhotosTitle => 'Nie ma jeszcze zdjęć';

  @override
  String get noFavoritesMessage =>
      'Stuknij gwiazdkę przy zdjęciu, żeby je tu dodać.';

  @override
  String get noPhotosMessage =>
      'Zrób pierwsze zdjęcie. Cała grupa od razu je zobaczy.';

  @override
  String get openCamera => 'Otwórz aparat';

  @override
  String savingProgress(int done, int total) {
    return 'Zapisywanie... $done/$total';
  }

  @override
  String get choosePhotos => 'Wybierz zdjęcia';

  @override
  String selectedCount(int count) {
    return 'Zaznaczono: $count';
  }

  @override
  String get selectNone => 'Odznacz wszystko';

  @override
  String get selectAll => 'Zaznacz wszystko';

  @override
  String photosWaitingToShare(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count zdjęcia czeka na udostępnienie',
      many: '$count zdjęć czeka na udostępnienie',
      few: '$count zdjęcia czekają na udostępnienie',
      one: '1 zdjęcie czeka na udostępnienie',
    );
    return '$_temp0';
  }

  @override
  String get recapReadyTitle => 'Twoje podsumowanie jest gotowe';

  @override
  String get recapReadySubtitle => 'Wideo z muzyką z waszej podróży';

  @override
  String get watch => 'Obejrzyj';

  @override
  String get makeRecapNow => 'Zrób teraz wideo-podsumowanie';

  @override
  String freeGroupDeleteNotice(String date) {
    return 'Darmowa grupa: zdjęcia zostają do $date. Zapisz je albo przejdź na Pro.';
  }

  @override
  String get filterAll => 'Wszystkie';

  @override
  String get filterFavorites => 'Ulubione';

  @override
  String get filterPerPerson => 'Według osoby';

  @override
  String get filterPerson => 'Osoba';

  @override
  String get select => 'Zaznacz';

  @override
  String get hiddenFilter => 'Ukryte';

  @override
  String get photosBy => 'Zdjęcia od...';

  @override
  String get uploadedTag => 'przesłane';

  @override
  String get saveAll => 'Zapisz wszystko';

  @override
  String get favorite => 'Ulubione';

  @override
  String get unfavorite => 'Usuń z ulubionych';

  @override
  String get hide => 'Ukryj';

  @override
  String get delete => 'Usuń';

  @override
  String deletePhotosTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Usunąć $count zdjęcia?',
      many: 'Usunąć $count zdjęć?',
      few: 'Usunąć $count zdjęcia?',
      one: 'Usunąć zdjęcie?',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Znikną dla wszystkich w grupie. Tego nie można cofnąć.',
      one: 'Zniknie dla wszystkich w grupie. Tego nie można cofnąć.',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosNotAllowed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Zdjęcia innych osób ($count) zostają; tylko admin może je usunąć.',
      one:
          '1 zdjęcie należy do kogoś innego. Zostaje; tylko admin może je usunąć.',
    );
    return '$_temp0';
  }

  @override
  String photosBackInGroup(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count zdjęcia wróciło do grupy',
      many: '$count zdjęć wróciło do grupy',
      few: '$count zdjęcia wróciły do grupy',
      one: '1 zdjęcie wróciło do grupy',
    );
    return '$_temp0';
  }

  @override
  String get showAll => 'Pokaż wszystkie';

  @override
  String get hiddenPhotosExplainer =>
      'Tylko ty nie widzisz już tych zdjęć. Dla innych w grupie nadal są widoczne.';

  @override
  String get nothingHidden => 'Nic nie jest ukryte';

  @override
  String get nothingHiddenMessage => 'Tu znajdziesz zdjęcia, które ukryjesz.';

  @override
  String showAgainCount(int count) {
    return 'Pokaż ponownie ($count)';
  }

  @override
  String get someone => 'Ktoś';

  @override
  String get savedToAlbum => 'Zapisano w albumie ze zdjęciami';

  @override
  String get share => 'Udostępnij';

  @override
  String get shareFailed => 'Udostępnianie nie powiodło się';

  @override
  String get reportTitle => 'Dlaczego zgłaszasz to zdjęcie?';

  @override
  String get reportSubtitle =>
      'Sprawdzamy każde zgłoszenie w ciągu 24 godzin. Zdjęcie od razu zostaje dla ciebie ukryte.';

  @override
  String get reportThanks => 'Dzięki, przyjrzymy się temu';

  @override
  String blockMessageAllGroups(String name) {
    return 'Nie będziesz już widzieć zdjęć i filmów od $name w żadnej grupie ani dostawać o nich powiadomień. Możesz to cofnąć w Ustawieniach.';
  }

  @override
  String userBlocked(String name) {
    return 'Zablokowano: $name';
  }

  @override
  String get videoHiddenForYou => 'Wideo ukryte dla ciebie';

  @override
  String get photoHiddenForYou => 'Zdjęcie ukryte dla ciebie';

  @override
  String get setAsCover => 'Ustaw jako okładkę';

  @override
  String get coverUpdated => 'Zmieniono okładkę';

  @override
  String get hideForMe => 'Ukryj dla mnie';

  @override
  String get hideForMeSubtitle => 'Inni w grupie nadal je widzą';

  @override
  String get reportPhoto => 'Zgłoś zdjęcie';

  @override
  String blockName(String name) {
    return 'Zablokuj: $name';
  }

  @override
  String get forEveryoneInGroup => 'Dla wszystkich w grupie';

  @override
  String get videoDeleted => 'Usunięto wideo';

  @override
  String get photoDeleted => 'Usunięto zdjęcie';

  @override
  String get photoAccessToSave =>
      'Daj CamTrip dostęp do zdjęć w Ustawieniach, żeby zapisywać';

  @override
  String get phoneFull => 'Telefon jest pełny';

  @override
  String get albumSaveFailedShort => 'Nie udało się zapisać w albumie';

  @override
  String get recapTemplateGoldenHour => 'Golden Hour';

  @override
  String get recapTemplateFast => 'Szybki';

  @override
  String get recapTemplateFilmRoll => 'Klisza';

  @override
  String get recapTemplatePolaroid => 'Polaroid';

  @override
  String get trackSummerEvening => 'Letni wieczór';

  @override
  String get trackGoldenHour => 'Golden Hour';

  @override
  String get trackRoadtrip => 'Road trip';

  @override
  String get moodWarm => 'ciepła';

  @override
  String get moodCheerful => 'radosna';

  @override
  String friendsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count znajomego',
      many: '$count znajomych',
      few: '$count znajomych',
      one: '1 znajomy',
    );
    return '$_temp0';
  }

  @override
  String get madeWithCamTrip => 'Zrobione w CamTrip';

  @override
  String get tagline => 'Jedna klisza dla całej grupy';

  @override
  String get videoUnsupportedDevice =>
      'Na tym urządzeniu nie udało się utworzyć wideo';

  @override
  String get groupLoadFailed => 'Nie udało się wczytać tej grupy.';

  @override
  String recapNeedsPhotos(int count) {
    return 'Do podsumowania potrzebujesz co najmniej $count zdjęć.';
  }

  @override
  String get recapFailed =>
      'Nie udało się utworzyć podsumowania. Spróbuj ponownie.';

  @override
  String get recapSaved => 'Podsumowanie zapisane w albumie ze zdjęciami';

  @override
  String get recap => 'Podsumowanie';

  @override
  String get recapRendering => 'Tworzenie podsumowania...';

  @override
  String get videoRendering => 'Tworzenie wideo...';

  @override
  String get template => 'Szablon';

  @override
  String get musicLicense => 'Własna muzyka CamTrip · bez opłat licencyjnych';

  @override
  String get change => 'Zmień';

  @override
  String get noWatermark => 'Bez znaku wodnego ✓';

  @override
  String get removeWatermarkPro => 'Usuń znak wodny z Pro';

  @override
  String get proSourceSubscription => 'Subskrypcja';

  @override
  String get proSourceGift => 'Prezent';

  @override
  String get proSourceAdmin => 'Admin';

  @override
  String get proSourceGroup => 'Przez grupę';

  @override
  String get noPro => 'Brak Pro';

  @override
  String proStatusNoEnd(String source) {
    return 'Pro ($source), bez daty końcowej';
  }

  @override
  String proStatusUntil(String source, String date) {
    return 'Pro ($source), do $date';
  }

  @override
  String get lifetime => 'Dożywotnio';

  @override
  String get pickDate => 'Wybierz datę';

  @override
  String get noAccess => 'Brak dostępu';

  @override
  String get adminOnlyTeam => 'Zarządzanie jest tylko dla zespołu CamTrip.';

  @override
  String get adminOverview => 'Przegląd';

  @override
  String get adminUsers => 'Użytkownicy';

  @override
  String get adminReports => 'Zgłoszenia';

  @override
  String adminsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count admina',
      many: '$count adminów',
      few: '$count adminów',
      one: '1 admin',
    );
    return '$_temp0';
  }

  @override
  String get adminNewThisWeek => 'Nowi w tym tygodniu';

  @override
  String get adminGroups => 'Grupy';

  @override
  String get adminProSubscription => 'Pro z subskrypcji';

  @override
  String get adminProGift => 'Pro w prezencie';

  @override
  String adminWithoutSubscription(int count) {
    return '$count bez subskrypcji';
  }

  @override
  String get adminOpenReports => 'Otwarte zgłoszenia';

  @override
  String get adminSearchHint => 'Szukaj po imieniu lub e-mailu';

  @override
  String get nobodyFound => 'Nikogo nie znaleziono';

  @override
  String get loadMore => 'Wczytaj więcej';

  @override
  String get noEmail => 'Brak e-maila';

  @override
  String adminDeletePhotoMessage(String groupName) {
    return 'Zdjęcie zniknie dla wszystkich w „$groupName”. Wszystkie zgłoszenia tego zdjęcia zostaną zamknięte.';
  }

  @override
  String get adminBanMessage =>
      'To konto nie będzie mogło się logować ani korzystać z aplikacji. Możesz to później cofnąć.';

  @override
  String get adminDismissTitle => 'Odrzucić zgłoszenie?';

  @override
  String get adminDismissMessage =>
      'Zdjęcie zostaje. Zgłoszenie zostanie oznaczone jako załatwione.';

  @override
  String get adminDismiss => 'Odrzuć';

  @override
  String get adminAccountBlocked => 'Konto zablokowane';

  @override
  String get adminReportDismissed => 'Zgłoszenie odrzucone';

  @override
  String get adminNoReports => 'Brak otwartych zgłoszeń';

  @override
  String get adminNoReportsMessage => 'Tu pojawiają się zgłoszone zdjęcia.';

  @override
  String get deletedTag => 'Usunięte';

  @override
  String adminReportedBy(String name) {
    return 'Zgłasza: $name';
  }

  @override
  String adminPhotoBy(String name) {
    return 'Zdjęcie od: $name';
  }

  @override
  String reportsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count zgłoszenia',
      many: '$count zgłoszeń',
      few: '$count zgłoszenia',
      one: '1 zgłoszenie',
    );
    return '$_temp0';
  }

  @override
  String get adminDeletePhoto => 'Usuń zdjęcie';

  @override
  String get adminBlockCreator => 'Zablokuj autora';

  @override
  String get loadFailed => 'Nie udało się wczytać';

  @override
  String get adminLifetimeProGiven => 'Przyznano dożywotnie Pro';

  @override
  String get adminProGiven => 'Przyznano Pro';

  @override
  String adminGiveProUntil(String date) {
    return 'Przyznaj Pro do $date';
  }

  @override
  String get adminGiveProLifetime => 'Przyznaj Pro dożywotnio';

  @override
  String adminGiveProFor(String period) {
    return 'Przyznaj Pro na $period';
  }

  @override
  String get adminReasonHint => 'Powód, np. znajomy, tester, influencer';

  @override
  String get adminGivePro => 'Przyznaj Pro';

  @override
  String get adminRevokeTitle => 'Cofnąć prezent?';

  @override
  String get adminRevokeMessage =>
      'Podarowane Pro kończy się od razu. Własna subskrypcja działa dalej.';

  @override
  String get adminRevoke => 'Cofnij';

  @override
  String get adminGiftRevoked => 'Prezent cofnięty';

  @override
  String get adminUnbanTitle => 'Zdjąć blokadę?';

  @override
  String adminUnbanMessage(String name) {
    return '$name znów będzie mógł się logować.';
  }

  @override
  String get adminUnbanned => 'Blokada zdjęta';

  @override
  String get adminBanUserMessage =>
      'To konto nie będzie mogło się logować ani korzystać z aplikacji. Zdjęcia zostają.';

  @override
  String get adminUser => 'Użytkownik';

  @override
  String get adminNotVerified => 'niepotwierdzony';

  @override
  String get adminRole => 'Rola';

  @override
  String get adminCreated => 'Utworzono';

  @override
  String get unknown => 'Nieznane';

  @override
  String get adminSignInWith => 'Logowanie przez';

  @override
  String get adminEmailMethod => 'E-mail';

  @override
  String get adminPhotosAndVideos => 'Zdjęcia i filmy';

  @override
  String get adminStatus => 'Status';

  @override
  String get adminActive => 'Aktywna';

  @override
  String adminActiveUntil(String date) {
    return 'Aktywna do $date';
  }

  @override
  String adminGiftFrom(String name) {
    return 'Prezent od: $name';
  }

  @override
  String adminExpiredOn(String date) {
    return 'Wygasło $date';
  }

  @override
  String get adminExpired => 'Wygasło';

  @override
  String adminUntil(String date) {
    return 'Do $date';
  }

  @override
  String get adminGiveProTitle => 'Przyznaj Pro';

  @override
  String get adminGiveProNote =>
      'Działa też w grupach tej osoby: jedno Pro w grupie = Pro dla całej grupy.';

  @override
  String get adminRevokeGift => 'Cofnij prezent';

  @override
  String get adminModeration => 'Moderacja';

  @override
  String get adminCannotBanSelf => 'Nie możesz zablokować samego siebie.';

  @override
  String get adminCannotBanAdmin => 'Admina nie można zablokować.';

  @override
  String get adminUnban => 'Zdejmij blokadę';

  @override
  String get adminBanAccount => 'Zablokuj konto';

  @override
  String get googleSignInUnavailable =>
      'Logowanie przez Google nie jest jeszcze dostępne';

  @override
  String get cameraPickerTitle => 'Wybierz aparat';

  @override
  String get cameraPickerSubtitle =>
      'Każdy aparat nadaje twoim zdjęciom własny styl';

  @override
  String get cameraPickerChange => 'Zmień aparat';

  @override
  String get cameraPickerUnlock => 'Odblokuj z Pro';

  @override
  String get cameraPickerSelected => 'Wybrany';

  @override
  String get cameraPickerStyleSummer => 'Lato';

  @override
  String get cameraPickerStyleSummerDescription =>
      'Ciepłe, wyblakłe kolory zdjęcia z lat 90.';

  @override
  String get cameraPickerStyleNight => 'Noc 800';

  @override
  String get cameraPickerStyleNightDescription =>
      'Taśma kinowa: turkusowe cienie, ciepłe światło, dużo ziarna';

  @override
  String get cameraPickerStyleSepia => 'Sepia';

  @override
  String get cameraPickerStyleSepiaDescription =>
      'Stara brązowa odbitka z pudełka po butach';

  @override
  String get cameraPickerStyleLomo => 'Lomo';

  @override
  String get cameraPickerStyleLomoDescription =>
      'Mocne kolory, ciemne rogi i szalony odcień';

  @override
  String get cameraPickerStyleMint => 'Mięta';

  @override
  String get cameraPickerStyleMintDescription =>
      'Miękko i świeżo z zielonym odcieniem';

  @override
  String get cameraPickerStylePastel => 'Róż';

  @override
  String get cameraPickerStylePastelDescription =>
      'Pastelowe kolory z różową poświatą i białą ramką';

  @override
  String get cameraPickerStyleSuper8 => 'Super 8';

  @override
  String get cameraPickerStyleSuper8Description =>
      'Ziarniste i miękkie jak stary domowy film';

  @override
  String get paywallBenefitGroup => 'Jedno Pro = Pro dla całej grupy';

  @override
  String get paywallBenefitUnlimited =>
      'Bez limitu członków, zdjęcia na zawsze';

  @override
  String get paywallBenefitQuality => 'Bez znaku wodnego, oryginalna jakość';

  @override
  String paywallFreeTrial(String period) {
    return '$period za darmo';
  }

  @override
  String paywallPriceYear(String price) {
    return '$price rocznie.';
  }

  @override
  String paywallPriceYearTrial(String period, String price) {
    return '$period za darmo, potem $price rocznie.';
  }

  @override
  String paywallPriceMonth(String price) {
    return '$price miesięcznie.';
  }

  @override
  String paywallPriceMonthTrial(String period, String price) {
    return '$period za darmo, potem $price miesięcznie.';
  }

  @override
  String paywallAutoRenew(String store) {
    return 'Odnawia się automatycznie. Anuluj co najmniej 24 godziny przed odnowieniem w $store.';
  }

  @override
  String get paywallDetailsTitle => 'Wszystko w Pro';

  @override
  String get paywallBenefitStyles => 'Wszystkie style aparatu';

  @override
  String get allPhotosTitle => 'Wszystkie zdjęcia';

  @override
  String get allPhotosSubtitle => 'Wszystko, co zrobiłeś sam, z każdego albumu';

  @override
  String get allPhotosEmptyTitle => 'Jeszcze nie ma zdjęć';

  @override
  String get allPhotosEmptyMessage => 'Otwórz aparat i zrób pierwsze zdjęcie.';

  @override
  String get allPhotosOpenCamera => 'Otwórz aparat';

  @override
  String get allPhotosChooseAlbum => 'Wybierz album';

  @override
  String get allPhotosLoadFailed => 'Nie udało się wczytać twoich zdjęć';

  @override
  String get cameraSettingsTitle => 'Ustawienia aparatu';

  @override
  String get cameraSettingsMore => 'Więcej ustawień';

  @override
  String get cameraSettingsGrid => 'Siatka';

  @override
  String get cameraSettingsHaptics => 'Wibracja przy zdjęciu';

  @override
  String get cameraSettingsDateStamp => 'Data w prawym dolnym rogu';

  @override
  String get cameraSettingsSound => 'Dźwięk migawki';

  @override
  String get cameraSettingsSoundHint => 'Cicho, gdy telefon jest wyciszony';

  @override
  String get cameraSettingsTimer => 'Samowyzwalacz';

  @override
  String get cameraSettingsTimerOff => 'Wył.';

  @override
  String cameraSettingsTimerSeconds(int seconds) {
    return '$seconds s';
  }

  @override
  String get cameraSettingsTimerCancelHint => 'Stuknij spust, aby anulować';

  @override
  String get cameraSettingsMirror => 'Lustrzane selfie';

  @override
  String get cameraSettingsSaveToRoll => 'Zapisz w rolce aparatu';

  @override
  String get cameraSettingsQuality => 'Jakość';

  @override
  String get cameraSettingsQualityStandard => 'Standardowa';

  @override
  String get cameraSettingsQualityHigh => 'Wysoka';

  @override
  String get cameraLowLightHint => 'Mało światła - włącz lampę błyskową';

  @override
  String get cameraFlashUnavailable => 'Ten aparat nie ma lampy błyskowej';

  @override
  String get cameraFlashScreen => 'Błysk ekranu';

  @override
  String get cameraFlashCycleHint =>
      'Stuknij, aby przełączać: wył., wł. i auto';

  @override
  String cameraPickerPaywallStyles(int count, String styles) {
    return 'Wszystkie aparaty ($count), w tym $styles';
  }

  @override
  String get styleFlash => 'Flesz 400';

  @override
  String get styleFlashDescription =>
      'Bezpośredni flesz na ciepłym filmie: bursztynowy blask, ziarno, soczyste czerwienie';
}
