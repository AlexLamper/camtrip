// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Lithuanian (`lt`).
class AppLocalizationsLt extends AppLocalizations {
  AppLocalizationsLt([String locale = 'lt']) : super(locale);

  @override
  String get cancel => 'Atšaukti';

  @override
  String get yes => 'Taip';

  @override
  String inviteMessageIntro(String groupName) {
    return 'Prisijungsi prie „$groupName“ programėlėje CamTrip? Tada iškart matysime vieni kitų nuotraukas.';
  }

  @override
  String inviteMessageCode(String code) {
    return 'Arba įvesk kodą: $code';
  }

  @override
  String get memberFallbackName => 'Draugas';

  @override
  String get reportReasonInappropriate => 'Netinkama arba įžeidu';

  @override
  String get reportReasonSpam => 'Šlamštas';

  @override
  String get reportReasonOther => 'Kita';

  @override
  String dateRangeSameMonth(
    String startDay,
    String endDay,
    String month,
    String monthNum,
    String endDate,
  ) {
    return '$month $startDay-$endDay d.';
  }

  @override
  String get errorOffline => 'Nėra ryšio. Pabandyk dar kartą po akimirkos.';

  @override
  String errorSomethingWrongStatus(int status) {
    return 'Kažkas nepavyko ($status)';
  }

  @override
  String get errorSomethingWrong => 'Kažkas nepavyko';

  @override
  String get apiInvalidCredentials =>
      'Neteisingas el. pašto adresas arba slaptažodis';

  @override
  String get apiInvalidCode =>
      'Kodas neteisingas arba nebegalioja. Paprašyk naujo kodo.';

  @override
  String get apiEmailTaken =>
      'Paskyra su šiuo el. pašto adresu jau yra. Prisijunk arba pasirink „Pamiršai slaptažodį?“.';

  @override
  String apiEmailTakenProvider(String provider) {
    return 'Paskyra su šiuo el. pašto adresu jau yra. Prisijunk per $provider.';
  }

  @override
  String apiWeakPassword(int min) {
    return 'Pasirink bent $min simbolių slaptažodį';
  }

  @override
  String apiNameTooLong(int max) {
    return 'Vardas gali būti ne ilgesnis nei $max simbolių';
  }

  @override
  String get apiRateLimited =>
      'Per daug bandymų. Pabandyk dar kartą po 15 minučių.';

  @override
  String apiAccountBanned(String email) {
    return 'Tavo paskyra užblokuota. Parašyk $email, jei manai, kad tai klaida.';
  }

  @override
  String get apiProRequired => 'Šis kameros stilius yra CamTrip Pro dalis';

  @override
  String get apiGroupClosed => 'Ši grupė uždaryta';

  @override
  String get apiGroupCodeNotFound => 'Grupės su šiuo kodu nerasta';

  @override
  String apiGroupFull(int max) {
    return 'Grupė pilna (daugiausia $max narių). Jei vienas narys turi CamTrip Pro, prisijungti gali bet kas.';
  }

  @override
  String get apiLastMember => 'Esi paskutinis narys. Geriau ištrink grupę.';

  @override
  String get apiAdminRequired => 'Tik CamTrip administratoriams';

  @override
  String get apiUploadIncomplete => 'Įkėlimas nebaigtas';

  @override
  String get apiInvalidInput => 'Netinkami duomenys';

  @override
  String get apiNotSignedIn => 'Neprisijungta';

  @override
  String get apiAccountGone => 'Šios paskyros nebėra';

  @override
  String get apiPhotoNotFound => 'Nuotrauka nerasta';

  @override
  String get apiGroupNotFound => 'Grupė nerasta';

  @override
  String get apiMemberNotFound => 'Narys nerastas';

  @override
  String get apiPersonNotFound => 'Asmuo nerastas';

  @override
  String get apiUserNotFound => 'Naudotojas nerastas';

  @override
  String get apiAdminOnly => 'Tai gali padaryti tik administratorius';

  @override
  String get apiCannotBlockSelf => 'Negali užblokuoti savęs';

  @override
  String get apiCannotReportOwn => 'Negali pranešti apie savo nuotrauką';

  @override
  String get apiDeleteOwnOnly => 'Gali trinti tik savo nuotraukas';

  @override
  String get apiOwnerCannotBeRemoved => 'Grupės kūrėjo pašalinti negalima';

  @override
  String get apiOwnerStaysAdmin => 'Kūrėjas visada lieka administratoriumi';

  @override
  String get apiNeedsOneAdmin =>
      'Grupėje turi būti bent vienas administratorius';

  @override
  String get apiEndBeforeStart =>
      'Pabaigos data yra ankstesnė už pradžios datą';

  @override
  String get apiPermanentNoEndDate =>
      'Visada atvira grupė neturi pabaigos datos';

  @override
  String get apiCannotBanAdmin => 'Administratoriaus užblokuoti negalima';

  @override
  String get apiReportNotFound => 'Pranešimas nerastas';

  @override
  String get apiPhotoOwnerUnknown => 'Šios nuotraukos autorius nebežinomas';

  @override
  String get validationNameRequired => 'Įvesk savo vardą';

  @override
  String validationMaxChars(int max) {
    return 'Daugiausia $max simbolių';
  }

  @override
  String get validationEmailRequired => 'Įvesk el. pašto adresą';

  @override
  String get validationEmailInvalid => 'Šis el. pašto adresas netinkamas';

  @override
  String get validationPasswordRequired => 'Pasirink slaptažodį';

  @override
  String validationMinChars(int min) {
    return 'Bent $min simbolių';
  }

  @override
  String get validationPasswordTooLong => 'Slaptažodis per ilgas';

  @override
  String get validationPasswordEmpty => 'Įvesk slaptažodį';

  @override
  String get validationCodeRequired => 'Įvesk kodą iš el. laiško';

  @override
  String get validationCodeDigits => 'Kodą sudaro 6 skaitmenys';

  @override
  String get onboarding1Title => 'Viena juosta\nvisai kompanijai.';

  @override
  String get onboarding1Body =>
      'Fotografuok retro kamera. Visi iškart mato tavo nuotraukas, o jos iškart atsiduria ir tavo albume.';

  @override
  String get onboarding2Title => 'Užteks\nsiuntinėti nuotraukas.';

  @override
  String get onboarding2Body =>
      'Sukurk grupę, pasidalyk kodu, ir viskas. Daugiau jokių „atsiųsi man tas nuotraukas?“';

  @override
  String get onboarding3Title => 'Vaizdo apžvalga\npo kelionės.';

  @override
  String get onboarding3Body =>
      'CamTrip sukuria vaizdo įrašą su muzika iš geriausių jūsų bendrų akimirkų.';

  @override
  String get onboardingInvited => 'Tave pakvietė! Prisijunk, kad įsitrauktum.';

  @override
  String get signInAppleFailed => 'Nepavyko prisijungti per Apple';

  @override
  String get signInGoogleFailed => 'Nepavyko prisijungti per Google';

  @override
  String get signInFailed => 'Nepavyko prisijungti';

  @override
  String get next => 'Toliau';

  @override
  String get legalPrefix => 'Tęsdamas sutinki su';

  @override
  String get legalTerms => 'sąlygomis';

  @override
  String get legalAnd => ' ir';

  @override
  String get legalPrivacy => 'privatumo politika';

  @override
  String get legalSuffix => '.';

  @override
  String get continueWithApple => 'Tęsti su Apple';

  @override
  String get continueWithGoogle => 'Tęsti su Google';

  @override
  String get createAccount => 'Sukurti paskyrą';

  @override
  String get signIn => 'Prisijungti';

  @override
  String get or => 'arba';

  @override
  String get registerSubtitle => 'Kad draugai matytų, kas darė nuotraukas.';

  @override
  String get loginSubtitle => 'Sveikas sugrįžęs.';

  @override
  String get forgotPasswordTitle => 'Pamirštas slaptažodis';

  @override
  String get forgotPasswordPushSubtitle =>
      'Dar esi kur nors prisijungęs? Ten atsiųsime 6 skaitmenų kodą kaip „push“ pranešimą, kad galėtum nustatyti naują slaptažodį.';

  @override
  String get newPassword => 'Naujas slaptažodis';

  @override
  String get resetPushInfo =>
      'Jei dar esi kur nors prisijungęs, ten gausi „push“ pranešimą su kodu. Nepavyksta prisijungti? Prisijunk per Apple ar Google tuo pačiu el. pašto adresu - paskyra bus susieta.';

  @override
  String get sendCode => 'Siųsti kodą';

  @override
  String get savePassword => 'Išsaugoti slaptažodį';

  @override
  String get errorTryAgain => 'Kažkas nepavyko. Pabandyk dar kartą.';

  @override
  String get back => 'Atgal';

  @override
  String get name => 'Vardas';

  @override
  String get email => 'El. pašto adresas';

  @override
  String get codeFromPush => 'Kodas iš pranešimo';

  @override
  String get password => 'Slaptažodis';

  @override
  String get hidePassword => 'Slėpti slaptažodį';

  @override
  String get showPassword => 'Rodyti slaptažodį';

  @override
  String get forgotPasswordLink => 'Pamiršai slaptažodį?';

  @override
  String get haveAccount => 'Jau turi paskyrą?';

  @override
  String get newToCamTrip => 'Naujas CamTrip?';

  @override
  String get rememberedIt => 'Prisiminei?';

  @override
  String get noCodeReceived => 'Negavai kodo?';

  @override
  String get resendCode => 'Siųsti dar kartą';

  @override
  String onboardingDemoRoll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotografų, 1 juosta',
      many: '$count fotografo, 1 juosta',
      few: '$count fotografai, 1 juosta',
      one: '$count fotografas, 1 juosta',
    );
    return '$_temp0';
  }

  @override
  String membersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count narių',
      many: '$count nario',
      few: '$count nariai',
      one: '$count narys',
    );
    return '$_temp0';
  }

  @override
  String photosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nuotraukų',
      many: '$count nuotraukos',
      few: '$count nuotraukos',
      one: '$count nuotrauka',
    );
    return '$_temp0';
  }

  @override
  String videosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count vaizdo įrašų',
      many: '$count vaizdo įrašo',
      few: '$count vaizdo įrašai',
      one: '$count vaizdo įrašas',
    );
    return '$_temp0';
  }

  @override
  String get justNow => 'dabar';

  @override
  String get badgeNew => 'Nauja';

  @override
  String recapTitle(String groupName) {
    return 'Apžvalga: $groupName';
  }

  @override
  String get styleFilm => 'Film';

  @override
  String get styleInstant => 'Instant';

  @override
  String get styleDisposable => 'Vienkartinė';

  @override
  String get styleBw => 'N/B';

  @override
  String get styleGolden => 'Golden';

  @override
  String get styleChrome => 'Chrome';

  @override
  String get styleFilmDescription =>
      'Šiltos spalvos, grūdėtumas ir oranžinė data';

  @override
  String get styleInstantDescription => 'Švelnios spalvos ir baltas rėmelis';

  @override
  String get styleDisposableDescription =>
      'Ryški blykstė, vinjetė ir šviesos nuotėkiai';

  @override
  String get styleBwDescription => 'Grūdėta nespalvota su gilia kontrastą';

  @override
  String get styleGoldenDescription =>
      'Visada auksinė valanda, švelnus auksinis švytėjimas';

  @override
  String get styleChromeDescription =>
      'Vėsi, sodri ir ryški, kaip skaidrių juosta';

  @override
  String get shutterStopRecording => 'Stabdyti įrašymą';

  @override
  String get shutterStartRecording => 'Pradėti vaizdo įrašymą';

  @override
  String get shutterTakePhoto => 'Fotografuoti';

  @override
  String get modePhoto => 'Nuotrauka';

  @override
  String get modeVideo => 'Vaizdo įrašas';

  @override
  String get cameraNotFound => 'Kamera nerasta';

  @override
  String get cameraAccessNeeded =>
      'CamTrip reikia prieigos prie kameros. Įjunk ją nustatymuose.';

  @override
  String get cameraStartFailed => 'Nepavyko paleisti kameros';

  @override
  String get albumAccessNeeded =>
      'Suteik CamTrip prieigą prie nuotraukų, kad jos būtų išsaugomos ir tavo albume';

  @override
  String get albumSaveFailed =>
      'Nepavyko išsaugoti albume. Nuotrauka vis tiek pasidalyta.';

  @override
  String styleProFallback(String style) {
    return 'Šis stilius yra Pro dalis. Šioje grupėje fotografuoji su $style.';
  }

  @override
  String get photoFailed => 'Nepavyko nufotografuoti. Pabandyk dar kartą.';

  @override
  String get recordingFailed => 'Nepavyko įrašyti vaizdo';

  @override
  String get videoFailed =>
      'Nepavyko sukurti vaizdo įrašo. Pabandyk dar kartą.';

  @override
  String get shootInGroup => 'Fotografuoti į grupę';

  @override
  String get close => 'Uždaryti';

  @override
  String get flash => 'Blykstė';

  @override
  String get flashOn => 'Įj.';

  @override
  String get flashOff => 'Išj.';

  @override
  String get flashAuto => 'Auto';

  @override
  String get chooseGroup => 'Pasirinkti grupę';

  @override
  String get switchCamera => 'Keisti kamerą';

  @override
  String get createOrJoinFirst =>
      'Pirmiausia sukurk grupę arba prisijunk prie jos';

  @override
  String get proViaGroup => 'Pro per grupę';

  @override
  String proViaName(String name) {
    return 'Pro per: $name';
  }

  @override
  String get proStylesFreeViaMember =>
      'Pro stiliai šioje grupėje tau nemokami dėl nario su Pro';

  @override
  String proStylesFreeViaName(String name) {
    return 'Pro stiliai šioje grupėje: tau nemokamai dėka $name';
  }

  @override
  String get subscriptionsUnavailable =>
      'Prenumeratos šiuo metu nepasiekiamos. Pabandyk vėliau.';

  @override
  String get paymentPending =>
      'Mokėjimas dar apdorojamas. Pro įsijungs, kai tik jis bus atliktas.';

  @override
  String get purchaseFailed => 'Pirkimas nepavyko. Pabandyk vėliau.';

  @override
  String get restoreUnavailable =>
      'Pirkimų atkurti dabar negalima. Pabandyk vėliau.';

  @override
  String get restoreFailed => 'Atkurti nepavyko. Pabandyk vėliau.';

  @override
  String get welcomePro => 'Sveiki atvykę į CamTrip Pro! 🎉';

  @override
  String get proRestored => 'Pro atkurtas';

  @override
  String get noPurchaseFound => 'Ankstesnių pirkimų nerasta';

  @override
  String periodDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dienų',
      many: '$count dienos',
      few: '$count dienos',
      one: '$count diena',
    );
    return '$_temp0';
  }

  @override
  String periodWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count savaičių',
      many: '$count savaitės',
      few: '$count savaitės',
      one: '$count savaitė',
    );
    return '$_temp0';
  }

  @override
  String periodMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mėnesių',
      many: '$count mėnesio',
      few: '$count mėnesiai',
      one: '$count mėnuo',
    );
    return '$_temp0';
  }

  @override
  String periodYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count metų',
      many: '$count metų',
      few: '$count metai',
      one: '$count metai',
    );
    return '$_temp0';
  }

  @override
  String get paywallHavePro => 'Turi CamTrip Pro';

  @override
  String get paywallSubtitle => 'Viskas kitai tavo kelionei.';

  @override
  String paywallFeatureStyles(String styles) {
    return 'Visi kameros stiliai ($styles)';
  }

  @override
  String get paywallFeatureUnlimited =>
      'Neriboti nariai ir vieta, nuotraukos saugomos amžinai';

  @override
  String get paywallFeatureNoWatermark => 'Apžvalgos be vandens ženklo';

  @override
  String get paywallFeatureOriginal => 'Atsisiuntimas originalia kokybe';

  @override
  String get planYear => 'Metai';

  @override
  String get planMonth => 'Mėnuo';

  @override
  String pricePerMonth(String price) {
    return '$price per mėnesį';
  }

  @override
  String paywallSaveBadge(int percent) {
    return 'SUTAUPYK $percent %';
  }

  @override
  String get planMonthCancelAnytime => 'atšauk bet kada';

  @override
  String tryFree(String period) {
    return 'Išbandyk $period nemokamai';
  }

  @override
  String get becomePro => 'Gauti Pro';

  @override
  String get subscriptionsLoadFailed =>
      'Nepavyko įkelti prenumeratų. Patikrink ryšį.';

  @override
  String legalAnnual(String price) {
    return 'CamTrip Pro metinė prenumerata: $price per metus.';
  }

  @override
  String legalAnnualTrial(String period, String price) {
    return 'CamTrip Pro metinė prenumerata: $period nemokamai, po to $price per metus.';
  }

  @override
  String legalMonthly(String price) {
    return 'CamTrip Pro mėnesinė prenumerata: $price per mėnesį.';
  }

  @override
  String legalMonthlyTrial(String period, String price) {
    return 'CamTrip Pro mėnesinė prenumerata: $period nemokamai, po to $price per mėnesį.';
  }

  @override
  String get legalBillingApple =>
      'Mokestis nuskaitomas iš tavo Apple ID. Prenumerata atnaujinama automatiškai, nebent ją atšauksi likus bent 24 valandoms iki laikotarpio pabaigos. Atšaukti ir valdyti ją gali App Store paskyros nustatymuose.';

  @override
  String get legalBillingGoogle =>
      'Mokestis nuskaitomas iš tavo Google paskyros. Prenumerata atnaujinama automatiškai, nebent ją atšauksi likus bent 24 valandoms iki laikotarpio pabaigos. Atšaukti ir valdyti ją gali Google Play paskyros nustatymuose.';

  @override
  String get restorePurchases => 'Atkurti pirkimus';

  @override
  String get terms => 'Sąlygos';

  @override
  String get privacy => 'Privatumas';

  @override
  String get groupProTitle => 'Vienas Pro grupėje = Pro visiems toje grupėje';

  @override
  String get groupProBody =>
      'Jei vienas žmogus turi Pro, visa grupė gauna visus kameros stilius, neribotą narių skaičių, išsaugomas nuotraukas, originalią kokybę ir apžvalgas be vandens ženklo.';

  @override
  String get groupCreated => 'Grupė sukurta ✓';

  @override
  String get inviteFriends => 'Pakviesk draugus';

  @override
  String get codeCopied => 'Kodas nukopijuotas';

  @override
  String get shareLink => 'Dalytis nuoroda';

  @override
  String inviteSubject(String groupName) {
    return 'Prisijunk prie $groupName programėlėje CamTrip';
  }

  @override
  String inviteMembersUnlimited(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count narių',
      many: '$count nario',
      few: '$count nariai',
      one: '$count narys',
    );
    return '$_temp0 · neribota (Pro)';
  }

  @override
  String inviteMembersLimit(int count, int limit) {
    return '$count iš $limit narių · Pro: neribota';
  }

  @override
  String get toCamera => 'Į kamerą';

  @override
  String get done => 'Atlikta';

  @override
  String get joinEnterCode => 'Įvesk 6 simbolių kodą';

  @override
  String get joinGroupTitle => 'Prisijungti prie grupės';

  @override
  String get joinGroupSubtitle =>
      'Įvesk draugų kodą arba nuskenuok jų QR kodą.';

  @override
  String get typeCode => 'Įvesti kodą';

  @override
  String get scanQr => 'Skenuoti QR';

  @override
  String get join => 'Prisijungti';

  @override
  String get groupNameRequired => 'Suteik grupei pavadinimą';

  @override
  String get newGroup => 'Nauja grupė';

  @override
  String get groupType => 'Grupės tipas';

  @override
  String get groupTypeVacation => 'Atostogos';

  @override
  String get groupTypeVacationDescription =>
      'Su pradžios ir pabaigos data, paskui archyvuojama';

  @override
  String get groupTypeEvent => 'Renginys';

  @override
  String get groupTypeEventDescription =>
      'Viena diena ar vakaras, pvz., vakarėlis';

  @override
  String get groupTypePermanent => 'Visada atvira';

  @override
  String get groupTypePermanentDescription =>
      'Tavo nuolatinei draugų kompanijai';

  @override
  String get date => 'Data';

  @override
  String get departure => 'Išvykimas';

  @override
  String get returnDate => 'Grįžimas';

  @override
  String get defaultCameraStyle => 'Numatytasis kameros stilius';

  @override
  String freeLimitPermanent(int max) {
    return 'Nemokamai: iki $max narių. Su Pro neribota.';
  }

  @override
  String freeLimitDated(int max, int days) {
    return 'Nemokamai: iki $max narių, nuotraukos saugomos iki $days d. po pabaigos datos. Su Pro neribota ir amžinai.';
  }

  @override
  String get createGroup => 'Sukurti grupę';

  @override
  String get group => 'Grupė';

  @override
  String groupCode(String code) {
    return 'kodas $code';
  }

  @override
  String get manage => 'Valdyti';

  @override
  String get rename => 'Pervadinti';

  @override
  String get changeDates => 'Keisti datas';

  @override
  String get finishTrip => 'Baigti kelionę';

  @override
  String get finishTripSubtitle => 'Pabaigos data tampa šiandiena';

  @override
  String get reopenGroup => 'Vėl atidaryti grupę';

  @override
  String get closeGroup => 'Uždaryti grupę';

  @override
  String get reopenGroupSubtitle => 'Nariai vėl gali pridėti nuotraukų';

  @override
  String get closeGroupSubtitle =>
      'Niekas nebegali pridėti nuotraukų; viską vis dar galima peržiūrėti';

  @override
  String get members => 'Nariai';

  @override
  String memberYou(String name) {
    return '$name (tu)';
  }

  @override
  String get blockedTag => 'užblokuotas';

  @override
  String get adminTag => 'administratorius';

  @override
  String removeMemberTitle(String name) {
    return 'Pašalinti $name?';
  }

  @override
  String get removeMemberMessage => 'Jo nuotraukos lieka grupėje.';

  @override
  String get remove => 'Ištrinti';

  @override
  String get removeMember => 'Pašalinti';

  @override
  String blockTitle(String name) {
    return 'Užblokuoti $name?';
  }

  @override
  String blockMessage(String name) {
    return 'Nebematysi $name nuotraukų ir vaizdo įrašų ir negausi apie juos pranešimų. Tai gali atšaukti nustatymuose.';
  }

  @override
  String get block => 'Užblokuoti';

  @override
  String get makeMember => 'Padaryti paprastu nariu';

  @override
  String get makeAdmin => 'Padaryti administratoriumi';

  @override
  String get removeFromGroup => 'Pašalinti iš grupės';

  @override
  String get unblock => 'Atblokuoti';

  @override
  String get inviteFriendsButton => 'Pakviesti draugus';

  @override
  String get you => 'Tu';

  @override
  String get unarchive => 'Grąžinti iš archyvo';

  @override
  String get archive => 'Archyvuoti';

  @override
  String get unarchiveSubtitle => 'Grupė vėl tarp tavo albumų';

  @override
  String archiveSubtitle(String section) {
    return 'Tik tau: grupė perkeliama į „$section“ albumų apačioje';
  }

  @override
  String get archivedSection => 'Archyvuota';

  @override
  String get hiddenPhotos => 'Paslėptos nuotraukos';

  @override
  String get hiddenPhotosSubtitle => 'Nuotraukos, kurias paslėpei sau';

  @override
  String get leaveGroup => 'Palikti grupę';

  @override
  String get leaveGroupSubtitle => 'Tavo nuotraukos lieka grupėje kitiems';

  @override
  String get deleteGroup => 'Ištrinti grupę';

  @override
  String get deleteGroupSubtitle => 'Visos nuotraukos ištrinamos visiems';

  @override
  String groupArchived(String groupName) {
    return '„$groupName“ archyvuota';
  }

  @override
  String groupUnarchived(String groupName) {
    return '„$groupName“ vėl tarp tavo albumų';
  }

  @override
  String get undo => 'Anuliuoti';

  @override
  String get groupNameTitle => 'Grupės pavadinimas';

  @override
  String get finishTripTitle => 'Baigti kelionę?';

  @override
  String get finishTripMessage =>
      'Pabaigos data tampa šiandiena. Nuotraukų vis dar gali pridėti; apžvalga paruošta.';

  @override
  String get finishTripConfirm => 'Baigti';

  @override
  String get tripFinished => 'Kelionė baigta';

  @override
  String leaveGroupTitle(String groupName) {
    return 'Palikti „$groupName“?';
  }

  @override
  String get leaveGroupMessage =>
      'Tavo nuotraukos lieka grupėje kitiems. Vėliau galėsi vėl prisijungti su kodu.';

  @override
  String get leave => 'Palikti';

  @override
  String groupDeleted(String groupName) {
    return '„$groupName“ ištrinta';
  }

  @override
  String get youAreAdmin => 'esi administratorius';

  @override
  String get open => 'Atidaryti';

  @override
  String get archiveMenuSubtitle => 'Tik tau, kiti nepastebės';

  @override
  String get deleteGroupMenuSubtitle => 'Visiems, su visomis nuotraukomis';

  @override
  String get deleteGroupTitle => 'Ištrinti grupę?';

  @override
  String deleteGroupMessage(int count, String groupName, int memberCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Visos $count nuotraukų ir vaizdo įrašų',
      many: 'Visi $count nuotraukos ir vaizdo įrašo',
      few: 'Visos $count nuotraukos ir vaizdo įrašai',
      one: '$count nuotrauka ar vaizdo įrašas',
    );
    String _temp1 = intl.Intl.pluralLogic(
      memberCount,
      locale: localeName,
      other: 'visiems $memberCount narių',
      many: 'visiems $memberCount nario',
      few: 'visiems $memberCount nariams',
      one: '$memberCount nariui',
    );
    return '$_temp0 grupėje „$groupName“ dings $_temp1. To atšaukti negalima.';
  }

  @override
  String get deleteGroupOwnRoll => 'Tavo paties galerija lieka nepakitusi.';

  @override
  String get deleteGroupTypeName => 'Patvirtinimui įvesk grupės pavadinimą:';

  @override
  String get deleteForEveryone => 'Ištrinti visiems';

  @override
  String get save => 'Išsaugoti';

  @override
  String get yourAlbums => 'Tavo albumai';

  @override
  String get uploadQueue => 'Įkėlimo eilė';

  @override
  String get noConnection => 'Nėra ryšio';

  @override
  String get albumsOfflineMessage =>
      'Albumai bus įkelti, kai vėl būsi prisijungęs. Kamera vis tiek veikia.';

  @override
  String get retry => 'Bandyti dar kartą';

  @override
  String get noAlbumsTitle => 'Albumų dar nėra';

  @override
  String get noAlbumsMessage =>
      'Sukurk grupę kitai kelionei arba prisijunk prie draugo grupės su jo kodu.';

  @override
  String get haveCode => 'Turiu kodą';

  @override
  String get joinWithCode => 'Prisijungti su kodu ar QR kodu';

  @override
  String get camera => 'Kamera';

  @override
  String get restore => 'Atkurti';

  @override
  String get more => 'Daugiau';

  @override
  String get newAlbum => 'Nauja';

  @override
  String get closedTag => 'uždaryta';

  @override
  String get activeTag => 'aktyvi';

  @override
  String get uploadFailed => 'Įkelti nepavyko';

  @override
  String get queueNoSignal => 'Nėra signalo.';

  @override
  String get queueNoSignalMessage =>
      'Tavo nuotraukos jau albume ir bus pasidalytos, kai tik vėl būsi prisijungęs.';

  @override
  String get queueWaitingForWifi => 'Laukiama Wi-Fi.';

  @override
  String queueWifiOnlyOn(String setting) {
    return 'Įjungta „$setting“.';
  }

  @override
  String get queueVideosWifiOnly => 'Vaizdo įrašai keliami tik per Wi-Fi.';

  @override
  String get queueAllShared => 'Viskas pasidalyta ✓';

  @override
  String queuePending(String items) {
    return 'Dar reikia pasidalyti: $items';
  }

  @override
  String queuePendingBoth(String photos, String videos) {
    return 'Dar reikia pasidalyti: $photos ir $videos';
  }

  @override
  String get retryUpload => 'Bandyti dar kartą';

  @override
  String get removeFromQueue => 'Pašalinti iš eilės';

  @override
  String get queueStatusWifi => 'Wi-Fi';

  @override
  String get queueStatusWaiting => 'laukiama';

  @override
  String get videosWifiOnlyTitle => 'Vaizdo įrašai tik per Wi-Fi';

  @override
  String get videosWifiOnlySubtitle => 'Taupo mobiliuosius duomenis';

  @override
  String get retryNow => 'Bandyti dabar';

  @override
  String get yourName => 'Tavo vardas';

  @override
  String get settings => 'Nustatymai';

  @override
  String get tapToChangeName => 'Bakstelk, kad pakeistum vardą';

  @override
  String get getCamTripPro => 'Gauti CamTrip Pro';

  @override
  String get photos => 'Nuotraukos';

  @override
  String get saveOwnPhotos =>
      'Išsaugoti mano nuotraukas albume kiekvienai grupei';

  @override
  String get autoSaveOthers => 'Automatiškai išsaugoti kitų nuotraukas';

  @override
  String get wifiOnlyTitle => 'Kelti tik per Wi-Fi';

  @override
  String get dateStamp => 'Datos žyma';

  @override
  String get notifications => 'Pranešimai';

  @override
  String get notifyNewPhotos => 'Naujos nuotraukos (suvestinė)';

  @override
  String get notifyRecapReady => 'Apžvalga paruošta';

  @override
  String get camTripTeam => 'CamTrip komanda';

  @override
  String get adminEntrySubtitle =>
      'Naudotojai, Pro suteikimas, pranešimai ir statistika';

  @override
  String get account => 'Paskyra';

  @override
  String get manageSubscription => 'Valdyti prenumeratą';

  @override
  String get blockedPeople => 'Užblokuoti žmonės';

  @override
  String get nobody => 'Niekas';

  @override
  String peopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count žmonių',
      many: '$count žmogaus',
      few: '$count žmonės',
      one: '$count žmogus',
    );
    return '$_temp0';
  }

  @override
  String get privacyPolicy => 'Privatumo politika';

  @override
  String get contact => 'Kontaktai';

  @override
  String get signOut => 'Atsijungti';

  @override
  String get deleteAccount => 'Ištrinti paskyrą';

  @override
  String get deleteAccountSubtitle =>
      'Ištrina tavo paskyrą ir visas tavo nuotraukas';

  @override
  String get deleteAccountTitle => 'Ištrinti paskyrą?';

  @override
  String get deleteAccountMessage =>
      'Tavo paskyra ir visos tavo nuotraukos bei vaizdo įrašai bus ištrinti, taip pat ir iš grupių. Aktyvią prenumeratą atšauk App Store arba Google Play.';

  @override
  String get blockedTitle => 'Užblokuoti';

  @override
  String get blockedSubtitle => 'Nematai šių žmonių nuotraukų.';

  @override
  String get blockedNone => 'Nieko neužblokavai.';

  @override
  String get unblockShort => 'Atblokuoti';

  @override
  String get groupGone => 'Šios grupės nebėra arba tu nebesi narys.';

  @override
  String photosSavedToAlbum(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nuotraukų išsaugota „$album“',
      many: '$count nuotraukos išsaugota „$album“',
      few: '$count nuotraukos išsaugotos „$album“',
      one: '$count nuotrauka išsaugota „$album“',
    );
    return '$_temp0';
  }

  @override
  String photosDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nuotraukų ištrinta',
      many: '$count nuotraukos ištrinta',
      few: '$count nuotraukos ištrintos',
      one: '$count nuotrauka ištrinta',
    );
    return '$_temp0';
  }

  @override
  String photosDeletedSkipped(int count, int skipped) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nuotraukų ištrinta',
      many: '$count nuotraukos ištrinta',
      few: '$count nuotraukos ištrintos',
      one: '$count nuotrauka ištrinta',
    );
    return '$_temp0, praleista: $skipped';
  }

  @override
  String photosHiddenForYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nuotraukų paslėpta nuo tavęs',
      many: '$count nuotraukos paslėpta nuo tavęs',
      few: '$count nuotraukos paslėptos nuo tavęs',
      one: '$count nuotrauka paslėpta nuo tavęs',
    );
    return '$_temp0';
  }

  @override
  String get addedToFavorites => 'Pridėta prie mėgstamų';

  @override
  String get removedFromFavorites => 'Pašalinta iš mėgstamų';

  @override
  String get photoAccessSettings =>
      'Suteik CamTrip prieigą prie nuotraukų nustatymuose';

  @override
  String photosBeingAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Pridedama $count nuotraukų',
      many: 'Pridedama $count nuotraukos',
      few: 'Pridedamos $count nuotraukos',
      one: 'Pridedama $count nuotrauka',
    );
    return '$_temp0';
  }

  @override
  String photosUnreadable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Nepavyko nuskaityti $count nuotraukų',
      many: 'Nepavyko nuskaityti $count nuotraukos',
      few: 'Nepavyko nuskaityti $count nuotraukų',
      one: 'Nepavyko nuskaityti $count nuotraukos',
    );
    return '$_temp0';
  }

  @override
  String get groupNotLoaded => 'Grupė neįkelta';

  @override
  String get noFavoritesTitle => 'Mėgstamų dar nėra';

  @override
  String get noPhotosTitle => 'Nuotraukų dar nėra';

  @override
  String get noFavoritesMessage =>
      'Bakstelk žvaigždutę ant nuotraukos, kad ji atsirastų čia.';

  @override
  String get noPhotosMessage =>
      'Padaryk pirmą nuotrauką. Visi grupėje iškart ją pamatys.';

  @override
  String get openCamera => 'Atidaryti kamerą';

  @override
  String savingProgress(int done, int total) {
    return 'Išsaugoma... $done/$total';
  }

  @override
  String get sharePreparing => 'Ruošiama...';

  @override
  String sharingProgress(int done, int total) {
    return 'Ruošiama... $done/$total';
  }

  @override
  String get choosePhotos => 'Pasirinkti nuotraukas';

  @override
  String selectedCount(int count) {
    return 'Pasirinkta: $count';
  }

  @override
  String get selectNone => 'Nieko nežymėti';

  @override
  String get selectAll => 'Pažymėti viską';

  @override
  String photosWaitingToShare(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nuotraukų laukia dalijimosi',
      many: '$count nuotraukos laukia dalijimosi',
      few: '$count nuotraukos laukia dalijimosi',
      one: '$count nuotrauka laukia dalijimosi',
    );
    return '$_temp0';
  }

  @override
  String get recapReadyTitle => 'Tavo apžvalga paruošta';

  @override
  String get recapReadySubtitle => 'Vaizdo įrašas su muzika iš tavo kelionės';

  @override
  String get watch => 'Žiūrėti';

  @override
  String get makeRecapNow => 'Sukurti vaizdo apžvalgą dabar';

  @override
  String freeGroupDeleteNotice(String date) {
    return 'Nemokama grupė: nuotraukos saugomos iki $date. Išsaugok jas arba gauk Pro.';
  }

  @override
  String get filterAll => 'Visos';

  @override
  String get filterFavorites => 'Mėgstamos';

  @override
  String get filterPerPerson => 'Pagal žmogų';

  @override
  String get filterPerson => 'Žmogus';

  @override
  String get select => 'Žymėti';

  @override
  String get hiddenFilter => 'Paslėptos';

  @override
  String get photosBy => 'Nuotraukos nuo...';

  @override
  String get uploadedTag => 'įkelta';

  @override
  String get saveAll => 'Išsaugoti visas';

  @override
  String get favorite => 'Mėgstama';

  @override
  String get unfavorite => 'Pašalinti iš mėgstamų';

  @override
  String get hide => 'Slėpti';

  @override
  String get delete => 'Ištrinti';

  @override
  String deletePhotosTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ištrinti $count nuotraukų?',
      many: 'Ištrinti $count nuotraukos?',
      few: 'Ištrinti $count nuotraukas?',
      one: 'Ištrinti nuotrauką?',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Jos dings visiems grupėje. To atšaukti negalima.',
      one: 'Ji dings visiems grupėje. To atšaukti negalima.',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosNotAllowed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count nuotraukų priklauso kitiems. Jos lieka; ištrinti gali tik administratorius.',
      many:
          '$count nuotraukos priklauso kitiems. Jos lieka; ištrinti gali tik administratorius.',
      few:
          '$count nuotraukos priklauso kitiems. Jos lieka; ištrinti gali tik administratorius.',
      one:
          '$count nuotrauka priklauso kitam. Ji lieka; ištrinti gali tik administratorius.',
    );
    return '$_temp0';
  }

  @override
  String photosBackInGroup(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nuotraukų vėl grupėje',
      many: '$count nuotraukos vėl grupėje',
      few: '$count nuotraukos vėl grupėje',
      one: '$count nuotrauka vėl grupėje',
    );
    return '$_temp0';
  }

  @override
  String get showAll => 'Rodyti visas';

  @override
  String get hiddenPhotosExplainer =>
      'Šių nuotraukų nebematai tik tu. Kitiems grupėje jos vis dar yra.';

  @override
  String get nothingHidden => 'Nieko nepaslėpta';

  @override
  String get nothingHiddenMessage => 'Čia atsiras nuotraukos, kurias paslėpsi.';

  @override
  String showAgainCount(int count) {
    return 'Vėl rodyti ($count)';
  }

  @override
  String get someone => 'Kažkas';

  @override
  String get savedToAlbum => 'Išsaugota nuotraukų albume';

  @override
  String get share => 'Dalytis';

  @override
  String get shareFailed => 'Pasidalyti nepavyko';

  @override
  String get reportTitle => 'Kodėl pranešai apie šią nuotrauką?';

  @override
  String get reportSubtitle =>
      'Kiekvieną pranešimą peržiūrime per 24 valandas. Nuotrauka nuo tavęs paslepiama iškart.';

  @override
  String get reportThanks => 'Ačiū, peržiūrėsime';

  @override
  String blockMessageAllGroups(String name) {
    return 'Nebematysi $name nuotraukų ir vaizdo įrašų jokioje grupėje ir negausi apie juos pranešimų. Tai gali atšaukti nustatymuose.';
  }

  @override
  String userBlocked(String name) {
    return '$name užblokuotas';
  }

  @override
  String get videoHiddenForYou => 'Vaizdo įrašas paslėptas nuo tavęs';

  @override
  String get photoHiddenForYou => 'Nuotrauka paslėpta nuo tavęs';

  @override
  String get setAsCover => 'Nustatyti kaip viršelį';

  @override
  String get coverUpdated => 'Viršelio nuotrauka atnaujinta';

  @override
  String get hideForMe => 'Slėpti nuo manęs';

  @override
  String get hideForMeSubtitle => 'Kiti grupėje vis tiek ją mato';

  @override
  String get reportPhoto => 'Pranešti apie nuotrauką';

  @override
  String blockName(String name) {
    return 'Užblokuoti $name';
  }

  @override
  String get forEveryoneInGroup => 'Visiems grupėje';

  @override
  String get videoDeleted => 'Vaizdo įrašas ištrintas';

  @override
  String get photoDeleted => 'Nuotrauka ištrinta';

  @override
  String get photoAccessToSave =>
      'Suteik CamTrip prieigą prie nuotraukų nustatymuose, kad galėtum jas išsaugoti';

  @override
  String get phoneFull => 'Telefono atmintis pilna';

  @override
  String get albumSaveFailedShort => 'Nepavyko išsaugoti albume';

  @override
  String get recapTemplateGoldenHour => 'Golden Hour';

  @override
  String get recapTemplateFast => 'Greita';

  @override
  String get recapTemplateFilmRoll => 'Fotojuosta';

  @override
  String get recapTemplatePolaroid => 'Polaroid';

  @override
  String get trackSummerEvening => 'Vasaros vakaras';

  @override
  String get trackGoldenHour => 'Golden Hour';

  @override
  String get trackRoadtrip => 'Kelionė keliu';

  @override
  String get moodWarm => 'šilta';

  @override
  String get moodCheerful => 'linksma';

  @override
  String friendsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count draugų',
      many: '$count draugo',
      few: '$count draugai',
      one: '$count draugas',
    );
    return '$_temp0';
  }

  @override
  String get madeWithCamTrip => 'Sukurta su CamTrip';

  @override
  String get tagline => 'Viena juosta visai kompanijai';

  @override
  String get videoUnsupportedDevice =>
      'Šiame įrenginyje nepavyko sukurti vaizdo įrašo';

  @override
  String get groupLoadFailed => 'Nepavyko įkelti šios grupės.';

  @override
  String recapNeedsPhotos(int count) {
    return 'Apžvalgai reikia bent $count nuotraukų.';
  }

  @override
  String get recapFailed => 'Nepavyko sukurti apžvalgos. Pabandyk dar kartą.';

  @override
  String get recapSaved => 'Apžvalga išsaugota nuotraukų albume';

  @override
  String get recap => 'Apžvalga';

  @override
  String get recapRendering => 'Kuriama apžvalga...';

  @override
  String get videoRendering => 'Kuriamas vaizdo įrašas...';

  @override
  String get template => 'Šablonas';

  @override
  String get musicLicense => 'Nuosava CamTrip muzika · be autorinių mokesčių';

  @override
  String get change => 'Keisti';

  @override
  String get noWatermark => 'Be vandens ženklo ✓';

  @override
  String get removeWatermarkPro => 'Pašalink vandens ženklą su Pro';

  @override
  String get proSourceSubscription => 'Prenumerata';

  @override
  String get proSourceGift => 'Dovana';

  @override
  String get proSourceAdmin => 'Administratorius';

  @override
  String get proSourceGroup => 'Per grupę';

  @override
  String get noPro => 'Be Pro';

  @override
  String proStatusNoEnd(String source) {
    return 'Pro ($source), be pabaigos datos';
  }

  @override
  String proStatusUntil(String source, String date) {
    return 'Pro ($source), iki $date';
  }

  @override
  String get lifetime => 'Visam laikui';

  @override
  String get pickDate => 'Pasirink datą';

  @override
  String get noAccess => 'Nėra prieigos';

  @override
  String get adminOnlyTeam => 'Valdymas skirtas tik CamTrip komandai.';

  @override
  String get adminOverview => 'Apžvalga';

  @override
  String get adminUsers => 'Naudotojai';

  @override
  String get adminReports => 'Pranešimai';

  @override
  String adminsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count administratorių',
      many: '$count administratoriaus',
      few: '$count administratoriai',
      one: '$count administratorius',
    );
    return '$_temp0';
  }

  @override
  String get adminNewThisWeek => 'Nauji šią savaitę';

  @override
  String get adminGroups => 'Grupės';

  @override
  String get adminProSubscription => 'Pro su prenumerata';

  @override
  String get adminProGift => 'Pro dovanų';

  @override
  String adminWithoutSubscription(int count) {
    return '$count be prenumeratos';
  }

  @override
  String get adminOpenReports => 'Atviri pranešimai';

  @override
  String get adminSearchHint => 'Ieškoti pagal vardą ar el. paštą';

  @override
  String get nobodyFound => 'Nieko nerasta';

  @override
  String get loadMore => 'Įkelti daugiau';

  @override
  String get noEmail => 'Nėra el. pašto';

  @override
  String adminDeletePhotoMessage(String groupName) {
    return 'Nuotrauka dings visiems grupėje „$groupName“. Visi pranešimai apie šią nuotrauką bus išspręsti.';
  }

  @override
  String get adminBanMessage =>
      'Ši paskyra nebegalės prisijungti ir naudotis programėle. Vėliau tai gali atšaukti.';

  @override
  String get adminDismissTitle => 'Atmesti pranešimą?';

  @override
  String get adminDismissMessage =>
      'Nuotrauka lieka. Pranešimas pažymimas kaip išspręstas.';

  @override
  String get adminDismiss => 'Atmesti';

  @override
  String get adminAccountBlocked => 'Paskyra užblokuota';

  @override
  String get adminReportDismissed => 'Pranešimas atmestas';

  @override
  String get adminNoReports => 'Atvirų pranešimų nėra';

  @override
  String get adminNoReportsMessage =>
      'Čia rodomos nuotraukos, apie kurias pranešta.';

  @override
  String get deletedTag => 'Ištrinta';

  @override
  String adminReportedBy(String name) {
    return 'Pranešė: $name';
  }

  @override
  String adminPhotoBy(String name) {
    return 'Nuotrauka: $name';
  }

  @override
  String reportsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pranešimų',
      many: '$count pranešimo',
      few: '$count pranešimai',
      one: '$count pranešimas',
    );
    return '$_temp0';
  }

  @override
  String get adminDeletePhoto => 'Ištrinti nuotrauką';

  @override
  String get adminBlockCreator => 'Užblokuoti autorių';

  @override
  String get loadFailed => 'Įkelti nepavyko';

  @override
  String get adminLifetimeProGiven => 'Suteiktas Pro visam laikui';

  @override
  String get adminProGiven => 'Pro suteiktas';

  @override
  String adminGiveProUntil(String date) {
    return 'Suteikti Pro iki $date';
  }

  @override
  String get adminGiveProLifetime => 'Suteikti Pro visam laikui';

  @override
  String adminGiveProFor(String period) {
    return 'Suteikti Pro: $period';
  }

  @override
  String get adminReasonHint =>
      'Priežastis, pvz., draugas, testuotojas, influenceris';

  @override
  String get adminGivePro => 'Suteikti Pro';

  @override
  String get adminRevokeTitle => 'Atšaukti dovaną?';

  @override
  String get adminRevokeMessage =>
      'Dovanotas Pro baigiasi iškart. Nuosava prenumerata tęsiasi.';

  @override
  String get adminRevoke => 'Atšaukti';

  @override
  String get adminGiftRevoked => 'Dovana atšaukta';

  @override
  String get adminUnbanTitle => 'Atblokuoti?';

  @override
  String adminUnbanMessage(String name) {
    return '$name vėl galės prisijungti.';
  }

  @override
  String get adminUnbanned => 'Blokavimas panaikintas';

  @override
  String get adminBanUserMessage =>
      'Ši paskyra nebegalės prisijungti ir naudotis programėle. Nuotraukos lieka.';

  @override
  String get adminUser => 'Naudotojas';

  @override
  String get adminNotVerified => 'nepatvirtinta';

  @override
  String get adminRole => 'Vaidmuo';

  @override
  String get adminCreated => 'Sukurta';

  @override
  String get unknown => 'Nežinoma';

  @override
  String get adminSignInWith => 'Prisijungia per';

  @override
  String get adminEmailMethod => 'El. paštas';

  @override
  String get adminPhotosAndVideos => 'Nuotraukos ir vaizdo įrašai';

  @override
  String get adminStatus => 'Būsena';

  @override
  String get adminActive => 'Aktyvus';

  @override
  String adminActiveUntil(String date) {
    return 'Aktyvus iki $date';
  }

  @override
  String adminGiftFrom(String name) {
    return 'Dovana nuo $name';
  }

  @override
  String adminExpiredOn(String date) {
    return 'Baigėsi $date';
  }

  @override
  String get adminExpired => 'Baigėsi';

  @override
  String adminUntil(String date) {
    return 'Iki $date';
  }

  @override
  String get adminGiveProTitle => 'Suteikti Pro';

  @override
  String get adminGiveProNote =>
      'Galioja ir šio žmogaus grupėms: vienas Pro grupėje = Pro visiems toje grupėje.';

  @override
  String get adminRevokeGift => 'Atšaukti dovaną';

  @override
  String get adminModeration => 'Moderavimas';

  @override
  String get adminCannotBanSelf => 'Negali užblokuoti savęs.';

  @override
  String get adminCannotBanAdmin => 'Administratoriaus užblokuoti negalima.';

  @override
  String get adminUnban => 'Atblokuoti';

  @override
  String get adminBanAccount => 'Užblokuoti paskyrą';

  @override
  String get googleSignInUnavailable =>
      'Prisijungimas per Google dar nepasiekiamas';

  @override
  String get cameraPickerTitle => 'Pasirink kamerą';

  @override
  String get cameraPickerSubtitle =>
      'Kiekviena kamera suteikia nuotraukoms savitą išvaizdą';

  @override
  String get cameraPickerChange => 'Keisti kamerą';

  @override
  String get cameraPickerUnlock => 'Atrakinti su Pro';

  @override
  String get cameraPickerSelected => 'Pasirinkta';

  @override
  String get cameraPickerStyleSummer => 'Vasara';

  @override
  String get cameraPickerStyleSummerDescription =>
      'Šiltos, išblukusios spalvos kaip 90-ųjų nuotraukoje';

  @override
  String get cameraPickerStyleNight => 'Naktis 800';

  @override
  String get cameraPickerStyleNightDescription =>
      'Kino juosta: žalsvai mėlyni šešėliai, šilta šviesa, daug grūdėtumo';

  @override
  String get cameraPickerStyleSepia => 'Sepija';

  @override
  String get cameraPickerStyleSepiaDescription =>
      'Sena ruda nuotrauka iš batų dėžės';

  @override
  String get cameraPickerStyleLomo => 'Lomo';

  @override
  String get cameraPickerStyleLomoDescription =>
      'Ryškios spalvos, tamsūs kampai ir laukinis spalvų atspalvis';

  @override
  String get cameraPickerStyleMint => 'Mėta';

  @override
  String get cameraPickerStyleMintDescription =>
      'Švelni ir gaivi su žaliu atspalviu';

  @override
  String get cameraPickerStylePastel => 'Rožinė';

  @override
  String get cameraPickerStylePastelDescription =>
      'Pastelinės spalvos su rožiniu švytėjimu ir baltu rėmeliu';

  @override
  String get cameraPickerStyleSuper8 => 'Super 8';

  @override
  String get cameraPickerStyleSuper8Description =>
      'Grūdėta ir švelni kaip senas namų filmas';

  @override
  String get paywallBenefitGroup => 'Vienas Pro = Pro visai grupei';

  @override
  String get paywallBenefitUnlimited =>
      'Neriboti nariai, nuotraukos saugomos amžinai';

  @override
  String get paywallBenefitQuality => 'Be vandens ženklo, originali kokybė';

  @override
  String paywallFreeTrial(String period) {
    return '$period nemokamai';
  }

  @override
  String paywallPriceYear(String price) {
    return '$price per metus.';
  }

  @override
  String paywallPriceYearTrial(String period, String price) {
    return '$period nemokamai, po to $price per metus.';
  }

  @override
  String paywallPriceMonth(String price) {
    return '$price per mėnesį.';
  }

  @override
  String paywallPriceMonthTrial(String period, String price) {
    return '$period nemokamai, po to $price per mėnesį.';
  }

  @override
  String paywallAutoRenew(String store) {
    return 'Atnaujinama automatiškai. Atšauk likus bent 24 valandoms iki atnaujinimo: $store.';
  }

  @override
  String get paywallDetailsTitle => 'Viskas, kas yra Pro';

  @override
  String get paywallBenefitStyles => 'Visi kameros stiliai';

  @override
  String get allPhotosTitle => 'Visos nuotraukos';

  @override
  String get homeTabAlbums => 'Albumai';

  @override
  String get allPhotosEmptyTitle => 'Nuotraukų dar nėra';

  @override
  String get allPhotosEmptyMessage =>
      'Atidaryk kamerą ir padaryk pirmą nuotrauką.';

  @override
  String get allPhotosLoadFailed => 'Nepavyko įkelti tavo nuotraukų';

  @override
  String get cameraSettingsTitle => 'Kameros nustatymai';

  @override
  String get cameraSettingsMore => 'Daugiau nustatymų';

  @override
  String get cameraSettingsGrid => 'Tinklelis';

  @override
  String get cameraSettingsHaptics => 'Vibruoti fotografuojant';

  @override
  String get cameraSettingsDateStamp => 'Data apačioje dešinėje';

  @override
  String get cameraSettingsSound => 'Užrakto garsas';

  @override
  String get cameraSettingsSoundHint => 'Tylu, kai telefonas begarsis';

  @override
  String get cameraSettingsTimer => 'Laikmatis';

  @override
  String get cameraSettingsTimerOff => 'Išj.';

  @override
  String cameraSettingsTimerSeconds(int seconds) {
    return '$seconds s';
  }

  @override
  String get cameraSettingsTimerCancelHint => 'Bakstelk užraktą, kad atšauktum';

  @override
  String get cameraSettingsMirror => 'Veidrodinės asmenukės';

  @override
  String get cameraSettingsSaveToRoll => 'Išsaugoti galerijoje';

  @override
  String get cameraSettingsQuality => 'Kokybė';

  @override
  String get cameraSettingsQualityStandard => 'Standartinė';

  @override
  String get cameraSettingsQualityHigh => 'Aukšta';

  @override
  String get cameraLowLightHint => 'Mažai šviesos - įjunk blykstę';

  @override
  String get cameraFlashUnavailable => 'Ši kamera neturi blykstės';

  @override
  String get cameraFlashScreen => 'Ekrano blykstė';

  @override
  String get cameraFlashCycleHint =>
      'Bakstelk, kad perjungtum: išj., įj. ir auto';

  @override
  String get cameraFlip => 'Perjungti priekinę ir galinę kamerą';

  @override
  String get cameraFlipHint =>
      'Dukart bakstelk vaizdo ieškiklį, kad apverstum kamerą';

  @override
  String cameraPickerPaywallStyles(int count, String styles) {
    return 'Visos kameros ($count), įskaitant $styles';
  }

  @override
  String get styleFlash => 'Blykstė 400';

  @override
  String get styleFlashDescription =>
      'Tiesioginė blykstė ant šilto filmo: gintarinis švytėjimas, grūdėtumas, sodrios raudonos';

  @override
  String cameraTimerButton(String state) {
    return 'Laikmatis: $state';
  }

  @override
  String get cameraTimerCycleHint =>
      'Bakstelk, kad perjungtum: išj., 3 s ir 10 s';

  @override
  String get cameraLastShotOpen => 'Paskutinė nuotrauka, atidaro albumą';

  @override
  String get cameraLastShotEmpty => 'Nuotraukų dar nėra, atidaro albumą';

  @override
  String get deleteOnlyOwnOrAdmin =>
      'Ištrinti gali tik autorius arba administratorius';

  @override
  String get videoPlay => 'Leisti';

  @override
  String get videoPause => 'Pristabdyti';

  @override
  String get language => 'Kalba';

  @override
  String get languageSystem => 'Sistemos kalba';

  @override
  String languageSystemCurrent(String language) {
    return 'Sistemos ($language)';
  }

  @override
  String get languageSearchHint => 'Ieškoti kalbos';

  @override
  String get languageNoResults => 'Kalba nerasta';

  @override
  String get personalRollTitle => 'Mano juosta';

  @override
  String get personalRollSubtitle => 'Tik tau';

  @override
  String get personalRollPickerSubtitle => 'Pavienės nuotraukos, tik tau';

  @override
  String get personalRollMove => 'Į albumą';

  @override
  String get personalRollMoveTitle => 'Perkelti į albumą';

  @override
  String get personalRollMoveNoAlbums =>
      'Pirmiausia sukurk albumą arba prisijunk prie jo su kodu.';

  @override
  String personalRollMoved(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Nuotraukų perkelta į $album: $count',
      one: '1 nuotrauka perkelta į $album',
    );
    return '$_temp0';
  }

  @override
  String get personalRollPrivateNote =>
      'Šias nuotraukas matai tik tu. Perkelk jas į albumą, kad pasidalytum.';

  @override
  String get paywallTripPassSub => 'Tik ši kelionė, visai grupei';

  @override
  String get paywallOneTime => 'vienkartinis';

  @override
  String get paywallBestValue => 'Geriausia kaina';

  @override
  String paywallRollFullTitle(int used, int limit) {
    return 'Tavo juosta pilna - $used/$limit nuotraukų';
  }

  @override
  String get paywallRollFullSub => 'Fotografuok toliau su Trip Pass arba Pro.';

  @override
  String get paywallCameraTitle => 'Šis fotoaparatas priklauso Pro';

  @override
  String paywallCameraSub(int count) {
    return 'Atrakink visus fotoaparatus ($count).';
  }

  @override
  String get paywallWatermarkTitle => 'Recap be vandenženklio';

  @override
  String get paywallWatermarkSub => 'Dalinkis recap be CamTrip logotipo.';

  @override
  String get paywallDeletionTitle => 'Išsaugok savo kelionę';

  @override
  String paywallDeletionSub(String date) {
    return 'Nemokamos kelionės ištrinamos $date. Su Trip Pass arba Pro ji lieka visam laikui.';
  }

  @override
  String paywallTripPassTerms(String price) {
    return 'Vienkartinis pirkinys už $price šiai kelionei. Ne prenumerata.';
  }

  @override
  String get buyTripPass => 'Pirkti Trip Pass';

  @override
  String get tripPassActive => 'Trip Pass aktyvus: kelionė visiems yra Pro';

  @override
  String get tripPassActivating =>
      'Mokėjimas gautas. Trip Pass netrukus įsijungs.';

  @override
  String proViaTripPass(String name) {
    return 'Trip Pass nuo $name';
  }

  @override
  String rollCounterSemantics(int used, int limit) {
    return '$used iš $limit kadrų tavo juostoje';
  }

  @override
  String rollHeldTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Netelpančių nuotraukų: $count',
      one: '1 nuotrauka nebetelpa į juostą',
    );
    return '$_temp0';
  }

  @override
  String get rollHeldBody => 'Išsaugok jas su Pro arba Trip Pass';

  @override
  String deletionBannerTitle(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Išsaugok kelionę - liko dienų: $days',
      one: 'Išsaugok kelionę - liko 1 diena',
    );
    return '$_temp0';
  }

  @override
  String get deletionBannerBody =>
      'Nemokamos kelionės ištrinamos praėjus 30 dienų po pabaigos. Su Trip Pass arba Pro ji lieka visam laikui.';

  @override
  String apiRollFull(int limit) {
    return 'Tavo juosta pilna ($limit kadrų). Įsigyk Trip Pass arba Pro ir tęsk.';
  }

  @override
  String get apiTripPassFailed =>
      'Nepavyko aktyvuoti Trip Pass. Rašyk support@camtrip.app.';

  @override
  String get apiTripPassExists => 'Ši kelionė jau turi Trip Pass.';

  @override
  String get tripPassUnavailable =>
      'Trip Pass šiuo metu nepasiekiamas. Bandyk vėliau.';

  @override
  String get tripMapTitle => 'Kelionės žemėlapis';

  @override
  String get tripMapOpen => 'Žemėlapis ir statistika';

  @override
  String get tripMapLoadFailed => 'Nepavyko įkelti žemėlapio';

  @override
  String get tripMapStatDays => 'Dienos';

  @override
  String get tripMapStatPhotos => 'Nuotraukos';

  @override
  String get tripMapStatVideos => 'Vaizdo įrašai';

  @override
  String get tripMapStatMembers => 'Nariai';

  @override
  String get tripMapStatDistance => 'nuvažiuota km';

  @override
  String get tripMapStatCountries => 'Šalys';

  @override
  String get tripMapStatPlaces => 'Vietos';

  @override
  String tripMapBusiestDay(String day, int count) {
    return 'Daugiausia nuotraukų: $day ($count)';
  }

  @override
  String tripMapTopPhotographer(String name, int count) {
    return 'Geriausias fotografas: $name ($count)';
  }

  @override
  String get tripMapOffTitle => 'Kelionės žemėlapis išjungtas';

  @override
  String get tripMapOffMessage =>
      'Administratorius gali įjungti žemėlapį grupės nustatymuose. Statistiką matai visada.';

  @override
  String get tripMapOffMessageAdmin =>
      'Įjunk žemėlapį ir pamatykite, kur darėte nuotraukas. Kiekvienas pats sprendžia, ar dalyvauti.';

  @override
  String get tripMapEnable => 'Įjungti žemėlapį';

  @override
  String get tripMapEmptyTitle => 'Žemėlapyje dar nėra vietų';

  @override
  String get tripMapEmptyMessage =>
      'Čia rodomos naujos narių, kurie bendrina vietą, nuotraukos, suapvalinus iki maždaug 100 m.';

  @override
  String get tripMapConsentTitle => 'Kelionės žemėlapis';

  @override
  String get tripMapConsentQuestion =>
      'Rodyti šios grupės žemėlapyje, kur darytos tavo nuotraukos?';

  @override
  String get tripMapConsentDetail =>
      'Tai mato tik grupės nariai, suapvalinus iki maždaug 100 m. Vieta niekada neįrašoma į pačią nuotrauką, o išjungti gali bet kada grupės nustatymuose.';

  @override
  String get tripMapConsentYes => 'Taip, bendrinti';

  @override
  String get tripMapConsentNo => 'Ne';

  @override
  String get tripMapLocationDenied =>
      'Nėra prieigos prie tavo vietos. Gali ją leisti telefono nustatymuose.';

  @override
  String get tripMapSettingSubtitle =>
      'Rodo žemėlapyje, kur darytos nuotraukos. Nariai patys sprendžia, ar bendrinti.';

  @override
  String get tripMapDisableTitle => 'Išjungti žemėlapį?';

  @override
  String get tripMapDisableMessage =>
      'Visos šios grupės vietos bus ištrintos. Jei vėliau vėl įjungsi žemėlapį, visų paklausime iš naujo.';

  @override
  String get tripMapDisable => 'Išjungti';

  @override
  String get tripMapMySharing => 'Bendrinti mano vietą';

  @override
  String get tripMapMySharingOn =>
      'Tavo naujos nuotraukos rodomos žemėlapyje (suapvalinus iki maždaug 100 m).';

  @override
  String get tripMapMySharingOff =>
      'Išjungta. Tavo nuotraukos nerodomos žemėlapyje.';

  @override
  String get tripMapStopSharingTitle => 'Nebebendrinti vietos?';

  @override
  String get tripMapStopSharingMessage =>
      'Bus ištrintos visų tavo nuotraukų šioje grupėje vietos.';

  @override
  String get tripMapStopSharing => 'Nebebendrinti';
}
