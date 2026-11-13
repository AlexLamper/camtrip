// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get cancel => 'Anulează';

  @override
  String get yes => 'Da';

  @override
  String inviteMessageIntro(String groupName) {
    return 'Vii în „$groupName” pe CamTrip? Așa ne vedem imediat pozele unii altora.';
  }

  @override
  String inviteMessageCode(String code) {
    return 'Sau introdu codul: $code';
  }

  @override
  String get memberFallbackName => 'Prieten';

  @override
  String get reportReasonInappropriate => 'Nepotrivit sau ofensator';

  @override
  String get reportReasonSpam => 'Spam';

  @override
  String get reportReasonOther => 'Altceva';

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
  String get errorOffline =>
      'Nu există conexiune. Încearcă din nou peste puțin timp.';

  @override
  String errorSomethingWrongStatus(int status) {
    return 'Ceva n-a mers ($status)';
  }

  @override
  String get errorSomethingWrong => 'Ceva n-a mers';

  @override
  String get apiInvalidCredentials =>
      'Adresa de e-mail sau parola nu este corectă';

  @override
  String get apiInvalidCode =>
      'Codul nu este corect sau a expirat. Cere un cod nou.';

  @override
  String get apiEmailTaken =>
      'Există deja un cont cu această adresă de e-mail. Conectează-te sau alege „Ai uitat parola?”.';

  @override
  String apiEmailTakenProvider(String provider) {
    return 'Există deja un cont cu această adresă de e-mail. Conectează-te cu $provider.';
  }

  @override
  String apiWeakPassword(int min) {
    return 'Alege o parolă de cel puțin $min caractere';
  }

  @override
  String apiNameTooLong(int max) {
    return 'Numele tău poate avea cel mult $max caractere';
  }

  @override
  String get apiRateLimited =>
      'Prea multe încercări. Încearcă din nou peste 15 minute.';

  @override
  String apiAccountBanned(String email) {
    return 'Contul tău a fost blocat. Scrie la $email dacă crezi că e o greșeală.';
  }

  @override
  String get apiProRequired =>
      'Acest stil de cameră face parte din CamTrip Pro';

  @override
  String get apiGroupClosed => 'Acest grup a fost închis';

  @override
  String get apiGroupCodeNotFound => 'Niciun grup găsit cu acest cod';

  @override
  String apiGroupFull(int max) {
    return 'Grupul este plin (max. $max membri). Dacă un membru are CamTrip Pro, oricine poate intra.';
  }

  @override
  String get apiLastMember => 'Ești ultimul membru. Șterge mai bine grupul.';

  @override
  String get apiAdminRequired => 'Doar pentru administratorii CamTrip';

  @override
  String get apiUploadIncomplete => 'Încărcarea nu este completă';

  @override
  String get apiInvalidInput => 'Date nevalide';

  @override
  String get apiNotSignedIn => 'Nu ești conectat';

  @override
  String get apiAccountGone => 'Acest cont nu mai există';

  @override
  String get apiPhotoNotFound => 'Poza nu a fost găsită';

  @override
  String get apiGroupNotFound => 'Grupul nu a fost găsit';

  @override
  String get apiMemberNotFound => 'Membrul nu a fost găsit';

  @override
  String get apiPersonNotFound => 'Persoana nu a fost găsită';

  @override
  String get apiUserNotFound => 'Utilizatorul nu a fost găsit';

  @override
  String get apiAdminOnly => 'Doar un admin poate face asta';

  @override
  String get apiCannotBlockSelf => 'Nu te poți bloca pe tine';

  @override
  String get apiCannotReportOwn => 'Nu îți poți raporta propria poză';

  @override
  String get apiDeleteOwnOnly => 'Poți șterge doar pozele tale';

  @override
  String get apiOwnerCannotBeRemoved =>
      'Creatorul grupului nu poate fi eliminat';

  @override
  String get apiOwnerStaysAdmin => 'Creatorul rămâne mereu admin';

  @override
  String get apiNeedsOneAdmin => 'Un grup are nevoie de cel puțin un admin';

  @override
  String get apiEndBeforeStart =>
      'Data de sfârșit este înaintea datei de început';

  @override
  String get apiPermanentNoEndDate =>
      'Un grup mereu deschis nu are dată de sfârșit';

  @override
  String get apiCannotBanAdmin => 'Un administrator nu poate fi blocat';

  @override
  String get apiReportNotFound => 'Raportarea nu a fost găsită';

  @override
  String get apiPhotoOwnerUnknown =>
      'Persoana care a făcut această poză nu mai este cunoscută';

  @override
  String get validationNameRequired => 'Introdu-ți numele';

  @override
  String validationMaxChars(int max) {
    return 'Cel mult $max caractere';
  }

  @override
  String get validationEmailRequired => 'Introdu adresa de e-mail';

  @override
  String get validationEmailInvalid =>
      'Această adresă de e-mail nu este validă';

  @override
  String get validationPasswordRequired => 'Alege o parolă';

  @override
  String validationMinChars(int min) {
    return 'Cel puțin $min caractere';
  }

  @override
  String get validationPasswordTooLong => 'Parola este prea lungă';

  @override
  String get validationPasswordEmpty => 'Introdu parola';

  @override
  String get validationCodeRequired => 'Introdu codul din e-mail';

  @override
  String get validationCodeDigits => 'Codul are 6 cifre';

  @override
  String get onboarding1Title => 'Un singur film\npentru tot grupul.';

  @override
  String get onboarding1Body =>
      'Fotografiază cu o cameră retro. Toată lumea îți vede pozele imediat și sunt imediat și în albumul tău.';

  @override
  String get onboarding2Title => 'Gata cu\ntrimisul pozelor.';

  @override
  String get onboarding2Body =>
      'Creează un grup, trimite codul, gata. Niciodată „îmi trimiți și mie pozele?”';

  @override
  String get onboarding3Title => 'Un video recap\nla final.';

  @override
  String get onboarding3Body =>
      'CamTrip face un video cu muzică din cele mai frumoase momente ale voastre.';

  @override
  String get onboardingInvited => 'Ai fost invitat! Conectează-te ca să intri.';

  @override
  String get signInAppleFailed => 'Conectarea cu Apple n-a mers';

  @override
  String get signInGoogleFailed => 'Conectarea cu Google n-a mers';

  @override
  String get signInFailed => 'Conectarea n-a mers';

  @override
  String get next => 'Înainte';

  @override
  String get legalPrefix => 'Continuând, ești de acord cu';

  @override
  String get legalTerms => 'termenii';

  @override
  String get legalAnd => ' și';

  @override
  String get legalPrivacy => 'politica de confidențialitate';

  @override
  String get legalSuffix => '.';

  @override
  String get continueWithApple => 'Continuă cu Apple';

  @override
  String get continueWithGoogle => 'Continuă cu Google';

  @override
  String get createAccount => 'Creează cont';

  @override
  String get signIn => 'Conectează-te';

  @override
  String get or => 'sau';

  @override
  String get registerSubtitle =>
      'Ca prietenii tăi să vadă cine a făcut pozele.';

  @override
  String get loginSubtitle => 'Bine ai revenit.';

  @override
  String get forgotPasswordTitle => 'Ai uitat parola';

  @override
  String get forgotPasswordPushSubtitle =>
      'Mai ești conectat undeva? Îți trimitem acolo un cod din 6 cifre ca notificare push, ca să setezi o parolă nouă.';

  @override
  String get newPassword => 'Parolă nouă';

  @override
  String get resetPushInfo =>
      'Dacă mai ești conectat undeva, vei primi acolo o notificare push cu un cod. Nu poți intra? Conectează-te cu Apple sau Google folosind aceeași adresă de e-mail - contul tău va fi legat.';

  @override
  String get sendCode => 'Trimite codul';

  @override
  String get savePassword => 'Salvează parola';

  @override
  String get errorTryAgain => 'Ceva n-a mers. Încearcă din nou.';

  @override
  String get back => 'Înapoi';

  @override
  String get name => 'Nume';

  @override
  String get email => 'Adresă de e-mail';

  @override
  String get codeFromPush => 'Codul din notificare';

  @override
  String get password => 'Parolă';

  @override
  String get hidePassword => 'Ascunde parola';

  @override
  String get showPassword => 'Arată parola';

  @override
  String get forgotPasswordLink => 'Ai uitat parola?';

  @override
  String get haveAccount => 'Ai deja cont?';

  @override
  String get newToCamTrip => 'Ești nou pe CamTrip?';

  @override
  String get rememberedIt => 'Ți-ai amintit?';

  @override
  String get noCodeReceived => 'N-ai primit codul?';

  @override
  String get resendCode => 'Trimite din nou';

  @override
  String onboardingDemoRoll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de fotografi, 1 film',
      few: '$count fotografi, 1 film',
      one: '$count fotograf, 1 film',
    );
    return '$_temp0';
  }

  @override
  String membersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de membri',
      few: '$count membri',
      one: '$count membru',
    );
    return '$_temp0';
  }

  @override
  String photosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de poze',
      few: '$count poze',
      one: '$count poză',
    );
    return '$_temp0';
  }

  @override
  String videosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de videoclipuri',
      few: '$count videoclipuri',
      one: '$count video',
    );
    return '$_temp0';
  }

  @override
  String get justNow => 'acum';

  @override
  String get badgeNew => 'Nou';

  @override
  String recapTitle(String groupName) {
    return 'Recap $groupName';
  }

  @override
  String get styleFilm => 'Film';

  @override
  String get styleInstant => 'Instant';

  @override
  String get styleDisposable => 'Aruncabil';

  @override
  String get styleBw => 'A/N';

  @override
  String get styleGolden => 'Golden';

  @override
  String get styleChrome => 'Chrome';

  @override
  String get styleFilmDescription =>
      'Culori calde, granulație și o dată portocalie';

  @override
  String get styleInstantDescription => 'Culori blânde și o margine albă';

  @override
  String get styleDisposableDescription =>
      'Bliț dur, vignetare și scăpări de lumină';

  @override
  String get styleBwDescription => 'Alb-negru granulat cu contrast puternic';

  @override
  String get styleGoldenDescription =>
      'Mereu ora de aur, o strălucire aurie blândă';

  @override
  String get styleChromeDescription =>
      'Rece, saturat și clar, ca filmul diapozitiv';

  @override
  String get shutterStopRecording => 'Oprește înregistrarea';

  @override
  String get shutterStartRecording => 'Pornește înregistrarea video';

  @override
  String get shutterTakePhoto => 'Fă o poză';

  @override
  String get modePhoto => 'Poză';

  @override
  String get modeVideo => 'Video';

  @override
  String get cameraNotFound => 'Nicio cameră găsită';

  @override
  String get cameraAccessNeeded =>
      'CamTrip are nevoie de acces la cameră. Activează-l în Setări.';

  @override
  String get cameraStartFailed => 'Camera n-a putut porni';

  @override
  String get albumAccessNeeded =>
      'Dă-i lui CamTrip acces la poze ca să le salveze și în albumul tău';

  @override
  String get albumSaveFailed =>
      'Salvarea în album n-a mers. Poza este totuși distribuită.';

  @override
  String styleProFallback(String style) {
    return 'Acest stil face parte din Pro. În acest grup fotografiezi cu $style.';
  }

  @override
  String get photoFailed => 'Poza n-a mers. Încearcă din nou.';

  @override
  String get recordingFailed => 'Înregistrarea video n-a mers';

  @override
  String get videoFailed => 'Crearea videoclipului n-a mers. Încearcă din nou.';

  @override
  String get shootInGroup => 'Fotografiază în grup';

  @override
  String get close => 'Închide';

  @override
  String get flash => 'Bliț';

  @override
  String get flashOn => 'Pornit';

  @override
  String get flashOff => 'Oprit';

  @override
  String get flashAuto => 'Auto';

  @override
  String get chooseGroup => 'Alege grupul';

  @override
  String get switchCamera => 'Schimbă camera';

  @override
  String get createOrJoinFirst =>
      'Creează mai întâi un grup sau intră într-unul';

  @override
  String get proViaGroup => 'Pro prin grup';

  @override
  String proViaName(String name) {
    return 'Pro prin $name';
  }

  @override
  String get proStylesFreeViaMember =>
      'Stilurile Pro din acest grup sunt gratuite pentru tine datorită unui membru Pro';

  @override
  String proStylesFreeViaName(String name) {
    return 'Stiluri Pro în acest grup: gratuite pentru tine datorită lui $name';
  }

  @override
  String get subscriptionsUnavailable =>
      'Abonamentele nu sunt disponibile acum. Încearcă din nou mai târziu.';

  @override
  String get paymentPending =>
      'Plata ta se procesează încă. Pro se activează imediat ce e gata.';

  @override
  String get purchaseFailed =>
      'Achiziția n-a mers. Încearcă din nou mai târziu.';

  @override
  String get restoreUnavailable =>
      'Restaurarea achizițiilor nu este posibilă acum. Încearcă din nou mai târziu.';

  @override
  String get restoreFailed =>
      'Restaurarea n-a mers. Încearcă din nou mai târziu.';

  @override
  String get welcomePro => 'Bun venit în CamTrip Pro! 🎉';

  @override
  String get proRestored => 'Pro a fost restaurat';

  @override
  String get noPurchaseFound => 'Nicio achiziție anterioară găsită';

  @override
  String periodDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de zile',
      few: '$count zile',
      one: '$count zi',
    );
    return '$_temp0';
  }

  @override
  String periodWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de săptămâni',
      few: '$count săptămâni',
      one: '$count săptămână',
    );
    return '$_temp0';
  }

  @override
  String periodMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de luni',
      few: '$count luni',
      one: '$count lună',
    );
    return '$_temp0';
  }

  @override
  String periodYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de ani',
      few: '$count ani',
      one: '$count an',
    );
    return '$_temp0';
  }

  @override
  String get paywallHavePro => 'Ai CamTrip Pro';

  @override
  String get paywallSubtitle => 'Totul pentru următoarea ta călătorie.';

  @override
  String paywallFeatureStyles(String styles) {
    return 'Toate stilurile de cameră ($styles)';
  }

  @override
  String get paywallFeatureUnlimited =>
      'Membri și spațiu nelimitat, pozele se păstrează pentru totdeauna';

  @override
  String get paywallFeatureNoWatermark => 'Recapuri fără filigran';

  @override
  String get paywallFeatureOriginal => 'Descărcare la calitate originală';

  @override
  String get planYear => 'An';

  @override
  String get planMonth => 'Lună';

  @override
  String pricePerMonth(String price) {
    return '$price pe lună';
  }

  @override
  String paywallSaveBadge(int percent) {
    return 'ECONOMISEȘTI $percent%';
  }

  @override
  String get planMonthCancelAnytime => 'anulezi oricând';

  @override
  String tryFree(String period) {
    return 'Încearcă $period gratuit';
  }

  @override
  String get becomePro => 'Ia Pro';

  @override
  String get subscriptionsLoadFailed =>
      'Abonamentele n-au putut fi încărcate. Verifică-ți conexiunea.';

  @override
  String legalAnnual(String price) {
    return 'Abonament anual CamTrip Pro: $price pe an.';
  }

  @override
  String legalAnnualTrial(String period, String price) {
    return 'Abonament anual CamTrip Pro: $period gratuit, apoi $price pe an.';
  }

  @override
  String legalMonthly(String price) {
    return 'Abonament lunar CamTrip Pro: $price pe lună.';
  }

  @override
  String legalMonthlyTrial(String period, String price) {
    return 'Abonament lunar CamTrip Pro: $period gratuit, apoi $price pe lună.';
  }

  @override
  String get legalBillingApple =>
      'Plata se încasează din Apple ID-ul tău. Abonamentul se reînnoiește automat dacă nu îl anulezi cu cel puțin 24 de ore înainte de sfârșitul perioadei. Îl poți anula și gestiona din setările contului App Store.';

  @override
  String get legalBillingGoogle =>
      'Plata se încasează din contul tău Google. Abonamentul se reînnoiește automat dacă nu îl anulezi cu cel puțin 24 de ore înainte de sfârșitul perioadei. Îl poți anula și gestiona din setările contului Google Play.';

  @override
  String get restorePurchases => 'Restaurează achizițiile';

  @override
  String get terms => 'Termeni';

  @override
  String get privacy => 'Confidențialitate';

  @override
  String get groupProTitle => 'Un Pro în grup = Pro pentru toți din acel grup';

  @override
  String get groupProBody =>
      'Dacă o persoană are Pro, tot grupul primește toate stilurile de cameră, membri nelimitați, poze păstrate, calitate originală și recapuri fără filigran.';

  @override
  String get groupCreated => 'Grup creat ✓';

  @override
  String get inviteFriends => 'Invită-ți prietenii';

  @override
  String get codeCopied => 'Cod copiat';

  @override
  String get shareLink => 'Distribuie linkul';

  @override
  String inviteSubject(String groupName) {
    return 'Intră în $groupName pe CamTrip';
  }

  @override
  String inviteMembersUnlimited(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de membri',
      few: '$count membri',
      one: '$count membru',
    );
    return '$_temp0 · nelimitat (Pro)';
  }

  @override
  String inviteMembersLimit(int count, int limit) {
    return '$count din $limit membri · Pro: nelimitat';
  }

  @override
  String get toCamera => 'Mergi la cameră';

  @override
  String get done => 'Gata';

  @override
  String get joinEnterCode => 'Introdu codul de 6 caractere';

  @override
  String get joinGroupTitle => 'Intră într-un grup';

  @override
  String get joinGroupSubtitle =>
      'Introdu codul prietenilor sau scanează codul lor QR.';

  @override
  String get typeCode => 'Scrie codul';

  @override
  String get scanQr => 'Scanează QR';

  @override
  String get join => 'Intră';

  @override
  String get groupNameRequired => 'Dă un nume grupului';

  @override
  String get newGroup => 'Grup nou';

  @override
  String get groupType => 'Tip de grup';

  @override
  String get groupTypeVacation => 'Vacanță';

  @override
  String get groupTypeVacationDescription =>
      'Cu dată de început și de sfârșit, apoi arhivat';

  @override
  String get groupTypeEvent => 'Eveniment';

  @override
  String get groupTypeEventDescription =>
      'O zi sau o seară, de ex. o petrecere';

  @override
  String get groupTypePermanent => 'Mereu deschis';

  @override
  String get groupTypePermanentDescription => 'Pentru gașca ta de prieteni';

  @override
  String get date => 'Dată';

  @override
  String get departure => 'Plecare';

  @override
  String get returnDate => 'Întoarcere';

  @override
  String get defaultCameraStyle => 'Stil de cameră implicit';

  @override
  String freeLimitPermanent(int max) {
    return 'Gratuit: până la $max membri. Nelimitat cu Pro.';
  }

  @override
  String freeLimitDated(int max, int days) {
    return 'Gratuit: până la $max membri, pozele se păstrează până la $days zile după data de sfârșit. Nelimitat și pentru totdeauna cu Pro.';
  }

  @override
  String get createGroup => 'Creează grupul';

  @override
  String get group => 'Grup';

  @override
  String groupCode(String code) {
    return 'cod $code';
  }

  @override
  String get manage => 'Gestionează';

  @override
  String get rename => 'Redenumește';

  @override
  String get changeDates => 'Schimbă datele';

  @override
  String get finishTrip => 'Încheie călătoria';

  @override
  String get finishTripSubtitle => 'Setează data de sfârșit la azi';

  @override
  String get reopenGroup => 'Redeschide grupul';

  @override
  String get closeGroup => 'Închide grupul';

  @override
  String get reopenGroupSubtitle => 'Membrii pot adăuga din nou poze';

  @override
  String get closeGroupSubtitle =>
      'Nimeni nu mai poate adăuga poze; totul poate fi încă văzut';

  @override
  String get members => 'Membri';

  @override
  String memberYou(String name) {
    return '$name (tu)';
  }

  @override
  String get blockedTag => 'blocat';

  @override
  String get adminTag => 'admin';

  @override
  String removeMemberTitle(String name) {
    return 'Elimini pe $name?';
  }

  @override
  String get removeMemberMessage => 'Pozele lor rămân în grup.';

  @override
  String get remove => 'Șterge';

  @override
  String get removeMember => 'Elimină';

  @override
  String blockTitle(String name) {
    return 'Blochezi pe $name?';
  }

  @override
  String blockMessage(String name) {
    return 'Nu vei mai vedea poze și videoclipuri de la $name și nu vei mai primi notificări despre ele. Poți anula asta în Setări.';
  }

  @override
  String get block => 'Blochează';

  @override
  String get makeMember => 'Fă-l membru obișnuit';

  @override
  String get makeAdmin => 'Fă-l admin';

  @override
  String get removeFromGroup => 'Elimină din grup';

  @override
  String get unblock => 'Deblochează';

  @override
  String get inviteFriendsButton => 'Invită prieteni';

  @override
  String get you => 'Tu';

  @override
  String get unarchive => 'Scoate din arhivă';

  @override
  String get archive => 'Arhivează';

  @override
  String get unarchiveSubtitle => 'Grupul e din nou la albumele tale';

  @override
  String archiveSubtitle(String section) {
    return 'Doar pentru tine: grupul se mută la „$section” în partea de jos a albumelor tale';
  }

  @override
  String get archivedSection => 'Arhivate';

  @override
  String get hiddenPhotos => 'Poze ascunse';

  @override
  String get hiddenPhotosSubtitle => 'Poze pe care le-ai ascuns pentru tine';

  @override
  String get leaveGroup => 'Părăsește grupul';

  @override
  String get leaveGroupSubtitle => 'Pozele tale rămân în grup pentru ceilalți';

  @override
  String get deleteGroup => 'Șterge grupul';

  @override
  String get deleteGroupSubtitle => 'Toate pozele se șterg pentru toată lumea';

  @override
  String groupArchived(String groupName) {
    return '„$groupName” a fost arhivat';
  }

  @override
  String groupUnarchived(String groupName) {
    return '„$groupName” e din nou la albumele tale';
  }

  @override
  String get undo => 'Anulează';

  @override
  String get groupNameTitle => 'Numele grupului';

  @override
  String get finishTripTitle => 'Închei călătoria?';

  @override
  String get finishTripMessage =>
      'Data de sfârșit devine azi. Poți adăuga în continuare poze; recapul e gata.';

  @override
  String get finishTripConfirm => 'Încheie';

  @override
  String get tripFinished => 'Călătorie încheiată';

  @override
  String leaveGroupTitle(String groupName) {
    return 'Părăsești „$groupName”?';
  }

  @override
  String get leaveGroupMessage =>
      'Pozele tale rămân în grup pentru ceilalți. Poți reveni mai târziu cu codul.';

  @override
  String get leave => 'Părăsește';

  @override
  String groupDeleted(String groupName) {
    return '„$groupName” a fost șters';
  }

  @override
  String get youAreAdmin => 'ești admin';

  @override
  String get open => 'Deschide';

  @override
  String get archiveMenuSubtitle => 'Doar pentru tine, ceilalți nu vor observa';

  @override
  String get deleteGroupMenuSubtitle => 'Pentru toată lumea, cu toate pozele';

  @override
  String get deleteGroupTitle => 'Ștergi grupul?';

  @override
  String deleteGroupMessage(int count, String groupName, int memberCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Toate cele $count de poze și videoclipuri',
      few: 'Toate cele $count poze și videoclipuri',
      one: '$count poză sau video',
    );
    String _temp1 = intl.Intl.pluralLogic(
      memberCount,
      locale: localeName,
      other: 'toți cei $memberCount de membri',
      few: 'toți cei $memberCount membri',
      one: '$memberCount membru',
    );
    return '$_temp0 din „$groupName” vor dispărea pentru $_temp1. Acest lucru nu poate fi anulat.';
  }

  @override
  String get deleteGroupOwnRoll => 'Galeria ta rămâne neschimbată.';

  @override
  String get deleteGroupTypeName => 'Scrie numele grupului pentru confirmare:';

  @override
  String get deleteForEveryone => 'Șterge pentru toată lumea';

  @override
  String get save => 'Salvează';

  @override
  String get yourAlbums => 'Albumele tale';

  @override
  String get uploadQueue => 'Coadă de încărcare';

  @override
  String get noConnection => 'Nu există conexiune';

  @override
  String get albumsOfflineMessage =>
      'Albumele se încarcă imediat ce ești din nou online. Camera funcționează în continuare.';

  @override
  String get retry => 'Încearcă din nou';

  @override
  String get noAlbumsTitle => 'Încă niciun album';

  @override
  String get noAlbumsMessage =>
      'Creează un grup pentru următoarea călătorie sau intră în grupul unui prieten cu codul lui.';

  @override
  String get haveCode => 'Am un cod';

  @override
  String get joinWithCode => 'Intră cu un cod sau cod QR';

  @override
  String get camera => 'Cameră';

  @override
  String get restore => 'Restaurează';

  @override
  String get more => 'Mai mult';

  @override
  String get newAlbum => 'Nou';

  @override
  String get closedTag => 'închis';

  @override
  String get activeTag => 'activ';

  @override
  String get uploadFailed => 'Încărcarea a eșuat';

  @override
  String get queueNoSignal => 'Fără semnal.';

  @override
  String get queueNoSignalMessage =>
      'Pozele tale sunt deja în album și vor fi distribuite imediat ce ești din nou online.';

  @override
  String get queueWaitingForWifi => 'Se așteaptă Wi-Fi.';

  @override
  String queueWifiOnlyOn(String setting) {
    return 'Ai activat „$setting”.';
  }

  @override
  String get queueVideosWifiOnly => 'Videoclipurile merg doar prin Wi-Fi.';

  @override
  String get queueAllShared => 'Totul a fost distribuit ✓';

  @override
  String queuePending(String items) {
    return 'Mai sunt de distribuit: $items';
  }

  @override
  String queuePendingBoth(String photos, String videos) {
    return 'Mai sunt de distribuit: $photos și $videos';
  }

  @override
  String get retryUpload => 'Încearcă din nou';

  @override
  String get removeFromQueue => 'Scoate din coadă';

  @override
  String get queueStatusWifi => 'Wi-Fi';

  @override
  String get queueStatusWaiting => 'în așteptare';

  @override
  String get videosWifiOnlyTitle => 'Videoclipuri doar prin Wi-Fi';

  @override
  String get videosWifiOnlySubtitle => 'Economisește datele mobile';

  @override
  String get retryNow => 'Încearcă acum';

  @override
  String get yourName => 'Numele tău';

  @override
  String get settings => 'Setări';

  @override
  String get tapToChangeName => 'Atinge ca să-ți schimbi numele';

  @override
  String get getCamTripPro => 'Ia CamTrip Pro';

  @override
  String get photos => 'Poze';

  @override
  String get saveOwnPhotos =>
      'Salvează pozele mele într-un album pentru fiecare grup';

  @override
  String get autoSaveOthers => 'Salvează automat pozele celorlalți';

  @override
  String get wifiOnlyTitle => 'Încarcă doar prin Wi-Fi';

  @override
  String get dateStamp => 'Ștampilă cu data';

  @override
  String get notifications => 'Notificări';

  @override
  String get notifyNewPhotos => 'Poze noi (grupate)';

  @override
  String get notifyRecapReady => 'Recap gata';

  @override
  String get camTripTeam => 'Echipa CamTrip';

  @override
  String get adminEntrySubtitle =>
      'Utilizatori, acordare Pro, raportări și statistici';

  @override
  String get account => 'Cont';

  @override
  String get manageSubscription => 'Gestionează abonamentul';

  @override
  String get blockedPeople => 'Persoane blocate';

  @override
  String get nobody => 'Nimeni';

  @override
  String peopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de persoane',
      few: '$count persoane',
      one: '$count persoană',
    );
    return '$_temp0';
  }

  @override
  String get privacyPolicy => 'Politica de confidențialitate';

  @override
  String get contact => 'Contact';

  @override
  String get signOut => 'Deconectează-te';

  @override
  String get deleteAccount => 'Șterge contul';

  @override
  String get deleteAccountSubtitle => 'Îți șterge contul și toate pozele';

  @override
  String get deleteAccountTitle => 'Ștergi contul?';

  @override
  String get deleteAccountMessage =>
      'Contul tău și toate pozele și videoclipurile tale vor fi șterse, inclusiv din grupuri. Anulează orice abonament activ în App Store sau Google Play.';

  @override
  String get blockedTitle => 'Blocați';

  @override
  String get blockedSubtitle => 'Nu vezi poze de la aceste persoane.';

  @override
  String get blockedNone => 'Nu ai blocat pe nimeni.';

  @override
  String get unblockShort => 'Deblochează';

  @override
  String get groupGone => 'Acest grup nu mai există sau nu mai ești membru.';

  @override
  String photosSavedToAlbum(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de poze salvate în „$album”',
      few: '$count poze salvate în „$album”',
      one: '$count poză salvată în „$album”',
    );
    return '$_temp0';
  }

  @override
  String photosDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de poze șterse',
      few: '$count poze șterse',
      one: '$count poză ștearsă',
    );
    return '$_temp0';
  }

  @override
  String photosDeletedSkipped(int count, int skipped) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de poze șterse',
      few: '$count poze șterse',
      one: '$count poză ștearsă',
    );
    return '$_temp0, $skipped omise';
  }

  @override
  String photosHiddenForYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de poze ascunse pentru tine',
      few: '$count poze ascunse pentru tine',
      one: '$count poză ascunsă pentru tine',
    );
    return '$_temp0';
  }

  @override
  String get addedToFavorites => 'Adăugată la favorite';

  @override
  String get removedFromFavorites => 'Scoasă din favorite';

  @override
  String get photoAccessSettings => 'Dă-i lui CamTrip acces la poze în Setări';

  @override
  String photosBeingAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Se adaugă $count de poze',
      few: 'Se adaugă $count poze',
      one: 'Se adaugă $count poză',
    );
    return '$_temp0';
  }

  @override
  String photosUnreadable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de poze n-au putut fi citite',
      few: '$count poze n-au putut fi citite',
      one: '$count poză n-a putut fi citită',
    );
    return '$_temp0';
  }

  @override
  String get groupNotLoaded => 'Grupul nu s-a încărcat';

  @override
  String get noFavoritesTitle => 'Încă nicio favorită';

  @override
  String get noPhotosTitle => 'Încă nicio poză';

  @override
  String get noFavoritesMessage =>
      'Atinge steaua de pe o poză ca s-o pui aici.';

  @override
  String get noPhotosMessage => 'Fă prima poză. Toți din grup o văd imediat.';

  @override
  String get openCamera => 'Deschide camera';

  @override
  String savingProgress(int done, int total) {
    return 'Se salvează... $done/$total';
  }

  @override
  String get sharePreparing => 'Se pregătește...';

  @override
  String sharingProgress(int done, int total) {
    return 'Se pregătește... $done/$total';
  }

  @override
  String get choosePhotos => 'Alege poze';

  @override
  String selectedCount(int count) {
    return '$count selectate';
  }

  @override
  String get selectNone => 'Deselectează tot';

  @override
  String get selectAll => 'Selectează tot';

  @override
  String photosWaitingToShare(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de poze așteaptă să fie distribuite',
      few: '$count poze așteaptă să fie distribuite',
      one: '$count poză așteaptă să fie distribuită',
    );
    return '$_temp0';
  }

  @override
  String get recapReadyTitle => 'Recapul tău e gata';

  @override
  String get recapReadySubtitle => 'Un video cu muzică din călătoria ta';

  @override
  String get watch => 'Vezi';

  @override
  String get makeRecapNow => 'Fă acum un video recap';

  @override
  String freeGroupDeleteNotice(String date) {
    return 'Grup gratuit: pozele se păstrează până pe $date. Salvează-le sau ia Pro.';
  }

  @override
  String get filterAll => 'Toate';

  @override
  String get filterFavorites => 'Favorite';

  @override
  String get filterPerPerson => 'Pe persoană';

  @override
  String get filterPerson => 'Persoană';

  @override
  String get select => 'Selectează';

  @override
  String get hiddenFilter => 'Ascunse';

  @override
  String get photosBy => 'Poze de la...';

  @override
  String get uploadedTag => 'încărcat';

  @override
  String get saveAll => 'Salvează tot';

  @override
  String get favorite => 'Favorită';

  @override
  String get unfavorite => 'Scoate din favorite';

  @override
  String get hide => 'Ascunde';

  @override
  String get delete => 'Șterge';

  @override
  String deletePhotosTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ștergi $count de poze?',
      few: 'Ștergi $count poze?',
      one: 'Ștergi poza?',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Dispar pentru toți din grup. Acest lucru nu poate fi anulat.',
      one: 'Dispare pentru toți din grup. Acest lucru nu poate fi anulat.',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosNotAllowed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count de poze sunt ale altcuiva. Rămân; doar un admin le poate șterge.',
      few:
          '$count poze sunt ale altcuiva. Rămân; doar un admin le poate șterge.',
      one: '$count poză e a altcuiva. Rămâne; doar un admin o poate șterge.',
    );
    return '$_temp0';
  }

  @override
  String photosBackInGroup(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de poze sunt din nou în grup',
      few: '$count poze sunt din nou în grup',
      one: '$count poză e din nou în grup',
    );
    return '$_temp0';
  }

  @override
  String get showAll => 'Arată tot';

  @override
  String get hiddenPhotosExplainer =>
      'Doar tu nu mai vezi aceste poze. Pentru ceilalți din grup sunt încă acolo.';

  @override
  String get nothingHidden => 'Nimic ascuns';

  @override
  String get nothingHiddenMessage => 'Pozele pe care le ascunzi apar aici.';

  @override
  String showAgainCount(int count) {
    return 'Arată din nou ($count)';
  }

  @override
  String get someone => 'Cineva';

  @override
  String get savedToAlbum => 'Salvată în albumul foto';

  @override
  String get share => 'Distribuie';

  @override
  String get shareFailed => 'Distribuirea n-a mers';

  @override
  String get reportTitle => 'De ce raportezi această poză?';

  @override
  String get reportSubtitle =>
      'Verificăm fiecare raportare în 24 de ore. Poza se ascunde imediat pentru tine.';

  @override
  String get reportThanks => 'Mulțumim, ne uităm';

  @override
  String blockMessageAllGroups(String name) {
    return 'Nu vei mai vedea poze și videoclipuri de la $name în niciun grup și nu vei mai primi notificări despre ele. Poți anula asta în Setări.';
  }

  @override
  String userBlocked(String name) {
    return '$name a fost blocat';
  }

  @override
  String get videoHiddenForYou => 'Video ascuns pentru tine';

  @override
  String get photoHiddenForYou => 'Poză ascunsă pentru tine';

  @override
  String get setAsCover => 'Setează ca copertă';

  @override
  String get coverUpdated => 'Coperta a fost actualizată';

  @override
  String get hideForMe => 'Ascunde pentru mine';

  @override
  String get hideForMeSubtitle => 'Ceilalți din grup o văd în continuare';

  @override
  String get reportPhoto => 'Raportează poza';

  @override
  String blockName(String name) {
    return 'Blochează pe $name';
  }

  @override
  String get forEveryoneInGroup => 'Pentru toți din grup';

  @override
  String get videoDeleted => 'Video șters';

  @override
  String get photoDeleted => 'Poză ștearsă';

  @override
  String get photoAccessToSave =>
      'Dă-i lui CamTrip acces la poze în Setări ca să le poți salva';

  @override
  String get phoneFull => 'Telefonul tău e plin';

  @override
  String get albumSaveFailedShort => 'Salvarea în album n-a mers';

  @override
  String get recapTemplateGoldenHour => 'Golden Hour';

  @override
  String get recapTemplateFast => 'Rapid';

  @override
  String get recapTemplateFilmRoll => 'Rolă de film';

  @override
  String get recapTemplatePolaroid => 'Polaroid';

  @override
  String get trackSummerEvening => 'Seară de vară';

  @override
  String get trackGoldenHour => 'Golden Hour';

  @override
  String get trackRoadtrip => 'Road Trip';

  @override
  String get moodWarm => 'cald';

  @override
  String get moodCheerful => 'vesel';

  @override
  String friendsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de prieteni',
      few: '$count prieteni',
      one: '$count prieten',
    );
    return '$_temp0';
  }

  @override
  String get madeWithCamTrip => 'Făcut cu CamTrip';

  @override
  String get tagline => 'Un singur film pentru tot grupul';

  @override
  String get videoUnsupportedDevice =>
      'Crearea videoclipului n-a mers pe acest dispozitiv';

  @override
  String get groupLoadFailed => 'Grupul n-a putut fi încărcat.';

  @override
  String recapNeedsPhotos(int count) {
    return 'Ai nevoie de cel puțin $count poze pentru un recap.';
  }

  @override
  String get recapFailed => 'Crearea recapului n-a mers. Încearcă din nou.';

  @override
  String get recapSaved => 'Recapul a fost salvat în albumul foto';

  @override
  String get recap => 'Recap';

  @override
  String get recapRendering => 'Se creează recapul...';

  @override
  String get videoRendering => 'Se creează videoclipul...';

  @override
  String get template => 'Șablon';

  @override
  String get musicLicense => 'Muzică proprie CamTrip · fără drepturi de autor';

  @override
  String get change => 'Schimbă';

  @override
  String get noWatermark => 'Fără filigran ✓';

  @override
  String get removeWatermarkPro => 'Scoate filigranul cu Pro';

  @override
  String get proSourceSubscription => 'Abonament';

  @override
  String get proSourceGift => 'Cadou';

  @override
  String get proSourceAdmin => 'Admin';

  @override
  String get proSourceGroup => 'Prin grup';

  @override
  String get noPro => 'Fără Pro';

  @override
  String proStatusNoEnd(String source) {
    return 'Pro ($source), fără dată de sfârșit';
  }

  @override
  String proStatusUntil(String source, String date) {
    return 'Pro ($source), până pe $date';
  }

  @override
  String get lifetime => 'Pe viață';

  @override
  String get pickDate => 'Alege o dată';

  @override
  String get noAccess => 'Fără acces';

  @override
  String get adminOnlyTeam => 'Administrarea e doar pentru echipa CamTrip.';

  @override
  String get adminOverview => 'Prezentare';

  @override
  String get adminUsers => 'Utilizatori';

  @override
  String get adminReports => 'Raportări';

  @override
  String adminsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de admini',
      few: '$count admini',
      one: '$count admin',
    );
    return '$_temp0';
  }

  @override
  String get adminNewThisWeek => 'Noi săptămâna asta';

  @override
  String get adminGroups => 'Grupuri';

  @override
  String get adminProSubscription => 'Pro prin abonament';

  @override
  String get adminProGift => 'Pro cadou';

  @override
  String adminWithoutSubscription(int count) {
    return '$count fără abonament';
  }

  @override
  String get adminOpenReports => 'Raportări deschise';

  @override
  String get adminSearchHint => 'Caută după nume sau e-mail';

  @override
  String get nobodyFound => 'N-a fost găsit nimeni';

  @override
  String get loadMore => 'Încarcă mai mult';

  @override
  String get noEmail => 'Fără e-mail';

  @override
  String adminDeletePhotoMessage(String groupName) {
    return 'Poza dispare pentru toți din „$groupName”. Toate raportările pentru această poză se rezolvă.';
  }

  @override
  String get adminBanMessage =>
      'Acest cont nu se mai poate conecta și nu mai poate folosi aplicația. Poți anula asta mai târziu.';

  @override
  String get adminDismissTitle => 'Respingi raportarea?';

  @override
  String get adminDismissMessage =>
      'Poza rămâne. Raportarea e marcată ca rezolvată.';

  @override
  String get adminDismiss => 'Respinge';

  @override
  String get adminAccountBlocked => 'Cont blocat';

  @override
  String get adminReportDismissed => 'Raportare respinsă';

  @override
  String get adminNoReports => 'Nicio raportare deschisă';

  @override
  String get adminNoReportsMessage => 'Pozele raportate apar aici.';

  @override
  String get deletedTag => 'Șters';

  @override
  String adminReportedBy(String name) {
    return 'De $name';
  }

  @override
  String adminPhotoBy(String name) {
    return 'Poză de $name';
  }

  @override
  String reportsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de raportări',
      few: '$count raportări',
      one: '$count raportare',
    );
    return '$_temp0';
  }

  @override
  String get adminDeletePhoto => 'Șterge poza';

  @override
  String get adminBlockCreator => 'Blochează autorul';

  @override
  String get loadFailed => 'Încărcarea n-a mers';

  @override
  String get adminLifetimeProGiven => 'Pro pe viață acordat';

  @override
  String get adminProGiven => 'Pro acordat';

  @override
  String adminGiveProUntil(String date) {
    return 'Acordă Pro până pe $date';
  }

  @override
  String get adminGiveProLifetime => 'Acordă Pro pe viață';

  @override
  String adminGiveProFor(String period) {
    return 'Acordă Pro pentru $period';
  }

  @override
  String get adminReasonHint => 'Motiv, de ex. prieten, tester, influencer';

  @override
  String get adminGivePro => 'Acordă Pro';

  @override
  String get adminRevokeTitle => 'Retragi cadoul?';

  @override
  String get adminRevokeMessage =>
      'Pro-ul cadou se oprește imediat. Abonamentul propriu continuă.';

  @override
  String get adminRevoke => 'Retrage';

  @override
  String get adminGiftRevoked => 'Cadou retras';

  @override
  String get adminUnbanTitle => 'Ridici blocarea?';

  @override
  String adminUnbanMessage(String name) {
    return '$name se poate conecta din nou.';
  }

  @override
  String get adminUnbanned => 'Blocare ridicată';

  @override
  String get adminBanUserMessage =>
      'Acest cont nu se mai poate conecta și nu mai poate folosi aplicația. Pozele rămân.';

  @override
  String get adminUser => 'Utilizator';

  @override
  String get adminNotVerified => 'neverificat';

  @override
  String get adminRole => 'Rol';

  @override
  String get adminCreated => 'Creat';

  @override
  String get unknown => 'Necunoscut';

  @override
  String get adminSignInWith => 'Se conectează cu';

  @override
  String get adminEmailMethod => 'E-mail';

  @override
  String get adminPhotosAndVideos => 'Poze și videoclipuri';

  @override
  String get adminStatus => 'Stare';

  @override
  String get adminActive => 'Activ';

  @override
  String adminActiveUntil(String date) {
    return 'Activ până pe $date';
  }

  @override
  String adminGiftFrom(String name) {
    return 'Cadou de la $name';
  }

  @override
  String adminExpiredOn(String date) {
    return 'A expirat pe $date';
  }

  @override
  String get adminExpired => 'Expirat';

  @override
  String adminUntil(String date) {
    return 'Până pe $date';
  }

  @override
  String get adminGiveProTitle => 'Acordă Pro';

  @override
  String get adminGiveProNote =>
      'Funcționează și pentru grupurile acestei persoane: un Pro în grup = Pro pentru toți din acel grup.';

  @override
  String get adminRevokeGift => 'Retrage cadoul';

  @override
  String get adminModeration => 'Moderare';

  @override
  String get adminCannotBanSelf => 'Nu te poți bloca pe tine.';

  @override
  String get adminCannotBanAdmin => 'Un admin nu poate fi blocat.';

  @override
  String get adminUnban => 'Ridică blocarea';

  @override
  String get adminBanAccount => 'Blochează contul';

  @override
  String get googleSignInUnavailable =>
      'Conectarea cu Google nu e încă disponibilă';

  @override
  String get cameraPickerTitle => 'Alege-ți camera';

  @override
  String get cameraPickerSubtitle =>
      'Fiecare cameră le dă pozelor un aspect propriu';

  @override
  String get cameraPickerChange => 'Schimbă camera';

  @override
  String get cameraPickerUnlock => 'Deblochează cu Pro';

  @override
  String get cameraPickerSelected => 'Selectată';

  @override
  String get cameraPickerStyleSummer => 'Vară';

  @override
  String get cameraPickerStyleSummerDescription =>
      'Culori calde, decolorate, ca un instantaneu din anii \'90';

  @override
  String get cameraPickerStyleNight => 'Noapte 800';

  @override
  String get cameraPickerStyleNightDescription =>
      'Film de cinema: umbre turcoaz, lumină caldă, multă granulație';

  @override
  String get cameraPickerStyleSepia => 'Sepia';

  @override
  String get cameraPickerStyleSepiaDescription =>
      'O poză veche, maronie, din cutia de pantofi';

  @override
  String get cameraPickerStyleLomo => 'Lomo';

  @override
  String get cameraPickerStyleLomoDescription =>
      'Culori puternice, colțuri întunecate și o tentă de culoare nebună';

  @override
  String get cameraPickerStyleMint => 'Mentă';

  @override
  String get cameraPickerStyleMintDescription =>
      'Blând și proaspăt, cu o tentă verde';

  @override
  String get cameraPickerStylePastel => 'Roz';

  @override
  String get cameraPickerStylePastelDescription =>
      'Culori pastel cu o strălucire roz și o margine albă';

  @override
  String get cameraPickerStyleSuper8 => 'Super 8';

  @override
  String get cameraPickerStyleSuper8Description =>
      'Granulat și blând, ca un film vechi de familie';

  @override
  String get paywallBenefitGroup => 'Un Pro = Pro pentru tot grupul';

  @override
  String get paywallBenefitUnlimited =>
      'Membri nelimitați, pozele se păstrează pentru totdeauna';

  @override
  String get paywallBenefitQuality => 'Fără filigran, calitate originală';

  @override
  String paywallFreeTrial(String period) {
    return '$period gratuit';
  }

  @override
  String paywallPriceYear(String price) {
    return '$price pe an.';
  }

  @override
  String paywallPriceYearTrial(String period, String price) {
    return '$period gratuit, apoi $price pe an.';
  }

  @override
  String paywallPriceMonth(String price) {
    return '$price pe lună.';
  }

  @override
  String paywallPriceMonthTrial(String period, String price) {
    return '$period gratuit, apoi $price pe lună.';
  }

  @override
  String paywallAutoRenew(String store) {
    return 'Se reînnoiește automat. Anulează cu cel puțin 24 de ore înainte de reînnoire în $store.';
  }

  @override
  String get paywallDetailsTitle => 'Tot ce include Pro';

  @override
  String get paywallBenefitStyles => 'Toate stilurile de cameră';

  @override
  String get allPhotosTitle => 'Toate pozele';

  @override
  String get homeTabAlbums => 'Albume';

  @override
  String get allPhotosEmptyTitle => 'Încă nicio poză';

  @override
  String get allPhotosEmptyMessage => 'Deschide camera și fă prima poză.';

  @override
  String get allPhotosLoadFailed => 'Pozele tale n-au putut fi încărcate';

  @override
  String get cameraSettingsTitle => 'Setări cameră';

  @override
  String get cameraSettingsMore => 'Mai multe setări';

  @override
  String get cameraSettingsGrid => 'Grilă';

  @override
  String get cameraSettingsHaptics => 'Vibrație la fotografiere';

  @override
  String get cameraSettingsDateStamp => 'Dată în dreapta jos';

  @override
  String get cameraSettingsSound => 'Sunet declanșator';

  @override
  String get cameraSettingsSoundHint =>
      'Fără sunet când telefonul e pe silențios';

  @override
  String get cameraSettingsTimer => 'Temporizator';

  @override
  String get cameraSettingsTimerOff => 'Oprit';

  @override
  String cameraSettingsTimerSeconds(int seconds) {
    return '$seconds s';
  }

  @override
  String get cameraSettingsTimerCancelHint =>
      'Atinge declanșatorul ca să anulezi';

  @override
  String get cameraSettingsMirror => 'Selfie-uri în oglindă';

  @override
  String get cameraSettingsSaveToRoll => 'Salvează în galerie';

  @override
  String get cameraSettingsQuality => 'Calitate';

  @override
  String get cameraSettingsQualityStandard => 'Standard';

  @override
  String get cameraSettingsQualityHigh => 'Ridicată';

  @override
  String get cameraLowLightHint => 'Lumină slabă - pornește blițul';

  @override
  String get cameraFlashUnavailable => 'Această cameră nu are bliț';

  @override
  String get cameraFlashScreen => 'Bliț pe ecran';

  @override
  String get cameraFlashCycleHint =>
      'Atinge ca să comuți între oprit, pornit și auto';

  @override
  String get cameraFlip => 'Comută între camera frontală și cea din spate';

  @override
  String get cameraFlipHint =>
      'Atinge de două ori vizorul ca să întorci camera';

  @override
  String cameraPickerPaywallStyles(int count, String styles) {
    return 'Toate cele $count camere, inclusiv $styles';
  }

  @override
  String get styleFlash => 'Bliț 400';

  @override
  String get styleFlashDescription =>
      'Bliț direct pe film cald: strălucire chihlimbarie, granulație, roșuri bogate';

  @override
  String cameraTimerButton(String state) {
    return 'Temporizator: $state';
  }

  @override
  String get cameraTimerCycleHint =>
      'Atinge ca să comuți între oprit, 3 s și 10 s';

  @override
  String get cameraLastShotOpen => 'Ultima poză, deschide albumul';

  @override
  String get cameraLastShotEmpty => 'Încă nicio poză, deschide albumul';

  @override
  String get deleteOnlyOwnOrAdmin =>
      'Doar cine a făcut-o sau un admin o poate șterge';

  @override
  String get videoPlay => 'Redă';

  @override
  String get videoPause => 'Pauză';

  @override
  String get language => 'Limbă';

  @override
  String get languageSystem => 'Limba sistemului';

  @override
  String languageSystemCurrent(String language) {
    return 'Sistem ($language)';
  }

  @override
  String get languageSearchHint => 'Caută o limbă';

  @override
  String get languageNoResults => 'Nicio limbă găsită';

  @override
  String get personalRollTitle => 'Rola mea';

  @override
  String get personalRollSubtitle => 'Doar pentru tine';

  @override
  String get personalRollPickerSubtitle => 'Poze separate, doar pentru tine';

  @override
  String get personalRollMove => 'În album';

  @override
  String get personalRollMoveTitle => 'Mută în album';

  @override
  String get personalRollMoveNoAlbums =>
      'Creează mai întâi un album sau alătură-te unuia cu un cod.';

  @override
  String personalRollMoved(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count poze mutate în $album',
      one: '1 poză mutată în $album',
    );
    return '$_temp0';
  }

  @override
  String get personalRollPrivateNote =>
      'Doar tu vezi aceste poze. Mută-le într-un album ca să le partajezi.';

  @override
  String get paywallTripPassSub => 'Doar această călătorie, pentru tot grupul';

  @override
  String get paywallOneTime => 'o singură dată';

  @override
  String get paywallBestValue => 'Cel mai avantajos';

  @override
  String paywallRollFullTitle(int used, int limit) {
    return 'Filmul tău e plin - $used/$limit poze';
  }

  @override
  String get paywallRollFullSub =>
      'Fotografiază în continuare cu Trip Pass sau Pro.';

  @override
  String get paywallCameraTitle => 'Această cameră face parte din Pro';

  @override
  String paywallCameraSub(int count) {
    return 'Deblochează toate cele $count camere.';
  }

  @override
  String get paywallWatermarkTitle => 'Recap fără filigran';

  @override
  String get paywallWatermarkSub => 'Distribuie recapul fără logo CamTrip.';

  @override
  String get paywallDeletionTitle => 'Păstrează-ți călătoria';

  @override
  String paywallDeletionSub(String date) {
    return 'Călătoriile gratuite se șterg pe $date. Cu Trip Pass sau Pro rămâne pentru totdeauna.';
  }

  @override
  String paywallTripPassTerms(String price) {
    return 'Achiziție unică de $price pentru această călătorie. Nu e abonament.';
  }

  @override
  String get buyTripPass => 'Cumpără Trip Pass';

  @override
  String get tripPassActive => 'Trip Pass activ: călătoria e Pro pentru toți';

  @override
  String get tripPassActivating =>
      'Plata a fost primită. Trip Pass va fi activ imediat.';

  @override
  String proViaTripPass(String name) {
    return 'Trip Pass de la $name';
  }

  @override
  String rollCounterSemantics(int used, int limit) {
    return '$used din $limit cadre pe filmul tău';
  }

  @override
  String rollHeldTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count poze nu mai încap pe film',
      one: '1 poză nu mai încape pe film',
    );
    return '$_temp0';
  }

  @override
  String get rollHeldBody => 'Păstrează-le cu Pro sau Trip Pass';

  @override
  String deletionBannerTitle(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Păstrează-ți călătoria - mai sunt $days zile',
      one: 'Păstrează-ți călătoria - mai e 1 zi',
    );
    return '$_temp0';
  }

  @override
  String get deletionBannerBody =>
      'Călătoriile gratuite se șterg la 30 de zile după final. Cu Trip Pass sau Pro rămâne pentru totdeauna.';

  @override
  String apiRollFull(int limit) {
    return 'Filmul tău e plin ($limit cadre). Ia Trip Pass sau Pro ca să continui.';
  }

  @override
  String get apiTripPassFailed =>
      'Trip Pass nu a putut fi activat. Scrie la support@camtrip.app.';

  @override
  String get apiTripPassExists => 'Această călătorie are deja Trip Pass.';

  @override
  String get tripPassUnavailable =>
      'Trip Pass nu este disponibil acum. Încearcă mai târziu.';

  @override
  String get tripMapTitle => 'Harta călătoriei';

  @override
  String get tripMapOpen => 'Hartă și statistici';

  @override
  String get tripMapLoadFailed => 'Harta nu a putut fi încărcată';

  @override
  String get tripMapStatDays => 'Zile';

  @override
  String get tripMapStatPhotos => 'Poze';

  @override
  String get tripMapStatVideos => 'Videoclipuri';

  @override
  String get tripMapStatMembers => 'Membri';

  @override
  String get tripMapStatDistance => 'km parcurși';

  @override
  String get tripMapStatCountries => 'Țări';

  @override
  String get tripMapStatPlaces => 'Locuri';

  @override
  String tripMapBusiestDay(String day, int count) {
    return 'Cele mai multe poze: $day ($count)';
  }

  @override
  String tripMapTopPhotographer(String name, int count) {
    return 'Fotograful de top: $name ($count)';
  }

  @override
  String get tripMapOffTitle => 'Harta călătoriei este oprită';

  @override
  String get tripMapOffMessage =>
      'Un admin poate porni harta din setările grupului. Statisticile le vezi mereu.';

  @override
  String get tripMapOffMessageAdmin =>
      'Pornește harta ca să vedeți unde ați făcut pozele. Fiecare decide singur dacă participă.';

  @override
  String get tripMapEnable => 'Pornește harta';

  @override
  String get tripMapEmptyTitle => 'Încă nu sunt locuri pe hartă';

  @override
  String get tripMapEmptyMessage =>
      'Pozele noi ale membrilor care își partajează locația apar aici, rotunjite la aproximativ 100 m.';

  @override
  String get tripMapConsentTitle => 'Harta călătoriei';

  @override
  String get tripMapConsentQuestion =>
      'Arăți pe harta acestui grup unde ai făcut pozele?';

  @override
  String get tripMapConsentDetail =>
      'Doar membrii grupului văd asta, rotunjit la aproximativ 100 m. Locația nu este pusă niciodată în poză și o poți opri oricând din setările grupului.';

  @override
  String get tripMapConsentYes => 'Da, partajează';

  @override
  String get tripMapConsentNo => 'Nu';

  @override
  String get tripMapLocationDenied =>
      'Nu există acces la locația ta. O poți permite din setările telefonului.';

  @override
  String get tripMapSettingSubtitle =>
      'Arată pe o hartă unde au fost făcute pozele. Membrii decid singuri dacă partajează.';

  @override
  String get tripMapDisableTitle => 'Oprești harta?';

  @override
  String get tripMapDisableMessage =>
      'Toate locațiile din acest grup sunt șterse. Dacă pornești harta din nou, îi întrebăm din nou pe toți.';

  @override
  String get tripMapDisable => 'Oprește';

  @override
  String get tripMapMySharing => 'Partajează locația mea';

  @override
  String get tripMapMySharingOn =>
      'Pozele tale noi apar pe hartă (rotunjite la aproximativ 100 m).';

  @override
  String get tripMapMySharingOff => 'Oprit. Pozele tale nu apar pe hartă.';

  @override
  String get tripMapStopSharingTitle => 'Nu mai partajezi locația?';

  @override
  String get tripMapStopSharingMessage =>
      'Locațiile tuturor pozelor tale din acest grup sunt șterse.';

  @override
  String get tripMapStopSharing => 'Oprește partajarea';
}
