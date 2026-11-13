// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Filipino Pilipino (`fil`).
class AppLocalizationsFil extends AppLocalizations {
  AppLocalizationsFil([String locale = 'fil']) : super(locale);

  @override
  String get cancel => 'Kanselahin';

  @override
  String get yes => 'Oo';

  @override
  String inviteMessageIntro(String groupName) {
    return 'Sali ka sa \"$groupName\" sa CamTrip? Para makita agad natin ang mga litrato ng isa\'t isa.';
  }

  @override
  String inviteMessageCode(String code) {
    return 'O ilagay ang code: $code';
  }

  @override
  String get memberFallbackName => 'Kaibigan';

  @override
  String get reportReasonInappropriate => 'Hindi angkop o nakakasakit';

  @override
  String get reportReasonSpam => 'Spam';

  @override
  String get reportReasonOther => 'Iba pa';

  @override
  String dateRangeSameMonth(
    String startDay,
    String endDay,
    String month,
    String monthNum,
    String endDate,
  ) {
    return '$month $startDay-$endDay';
  }

  @override
  String get errorOffline => 'Walang koneksyon. Subukan ulit mamaya.';

  @override
  String errorSomethingWrongStatus(int status) {
    return 'May nangyaring mali ($status)';
  }

  @override
  String get errorSomethingWrong => 'May nangyaring mali';

  @override
  String get apiInvalidCredentials => 'Mali ang email address o password';

  @override
  String get apiInvalidCode =>
      'Mali o expired na ang code na ito. Humingi ng bagong code.';

  @override
  String get apiEmailTaken =>
      'May account na gamit ang email address na ito. Mag-sign in, o piliin ang \"Nakalimutan ang password?\".';

  @override
  String apiEmailTakenProvider(String provider) {
    return 'May account na gamit ang email address na ito. Mag-sign in gamit ang $provider.';
  }

  @override
  String apiWeakPassword(int min) {
    return 'Pumili ng password na may hindi bababa sa $min na character';
  }

  @override
  String apiNameTooLong(int max) {
    return 'Hanggang $max na character lang ang pangalan mo';
  }

  @override
  String get apiRateLimited =>
      'Masyadong maraming pagsubok. Subukan ulit pagkalipas ng 15 minuto.';

  @override
  String apiAccountBanned(String email) {
    return 'Na-block ang account mo. Makipag-ugnayan sa $email kung sa tingin mo ay pagkakamali ito.';
  }

  @override
  String get apiProRequired => 'Bahagi ng CamTrip Pro ang camera style na ito';

  @override
  String get apiGroupClosed => 'Sarado na ang grupong ito';

  @override
  String get apiGroupCodeNotFound => 'Walang grupong may ganitong code';

  @override
  String apiGroupFull(int max) {
    return 'Puno na ang grupong ito (max. $max miyembro). Kung may CamTrip Pro ang isang miyembro, kahit sino ay puwedeng sumali.';
  }

  @override
  String get apiLastMember =>
      'Ikaw na lang ang natitirang miyembro. I-delete na lang ang grupo.';

  @override
  String get apiAdminRequired => 'Para lang sa mga administrator ng CamTrip';

  @override
  String get apiUploadIncomplete => 'Hindi kumpleto ang upload';

  @override
  String get apiInvalidInput => 'Hindi valid ang input';

  @override
  String get apiNotSignedIn => 'Hindi naka-sign in';

  @override
  String get apiAccountGone => 'Wala na ang account na ito';

  @override
  String get apiPhotoNotFound => 'Hindi nakita ang litrato';

  @override
  String get apiGroupNotFound => 'Hindi nakita ang grupo';

  @override
  String get apiMemberNotFound => 'Hindi nakita ang miyembro';

  @override
  String get apiPersonNotFound => 'Hindi nakita ang tao';

  @override
  String get apiUserNotFound => 'Hindi nakita ang user';

  @override
  String get apiAdminOnly => 'Admin lang ang puwedeng gumawa nito';

  @override
  String get apiCannotBlockSelf => 'Hindi mo puwedeng i-block ang sarili mo';

  @override
  String get apiCannotReportOwn =>
      'Hindi mo puwedeng i-report ang sarili mong litrato';

  @override
  String get apiDeleteOwnOnly =>
      'Sarili mong mga litrato lang ang puwede mong i-delete';

  @override
  String get apiOwnerCannotBeRemoved =>
      'Hindi puwedeng alisin ang gumawa ng grupo';

  @override
  String get apiOwnerStaysAdmin => 'Laging admin ang gumawa ng grupo';

  @override
  String get apiNeedsOneAdmin => 'Kailangan ng grupo ng kahit isang admin';

  @override
  String get apiEndBeforeStart =>
      'Nauuna ang petsa ng pagtatapos sa petsa ng simula';

  @override
  String get apiPermanentNoEndDate =>
      'Walang petsa ng pagtatapos ang grupong laging bukas';

  @override
  String get apiCannotBanAdmin => 'Hindi puwedeng i-block ang administrator';

  @override
  String get apiReportNotFound => 'Hindi nakita ang report';

  @override
  String get apiPhotoOwnerUnknown =>
      'Hindi na alam kung sino ang kumuha ng litratong ito';

  @override
  String get validationNameRequired => 'Ilagay ang pangalan mo';

  @override
  String validationMaxChars(int max) {
    return 'Hanggang $max na character';
  }

  @override
  String get validationEmailRequired => 'Ilagay ang email address mo';

  @override
  String get validationEmailInvalid => 'Hindi valid ang email address na ito';

  @override
  String get validationPasswordRequired => 'Pumili ng password';

  @override
  String validationMinChars(int min) {
    return 'Hindi bababa sa $min na character';
  }

  @override
  String get validationPasswordTooLong =>
      'Masyadong mahaba ang password na ito';

  @override
  String get validationPasswordEmpty => 'Ilagay ang password mo';

  @override
  String get validationCodeRequired => 'Ilagay ang code mula sa email';

  @override
  String get validationCodeDigits => 'May 6 na digit ang code';

  @override
  String get onboarding1Title => 'Isang roll\npara sa buong barkada.';

  @override
  String get onboarding1Body =>
      'Kumuha gamit ang retro na camera. Makikita agad ng lahat ang mga litrato mo, at nasa sarili mong album na rin ang mga ito.';

  @override
  String get onboarding2Title => 'Wala nang\npasahan ng litrato.';

  @override
  String get onboarding2Body =>
      'Gumawa ng grupo, i-share ang code, tapos na. Wala nang \"pasa mo naman \'yung mga litrato?\"';

  @override
  String get onboarding3Title => 'Isang recap video\npagkatapos.';

  @override
  String get onboarding3Body =>
      'Gumagawa ang CamTrip ng video na may musika mula sa pinakamagagandang sandali ninyo.';

  @override
  String get onboardingInvited => 'Inimbitahan ka! Mag-sign in para sumali.';

  @override
  String get signInAppleFailed =>
      'Hindi gumana ang pag-sign in gamit ang Apple';

  @override
  String get signInGoogleFailed =>
      'Hindi gumana ang pag-sign in gamit ang Google';

  @override
  String get signInFailed => 'Hindi gumana ang pag-sign in';

  @override
  String get next => 'Susunod';

  @override
  String get legalPrefix => 'Sa pagpapatuloy, sumasang-ayon ka sa';

  @override
  String get legalTerms => 'mga tuntunin';

  @override
  String get legalAnd => ' at sa';

  @override
  String get legalPrivacy => 'patakaran sa privacy';

  @override
  String get legalSuffix => '.';

  @override
  String get continueWithApple => 'Magpatuloy gamit ang Apple';

  @override
  String get continueWithGoogle => 'Magpatuloy gamit ang Google';

  @override
  String get createAccount => 'Gumawa ng account';

  @override
  String get signIn => 'Mag-sign in';

  @override
  String get or => 'o';

  @override
  String get registerSubtitle =>
      'Para makita ng mga kaibigan mo kung sino ang kumuha ng mga litrato.';

  @override
  String get loginSubtitle => 'Maligayang pagbabalik.';

  @override
  String get forgotPasswordTitle => 'Nakalimutan ang password';

  @override
  String get forgotPasswordPushSubtitle =>
      'Naka-sign in ka pa ba sa ibang device? Magpapadala kami roon ng 6-digit na code bilang push notification para makagawa ka ng bagong password.';

  @override
  String get newPassword => 'Bagong password';

  @override
  String get resetPushInfo =>
      'Kung naka-sign in ka pa sa ibang device, makakatanggap ka roon ng push notification na may code. Hindi makapasok? Mag-sign in gamit ang Apple o Google na may parehong email address - mali-link ang account mo.';

  @override
  String get sendCode => 'Ipadala ang code';

  @override
  String get savePassword => 'I-save ang password';

  @override
  String get errorTryAgain => 'May nangyaring mali. Pakisubukan ulit.';

  @override
  String get back => 'Bumalik';

  @override
  String get name => 'Pangalan';

  @override
  String get email => 'Email address';

  @override
  String get codeFromPush => 'Code mula sa notification';

  @override
  String get password => 'Password';

  @override
  String get hidePassword => 'Itago ang password';

  @override
  String get showPassword => 'Ipakita ang password';

  @override
  String get forgotPasswordLink => 'Nakalimutan ang password?';

  @override
  String get haveAccount => 'May account ka na?';

  @override
  String get newToCamTrip => 'Bago sa CamTrip?';

  @override
  String get rememberedIt => 'Naalala mo na?';

  @override
  String get noCodeReceived => 'Hindi nakatanggap ng code?';

  @override
  String get resendCode => 'Ipadala ulit';

  @override
  String onboardingDemoRoll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count na photographer, 1 roll',
      one: '$count photographer, 1 roll',
    );
    return '$_temp0';
  }

  @override
  String membersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count na miyembro',
      one: '$count miyembro',
    );
    return '$_temp0';
  }

  @override
  String photosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count na litrato',
      one: '$count litrato',
    );
    return '$_temp0';
  }

  @override
  String videosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count na video',
      one: '$count video',
    );
    return '$_temp0';
  }

  @override
  String get justNow => 'ngayon lang';

  @override
  String get badgeNew => 'Bago';

  @override
  String recapTitle(String groupName) {
    return 'Recap $groupName';
  }

  @override
  String get styleFilm => 'Film';

  @override
  String get styleInstant => 'Instant';

  @override
  String get styleDisposable => 'Disposable';

  @override
  String get styleBw => 'B&W';

  @override
  String get styleGolden => 'Golden';

  @override
  String get styleChrome => 'Chrome';

  @override
  String get styleFilmDescription =>
      'Maiinit na kulay, grain at orange na petsa';

  @override
  String get styleInstantDescription => 'Malalambot na kulay at puting border';

  @override
  String get styleDisposableDescription =>
      'Matinding flash, vignette at light leak';

  @override
  String get styleBwDescription =>
      'Grainy na black and white na may malalim na contrast';

  @override
  String get styleGoldenDescription =>
      'Laging golden hour, malambot na gintong liwanag';

  @override
  String get styleChromeDescription =>
      'Malamig, matingkad at matalas, parang slide film';

  @override
  String get shutterStopRecording => 'Ihinto ang pag-record';

  @override
  String get shutterStartRecording => 'Simulan ang pag-record ng video';

  @override
  String get shutterTakePhoto => 'Kumuha ng litrato';

  @override
  String get modePhoto => 'Litrato';

  @override
  String get modeVideo => 'Video';

  @override
  String get cameraNotFound => 'Walang nakitang camera';

  @override
  String get cameraAccessNeeded =>
      'Kailangan ng CamTrip ng access sa camera mo. I-on ito sa Settings.';

  @override
  String get cameraStartFailed => 'Hindi nag-start ang camera';

  @override
  String get albumAccessNeeded =>
      'Bigyan ang CamTrip ng access sa mga litrato mo para ma-save din ang mga ito sa album mo';

  @override
  String get albumSaveFailed =>
      'Hindi na-save sa album mo. Na-share pa rin ang litrato.';

  @override
  String styleProFallback(String style) {
    return 'Bahagi ng Pro ang style na ito. Sa grupong ito, kumukuha ka gamit ang $style.';
  }

  @override
  String get photoFailed => 'Hindi nakakuha ng litrato. Pakisubukan ulit.';

  @override
  String get recordingFailed => 'Hindi na-record ang video';

  @override
  String get videoFailed => 'Hindi nagawa ang video. Pakisubukan ulit.';

  @override
  String get shootInGroup => 'Kumuha sa grupo';

  @override
  String get close => 'Isara';

  @override
  String get flash => 'Flash';

  @override
  String get flashOn => 'On';

  @override
  String get flashOff => 'Off';

  @override
  String get flashAuto => 'Auto';

  @override
  String get chooseGroup => 'Pumili ng grupo';

  @override
  String get switchCamera => 'Palitan ang camera';

  @override
  String get createOrJoinFirst => 'Gumawa o sumali muna sa isang grupo';

  @override
  String get proViaGroup => 'Pro dahil sa grupo';

  @override
  String proViaName(String name) {
    return 'Pro dahil kay $name';
  }

  @override
  String get proStylesFreeViaMember =>
      'Libre para sa iyo ang mga Pro style sa grupong ito dahil sa isang Pro member';

  @override
  String proStylesFreeViaName(String name) {
    return 'Mga Pro style sa grupong ito: libre para sa iyo dahil kay $name';
  }

  @override
  String get subscriptionsUnavailable =>
      'Hindi available ang mga subscription ngayon. Subukan ulit mamaya.';

  @override
  String get paymentPending =>
      'Pinoproseso pa ang bayad mo. Mao-on ang Pro kapag tapos na.';

  @override
  String get purchaseFailed =>
      'Hindi natuloy ang pagbili. Subukan ulit mamaya.';

  @override
  String get restoreUnavailable =>
      'Hindi pa ma-restore ang mga binili ngayon. Subukan ulit mamaya.';

  @override
  String get restoreFailed => 'Hindi na-restore. Subukan ulit mamaya.';

  @override
  String get welcomePro => 'Welcome sa CamTrip Pro! 🎉';

  @override
  String get proRestored => 'Na-restore ang Pro';

  @override
  String get noPurchaseFound => 'Walang nakitang naunang binili';

  @override
  String periodDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count na araw',
      one: '$count araw',
    );
    return '$_temp0';
  }

  @override
  String periodWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count na linggo',
      one: '$count linggo',
    );
    return '$_temp0';
  }

  @override
  String periodMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count na buwan',
      one: '$count buwan',
    );
    return '$_temp0';
  }

  @override
  String periodYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count na taon',
      one: '$count taon',
    );
    return '$_temp0';
  }

  @override
  String get paywallHavePro => 'May CamTrip Pro ka';

  @override
  String get paywallSubtitle => 'Lahat para sa susunod mong biyahe.';

  @override
  String paywallFeatureStyles(String styles) {
    return 'Lahat ng camera style ($styles)';
  }

  @override
  String get paywallFeatureUnlimited =>
      'Walang limitasyon sa miyembro at storage, habambuhay naka-save ang mga litrato';

  @override
  String get paywallFeatureNoWatermark => 'Mga recap na walang watermark';

  @override
  String get paywallFeatureOriginal => 'Mag-download sa orihinal na kalidad';

  @override
  String get planYear => 'Taunan';

  @override
  String get planMonth => 'Buwanan';

  @override
  String pricePerMonth(String price) {
    return '$price kada buwan';
  }

  @override
  String paywallSaveBadge(int percent) {
    return 'MAKATIPID NG $percent%';
  }

  @override
  String get planMonthCancelAnytime => 'i-cancel anumang oras';

  @override
  String tryFree(String period) {
    return 'Subukan nang libre ang $period';
  }

  @override
  String get becomePro => 'Mag-Pro';

  @override
  String get subscriptionsLoadFailed =>
      'Hindi ma-load ang mga subscription. Tingnan ang koneksyon mo.';

  @override
  String legalAnnual(String price) {
    return 'Taunang subscription sa CamTrip Pro: $price kada taon.';
  }

  @override
  String legalAnnualTrial(String period, String price) {
    return 'Taunang subscription sa CamTrip Pro: libre ang $period, pagkatapos ay $price kada taon.';
  }

  @override
  String legalMonthly(String price) {
    return 'Buwanang subscription sa CamTrip Pro: $price kada buwan.';
  }

  @override
  String legalMonthlyTrial(String period, String price) {
    return 'Buwanang subscription sa CamTrip Pro: libre ang $period, pagkatapos ay $price kada buwan.';
  }

  @override
  String get legalBillingApple =>
      'Sisingilin ang bayad sa Apple ID mo. Awtomatikong magre-renew ang subscription maliban kung kakanselahin mo ito nang hindi bababa sa 24 na oras bago matapos ang period. Puwede mo itong kanselahin at pamahalaan sa settings ng App Store account mo.';

  @override
  String get legalBillingGoogle =>
      'Sisingilin ang bayad sa Google account mo. Awtomatikong magre-renew ang subscription maliban kung kakanselahin mo ito nang hindi bababa sa 24 na oras bago matapos ang period. Puwede mo itong kanselahin at pamahalaan sa settings ng Google Play account mo.';

  @override
  String get restorePurchases => 'I-restore ang mga binili';

  @override
  String get terms => 'Mga tuntunin';

  @override
  String get privacy => 'Privacy';

  @override
  String get groupProTitle =>
      'Isang Pro sa grupo = Pro para sa lahat sa grupong iyon';

  @override
  String get groupProBody =>
      'Kung may Pro ang isang tao, makukuha ng buong grupo ang lahat ng camera style, walang limitasyong miyembro, mga litratong naka-save, orihinal na kalidad at mga recap na walang watermark.';

  @override
  String get groupCreated => 'Nagawa ang grupo ✓';

  @override
  String get inviteFriends => 'Imbitahan ang mga kaibigan mo';

  @override
  String get codeCopied => 'Nakopya ang code';

  @override
  String get shareLink => 'I-share ang link';

  @override
  String inviteSubject(String groupName) {
    return 'Sumali sa $groupName sa CamTrip';
  }

  @override
  String inviteMembersUnlimited(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count na miyembro',
      one: '$count miyembro',
    );
    return '$_temp0 · walang limitasyon (Pro)';
  }

  @override
  String inviteMembersLimit(int count, int limit) {
    return '$count sa $limit na miyembro · Pro: walang limitasyon';
  }

  @override
  String get toCamera => 'Pumunta sa camera';

  @override
  String get done => 'Tapos na';

  @override
  String get joinEnterCode => 'Ilagay ang 6-character na code';

  @override
  String get joinGroupTitle => 'Sumali sa grupo';

  @override
  String get joinGroupSubtitle =>
      'Ilagay ang code ng mga kaibigan mo, o i-scan ang QR code nila.';

  @override
  String get typeCode => 'I-type ang code';

  @override
  String get scanQr => 'I-scan ang QR';

  @override
  String get join => 'Sumali';

  @override
  String get groupNameRequired => 'Bigyan ng pangalan ang grupo mo';

  @override
  String get newGroup => 'Bagong grupo';

  @override
  String get groupType => 'Uri ng grupo';

  @override
  String get groupTypeVacation => 'Bakasyon';

  @override
  String get groupTypeVacationDescription =>
      'May petsa ng simula at pagtatapos, pagkatapos ay ia-archive';

  @override
  String get groupTypeEvent => 'Event';

  @override
  String get groupTypeEventDescription => 'Isang araw o gabi, hal. isang party';

  @override
  String get groupTypePermanent => 'Laging bukas';

  @override
  String get groupTypePermanentDescription =>
      'Para sa tropa mong palaging magkasama';

  @override
  String get date => 'Petsa';

  @override
  String get departure => 'Alis';

  @override
  String get returnDate => 'Balik';

  @override
  String get defaultCameraStyle => 'Default na camera style';

  @override
  String freeLimitPermanent(int max) {
    return 'Libre: hanggang $max miyembro. Walang limitasyon sa Pro.';
  }

  @override
  String freeLimitDated(int max, int days) {
    return 'Libre: hanggang $max miyembro, naka-save ang mga litrato hanggang $days araw pagkatapos ng huling petsa. Walang limitasyon at habambuhay sa Pro.';
  }

  @override
  String get createGroup => 'Gumawa ng grupo';

  @override
  String get group => 'Grupo';

  @override
  String groupCode(String code) {
    return 'code $code';
  }

  @override
  String get manage => 'Pamahalaan';

  @override
  String get rename => 'Palitan ang pangalan';

  @override
  String get changeDates => 'Palitan ang mga petsa';

  @override
  String get finishTrip => 'Tapusin ang biyahe';

  @override
  String get finishTripSubtitle => 'Gagawing ngayon ang huling petsa';

  @override
  String get reopenGroup => 'Buksan ulit ang grupo';

  @override
  String get closeGroup => 'Isara ang grupo';

  @override
  String get reopenGroupSubtitle =>
      'Puwede na ulit magdagdag ng litrato ang mga miyembro';

  @override
  String get closeGroupSubtitle =>
      'Wala nang makakapagdagdag ng litrato; puwede pa ring tingnan ang lahat';

  @override
  String get members => 'Mga miyembro';

  @override
  String memberYou(String name) {
    return '$name (ikaw)';
  }

  @override
  String get blockedTag => 'naka-block';

  @override
  String get adminTag => 'admin';

  @override
  String removeMemberTitle(String name) {
    return 'Alisin si $name?';
  }

  @override
  String get removeMemberMessage => 'Mananatili sa grupo ang mga litrato nila.';

  @override
  String get remove => 'I-delete';

  @override
  String get removeMember => 'Alisin';

  @override
  String blockTitle(String name) {
    return 'I-block si $name?';
  }

  @override
  String blockMessage(String name) {
    return 'Hindi mo na makikita ang mga litrato at video ni $name at hindi ka na makakatanggap ng notification tungkol dito. Puwede mo itong i-undo sa Settings.';
  }

  @override
  String get block => 'I-block';

  @override
  String get makeMember => 'Gawing regular na miyembro';

  @override
  String get makeAdmin => 'Gawing admin';

  @override
  String get removeFromGroup => 'Alisin sa grupo';

  @override
  String get unblock => 'I-unblock';

  @override
  String get inviteFriendsButton => 'Mag-imbita ng kaibigan';

  @override
  String get you => 'Ikaw';

  @override
  String get unarchive => 'Ibalik mula sa archive';

  @override
  String get archive => 'I-archive';

  @override
  String get unarchiveSubtitle => 'Bumalik na ang grupo sa mga album mo';

  @override
  String archiveSubtitle(String section) {
    return 'Para sa iyo lang: lilipat ang grupo sa \"$section\" sa ibaba ng mga album mo';
  }

  @override
  String get archivedSection => 'Naka-archive';

  @override
  String get hiddenPhotos => 'Mga nakatagong litrato';

  @override
  String get hiddenPhotosSubtitle =>
      'Mga litratong itinago mo para sa sarili mo';

  @override
  String get leaveGroup => 'Umalis sa grupo';

  @override
  String get leaveGroupSubtitle =>
      'Mananatili sa grupo ang mga litrato mo para sa iba';

  @override
  String get deleteGroup => 'I-delete ang grupo';

  @override
  String get deleteGroupSubtitle =>
      'Made-delete ang lahat ng litrato para sa lahat';

  @override
  String groupArchived(String groupName) {
    return 'Na-archive ang \"$groupName\"';
  }

  @override
  String groupUnarchived(String groupName) {
    return 'Bumalik na ang \"$groupName\" sa mga album mo';
  }

  @override
  String get undo => 'I-undo';

  @override
  String get groupNameTitle => 'Pangalan ng grupo';

  @override
  String get finishTripTitle => 'Tapusin ang biyahe?';

  @override
  String get finishTripMessage =>
      'Magiging ngayon ang huling petsa. Puwede ka pa ring magdagdag ng litrato; handa na ang recap.';

  @override
  String get finishTripConfirm => 'Tapusin';

  @override
  String get tripFinished => 'Tapos na ang biyahe';

  @override
  String leaveGroupTitle(String groupName) {
    return 'Umalis sa \"$groupName\"?';
  }

  @override
  String get leaveGroupMessage =>
      'Mananatili sa grupo ang mga litrato mo para sa iba. Puwede kang sumali ulit gamit ang code.';

  @override
  String get leave => 'Umalis';

  @override
  String groupDeleted(String groupName) {
    return 'Na-delete ang \"$groupName\"';
  }

  @override
  String get youAreAdmin => 'admin ka';

  @override
  String get open => 'Buksan';

  @override
  String get archiveMenuSubtitle => 'Para sa iyo lang, hindi mapapansin ng iba';

  @override
  String get deleteGroupMenuSubtitle =>
      'Para sa lahat, kasama ang lahat ng litrato';

  @override
  String get deleteGroupTitle => 'I-delete ang grupo?';

  @override
  String deleteGroupMessage(int count, String groupName, int memberCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'lahat ng $count na litrato at video',
      one: '$count litrato o video',
    );
    String _temp1 = intl.Intl.pluralLogic(
      memberCount,
      locale: localeName,
      other: 'lahat ng $memberCount na miyembro',
      one: '$memberCount miyembro',
    );
    return 'Mawawala ang $_temp0 sa \"$groupName\" para sa $_temp1. Hindi na ito maibabalik.';
  }

  @override
  String get deleteGroupOwnRoll =>
      'Hindi magbabago ang sarili mong camera roll.';

  @override
  String get deleteGroupTypeName =>
      'I-type ang pangalan ng grupo para kumpirmahin:';

  @override
  String get deleteForEveryone => 'I-delete para sa lahat';

  @override
  String get save => 'I-save';

  @override
  String get yourAlbums => 'Mga album mo';

  @override
  String get uploadQueue => 'Upload queue';

  @override
  String get noConnection => 'Walang koneksyon';

  @override
  String get albumsOfflineMessage =>
      'Maglo-load ang mga album mo kapag online ka na ulit. Gumagana pa rin ang camera.';

  @override
  String get retry => 'Subukan ulit';

  @override
  String get noAlbumsTitle => 'Wala pang album';

  @override
  String get noAlbumsMessage =>
      'Gumawa ng grupo para sa susunod mong biyahe, o sumali sa grupo ng kaibigan gamit ang code nila.';

  @override
  String get haveCode => 'May code ako';

  @override
  String get joinWithCode => 'Sumali gamit ang code o QR code';

  @override
  String get camera => 'Camera';

  @override
  String get restore => 'I-restore';

  @override
  String get more => 'Higit pa';

  @override
  String get newAlbum => 'Bago';

  @override
  String get closedTag => 'sarado';

  @override
  String get activeTag => 'aktibo';

  @override
  String get uploadFailed => 'Nabigo ang upload';

  @override
  String get queueNoSignal => 'Walang signal.';

  @override
  String get queueNoSignalMessage =>
      'Nasa album mo na ang mga litrato mo at isha-share ang mga ito kapag online ka na ulit.';

  @override
  String get queueWaitingForWifi => 'Naghihintay ng Wi-Fi.';

  @override
  String queueWifiOnlyOn(String setting) {
    return 'Naka-on ang \"$setting\".';
  }

  @override
  String get queueVideosWifiOnly => 'Sa Wi-Fi lang ipinapadala ang mga video.';

  @override
  String get queueAllShared => 'Na-share na lahat ✓';

  @override
  String queuePending(String items) {
    return '$items pa ang isha-share';
  }

  @override
  String queuePendingBoth(String photos, String videos) {
    return '$photos at $videos pa ang isha-share';
  }

  @override
  String get retryUpload => 'Subukan ulit';

  @override
  String get removeFromQueue => 'Alisin sa queue';

  @override
  String get queueStatusWifi => 'Wi-Fi';

  @override
  String get queueStatusWaiting => 'naghihintay';

  @override
  String get videosWifiOnlyTitle => 'Video sa Wi-Fi lang';

  @override
  String get videosWifiOnlySubtitle => 'Nakakatipid ng mobile data';

  @override
  String get retryNow => 'Subukan ngayon';

  @override
  String get yourName => 'Pangalan mo';

  @override
  String get settings => 'Settings';

  @override
  String get tapToChangeName => 'I-tap para palitan ang pangalan mo';

  @override
  String get getCamTripPro => 'Kumuha ng CamTrip Pro';

  @override
  String get photos => 'Mga litrato';

  @override
  String get saveOwnPhotos => 'I-save ang mga litrato ko sa album kada grupo';

  @override
  String get autoSaveOthers => 'Awtomatikong i-save ang mga litrato ng iba';

  @override
  String get wifiOnlyTitle => 'Mag-upload sa Wi-Fi lang';

  @override
  String get dateStamp => 'Date stamp';

  @override
  String get notifications => 'Mga notification';

  @override
  String get notifyNewPhotos => 'Mga bagong litrato (pinagsama)';

  @override
  String get notifyRecapReady => 'Handa na ang recap';

  @override
  String get camTripTeam => 'CamTrip team';

  @override
  String get adminEntrySubtitle =>
      'Mga user, pagbibigay ng Pro, mga report at stats';

  @override
  String get account => 'Account';

  @override
  String get manageSubscription => 'Pamahalaan ang subscription';

  @override
  String get blockedPeople => 'Mga naka-block';

  @override
  String get nobody => 'Wala';

  @override
  String peopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count na tao',
      one: '$count tao',
    );
    return '$_temp0';
  }

  @override
  String get privacyPolicy => 'Patakaran sa privacy';

  @override
  String get contact => 'Makipag-ugnayan';

  @override
  String get signOut => 'Mag-sign out';

  @override
  String get deleteAccount => 'I-delete ang account';

  @override
  String get deleteAccountSubtitle =>
      'Ide-delete ang account mo at lahat ng litrato mo';

  @override
  String get deleteAccountTitle => 'I-delete ang account?';

  @override
  String get deleteAccountMessage =>
      'Made-delete ang account mo at lahat ng litrato at video mo, pati sa mga grupo. Kanselahin ang anumang aktibong subscription sa App Store o Google Play.';

  @override
  String get blockedTitle => 'Naka-block';

  @override
  String get blockedSubtitle =>
      'Hindi mo nakikita ang mga litrato ng mga taong ito.';

  @override
  String get blockedNone => 'Wala ka pang na-block.';

  @override
  String get unblockShort => 'I-unblock';

  @override
  String get groupGone => 'Wala na ang grupong ito, o hindi ka na miyembro.';

  @override
  String photosSavedToAlbum(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Na-save ang $count na litrato sa \"$album\"',
      one: 'Na-save ang $count litrato sa \"$album\"',
    );
    return '$_temp0';
  }

  @override
  String photosDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Na-delete ang $count na litrato',
      one: 'Na-delete ang $count litrato',
    );
    return '$_temp0';
  }

  @override
  String photosDeletedSkipped(int count, int skipped) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Na-delete ang $count na litrato',
      one: 'Na-delete ang $count litrato',
    );
    return '$_temp0, $skipped ang nilaktawan';
  }

  @override
  String photosHiddenForYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Itinago para sa iyo ang $count na litrato',
      one: 'Itinago para sa iyo ang $count litrato',
    );
    return '$_temp0';
  }

  @override
  String get addedToFavorites => 'Idinagdag sa mga paborito';

  @override
  String get removedFromFavorites => 'Inalis sa mga paborito';

  @override
  String get photoAccessSettings =>
      'Bigyan ang CamTrip ng access sa mga litrato mo sa Settings';

  @override
  String photosBeingAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Idinadagdag ang $count na litrato',
      one: 'Idinadagdag ang $count litrato',
    );
    return '$_temp0';
  }

  @override
  String photosUnreadable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Hindi mabasa ang $count na litrato',
      one: 'Hindi mabasa ang $count litrato',
    );
    return '$_temp0';
  }

  @override
  String get groupNotLoaded => 'Hindi na-load ang grupo';

  @override
  String get noFavoritesTitle => 'Wala pang paborito';

  @override
  String get noPhotosTitle => 'Wala pang litrato';

  @override
  String get noFavoritesMessage =>
      'I-tap ang star sa isang litrato para ilagay ito rito.';

  @override
  String get noPhotosMessage =>
      'Kunin ang unang litrato. Makikita agad ito ng lahat sa grupo.';

  @override
  String get openCamera => 'Buksan ang camera';

  @override
  String savingProgress(int done, int total) {
    return 'Nagse-save... $done/$total';
  }

  @override
  String get sharePreparing => 'Inihahanda...';

  @override
  String sharingProgress(int done, int total) {
    return 'Inihahanda... $done/$total';
  }

  @override
  String get choosePhotos => 'Pumili ng mga litrato';

  @override
  String selectedCount(int count) {
    return '$count ang napili';
  }

  @override
  String get selectNone => 'Walang piliin';

  @override
  String get selectAll => 'Piliin lahat';

  @override
  String photosWaitingToShare(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count na litrato ang naghihintay na ma-share',
      one: '$count litrato ang naghihintay na ma-share',
    );
    return '$_temp0';
  }

  @override
  String get recapReadyTitle => 'Handa na ang recap mo';

  @override
  String get recapReadySubtitle => 'Video na may musika ng biyahe mo';

  @override
  String get watch => 'Panoorin';

  @override
  String get makeRecapNow => 'Gumawa ng recap video ngayon';

  @override
  String freeGroupDeleteNotice(String date) {
    return 'Libreng grupo: naka-save ang mga litrato hanggang $date. I-save ang mga ito o kumuha ng Pro.';
  }

  @override
  String get filterAll => 'Lahat';

  @override
  String get filterFavorites => 'Mga paborito';

  @override
  String get filterPerPerson => 'Kada tao';

  @override
  String get filterPerson => 'Tao';

  @override
  String get select => 'Pumili';

  @override
  String get hiddenFilter => 'Nakatago';

  @override
  String get photosBy => 'Mga litrato ni...';

  @override
  String get uploadedTag => 'na-upload';

  @override
  String get saveAll => 'I-save lahat';

  @override
  String get favorite => 'Paborito';

  @override
  String get unfavorite => 'Alisin sa paborito';

  @override
  String get hide => 'Itago';

  @override
  String get delete => 'I-delete';

  @override
  String deletePhotosTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'I-delete ang $count na litrato?',
      one: 'I-delete ang litrato?',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Mawawala ang mga ito para sa lahat sa grupo. Hindi na ito maibabalik.',
      one: 'Mawawala ito para sa lahat sa grupo. Hindi na ito maibabalik.',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosNotAllowed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count na litrato ang pag-aari ng iba. Mananatili ang mga ito; admin lang ang puwedeng mag-delete ng mga ito.',
      one:
          '$count litrato ang pag-aari ng iba. Mananatili ito; admin lang ang puwedeng mag-delete nito.',
    );
    return '$_temp0';
  }

  @override
  String photosBackInGroup(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Bumalik sa grupo ang $count na litrato',
      one: 'Bumalik sa grupo ang $count litrato',
    );
    return '$_temp0';
  }

  @override
  String get showAll => 'Ipakita lahat';

  @override
  String get hiddenPhotosExplainer =>
      'Ikaw lang ang hindi na nakakakita sa mga litratong ito. Nandoon pa rin ang mga ito para sa iba sa grupo.';

  @override
  String get nothingHidden => 'Walang nakatago';

  @override
  String get nothingHiddenMessage =>
      'Lalabas dito ang mga litratong itatago mo.';

  @override
  String showAgainCount(int count) {
    return 'Ipakita ulit ($count)';
  }

  @override
  String get someone => 'Isang tao';

  @override
  String get savedToAlbum => 'Na-save sa photo album mo';

  @override
  String get share => 'I-share';

  @override
  String get shareFailed => 'Hindi na-share';

  @override
  String get reportTitle => 'Bakit mo nire-report ang litratong ito?';

  @override
  String get reportSubtitle =>
      'Sinusuri namin ang bawat report sa loob ng 24 na oras. Itatago agad ang litrato para sa iyo.';

  @override
  String get reportThanks => 'Salamat, titingnan namin ito';

  @override
  String blockMessageAllGroups(String name) {
    return 'Hindi mo na makikita ang mga litrato at video ni $name sa anumang grupo at hindi ka na makakatanggap ng notification tungkol dito. Puwede mo itong i-undo sa Settings.';
  }

  @override
  String userBlocked(String name) {
    return 'Na-block si $name';
  }

  @override
  String get videoHiddenForYou => 'Itinago ang video para sa iyo';

  @override
  String get photoHiddenForYou => 'Itinago ang litrato para sa iyo';

  @override
  String get setAsCover => 'Gawing cover';

  @override
  String get coverUpdated => 'Na-update ang cover photo';

  @override
  String get hideForMe => 'Itago para sa akin';

  @override
  String get hideForMeSubtitle => 'Makikita pa rin ito ng iba sa grupo';

  @override
  String get reportPhoto => 'I-report ang litrato';

  @override
  String blockName(String name) {
    return 'I-block si $name';
  }

  @override
  String get forEveryoneInGroup => 'Para sa lahat sa grupo';

  @override
  String get videoDeleted => 'Na-delete ang video';

  @override
  String get photoDeleted => 'Na-delete ang litrato';

  @override
  String get photoAccessToSave =>
      'Bigyan ang CamTrip ng access sa mga litrato mo sa Settings para ma-save ang mga ito';

  @override
  String get phoneFull => 'Puno na ang phone mo';

  @override
  String get albumSaveFailedShort => 'Hindi na-save sa album mo';

  @override
  String get recapTemplateGoldenHour => 'Golden Hour';

  @override
  String get recapTemplateFast => 'Mabilis';

  @override
  String get recapTemplateFilmRoll => 'Film roll';

  @override
  String get recapTemplatePolaroid => 'Polaroid';

  @override
  String get trackSummerEvening => 'Gabi ng Tag-init';

  @override
  String get trackGoldenHour => 'Golden Hour';

  @override
  String get trackRoadtrip => 'Road Trip';

  @override
  String get moodWarm => 'mainit';

  @override
  String get moodCheerful => 'masaya';

  @override
  String friendsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count na kaibigan',
      one: '$count kaibigan',
    );
    return '$_temp0';
  }

  @override
  String get madeWithCamTrip => 'Ginawa gamit ang CamTrip';

  @override
  String get tagline => 'Isang roll para sa buong barkada';

  @override
  String get videoUnsupportedDevice =>
      'Hindi nagawa ang video sa device na ito';

  @override
  String get groupLoadFailed => 'Hindi ma-load ang grupong ito.';

  @override
  String recapNeedsPhotos(int count) {
    return 'Kailangan mo ng hindi bababa sa $count na litrato para sa recap.';
  }

  @override
  String get recapFailed => 'Hindi nagawa ang recap. Pakisubukan ulit.';

  @override
  String get recapSaved => 'Na-save ang recap sa photo album mo';

  @override
  String get recap => 'Recap';

  @override
  String get recapRendering => 'Ginagawa ang recap...';

  @override
  String get videoRendering => 'Ginagawa ang video...';

  @override
  String get template => 'Template';

  @override
  String get musicLicense => 'Sariling musika ng CamTrip · royalty-free';

  @override
  String get change => 'Palitan';

  @override
  String get noWatermark => 'Walang watermark ✓';

  @override
  String get removeWatermarkPro => 'Alisin ang watermark gamit ang Pro';

  @override
  String get proSourceSubscription => 'Subscription';

  @override
  String get proSourceGift => 'Regalo';

  @override
  String get proSourceAdmin => 'Admin';

  @override
  String get proSourceGroup => 'Dahil sa grupo';

  @override
  String get noPro => 'Walang Pro';

  @override
  String proStatusNoEnd(String source) {
    return 'Pro ($source), walang huling petsa';
  }

  @override
  String proStatusUntil(String source, String date) {
    return 'Pro ($source), hanggang $date';
  }

  @override
  String get lifetime => 'Habambuhay';

  @override
  String get pickDate => 'Pumili ng petsa';

  @override
  String get noAccess => 'Walang access';

  @override
  String get adminOnlyTeam => 'Para lang sa CamTrip team ang Pamahalaan.';

  @override
  String get adminOverview => 'Overview';

  @override
  String get adminUsers => 'Mga user';

  @override
  String get adminReports => 'Mga report';

  @override
  String adminsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count na admin',
      one: '$count admin',
    );
    return '$_temp0';
  }

  @override
  String get adminNewThisWeek => 'Bago ngayong linggo';

  @override
  String get adminGroups => 'Mga grupo';

  @override
  String get adminProSubscription => 'Pro sa subscription';

  @override
  String get adminProGift => 'Pro bilang regalo';

  @override
  String adminWithoutSubscription(int count) {
    return '$count na walang subscription';
  }

  @override
  String get adminOpenReports => 'Mga bukas na report';

  @override
  String get adminSearchHint => 'Maghanap ayon sa pangalan o email';

  @override
  String get nobodyFound => 'Walang nakita';

  @override
  String get loadMore => 'Mag-load pa';

  @override
  String get noEmail => 'Walang email';

  @override
  String adminDeletePhotoMessage(String groupName) {
    return 'Mawawala ang litrato para sa lahat sa \"$groupName\". Mareresolba ang lahat ng report sa litratong ito.';
  }

  @override
  String get adminBanMessage =>
      'Hindi na makakapag-sign in o makakagamit ng app ang account na ito. Puwede mo itong i-undo mamaya.';

  @override
  String get adminDismissTitle => 'I-dismiss ang report?';

  @override
  String get adminDismissMessage =>
      'Mananatili ang litrato. Mamarkahang naresolba ang report.';

  @override
  String get adminDismiss => 'I-dismiss';

  @override
  String get adminAccountBlocked => 'Na-block ang account';

  @override
  String get adminReportDismissed => 'Na-dismiss ang report';

  @override
  String get adminNoReports => 'Walang bukas na report';

  @override
  String get adminNoReportsMessage =>
      'Lalabas dito ang mga nire-report na litrato.';

  @override
  String get deletedTag => 'Na-delete';

  @override
  String adminReportedBy(String name) {
    return 'Ni $name';
  }

  @override
  String adminPhotoBy(String name) {
    return 'Litrato ni $name';
  }

  @override
  String reportsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count na report',
      one: '$count report',
    );
    return '$_temp0';
  }

  @override
  String get adminDeletePhoto => 'I-delete ang litrato';

  @override
  String get adminBlockCreator => 'I-block ang kumuha';

  @override
  String get loadFailed => 'Hindi na-load';

  @override
  String get adminLifetimeProGiven => 'Naibigay ang habambuhay na Pro';

  @override
  String get adminProGiven => 'Naibigay ang Pro';

  @override
  String adminGiveProUntil(String date) {
    return 'Magbigay ng Pro hanggang $date';
  }

  @override
  String get adminGiveProLifetime => 'Magbigay ng habambuhay na Pro';

  @override
  String adminGiveProFor(String period) {
    return 'Magbigay ng Pro sa loob ng $period';
  }

  @override
  String get adminReasonHint => 'Dahilan, hal. kaibigan, tester, influencer';

  @override
  String get adminGivePro => 'Magbigay ng Pro';

  @override
  String get adminRevokeTitle => 'Bawiin ang regalo?';

  @override
  String get adminRevokeMessage =>
      'Hihinto agad ang iniregalong Pro. Tuloy pa rin ang sarili nilang subscription.';

  @override
  String get adminRevoke => 'Bawiin';

  @override
  String get adminGiftRevoked => 'Binawi ang regalo';

  @override
  String get adminUnbanTitle => 'Alisin ang block?';

  @override
  String adminUnbanMessage(String name) {
    return 'Makakapag-sign in ulit si $name.';
  }

  @override
  String get adminUnbanned => 'Inalis ang block';

  @override
  String get adminBanUserMessage =>
      'Hindi na makakapag-sign in o makakagamit ng app ang account na ito. Mananatili ang mga litrato.';

  @override
  String get adminUser => 'User';

  @override
  String get adminNotVerified => 'hindi verified';

  @override
  String get adminRole => 'Tungkulin';

  @override
  String get adminCreated => 'Ginawa';

  @override
  String get unknown => 'Hindi alam';

  @override
  String get adminSignInWith => 'Nagsa-sign in gamit ang';

  @override
  String get adminEmailMethod => 'Email';

  @override
  String get adminPhotosAndVideos => 'Mga litrato at video';

  @override
  String get adminStatus => 'Status';

  @override
  String get adminActive => 'Aktibo';

  @override
  String adminActiveUntil(String date) {
    return 'Aktibo hanggang $date';
  }

  @override
  String adminGiftFrom(String name) {
    return 'Regalo mula kay $name';
  }

  @override
  String adminExpiredOn(String date) {
    return 'Nag-expire noong $date';
  }

  @override
  String get adminExpired => 'Expired';

  @override
  String adminUntil(String date) {
    return 'Hanggang $date';
  }

  @override
  String get adminGiveProTitle => 'Magbigay ng Pro';

  @override
  String get adminGiveProNote =>
      'Gumagana rin para sa mga grupo ng taong ito: isang Pro sa grupo = Pro para sa lahat sa grupong iyon.';

  @override
  String get adminRevokeGift => 'Bawiin ang regalo';

  @override
  String get adminModeration => 'Moderation';

  @override
  String get adminCannotBanSelf => 'Hindi mo puwedeng i-block ang sarili mo.';

  @override
  String get adminCannotBanAdmin => 'Hindi puwedeng i-block ang admin.';

  @override
  String get adminUnban => 'Alisin ang block';

  @override
  String get adminBanAccount => 'I-block ang account';

  @override
  String get googleSignInUnavailable =>
      'Hindi pa available ang pag-sign in gamit ang Google';

  @override
  String get cameraPickerTitle => 'Piliin ang camera mo';

  @override
  String get cameraPickerSubtitle =>
      'Bawat camera ay may sariling itsura para sa mga litrato mo';

  @override
  String get cameraPickerChange => 'Palitan ang camera';

  @override
  String get cameraPickerUnlock => 'I-unlock gamit ang Pro';

  @override
  String get cameraPickerSelected => 'Napili';

  @override
  String get cameraPickerStyleSummer => 'Tag-init';

  @override
  String get cameraPickerStyleSummerDescription =>
      'Maiinit at kupas na kulay ng snapshot mula dekada \'90';

  @override
  String get cameraPickerStyleNight => 'Gabi 800';

  @override
  String get cameraPickerStyleNightDescription =>
      'Cinema film: teal na anino, mainit na liwanag, maraming grain';

  @override
  String get cameraPickerStyleSepia => 'Sepia';

  @override
  String get cameraPickerStyleSepiaDescription =>
      'Lumang kayumangging litrato mula sa kahon ng sapatos';

  @override
  String get cameraPickerStyleLomo => 'Lomo';

  @override
  String get cameraPickerStyleLomoDescription =>
      'Matitingkad na kulay, madidilim na sulok at ligaw na kulay';

  @override
  String get cameraPickerStyleMint => 'Mint';

  @override
  String get cameraPickerStyleMintDescription =>
      'Malambot at sariwa na may berdeng tint';

  @override
  String get cameraPickerStylePastel => 'Pink';

  @override
  String get cameraPickerStylePastelDescription =>
      'Pastel na kulay na may pink na liwanag at puting border';

  @override
  String get cameraPickerStyleSuper8 => 'Super 8';

  @override
  String get cameraPickerStyleSuper8Description =>
      'Grainy at malambot, parang lumang home movie';

  @override
  String get paywallBenefitGroup => 'Isang Pro = Pro para sa buong grupo';

  @override
  String get paywallBenefitUnlimited =>
      'Walang limitasyong miyembro, habambuhay naka-save ang litrato';

  @override
  String get paywallBenefitQuality => 'Walang watermark, orihinal na kalidad';

  @override
  String paywallFreeTrial(String period) {
    return 'Libre ang $period';
  }

  @override
  String paywallPriceYear(String price) {
    return '$price kada taon.';
  }

  @override
  String paywallPriceYearTrial(String period, String price) {
    return 'Libre ang $period, pagkatapos ay $price kada taon.';
  }

  @override
  String paywallPriceMonth(String price) {
    return '$price kada buwan.';
  }

  @override
  String paywallPriceMonthTrial(String period, String price) {
    return 'Libre ang $period, pagkatapos ay $price kada buwan.';
  }

  @override
  String paywallAutoRenew(String store) {
    return 'Awtomatikong nagre-renew. Kanselahin nang hindi bababa sa 24 na oras bago ang renewal sa $store.';
  }

  @override
  String get paywallDetailsTitle => 'Lahat ng nasa Pro';

  @override
  String get paywallBenefitStyles => 'Lahat ng camera style';

  @override
  String get allPhotosTitle => 'Lahat ng litrato';

  @override
  String get homeTabAlbums => 'Mga album';

  @override
  String get allPhotosEmptyTitle => 'Wala pang litrato';

  @override
  String get allPhotosEmptyMessage =>
      'Buksan ang camera at kunin ang una mong litrato.';

  @override
  String get allPhotosLoadFailed => 'Hindi ma-load ang mga litrato mo';

  @override
  String get cameraSettingsTitle => 'Settings ng camera';

  @override
  String get cameraSettingsMore => 'Iba pang settings';

  @override
  String get cameraSettingsGrid => 'Grid';

  @override
  String get cameraSettingsHaptics => 'Mag-vibrate kapag kumukuha';

  @override
  String get cameraSettingsDateStamp => 'Petsa sa kanang ibaba';

  @override
  String get cameraSettingsSound => 'Tunog ng shutter';

  @override
  String get cameraSettingsSoundHint =>
      'Tahimik kapag naka-silent ang phone mo';

  @override
  String get cameraSettingsTimer => 'Self-timer';

  @override
  String get cameraSettingsTimerOff => 'Off';

  @override
  String cameraSettingsTimerSeconds(int seconds) {
    return '$seconds s';
  }

  @override
  String get cameraSettingsTimerCancelHint =>
      'I-tap ang shutter para kanselahin';

  @override
  String get cameraSettingsMirror => 'I-mirror ang mga selfie';

  @override
  String get cameraSettingsSaveToRoll => 'I-save sa camera roll';

  @override
  String get cameraSettingsQuality => 'Kalidad';

  @override
  String get cameraSettingsQualityStandard => 'Standard';

  @override
  String get cameraSettingsQualityHigh => 'Mataas';

  @override
  String get cameraLowLightHint => 'Mahina ang ilaw - i-on ang flash';

  @override
  String get cameraFlashUnavailable => 'Walang flash ang camera na ito';

  @override
  String get cameraFlashScreen => 'Screen flash';

  @override
  String get cameraFlashCycleHint => 'I-tap para magpalit sa off, on at auto';

  @override
  String get cameraFlip => 'Lumipat sa harap o likod na camera';

  @override
  String get cameraFlipHint =>
      'I-double tap ang viewfinder para ibaliktad ang camera';

  @override
  String cameraPickerPaywallStyles(int count, String styles) {
    return 'Lahat ng $count na camera, kasama ang $styles';
  }

  @override
  String get styleFlash => 'Flash 400';

  @override
  String get styleFlashDescription =>
      'Direktang flash sa mainit na film: amber na liwanag, grain, matitingkad na pula';

  @override
  String cameraTimerButton(String state) {
    return 'Self-timer: $state';
  }

  @override
  String get cameraTimerCycleHint => 'I-tap para magpalit sa off, 3 s at 10 s';

  @override
  String get cameraLastShotOpen => 'Pinakabagong litrato, binubuksan ang album';

  @override
  String get cameraLastShotEmpty => 'Wala pang litrato, binubuksan ang album';

  @override
  String get deleteOnlyOwnOrAdmin =>
      'Ang kumuha lang o isang admin ang puwedeng mag-delete nito';

  @override
  String get videoPlay => 'I-play';

  @override
  String get videoPause => 'I-pause';

  @override
  String get language => 'Wika';

  @override
  String get languageSystem => 'Wika ng system';

  @override
  String languageSystemCurrent(String language) {
    return 'System ($language)';
  }

  @override
  String get languageSearchHint => 'Maghanap ng wika';

  @override
  String get languageNoResults => 'Walang nakitang wika';

  @override
  String get personalRollTitle => 'Aking roll';

  @override
  String get personalRollSubtitle => 'Para sa iyo lang';

  @override
  String get personalRollPickerSubtitle =>
      'Mga hiwalay na litrato, para sa iyo lang';

  @override
  String get personalRollMove => 'Sa album';

  @override
  String get personalRollMoveTitle => 'Ilipat sa album';

  @override
  String get personalRollMoveNoAlbums =>
      'Gumawa muna ng album o sumali sa isa gamit ang code.';

  @override
  String personalRollMoved(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count litrato ang nailipat sa $album',
      one: '1 litrato ang nailipat sa $album',
    );
    return '$_temp0';
  }

  @override
  String get personalRollPrivateNote =>
      'Ikaw lang ang nakakakita ng mga litratong ito. Ilipat sa album para ibahagi.';

  @override
  String get paywallTripPassSub =>
      'Para lang sa biyaheng ito, para sa buong grupo';

  @override
  String get paywallOneTime => 'isang beses';

  @override
  String get paywallBestValue => 'Pinakasulit';

  @override
  String paywallRollFullTitle(int used, int limit) {
    return 'Puno na ang roll mo - $used/$limit litrato';
  }

  @override
  String get paywallRollFullSub =>
      'Magpatuloy sa pagkuha gamit ang Trip Pass o Pro.';

  @override
  String get paywallCameraTitle => 'Bahagi ng Pro ang camera na ito';

  @override
  String paywallCameraSub(int count) {
    return 'I-unlock ang lahat ng $count na camera.';
  }

  @override
  String get paywallWatermarkTitle => 'Recap na walang watermark';

  @override
  String get paywallWatermarkSub =>
      'I-share ang recap mo nang walang logo ng CamTrip.';

  @override
  String get paywallDeletionTitle => 'Panatilihin ang biyahe mo';

  @override
  String paywallDeletionSub(String date) {
    return 'Dine-delete ang mga libreng biyahe sa $date. Sa Trip Pass o Pro, habambuhay na itong naka-save.';
  }

  @override
  String paywallTripPassTerms(String price) {
    return 'Isang beses na bayad na $price para sa biyaheng ito. Hindi ito subscription.';
  }

  @override
  String get buyTripPass => 'Kumuha ng Trip Pass';

  @override
  String get tripPassActive =>
      'Aktibo ang Trip Pass: Pro para sa lahat ang biyaheng ito';

  @override
  String get tripPassActivating =>
      'Natanggap ang bayad. Magiging aktibo ang Trip Pass mo sa ilang sandali.';

  @override
  String proViaTripPass(String name) {
    return 'Trip Pass ni $name';
  }

  @override
  String rollCounterSemantics(int used, int limit) {
    return '$used sa $limit na kuha sa roll mo';
  }

  @override
  String rollHeldTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count na litrato ang hindi na kasya sa roll mo',
      one: '$count litrato ang hindi na kasya sa roll mo',
    );
    return '$_temp0';
  }

  @override
  String get rollHeldBody =>
      'Panatilihin ang mga ito gamit ang Pro o Trip Pass';

  @override
  String deletionBannerTitle(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Panatilihin ang biyahe mo - $days na araw na lang',
      one: 'Panatilihin ang biyahe mo - $days araw na lang',
    );
    return '$_temp0';
  }

  @override
  String get deletionBannerBody =>
      'Dine-delete ang mga libreng biyahe 30 araw pagkatapos matapos. Sa Trip Pass o Pro, habambuhay na itong naka-save.';

  @override
  String apiRollFull(int limit) {
    return 'Puno na ang roll mo ($limit na kuha). Kumuha ng Trip Pass o Pro para makapagpatuloy.';
  }

  @override
  String get apiTripPassFailed =>
      'Hindi ma-activate ang Trip Pass. Makipag-ugnayan sa support@camtrip.app.';

  @override
  String get apiTripPassExists => 'May Trip Pass na ang biyaheng ito.';

  @override
  String get tripPassUnavailable =>
      'Hindi available ang Trip Pass ngayon. Subukan ulit mamaya.';

  @override
  String get tripMapTitle => 'Trip map';

  @override
  String get tripMapOpen => 'Mapa at stats';

  @override
  String get tripMapLoadFailed => 'Hindi ma-load ang trip map';

  @override
  String get tripMapStatDays => 'Araw';

  @override
  String get tripMapStatPhotos => 'Litrato';

  @override
  String get tripMapStatVideos => 'Video';

  @override
  String get tripMapStatMembers => 'Miyembro';

  @override
  String get tripMapStatDistance => 'km na nilakbay';

  @override
  String get tripMapStatCountries => 'Bansa';

  @override
  String get tripMapStatPlaces => 'Lugar';

  @override
  String tripMapBusiestDay(String day, int count) {
    return 'Pinakamaraming litrato noong $day ($count)';
  }

  @override
  String tripMapTopPhotographer(String name, int count) {
    return 'Nangungunang photographer: $name ($count)';
  }

  @override
  String get tripMapOffTitle => 'Naka-off ang trip map';

  @override
  String get tripMapOffMessage =>
      'Puwedeng i-on ng admin ng grupo ang trip map sa settings ng grupo. Lagi mong nakikita ang stats.';

  @override
  String get tripMapOffMessageAdmin =>
      'I-on ang trip map para makita kung saan kinuha ang mga litrato ninyo. Bawat isa ang magpapasya kung sasali.';

  @override
  String get tripMapEnable => 'I-on ang trip map';

  @override
  String get tripMapEmptyTitle => 'Wala pang lugar sa mapa';

  @override
  String get tripMapEmptyMessage =>
      'Lalabas dito ang mga bagong litrato ng mga miyembrong nagsha-share ng lokasyon, naka-round sa mga 100 m.';

  @override
  String get tripMapConsentTitle => 'Trip map';

  @override
  String get tripMapConsentQuestion =>
      'I-share kung saan kinuha ang mga litrato mo sa trip map ng grupong ito?';

  @override
  String get tripMapConsentDetail =>
      'Mga miyembro lang ng grupo ang makakakita, naka-round sa mga 100 m. Hindi kailanman inilalagay ang lokasyon sa litrato mismo, at puwede mo itong i-off anumang oras sa settings ng grupo.';

  @override
  String get tripMapConsentYes => 'Oo, i-share';

  @override
  String get tripMapConsentNo => 'Hindi';

  @override
  String get tripMapLocationDenied =>
      'Walang access sa lokasyon mo. Puwede mo itong payagan sa settings ng phone mo.';

  @override
  String get tripMapSettingSubtitle =>
      'Ipakita sa mapa kung saan kinuha ang mga litrato. Ang mga miyembro ang magpapasya kung magsha-share.';

  @override
  String get tripMapDisableTitle => 'I-off ang trip map?';

  @override
  String get tripMapDisableMessage =>
      'Made-delete ang lahat ng lokasyon sa grupong ito. Kapag in-on ulit ang mapa, tatanungin ulit ang lahat.';

  @override
  String get tripMapDisable => 'I-off';

  @override
  String get tripMapMySharing => 'I-share ang lokasyon ko';

  @override
  String get tripMapMySharingOn =>
      'Lalabas sa trip map ang mga bago mong litrato (naka-round sa mga 100 m).';

  @override
  String get tripMapMySharingOff =>
      'Naka-off. Hindi lumalabas sa mapa ang mga litrato mo.';

  @override
  String get tripMapStopSharingTitle => 'Itigil ang pag-share ng lokasyon mo?';

  @override
  String get tripMapStopSharingMessage =>
      'Made-delete ang lokasyon ng lahat ng litrato mo sa grupong ito.';

  @override
  String get tripMapStopSharing => 'Itigil ang pag-share';
}
