// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Catalan Valencian (`ca`).
class AppLocalizationsCa extends AppLocalizations {
  AppLocalizationsCa([String locale = 'ca']) : super(locale);

  @override
  String get cancel => 'Cancel·la';

  @override
  String get yes => 'Sí';

  @override
  String inviteMessageIntro(String groupName) {
    return 'T\'uneixes a «$groupName» a CamTrip? Així veiem les fotos de tothom a l\'instant.';
  }

  @override
  String inviteMessageCode(String code) {
    return 'O introdueix el codi: $code';
  }

  @override
  String get memberFallbackName => 'Amic';

  @override
  String get reportReasonInappropriate => 'Inadequat o ofensiu';

  @override
  String get reportReasonSpam => 'Correu brossa';

  @override
  String get reportReasonOther => 'Una altra cosa';

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
      'No hi ha connexió. Torna-ho a provar d\'aquí a una estona.';

  @override
  String errorSomethingWrongStatus(int status) {
    return 'Alguna cosa ha fallat ($status)';
  }

  @override
  String get errorSomethingWrong => 'Alguna cosa ha fallat';

  @override
  String get apiInvalidCredentials =>
      'L\'adreça electrònica o la contrasenya no són correctes';

  @override
  String get apiInvalidCode =>
      'Aquest codi no és correcte o ha caducat. Demana\'n un de nou.';

  @override
  String get apiEmailTaken =>
      'Ja hi ha un compte amb aquesta adreça electrònica. Inicia la sessió o tria «Has oblidat la contrasenya?».';

  @override
  String apiEmailTakenProvider(String provider) {
    return 'Ja hi ha un compte amb aquesta adreça electrònica. Inicia la sessió amb $provider.';
  }

  @override
  String apiWeakPassword(int min) {
    return 'Tria una contrasenya d\'almenys $min caràcters';
  }

  @override
  String apiNameTooLong(int max) {
    return 'El nom pot tenir com a màxim $max caràcters';
  }

  @override
  String get apiRateLimited =>
      'Massa intents. Torna-ho a provar d\'aquí a 15 minuts.';

  @override
  String apiAccountBanned(String email) {
    return 'El teu compte s\'ha bloquejat. Escriu a $email si creus que és un error.';
  }

  @override
  String get apiProRequired =>
      'Aquest estil de càmera forma part de CamTrip Pro';

  @override
  String get apiGroupClosed => 'Aquest grup s\'ha tancat';

  @override
  String get apiGroupCodeNotFound => 'No s\'ha trobat cap grup amb aquest codi';

  @override
  String apiGroupFull(int max) {
    return 'Aquest grup és ple (màx. $max membres). Si un membre té CamTrip Pro, s\'hi pot unir qualsevol.';
  }

  @override
  String get apiLastMember => 'Ets l\'últim membre. Millor elimina el grup.';

  @override
  String get apiAdminRequired => 'Només per als administradors de CamTrip';

  @override
  String get apiUploadIncomplete => 'La pujada no s\'ha completat';

  @override
  String get apiInvalidInput => 'Dades no vàlides';

  @override
  String get apiNotSignedIn => 'No has iniciat la sessió';

  @override
  String get apiAccountGone => 'Aquest compte ja no existeix';

  @override
  String get apiPhotoNotFound => 'No s\'ha trobat la foto';

  @override
  String get apiGroupNotFound => 'No s\'ha trobat el grup';

  @override
  String get apiMemberNotFound => 'No s\'ha trobat el membre';

  @override
  String get apiPersonNotFound => 'No s\'ha trobat la persona';

  @override
  String get apiUserNotFound => 'No s\'ha trobat l\'usuari';

  @override
  String get apiAdminOnly => 'Només un administrador pot fer això';

  @override
  String get apiCannotBlockSelf => 'No et pots bloquejar a tu mateix';

  @override
  String get apiCannotReportOwn => 'No pots denunciar la teva pròpia foto';

  @override
  String get apiDeleteOwnOnly => 'Només pots eliminar les teves fotos';

  @override
  String get apiOwnerCannotBeRemoved => 'No es pot treure el creador del grup';

  @override
  String get apiOwnerStaysAdmin =>
      'El creador sempre continua sent administrador';

  @override
  String get apiNeedsOneAdmin => 'Un grup necessita almenys un administrador';

  @override
  String get apiEndBeforeStart =>
      'La data de finalització és anterior a la d\'inici';

  @override
  String get apiPermanentNoEndDate =>
      'Un grup sempre obert no té data de finalització';

  @override
  String get apiCannotBanAdmin => 'No es pot bloquejar un administrador';

  @override
  String get apiReportNotFound => 'No s\'ha trobat la denúncia';

  @override
  String get apiPhotoOwnerUnknown => 'Ja no se sap qui va fer aquesta foto';

  @override
  String get validationNameRequired => 'Escriu el teu nom';

  @override
  String validationMaxChars(int max) {
    return 'Com a màxim $max caràcters';
  }

  @override
  String get validationEmailRequired => 'Escriu la teva adreça electrònica';

  @override
  String get validationEmailInvalid =>
      'Aquesta adreça electrònica no és vàlida';

  @override
  String get validationPasswordRequired => 'Tria una contrasenya';

  @override
  String validationMinChars(int min) {
    return 'Almenys $min caràcters';
  }

  @override
  String get validationPasswordTooLong => 'Aquesta contrasenya és massa llarga';

  @override
  String get validationPasswordEmpty => 'Escriu la contrasenya';

  @override
  String get validationCodeRequired => 'Escriu el codi del correu';

  @override
  String get validationCodeDigits => 'El codi té 6 xifres';

  @override
  String get onboarding1Title => 'Un sol rodet\nper a tota la colla.';

  @override
  String get onboarding1Body =>
      'Fes fotos amb una càmera retro. Tothom veu les teves fotos a l\'instant, i també són al teu àlbum.';

  @override
  String get onboarding2Title => 'Prou d\'anar\nenviant fotos.';

  @override
  String get onboarding2Body =>
      'Crea un grup, comparteix el codi i llestos. Mai més «m\'envies aquelles fotos?»';

  @override
  String get onboarding3Title => 'Un vídeo resum\ndesprés del viatge.';

  @override
  String get onboarding3Body =>
      'CamTrip fa un vídeo amb música dels vostres millors moments junts.';

  @override
  String get onboardingInvited =>
      'T\'han convidat! Inicia la sessió per unir-t\'hi.';

  @override
  String get signInAppleFailed => 'No s\'ha pogut iniciar la sessió amb Apple';

  @override
  String get signInGoogleFailed =>
      'No s\'ha pogut iniciar la sessió amb Google';

  @override
  String get signInFailed => 'No s\'ha pogut iniciar la sessió';

  @override
  String get next => 'Següent';

  @override
  String get legalPrefix => 'Si continues, acceptes les';

  @override
  String get legalTerms => 'condicions';

  @override
  String get legalAnd => ' i la';

  @override
  String get legalPrivacy => 'política de privadesa';

  @override
  String get legalSuffix => '.';

  @override
  String get continueWithApple => 'Continua amb Apple';

  @override
  String get continueWithGoogle => 'Continua amb Google';

  @override
  String get createAccount => 'Crea un compte';

  @override
  String get signIn => 'Inicia la sessió';

  @override
  String get or => 'o';

  @override
  String get registerSubtitle =>
      'Perquè els teus amics vegin qui ha fet les fotos.';

  @override
  String get loginSubtitle => 'Benvingut de nou.';

  @override
  String get forgotPasswordTitle => 'Contrasenya oblidada';

  @override
  String get forgotPasswordPushSubtitle =>
      'Encara tens la sessió oberta en algun lloc? T\'hi enviarem un codi de 6 xifres com a notificació perquè posis una contrasenya nova.';

  @override
  String get newPassword => 'Contrasenya nova';

  @override
  String get resetPushInfo =>
      'Si encara tens la sessió oberta en algun lloc, hi rebràs una notificació amb un codi. No pots entrar? Inicia la sessió amb Apple o Google amb la mateixa adreça electrònica: el teu compte s\'enllaçarà.';

  @override
  String get sendCode => 'Envia el codi';

  @override
  String get savePassword => 'Desa la contrasenya';

  @override
  String get errorTryAgain => 'Alguna cosa ha fallat. Torna-ho a provar.';

  @override
  String get back => 'Enrere';

  @override
  String get name => 'Nom';

  @override
  String get email => 'Adreça electrònica';

  @override
  String get codeFromPush => 'Codi de la notificació';

  @override
  String get password => 'Contrasenya';

  @override
  String get hidePassword => 'Amaga la contrasenya';

  @override
  String get showPassword => 'Mostra la contrasenya';

  @override
  String get forgotPasswordLink => 'Has oblidat la contrasenya?';

  @override
  String get haveAccount => 'Ja tens un compte?';

  @override
  String get newToCamTrip => 'Ets nou a CamTrip?';

  @override
  String get rememberedIt => 'Ja te\'n recordes?';

  @override
  String get noCodeReceived => 'No has rebut cap codi?';

  @override
  String get resendCode => 'Torna a enviar';

  @override
  String onboardingDemoRoll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotògrafs, 1 rodet',
      one: '1 fotògraf, 1 rodet',
    );
    return '$_temp0';
  }

  @override
  String membersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count membres',
      one: '1 membre',
    );
    return '$_temp0';
  }

  @override
  String photosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotos',
      one: '1 foto',
    );
    return '$_temp0';
  }

  @override
  String videosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count vídeos',
      one: '1 vídeo',
    );
    return '$_temp0';
  }

  @override
  String get justNow => 'ara';

  @override
  String get badgeNew => 'Nou';

  @override
  String recapTitle(String groupName) {
    return 'Resum $groupName';
  }

  @override
  String get styleFilm => 'Film';

  @override
  String get styleInstant => 'Instant';

  @override
  String get styleDisposable => 'D\'un sol ús';

  @override
  String get styleBw => 'B/N';

  @override
  String get styleGolden => 'Golden';

  @override
  String get styleChrome => 'Chrome';

  @override
  String get styleFilmDescription => 'Colors càlids, gra i una data taronja';

  @override
  String get styleInstantDescription => 'Colors suaus i una vora blanca';

  @override
  String get styleDisposableDescription =>
      'Flaix dur, vinyeta i fuites de llum';

  @override
  String get styleBwDescription =>
      'Blanc i negre granulat amb un contrast profund';

  @override
  String get styleGoldenDescription =>
      'Sempre hora daurada, una llum daurada suau';

  @override
  String get styleChromeDescription =>
      'Fred, saturat i nítid, com una diapositiva';

  @override
  String get shutterStopRecording => 'Atura la gravació';

  @override
  String get shutterStartRecording => 'Comença a gravar vídeo';

  @override
  String get shutterTakePhoto => 'Fes una foto';

  @override
  String get modePhoto => 'Foto';

  @override
  String get modeVideo => 'Vídeo';

  @override
  String get cameraNotFound => 'No s\'ha trobat cap càmera';

  @override
  String get cameraAccessNeeded =>
      'CamTrip necessita accés a la càmera. Activa\'l a Configuració.';

  @override
  String get cameraStartFailed => 'No s\'ha pogut iniciar la càmera';

  @override
  String get albumAccessNeeded =>
      'Dona accés a les fotos a CamTrip perquè també les desi al teu àlbum';

  @override
  String get albumSaveFailed =>
      'No s\'ha pogut desar a l\'àlbum. La foto s\'ha compartit igualment.';

  @override
  String styleProFallback(String style) {
    return 'Aquest estil forma part de Pro. En aquest grup fas fotos amb $style.';
  }

  @override
  String get photoFailed => 'No s\'ha pogut fer la foto. Torna-ho a provar.';

  @override
  String get recordingFailed => 'No s\'ha pogut gravar el vídeo';

  @override
  String get videoFailed => 'No s\'ha pogut crear el vídeo. Torna-ho a provar.';

  @override
  String get shootInGroup => 'Fes fotos al grup';

  @override
  String get close => 'Tanca';

  @override
  String get flash => 'Flaix';

  @override
  String get flashOn => 'Sí';

  @override
  String get flashOff => 'No';

  @override
  String get flashAuto => 'Auto';

  @override
  String get chooseGroup => 'Tria un grup';

  @override
  String get switchCamera => 'Canvia de càmera';

  @override
  String get createOrJoinFirst => 'Primer crea un grup o uneix-te a un';

  @override
  String get proViaGroup => 'Pro gràcies al grup';

  @override
  String proViaName(String name) {
    return 'Pro gràcies a $name';
  }

  @override
  String get proStylesFreeViaMember =>
      'Els estils Pro d\'aquest grup són gratis per a tu gràcies a un membre Pro';

  @override
  String proStylesFreeViaName(String name) {
    return 'Estils Pro en aquest grup: gratis per a tu gràcies a $name';
  }

  @override
  String get subscriptionsUnavailable =>
      'Les subscripcions no estan disponibles ara mateix. Torna-ho a provar més tard.';

  @override
  String get paymentPending =>
      'El pagament encara s\'està processant. Pro s\'activarà quan s\'acabi.';

  @override
  String get purchaseFailed =>
      'La compra no ha funcionat. Torna-ho a provar més tard.';

  @override
  String get restoreUnavailable =>
      'Ara mateix no es poden restaurar les compres. Torna-ho a provar més tard.';

  @override
  String get restoreFailed =>
      'No s\'ha pogut restaurar. Torna-ho a provar més tard.';

  @override
  String get welcomePro => 'Benvingut a CamTrip Pro! 🎉';

  @override
  String get proRestored => 'S\'ha restaurat Pro';

  @override
  String get noPurchaseFound => 'No s\'ha trobat cap compra anterior';

  @override
  String periodDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dies',
      one: '1 dia',
    );
    return '$_temp0';
  }

  @override
  String periodWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count setmanes',
      one: '1 setmana',
    );
    return '$_temp0';
  }

  @override
  String periodMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mesos',
      one: '1 mes',
    );
    return '$_temp0';
  }

  @override
  String periodYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count anys',
      one: '1 any',
    );
    return '$_temp0';
  }

  @override
  String get paywallHavePro => 'Tens CamTrip Pro';

  @override
  String get paywallSubtitle => 'Tot per al teu proper viatge.';

  @override
  String paywallFeatureStyles(String styles) {
    return 'Tots els estils de càmera ($styles)';
  }

  @override
  String get paywallFeatureUnlimited =>
      'Membres i espai il·limitats, les fotos es guarden per sempre';

  @override
  String get paywallFeatureNoWatermark => 'Resums sense marca d\'aigua';

  @override
  String get paywallFeatureOriginal => 'Baixada en qualitat original';

  @override
  String get planYear => 'Any';

  @override
  String get planMonth => 'Mes';

  @override
  String pricePerMonth(String price) {
    return '$price al mes';
  }

  @override
  String paywallSaveBadge(int percent) {
    return 'ESTALVIA UN $percent%';
  }

  @override
  String get planMonthCancelAnytime => 'cancel·la quan vulguis';

  @override
  String tryFree(String period) {
    return 'Prova $period gratis';
  }

  @override
  String get becomePro => 'Fes-te Pro';

  @override
  String get subscriptionsLoadFailed =>
      'No s\'han pogut carregar les subscripcions. Comprova la connexió.';

  @override
  String legalAnnual(String price) {
    return 'Subscripció anual a CamTrip Pro: $price l\'any.';
  }

  @override
  String legalAnnualTrial(String period, String price) {
    return 'Subscripció anual a CamTrip Pro: $period gratis i després $price l\'any.';
  }

  @override
  String legalMonthly(String price) {
    return 'Subscripció mensual a CamTrip Pro: $price al mes.';
  }

  @override
  String legalMonthlyTrial(String period, String price) {
    return 'Subscripció mensual a CamTrip Pro: $period gratis i després $price al mes.';
  }

  @override
  String get legalBillingApple =>
      'El pagament es carrega al teu ID d\'Apple. La subscripció es renova automàticament si no la cancel·les almenys 24 hores abans que acabi el període. La pots cancel·lar i gestionar a la configuració del teu compte de l\'App Store.';

  @override
  String get legalBillingGoogle =>
      'El pagament es carrega al teu compte de Google. La subscripció es renova automàticament si no la cancel·les almenys 24 hores abans que acabi el període. La pots cancel·lar i gestionar a la configuració del teu compte de Google Play.';

  @override
  String get restorePurchases => 'Restaura les compres';

  @override
  String get terms => 'Condicions';

  @override
  String get privacy => 'Privadesa';

  @override
  String get groupProTitle =>
      'Un Pro al grup = Pro per a tothom en aquell grup';

  @override
  String get groupProBody =>
      'Si una persona té Pro, tot el grup obté tots els estils de càmera, membres il·limitats, fotos que es guarden, qualitat original i resums sense marca d\'aigua.';

  @override
  String get groupCreated => 'Grup creat ✓';

  @override
  String get inviteFriends => 'Convida els teus amics';

  @override
  String get codeCopied => 'S\'ha copiat el codi';

  @override
  String get shareLink => 'Comparteix l\'enllaç';

  @override
  String inviteSubject(String groupName) {
    return 'Uneix-te a $groupName a CamTrip';
  }

  @override
  String inviteMembersUnlimited(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count membres',
      one: '1 membre',
    );
    return '$_temp0 · il·limitat (Pro)';
  }

  @override
  String inviteMembersLimit(int count, int limit) {
    return '$count de $limit membres · Pro: il·limitat';
  }

  @override
  String get toCamera => 'Ves a la càmera';

  @override
  String get done => 'Fet';

  @override
  String get joinEnterCode => 'Introdueix el codi de 6 caràcters';

  @override
  String get joinGroupTitle => 'Uneix-te a un grup';

  @override
  String get joinGroupSubtitle =>
      'Introdueix el codi dels teus amics o escaneja el seu codi QR.';

  @override
  String get typeCode => 'Escriu el codi';

  @override
  String get scanQr => 'Escaneja el QR';

  @override
  String get join => 'Uneix-t\'hi';

  @override
  String get groupNameRequired => 'Posa un nom al grup';

  @override
  String get newGroup => 'Grup nou';

  @override
  String get groupType => 'Tipus de grup';

  @override
  String get groupTypeVacation => 'Vacances';

  @override
  String get groupTypeVacationDescription =>
      'Amb data d\'inici i de final, després s\'arxiva';

  @override
  String get groupTypeEvent => 'Esdeveniment';

  @override
  String get groupTypeEventDescription => 'Un dia o una nit, p. ex. una festa';

  @override
  String get groupTypePermanent => 'Sempre obert';

  @override
  String get groupTypePermanentDescription => 'Per a la teva colla de sempre';

  @override
  String get date => 'Data';

  @override
  String get departure => 'Sortida';

  @override
  String get returnDate => 'Tornada';

  @override
  String get defaultCameraStyle => 'Estil de càmera per defecte';

  @override
  String freeLimitPermanent(int max) {
    return 'Gratis: fins a $max membres. Il·limitat amb Pro.';
  }

  @override
  String freeLimitDated(int max, int days) {
    return 'Gratis: fins a $max membres, les fotos es guarden fins a $days dies després de la data de final. Il·limitat i per sempre amb Pro.';
  }

  @override
  String get createGroup => 'Crea el grup';

  @override
  String get group => 'Grup';

  @override
  String groupCode(String code) {
    return 'codi $code';
  }

  @override
  String get manage => 'Gestiona';

  @override
  String get rename => 'Canvia el nom';

  @override
  String get changeDates => 'Canvia les dates';

  @override
  String get finishTrip => 'Acaba el viatge';

  @override
  String get finishTripSubtitle => 'Posa avui com a data de final';

  @override
  String get reopenGroup => 'Torna a obrir el grup';

  @override
  String get closeGroup => 'Tanca el grup';

  @override
  String get reopenGroupSubtitle => 'Els membres poden tornar a afegir fotos';

  @override
  String get closeGroupSubtitle =>
      'Ningú no pot afegir més fotos; tot es pot continuar veient';

  @override
  String get members => 'Membres';

  @override
  String memberYou(String name) {
    return '$name (tu)';
  }

  @override
  String get blockedTag => 'bloquejat';

  @override
  String get adminTag => 'admin';

  @override
  String removeMemberTitle(String name) {
    return 'Vols treure $name?';
  }

  @override
  String get removeMemberMessage => 'Les seves fotos es queden al grup.';

  @override
  String get remove => 'Elimina';

  @override
  String get removeMember => 'Treu';

  @override
  String blockTitle(String name) {
    return 'Vols bloquejar $name?';
  }

  @override
  String blockMessage(String name) {
    return 'Ja no veuràs fotos ni vídeos de $name ni en rebràs notificacions. Ho pots desfer a Configuració.';
  }

  @override
  String get block => 'Bloqueja';

  @override
  String get makeMember => 'Fes-lo membre normal';

  @override
  String get makeAdmin => 'Fes-lo administrador';

  @override
  String get removeFromGroup => 'Treu del grup';

  @override
  String get unblock => 'Desbloqueja';

  @override
  String get inviteFriendsButton => 'Convida amics';

  @override
  String get you => 'Tu';

  @override
  String get unarchive => 'Restaura de l\'arxiu';

  @override
  String get archive => 'Arxiva';

  @override
  String get unarchiveSubtitle => 'El grup torna a ser amb els teus àlbums';

  @override
  String archiveSubtitle(String section) {
    return 'Només per a tu: el grup passa a «$section» a la part de baix dels teus àlbums';
  }

  @override
  String get archivedSection => 'Arxivats';

  @override
  String get hiddenPhotos => 'Fotos amagades';

  @override
  String get hiddenPhotosSubtitle => 'Fotos que has amagat per a tu';

  @override
  String get leaveGroup => 'Surt del grup';

  @override
  String get leaveGroupSubtitle =>
      'Les teves fotos es queden al grup per als altres';

  @override
  String get deleteGroup => 'Elimina el grup';

  @override
  String get deleteGroupSubtitle => 'S\'eliminen totes les fotos per a tothom';

  @override
  String groupArchived(String groupName) {
    return 'S\'ha arxivat «$groupName»';
  }

  @override
  String groupUnarchived(String groupName) {
    return '«$groupName» torna a ser amb els teus àlbums';
  }

  @override
  String get undo => 'Desfés';

  @override
  String get groupNameTitle => 'Nom del grup';

  @override
  String get finishTripTitle => 'Vols acabar el viatge?';

  @override
  String get finishTripMessage =>
      'La data de final passa a ser avui. Encara pots afegir fotos; el resum ja està a punt.';

  @override
  String get finishTripConfirm => 'Acaba';

  @override
  String get tripFinished => 'Viatge acabat';

  @override
  String leaveGroupTitle(String groupName) {
    return 'Vols sortir de «$groupName»?';
  }

  @override
  String get leaveGroupMessage =>
      'Les teves fotos es queden al grup per als altres. Més endavant t\'hi pots tornar a unir amb el codi.';

  @override
  String get leave => 'Surt';

  @override
  String groupDeleted(String groupName) {
    return 'S\'ha eliminat «$groupName»';
  }

  @override
  String get youAreAdmin => 'ets administrador';

  @override
  String get open => 'Obre';

  @override
  String get archiveMenuSubtitle => 'Només per a tu, els altres no ho notaran';

  @override
  String get deleteGroupMenuSubtitle => 'Per a tothom, amb totes les fotos';

  @override
  String get deleteGroupTitle => 'Vols eliminar el grup?';

  @override
  String deleteGroupMessage(int count, String groupName, int memberCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Totes les $count fotos i vídeos',
      one: '1 foto o vídeo',
    );
    String _temp1 = intl.Intl.pluralLogic(
      memberCount,
      locale: localeName,
      other: 'tots els $memberCount membres',
      one: '1 membre',
    );
    return '$_temp0 de «$groupName» desapareixeran per a $_temp1. No es pot desfer.';
  }

  @override
  String get deleteGroupOwnRoll => 'El teu carret de fotos no canvia.';

  @override
  String get deleteGroupTypeName => 'Escriu el nom del grup per confirmar-ho:';

  @override
  String get deleteForEveryone => 'Elimina per a tothom';

  @override
  String get save => 'Desa';

  @override
  String get yourAlbums => 'Els teus àlbums';

  @override
  String get uploadQueue => 'Cua de pujada';

  @override
  String get noConnection => 'No hi ha connexió';

  @override
  String get albumsOfflineMessage =>
      'Els àlbums es carregaran quan tornis a tenir connexió. La càmera continua funcionant.';

  @override
  String get retry => 'Torna-ho a provar';

  @override
  String get noAlbumsTitle => 'Encara no hi ha àlbums';

  @override
  String get noAlbumsMessage =>
      'Crea un grup per al teu proper viatge, o uneix-te al d\'un amic amb el seu codi.';

  @override
  String get haveCode => 'Tinc un codi';

  @override
  String get joinWithCode => 'Uneix-t\'hi amb un codi o un QR';

  @override
  String get camera => 'Càmera';

  @override
  String get restore => 'Restaura';

  @override
  String get more => 'Més';

  @override
  String get newAlbum => 'Nou';

  @override
  String get closedTag => 'tancat';

  @override
  String get activeTag => 'actiu';

  @override
  String get uploadFailed => 'La pujada ha fallat';

  @override
  String get queueNoSignal => 'Sense cobertura.';

  @override
  String get queueNoSignalMessage =>
      'Les teves fotos ja són al teu àlbum i es compartiran quan tornis a tenir connexió.';

  @override
  String get queueWaitingForWifi => 'Esperant la Wi-Fi.';

  @override
  String queueWifiOnlyOn(String setting) {
    return 'Tens activat «$setting».';
  }

  @override
  String get queueVideosWifiOnly => 'Els vídeos només es pugen amb Wi-Fi.';

  @override
  String get queueAllShared => 'Tot s\'ha compartit ✓';

  @override
  String queuePending(String items) {
    return 'Encara per compartir: $items';
  }

  @override
  String queuePendingBoth(String photos, String videos) {
    return 'Encara per compartir: $photos i $videos';
  }

  @override
  String get retryUpload => 'Torna-ho a provar';

  @override
  String get removeFromQueue => 'Treu de la cua';

  @override
  String get queueStatusWifi => 'Wi-Fi';

  @override
  String get queueStatusWaiting => 'en espera';

  @override
  String get videosWifiOnlyTitle => 'Vídeos només amb Wi-Fi';

  @override
  String get videosWifiOnlySubtitle => 'Estalvia dades mòbils';

  @override
  String get retryNow => 'Torna-ho a provar ara';

  @override
  String get yourName => 'El teu nom';

  @override
  String get settings => 'Configuració';

  @override
  String get tapToChangeName => 'Toca per canviar el nom';

  @override
  String get getCamTripPro => 'Aconsegueix CamTrip Pro';

  @override
  String get photos => 'Fotos';

  @override
  String get saveOwnPhotos => 'Desa les meves fotos en un àlbum per grup';

  @override
  String get autoSaveOthers => 'Desa automàticament les fotos dels altres';

  @override
  String get wifiOnlyTitle => 'Puja només amb Wi-Fi';

  @override
  String get dateStamp => 'Data a la foto';

  @override
  String get notifications => 'Notificacions';

  @override
  String get notifyNewPhotos => 'Fotos noves (agrupades)';

  @override
  String get notifyRecapReady => 'Resum a punt';

  @override
  String get camTripTeam => 'Equip de CamTrip';

  @override
  String get adminEntrySubtitle =>
      'Usuaris, donar Pro, denúncies i estadístiques';

  @override
  String get account => 'Compte';

  @override
  String get manageSubscription => 'Gestiona la subscripció';

  @override
  String get blockedPeople => 'Persones bloquejades';

  @override
  String get nobody => 'Ningú';

  @override
  String peopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count persones',
      one: '1 persona',
    );
    return '$_temp0';
  }

  @override
  String get privacyPolicy => 'Política de privadesa';

  @override
  String get contact => 'Contacte';

  @override
  String get signOut => 'Tanca la sessió';

  @override
  String get deleteAccount => 'Elimina el compte';

  @override
  String get deleteAccountSubtitle =>
      'Elimina el teu compte i totes les teves fotos';

  @override
  String get deleteAccountTitle => 'Vols eliminar el compte?';

  @override
  String get deleteAccountMessage =>
      'El teu compte i totes les teves fotos i vídeos s\'eliminaran, també dels grups. Cancel·la qualsevol subscripció activa a l\'App Store o a Google Play.';

  @override
  String get blockedTitle => 'Bloquejats';

  @override
  String get blockedSubtitle => 'No veus fotos d\'aquestes persones.';

  @override
  String get blockedNone => 'No has bloquejat ningú.';

  @override
  String get unblockShort => 'Desbloqueja';

  @override
  String get groupGone => 'Aquest grup ja no existeix o ja no n\'ets membre.';

  @override
  String photosSavedToAlbum(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotos desades a «$album»',
      one: '1 foto desada a «$album»',
    );
    return '$_temp0';
  }

  @override
  String photosDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotos eliminades',
      one: '1 foto eliminada',
    );
    return '$_temp0';
  }

  @override
  String photosDeletedSkipped(int count, int skipped) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotos eliminades',
      one: '1 foto eliminada',
    );
    return '$_temp0, $skipped omeses';
  }

  @override
  String photosHiddenForYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotos amagades per a tu',
      one: '1 foto amagada per a tu',
    );
    return '$_temp0';
  }

  @override
  String get addedToFavorites => 'Afegida a preferides';

  @override
  String get removedFromFavorites => 'Treta de preferides';

  @override
  String get photoAccessSettings =>
      'Dona accés a les fotos a CamTrip a Configuració';

  @override
  String photosBeingAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'S\'estan afegint $count fotos',
      one: 'S\'està afegint 1 foto',
    );
    return '$_temp0';
  }

  @override
  String photosUnreadable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'No s\'han pogut llegir $count fotos',
      one: 'No s\'ha pogut llegir 1 foto',
    );
    return '$_temp0';
  }

  @override
  String get groupNotLoaded => 'El grup no s\'ha carregat';

  @override
  String get noFavoritesTitle => 'Encara no hi ha preferides';

  @override
  String get noPhotosTitle => 'Encara no hi ha fotos';

  @override
  String get noFavoritesMessage =>
      'Toca l\'estrella d\'una foto per posar-la aquí.';

  @override
  String get noPhotosMessage =>
      'Fes la primera foto. Tothom del grup la veu a l\'instant.';

  @override
  String get openCamera => 'Obre la càmera';

  @override
  String savingProgress(int done, int total) {
    return 'S\'està desant... $done/$total';
  }

  @override
  String get sharePreparing => 'S\'està preparant...';

  @override
  String sharingProgress(int done, int total) {
    return 'S\'està preparant... $done/$total';
  }

  @override
  String get choosePhotos => 'Tria fotos';

  @override
  String selectedCount(int count) {
    return '$count seleccionades';
  }

  @override
  String get selectNone => 'No en seleccionis cap';

  @override
  String get selectAll => 'Selecciona-les totes';

  @override
  String photosWaitingToShare(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotos esperant per compartir',
      one: '1 foto esperant per compartir',
    );
    return '$_temp0';
  }

  @override
  String get recapReadyTitle => 'El teu resum està a punt';

  @override
  String get recapReadySubtitle => 'Un vídeo amb música del teu viatge';

  @override
  String get watch => 'Mira';

  @override
  String get makeRecapNow => 'Fes ara un vídeo resum';

  @override
  String freeGroupDeleteNotice(String date) {
    return 'Grup gratuït: les fotos es guarden fins al $date. Desa-les o fes-te Pro.';
  }

  @override
  String get filterAll => 'Totes';

  @override
  String get filterFavorites => 'Preferides';

  @override
  String get filterPerPerson => 'Per persona';

  @override
  String get filterPerson => 'Persona';

  @override
  String get select => 'Selecciona';

  @override
  String get hiddenFilter => 'Amagades';

  @override
  String get photosBy => 'Fotos de...';

  @override
  String get uploadedTag => 'pujada';

  @override
  String get saveAll => 'Desa-ho tot';

  @override
  String get favorite => 'Preferida';

  @override
  String get unfavorite => 'Treu de preferides';

  @override
  String get hide => 'Amaga';

  @override
  String get delete => 'Elimina';

  @override
  String deletePhotosTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Vols eliminar $count fotos?',
      one: 'Vols eliminar la foto?',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Desapareixen per a tothom del grup. No es pot desfer.',
      one: 'Desapareix per a tothom del grup. No es pot desfer.',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosNotAllowed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count fotos són d\'una altra persona. Es queden; només un administrador les pot eliminar.',
      one:
          '1 foto és d\'una altra persona. Es queda; només un administrador la pot eliminar.',
    );
    return '$_temp0';
  }

  @override
  String photosBackInGroup(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotos tornen a ser al grup',
      one: '1 foto torna a ser al grup',
    );
    return '$_temp0';
  }

  @override
  String get showAll => 'Mostra-ho tot';

  @override
  String get hiddenPhotosExplainer =>
      'Només tu ja no veus aquestes fotos. Per als altres del grup encara hi són.';

  @override
  String get nothingHidden => 'No hi ha res amagat';

  @override
  String get nothingHiddenMessage => 'Les fotos que amaguis apareixeran aquí.';

  @override
  String showAgainCount(int count) {
    return 'Torna a mostrar ($count)';
  }

  @override
  String get someone => 'Algú';

  @override
  String get savedToAlbum => 'Desada a l\'àlbum de fotos';

  @override
  String get share => 'Comparteix';

  @override
  String get shareFailed => 'No s\'ha pogut compartir';

  @override
  String get reportTitle => 'Per què denuncies aquesta foto?';

  @override
  String get reportSubtitle =>
      'Revisem cada denúncia en 24 hores. La foto s\'amaga per a tu a l\'instant.';

  @override
  String get reportThanks => 'Gràcies, ho revisarem';

  @override
  String blockMessageAllGroups(String name) {
    return 'Ja no veuràs fotos ni vídeos de $name en cap grup ni en rebràs notificacions. Ho pots desfer a Configuració.';
  }

  @override
  String userBlocked(String name) {
    return 'S\'ha bloquejat $name';
  }

  @override
  String get videoHiddenForYou => 'Vídeo amagat per a tu';

  @override
  String get photoHiddenForYou => 'Foto amagada per a tu';

  @override
  String get setAsCover => 'Posa-la de portada';

  @override
  String get coverUpdated => 'S\'ha actualitzat la portada';

  @override
  String get hideForMe => 'Amaga per a mi';

  @override
  String get hideForMeSubtitle => 'Els altres del grup la continuen veient';

  @override
  String get reportPhoto => 'Denuncia la foto';

  @override
  String blockName(String name) {
    return 'Bloqueja $name';
  }

  @override
  String get forEveryoneInGroup => 'Per a tothom del grup';

  @override
  String get videoDeleted => 'Vídeo eliminat';

  @override
  String get photoDeleted => 'Foto eliminada';

  @override
  String get photoAccessToSave =>
      'Dona accés a les fotos a CamTrip a Configuració per poder-les desar';

  @override
  String get phoneFull => 'El telèfon és ple';

  @override
  String get albumSaveFailedShort => 'No s\'ha pogut desar a l\'àlbum';

  @override
  String get recapTemplateGoldenHour => 'Golden Hour';

  @override
  String get recapTemplateFast => 'Ràpid';

  @override
  String get recapTemplateFilmRoll => 'Rodet';

  @override
  String get recapTemplatePolaroid => 'Polaroid';

  @override
  String get trackSummerEvening => 'Vespre d\'estiu';

  @override
  String get trackGoldenHour => 'Golden Hour';

  @override
  String get trackRoadtrip => 'Road Trip';

  @override
  String get moodWarm => 'càlid';

  @override
  String get moodCheerful => 'alegre';

  @override
  String friendsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count amics',
      one: '1 amic',
    );
    return '$_temp0';
  }

  @override
  String get madeWithCamTrip => 'Fet amb CamTrip';

  @override
  String get tagline => 'Un sol rodet per a tota la colla';

  @override
  String get videoUnsupportedDevice =>
      'No s\'ha pogut crear el vídeo en aquest dispositiu';

  @override
  String get groupLoadFailed => 'No s\'ha pogut carregar aquest grup.';

  @override
  String recapNeedsPhotos(int count) {
    return 'Necessites almenys $count fotos per a un resum.';
  }

  @override
  String get recapFailed => 'No s\'ha pogut crear el resum. Torna-ho a provar.';

  @override
  String get recapSaved => 'Resum desat a l\'àlbum de fotos';

  @override
  String get recap => 'Resum';

  @override
  String get recapRendering => 'S\'està fent el resum...';

  @override
  String get videoRendering => 'S\'està fent el vídeo...';

  @override
  String get template => 'Plantilla';

  @override
  String get musicLicense => 'Música pròpia de CamTrip · sense drets';

  @override
  String get change => 'Canvia';

  @override
  String get noWatermark => 'Sense marca d\'aigua ✓';

  @override
  String get removeWatermarkPro => 'Treu la marca d\'aigua amb Pro';

  @override
  String get proSourceSubscription => 'Subscripció';

  @override
  String get proSourceGift => 'Regal';

  @override
  String get proSourceAdmin => 'Admin';

  @override
  String get proSourceGroup => 'Pel grup';

  @override
  String get noPro => 'Sense Pro';

  @override
  String proStatusNoEnd(String source) {
    return 'Pro ($source), sense data de final';
  }

  @override
  String proStatusUntil(String source, String date) {
    return 'Pro ($source), fins al $date';
  }

  @override
  String get lifetime => 'De per vida';

  @override
  String get pickDate => 'Tria una data';

  @override
  String get noAccess => 'Sense accés';

  @override
  String get adminOnlyTeam => 'La gestió és només per a l\'equip de CamTrip.';

  @override
  String get adminOverview => 'Resum';

  @override
  String get adminUsers => 'Usuaris';

  @override
  String get adminReports => 'Denúncies';

  @override
  String adminsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count administradors',
      one: '1 administrador',
    );
    return '$_temp0';
  }

  @override
  String get adminNewThisWeek => 'Nous aquesta setmana';

  @override
  String get adminGroups => 'Grups';

  @override
  String get adminProSubscription => 'Pro per subscripció';

  @override
  String get adminProGift => 'Pro com a regal';

  @override
  String adminWithoutSubscription(int count) {
    return '$count sense subscripció';
  }

  @override
  String get adminOpenReports => 'Denúncies obertes';

  @override
  String get adminSearchHint => 'Cerca per nom o correu';

  @override
  String get nobodyFound => 'No s\'ha trobat ningú';

  @override
  String get loadMore => 'Carrega\'n més';

  @override
  String get noEmail => 'Sense correu';

  @override
  String adminDeletePhotoMessage(String groupName) {
    return 'La foto desapareix per a tothom de «$groupName». Es resolen totes les denúncies d\'aquesta foto.';
  }

  @override
  String get adminBanMessage =>
      'Aquest compte ja no podrà iniciar la sessió ni fer servir l\'app. Ho pots desfer més endavant.';

  @override
  String get adminDismissTitle => 'Vols descartar la denúncia?';

  @override
  String get adminDismissMessage =>
      'La foto es queda. La denúncia es marca com a resolta.';

  @override
  String get adminDismiss => 'Descarta';

  @override
  String get adminAccountBlocked => 'Compte bloquejat';

  @override
  String get adminReportDismissed => 'Denúncia descartada';

  @override
  String get adminNoReports => 'No hi ha denúncies obertes';

  @override
  String get adminNoReportsMessage => 'Les fotos denunciades apareixen aquí.';

  @override
  String get deletedTag => 'Eliminat';

  @override
  String adminReportedBy(String name) {
    return 'Per $name';
  }

  @override
  String adminPhotoBy(String name) {
    return 'Foto de $name';
  }

  @override
  String reportsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count denúncies',
      one: '1 denúncia',
    );
    return '$_temp0';
  }

  @override
  String get adminDeletePhoto => 'Elimina la foto';

  @override
  String get adminBlockCreator => 'Bloqueja l\'autor';

  @override
  String get loadFailed => 'No s\'ha pogut carregar';

  @override
  String get adminLifetimeProGiven => 'S\'ha donat Pro de per vida';

  @override
  String get adminProGiven => 'S\'ha donat Pro';

  @override
  String adminGiveProUntil(String date) {
    return 'Dona Pro fins al $date';
  }

  @override
  String get adminGiveProLifetime => 'Dona Pro de per vida';

  @override
  String adminGiveProFor(String period) {
    return 'Dona Pro durant $period';
  }

  @override
  String get adminReasonHint => 'Motiu, p. ex. amic, provador, influencer';

  @override
  String get adminGivePro => 'Dona Pro';

  @override
  String get adminRevokeTitle => 'Vols revocar el regal?';

  @override
  String get adminRevokeMessage =>
      'El Pro regalat s\'atura de seguida. La seva pròpia subscripció continua.';

  @override
  String get adminRevoke => 'Revoca';

  @override
  String get adminGiftRevoked => 'Regal revocat';

  @override
  String get adminUnbanTitle => 'Vols treure el bloqueig?';

  @override
  String adminUnbanMessage(String name) {
    return '$name pot tornar a iniciar la sessió.';
  }

  @override
  String get adminUnbanned => 'S\'ha tret el bloqueig';

  @override
  String get adminBanUserMessage =>
      'Aquest compte ja no podrà iniciar la sessió ni fer servir l\'app. Les fotos es queden.';

  @override
  String get adminUser => 'Usuari';

  @override
  String get adminNotVerified => 'no verificat';

  @override
  String get adminRole => 'Rol';

  @override
  String get adminCreated => 'Creat';

  @override
  String get unknown => 'Desconegut';

  @override
  String get adminSignInWith => 'Inicia la sessió amb';

  @override
  String get adminEmailMethod => 'Correu';

  @override
  String get adminPhotosAndVideos => 'Fotos i vídeos';

  @override
  String get adminStatus => 'Estat';

  @override
  String get adminActive => 'Actiu';

  @override
  String adminActiveUntil(String date) {
    return 'Actiu fins al $date';
  }

  @override
  String adminGiftFrom(String name) {
    return 'Regal de $name';
  }

  @override
  String adminExpiredOn(String date) {
    return 'Va caducar el $date';
  }

  @override
  String get adminExpired => 'Caducat';

  @override
  String adminUntil(String date) {
    return 'Fins al $date';
  }

  @override
  String get adminGiveProTitle => 'Dona Pro';

  @override
  String get adminGiveProNote =>
      'També funciona per als grups d\'aquesta persona: un Pro al grup = Pro per a tothom en aquell grup.';

  @override
  String get adminRevokeGift => 'Revoca el regal';

  @override
  String get adminModeration => 'Moderació';

  @override
  String get adminCannotBanSelf => 'No et pots bloquejar a tu mateix.';

  @override
  String get adminCannotBanAdmin => 'No es pot bloquejar un administrador.';

  @override
  String get adminUnban => 'Treu el bloqueig';

  @override
  String get adminBanAccount => 'Bloqueja el compte';

  @override
  String get googleSignInUnavailable =>
      'L\'inici de sessió amb Google encara no està disponible';

  @override
  String get cameraPickerTitle => 'Tria la càmera';

  @override
  String get cameraPickerSubtitle =>
      'Cada càmera dona un estil propi a les teves fotos';

  @override
  String get cameraPickerChange => 'Canvia de càmera';

  @override
  String get cameraPickerUnlock => 'Desbloqueja amb Pro';

  @override
  String get cameraPickerSelected => 'Seleccionada';

  @override
  String get cameraPickerStyleSummer => 'Estiu';

  @override
  String get cameraPickerStyleSummerDescription =>
      'Colors càlids i esvaïts d\'una instantània dels 90';

  @override
  String get cameraPickerStyleNight => 'Nit 800';

  @override
  String get cameraPickerStyleNightDescription =>
      'Pel·lícula de cinema: ombres turquesa, llum càlida, molt de gra';

  @override
  String get cameraPickerStyleSepia => 'Sèpia';

  @override
  String get cameraPickerStyleSepiaDescription =>
      'Una foto marró antiga de la capsa de sabates';

  @override
  String get cameraPickerStyleLomo => 'Lomo';

  @override
  String get cameraPickerStyleLomoDescription =>
      'Colors intensos, cantonades fosques i un to de color boig';

  @override
  String get cameraPickerStyleMint => 'Menta';

  @override
  String get cameraPickerStyleMintDescription => 'Suau i fresc amb un to verd';

  @override
  String get cameraPickerStylePastel => 'Rosa';

  @override
  String get cameraPickerStylePastelDescription =>
      'Colors pastel amb una llum rosa i una vora blanca';

  @override
  String get cameraPickerStyleSuper8 => 'Super 8';

  @override
  String get cameraPickerStyleSuper8Description =>
      'Granulat i suau, com una pel·lícula casolana antiga';

  @override
  String get paywallBenefitGroup => 'Un Pro = Pro per a tot el grup';

  @override
  String get paywallBenefitUnlimited =>
      'Membres il·limitats, les fotos es guarden per sempre';

  @override
  String get paywallBenefitQuality => 'Sense marca d\'aigua, qualitat original';

  @override
  String paywallFreeTrial(String period) {
    return '$period gratis';
  }

  @override
  String paywallPriceYear(String price) {
    return '$price l\'any.';
  }

  @override
  String paywallPriceYearTrial(String period, String price) {
    return '$period gratis i després $price l\'any.';
  }

  @override
  String paywallPriceMonth(String price) {
    return '$price al mes.';
  }

  @override
  String paywallPriceMonthTrial(String period, String price) {
    return '$period gratis i després $price al mes.';
  }

  @override
  String paywallAutoRenew(String store) {
    return 'Es renova automàticament. Cancel·la almenys 24 hores abans de la renovació a $store.';
  }

  @override
  String get paywallDetailsTitle => 'Tot el que inclou Pro';

  @override
  String get paywallBenefitStyles => 'Tots els estils de càmera';

  @override
  String get allPhotosTitle => 'Totes les fotos';

  @override
  String get homeTabAlbums => 'Àlbums';

  @override
  String get allPhotosEmptyTitle => 'Encara no hi ha fotos';

  @override
  String get allPhotosEmptyMessage =>
      'Obre la càmera i fes la teva primera foto.';

  @override
  String get allPhotosLoadFailed => 'No s\'han pogut carregar les teves fotos';

  @override
  String get cameraSettingsTitle => 'Configuració de la càmera';

  @override
  String get cameraSettingsMore => 'Més opcions';

  @override
  String get cameraSettingsGrid => 'Quadrícula';

  @override
  String get cameraSettingsHaptics => 'Vibra en fer la foto';

  @override
  String get cameraSettingsDateStamp => 'Data a baix a la dreta';

  @override
  String get cameraSettingsSound => 'So de l\'obturador';

  @override
  String get cameraSettingsSoundHint =>
      'En silenci quan el telèfon està en silenci';

  @override
  String get cameraSettingsTimer => 'Temporitzador';

  @override
  String get cameraSettingsTimerOff => 'No';

  @override
  String cameraSettingsTimerSeconds(int seconds) {
    return '$seconds s';
  }

  @override
  String get cameraSettingsTimerCancelHint =>
      'Toca l\'obturador per cancel·lar';

  @override
  String get cameraSettingsMirror => 'Selfies en mirall';

  @override
  String get cameraSettingsSaveToRoll => 'Desa al carret';

  @override
  String get cameraSettingsQuality => 'Qualitat';

  @override
  String get cameraSettingsQualityStandard => 'Estàndard';

  @override
  String get cameraSettingsQualityHigh => 'Alta';

  @override
  String get cameraLowLightHint => 'Poca llum: activa el flaix';

  @override
  String get cameraFlashUnavailable => 'Aquesta càmera no té flaix';

  @override
  String get cameraFlashScreen => 'Flaix de pantalla';

  @override
  String get cameraFlashCycleHint => 'Toca per canviar entre no, sí i auto';

  @override
  String get cameraFlip => 'Canvia entre la càmera frontal i la posterior';

  @override
  String get cameraFlipHint => 'Toca dues vegades el visor per girar la càmera';

  @override
  String cameraPickerPaywallStyles(int count, String styles) {
    return 'Les $count càmeres, incloent-hi $styles';
  }

  @override
  String get styleFlash => 'Flaix 400';

  @override
  String get styleFlashDescription =>
      'Flaix directe sobre pel·lícula càlida: resplendor ambre, gra, vermells intensos';

  @override
  String cameraTimerButton(String state) {
    return 'Temporitzador: $state';
  }

  @override
  String get cameraTimerCycleHint => 'Toca per canviar entre no, 3 s i 10 s';

  @override
  String get cameraLastShotOpen => 'Última foto, obre l\'àlbum';

  @override
  String get cameraLastShotEmpty => 'Encara no hi ha fotos, obre l\'àlbum';

  @override
  String get deleteOnlyOwnOrAdmin =>
      'Només qui l\'ha feta o un administrador ho pot eliminar';

  @override
  String get videoPlay => 'Reprodueix';

  @override
  String get videoPause => 'Pausa';

  @override
  String get language => 'Idioma';

  @override
  String get languageSystem => 'Idioma del sistema';

  @override
  String languageSystemCurrent(String language) {
    return 'Sistema ($language)';
  }

  @override
  String get languageSearchHint => 'Cerca un idioma';

  @override
  String get languageNoResults => 'No s\'ha trobat cap idioma';

  @override
  String get personalRollTitle => 'El meu rodet';

  @override
  String get personalRollSubtitle => 'Només per a tu';

  @override
  String get personalRollPickerSubtitle => 'Fotos soltes, només per a tu';

  @override
  String get personalRollMove => 'A l\'àlbum';

  @override
  String get personalRollMoveTitle => 'Mou a un àlbum';

  @override
  String get personalRollMoveNoAlbums =>
      'Primer crea un àlbum o uneix-te a un amb un codi.';

  @override
  String personalRollMoved(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotos mogudes a $album',
      one: '1 foto moguda a $album',
    );
    return '$_temp0';
  }

  @override
  String get personalRollPrivateNote =>
      'Només tu veus aquestes fotos. Mou-les a un àlbum per compartir-les.';

  @override
  String get paywallTripPassSub => 'Només aquest viatge, per a tot el grup';

  @override
  String get paywallOneTime => 'pagament únic';

  @override
  String get paywallBestValue => 'Millor preu';

  @override
  String paywallRollFullTitle(int used, int limit) {
    return 'El teu rodet és ple - $used/$limit fotos';
  }

  @override
  String get paywallRollFullSub =>
      'Continua fent fotos amb un Trip Pass o Pro.';

  @override
  String get paywallCameraTitle => 'Aquesta càmera és de Pro';

  @override
  String paywallCameraSub(int count) {
    return 'Desbloqueja les $count càmeres.';
  }

  @override
  String get paywallWatermarkTitle => 'Recap sense marca d\'aigua';

  @override
  String get paywallWatermarkSub =>
      'Comparteix el recap sense el logo de CamTrip.';

  @override
  String get paywallDeletionTitle => 'Guarda el teu viatge';

  @override
  String paywallDeletionSub(String date) {
    return 'Els viatges gratuïts s\'esborren el $date. Amb un Trip Pass o Pro es queda per sempre.';
  }

  @override
  String paywallTripPassTerms(String price) {
    return 'Compra única de $price per a aquest viatge. No és una subscripció.';
  }

  @override
  String get buyTripPass => 'Compra el Trip Pass';

  @override
  String get tripPassActive =>
      'Trip Pass actiu: aquest viatge és Pro per a tothom';

  @override
  String get tripPassActivating =>
      'Pagament rebut. El Trip Pass estarà actiu de seguida.';

  @override
  String proViaTripPass(String name) {
    return 'Trip Pass de $name';
  }

  @override
  String rollCounterSemantics(int used, int limit) {
    return '$used de $limit fotos al teu rodet';
  }

  @override
  String rollHeldTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotos ja no caben al rodet',
      one: '1 foto ja no cap al rodet',
    );
    return '$_temp0';
  }

  @override
  String get rollHeldBody => 'Guarda-les amb Pro o un Trip Pass';

  @override
  String deletionBannerTitle(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Guarda el teu viatge - queden $days dies',
      one: 'Guarda el teu viatge - queda 1 dia',
    );
    return '$_temp0';
  }

  @override
  String get deletionBannerBody =>
      'Els viatges gratuïts s\'esborren 30 dies després d\'acabar. Amb un Trip Pass o Pro es queda per sempre.';

  @override
  String apiRollFull(int limit) {
    return 'El teu rodet és ple ($limit fotos). Agafa un Trip Pass o Pro per continuar.';
  }

  @override
  String get apiTripPassFailed =>
      'No s\'ha pogut activar el Trip Pass. Escriu a support@camtrip.app.';

  @override
  String get apiTripPassExists => 'Aquest viatge ja té un Trip Pass.';

  @override
  String get tripPassUnavailable =>
      'El Trip Pass no està disponible ara. Torna-ho a provar més tard.';

  @override
  String get tripMapTitle => 'Mapa del viatge';

  @override
  String get tripMapOpen => 'Mapa i estadístiques';

  @override
  String get tripMapLoadFailed => 'No s’ha pogut carregar el mapa';

  @override
  String get tripMapStatDays => 'Dies';

  @override
  String get tripMapStatPhotos => 'Fotos';

  @override
  String get tripMapStatVideos => 'Vídeos';

  @override
  String get tripMapStatMembers => 'Membres';

  @override
  String get tripMapStatDistance => 'km recorreguts';

  @override
  String get tripMapStatCountries => 'Països';

  @override
  String get tripMapStatPlaces => 'Llocs';

  @override
  String tripMapBusiestDay(String day, int count) {
    return 'Més fotos el $day ($count)';
  }

  @override
  String tripMapTopPhotographer(String name, int count) {
    return 'Millor fotògraf: $name ($count)';
  }

  @override
  String get tripMapOffTitle => 'El mapa del viatge està desactivat';

  @override
  String get tripMapOffMessage =>
      'Un admin pot activar el mapa a la configuració del grup. Les estadístiques sempre les veus.';

  @override
  String get tripMapOffMessageAdmin =>
      'Activa el mapa per veure on heu fet les fotos. Cadascú decideix si hi participa.';

  @override
  String get tripMapEnable => 'Activa el mapa';

  @override
  String get tripMapEmptyTitle => 'Encara no hi ha llocs al mapa';

  @override
  String get tripMapEmptyMessage =>
      'Les fotos noves dels membres que comparteixen la ubicació apareixen aquí, arrodonides a uns 100 m.';

  @override
  String get tripMapConsentTitle => 'Mapa del viatge';

  @override
  String get tripMapConsentQuestion =>
      'Vols compartir on has fet les fotos al mapa d’aquest grup?';

  @override
  String get tripMapConsentDetail =>
      'Només ho veuen els membres del grup, arrodonit a uns 100 m. La ubicació no es desa mai dins de la foto i ho pots desactivar quan vulguis a la configuració del grup.';

  @override
  String get tripMapConsentYes => 'Sí, comparteix';

  @override
  String get tripMapConsentNo => 'No';

  @override
  String get tripMapLocationDenied =>
      'No hi ha accés a la teva ubicació. Pots permetre-ho a la configuració del telèfon.';

  @override
  String get tripMapSettingSubtitle =>
      'Mostra en un mapa on s’han fet les fotos. Cada membre decideix si comparteix.';

  @override
  String get tripMapDisableTitle => 'Vols desactivar el mapa?';

  @override
  String get tripMapDisableMessage =>
      'S’esborraran totes les ubicacions d’aquest grup. Si tornes a activar el mapa, preguntarem a tothom de nou.';

  @override
  String get tripMapDisable => 'Desactiva';

  @override
  String get tripMapMySharing => 'Comparteix la meva ubicació';

  @override
  String get tripMapMySharingOn =>
      'Les teves fotos noves apareixen al mapa (arrodonides a uns 100 m).';

  @override
  String get tripMapMySharingOff =>
      'Desactivat. Les teves fotos no apareixen al mapa.';

  @override
  String get tripMapStopSharingTitle => 'Vols deixar de compartir la ubicació?';

  @override
  String get tripMapStopSharingMessage =>
      'S’esborraran les ubicacions de totes les teves fotos d’aquest grup.';

  @override
  String get tripMapStopSharing => 'Deixa de compartir';
}
