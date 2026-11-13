// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get cancel => 'Mégse';

  @override
  String get yes => 'Igen';

  @override
  String inviteMessageIntro(String groupName) {
    return 'Csatlakozol a(z) „$groupName” csoporthoz a CamTripen? Akkor rögtön látjuk egymás fotóit.';
  }

  @override
  String inviteMessageCode(String code) {
    return 'Vagy írd be a kódot: $code';
  }

  @override
  String get memberFallbackName => 'Barát';

  @override
  String get reportReasonInappropriate => 'Nem helyénvaló vagy sértő';

  @override
  String get reportReasonSpam => 'Spam';

  @override
  String get reportReasonOther => 'Valami más';

  @override
  String dateRangeSameMonth(
    String startDay,
    String endDay,
    String month,
    String monthNum,
    String endDate,
  ) {
    return '$month $startDay-$endDay.';
  }

  @override
  String get errorOffline => 'Nincs kapcsolat. Próbáld újra egy kicsit később.';

  @override
  String errorSomethingWrongStatus(int status) {
    return 'Valami hiba történt ($status)';
  }

  @override
  String get errorSomethingWrong => 'Valami hiba történt';

  @override
  String get apiInvalidCredentials => 'Hibás e-mail-cím vagy jelszó';

  @override
  String get apiInvalidCode => 'A kód hibás vagy lejárt. Kérj új kódot.';

  @override
  String get apiEmailTaken =>
      'Ezzel az e-mail-címmel már van fiók. Jelentkezz be, vagy válaszd az „Elfelejtetted a jelszót?” lehetőséget.';

  @override
  String apiEmailTakenProvider(String provider) {
    return 'Ezzel az e-mail-címmel már van fiók. Jelentkezz be ezzel: $provider.';
  }

  @override
  String apiWeakPassword(int min) {
    return 'Válassz legalább $min karakteres jelszót';
  }

  @override
  String apiNameTooLong(int max) {
    return 'A neved legfeljebb $max karakter lehet';
  }

  @override
  String get apiRateLimited =>
      'Túl sok próbálkozás. Próbáld újra 15 perc múlva.';

  @override
  String apiAccountBanned(String email) {
    return 'A fiókodat letiltottuk. Írj a(z) $email címre, ha szerinted ez tévedés.';
  }

  @override
  String get apiProRequired => 'Ez a kamerastílus a CamTrip Pro része';

  @override
  String get apiGroupClosed => 'Ezt a csoportot lezárták';

  @override
  String get apiGroupCodeNotFound => 'Nincs csoport ezzel a kóddal';

  @override
  String apiGroupFull(int max) {
    return 'A csoport megtelt (max. $max tag). Ha egy tagnak van CamTrip Pro-ja, bárki csatlakozhat.';
  }

  @override
  String get apiLastMember =>
      'Te vagy az utolsó tag. Inkább töröld a csoportot.';

  @override
  String get apiAdminRequired => 'Csak CamTrip-adminisztrátoroknak';

  @override
  String get apiUploadIncomplete => 'A feltöltés nem teljes';

  @override
  String get apiInvalidInput => 'Érvénytelen adat';

  @override
  String get apiNotSignedIn => 'Nem vagy bejelentkezve';

  @override
  String get apiAccountGone => 'Ez a fiók már nem létezik';

  @override
  String get apiPhotoNotFound => 'A fotó nem található';

  @override
  String get apiGroupNotFound => 'A csoport nem található';

  @override
  String get apiMemberNotFound => 'A tag nem található';

  @override
  String get apiPersonNotFound => 'A személy nem található';

  @override
  String get apiUserNotFound => 'A felhasználó nem található';

  @override
  String get apiAdminOnly => 'Ezt csak admin teheti meg';

  @override
  String get apiCannotBlockSelf => 'Saját magadat nem tilthatod le';

  @override
  String get apiCannotReportOwn => 'A saját fotódat nem jelentheted';

  @override
  String get apiDeleteOwnOnly => 'Csak a saját fotóidat törölheted';

  @override
  String get apiOwnerCannotBeRemoved =>
      'A csoport létrehozója nem távolítható el';

  @override
  String get apiOwnerStaysAdmin => 'A létrehozó mindig admin marad';

  @override
  String get apiNeedsOneAdmin => 'Egy csoportnak legalább egy admin kell';

  @override
  String get apiEndBeforeStart => 'A záró dátum a kezdő dátum előtt van';

  @override
  String get apiPermanentNoEndDate =>
      'Egy mindig nyitott csoportnak nincs záró dátuma';

  @override
  String get apiCannotBanAdmin => 'Adminisztrátor nem tiltható le';

  @override
  String get apiReportNotFound => 'A bejelentés nem található';

  @override
  String get apiPhotoOwnerUnknown => 'A fotó készítője már nem ismert';

  @override
  String get validationNameRequired => 'Írd be a neved';

  @override
  String validationMaxChars(int max) {
    return 'Legfeljebb $max karakter';
  }

  @override
  String get validationEmailRequired => 'Írd be az e-mail-címed';

  @override
  String get validationEmailInvalid => 'Ez az e-mail-cím nem érvényes';

  @override
  String get validationPasswordRequired => 'Válassz jelszót';

  @override
  String validationMinChars(int min) {
    return 'Legalább $min karakter';
  }

  @override
  String get validationPasswordTooLong => 'Ez a jelszó túl hosszú';

  @override
  String get validationPasswordEmpty => 'Írd be a jelszavad';

  @override
  String get validationCodeRequired => 'Írd be az e-mailben kapott kódot';

  @override
  String get validationCodeDigits => 'A kód 6 számjegyből áll';

  @override
  String get onboarding1Title => 'Egy film\naz egész csapatnak.';

  @override
  String get onboarding1Body =>
      'Fotózz retro kamerával. Mindenki azonnal látja a fotóidat, és rögtön a saját albumodban is ott vannak.';

  @override
  String get onboarding2Title => 'Vége a\nfotóküldözgetésnek.';

  @override
  String get onboarding2Body =>
      'Hozz létre egy csoportot, oszd meg a kódot, kész. Soha többé „átküldöd azokat a fotókat?”';

  @override
  String get onboarding3Title => 'Összefoglaló videó\nutána.';

  @override
  String get onboarding3Body =>
      'A CamTrip zenés videót készít a legjobb közös pillanataitokból.';

  @override
  String get onboardingInvited => 'Meghívtak! Jelentkezz be a csatlakozáshoz.';

  @override
  String get signInAppleFailed => 'Nem sikerült bejelentkezni az Apple-lel';

  @override
  String get signInGoogleFailed => 'Nem sikerült bejelentkezni a Google-lel';

  @override
  String get signInFailed => 'Nem sikerült bejelentkezni';

  @override
  String get next => 'Tovább';

  @override
  String get legalPrefix => 'A folytatással elfogadod a';

  @override
  String get legalTerms => 'feltételeket';

  @override
  String get legalAnd => ' és az';

  @override
  String get legalPrivacy => 'adatvédelmi irányelveket';

  @override
  String get legalSuffix => '.';

  @override
  String get continueWithApple => 'Folytatás Apple-lel';

  @override
  String get continueWithGoogle => 'Folytatás Google-lel';

  @override
  String get createAccount => 'Fiók létrehozása';

  @override
  String get signIn => 'Bejelentkezés';

  @override
  String get or => 'vagy';

  @override
  String get registerSubtitle =>
      'Hogy a barátaid lássák, ki készítette a fotókat.';

  @override
  String get loginSubtitle => 'Jó újra látni.';

  @override
  String get forgotPasswordTitle => 'Elfelejtett jelszó';

  @override
  String get forgotPasswordPushSubtitle =>
      'Valahol még be vagy jelentkezve? Oda küldünk egy 6 jegyű kódot push-értesítésben, hogy új jelszót állíthass be.';

  @override
  String get newPassword => 'Új jelszó';

  @override
  String get resetPushInfo =>
      'Ha valahol még be vagy jelentkezve, ott kapsz egy push-értesítést egy kóddal. Nem tudsz belépni? Jelentkezz be Apple-lel vagy Google-lel ugyanazzal az e-mail-címmel - a fiókod össze lesz kapcsolva.';

  @override
  String get sendCode => 'Kód küldése';

  @override
  String get savePassword => 'Jelszó mentése';

  @override
  String get errorTryAgain => 'Valami hiba történt. Próbáld újra.';

  @override
  String get back => 'Vissza';

  @override
  String get name => 'Név';

  @override
  String get email => 'E-mail-cím';

  @override
  String get codeFromPush => 'Az értesítésben kapott kód';

  @override
  String get password => 'Jelszó';

  @override
  String get hidePassword => 'Jelszó elrejtése';

  @override
  String get showPassword => 'Jelszó megjelenítése';

  @override
  String get forgotPasswordLink => 'Elfelejtetted a jelszót?';

  @override
  String get haveAccount => 'Már van fiókod?';

  @override
  String get newToCamTrip => 'Új vagy a CamTripen?';

  @override
  String get rememberedIt => 'Eszedbe jutott?';

  @override
  String get noCodeReceived => 'Nem kaptál kódot?';

  @override
  String get resendCode => 'Újraküldés';

  @override
  String onboardingDemoRoll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotós, 1 film',
      one: '1 fotós, 1 film',
    );
    return '$_temp0';
  }

  @override
  String membersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tag',
      one: '1 tag',
    );
    return '$_temp0';
  }

  @override
  String photosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotó',
      one: '1 fotó',
    );
    return '$_temp0';
  }

  @override
  String videosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count videó',
      one: '1 videó',
    );
    return '$_temp0';
  }

  @override
  String get justNow => 'most';

  @override
  String get badgeNew => 'Új';

  @override
  String recapTitle(String groupName) {
    return 'Összefoglaló: $groupName';
  }

  @override
  String get styleFilm => 'Film';

  @override
  String get styleInstant => 'Instant';

  @override
  String get styleDisposable => 'Eldobható';

  @override
  String get styleBw => 'FF';

  @override
  String get styleGolden => 'Golden';

  @override
  String get styleChrome => 'Chrome';

  @override
  String get styleFilmDescription =>
      'Meleg színek, szemcse és narancssárga dátum';

  @override
  String get styleInstantDescription => 'Lágy színek és fehér keret';

  @override
  String get styleDisposableDescription =>
      'Erős vaku, vignetta és fényszivárgás';

  @override
  String get styleBwDescription => 'Szemcsés fekete-fehér, mély kontraszttal';

  @override
  String get styleGoldenDescription => 'Mindig aranyóra, lágy arany ragyogás';

  @override
  String get styleChromeDescription =>
      'Hideg, telített és éles, mint a diafilm';

  @override
  String get shutterStopRecording => 'Felvétel leállítása';

  @override
  String get shutterStartRecording => 'Videofelvétel indítása';

  @override
  String get shutterTakePhoto => 'Fotó készítése';

  @override
  String get modePhoto => 'Fotó';

  @override
  String get modeVideo => 'Videó';

  @override
  String get cameraNotFound => 'Nem található kamera';

  @override
  String get cameraAccessNeeded =>
      'A CamTripnek hozzáférés kell a kamerádhoz. Kapcsold be a Beállításokban.';

  @override
  String get cameraStartFailed => 'A kamera nem tudott elindulni';

  @override
  String get albumAccessNeeded =>
      'Adj hozzáférést a CamTripnek a fotóidhoz, hogy az albumodba is mentse őket';

  @override
  String get albumSaveFailed =>
      'Nem sikerült menteni az albumba. A fotó azért meg lett osztva.';

  @override
  String styleProFallback(String style) {
    return 'Ez a stílus a Pro része. Ebben a csoportban ezzel fotózol: $style.';
  }

  @override
  String get photoFailed => 'Nem sikerült a fotó. Próbáld újra.';

  @override
  String get recordingFailed => 'Nem sikerült a videofelvétel';

  @override
  String get videoFailed => 'Nem sikerült elkészíteni a videót. Próbáld újra.';

  @override
  String get shootInGroup => 'Fotózás a csoportba';

  @override
  String get close => 'Bezárás';

  @override
  String get flash => 'Vaku';

  @override
  String get flashOn => 'Be';

  @override
  String get flashOff => 'Ki';

  @override
  String get flashAuto => 'Auto';

  @override
  String get chooseGroup => 'Csoport kiválasztása';

  @override
  String get switchCamera => 'Kameraváltás';

  @override
  String get createOrJoinFirst =>
      'Előbb hozz létre egy csoportot, vagy csatlakozz egyhez';

  @override
  String get proViaGroup => 'Pro a csoporton keresztül';

  @override
  String proViaName(String name) {
    return 'Pro tőle: $name';
  }

  @override
  String get proStylesFreeViaMember =>
      'Ebben a csoportban a Pro stílusok ingyenesek neked egy Pro tagnak köszönhetően';

  @override
  String proStylesFreeViaName(String name) {
    return 'Pro stílusok ebben a csoportban: ingyen neked, köszönhetően neki: $name';
  }

  @override
  String get subscriptionsUnavailable =>
      'Az előfizetések most nem érhetők el. Próbáld újra később.';

  @override
  String get paymentPending =>
      'A fizetésed még feldolgozás alatt van. A Pro bekapcsol, amint kész.';

  @override
  String get purchaseFailed => 'A vásárlás nem sikerült. Próbáld újra később.';

  @override
  String get restoreUnavailable =>
      'A vásárlások visszaállítása most nem lehetséges. Próbáld újra később.';

  @override
  String get restoreFailed =>
      'A visszaállítás nem sikerült. Próbáld újra később.';

  @override
  String get welcomePro => 'Üdv a CamTrip Pro-ban! 🎉';

  @override
  String get proRestored => 'A Pro visszaállítva';

  @override
  String get noPurchaseFound => 'Nem található korábbi vásárlás';

  @override
  String periodDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nap',
      one: '1 nap',
    );
    return '$_temp0';
  }

  @override
  String periodWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hét',
      one: '1 hét',
    );
    return '$_temp0';
  }

  @override
  String periodMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hónap',
      one: '1 hónap',
    );
    return '$_temp0';
  }

  @override
  String periodYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count év',
      one: '1 év',
    );
    return '$_temp0';
  }

  @override
  String get paywallHavePro => 'Van CamTrip Pro-d';

  @override
  String get paywallSubtitle => 'Minden a következő utadhoz.';

  @override
  String paywallFeatureStyles(String styles) {
    return 'Az összes kamerastílus ($styles)';
  }

  @override
  String get paywallFeatureUnlimited =>
      'Korlátlan tag és tárhely, a fotók örökre megmaradnak';

  @override
  String get paywallFeatureNoWatermark => 'Összefoglalók vízjel nélkül';

  @override
  String get paywallFeatureOriginal => 'Letöltés eredeti minőségben';

  @override
  String get planYear => 'Év';

  @override
  String get planMonth => 'Hónap';

  @override
  String pricePerMonth(String price) {
    return '$price havonta';
  }

  @override
  String paywallSaveBadge(int percent) {
    return '$percent% MEGTAKARÍTÁS';
  }

  @override
  String get planMonthCancelAnytime => 'bármikor lemondható';

  @override
  String tryFree(String period) {
    return 'Próbáld ki $period ingyen';
  }

  @override
  String get becomePro => 'Pro-t kérek';

  @override
  String get subscriptionsLoadFailed =>
      'Nem sikerült betölteni az előfizetéseket. Ellenőrizd a kapcsolatot.';

  @override
  String legalAnnual(String price) {
    return 'CamTrip Pro éves előfizetés: $price évente.';
  }

  @override
  String legalAnnualTrial(String period, String price) {
    return 'CamTrip Pro éves előfizetés: $period ingyen, utána $price évente.';
  }

  @override
  String legalMonthly(String price) {
    return 'CamTrip Pro havi előfizetés: $price havonta.';
  }

  @override
  String legalMonthlyTrial(String period, String price) {
    return 'CamTrip Pro havi előfizetés: $period ingyen, utána $price havonta.';
  }

  @override
  String get legalBillingApple =>
      'A díjat az Apple ID-dra terheljük. Az előfizetés automatikusan megújul, hacsak nem mondod le legalább 24 órával az időszak vége előtt. Lemondani és kezelni az App Store fiókbeállításaiban tudod.';

  @override
  String get legalBillingGoogle =>
      'A díjat a Google-fiókodra terheljük. Az előfizetés automatikusan megújul, hacsak nem mondod le legalább 24 órával az időszak vége előtt. Lemondani és kezelni a Google Play fiókbeállításaiban tudod.';

  @override
  String get restorePurchases => 'Vásárlások visszaállítása';

  @override
  String get terms => 'Feltételek';

  @override
  String get privacy => 'Adatvédelem';

  @override
  String get groupProTitle =>
      'Egy Pro a csoportban = Pro mindenkinek abban a csoportban';

  @override
  String get groupProBody =>
      'Ha egy embernek van Pro-ja, az egész csoport megkapja az összes kamerastílust, a korlátlan tagot, a megmaradó fotókat, az eredeti minőséget és a vízjel nélküli összefoglalókat.';

  @override
  String get groupCreated => 'Csoport létrehozva ✓';

  @override
  String get inviteFriends => 'Hívd meg a barátaidat';

  @override
  String get codeCopied => 'Kód kimásolva';

  @override
  String get shareLink => 'Link megosztása';

  @override
  String inviteSubject(String groupName) {
    return 'Csatlakozz: $groupName a CamTripen';
  }

  @override
  String inviteMembersUnlimited(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tag',
      one: '1 tag',
    );
    return '$_temp0 · korlátlan (Pro)';
  }

  @override
  String inviteMembersLimit(int count, int limit) {
    return '$count/$limit tag · Pro: korlátlan';
  }

  @override
  String get toCamera => 'Irány a kamera';

  @override
  String get done => 'Kész';

  @override
  String get joinEnterCode => 'Írd be a 6 karakteres kódot';

  @override
  String get joinGroupTitle => 'Csatlakozás csoporthoz';

  @override
  String get joinGroupSubtitle =>
      'Írd be a barátaid kódját, vagy olvasd be a QR-kódjukat.';

  @override
  String get typeCode => 'Kód beírása';

  @override
  String get scanQr => 'QR beolvasása';

  @override
  String get join => 'Csatlakozás';

  @override
  String get groupNameRequired => 'Adj nevet a csoportnak';

  @override
  String get newGroup => 'Új csoport';

  @override
  String get groupType => 'Csoport típusa';

  @override
  String get groupTypeVacation => 'Nyaralás';

  @override
  String get groupTypeVacationDescription =>
      'Kezdő és záró dátummal, utána archiválva';

  @override
  String get groupTypeEvent => 'Esemény';

  @override
  String get groupTypeEventDescription => 'Egy nap vagy este, pl. egy buli';

  @override
  String get groupTypePermanent => 'Mindig nyitott';

  @override
  String get groupTypePermanentDescription => 'Az állandó baráti társaságodnak';

  @override
  String get date => 'Dátum';

  @override
  String get departure => 'Indulás';

  @override
  String get returnDate => 'Hazaút';

  @override
  String get defaultCameraStyle => 'Alapértelmezett kamerastílus';

  @override
  String freeLimitPermanent(int max) {
    return 'Ingyen: legfeljebb $max tag. Pro-val korlátlan.';
  }

  @override
  String freeLimitDated(int max, int days) {
    return 'Ingyen: legfeljebb $max tag, a fotók a záró dátum után $days napig maradnak meg. Pro-val korlátlanul és örökre.';
  }

  @override
  String get createGroup => 'Csoport létrehozása';

  @override
  String get group => 'Csoport';

  @override
  String groupCode(String code) {
    return 'kód: $code';
  }

  @override
  String get manage => 'Kezelés';

  @override
  String get rename => 'Átnevezés';

  @override
  String get changeDates => 'Dátumok módosítása';

  @override
  String get finishTrip => 'Út lezárása';

  @override
  String get finishTripSubtitle => 'A záró dátum a mai nap lesz';

  @override
  String get reopenGroup => 'Csoport újranyitása';

  @override
  String get closeGroup => 'Csoport lezárása';

  @override
  String get reopenGroupSubtitle => 'A tagok újra adhatnak hozzá fotókat';

  @override
  String get closeGroupSubtitle =>
      'Senki sem adhat hozzá több fotót; minden továbbra is megnézhető';

  @override
  String get members => 'Tagok';

  @override
  String memberYou(String name) {
    return '$name (te)';
  }

  @override
  String get blockedTag => 'letiltva';

  @override
  String get adminTag => 'admin';

  @override
  String removeMemberTitle(String name) {
    return 'Eltávolítod: $name?';
  }

  @override
  String get removeMemberMessage => 'A fotói a csoportban maradnak.';

  @override
  String get remove => 'Törlés';

  @override
  String get removeMember => 'Eltávolítás';

  @override
  String blockTitle(String name) {
    return 'Letiltod: $name?';
  }

  @override
  String blockMessage(String name) {
    return 'Többé nem látod $name fotóit és videóit, és nem kapsz róluk értesítést. Ezt a Beállításokban visszavonhatod.';
  }

  @override
  String get block => 'Letiltás';

  @override
  String get makeMember => 'Legyen sima tag';

  @override
  String get makeAdmin => 'Legyen admin';

  @override
  String get removeFromGroup => 'Eltávolítás a csoportból';

  @override
  String get unblock => 'Tiltás feloldása';

  @override
  String get inviteFriendsButton => 'Barátok meghívása';

  @override
  String get you => 'Te';

  @override
  String get unarchive => 'Visszaállítás az archívumból';

  @override
  String get archive => 'Archiválás';

  @override
  String get unarchiveSubtitle => 'A csoport újra az albumaid között van';

  @override
  String archiveSubtitle(String section) {
    return 'Csak neked: a csoport az albumaid alján lévő „$section” részbe kerül';
  }

  @override
  String get archivedSection => 'Archivált';

  @override
  String get hiddenPhotos => 'Rejtett fotók';

  @override
  String get hiddenPhotosSubtitle => 'Fotók, amelyeket magad elől elrejtettél';

  @override
  String get leaveGroup => 'Kilépés a csoportból';

  @override
  String get leaveGroupSubtitle =>
      'A fotóid a többieknek a csoportban maradnak';

  @override
  String get deleteGroup => 'Csoport törlése';

  @override
  String get deleteGroupSubtitle => 'Minden fotó mindenkinél törlődik';

  @override
  String groupArchived(String groupName) {
    return '„$groupName” archiválva';
  }

  @override
  String groupUnarchived(String groupName) {
    return '„$groupName” újra az albumaid között';
  }

  @override
  String get undo => 'Visszavonás';

  @override
  String get groupNameTitle => 'Csoport neve';

  @override
  String get finishTripTitle => 'Lezárod az utat?';

  @override
  String get finishTripMessage =>
      'A záró dátum a mai nap lesz. Továbbra is adhatsz hozzá fotókat; az összefoglaló kész.';

  @override
  String get finishTripConfirm => 'Lezárás';

  @override
  String get tripFinished => 'Az út lezárva';

  @override
  String leaveGroupTitle(String groupName) {
    return 'Kilépsz innen: „$groupName”?';
  }

  @override
  String get leaveGroupMessage =>
      'A fotóid a többieknek a csoportban maradnak. Később a kóddal újra csatlakozhatsz.';

  @override
  String get leave => 'Kilépés';

  @override
  String groupDeleted(String groupName) {
    return '„$groupName” törölve';
  }

  @override
  String get youAreAdmin => 'admin vagy';

  @override
  String get open => 'Megnyitás';

  @override
  String get archiveMenuSubtitle => 'Csak neked, a többiek nem veszik észre';

  @override
  String get deleteGroupMenuSubtitle => 'Mindenkinek, az összes fotóval';

  @override
  String get deleteGroupTitle => 'Törlöd a csoportot?';

  @override
  String deleteGroupMessage(int count, String groupName, int memberCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Mind a(z) $count fotó és videó',
      one: '1 fotó vagy videó',
    );
    String _temp1 = intl.Intl.pluralLogic(
      memberCount,
      locale: localeName,
      other: 'mind a(z) $memberCount tag számára',
      one: '1 tag számára',
    );
    return '$_temp0 eltűnik innen: „$groupName”, $_temp1. Ez nem vonható vissza.';
  }

  @override
  String get deleteGroupOwnRoll => 'A saját galériád változatlan marad.';

  @override
  String get deleteGroupTypeName => 'A megerősítéshez írd be a csoport nevét:';

  @override
  String get deleteForEveryone => 'Törlés mindenkinél';

  @override
  String get save => 'Mentés';

  @override
  String get yourAlbums => 'Albumaid';

  @override
  String get uploadQueue => 'Feltöltési sor';

  @override
  String get noConnection => 'Nincs kapcsolat';

  @override
  String get albumsOfflineMessage =>
      'Az albumaid betöltődnek, amint újra online vagy. A kamera addig is működik.';

  @override
  String get retry => 'Újra';

  @override
  String get noAlbumsTitle => 'Még nincs album';

  @override
  String get noAlbumsMessage =>
      'Hozz létre egy csoportot a következő utadhoz, vagy csatlakozz egy barátodéhoz a kódjával.';

  @override
  String get haveCode => 'Van kódom';

  @override
  String get joinWithCode => 'Csatlakozás kóddal vagy QR-kóddal';

  @override
  String get camera => 'Kamera';

  @override
  String get restore => 'Visszaállítás';

  @override
  String get more => 'Továbbiak';

  @override
  String get newAlbum => 'Új';

  @override
  String get closedTag => 'lezárva';

  @override
  String get activeTag => 'aktív';

  @override
  String get uploadFailed => 'A feltöltés nem sikerült';

  @override
  String get queueNoSignal => 'Nincs térerő.';

  @override
  String get queueNoSignalMessage =>
      'A fotóid már az albumodban vannak, és megosztjuk őket, amint újra online vagy.';

  @override
  String get queueWaitingForWifi => 'Várakozás Wi-Fire.';

  @override
  String queueWifiOnlyOn(String setting) {
    return 'Be van kapcsolva ez: „$setting”.';
  }

  @override
  String get queueVideosWifiOnly => 'A videók csak Wi-Fin mennek.';

  @override
  String get queueAllShared => 'Minden megosztva ✓';

  @override
  String queuePending(String items) {
    return 'Még megosztásra vár: $items';
  }

  @override
  String queuePendingBoth(String photos, String videos) {
    return 'Még megosztásra vár: $photos és $videos';
  }

  @override
  String get retryUpload => 'Újra';

  @override
  String get removeFromQueue => 'Eltávolítás a sorból';

  @override
  String get queueStatusWifi => 'Wi-Fi';

  @override
  String get queueStatusWaiting => 'várakozik';

  @override
  String get videosWifiOnlyTitle => 'Videók csak Wi-Fin';

  @override
  String get videosWifiOnlySubtitle => 'Kíméli a mobiladatodat';

  @override
  String get retryNow => 'Újra most';

  @override
  String get yourName => 'A neved';

  @override
  String get settings => 'Beállítások';

  @override
  String get tapToChangeName => 'Koppints a név módosításához';

  @override
  String get getCamTripPro => 'CamTrip Pro beszerzése';

  @override
  String get photos => 'Fotók';

  @override
  String get saveOwnPhotos => 'Saját fotóim mentése csoportonként egy albumba';

  @override
  String get autoSaveOthers => 'Mások fotóinak automatikus mentése';

  @override
  String get wifiOnlyTitle => 'Feltöltés csak Wi-Fin';

  @override
  String get dateStamp => 'Dátumbélyeg';

  @override
  String get notifications => 'Értesítések';

  @override
  String get notifyNewPhotos => 'Új fotók (összesítve)';

  @override
  String get notifyRecapReady => 'Kész az összefoglaló';

  @override
  String get camTripTeam => 'CamTrip csapat';

  @override
  String get adminEntrySubtitle =>
      'Felhasználók, Pro adása, bejelentések és statisztikák';

  @override
  String get account => 'Fiók';

  @override
  String get manageSubscription => 'Előfizetés kezelése';

  @override
  String get blockedPeople => 'Letiltott személyek';

  @override
  String get nobody => 'Senki';

  @override
  String peopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count személy',
      one: '1 személy',
    );
    return '$_temp0';
  }

  @override
  String get privacyPolicy => 'Adatvédelmi irányelvek';

  @override
  String get contact => 'Kapcsolat';

  @override
  String get signOut => 'Kijelentkezés';

  @override
  String get deleteAccount => 'Fiók törlése';

  @override
  String get deleteAccountSubtitle => 'Törli a fiókodat és az összes fotódat';

  @override
  String get deleteAccountTitle => 'Törlöd a fiókot?';

  @override
  String get deleteAccountMessage =>
      'A fiókod és az összes fotód és videód törlődik, a csoportokból is. Az aktív előfizetést mondd le az App Store-ban vagy a Google Playen.';

  @override
  String get blockedTitle => 'Letiltva';

  @override
  String get blockedSubtitle => 'Nem látod ezeknek az embereknek a fotóit.';

  @override
  String get blockedNone => 'Még senkit sem tiltottál le.';

  @override
  String get unblockShort => 'Feloldás';

  @override
  String get groupGone =>
      'Ez a csoport már nem létezik, vagy már nem vagy tagja.';

  @override
  String photosSavedToAlbum(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotó mentve ide: „$album”',
      one: '1 fotó mentve ide: „$album”',
    );
    return '$_temp0';
  }

  @override
  String photosDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotó törölve',
      one: '1 fotó törölve',
    );
    return '$_temp0';
  }

  @override
  String photosDeletedSkipped(int count, int skipped) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotó törölve',
      one: '1 fotó törölve',
    );
    return '$_temp0, $skipped kihagyva';
  }

  @override
  String photosHiddenForYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotó elrejtve előled',
      one: '1 fotó elrejtve előled',
    );
    return '$_temp0';
  }

  @override
  String get addedToFavorites => 'Hozzáadva a kedvencekhez';

  @override
  String get removedFromFavorites => 'Eltávolítva a kedvencekből';

  @override
  String get photoAccessSettings =>
      'Adj hozzáférést a CamTripnek a fotóidhoz a Beállításokban';

  @override
  String photosBeingAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotó hozzáadása folyamatban',
      one: '1 fotó hozzáadása folyamatban',
    );
    return '$_temp0';
  }

  @override
  String photosUnreadable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotót nem sikerült beolvasni',
      one: '1 fotót nem sikerült beolvasni',
    );
    return '$_temp0';
  }

  @override
  String get groupNotLoaded => 'A csoport nincs betöltve';

  @override
  String get noFavoritesTitle => 'Még nincs kedvenc';

  @override
  String get noPhotosTitle => 'Még nincs fotó';

  @override
  String get noFavoritesMessage =>
      'Koppints a csillagra egy fotón, hogy ide kerüljön.';

  @override
  String get noPhotosMessage =>
      'Készítsd el az első fotót. A csoportban mindenki azonnal látja.';

  @override
  String get openCamera => 'Kamera megnyitása';

  @override
  String savingProgress(int done, int total) {
    return 'Mentés... $done/$total';
  }

  @override
  String get sharePreparing => 'Előkészítés...';

  @override
  String sharingProgress(int done, int total) {
    return 'Előkészítés... $done/$total';
  }

  @override
  String get choosePhotos => 'Fotók kiválasztása';

  @override
  String selectedCount(int count) {
    return '$count kiválasztva';
  }

  @override
  String get selectNone => 'Kijelölés törlése';

  @override
  String get selectAll => 'Összes kijelölése';

  @override
  String photosWaitingToShare(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotó megosztásra vár',
      one: '1 fotó megosztásra vár',
    );
    return '$_temp0';
  }

  @override
  String get recapReadyTitle => 'Kész az összefoglalód';

  @override
  String get recapReadySubtitle => 'Zenés videó az utadról';

  @override
  String get watch => 'Megnézem';

  @override
  String get makeRecapNow => 'Összefoglaló videó készítése most';

  @override
  String freeGroupDeleteNotice(String date) {
    return 'Ingyenes csoport: a fotók eddig maradnak meg: $date. Mentsd el őket, vagy válts Pro-ra.';
  }

  @override
  String get filterAll => 'Összes';

  @override
  String get filterFavorites => 'Kedvencek';

  @override
  String get filterPerPerson => 'Személyenként';

  @override
  String get filterPerson => 'Személy';

  @override
  String get select => 'Kijelölés';

  @override
  String get hiddenFilter => 'Rejtett';

  @override
  String get photosBy => 'Fotók tőle...';

  @override
  String get uploadedTag => 'feltöltve';

  @override
  String get saveAll => 'Összes mentése';

  @override
  String get favorite => 'Kedvenc';

  @override
  String get unfavorite => 'Nem kedvenc';

  @override
  String get hide => 'Elrejtés';

  @override
  String get delete => 'Törlés';

  @override
  String deletePhotosTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Törölsz $count fotót?',
      one: 'Törlöd a fotót?',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'A csoportban mindenkinél eltűnnek. Ez nem vonható vissza.',
      one: 'A csoportban mindenkinél eltűnik. Ez nem vonható vissza.',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosNotAllowed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotó valaki másé. Megmaradnak; csak admin törölheti őket.',
      one: '1 fotó valaki másé. Megmarad; csak admin törölheti.',
    );
    return '$_temp0';
  }

  @override
  String photosBackInGroup(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotó újra a csoportban',
      one: '1 fotó újra a csoportban',
    );
    return '$_temp0';
  }

  @override
  String get showAll => 'Összes mutatása';

  @override
  String get hiddenPhotosExplainer =>
      'Ezeket a fotókat csak te nem látod. A csoport többi tagjának megvannak.';

  @override
  String get nothingHidden => 'Nincs semmi elrejtve';

  @override
  String get nothingHiddenMessage => 'Az elrejtett fotóid itt jelennek meg.';

  @override
  String showAgainCount(int count) {
    return 'Újra mutatás ($count)';
  }

  @override
  String get someone => 'Valaki';

  @override
  String get savedToAlbum => 'Mentve a fotóalbumodba';

  @override
  String get share => 'Megosztás';

  @override
  String get shareFailed => 'A megosztás nem sikerült';

  @override
  String get reportTitle => 'Miért jelented ezt a fotót?';

  @override
  String get reportSubtitle =>
      'Minden bejelentést 24 órán belül átnézünk. A fotót előled azonnal elrejtjük.';

  @override
  String get reportThanks => 'Köszönjük, utánanézünk';

  @override
  String blockMessageAllGroups(String name) {
    return 'Többé egyik csoportban sem látod $name fotóit és videóit, és nem kapsz róluk értesítést. Ezt a Beállításokban visszavonhatod.';
  }

  @override
  String userBlocked(String name) {
    return '$name letiltva';
  }

  @override
  String get videoHiddenForYou => 'A videó elrejtve előled';

  @override
  String get photoHiddenForYou => 'A fotó elrejtve előled';

  @override
  String get setAsCover => 'Beállítás borítóként';

  @override
  String get coverUpdated => 'Borítókép frissítve';

  @override
  String get hideForMe => 'Elrejtés előlem';

  @override
  String get hideForMeSubtitle => 'A csoport többi tagja továbbra is látja';

  @override
  String get reportPhoto => 'Fotó jelentése';

  @override
  String blockName(String name) {
    return '$name letiltása';
  }

  @override
  String get forEveryoneInGroup => 'Mindenkinek a csoportban';

  @override
  String get videoDeleted => 'Videó törölve';

  @override
  String get photoDeleted => 'Fotó törölve';

  @override
  String get photoAccessToSave =>
      'Adj hozzáférést a CamTripnek a fotóidhoz a Beállításokban a mentéshez';

  @override
  String get phoneFull => 'Megtelt a telefonod';

  @override
  String get albumSaveFailedShort => 'Nem sikerült menteni az albumba';

  @override
  String get recapTemplateGoldenHour => 'Golden Hour';

  @override
  String get recapTemplateFast => 'Gyors';

  @override
  String get recapTemplateFilmRoll => 'Filmtekercs';

  @override
  String get recapTemplatePolaroid => 'Polaroid';

  @override
  String get trackSummerEvening => 'Nyári este';

  @override
  String get trackGoldenHour => 'Golden Hour';

  @override
  String get trackRoadtrip => 'Road Trip';

  @override
  String get moodWarm => 'meleg';

  @override
  String get moodCheerful => 'vidám';

  @override
  String friendsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count barát',
      one: '1 barát',
    );
    return '$_temp0';
  }

  @override
  String get madeWithCamTrip => 'CamTrippel készült';

  @override
  String get tagline => 'Egy film az egész csapatnak';

  @override
  String get videoUnsupportedDevice =>
      'Ezen az eszközön nem sikerült elkészíteni a videót';

  @override
  String get groupLoadFailed => 'Nem sikerült betölteni ezt a csoportot.';

  @override
  String recapNeedsPhotos(int count) {
    return 'Az összefoglalóhoz legalább $count fotó kell.';
  }

  @override
  String get recapFailed =>
      'Nem sikerült elkészíteni az összefoglalót. Próbáld újra.';

  @override
  String get recapSaved => 'Az összefoglaló mentve a fotóalbumodba';

  @override
  String get recap => 'Összefoglaló';

  @override
  String get recapRendering => 'Összefoglaló készítése...';

  @override
  String get videoRendering => 'Videó készítése...';

  @override
  String get template => 'Sablon';

  @override
  String get musicLicense => 'A CamTrip saját zenéje · jogdíjmentes';

  @override
  String get change => 'Módosítás';

  @override
  String get noWatermark => 'Nincs vízjel ✓';

  @override
  String get removeWatermarkPro => 'Vízjel eltávolítása Pro-val';

  @override
  String get proSourceSubscription => 'Előfizetés';

  @override
  String get proSourceGift => 'Ajándék';

  @override
  String get proSourceAdmin => 'Admin';

  @override
  String get proSourceGroup => 'Csoporton át';

  @override
  String get noPro => 'Nincs Pro';

  @override
  String proStatusNoEnd(String source) {
    return 'Pro ($source), lejárat nélkül';
  }

  @override
  String proStatusUntil(String source, String date) {
    return 'Pro ($source), eddig: $date';
  }

  @override
  String get lifetime => 'Örökre';

  @override
  String get pickDate => 'Válassz dátumot';

  @override
  String get noAccess => 'Nincs hozzáférés';

  @override
  String get adminOnlyTeam => 'A kezelés csak a CamTrip csapatának szól.';

  @override
  String get adminOverview => 'Áttekintés';

  @override
  String get adminUsers => 'Felhasználók';

  @override
  String get adminReports => 'Bejelentések';

  @override
  String adminsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count admin',
      one: '1 admin',
    );
    return '$_temp0';
  }

  @override
  String get adminNewThisWeek => 'Új ezen a héten';

  @override
  String get adminGroups => 'Csoportok';

  @override
  String get adminProSubscription => 'Pro előfizetéssel';

  @override
  String get adminProGift => 'Pro ajándékba';

  @override
  String adminWithoutSubscription(int count) {
    return '$count előfizetés nélkül';
  }

  @override
  String get adminOpenReports => 'Nyitott bejelentések';

  @override
  String get adminSearchHint => 'Keresés név vagy e-mail alapján';

  @override
  String get nobodyFound => 'Nincs találat';

  @override
  String get loadMore => 'Továbbiak betöltése';

  @override
  String get noEmail => 'Nincs e-mail';

  @override
  String adminDeletePhotoMessage(String groupName) {
    return 'A fotó mindenkinél eltűnik itt: „$groupName”. A fotóval kapcsolatos összes bejelentés lezárul.';
  }

  @override
  String get adminBanMessage =>
      'Ez a fiók többé nem tud bejelentkezni és nem használhatja az appot. Ezt később visszavonhatod.';

  @override
  String get adminDismissTitle => 'Elutasítod a bejelentést?';

  @override
  String get adminDismissMessage =>
      'A fotó marad. A bejelentés lezártként lesz jelölve.';

  @override
  String get adminDismiss => 'Elutasítás';

  @override
  String get adminAccountBlocked => 'Fiók letiltva';

  @override
  String get adminReportDismissed => 'Bejelentés elutasítva';

  @override
  String get adminNoReports => 'Nincs nyitott bejelentés';

  @override
  String get adminNoReportsMessage => 'A bejelentett fotók itt jelennek meg.';

  @override
  String get deletedTag => 'Törölve';

  @override
  String adminReportedBy(String name) {
    return 'Bejelentő: $name';
  }

  @override
  String adminPhotoBy(String name) {
    return 'Fotó: $name';
  }

  @override
  String reportsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bejelentés',
      one: '1 bejelentés',
    );
    return '$_temp0';
  }

  @override
  String get adminDeletePhoto => 'Fotó törlése';

  @override
  String get adminBlockCreator => 'Készítő letiltása';

  @override
  String get loadFailed => 'A betöltés nem sikerült';

  @override
  String get adminLifetimeProGiven => 'Örökös Pro megadva';

  @override
  String get adminProGiven => 'Pro megadva';

  @override
  String adminGiveProUntil(String date) {
    return 'Pro eddig: $date';
  }

  @override
  String get adminGiveProLifetime => 'Pro örökre';

  @override
  String adminGiveProFor(String period) {
    return 'Pro erre az időre: $period';
  }

  @override
  String get adminReasonHint => 'Indok, pl. barát, tesztelő, influenszer';

  @override
  String get adminGivePro => 'Pro adása';

  @override
  String get adminRevokeTitle => 'Visszavonod az ajándékot?';

  @override
  String get adminRevokeMessage =>
      'Az ajándék Pro azonnal megszűnik. A saját előfizetése tovább fut.';

  @override
  String get adminRevoke => 'Visszavonás';

  @override
  String get adminGiftRevoked => 'Ajándék visszavonva';

  @override
  String get adminUnbanTitle => 'Feloldod a tiltást?';

  @override
  String adminUnbanMessage(String name) {
    return '$name újra be tud jelentkezni.';
  }

  @override
  String get adminUnbanned => 'Tiltás feloldva';

  @override
  String get adminBanUserMessage =>
      'Ez a fiók többé nem tud bejelentkezni és nem használhatja az appot. A fotók maradnak.';

  @override
  String get adminUser => 'Felhasználó';

  @override
  String get adminNotVerified => 'nincs ellenőrizve';

  @override
  String get adminRole => 'Szerep';

  @override
  String get adminCreated => 'Létrehozva';

  @override
  String get unknown => 'Ismeretlen';

  @override
  String get adminSignInWith => 'Bejelentkezés ezzel';

  @override
  String get adminEmailMethod => 'E-mail';

  @override
  String get adminPhotosAndVideos => 'Fotók és videók';

  @override
  String get adminStatus => 'Állapot';

  @override
  String get adminActive => 'Aktív';

  @override
  String adminActiveUntil(String date) {
    return 'Aktív eddig: $date';
  }

  @override
  String adminGiftFrom(String name) {
    return 'Ajándék tőle: $name';
  }

  @override
  String adminExpiredOn(String date) {
    return 'Lejárt: $date';
  }

  @override
  String get adminExpired => 'Lejárt';

  @override
  String adminUntil(String date) {
    return 'Eddig: $date';
  }

  @override
  String get adminGiveProTitle => 'Pro adása';

  @override
  String get adminGiveProNote =>
      'Ennek a személynek a csoportjaira is érvényes: egy Pro a csoportban = Pro mindenkinek abban a csoportban.';

  @override
  String get adminRevokeGift => 'Ajándék visszavonása';

  @override
  String get adminModeration => 'Moderálás';

  @override
  String get adminCannotBanSelf => 'Saját magadat nem tilthatod le.';

  @override
  String get adminCannotBanAdmin => 'Admin nem tiltható le.';

  @override
  String get adminUnban => 'Tiltás feloldása';

  @override
  String get adminBanAccount => 'Fiók letiltása';

  @override
  String get googleSignInUnavailable =>
      'A Google-bejelentkezés még nem érhető el';

  @override
  String get cameraPickerTitle => 'Válaszd ki a kamerádat';

  @override
  String get cameraPickerSubtitle =>
      'Minden kamera saját hangulatot ad a fotóidnak';

  @override
  String get cameraPickerChange => 'Kameraváltás';

  @override
  String get cameraPickerUnlock => 'Feloldás Pro-val';

  @override
  String get cameraPickerSelected => 'Kiválasztva';

  @override
  String get cameraPickerStyleSummer => 'Nyár';

  @override
  String get cameraPickerStyleSummerDescription =>
      'Meleg, fakó színek, mint egy 90-es évekbeli pillanatképen';

  @override
  String get cameraPickerStyleNight => 'Éjszaka 800';

  @override
  String get cameraPickerStyleNightDescription =>
      'Mozifilm: türkiz árnyékok, meleg fény, sok szemcse';

  @override
  String get cameraPickerStyleSepia => 'Szépia';

  @override
  String get cameraPickerStyleSepiaDescription =>
      'Régi barna kép a cipősdobozból';

  @override
  String get cameraPickerStyleLomo => 'Lomo';

  @override
  String get cameraPickerStyleLomoDescription =>
      'Élénk színek, sötét sarkok és vad színárnyalat';

  @override
  String get cameraPickerStyleMint => 'Menta';

  @override
  String get cameraPickerStyleMintDescription =>
      'Lágy és friss, zöldes árnyalattal';

  @override
  String get cameraPickerStylePastel => 'Rózsaszín';

  @override
  String get cameraPickerStylePastelDescription =>
      'Pasztell színek rózsaszín ragyogással és fehér kerettel';

  @override
  String get cameraPickerStyleSuper8 => 'Super 8';

  @override
  String get cameraPickerStyleSuper8Description =>
      'Szemcsés és lágy, mint egy régi házi videó';

  @override
  String get paywallBenefitGroup => 'Egy Pro = Pro az egész csoportnak';

  @override
  String get paywallBenefitUnlimited =>
      'Korlátlan tag, a fotók örökre megmaradnak';

  @override
  String get paywallBenefitQuality => 'Nincs vízjel, eredeti minőség';

  @override
  String paywallFreeTrial(String period) {
    return '$period ingyen';
  }

  @override
  String paywallPriceYear(String price) {
    return '$price évente.';
  }

  @override
  String paywallPriceYearTrial(String period, String price) {
    return '$period ingyen, utána $price évente.';
  }

  @override
  String paywallPriceMonth(String price) {
    return '$price havonta.';
  }

  @override
  String paywallPriceMonthTrial(String period, String price) {
    return '$period ingyen, utána $price havonta.';
  }

  @override
  String paywallAutoRenew(String store) {
    return 'Automatikusan megújul. Mondd le legalább 24 órával a megújulás előtt itt: $store.';
  }

  @override
  String get paywallDetailsTitle => 'Minden a Pro-ban';

  @override
  String get paywallBenefitStyles => 'Az összes kamerastílus';

  @override
  String get allPhotosTitle => 'Összes fotó';

  @override
  String get homeTabAlbums => 'Albumok';

  @override
  String get allPhotosEmptyTitle => 'Még nincs fotó';

  @override
  String get allPhotosEmptyMessage =>
      'Nyisd meg a kamerát, és készítsd el az első fotódat.';

  @override
  String get allPhotosLoadFailed => 'Nem sikerült betölteni a fotóidat';

  @override
  String get cameraSettingsTitle => 'Kamerabeállítások';

  @override
  String get cameraSettingsMore => 'További beállítások';

  @override
  String get cameraSettingsGrid => 'Rács';

  @override
  String get cameraSettingsHaptics => 'Rezgés fotózáskor';

  @override
  String get cameraSettingsDateStamp => 'Dátum jobbra lent';

  @override
  String get cameraSettingsSound => 'Zárhang';

  @override
  String get cameraSettingsSoundHint => 'Néma, ha a telefon néma módban van';

  @override
  String get cameraSettingsTimer => 'Önkioldó';

  @override
  String get cameraSettingsTimerOff => 'Ki';

  @override
  String cameraSettingsTimerSeconds(int seconds) {
    return '$seconds mp';
  }

  @override
  String get cameraSettingsTimerCancelHint =>
      'Koppints a zárra a megszakításhoz';

  @override
  String get cameraSettingsMirror => 'Szelfik tükrözése';

  @override
  String get cameraSettingsSaveToRoll => 'Mentés a galériába';

  @override
  String get cameraSettingsQuality => 'Minőség';

  @override
  String get cameraSettingsQualityStandard => 'Normál';

  @override
  String get cameraSettingsQualityHigh => 'Magas';

  @override
  String get cameraLowLightHint => 'Kevés a fény - kapcsold be a vakut';

  @override
  String get cameraFlashUnavailable => 'Ennek a kamerának nincs vakuja';

  @override
  String get cameraFlashScreen => 'Kijelzővaku';

  @override
  String get cameraFlashCycleHint => 'Koppints a váltáshoz: ki, be és auto';

  @override
  String get cameraFlip => 'Váltás az elülső és a hátsó kamera között';

  @override
  String get cameraFlipHint => 'Koppints duplán a keresőre a kameraváltáshoz';

  @override
  String cameraPickerPaywallStyles(int count, String styles) {
    return 'Mind a $count kamera, köztük $styles';
  }

  @override
  String get styleFlash => 'Vaku 400';

  @override
  String get styleFlashDescription =>
      'Direkt vaku meleg filmen: borostyán ragyogás, szemcse, telt vörösek';

  @override
  String cameraTimerButton(String state) {
    return 'Önkioldó: $state';
  }

  @override
  String get cameraTimerCycleHint => 'Koppints a váltáshoz: ki, 3 mp és 10 mp';

  @override
  String get cameraLastShotOpen => 'Legutóbbi fotó, megnyitja az albumot';

  @override
  String get cameraLastShotEmpty => 'Még nincs fotó, megnyitja az albumot';

  @override
  String get deleteOnlyOwnOrAdmin =>
      'Csak a készítője vagy egy admin törölheti';

  @override
  String get videoPlay => 'Lejátszás';

  @override
  String get videoPause => 'Szünet';

  @override
  String get language => 'Nyelv';

  @override
  String get languageSystem => 'Rendszer nyelve';

  @override
  String languageSystemCurrent(String language) {
    return 'Rendszer ($language)';
  }

  @override
  String get languageSearchHint => 'Nyelv keresése';

  @override
  String get languageNoResults => 'Nincs ilyen nyelv';

  @override
  String get personalRollTitle => 'Saját tekercs';

  @override
  String get personalRollSubtitle => 'Csak neked';

  @override
  String get personalRollPickerSubtitle => 'Különálló fotók, csak neked';

  @override
  String get personalRollMove => 'Albumba';

  @override
  String get personalRollMoveTitle => 'Áthelyezés albumba';

  @override
  String get personalRollMoveNoAlbums =>
      'Előbb hozz létre egy albumot, vagy csatlakozz egyhez kóddal.';

  @override
  String personalRollMoved(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotó áthelyezve ide: $album',
    );
    return '$_temp0';
  }

  @override
  String get personalRollPrivateNote =>
      'Ezeket a fotókat csak te látod. Helyezd át őket egy albumba a megosztáshoz.';

  @override
  String get paywallTripPassSub => 'Csak ez az utazás, az egész csoportnak';

  @override
  String get paywallOneTime => 'egyszeri';

  @override
  String get paywallBestValue => 'Legjobb ár';

  @override
  String paywallRollFullTitle(int used, int limit) {
    return 'Megtelt a filmed - $used/$limit fotó';
  }

  @override
  String get paywallRollFullSub => 'Fotózz tovább Trip Passszal vagy Próval.';

  @override
  String get paywallCameraTitle => 'Ez a kamera a Pro része';

  @override
  String paywallCameraSub(int count) {
    return 'Oldd fel mind a(z) $count kamerát.';
  }

  @override
  String get paywallWatermarkTitle => 'Recap vízjel nélkül';

  @override
  String get paywallWatermarkSub => 'Oszd meg a recapet CamTrip-logó nélkül.';

  @override
  String get paywallDeletionTitle => 'Őrizd meg az utat';

  @override
  String paywallDeletionSub(String date) {
    return 'Az ingyenes utazások törlődnek ekkor: $date. Trip Passszal vagy Próval örökre megmarad.';
  }

  @override
  String paywallTripPassTerms(String price) {
    return 'Egyszeri vásárlás: $price erre az utazásra. Nem előfizetés.';
  }

  @override
  String get buyTripPass => 'Trip Pass vásárlása';

  @override
  String get tripPassActive => 'A Trip Pass aktív: az utazás mindenkinek Pro';

  @override
  String get tripPassActivating =>
      'Fizetés megérkezett. A Trip Pass mindjárt aktív lesz.';

  @override
  String proViaTripPass(String name) {
    return 'Trip Pass: $name';
  }

  @override
  String rollCounterSemantics(int used, int limit) {
    return '$used/$limit kocka a filmeden';
  }

  @override
  String rollHeldTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotó már nem fér rá a filmre',
      one: '1 fotó már nem fér rá a filmre',
    );
    return '$_temp0';
  }

  @override
  String get rollHeldBody => 'Őrizd meg őket Próval vagy Trip Passszal';

  @override
  String deletionBannerTitle(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Őrizd meg az utat - még $days nap',
      one: 'Őrizd meg az utat - még 1 nap',
    );
    return '$_temp0';
  }

  @override
  String get deletionBannerBody =>
      'Az ingyenes utazások a vége után 30 nappal törlődnek. Trip Passszal vagy Próval örökre megmarad.';

  @override
  String apiRollFull(int limit) {
    return 'Megtelt a filmed ($limit kocka). Trip Passszal vagy Próval folytathatod.';
  }

  @override
  String get apiTripPassFailed =>
      'A Trip Passt nem sikerült aktiválni. Írj a support@camtrip.app címre.';

  @override
  String get apiTripPassExists => 'Ennek az utazásnak már van Trip Passa.';

  @override
  String get tripPassUnavailable =>
      'A Trip Pass most nem érhető el. Próbáld később.';

  @override
  String get tripMapTitle => 'Utazási térkép';

  @override
  String get tripMapOpen => 'Térkép és statisztika';

  @override
  String get tripMapLoadFailed => 'Nem sikerült betölteni a térképet';

  @override
  String get tripMapStatDays => 'Nap';

  @override
  String get tripMapStatPhotos => 'Fotó';

  @override
  String get tripMapStatVideos => 'Videó';

  @override
  String get tripMapStatMembers => 'Tag';

  @override
  String get tripMapStatDistance => 'megtett km';

  @override
  String get tripMapStatCountries => 'Ország';

  @override
  String get tripMapStatPlaces => 'Hely';

  @override
  String tripMapBusiestDay(String day, int count) {
    return 'A legtöbb fotó: $day ($count)';
  }

  @override
  String tripMapTopPhotographer(String name, int count) {
    return 'Legjobb fotós: $name ($count)';
  }

  @override
  String get tripMapOffTitle => 'Az utazási térkép ki van kapcsolva';

  @override
  String get tripMapOffMessage =>
      'Egy admin bekapcsolhatja a térképet a csoport beállításaiban. A statisztikát mindig látod.';

  @override
  String get tripMapOffMessageAdmin =>
      'Kapcsold be a térképet, és lássátok, hol készültek a fotóitok. Mindenki maga dönti el, hogy részt vesz-e.';

  @override
  String get tripMapEnable => 'Térkép bekapcsolása';

  @override
  String get tripMapEmptyTitle => 'Még nincsenek helyek a térképen';

  @override
  String get tripMapEmptyMessage =>
      'A helyüket megosztó tagok új fotói itt jelennek meg, kb. 100 m-re kerekítve.';

  @override
  String get tripMapConsentTitle => 'Utazási térkép';

  @override
  String get tripMapConsentQuestion =>
      'Megosztod a csoport térképén, hol készültek a fotóid?';

  @override
  String get tripMapConsentDetail =>
      'Csak a csoport tagjai látják, kb. 100 m-re kerekítve. A hely soha nem kerül bele magába a fotóba, és bármikor kikapcsolhatod a csoport beállításaiban.';

  @override
  String get tripMapConsentYes => 'Igen, megosztom';

  @override
  String get tripMapConsentNo => 'Nem';

  @override
  String get tripMapLocationDenied =>
      'Nincs hozzáférés a helyadataidhoz. A telefon beállításaiban engedélyezheted.';

  @override
  String get tripMapSettingSubtitle =>
      'Térképen mutatja, hol készültek a fotók. A tagok maguk döntik el, hogy megosztják-e.';

  @override
  String get tripMapDisableTitle => 'Kikapcsolod a térképet?';

  @override
  String get tripMapDisableMessage =>
      'A csoport összes helyadata törlődik. Ha később újra bekapcsolod, mindenkit újra megkérdezünk.';

  @override
  String get tripMapDisable => 'Kikapcsolás';

  @override
  String get tripMapMySharing => 'Helyem megosztása';

  @override
  String get tripMapMySharingOn =>
      'Az új fotóid megjelennek a térképen (kb. 100 m-re kerekítve).';

  @override
  String get tripMapMySharingOff =>
      'Kikapcsolva. A fotóid nem jelennek meg a térképen.';

  @override
  String get tripMapStopSharingTitle => 'Leállítod a helymegosztást?';

  @override
  String get tripMapStopSharingMessage =>
      'Az összes fotód helyadata törlődik ebben a csoportban.';

  @override
  String get tripMapStopSharing => 'Megosztás leállítása';
}
