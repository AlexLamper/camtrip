// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get cancel => 'Annuler';

  @override
  String get yes => 'Oui';

  @override
  String inviteMessageIntro(String groupName) {
    return 'Tu rejoins « $groupName » sur CamTrip ? Comme ça, on voit tout de suite les photos de chacun.';
  }

  @override
  String inviteMessageCode(String code) {
    return 'Ou saisis le code : $code';
  }

  @override
  String get memberFallbackName => 'Ami';

  @override
  String get reportReasonInappropriate => 'Inapproprié ou choquant';

  @override
  String get reportReasonSpam => 'Spam';

  @override
  String get reportReasonOther => 'Autre chose';

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
  String get errorOffline => 'Pas de connexion. Réessaie dans un instant.';

  @override
  String errorSomethingWrongStatus(int status) {
    return 'Un problème est survenu ($status)';
  }

  @override
  String get errorSomethingWrong => 'Un problème est survenu';

  @override
  String get apiInvalidCredentials =>
      'Adresse e-mail ou mot de passe incorrect';

  @override
  String get apiInvalidCode =>
      'Ce code est incorrect ou a expiré. Demande un nouveau code.';

  @override
  String get apiEmailTaken =>
      'Un compte existe déjà avec cette adresse e-mail. Connecte-toi, ou choisis « Mot de passe oublié ? ».';

  @override
  String apiEmailTakenProvider(String provider) {
    return 'Un compte existe déjà avec cette adresse e-mail. Connecte-toi avec $provider.';
  }

  @override
  String apiWeakPassword(int min) {
    return 'Choisis un mot de passe d\'au moins $min caractères';
  }

  @override
  String apiNameTooLong(int max) {
    return 'Ton nom peut contenir $max caractères maximum';
  }

  @override
  String get apiRateLimited =>
      'Trop de tentatives. Réessaie dans un quart d\'heure.';

  @override
  String apiAccountBanned(String email) {
    return 'Ton compte a été bloqué. Contacte $email si tu penses que c\'est une erreur.';
  }

  @override
  String get apiProRequired =>
      'Ce style d\'appareil fait partie de CamTrip Pro';

  @override
  String get apiGroupClosed => 'Ce groupe a été clôturé';

  @override
  String get apiGroupCodeNotFound => 'Aucun groupe trouvé avec ce code';

  @override
  String apiGroupFull(int max) {
    return 'Ce groupe est complet ($max membres max.). Si un membre a CamTrip Pro, tout le monde peut rejoindre sans limite.';
  }

  @override
  String get apiLastMember =>
      'Tu es le dernier membre. Supprime plutôt le groupe.';

  @override
  String get apiAdminRequired => 'Réservé aux administrateurs de CamTrip';

  @override
  String get apiUploadIncomplete => 'L\'envoi n\'est pas terminé';

  @override
  String get apiInvalidInput => 'Saisie non valide';

  @override
  String get apiNotSignedIn => 'Non connecté';

  @override
  String get apiAccountGone => 'Ce compte n\'existe plus';

  @override
  String get apiPhotoNotFound => 'Photo introuvable';

  @override
  String get apiGroupNotFound => 'Groupe introuvable';

  @override
  String get apiMemberNotFound => 'Membre introuvable';

  @override
  String get apiPersonNotFound => 'Personne introuvable';

  @override
  String get apiUserNotFound => 'Utilisateur introuvable';

  @override
  String get apiAdminOnly => 'Seul un admin peut faire ça';

  @override
  String get apiCannotBlockSelf => 'Tu ne peux pas te bloquer toi-même';

  @override
  String get apiCannotReportOwn => 'Tu ne peux pas signaler ta propre photo';

  @override
  String get apiDeleteOwnOnly => 'Tu ne peux supprimer que tes propres photos';

  @override
  String get apiOwnerCannotBeRemoved =>
      'Le créateur du groupe ne peut pas être retiré';

  @override
  String get apiOwnerStaysAdmin => 'Le créateur reste admin';

  @override
  String get apiNeedsOneAdmin => 'Un groupe a besoin d\'au moins un admin';

  @override
  String get apiEndBeforeStart => 'La date de fin est avant la date de début';

  @override
  String get apiPermanentNoEndDate =>
      'Un groupe toujours ouvert n\'a pas de date de fin';

  @override
  String get apiCannotBanAdmin => 'Un administrateur ne peut pas être bloqué';

  @override
  String get apiReportNotFound => 'Signalement introuvable';

  @override
  String get apiPhotoOwnerUnknown =>
      'L\'auteur de cette photo n\'est plus connu';

  @override
  String get validationNameRequired => 'Indique ton nom';

  @override
  String validationMaxChars(int max) {
    return '$max caractères maximum';
  }

  @override
  String get validationEmailRequired => 'Indique ton adresse e-mail';

  @override
  String get validationEmailInvalid => 'Cette adresse e-mail n\'est pas valide';

  @override
  String get validationPasswordRequired => 'Choisis un mot de passe';

  @override
  String validationMinChars(int min) {
    return 'Au moins $min caractères';
  }

  @override
  String get validationPasswordTooLong => 'Ce mot de passe est trop long';

  @override
  String get validationPasswordEmpty => 'Indique ton mot de passe';

  @override
  String get validationCodeRequired => 'Saisis le code reçu par e-mail';

  @override
  String get validationCodeDigits => 'Le code comporte 6 chiffres';

  @override
  String get onboarding1Title => 'Une pellicule\npour tout le groupe.';

  @override
  String get onboarding1Body =>
      'Prends des photos avec un appareil rétro. Tout le monde les voit aussitôt, et elles arrivent direct dans ton propre album.';

  @override
  String get onboarding2Title => 'Fini les photos\nà renvoyer.';

  @override
  String get onboarding2Body =>
      'Crée un groupe, partage le code, c\'est tout. Plus jamais de « tu peux m\'envoyer les photos ? »';

  @override
  String get onboarding3Title => 'Ensuite, une\nvidéo récap.';

  @override
  String get onboarding3Body =>
      'CamTrip crée une vidéo en musique avec vos plus beaux moments.';

  @override
  String get onboardingInvited =>
      'Tu as été invité ! Connecte-toi pour participer.';

  @override
  String get signInAppleFailed => 'La connexion avec Apple a échoué';

  @override
  String get signInGoogleFailed => 'La connexion avec Google a échoué';

  @override
  String get signInFailed => 'La connexion a échoué';

  @override
  String get next => 'Suivant';

  @override
  String get legalPrefix => 'En continuant, tu acceptes les ';

  @override
  String get legalTerms => 'conditions d\'utilisation';

  @override
  String get legalAnd => ' et la ';

  @override
  String get legalPrivacy => 'politique de confidentialité';

  @override
  String get legalSuffix => '.';

  @override
  String get continueWithApple => 'Continuer avec Apple';

  @override
  String get continueWithGoogle => 'Continuer avec Google';

  @override
  String get createAccount => 'Créer un compte';

  @override
  String get signIn => 'Se connecter';

  @override
  String get or => 'ou';

  @override
  String get registerSubtitle =>
      'Comme ça, tes amis voient qui prend les photos.';

  @override
  String get loginSubtitle => 'Content de te revoir.';

  @override
  String get forgotPasswordTitle => 'Mot de passe oublié';

  @override
  String get forgotPasswordPushSubtitle =>
      'Tu es encore connecté quelque part ? On t\'y envoie un code à 6 chiffres par notification pour choisir un nouveau mot de passe.';

  @override
  String get newPassword => 'Nouveau mot de passe';

  @override
  String get resetPushInfo =>
      'Si tu es encore connecté quelque part, tu y recevras une notification avec un code. Tu n\'arrives pas à te connecter ? Connecte-toi avec Apple ou Google avec la même adresse e-mail - ton compte sera alors associé.';

  @override
  String get sendCode => 'Envoyer le code';

  @override
  String get savePassword => 'Enregistrer le mot de passe';

  @override
  String get errorTryAgain => 'Un problème est survenu. Réessaie.';

  @override
  String get back => 'Retour';

  @override
  String get name => 'Nom';

  @override
  String get email => 'Adresse e-mail';

  @override
  String get codeFromPush => 'Code de la notification';

  @override
  String get password => 'Mot de passe';

  @override
  String get hidePassword => 'Masquer le mot de passe';

  @override
  String get showPassword => 'Afficher le mot de passe';

  @override
  String get forgotPasswordLink => 'Mot de passe oublié ?';

  @override
  String get haveAccount => 'Tu as déjà un compte ?';

  @override
  String get newToCamTrip => 'Nouveau sur CamTrip ?';

  @override
  String get rememberedIt => 'Ça te revient ?';

  @override
  String get noCodeReceived => 'Pas reçu de code ?';

  @override
  String get resendCode => 'Renvoyer';

  @override
  String onboardingDemoRoll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count photographes, 1 pellicule',
      one: '1 photographe, 1 pellicule',
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
      other: '$count photos',
      one: '1 photo',
    );
    return '$_temp0';
  }

  @override
  String videosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count vidéos',
      one: '1 vidéo',
    );
    return '$_temp0';
  }

  @override
  String get justNow => 'maintenant';

  @override
  String get badgeNew => 'Nouveau';

  @override
  String recapTitle(String groupName) {
    return 'Récap $groupName';
  }

  @override
  String get styleFilm => 'Film';

  @override
  String get styleInstant => 'Instant';

  @override
  String get styleDisposable => 'Jetable';

  @override
  String get styleBw => 'N&B';

  @override
  String get styleGolden => 'Golden';

  @override
  String get styleChrome => 'Chrome';

  @override
  String get styleFilmDescription =>
      'Couleurs chaudes, grain et date orange incrustée';

  @override
  String get styleInstantDescription => 'Couleurs douces et bord blanc';

  @override
  String get styleDisposableDescription =>
      'Flash dur, vignettage et fuites de lumière';

  @override
  String get styleBwDescription =>
      'Noir et blanc granuleux au contraste profond';

  @override
  String get styleGoldenDescription =>
      'Toujours l\'heure dorée, une douce lueur dorée';

  @override
  String get styleChromeDescription => 'Froid, saturé et net, comme une diapo';

  @override
  String get shutterStopRecording => 'Arrêter l\'enregistrement';

  @override
  String get shutterStartRecording => 'Démarrer l\'enregistrement vidéo';

  @override
  String get shutterTakePhoto => 'Prendre une photo';

  @override
  String get modePhoto => 'Photo';

  @override
  String get modeVideo => 'Vidéo';

  @override
  String get cameraNotFound => 'Aucun appareil photo trouvé';

  @override
  String get cameraAccessNeeded =>
      'CamTrip a besoin d\'accéder à ton appareil photo. Active-le dans Réglages.';

  @override
  String get cameraStartFailed => 'L\'appareil photo n\'a pas pu démarrer';

  @override
  String get albumAccessNeeded =>
      'Autorise CamTrip à accéder à tes photos pour les enregistrer aussi dans ton album';

  @override
  String get albumSaveFailed =>
      'L\'enregistrement dans ton album a échoué. La photo est quand même partagée.';

  @override
  String styleProFallback(String style) {
    return 'Ce style fait partie de Pro. Dans ce groupe, tu photographies en $style.';
  }

  @override
  String get photoFailed => 'La photo n\'a pas fonctionné. Réessaie.';

  @override
  String get recordingFailed => 'L\'enregistrement vidéo a échoué';

  @override
  String get videoFailed => 'La vidéo n\'a pas fonctionné. Réessaie.';

  @override
  String get shootInGroup => 'Photographier dans le groupe';

  @override
  String get close => 'Fermer';

  @override
  String get flash => 'Flash';

  @override
  String get flashOn => 'Oui';

  @override
  String get flashOff => 'Non';

  @override
  String get flashAuto => 'Auto';

  @override
  String get chooseGroup => 'Choisir un groupe';

  @override
  String get switchCamera => 'Changer d\'objectif';

  @override
  String get createOrJoinFirst => 'Crée ou rejoins d\'abord un groupe';

  @override
  String get proViaGroup => 'Pro via le groupe';

  @override
  String proViaName(String name) {
    return 'Pro via $name';
  }

  @override
  String get proStylesFreeViaMember =>
      'Les styles Pro sont gratuits pour toi dans ce groupe grâce à un membre Pro';

  @override
  String proStylesFreeViaName(String name) {
    return 'Styles Pro dans ce groupe : gratuits pour toi grâce à $name';
  }

  @override
  String get subscriptionsUnavailable =>
      'Les abonnements ne sont pas disponibles pour le moment. Réessaie plus tard.';

  @override
  String get paymentPending =>
      'Ton paiement est en cours de traitement. Pro s\'active dès qu\'il est validé.';

  @override
  String get purchaseFailed => 'L\'achat a échoué. Réessaie plus tard.';

  @override
  String get restoreUnavailable =>
      'Impossible de restaurer les achats pour le moment. Réessaie plus tard.';

  @override
  String get restoreFailed => 'La restauration a échoué. Réessaie plus tard.';

  @override
  String get welcomePro => 'Bienvenue dans CamTrip Pro ! 🎉';

  @override
  String get proRestored => 'Pro a été restauré';

  @override
  String get noPurchaseFound => 'Aucun achat précédent trouvé';

  @override
  String periodDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count jours',
      one: '1 jour',
    );
    return '$_temp0';
  }

  @override
  String periodWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count semaines',
      one: '1 semaine',
    );
    return '$_temp0';
  }

  @override
  String periodMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mois',
      one: '1 mois',
    );
    return '$_temp0';
  }

  @override
  String periodYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ans',
      one: '1 an',
    );
    return '$_temp0';
  }

  @override
  String get paywallHavePro => 'Tu as CamTrip Pro';

  @override
  String get paywallSubtitle => 'Tout pour ton prochain voyage.';

  @override
  String paywallFeatureStyles(String styles) {
    return 'Tous les styles d\'appareil ($styles)';
  }

  @override
  String get paywallFeatureUnlimited =>
      'Membres et stockage illimités, photos conservées pour toujours';

  @override
  String get paywallFeatureNoWatermark => 'Récaps sans filigrane';

  @override
  String get paywallFeatureOriginal => 'Téléchargement en qualité d\'origine';

  @override
  String get planYear => 'Année';

  @override
  String get planMonth => 'Mois';

  @override
  String pricePerMonth(String price) {
    return '$price par mois';
  }

  @override
  String paywallSaveBadge(int percent) {
    return '-$percent %';
  }

  @override
  String get planMonthCancelAnytime => 'résiliable chaque mois';

  @override
  String tryFree(String period) {
    return 'Essayer $period gratuitement';
  }

  @override
  String get becomePro => 'Passer à Pro';

  @override
  String get subscriptionsLoadFailed =>
      'Impossible de charger les abonnements. Vérifie ta connexion.';

  @override
  String legalAnnual(String price) {
    return 'Abonnement annuel CamTrip Pro : $price par an.';
  }

  @override
  String legalAnnualTrial(String period, String price) {
    return 'Abonnement annuel CamTrip Pro : $period gratuit(s), puis $price par an.';
  }

  @override
  String legalMonthly(String price) {
    return 'Abonnement mensuel CamTrip Pro : $price par mois.';
  }

  @override
  String legalMonthlyTrial(String period, String price) {
    return 'Abonnement mensuel CamTrip Pro : $period gratuit(s), puis $price par mois.';
  }

  @override
  String get legalBillingApple =>
      'Le paiement est débité sur ton identifiant Apple. L\'abonnement se renouvelle automatiquement, sauf si tu le résilies au moins 24 heures avant la fin de la période. Tu peux le gérer et le résilier dans les réglages de ton compte App Store.';

  @override
  String get legalBillingGoogle =>
      'Le paiement est débité sur ton compte Google. L\'abonnement se renouvelle automatiquement, sauf si tu le résilies au moins 24 heures avant la fin de la période. Tu peux le gérer et le résilier dans les paramètres de ton compte Google Play.';

  @override
  String get restorePurchases => 'Restaurer les achats';

  @override
  String get terms => 'Conditions';

  @override
  String get privacy => 'Confidentialité';

  @override
  String get groupProTitle => 'Un Pro dans le groupe = Pro pour tout le groupe';

  @override
  String get groupProBody =>
      'Si une seule personne a Pro, tout le groupe profite de tous les styles d\'appareil, de membres illimités, de photos conservées, de la qualité d\'origine et de récaps sans filigrane.';

  @override
  String get groupCreated => 'Groupe créé ✓';

  @override
  String get inviteFriends => 'Invite tes amis';

  @override
  String get codeCopied => 'Code copié';

  @override
  String get shareLink => 'Partager le lien';

  @override
  String inviteSubject(String groupName) {
    return 'Rejoins $groupName sur CamTrip';
  }

  @override
  String inviteMembersUnlimited(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count membres',
      one: '1 membre',
    );
    return '$_temp0 · illimité (Pro)';
  }

  @override
  String inviteMembersLimit(int count, int limit) {
    return '$count membres sur $limit · Pro : illimité';
  }

  @override
  String get toCamera => 'Vers l\'appareil photo';

  @override
  String get done => 'OK';

  @override
  String get joinEnterCode => 'Saisis le code à 6 caractères';

  @override
  String get joinGroupTitle => 'Rejoindre un groupe';

  @override
  String get joinGroupSubtitle =>
      'Saisis le code de tes amis ou scanne leur QR code.';

  @override
  String get typeCode => 'Saisir le code';

  @override
  String get scanQr => 'Scanner le QR';

  @override
  String get join => 'Rejoindre';

  @override
  String get groupNameRequired => 'Donne un nom à ton groupe';

  @override
  String get newGroup => 'Nouveau groupe';

  @override
  String get groupType => 'Type de groupe';

  @override
  String get groupTypeVacation => 'Vacances';

  @override
  String get groupTypeVacationDescription =>
      'Avec dates de début et de fin, puis archivé';

  @override
  String get groupTypeEvent => 'Événement';

  @override
  String get groupTypeEventDescription =>
      'Une journée ou une soirée, par ex. une fête';

  @override
  String get groupTypePermanent => 'Toujours ouvert';

  @override
  String get groupTypePermanentDescription =>
      'Pour ta bande d\'amis habituelle';

  @override
  String get date => 'Date';

  @override
  String get departure => 'Départ';

  @override
  String get returnDate => 'Retour';

  @override
  String get defaultCameraStyle => 'Style d\'appareil par défaut';

  @override
  String freeLimitPermanent(int max) {
    return 'Gratuit : jusqu\'à $max membres. Illimité avec Pro.';
  }

  @override
  String freeLimitDated(int max, int days) {
    return 'Gratuit : jusqu\'à $max membres, photos conservées jusqu\'à $days jours après la date de fin. Illimité et pour toujours avec Pro.';
  }

  @override
  String get createGroup => 'Créer le groupe';

  @override
  String get group => 'Groupe';

  @override
  String groupCode(String code) {
    return 'code $code';
  }

  @override
  String get manage => 'Gestion';

  @override
  String get rename => 'Renommer';

  @override
  String get changeDates => 'Modifier les dates';

  @override
  String get finishTrip => 'Terminer le voyage';

  @override
  String get finishTripSubtitle => 'Met la date de fin à aujourd\'hui';

  @override
  String get reopenGroup => 'Rouvrir le groupe';

  @override
  String get closeGroup => 'Clôturer le groupe';

  @override
  String get reopenGroupSubtitle =>
      'Les membres peuvent de nouveau ajouter des photos';

  @override
  String get closeGroupSubtitle =>
      'Plus personne ne peut ajouter de photos ; tout reste visible';

  @override
  String get members => 'Membres';

  @override
  String memberYou(String name) {
    return '$name (toi)';
  }

  @override
  String get blockedTag => 'bloqué';

  @override
  String get adminTag => 'admin';

  @override
  String removeMemberTitle(String name) {
    return 'Retirer $name ?';
  }

  @override
  String get removeMemberMessage => 'Ses photos restent dans le groupe.';

  @override
  String get remove => 'Supprimer';

  @override
  String get removeMember => 'Retirer';

  @override
  String blockTitle(String name) {
    return 'Bloquer $name ?';
  }

  @override
  String blockMessage(String name) {
    return 'Tu ne verras plus les photos et vidéos de $name et tu ne recevras plus de notifications à leur sujet. Tu peux annuler ça dans Réglages.';
  }

  @override
  String get block => 'Bloquer';

  @override
  String get makeMember => 'Rendre membre simple';

  @override
  String get makeAdmin => 'Nommer admin';

  @override
  String get removeFromGroup => 'Retirer du groupe';

  @override
  String get unblock => 'Débloquer';

  @override
  String get inviteFriendsButton => 'Inviter des amis';

  @override
  String get you => 'Toi';

  @override
  String get unarchive => 'Sortir des archives';

  @override
  String get archive => 'Archiver';

  @override
  String get unarchiveSubtitle => 'Le groupe est de retour dans tes albums';

  @override
  String archiveSubtitle(String section) {
    return 'Juste pour toi : le groupe passe dans « $section » en bas de tes albums';
  }

  @override
  String get archivedSection => 'Archivés';

  @override
  String get hiddenPhotos => 'Photos masquées';

  @override
  String get hiddenPhotosSubtitle => 'Les photos que tu as masquées pour toi';

  @override
  String get leaveGroup => 'Quitter le groupe';

  @override
  String get leaveGroupSubtitle =>
      'Tes photos restent dans le groupe pour les autres';

  @override
  String get deleteGroup => 'Supprimer le groupe';

  @override
  String get deleteGroupSubtitle =>
      'Toutes les photos sont supprimées pour tout le monde';

  @override
  String groupArchived(String groupName) {
    return '« $groupName » archivé';
  }

  @override
  String groupUnarchived(String groupName) {
    return '« $groupName » est de retour dans tes albums';
  }

  @override
  String get undo => 'Annuler';

  @override
  String get groupNameTitle => 'Nom du groupe';

  @override
  String get finishTripTitle => 'Terminer le voyage ?';

  @override
  String get finishTripMessage =>
      'La date de fin devient aujourd\'hui. Tu peux toujours ajouter des photos ; le récap est prêt.';

  @override
  String get finishTripConfirm => 'Terminer';

  @override
  String get tripFinished => 'Voyage terminé';

  @override
  String leaveGroupTitle(String groupName) {
    return 'Quitter « $groupName » ?';
  }

  @override
  String get leaveGroupMessage =>
      'Tes photos restent dans le groupe pour les autres. Tu pourras revenir plus tard avec le code.';

  @override
  String get leave => 'Quitter';

  @override
  String groupDeleted(String groupName) {
    return '« $groupName » a été supprimé';
  }

  @override
  String get youAreAdmin => 'tu es admin';

  @override
  String get open => 'Ouvrir';

  @override
  String get archiveMenuSubtitle =>
      'Juste pour toi, les autres ne remarquent rien';

  @override
  String get deleteGroupMenuSubtitle =>
      'Pour tout le monde, avec toutes les photos';

  @override
  String get deleteGroupTitle => 'Supprimer le groupe ?';

  @override
  String deleteGroupMessage(int count, String groupName, int memberCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Les $count photos et vidéos',
      one: 'La photo ou vidéo',
    );
    String _temp1 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'disparaîtront',
      one: 'disparaîtra',
    );
    String _temp2 = intl.Intl.pluralLogic(
      memberCount,
      locale: localeName,
      other: 'les $memberCount membres',
      one: 'le seul membre',
    );
    return '$_temp0 de « $groupName » $_temp1 pour $_temp2. Cette action est irréversible.';
  }

  @override
  String get deleteGroupOwnRoll => 'Ta propre pellicule reste inchangée.';

  @override
  String get deleteGroupTypeName => 'Saisis le nom du groupe pour confirmer :';

  @override
  String get deleteForEveryone => 'Supprimer pour tous';

  @override
  String get save => 'Enregistrer';

  @override
  String get yourAlbums => 'Tes albums';

  @override
  String get uploadQueue => 'File d\'envoi';

  @override
  String get noConnection => 'Pas de connexion';

  @override
  String get albumsOfflineMessage =>
      'Tes albums se chargeront dès que tu auras de nouveau internet. L\'appareil photo fonctionne quand même.';

  @override
  String get retry => 'Réessayer';

  @override
  String get noAlbumsTitle => 'Pas encore d\'albums';

  @override
  String get noAlbumsMessage =>
      'Crée un groupe pour ton prochain voyage, ou rejoins celui d\'un ami avec son code.';

  @override
  String get haveCode => 'J\'ai un code';

  @override
  String get joinWithCode => 'Rejoindre avec un code ou un QR code';

  @override
  String get camera => 'Appareil photo';

  @override
  String get restore => 'Restaurer';

  @override
  String get more => 'Plus';

  @override
  String get newAlbum => 'Nouveau';

  @override
  String get closedTag => 'clôturé';

  @override
  String get activeTag => 'actif';

  @override
  String get uploadFailed => 'Échec de l\'envoi';

  @override
  String get queueNoSignal => 'Pas de réseau.';

  @override
  String get queueNoSignalMessage =>
      'Tes photos sont déjà dans ton album et seront partagées dès que tu auras de nouveau internet.';

  @override
  String get queueWaitingForWifi => 'En attente du Wi-Fi.';

  @override
  String queueWifiOnlyOn(String setting) {
    return 'Tu as activé « $setting ».';
  }

  @override
  String get queueVideosWifiOnly => 'Les vidéos ne sont envoyées qu\'en Wi-Fi.';

  @override
  String get queueAllShared => 'Tout est partagé ✓';

  @override
  String queuePending(String items) {
    return '$items encore à partager';
  }

  @override
  String queuePendingBoth(String photos, String videos) {
    return '$photos et $videos encore à partager';
  }

  @override
  String get retryUpload => 'Réessayer';

  @override
  String get removeFromQueue => 'Retirer de la file';

  @override
  String get queueStatusWifi => 'Wi-Fi';

  @override
  String get queueStatusWaiting => 'en attente';

  @override
  String get videosWifiOnlyTitle => 'Vidéos en Wi-Fi uniquement';

  @override
  String get videosWifiOnlySubtitle => 'Économise tes données mobiles';

  @override
  String get retryNow => 'Réessayer maintenant';

  @override
  String get yourName => 'Ton nom';

  @override
  String get settings => 'Réglages';

  @override
  String get tapToChangeName => 'Touche pour changer ton nom';

  @override
  String get getCamTripPro => 'Passer à CamTrip Pro';

  @override
  String get photos => 'Photos';

  @override
  String get saveOwnPhotos => 'Enregistrer mes photos dans un album par groupe';

  @override
  String get autoSaveOthers =>
      'Enregistrer automatiquement les photos des autres';

  @override
  String get wifiOnlyTitle => 'Envoyer en Wi-Fi uniquement';

  @override
  String get dateStamp => 'Date incrustée';

  @override
  String get notifications => 'Notifications';

  @override
  String get notifyNewPhotos => 'Nouvelles photos (groupées)';

  @override
  String get notifyRecapReady => 'Récap prêt';

  @override
  String get camTripTeam => 'Équipe CamTrip';

  @override
  String get adminEntrySubtitle =>
      'Utilisateurs, offrir Pro, signalements et chiffres';

  @override
  String get account => 'Compte';

  @override
  String get manageSubscription => 'Gérer l\'abonnement';

  @override
  String get blockedPeople => 'Personnes bloquées';

  @override
  String get nobody => 'Personne';

  @override
  String peopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count personnes',
      one: '1 personne',
    );
    return '$_temp0';
  }

  @override
  String get privacyPolicy => 'Politique de confidentialité';

  @override
  String get contact => 'Contact';

  @override
  String get signOut => 'Se déconnecter';

  @override
  String get deleteAccount => 'Supprimer le compte';

  @override
  String get deleteAccountSubtitle =>
      'Supprime ton compte et toutes tes photos';

  @override
  String get deleteAccountTitle => 'Supprimer le compte ?';

  @override
  String get deleteAccountMessage =>
      'Ton compte et toutes tes photos et vidéos seront supprimés, y compris dans les groupes. Un abonnement en cours se résilie dans l\'App Store ou Google Play.';

  @override
  String get blockedTitle => 'Bloqués';

  @override
  String get blockedSubtitle => 'Tu ne vois pas les photos de ces personnes.';

  @override
  String get blockedNone => 'Tu n\'as bloqué personne.';

  @override
  String get unblockShort => 'Débloquer';

  @override
  String get groupGone =>
      'Ce groupe n\'existe plus, ou tu n\'en es plus membre.';

  @override
  String photosSavedToAlbum(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count photos enregistrées dans « $album »',
      one: '1 photo enregistrée dans « $album »',
    );
    return '$_temp0';
  }

  @override
  String photosDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count photos supprimées',
      one: '1 photo supprimée',
    );
    return '$_temp0';
  }

  @override
  String photosDeletedSkipped(int count, int skipped) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count photos supprimées',
      one: '1 photo supprimée',
    );
    return '$_temp0, $skipped ignorée(s)';
  }

  @override
  String photosHiddenForYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count photos masquées pour toi',
      one: '1 photo masquée pour toi',
    );
    return '$_temp0';
  }

  @override
  String get addedToFavorites => 'Ajoutée aux favoris';

  @override
  String get removedFromFavorites => 'Retirée des favoris';

  @override
  String get photoAccessSettings =>
      'Autorise CamTrip à accéder à tes photos dans Réglages';

  @override
  String photosBeingAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count photos en cours d\'ajout',
      one: '1 photo en cours d\'ajout',
    );
    return '$_temp0';
  }

  @override
  String photosUnreadable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count photos n\'ont pas pu être lues',
      one: '1 photo n\'a pas pu être lue',
    );
    return '$_temp0';
  }

  @override
  String get groupNotLoaded => 'Groupe non chargé';

  @override
  String get noFavoritesTitle => 'Pas encore de favoris';

  @override
  String get noPhotosTitle => 'Pas encore de photos';

  @override
  String get noFavoritesMessage =>
      'Touche l\'étoile d\'une photo pour la retrouver ici.';

  @override
  String get noPhotosMessage =>
      'Prends la première photo. Tout le groupe la voit aussitôt.';

  @override
  String get openCamera => 'Ouvrir l\'appareil photo';

  @override
  String savingProgress(int done, int total) {
    return 'Enregistrement... $done/$total';
  }

  @override
  String get sharePreparing => 'Préparation...';

  @override
  String sharingProgress(int done, int total) {
    return 'Préparation... $done/$total';
  }

  @override
  String get choosePhotos => 'Choisir des photos';

  @override
  String selectedCount(int count) {
    return '$count sélectionnée(s)';
  }

  @override
  String get selectNone => 'Tout désélectionner';

  @override
  String get selectAll => 'Tout sélectionner';

  @override
  String photosWaitingToShare(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count photos en attente de partage',
      one: '1 photo en attente de partage',
    );
    return '$_temp0';
  }

  @override
  String get recapReadyTitle => 'Ton récap est prêt';

  @override
  String get recapReadySubtitle => 'Une vidéo en musique de votre voyage';

  @override
  String get watch => 'Voir';

  @override
  String get makeRecapNow => 'Créer une vidéo récap maintenant';

  @override
  String freeGroupDeleteNotice(String date) {
    return 'Groupe gratuit : photos conservées jusqu\'au $date. Enregistre-les ou passe à Pro.';
  }

  @override
  String get filterAll => 'Toutes';

  @override
  String get filterFavorites => 'Favoris';

  @override
  String get filterPerPerson => 'Par personne';

  @override
  String get filterPerson => 'Personne';

  @override
  String get select => 'Sélectionner';

  @override
  String get hiddenFilter => 'Masquées';

  @override
  String get photosBy => 'Photos de...';

  @override
  String get uploadedTag => 'importée';

  @override
  String get saveAll => 'Tout enregistrer';

  @override
  String get favorite => 'Favori';

  @override
  String get unfavorite => 'Retirer favori';

  @override
  String get hide => 'Masquer';

  @override
  String get delete => 'Supprimer';

  @override
  String deletePhotosTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Supprimer $count photos ?',
      one: 'Supprimer la photo ?',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Elles disparaîtront pour tout le groupe. Cette action est irréversible.',
      one:
          'Elle disparaîtra pour tout le groupe. Cette action est irréversible.',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosNotAllowed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count photos appartiennent à quelqu\'un d\'autre. Elles restent ; seul un admin peut les supprimer.',
      one:
          '1 photo appartient à quelqu\'un d\'autre. Elle reste ; seul un admin peut la supprimer.',
    );
    return '$_temp0';
  }

  @override
  String photosBackInGroup(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count photos sont de retour dans le groupe',
      one: '1 photo est de retour dans le groupe',
    );
    return '$_temp0';
  }

  @override
  String get showAll => 'Tout afficher';

  @override
  String get hiddenPhotosExplainer =>
      'Toi seul ne vois plus ces photos. Pour les autres membres du groupe, elles sont toujours là.';

  @override
  String get nothingHidden => 'Rien de masqué';

  @override
  String get nothingHiddenMessage =>
      'Les photos que tu masques apparaissent ici.';

  @override
  String showAgainCount(int count) {
    return 'Réafficher ($count)';
  }

  @override
  String get someone => 'Quelqu\'un';

  @override
  String get savedToAlbum => 'Enregistrée dans ton album photo';

  @override
  String get share => 'Partager';

  @override
  String get shareFailed => 'Le partage a échoué';

  @override
  String get reportTitle => 'Pourquoi signales-tu cette photo ?';

  @override
  String get reportSubtitle =>
      'On examine chaque signalement sous 24 heures. La photo est masquée pour toi immédiatement.';

  @override
  String get reportThanks => 'Merci, on va regarder ça';

  @override
  String blockMessageAllGroups(String name) {
    return 'Tu ne verras plus les photos et vidéos de $name, dans aucun groupe, et tu ne recevras plus de notifications à leur sujet. Tu peux annuler ça dans Réglages.';
  }

  @override
  String userBlocked(String name) {
    return '$name a été bloqué';
  }

  @override
  String get videoHiddenForYou => 'Vidéo masquée pour toi';

  @override
  String get photoHiddenForYou => 'Photo masquée pour toi';

  @override
  String get setAsCover => 'Définir comme couverture';

  @override
  String get coverUpdated => 'Photo de couverture modifiée';

  @override
  String get hideForMe => 'Masquer pour moi';

  @override
  String get hideForMeSubtitle =>
      'Les autres membres du groupe la voient toujours';

  @override
  String get reportPhoto => 'Signaler la photo';

  @override
  String blockName(String name) {
    return 'Bloquer $name';
  }

  @override
  String get forEveryoneInGroup => 'Pour tout le groupe';

  @override
  String get videoDeleted => 'Vidéo supprimée';

  @override
  String get photoDeleted => 'Photo supprimée';

  @override
  String get photoAccessToSave =>
      'Autorise CamTrip à accéder à tes photos dans Réglages pour enregistrer';

  @override
  String get phoneFull => 'Ton téléphone est plein';

  @override
  String get albumSaveFailedShort =>
      'L\'enregistrement dans ton album a échoué';

  @override
  String get recapTemplateGoldenHour => 'Golden Hour';

  @override
  String get recapTemplateFast => 'Rapide';

  @override
  String get recapTemplateFilmRoll => 'Pellicule';

  @override
  String get recapTemplatePolaroid => 'Polaroid';

  @override
  String get trackSummerEvening => 'Soir d\'été';

  @override
  String get trackGoldenHour => 'Golden Hour';

  @override
  String get trackRoadtrip => 'Road trip';

  @override
  String get moodWarm => 'chaleureux';

  @override
  String get moodCheerful => 'joyeux';

  @override
  String friendsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count amis',
      one: '1 ami',
    );
    return '$_temp0';
  }

  @override
  String get madeWithCamTrip => 'Créé avec CamTrip';

  @override
  String get tagline => 'Une pellicule pour tout le groupe';

  @override
  String get videoUnsupportedDevice =>
      'Impossible de créer la vidéo sur cet appareil';

  @override
  String get groupLoadFailed => 'Impossible de charger ce groupe.';

  @override
  String recapNeedsPhotos(int count) {
    return 'Il te faut au moins $count photos pour un récap.';
  }

  @override
  String get recapFailed => 'Le récap n\'a pas fonctionné. Réessaie.';

  @override
  String get recapSaved => 'Récap enregistré dans ton album photo';

  @override
  String get recap => 'Récap';

  @override
  String get recapRendering => 'Création du récap...';

  @override
  String get videoRendering => 'Création de la vidéo...';

  @override
  String get template => 'Modèle';

  @override
  String get musicLicense => 'Musique originale CamTrip · libre de droits';

  @override
  String get change => 'Changer';

  @override
  String get noWatermark => 'Sans filigrane ✓';

  @override
  String get removeWatermarkPro => 'Retirer le filigrane avec Pro';

  @override
  String get proSourceSubscription => 'Abonnement';

  @override
  String get proSourceGift => 'Cadeau';

  @override
  String get proSourceAdmin => 'Admin';

  @override
  String get proSourceGroup => 'Via le groupe';

  @override
  String get noPro => 'Pas de Pro';

  @override
  String proStatusNoEnd(String source) {
    return 'Pro ($source), sans date de fin';
  }

  @override
  String proStatusUntil(String source, String date) {
    return 'Pro ($source), jusqu\'au $date';
  }

  @override
  String get lifetime => 'À vie';

  @override
  String get pickDate => 'Choisir une date';

  @override
  String get noAccess => 'Accès refusé';

  @override
  String get adminOnlyTeam => 'La gestion est réservée à l\'équipe CamTrip.';

  @override
  String get adminOverview => 'Aperçu';

  @override
  String get adminUsers => 'Utilisateurs';

  @override
  String get adminReports => 'Signalements';

  @override
  String adminsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count admins',
      one: '1 admin',
    );
    return '$_temp0';
  }

  @override
  String get adminNewThisWeek => 'Nouveaux cette semaine';

  @override
  String get adminGroups => 'Groupes';

  @override
  String get adminProSubscription => 'Pro par abonnement';

  @override
  String get adminProGift => 'Pro offert';

  @override
  String adminWithoutSubscription(int count) {
    return '$count sans abonnement';
  }

  @override
  String get adminOpenReports => 'Signalements ouverts';

  @override
  String get adminSearchHint => 'Rechercher par nom ou e-mail';

  @override
  String get nobodyFound => 'Personne trouvé';

  @override
  String get loadMore => 'Charger plus';

  @override
  String get noEmail => 'Pas d\'e-mail';

  @override
  String adminDeletePhotoMessage(String groupName) {
    return 'La photo disparaît pour tout le monde dans « $groupName ». Tous les signalements sur cette photo sont traités.';
  }

  @override
  String get adminBanMessage =>
      'Ce compte ne peut plus se connecter ni utiliser l\'app. Tu peux annuler ça plus tard.';

  @override
  String get adminDismissTitle => 'Ignorer le signalement ?';

  @override
  String get adminDismissMessage =>
      'La photo reste. Le signalement est marqué comme traité.';

  @override
  String get adminDismiss => 'Ignorer';

  @override
  String get adminAccountBlocked => 'Compte bloqué';

  @override
  String get adminReportDismissed => 'Signalement ignoré';

  @override
  String get adminNoReports => 'Aucun signalement ouvert';

  @override
  String get adminNoReportsMessage => 'Les photos signalées apparaissent ici.';

  @override
  String get deletedTag => 'Supprimée';

  @override
  String adminReportedBy(String name) {
    return 'Par $name';
  }

  @override
  String adminPhotoBy(String name) {
    return 'Photo de $name';
  }

  @override
  String reportsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count signalements',
      one: '1 signalement',
    );
    return '$_temp0';
  }

  @override
  String get adminDeletePhoto => 'Supprimer la photo';

  @override
  String get adminBlockCreator => 'Bloquer l\'auteur';

  @override
  String get loadFailed => 'Le chargement a échoué';

  @override
  String get adminLifetimeProGiven => 'Pro à vie offert';

  @override
  String get adminProGiven => 'Pro offert';

  @override
  String adminGiveProUntil(String date) {
    return 'Offrir Pro jusqu\'au $date';
  }

  @override
  String get adminGiveProLifetime => 'Offrir Pro à vie';

  @override
  String adminGiveProFor(String period) {
    return 'Offrir Pro pour $period';
  }

  @override
  String get adminReasonHint => 'Raison, par ex. ami, testeur, influenceur';

  @override
  String get adminGivePro => 'Offrir Pro';

  @override
  String get adminRevokeTitle => 'Retirer le cadeau ?';

  @override
  String get adminRevokeMessage =>
      'Le Pro offert s\'arrête immédiatement. Un abonnement personnel continue normalement.';

  @override
  String get adminRevoke => 'Retirer';

  @override
  String get adminGiftRevoked => 'Cadeau retiré';

  @override
  String get adminUnbanTitle => 'Lever le blocage ?';

  @override
  String adminUnbanMessage(String name) {
    return '$name pourra de nouveau se connecter.';
  }

  @override
  String get adminUnbanned => 'Blocage levé';

  @override
  String get adminBanUserMessage =>
      'Ce compte ne peut plus se connecter ni utiliser l\'app. Les photos restent.';

  @override
  String get adminUser => 'Utilisateur';

  @override
  String get adminNotVerified => 'non vérifiée';

  @override
  String get adminRole => 'Rôle';

  @override
  String get adminCreated => 'Créé le';

  @override
  String get unknown => 'Inconnu';

  @override
  String get adminSignInWith => 'Connexion avec';

  @override
  String get adminEmailMethod => 'E-mail';

  @override
  String get adminPhotosAndVideos => 'Photos et vidéos';

  @override
  String get adminStatus => 'Statut';

  @override
  String get adminActive => 'Actif';

  @override
  String adminActiveUntil(String date) {
    return 'Actif jusqu\'au $date';
  }

  @override
  String adminGiftFrom(String name) {
    return 'Cadeau de $name';
  }

  @override
  String adminExpiredOn(String date) {
    return 'Expiré le $date';
  }

  @override
  String get adminExpired => 'Expiré';

  @override
  String adminUntil(String date) {
    return 'Jusqu\'au $date';
  }

  @override
  String get adminGiveProTitle => 'Offrir Pro';

  @override
  String get adminGiveProNote =>
      'Vaut aussi pour les groupes de cette personne : un Pro dans le groupe = Pro pour tout le groupe.';

  @override
  String get adminRevokeGift => 'Retirer le cadeau';

  @override
  String get adminModeration => 'Modération';

  @override
  String get adminCannotBanSelf => 'Tu ne peux pas te bloquer toi-même.';

  @override
  String get adminCannotBanAdmin => 'Un admin ne peut pas être bloqué.';

  @override
  String get adminUnban => 'Lever le blocage';

  @override
  String get adminBanAccount => 'Bloquer le compte';

  @override
  String get googleSignInUnavailable =>
      'La connexion avec Google n\'est pas encore disponible';

  @override
  String get cameraPickerTitle => 'Choisis ton appareil';

  @override
  String get cameraPickerSubtitle =>
      'Chaque appareil donne à tes photos son propre style';

  @override
  String get cameraPickerChange => 'Changer d\'appareil';

  @override
  String get cameraPickerUnlock => 'Débloquer avec Pro';

  @override
  String get cameraPickerSelected => 'Sélectionné';

  @override
  String get cameraPickerStyleSummer => 'Été';

  @override
  String get cameraPickerStyleSummerDescription =>
      'Couleurs chaudes et passées d\'un cliché des années 90';

  @override
  String get cameraPickerStyleNight => 'Nuit 800';

  @override
  String get cameraPickerStyleNightDescription =>
      'Pellicule cinéma : ombres bleu-vert, lumière chaude, beaucoup de grain';

  @override
  String get cameraPickerStyleSepia => 'Sépia';

  @override
  String get cameraPickerStyleSepiaDescription =>
      'Un vieux tirage brun sorti d\'une boîte à chaussures';

  @override
  String get cameraPickerStyleLomo => 'Lomo';

  @override
  String get cameraPickerStyleLomoDescription =>
      'Couleurs vives, coins sombres et une dominante folle';

  @override
  String get cameraPickerStyleMint => 'Menthe';

  @override
  String get cameraPickerStyleMintDescription =>
      'Doux et frais avec une teinte verte';

  @override
  String get cameraPickerStylePastel => 'Rose';

  @override
  String get cameraPickerStylePastelDescription =>
      'Couleurs pastel, lueur rose et bord blanc';

  @override
  String get cameraPickerStyleSuper8 => 'Super 8';

  @override
  String get cameraPickerStyleSuper8Description =>
      'Granuleux et doux, comme un vieux film de famille';

  @override
  String get paywallBenefitGroup => 'Un Pro = Pro pour tout le groupe';

  @override
  String get paywallBenefitUnlimited => 'Membres illimités, photos conservées';

  @override
  String get paywallBenefitQuality => 'Sans filigrane, qualité d\'origine';

  @override
  String paywallFreeTrial(String period) {
    return 'Essai gratuit $period';
  }

  @override
  String paywallPriceYear(String price) {
    return '$price par an.';
  }

  @override
  String paywallPriceYearTrial(String period, String price) {
    return 'Essai gratuit de $period, puis $price par an.';
  }

  @override
  String paywallPriceMonth(String price) {
    return '$price par mois.';
  }

  @override
  String paywallPriceMonthTrial(String period, String price) {
    return 'Essai gratuit de $period, puis $price par mois.';
  }

  @override
  String paywallAutoRenew(String store) {
    return 'Renouvellement automatique. Résilie au moins 24 heures avant le renouvellement dans $store.';
  }

  @override
  String get paywallDetailsTitle => 'Tout ce qu\'offre Pro';

  @override
  String get paywallBenefitStyles => 'Tous les styles d\'appareil';

  @override
  String get allPhotosTitle => 'Toutes les photos';

  @override
  String get homeTabAlbums => 'Albums';

  @override
  String get allPhotosEmptyTitle => 'Pas encore de photos';

  @override
  String get allPhotosEmptyMessage =>
      'Ouvre l\'appareil photo et prends ta première photo.';

  @override
  String get allPhotosLoadFailed => 'Impossible de charger tes photos';

  @override
  String get cameraSettingsTitle => 'Réglages de l\'appareil photo';

  @override
  String get cameraSettingsMore => 'Plus de réglages';

  @override
  String get cameraSettingsGrid => 'Grille';

  @override
  String get cameraSettingsHaptics => 'Vibrer à la prise';

  @override
  String get cameraSettingsDateStamp => 'Date en bas à droite';

  @override
  String get cameraSettingsSound => 'Son de l\'obturateur';

  @override
  String get cameraSettingsSoundHint =>
      'Muet quand ton téléphone est en silencieux';

  @override
  String get cameraSettingsTimer => 'Retardateur';

  @override
  String get cameraSettingsTimerOff => 'Non';

  @override
  String cameraSettingsTimerSeconds(int seconds) {
    return '$seconds s';
  }

  @override
  String get cameraSettingsTimerCancelHint =>
      'Touche le déclencheur pour annuler';

  @override
  String get cameraSettingsMirror => 'Selfies en miroir';

  @override
  String get cameraSettingsSaveToRoll => 'Enregistrer dans la pellicule';

  @override
  String get cameraSettingsQuality => 'Qualité';

  @override
  String get cameraSettingsQualityStandard => 'Standard';

  @override
  String get cameraSettingsQualityHigh => 'Haute';

  @override
  String get cameraLowLightHint => 'Peu de lumière - active le flash';

  @override
  String get cameraFlashUnavailable => 'Cet appareil n\'a pas de flash';

  @override
  String get cameraFlashScreen => 'Flash écran';

  @override
  String get cameraFlashCycleHint => 'Touche pour passer de non à oui à auto';

  @override
  String get cameraFlip => 'Basculer entre caméra avant et arrière';

  @override
  String get cameraFlipHint =>
      'Touche deux fois le viseur pour retourner la caméra';

  @override
  String cameraPickerPaywallStyles(int count, String styles) {
    return 'Les $count appareils, dont $styles';
  }

  @override
  String get styleFlash => 'Flash 400';

  @override
  String get styleFlashDescription =>
      'Flash direct sur pellicule chaude : teinte ambrée, grain, rouges intenses';
}
