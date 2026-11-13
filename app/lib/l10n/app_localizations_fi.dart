// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class AppLocalizationsFi extends AppLocalizations {
  AppLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get cancel => 'Peruuta';

  @override
  String get yes => 'Kyllä';

  @override
  String inviteMessageIntro(String groupName) {
    return 'Tuletko mukaan ryhmään ”$groupName” CamTripissä? Niin näemme toistemme kuvat heti.';
  }

  @override
  String inviteMessageCode(String code) {
    return 'Tai syötä koodi: $code';
  }

  @override
  String get memberFallbackName => 'Kaveri';

  @override
  String get reportReasonInappropriate => 'Sopimaton tai loukkaava';

  @override
  String get reportReasonSpam => 'Roskaposti';

  @override
  String get reportReasonOther => 'Jokin muu';

  @override
  String dateRangeSameMonth(
    String startDay,
    String endDay,
    String month,
    String monthNum,
    String endDate,
  ) {
    return '$startDay.-$endDate';
  }

  @override
  String get errorOffline => 'Ei yhteyttä. Yritä hetken päästä uudelleen.';

  @override
  String errorSomethingWrongStatus(int status) {
    return 'Jokin meni pieleen ($status)';
  }

  @override
  String get errorSomethingWrong => 'Jokin meni pieleen';

  @override
  String get apiInvalidCredentials => 'Sähköpostiosoite tai salasana on väärin';

  @override
  String get apiInvalidCode =>
      'Koodi on väärä tai vanhentunut. Pyydä uusi koodi.';

  @override
  String get apiEmailTaken =>
      'Tällä sähköpostiosoitteella on jo tili. Kirjaudu sisään tai valitse ”Unohditko salasanan?”.';

  @override
  String apiEmailTakenProvider(String provider) {
    return 'Tällä sähköpostiosoitteella on jo tili. Kirjaudu sisään palvelulla $provider.';
  }

  @override
  String apiWeakPassword(int min) {
    return 'Valitse vähintään $min merkin salasana';
  }

  @override
  String apiNameTooLong(int max) {
    return 'Nimesi voi olla enintään $max merkkiä';
  }

  @override
  String get apiRateLimited =>
      'Liian monta yritystä. Yritä uudelleen vartin päästä.';

  @override
  String apiAccountBanned(String email) {
    return 'Tilisi on estetty. Ota yhteyttä osoitteeseen $email, jos se on mielestäsi virhe.';
  }

  @override
  String get apiProRequired => 'Tämä kameratyyli kuuluu CamTrip Prohon';

  @override
  String get apiGroupClosed => 'Tämä ryhmä on suljettu';

  @override
  String get apiGroupCodeNotFound => 'Tällä koodilla ei löytynyt ryhmää';

  @override
  String apiGroupFull(int max) {
    return 'Ryhmä on täynnä (enintään $max jäsentä). Jos yhdellä jäsenellä on CamTrip Pro, mukaan mahtuu rajattomasti.';
  }

  @override
  String get apiLastMember => 'Olet viimeinen jäsen. Poista ryhmä sen sijaan.';

  @override
  String get apiAdminRequired => 'Vain CamTripin ylläpitäjille';

  @override
  String get apiUploadIncomplete => 'Lataus ei ole valmis';

  @override
  String get apiInvalidInput => 'Virheellinen syöte';

  @override
  String get apiNotSignedIn => 'Et ole kirjautunut sisään';

  @override
  String get apiAccountGone => 'Tiliä ei ole enää olemassa';

  @override
  String get apiPhotoNotFound => 'Kuvaa ei löytynyt';

  @override
  String get apiGroupNotFound => 'Ryhmää ei löytynyt';

  @override
  String get apiMemberNotFound => 'Jäsentä ei löytynyt';

  @override
  String get apiPersonNotFound => 'Henkilöä ei löytynyt';

  @override
  String get apiUserNotFound => 'Käyttäjää ei löytynyt';

  @override
  String get apiAdminOnly => 'Vain ylläpitäjä voi tehdä tämän';

  @override
  String get apiCannotBlockSelf => 'Et voi estää itseäsi';

  @override
  String get apiCannotReportOwn => 'Et voi ilmoittaa omasta kuvastasi';

  @override
  String get apiDeleteOwnOnly => 'Voit poistaa vain omia kuviasi';

  @override
  String get apiOwnerCannotBeRemoved => 'Ryhmän perustajaa ei voi poistaa';

  @override
  String get apiOwnerStaysAdmin => 'Ryhmän perustaja pysyy ylläpitäjänä';

  @override
  String get apiNeedsOneAdmin => 'Ryhmässä on oltava vähintään yksi ylläpitäjä';

  @override
  String get apiEndBeforeStart => 'Päättymispäivä on ennen alkamispäivää';

  @override
  String get apiPermanentNoEndDate =>
      'Aina avoimella ryhmällä ei ole päättymispäivää';

  @override
  String get apiCannotBanAdmin => 'Ylläpitäjää ei voi estää';

  @override
  String get apiReportNotFound => 'Ilmoitusta ei löytynyt';

  @override
  String get apiPhotoOwnerUnknown => 'Kuvan ottajaa ei enää tiedetä';

  @override
  String get validationNameRequired => 'Kirjoita nimesi';

  @override
  String validationMaxChars(int max) {
    return 'Enintään $max merkkiä';
  }

  @override
  String get validationEmailRequired => 'Kirjoita sähköpostiosoitteesi';

  @override
  String get validationEmailInvalid => 'Sähköpostiosoite ei kelpaa';

  @override
  String get validationPasswordRequired => 'Valitse salasana';

  @override
  String validationMinChars(int min) {
    return 'Vähintään $min merkkiä';
  }

  @override
  String get validationPasswordTooLong => 'Salasana on liian pitkä';

  @override
  String get validationPasswordEmpty => 'Kirjoita salasanasi';

  @override
  String get validationCodeRequired => 'Syötä sähköpostin koodi';

  @override
  String get validationCodeDigits => 'Koodissa on 6 numeroa';

  @override
  String get onboarding1Title => 'Yksi filmirulla\nkoko porukalle.';

  @override
  String get onboarding1Body =>
      'Kuvaa retrokameralla. Kaikki näkevät kuvasi heti, ja ne tallentuvat samalla omaan albumiisi.';

  @override
  String get onboarding2Title => 'Ei enää kuvien\nlähettelyä.';

  @override
  String get onboarding2Body =>
      'Luo ryhmä, jaa koodi, valmista. Ei enää koskaan ”voitko lähettää ne kuvat?”';

  @override
  String get onboarding3Title => 'Lopuksi\nkoostevideo.';

  @override
  String get onboarding3Body =>
      'CamTrip tekee parhaista hetkistänne videon musiikin kera.';

  @override
  String get onboardingInvited =>
      'Sinut on kutsuttu! Kirjaudu sisään, niin pääset mukaan.';

  @override
  String get signInAppleFailed => 'Kirjautuminen Applella epäonnistui';

  @override
  String get signInGoogleFailed => 'Kirjautuminen Googlella epäonnistui';

  @override
  String get signInFailed => 'Kirjautuminen epäonnistui';

  @override
  String get next => 'Seuraava';

  @override
  String get legalPrefix => 'Jatkamalla hyväksyt ';

  @override
  String get legalTerms => 'käyttöehdot';

  @override
  String get legalAnd => ' ja ';

  @override
  String get legalPrivacy => 'tietosuojakäytännön';

  @override
  String get legalSuffix => '.';

  @override
  String get continueWithApple => 'Jatka Applella';

  @override
  String get continueWithGoogle => 'Jatka Googlella';

  @override
  String get createAccount => 'Luo tili';

  @override
  String get signIn => 'Kirjaudu sisään';

  @override
  String get or => 'tai';

  @override
  String get registerSubtitle => 'Näin kaverisi näkevät, kuka kuvat ottaa.';

  @override
  String get loginSubtitle => 'Tervetuloa takaisin.';

  @override
  String get forgotPasswordTitle => 'Unohtunut salasana';

  @override
  String get forgotPasswordPushSubtitle =>
      'Oletko vielä kirjautuneena jossain? Lähetämme sinne 6-numeroisen koodin ilmoituksena, jotta voit asettaa uuden salasanan.';

  @override
  String get newPassword => 'Uusi salasana';

  @override
  String get resetPushInfo =>
      'Jos olet vielä kirjautuneena jossain, saat sinne ilmoituksen, jossa on koodi. Etkö pääse sisään? Kirjaudu Applella tai Googlella samalla sähköpostiosoitteella - tilisi yhdistetään silloin.';

  @override
  String get sendCode => 'Lähetä koodi';

  @override
  String get savePassword => 'Tallenna salasana';

  @override
  String get errorTryAgain => 'Jokin meni pieleen. Yritä uudelleen.';

  @override
  String get back => 'Takaisin';

  @override
  String get name => 'Nimi';

  @override
  String get email => 'Sähköpostiosoite';

  @override
  String get codeFromPush => 'Koodi ilmoituksesta';

  @override
  String get password => 'Salasana';

  @override
  String get hidePassword => 'Piilota salasana';

  @override
  String get showPassword => 'Näytä salasana';

  @override
  String get forgotPasswordLink => 'Unohditko salasanan?';

  @override
  String get haveAccount => 'Onko sinulla jo tili?';

  @override
  String get newToCamTrip => 'Uusi CamTripissä?';

  @override
  String get rememberedIt => 'Muistitko sen?';

  @override
  String get noCodeReceived => 'Etkö saanut koodia?';

  @override
  String get resendCode => 'Lähetä uudelleen';

  @override
  String onboardingDemoRoll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kuvaajaa, 1 filmirulla',
      one: '1 kuvaaja, 1 filmirulla',
    );
    return '$_temp0';
  }

  @override
  String membersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count jäsentä',
      one: '1 jäsen',
    );
    return '$_temp0';
  }

  @override
  String photosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kuvaa',
      one: '1 kuva',
    );
    return '$_temp0';
  }

  @override
  String videosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count videota',
      one: '1 video',
    );
    return '$_temp0';
  }

  @override
  String get justNow => 'nyt';

  @override
  String get badgeNew => 'Uusi';

  @override
  String recapTitle(String groupName) {
    return 'Kooste: $groupName';
  }

  @override
  String get styleFilm => 'Filmi';

  @override
  String get styleInstant => 'Instant';

  @override
  String get styleDisposable => 'Kertakäyttö';

  @override
  String get styleBw => 'M/V';

  @override
  String get styleGolden => 'Golden';

  @override
  String get styleChrome => 'Chrome';

  @override
  String get styleFilmDescription =>
      'Lämpimät värit, rakeisuus ja oranssi päiväysleima';

  @override
  String get styleInstantDescription => 'Pehmeät värit ja valkoinen reunus';

  @override
  String get styleDisposableDescription =>
      'Kova salama, vinjetointi ja valovuodot';

  @override
  String get styleBwDescription =>
      'Rakeinen mustavalkoinen syvällä kontrastilla';

  @override
  String get styleGoldenDescription =>
      'Aina kultainen tunti, pehmeä kultainen hehku';

  @override
  String get styleChromeDescription =>
      'Viileä, kylläinen ja terävä kuin diafilmi';

  @override
  String get shutterStopRecording => 'Lopeta tallennus';

  @override
  String get shutterStartRecording => 'Aloita videon tallennus';

  @override
  String get shutterTakePhoto => 'Ota kuva';

  @override
  String get modePhoto => 'Kuva';

  @override
  String get modeVideo => 'Video';

  @override
  String get cameraNotFound => 'Kameraa ei löytynyt';

  @override
  String get cameraAccessNeeded =>
      'CamTrip tarvitsee pääsyn kameraasi. Salli se Asetuksissa.';

  @override
  String get cameraStartFailed => 'Kameraa ei voitu käynnistää';

  @override
  String get albumAccessNeeded =>
      'Anna CamTripille pääsy kuviisi, niin ne tallentuvat myös albumiisi';

  @override
  String get albumSaveFailed =>
      'Albumiin tallennus epäonnistui. Kuva jaetaan silti.';

  @override
  String styleProFallback(String style) {
    return 'Tämä tyyli kuuluu Prohon. Tässä ryhmässä kuvaat tyylillä $style.';
  }

  @override
  String get photoFailed => 'Kuvan ottaminen epäonnistui. Yritä uudelleen.';

  @override
  String get recordingFailed => 'Videon tallennus epäonnistui';

  @override
  String get videoFailed => 'Videon tekeminen epäonnistui. Yritä uudelleen.';

  @override
  String get shootInGroup => 'Kuvaa ryhmään';

  @override
  String get close => 'Sulje';

  @override
  String get flash => 'Salama';

  @override
  String get flashOn => 'Päällä';

  @override
  String get flashOff => 'Pois';

  @override
  String get flashAuto => 'Auto';

  @override
  String get chooseGroup => 'Valitse ryhmä';

  @override
  String get switchCamera => 'Vaihda kameraa';

  @override
  String get createOrJoinFirst => 'Luo ryhmä tai liity ensin johonkin';

  @override
  String get proViaGroup => 'Pro ryhmän kautta';

  @override
  String proViaName(String name) {
    return 'Pro: $name';
  }

  @override
  String get proStylesFreeViaMember =>
      'Pro-tyylit ovat tässä ryhmässä sinulle ilmaisia Pro-jäsenen ansiosta';

  @override
  String proStylesFreeViaName(String name) {
    return 'Pro-tyylit tässä ryhmässä: sinulle ilmaisia, kiitos $name';
  }

  @override
  String get subscriptionsUnavailable =>
      'Tilaukset eivät ole nyt saatavilla. Yritä myöhemmin.';

  @override
  String get paymentPending =>
      'Maksuasi käsitellään vielä. Pro aktivoituu heti, kun se on valmis.';

  @override
  String get purchaseFailed => 'Osto epäonnistui. Yritä myöhemmin uudelleen.';

  @override
  String get restoreUnavailable =>
      'Ostoja ei voi nyt palauttaa. Yritä myöhemmin.';

  @override
  String get restoreFailed =>
      'Palautus epäonnistui. Yritä myöhemmin uudelleen.';

  @override
  String get welcomePro => 'Tervetuloa CamTrip Prohon! 🎉';

  @override
  String get proRestored => 'Pro on palautettu';

  @override
  String get noPurchaseFound => 'Aiempaa ostoa ei löytynyt';

  @override
  String periodDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count päivää',
      one: '1 päivä',
    );
    return '$_temp0';
  }

  @override
  String periodWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count viikkoa',
      one: '1 viikko',
    );
    return '$_temp0';
  }

  @override
  String periodMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kuukautta',
      one: '1 kuukausi',
    );
    return '$_temp0';
  }

  @override
  String periodYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count vuotta',
      one: '1 vuosi',
    );
    return '$_temp0';
  }

  @override
  String get paywallHavePro => 'Sinulla on CamTrip Pro';

  @override
  String get paywallSubtitle => 'Kaikki seuraavaa reissuasi varten.';

  @override
  String paywallFeatureStyles(String styles) {
    return 'Kaikki kameratyylit ($styles)';
  }

  @override
  String get paywallFeatureUnlimited =>
      'Rajattomasti jäseniä ja tallennustilaa, kuvat säilyvät ikuisesti';

  @override
  String get paywallFeatureNoWatermark => 'Koosteet ilman vesileimaa';

  @override
  String get paywallFeatureOriginal => 'Lataus alkuperäisessä laadussa';

  @override
  String get planYear => 'Vuosi';

  @override
  String get planMonth => 'Kuukausi';

  @override
  String pricePerMonth(String price) {
    return '$price kuukaudessa';
  }

  @override
  String paywallSaveBadge(int percent) {
    return 'SÄÄSTÄ $percent %';
  }

  @override
  String get planMonthCancelAnytime => 'peru milloin vain';

  @override
  String tryFree(String period) {
    return 'Kokeile $period ilmaiseksi';
  }

  @override
  String get becomePro => 'Hanki Pro';

  @override
  String get subscriptionsLoadFailed =>
      'Tilauksia ei voitu ladata. Tarkista yhteys.';

  @override
  String legalAnnual(String price) {
    return 'CamTrip Pro -vuositilaus: $price vuodessa.';
  }

  @override
  String legalAnnualTrial(String period, String price) {
    return 'CamTrip Pro -vuositilaus: $period ilmaiseksi, sen jälkeen $price vuodessa.';
  }

  @override
  String legalMonthly(String price) {
    return 'CamTrip Pro -kuukausitilaus: $price kuukaudessa.';
  }

  @override
  String legalMonthlyTrial(String period, String price) {
    return 'CamTrip Pro -kuukausitilaus: $period ilmaiseksi, sen jälkeen $price kuukaudessa.';
  }

  @override
  String get legalBillingApple =>
      'Maksu veloitetaan Apple ID:ltäsi. Tilaus uusiutuu automaattisesti, ellet peru sitä viimeistään 24 tuntia ennen jakson päättymistä. Voit perua ja hallita tilausta App Store -tilisi asetuksissa.';

  @override
  String get legalBillingGoogle =>
      'Maksu veloitetaan Google-tililtäsi. Tilaus uusiutuu automaattisesti, ellet peru sitä viimeistään 24 tuntia ennen jakson päättymistä. Voit perua ja hallita tilausta Google Play -tilisi asetuksissa.';

  @override
  String get restorePurchases => 'Palauta ostot';

  @override
  String get terms => 'Ehdot';

  @override
  String get privacy => 'Tietosuoja';

  @override
  String get groupProTitle => 'Yksi Pro ryhmässä = Pro koko ryhmälle';

  @override
  String get groupProBody =>
      'Jos yhdellä on Pro, koko ryhmä saa kaikki kameratyylit, rajattomasti jäseniä, säilyvät kuvat, alkuperäisen laadun ja koosteet ilman vesileimaa.';

  @override
  String get groupCreated => 'Ryhmä luotu ✓';

  @override
  String get inviteFriends => 'Kutsu kaverisi';

  @override
  String get codeCopied => 'Koodi kopioitu';

  @override
  String get shareLink => 'Jaa linkki';

  @override
  String inviteSubject(String groupName) {
    return 'Liity ryhmään $groupName CamTripissä';
  }

  @override
  String inviteMembersUnlimited(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count jäsentä',
      one: '1 jäsen',
    );
    return '$_temp0 · rajaton (Pro)';
  }

  @override
  String inviteMembersLimit(int count, int limit) {
    return '$count/$limit jäsentä · Pro: rajaton';
  }

  @override
  String get toCamera => 'Kameraan';

  @override
  String get done => 'Valmis';

  @override
  String get joinEnterCode => 'Syötä 6-merkkinen koodi';

  @override
  String get joinGroupTitle => 'Liity ryhmään';

  @override
  String get joinGroupSubtitle =>
      'Syötä kavereidesi koodi tai skannaa heidän QR-koodinsa.';

  @override
  String get typeCode => 'Kirjoita koodi';

  @override
  String get scanQr => 'Skannaa QR';

  @override
  String get join => 'Liity';

  @override
  String get groupNameRequired => 'Anna ryhmälle nimi';

  @override
  String get newGroup => 'Uusi ryhmä';

  @override
  String get groupType => 'Ryhmän tyyppi';

  @override
  String get groupTypeVacation => 'Loma';

  @override
  String get groupTypeVacationDescription =>
      'Alkamis- ja päättymispäivä, sitten arkistoon';

  @override
  String get groupTypeEvent => 'Tapahtuma';

  @override
  String get groupTypeEventDescription => 'Yksi päivä tai ilta, esim. juhlat';

  @override
  String get groupTypePermanent => 'Aina avoin';

  @override
  String get groupTypePermanentDescription => 'Vakituiselle kaveriporukallesi';

  @override
  String get date => 'Päivämäärä';

  @override
  String get departure => 'Lähtö';

  @override
  String get returnDate => 'Paluu';

  @override
  String get defaultCameraStyle => 'Oletuskameratyyli';

  @override
  String freeLimitPermanent(int max) {
    return 'Ilmainen: enintään $max jäsentä. Prolla rajattomasti.';
  }

  @override
  String freeLimitDated(int max, int days) {
    return 'Ilmainen: enintään $max jäsentä, kuvat säilyvät $days päivää päättymispäivän jälkeen. Prolla rajattomasti ja ikuisesti.';
  }

  @override
  String get createGroup => 'Luo ryhmä';

  @override
  String get group => 'Ryhmä';

  @override
  String groupCode(String code) {
    return 'koodi $code';
  }

  @override
  String get manage => 'Hallinta';

  @override
  String get rename => 'Nimeä uudelleen';

  @override
  String get changeDates => 'Muuta päivämääriä';

  @override
  String get finishTrip => 'Päätä reissu';

  @override
  String get finishTripSubtitle => 'Asettaa päättymispäiväksi tämän päivän';

  @override
  String get reopenGroup => 'Avaa ryhmä uudelleen';

  @override
  String get closeGroup => 'Sulje ryhmä';

  @override
  String get reopenGroupSubtitle => 'Jäsenet voivat taas lisätä kuvia';

  @override
  String get closeGroupSubtitle =>
      'Kukaan ei voi enää lisätä kuvia; kaikki näkyy edelleen';

  @override
  String get members => 'Jäsenet';

  @override
  String memberYou(String name) {
    return '$name (sinä)';
  }

  @override
  String get blockedTag => 'estetty';

  @override
  String get adminTag => 'ylläpitäjä';

  @override
  String removeMemberTitle(String name) {
    return 'Poistetaanko $name?';
  }

  @override
  String get removeMemberMessage => 'Hänen kuvansa jäävät ryhmään.';

  @override
  String get remove => 'Poista';

  @override
  String get removeMember => 'Poista';

  @override
  String blockTitle(String name) {
    return 'Estetäänkö $name?';
  }

  @override
  String blockMessage(String name) {
    return 'Et enää näe käyttäjän $name kuvia ja videoita etkä saa niistä ilmoituksia. Voit perua tämän Asetuksissa.';
  }

  @override
  String get block => 'Estä';

  @override
  String get makeMember => 'Tee tavalliseksi jäseneksi';

  @override
  String get makeAdmin => 'Tee ylläpitäjäksi';

  @override
  String get removeFromGroup => 'Poista ryhmästä';

  @override
  String get unblock => 'Poista esto';

  @override
  String get inviteFriendsButton => 'Kutsu kavereita';

  @override
  String get you => 'Sinä';

  @override
  String get unarchive => 'Palauta arkistosta';

  @override
  String get archive => 'Arkistoi';

  @override
  String get unarchiveSubtitle => 'Ryhmä on taas albumiesi joukossa';

  @override
  String archiveSubtitle(String section) {
    return 'Vain sinulle: ryhmä siirtyy kohtaan ”$section” albumiesi alaosaan';
  }

  @override
  String get archivedSection => 'Arkistoidut';

  @override
  String get hiddenPhotos => 'Piilotetut kuvat';

  @override
  String get hiddenPhotosSubtitle => 'Kuvat, jotka olet piilottanut itseltäsi';

  @override
  String get leaveGroup => 'Poistu ryhmästä';

  @override
  String get leaveGroupSubtitle => 'Kuvasi jäävät ryhmään muille';

  @override
  String get deleteGroup => 'Poista ryhmä';

  @override
  String get deleteGroupSubtitle => 'Kaikki kuvat poistetaan kaikilta';

  @override
  String groupArchived(String groupName) {
    return '”$groupName” arkistoitu';
  }

  @override
  String groupUnarchived(String groupName) {
    return '”$groupName” on taas albumiesi joukossa';
  }

  @override
  String get undo => 'Kumoa';

  @override
  String get groupNameTitle => 'Ryhmän nimi';

  @override
  String get finishTripTitle => 'Päätetäänkö reissu?';

  @override
  String get finishTripMessage =>
      'Päättymispäiväksi tulee tämä päivä. Voit yhä lisätä kuvia; kooste on valmis.';

  @override
  String get finishTripConfirm => 'Päätä';

  @override
  String get tripFinished => 'Reissu päätetty';

  @override
  String leaveGroupTitle(String groupName) {
    return 'Poistutaanko ryhmästä ”$groupName”?';
  }

  @override
  String get leaveGroupMessage =>
      'Kuvasi jäävät ryhmään muille. Voit liittyä myöhemmin uudelleen koodilla.';

  @override
  String get leave => 'Poistu';

  @override
  String groupDeleted(String groupName) {
    return '”$groupName” on poistettu';
  }

  @override
  String get youAreAdmin => 'olet ylläpitäjä';

  @override
  String get open => 'Avaa';

  @override
  String get archiveMenuSubtitle => 'Vain sinulle, muut eivät huomaa mitään';

  @override
  String get deleteGroupMenuSubtitle => 'Kaikilta, kaikkine kuvineen';

  @override
  String get deleteGroupTitle => 'Poistetaanko ryhmä?';

  @override
  String deleteGroupMessage(int count, String groupName, int memberCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Kaikki $count kuvaa ja videota ryhmästä ”$groupName” katoavat',
      one: 'Ryhmän ”$groupName” ainoa kuva tai video katoaa',
    );
    String _temp1 = intl.Intl.pluralLogic(
      memberCount,
      locale: localeName,
      other: 'kaikilta $memberCount jäseneltä',
      one: 'ainoalta jäseneltä',
    );
    return '$_temp0 $_temp1. Tätä ei voi kumota.';
  }

  @override
  String get deleteGroupOwnRoll => 'Oma kamerarullasi pysyy ennallaan.';

  @override
  String get deleteGroupTypeName => 'Vahvista kirjoittamalla ryhmän nimi:';

  @override
  String get deleteForEveryone => 'Poista kaikilta';

  @override
  String get save => 'Tallenna';

  @override
  String get yourAlbums => 'Albumisi';

  @override
  String get uploadQueue => 'Latausjono';

  @override
  String get noConnection => 'Ei yhteyttä';

  @override
  String get albumsOfflineMessage =>
      'Albumisi latautuvat, kun olet taas verkossa. Kamera toimii silti.';

  @override
  String get retry => 'Yritä uudelleen';

  @override
  String get noAlbumsTitle => 'Ei vielä albumeja';

  @override
  String get noAlbumsMessage =>
      'Luo ryhmä seuraavaa reissuasi varten tai liity kaverin ryhmään koodilla.';

  @override
  String get haveCode => 'Minulla on koodi';

  @override
  String get joinWithCode => 'Liity koodilla tai QR-koodilla';

  @override
  String get camera => 'Kamera';

  @override
  String get restore => 'Palauta';

  @override
  String get more => 'Lisää';

  @override
  String get newAlbum => 'Uusi';

  @override
  String get closedTag => 'suljettu';

  @override
  String get activeTag => 'aktiivinen';

  @override
  String get uploadFailed => 'Lataus epäonnistui';

  @override
  String get queueNoSignal => 'Ei kenttää.';

  @override
  String get queueNoSignalMessage =>
      'Kuvasi ovat jo albumissasi, ja ne jaetaan heti, kun olet taas verkossa.';

  @override
  String get queueWaitingForWifi => 'Odotetaan Wi-Fiä.';

  @override
  String queueWifiOnlyOn(String setting) {
    return 'Sinulla on ”$setting” päällä.';
  }

  @override
  String get queueVideosWifiOnly => 'Videot ladataan vain Wi-Fin kautta.';

  @override
  String get queueAllShared => 'Kaikki on jaettu ✓';

  @override
  String queuePending(String items) {
    return 'Jakamatta: $items';
  }

  @override
  String queuePendingBoth(String photos, String videos) {
    return 'Jakamatta: $photos ja $videos';
  }

  @override
  String get retryUpload => 'Yritä uudelleen';

  @override
  String get removeFromQueue => 'Poista jonosta';

  @override
  String get queueStatusWifi => 'Wi-Fi';

  @override
  String get queueStatusWaiting => 'odottaa';

  @override
  String get videosWifiOnlyTitle => 'Videot vain Wi-Fin kautta';

  @override
  String get videosWifiOnlySubtitle => 'Säästää mobiilidataa';

  @override
  String get retryNow => 'Yritä nyt uudelleen';

  @override
  String get yourName => 'Nimesi';

  @override
  String get settings => 'Asetukset';

  @override
  String get tapToChangeName => 'Napauta vaihtaaksesi nimesi';

  @override
  String get getCamTripPro => 'Hanki CamTrip Pro';

  @override
  String get photos => 'Kuvat';

  @override
  String get saveOwnPhotos => 'Tallenna omat kuvat ryhmäkohtaiseen albumiin';

  @override
  String get autoSaveOthers => 'Tallenna muiden kuvat automaattisesti';

  @override
  String get wifiOnlyTitle => 'Lataa vain Wi-Fin kautta';

  @override
  String get dateStamp => 'Päiväysleima';

  @override
  String get notifications => 'Ilmoitukset';

  @override
  String get notifyNewPhotos => 'Uudet kuvat (koottuna)';

  @override
  String get notifyRecapReady => 'Kooste valmis';

  @override
  String get camTripTeam => 'CamTrip-tiimi';

  @override
  String get adminEntrySubtitle =>
      'Käyttäjät, Pron antaminen, ilmoitukset ja luvut';

  @override
  String get account => 'Tili';

  @override
  String get manageSubscription => 'Hallitse tilausta';

  @override
  String get blockedPeople => 'Estetyt henkilöt';

  @override
  String get nobody => 'Ei ketään';

  @override
  String peopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count henkilöä',
      one: '1 henkilö',
    );
    return '$_temp0';
  }

  @override
  String get privacyPolicy => 'Tietosuojakäytäntö';

  @override
  String get contact => 'Yhteystiedot';

  @override
  String get signOut => 'Kirjaudu ulos';

  @override
  String get deleteAccount => 'Poista tili';

  @override
  String get deleteAccountSubtitle => 'Poistaa tilisi ja kaikki kuvasi';

  @override
  String get deleteAccountTitle => 'Poistetaanko tili?';

  @override
  String get deleteAccountMessage =>
      'Tilisi ja kaikki kuvasi ja videosi poistetaan, myös ryhmistä. Voimassa olevan tilauksen perut App Storessa tai Google Playssa.';

  @override
  String get blockedTitle => 'Estetyt';

  @override
  String get blockedSubtitle => 'Et näe näiden henkilöiden kuvia.';

  @override
  String get blockedNone => 'Et ole estänyt ketään.';

  @override
  String get unblockShort => 'Poista esto';

  @override
  String get groupGone => 'Tätä ryhmää ei enää ole, tai et ole enää sen jäsen.';

  @override
  String photosSavedToAlbum(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kuvaa tallennettu albumiin ”$album”',
      one: '1 kuva tallennettu albumiin ”$album”',
    );
    return '$_temp0';
  }

  @override
  String photosDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kuvaa poistettu',
      one: '1 kuva poistettu',
    );
    return '$_temp0';
  }

  @override
  String photosDeletedSkipped(int count, int skipped) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kuvaa poistettu',
      one: '1 kuva poistettu',
    );
    return '$_temp0, $skipped ohitettu';
  }

  @override
  String photosHiddenForYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kuvaa piilotettu sinulta',
      one: '1 kuva piilotettu sinulta',
    );
    return '$_temp0';
  }

  @override
  String get addedToFavorites => 'Lisätty suosikkeihin';

  @override
  String get removedFromFavorites => 'Poistettu suosikeista';

  @override
  String get photoAccessSettings =>
      'Anna CamTripille pääsy kuviisi Asetuksissa';

  @override
  String photosBeingAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Lisätään $count kuvaa',
      one: 'Lisätään 1 kuva',
    );
    return '$_temp0';
  }

  @override
  String photosUnreadable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kuvaa ei voitu lukea',
      one: '1 kuvaa ei voitu lukea',
    );
    return '$_temp0';
  }

  @override
  String get groupNotLoaded => 'Ryhmää ei ladattu';

  @override
  String get noFavoritesTitle => 'Ei vielä suosikkeja';

  @override
  String get noPhotosTitle => 'Ei vielä kuvia';

  @override
  String get noFavoritesMessage => 'Napauta kuvan tähteä, niin se tulee tänne.';

  @override
  String get noPhotosMessage =>
      'Ota ensimmäinen kuva. Koko ryhmä näkee sen heti.';

  @override
  String get openCamera => 'Avaa kamera';

  @override
  String savingProgress(int done, int total) {
    return 'Tallennetaan... $done/$total';
  }

  @override
  String get choosePhotos => 'Valitse kuvia';

  @override
  String selectedCount(int count) {
    return '$count valittu';
  }

  @override
  String get selectNone => 'Poista valinnat';

  @override
  String get selectAll => 'Valitse kaikki';

  @override
  String photosWaitingToShare(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kuvaa odottaa jakamista',
      one: '1 kuva odottaa jakamista',
    );
    return '$_temp0';
  }

  @override
  String get recapReadyTitle => 'Koosteesi on valmis';

  @override
  String get recapReadySubtitle => 'Video musiikin kera reissustanne';

  @override
  String get watch => 'Katso';

  @override
  String get makeRecapNow => 'Tee koostevideo nyt';

  @override
  String freeGroupDeleteNotice(String date) {
    return 'Ilmainen ryhmä: kuvat säilyvät $date asti. Tallenna ne tai hanki Pro.';
  }

  @override
  String get filterAll => 'Kaikki';

  @override
  String get filterFavorites => 'Suosikit';

  @override
  String get filterPerPerson => 'Henkilöittäin';

  @override
  String get filterPerson => 'Henkilö';

  @override
  String get select => 'Valitse';

  @override
  String get hiddenFilter => 'Piilotetut';

  @override
  String get photosBy => 'Kuvat henkilöltä...';

  @override
  String get uploadedTag => 'ladattu';

  @override
  String get saveAll => 'Tallenna kaikki';

  @override
  String get favorite => 'Suosikki';

  @override
  String get unfavorite => 'Ei suosikki';

  @override
  String get hide => 'Piilota';

  @override
  String get delete => 'Poista';

  @override
  String deletePhotosTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Poistetaanko $count kuvaa?',
      one: 'Poistetaanko kuva?',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ne katoavat kaikilta ryhmässä. Tätä ei voi kumota.',
      one: 'Se katoaa kaikilta ryhmässä. Tätä ei voi kumota.',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosNotAllowed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count kuvaa on jonkun muun. Ne jäävät; vain ylläpitäjä voi poistaa ne.',
      one: '1 kuva on jonkun muun. Se jää; vain ylläpitäjä voi poistaa sen.',
    );
    return '$_temp0';
  }

  @override
  String photosBackInGroup(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kuvaa on taas ryhmässä',
      one: '1 kuva on taas ryhmässä',
    );
    return '$_temp0';
  }

  @override
  String get showAll => 'Näytä kaikki';

  @override
  String get hiddenPhotosExplainer =>
      'Vain sinä et enää näe näitä kuvia. Muille ryhmässä ne näkyvät edelleen.';

  @override
  String get nothingHidden => 'Ei piilotettuja';

  @override
  String get nothingHiddenMessage => 'Piilottamasi kuvat löydät täältä.';

  @override
  String showAgainCount(int count) {
    return 'Näytä taas ($count)';
  }

  @override
  String get someone => 'Joku';

  @override
  String get savedToAlbum => 'Tallennettu kuva-albumiisi';

  @override
  String get share => 'Jaa';

  @override
  String get shareFailed => 'Jakaminen epäonnistui';

  @override
  String get reportTitle => 'Miksi ilmoitat tästä kuvasta?';

  @override
  String get reportSubtitle =>
      'Käymme jokaisen ilmoituksen läpi 24 tunnin kuluessa. Kuva piilotetaan sinulta heti.';

  @override
  String get reportThanks => 'Kiitos, tarkistamme asian';

  @override
  String blockMessageAllGroups(String name) {
    return 'Et enää näe käyttäjän $name kuvia ja videoita missään ryhmässä etkä saa niistä ilmoituksia. Voit perua tämän Asetuksissa.';
  }

  @override
  String userBlocked(String name) {
    return '$name on estetty';
  }

  @override
  String get videoHiddenForYou => 'Video piilotettu sinulta';

  @override
  String get photoHiddenForYou => 'Kuva piilotettu sinulta';

  @override
  String get setAsCover => 'Aseta kansikuvaksi';

  @override
  String get coverUpdated => 'Kansikuva vaihdettu';

  @override
  String get hideForMe => 'Piilota minulta';

  @override
  String get hideForMeSubtitle => 'Muut ryhmässä näkevät sen yhä';

  @override
  String get reportPhoto => 'Ilmoita kuvasta';

  @override
  String blockName(String name) {
    return 'Estä $name';
  }

  @override
  String get forEveryoneInGroup => 'Kaikilta ryhmässä';

  @override
  String get videoDeleted => 'Video poistettu';

  @override
  String get photoDeleted => 'Kuva poistettu';

  @override
  String get photoAccessToSave =>
      'Anna CamTripille pääsy kuviisi Asetuksissa, jotta voit tallentaa';

  @override
  String get phoneFull => 'Puhelimesi on täynnä';

  @override
  String get albumSaveFailedShort => 'Albumiin tallennus epäonnistui';

  @override
  String get recapTemplateGoldenHour => 'Golden Hour';

  @override
  String get recapTemplateFast => 'Nopea';

  @override
  String get recapTemplateFilmRoll => 'Filmirulla';

  @override
  String get recapTemplatePolaroid => 'Polaroid';

  @override
  String get trackSummerEvening => 'Kesäilta';

  @override
  String get trackGoldenHour => 'Golden Hour';

  @override
  String get trackRoadtrip => 'Road trip';

  @override
  String get moodWarm => 'lämmin';

  @override
  String get moodCheerful => 'iloinen';

  @override
  String friendsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kaveria',
      one: '1 kaveri',
    );
    return '$_temp0';
  }

  @override
  String get madeWithCamTrip => 'Tehty CamTripillä';

  @override
  String get tagline => 'Yksi filmirulla koko porukalle';

  @override
  String get videoUnsupportedDevice =>
      'Videon tekeminen ei onnistunut tällä laitteella';

  @override
  String get groupLoadFailed => 'Ryhmää ei voitu ladata.';

  @override
  String recapNeedsPhotos(int count) {
    return 'Tarvitset koosteeseen vähintään $count kuvaa.';
  }

  @override
  String get recapFailed => 'Koosteen tekeminen epäonnistui. Yritä uudelleen.';

  @override
  String get recapSaved => 'Kooste tallennettu kuva-albumiisi';

  @override
  String get recap => 'Kooste';

  @override
  String get recapRendering => 'Tehdään koostetta...';

  @override
  String get videoRendering => 'Tehdään videota...';

  @override
  String get template => 'Pohja';

  @override
  String get musicLicense => 'CamTripin omaa musiikkia · rojaltivapaa';

  @override
  String get change => 'Vaihda';

  @override
  String get noWatermark => 'Ei vesileimaa ✓';

  @override
  String get removeWatermarkPro => 'Poista vesileima Prolla';

  @override
  String get proSourceSubscription => 'Tilaus';

  @override
  String get proSourceGift => 'Lahja';

  @override
  String get proSourceAdmin => 'Ylläpitäjä';

  @override
  String get proSourceGroup => 'Ryhmän kautta';

  @override
  String get noPro => 'Ei Prota';

  @override
  String proStatusNoEnd(String source) {
    return 'Pro ($source), ei päättymispäivää';
  }

  @override
  String proStatusUntil(String source, String date) {
    return 'Pro ($source), $date asti';
  }

  @override
  String get lifetime => 'Elinikäinen';

  @override
  String get pickDate => 'Valitse päivä';

  @override
  String get noAccess => 'Ei pääsyä';

  @override
  String get adminOnlyTeam => 'Hallinta on vain CamTrip-tiimille.';

  @override
  String get adminOverview => 'Yleiskatsaus';

  @override
  String get adminUsers => 'Käyttäjät';

  @override
  String get adminReports => 'Ilmoitukset';

  @override
  String adminsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ylläpitäjää',
      one: '1 ylläpitäjä',
    );
    return '$_temp0';
  }

  @override
  String get adminNewThisWeek => 'Uudet tällä viikolla';

  @override
  String get adminGroups => 'Ryhmät';

  @override
  String get adminProSubscription => 'Pro tilauksella';

  @override
  String get adminProGift => 'Pro lahjana';

  @override
  String adminWithoutSubscription(int count) {
    return '$count ilman tilausta';
  }

  @override
  String get adminOpenReports => 'Avoimet ilmoitukset';

  @override
  String get adminSearchHint => 'Hae nimellä tai sähköpostilla';

  @override
  String get nobodyFound => 'Ketään ei löytynyt';

  @override
  String get loadMore => 'Lataa lisää';

  @override
  String get noEmail => 'Ei sähköpostia';

  @override
  String adminDeletePhotoMessage(String groupName) {
    return 'Kuva katoaa kaikilta ryhmässä ”$groupName”. Kaikki kuvan ilmoitukset käsitellään.';
  }

  @override
  String get adminBanMessage =>
      'Tili ei voi enää kirjautua sisään eikä käyttää sovellusta. Voit perua tämän myöhemmin.';

  @override
  String get adminDismissTitle => 'Hylätäänkö ilmoitus?';

  @override
  String get adminDismissMessage =>
      'Kuva jää. Ilmoitus merkitään käsitellyksi.';

  @override
  String get adminDismiss => 'Hylkää';

  @override
  String get adminAccountBlocked => 'Tili estetty';

  @override
  String get adminReportDismissed => 'Ilmoitus hylätty';

  @override
  String get adminNoReports => 'Ei avoimia ilmoituksia';

  @override
  String get adminNoReportsMessage => 'Ilmoitetut kuvat näkyvät täällä.';

  @override
  String get deletedTag => 'Poistettu';

  @override
  String adminReportedBy(String name) {
    return 'Ilmoittaja: $name';
  }

  @override
  String adminPhotoBy(String name) {
    return 'Kuvaaja: $name';
  }

  @override
  String reportsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ilmoitusta',
      one: '1 ilmoitus',
    );
    return '$_temp0';
  }

  @override
  String get adminDeletePhoto => 'Poista kuva';

  @override
  String get adminBlockCreator => 'Estä kuvaaja';

  @override
  String get loadFailed => 'Lataus epäonnistui';

  @override
  String get adminLifetimeProGiven => 'Elinikäinen Pro annettu';

  @override
  String get adminProGiven => 'Pro annettu';

  @override
  String adminGiveProUntil(String date) {
    return 'Anna Pro $date asti';
  }

  @override
  String get adminGiveProLifetime => 'Anna elinikäinen Pro';

  @override
  String adminGiveProFor(String period) {
    return 'Anna Pro ajaksi $period';
  }

  @override
  String get adminReasonHint => 'Syy, esim. kaveri, testaaja, vaikuttaja';

  @override
  String get adminGivePro => 'Anna Pro';

  @override
  String get adminRevokeTitle => 'Perutaanko lahja?';

  @override
  String get adminRevokeMessage =>
      'Lahjaksi annettu Pro päättyy heti. Oma tilaus jatkuu normaalisti.';

  @override
  String get adminRevoke => 'Peru';

  @override
  String get adminGiftRevoked => 'Lahja peruttu';

  @override
  String get adminUnbanTitle => 'Poistetaanko esto?';

  @override
  String adminUnbanMessage(String name) {
    return '$name voi taas kirjautua sisään.';
  }

  @override
  String get adminUnbanned => 'Esto poistettu';

  @override
  String get adminBanUserMessage =>
      'Tili ei voi enää kirjautua sisään eikä käyttää sovellusta. Kuvat jäävät.';

  @override
  String get adminUser => 'Käyttäjä';

  @override
  String get adminNotVerified => 'vahvistamaton';

  @override
  String get adminRole => 'Rooli';

  @override
  String get adminCreated => 'Luotu';

  @override
  String get unknown => 'Tuntematon';

  @override
  String get adminSignInWith => 'Kirjautuu palvelulla';

  @override
  String get adminEmailMethod => 'Sähköposti';

  @override
  String get adminPhotosAndVideos => 'Kuvat ja videot';

  @override
  String get adminStatus => 'Tila';

  @override
  String get adminActive => 'Voimassa';

  @override
  String adminActiveUntil(String date) {
    return 'Voimassa $date asti';
  }

  @override
  String adminGiftFrom(String name) {
    return 'Lahja käyttäjältä $name';
  }

  @override
  String adminExpiredOn(String date) {
    return 'Päättyi $date';
  }

  @override
  String get adminExpired => 'Päättynyt';

  @override
  String adminUntil(String date) {
    return '$date asti';
  }

  @override
  String get adminGiveProTitle => 'Anna Pro';

  @override
  String get adminGiveProNote =>
      'Pätee myös tämän henkilön ryhmiin: yksi Pro ryhmässä = Pro koko ryhmälle.';

  @override
  String get adminRevokeGift => 'Peru lahja';

  @override
  String get adminModeration => 'Moderointi';

  @override
  String get adminCannotBanSelf => 'Et voi estää itseäsi.';

  @override
  String get adminCannotBanAdmin => 'Ylläpitäjää ei voi estää.';

  @override
  String get adminUnban => 'Poista esto';

  @override
  String get adminBanAccount => 'Estä tili';

  @override
  String get googleSignInUnavailable =>
      'Kirjautuminen Googlella ei ole vielä käytettävissä';
}
