// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get cancel => 'Annulla';

  @override
  String get yes => 'Sì';

  @override
  String inviteMessageIntro(String groupName) {
    return 'Ti unisci a \"$groupName\" su CamTrip? Così vediamo subito le foto di tutti.';
  }

  @override
  String inviteMessageCode(String code) {
    return 'Oppure inserisci il codice: $code';
  }

  @override
  String get memberFallbackName => 'Amico';

  @override
  String get reportReasonInappropriate => 'Inappropriato od offensivo';

  @override
  String get reportReasonSpam => 'Spam';

  @override
  String get reportReasonOther => 'Altro';

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
  String get errorOffline => 'Nessuna connessione. Riprova tra poco.';

  @override
  String errorSomethingWrongStatus(int status) {
    return 'Qualcosa è andato storto ($status)';
  }

  @override
  String get errorSomethingWrong => 'Qualcosa è andato storto';

  @override
  String get apiInvalidCredentials =>
      'Indirizzo e-mail o password non corretti';

  @override
  String get apiInvalidCode =>
      'Questo codice non è corretto o è scaduto. Richiedi un nuovo codice.';

  @override
  String get apiEmailTaken =>
      'Esiste già un account con questo indirizzo e-mail. Accedi oppure scegli \"Password dimenticata?\".';

  @override
  String apiEmailTakenProvider(String provider) {
    return 'Esiste già un account con questo indirizzo e-mail. Accedi con $provider.';
  }

  @override
  String apiWeakPassword(int min) {
    return 'Scegli una password di almeno $min caratteri';
  }

  @override
  String apiNameTooLong(int max) {
    return 'Il tuo nome può avere al massimo $max caratteri';
  }

  @override
  String get apiRateLimited =>
      'Troppi tentativi. Riprova tra un quarto d\'ora.';

  @override
  String apiAccountBanned(String email) {
    return 'Il tuo account è stato bloccato. Scrivi a $email se pensi che sia un errore.';
  }

  @override
  String get apiProRequired =>
      'Questo stile della fotocamera fa parte di CamTrip Pro';

  @override
  String get apiGroupClosed => 'Questo gruppo è stato chiuso';

  @override
  String get apiGroupCodeNotFound => 'Nessun gruppo trovato con questo codice';

  @override
  String apiGroupFull(int max) {
    return 'Questo gruppo è pieno (max. $max membri). Se un membro ha CamTrip Pro, possono unirsi persone senza limiti.';
  }

  @override
  String get apiLastMember => 'Sei l\'ultimo membro. Elimina invece il gruppo.';

  @override
  String get apiAdminRequired => 'Solo per gli amministratori di CamTrip';

  @override
  String get apiUploadIncomplete => 'Il caricamento non è completo';

  @override
  String get apiInvalidInput => 'Dati non validi';

  @override
  String get apiNotSignedIn => 'Accesso non effettuato';

  @override
  String get apiAccountGone => 'Questo account non esiste più';

  @override
  String get apiPhotoNotFound => 'Foto non trovata';

  @override
  String get apiGroupNotFound => 'Gruppo non trovato';

  @override
  String get apiMemberNotFound => 'Membro non trovato';

  @override
  String get apiPersonNotFound => 'Persona non trovata';

  @override
  String get apiUserNotFound => 'Utente non trovato';

  @override
  String get apiAdminOnly => 'Solo un admin può farlo';

  @override
  String get apiCannotBlockSelf => 'Non puoi bloccare te stesso';

  @override
  String get apiCannotReportOwn => 'Non puoi segnalare una tua foto';

  @override
  String get apiDeleteOwnOnly => 'Puoi eliminare solo le tue foto';

  @override
  String get apiOwnerCannotBeRemoved =>
      'Chi ha creato il gruppo non può essere rimosso';

  @override
  String get apiOwnerStaysAdmin => 'Chi ha creato il gruppo resta admin';

  @override
  String get apiNeedsOneAdmin => 'Un gruppo ha bisogno di almeno un admin';

  @override
  String get apiEndBeforeStart =>
      'La data di fine è prima della data di inizio';

  @override
  String get apiPermanentNoEndDate =>
      'Un gruppo sempre aperto non ha una data di fine';

  @override
  String get apiCannotBanAdmin => 'Un amministratore non può essere bloccato';

  @override
  String get apiReportNotFound => 'Segnalazione non trovata';

  @override
  String get apiPhotoOwnerUnknown =>
      'Non si sa più chi ha scattato questa foto';

  @override
  String get validationNameRequired => 'Inserisci il tuo nome';

  @override
  String validationMaxChars(int max) {
    return 'Massimo $max caratteri';
  }

  @override
  String get validationEmailRequired => 'Inserisci il tuo indirizzo e-mail';

  @override
  String get validationEmailInvalid => 'Questo indirizzo e-mail non è valido';

  @override
  String get validationPasswordRequired => 'Scegli una password';

  @override
  String validationMinChars(int min) {
    return 'Almeno $min caratteri';
  }

  @override
  String get validationPasswordTooLong => 'Questa password è troppo lunga';

  @override
  String get validationPasswordEmpty => 'Inserisci la password';

  @override
  String get validationCodeRequired =>
      'Inserisci il codice ricevuto via e-mail';

  @override
  String get validationCodeDigits => 'Il codice ha 6 cifre';

  @override
  String get onboarding1Title => 'Un rullino\nper tutto il gruppo.';

  @override
  String get onboarding1Body =>
      'Scatta con una fotocamera retrò. Tutti vedono subito le tue foto, che finiscono anche nel tuo album.';

  @override
  String get onboarding2Title => 'Basta inoltrare\nfoto a tutti.';

  @override
  String get onboarding2Body =>
      'Crea un gruppo, condividi il codice, fatto. Mai più \"mi mandi quelle foto?\"';

  @override
  String get onboarding3Title => 'Alla fine, un\nvideo recap.';

  @override
  String get onboarding3Body =>
      'CamTrip crea un video con musica dei vostri momenti più belli.';

  @override
  String get onboardingInvited => 'Sei stato invitato! Accedi per partecipare.';

  @override
  String get signInAppleFailed => 'Accesso con Apple non riuscito';

  @override
  String get signInGoogleFailed => 'Accesso con Google non riuscito';

  @override
  String get signInFailed => 'Accesso non riuscito';

  @override
  String get next => 'Avanti';

  @override
  String get legalPrefix => 'Continuando accetti i ';

  @override
  String get legalTerms => 'termini';

  @override
  String get legalAnd => ' e l\'';

  @override
  String get legalPrivacy => 'informativa sulla privacy';

  @override
  String get legalSuffix => '.';

  @override
  String get continueWithApple => 'Continua con Apple';

  @override
  String get continueWithGoogle => 'Continua con Google';

  @override
  String get createAccount => 'Crea account';

  @override
  String get signIn => 'Accedi';

  @override
  String get or => 'oppure';

  @override
  String get registerSubtitle => 'Così i tuoi amici vedono chi scatta le foto.';

  @override
  String get loginSubtitle => 'Bentornato.';

  @override
  String get forgotPasswordTitle => 'Password dimenticata';

  @override
  String get forgotPasswordPushSubtitle =>
      'Hai ancora l\'accesso attivo da qualche parte? Ti mandiamo lì un codice di 6 cifre con una notifica per impostare una nuova password.';

  @override
  String get newPassword => 'Nuova password';

  @override
  String get resetPushInfo =>
      'Se hai ancora l\'accesso attivo da qualche parte, lì riceverai una notifica con un codice. Non riesci ad accedere? Accedi con Apple o Google con lo stesso indirizzo e-mail - il tuo account verrà collegato.';

  @override
  String get sendCode => 'Invia codice';

  @override
  String get savePassword => 'Salva password';

  @override
  String get errorTryAgain => 'Qualcosa è andato storto. Riprova.';

  @override
  String get back => 'Indietro';

  @override
  String get name => 'Nome';

  @override
  String get email => 'Indirizzo e-mail';

  @override
  String get codeFromPush => 'Codice dalla notifica';

  @override
  String get password => 'Password';

  @override
  String get hidePassword => 'Nascondi password';

  @override
  String get showPassword => 'Mostra password';

  @override
  String get forgotPasswordLink => 'Password dimenticata?';

  @override
  String get haveAccount => 'Hai già un account?';

  @override
  String get newToCamTrip => 'Nuovo su CamTrip?';

  @override
  String get rememberedIt => 'Te la ricordi?';

  @override
  String get noCodeReceived => 'Non hai ricevuto il codice?';

  @override
  String get resendCode => 'Invia di nuovo';

  @override
  String onboardingDemoRoll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotografi, 1 rullino',
      one: '1 fotografo, 1 rullino',
    );
    return '$_temp0';
  }

  @override
  String membersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count membri',
      one: '1 membro',
    );
    return '$_temp0';
  }

  @override
  String photosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto',
      one: '1 foto',
    );
    return '$_temp0';
  }

  @override
  String videosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count video',
      one: '1 video',
    );
    return '$_temp0';
  }

  @override
  String get justNow => 'ora';

  @override
  String get badgeNew => 'Nuova';

  @override
  String recapTitle(String groupName) {
    return 'Recap $groupName';
  }

  @override
  String get styleFilm => 'Film';

  @override
  String get styleInstant => 'Instant';

  @override
  String get styleDisposable => 'Usa e getta';

  @override
  String get styleBw => 'B/N';

  @override
  String get styleGolden => 'Golden';

  @override
  String get styleChrome => 'Chrome';

  @override
  String get styleFilmDescription =>
      'Colori caldi, grana e data arancione impressa';

  @override
  String get styleInstantDescription => 'Colori morbidi e una cornice bianca';

  @override
  String get styleDisposableDescription =>
      'Flash forte, vignettatura e infiltrazioni di luce';

  @override
  String get styleBwDescription =>
      'Bianco e nero granuloso con contrasto profondo';

  @override
  String get styleGoldenDescription =>
      'Sempre golden hour, un morbido bagliore dorato';

  @override
  String get styleChromeDescription =>
      'Freddo, saturo e nitido, come una diapositiva';

  @override
  String get shutterStopRecording => 'Interrompi registrazione';

  @override
  String get shutterStartRecording => 'Avvia registrazione video';

  @override
  String get shutterTakePhoto => 'Scatta foto';

  @override
  String get modePhoto => 'Foto';

  @override
  String get modeVideo => 'Video';

  @override
  String get cameraNotFound => 'Nessuna fotocamera trovata';

  @override
  String get cameraAccessNeeded =>
      'CamTrip ha bisogno di accedere alla fotocamera. Attivalo in Impostazioni.';

  @override
  String get cameraStartFailed => 'Impossibile avviare la fotocamera';

  @override
  String get albumAccessNeeded =>
      'Consenti a CamTrip di accedere alle tue foto per salvarle anche nel tuo album';

  @override
  String get albumSaveFailed =>
      'Salvataggio nell\'album non riuscito. La foto viene comunque condivisa.';

  @override
  String styleProFallback(String style) {
    return 'Questo stile fa parte di Pro. In questo gruppo scatti con $style.';
  }

  @override
  String get photoFailed => 'Scatto non riuscito. Riprova.';

  @override
  String get recordingFailed => 'Registrazione video non riuscita';

  @override
  String get videoFailed => 'Creazione del video non riuscita. Riprova.';

  @override
  String get shootInGroup => 'Scatta nel gruppo';

  @override
  String get close => 'Chiudi';

  @override
  String get flash => 'Flash';

  @override
  String get flashOn => 'Sì';

  @override
  String get flashOff => 'No';

  @override
  String get flashAuto => 'Auto';

  @override
  String get chooseGroup => 'Scegli gruppo';

  @override
  String get switchCamera => 'Cambia fotocamera';

  @override
  String get createOrJoinFirst => 'Prima crea un gruppo o unisciti a uno';

  @override
  String get proViaGroup => 'Pro tramite il gruppo';

  @override
  String proViaName(String name) {
    return 'Pro tramite $name';
  }

  @override
  String get proStylesFreeViaMember =>
      'Gli stili Pro in questo gruppo sono gratis per te grazie a un membro Pro';

  @override
  String proStylesFreeViaName(String name) {
    return 'Stili Pro in questo gruppo: gratis per te grazie a $name';
  }

  @override
  String get subscriptionsUnavailable =>
      'Gli abbonamenti non sono disponibili al momento. Riprova più tardi.';

  @override
  String get paymentPending =>
      'Il pagamento è ancora in elaborazione. Pro si attiva appena è completato.';

  @override
  String get purchaseFailed => 'Acquisto non riuscito. Riprova più tardi.';

  @override
  String get restoreUnavailable =>
      'Al momento non è possibile ripristinare gli acquisti. Riprova più tardi.';

  @override
  String get restoreFailed => 'Ripristino non riuscito. Riprova più tardi.';

  @override
  String get welcomePro => 'Benvenuto in CamTrip Pro! 🎉';

  @override
  String get proRestored => 'Pro è stato ripristinato';

  @override
  String get noPurchaseFound => 'Nessun acquisto precedente trovato';

  @override
  String periodDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count giorni',
      one: '1 giorno',
    );
    return '$_temp0';
  }

  @override
  String periodWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count settimane',
      one: '1 settimana',
    );
    return '$_temp0';
  }

  @override
  String periodMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mesi',
      one: '1 mese',
    );
    return '$_temp0';
  }

  @override
  String periodYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count anni',
      one: '1 anno',
    );
    return '$_temp0';
  }

  @override
  String get paywallHavePro => 'Hai CamTrip Pro';

  @override
  String get paywallSubtitle => 'Tutto per il tuo prossimo viaggio.';

  @override
  String paywallFeatureStyles(String styles) {
    return 'Tutti gli stili della fotocamera ($styles)';
  }

  @override
  String get paywallFeatureUnlimited =>
      'Membri e spazio illimitati, le foto restano per sempre';

  @override
  String get paywallFeatureNoWatermark => 'Recap senza filigrana';

  @override
  String get paywallFeatureOriginal => 'Download in qualità originale';

  @override
  String get planYear => 'Anno';

  @override
  String get planMonth => 'Mese';

  @override
  String pricePerMonth(String price) {
    return '$price al mese';
  }

  @override
  String paywallSaveBadge(int percent) {
    return 'RISPARMIA $percent%';
  }

  @override
  String get planMonthCancelAnytime => 'disdici quando vuoi';

  @override
  String tryFree(String period) {
    return 'Prova $period gratis';
  }

  @override
  String get becomePro => 'Passa a Pro';

  @override
  String get subscriptionsLoadFailed =>
      'Impossibile caricare gli abbonamenti. Controlla la connessione.';

  @override
  String legalAnnual(String price) {
    return 'Abbonamento annuale CamTrip Pro: $price all\'anno.';
  }

  @override
  String legalAnnualTrial(String period, String price) {
    return 'Abbonamento annuale CamTrip Pro: $period gratis, poi $price all\'anno.';
  }

  @override
  String legalMonthly(String price) {
    return 'Abbonamento mensile CamTrip Pro: $price al mese.';
  }

  @override
  String legalMonthlyTrial(String period, String price) {
    return 'Abbonamento mensile CamTrip Pro: $period gratis, poi $price al mese.';
  }

  @override
  String get legalBillingApple =>
      'Il pagamento viene addebitato sul tuo ID Apple. L\'abbonamento si rinnova automaticamente, a meno che tu non lo disdica almeno 24 ore prima della fine del periodo. Puoi disdirlo e gestirlo nelle impostazioni del tuo account App Store.';

  @override
  String get legalBillingGoogle =>
      'Il pagamento viene addebitato sul tuo account Google. L\'abbonamento si rinnova automaticamente, a meno che tu non lo disdica almeno 24 ore prima della fine del periodo. Puoi disdirlo e gestirlo nelle impostazioni del tuo account Google Play.';

  @override
  String get restorePurchases => 'Ripristina acquisti';

  @override
  String get terms => 'Termini';

  @override
  String get privacy => 'Privacy';

  @override
  String get groupProTitle => 'Un Pro nel gruppo = Pro per tutto il gruppo';

  @override
  String get groupProBody =>
      'Se una persona ha Pro, tutto il gruppo ottiene tutti gli stili della fotocamera, membri illimitati, foto che restano, qualità originale e recap senza filigrana.';

  @override
  String get groupCreated => 'Gruppo creato ✓';

  @override
  String get inviteFriends => 'Invita i tuoi amici';

  @override
  String get codeCopied => 'Codice copiato';

  @override
  String get shareLink => 'Condividi link';

  @override
  String inviteSubject(String groupName) {
    return 'Unisciti a $groupName su CamTrip';
  }

  @override
  String inviteMembersUnlimited(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count membri',
      one: '1 membro',
    );
    return '$_temp0 · illimitato (Pro)';
  }

  @override
  String inviteMembersLimit(int count, int limit) {
    return '$count di $limit membri · Pro: illimitato';
  }

  @override
  String get toCamera => 'Vai alla fotocamera';

  @override
  String get done => 'Fine';

  @override
  String get joinEnterCode => 'Inserisci il codice di 6 caratteri';

  @override
  String get joinGroupTitle => 'Unisciti a un gruppo';

  @override
  String get joinGroupSubtitle =>
      'Inserisci il codice dei tuoi amici o scansiona il loro codice QR.';

  @override
  String get typeCode => 'Digita codice';

  @override
  String get scanQr => 'Scansiona QR';

  @override
  String get join => 'Unisciti';

  @override
  String get groupNameRequired => 'Dai un nome al tuo gruppo';

  @override
  String get newGroup => 'Nuovo gruppo';

  @override
  String get groupType => 'Tipo di gruppo';

  @override
  String get groupTypeVacation => 'Vacanza';

  @override
  String get groupTypeVacationDescription =>
      'Con data di inizio e fine, poi in archivio';

  @override
  String get groupTypeEvent => 'Evento';

  @override
  String get groupTypeEventDescription =>
      'Un giorno o una serata, ad es. una festa';

  @override
  String get groupTypePermanent => 'Sempre aperto';

  @override
  String get groupTypePermanentDescription =>
      'Per il tuo solito gruppo di amici';

  @override
  String get date => 'Data';

  @override
  String get departure => 'Partenza';

  @override
  String get returnDate => 'Ritorno';

  @override
  String get defaultCameraStyle => 'Stile fotocamera predefinito';

  @override
  String freeLimitPermanent(int max) {
    return 'Gratis: fino a $max membri. Illimitato con Pro.';
  }

  @override
  String freeLimitDated(int max, int days) {
    return 'Gratis: fino a $max membri, le foto restano fino a $days giorni dopo la data di fine. Illimitato e per sempre con Pro.';
  }

  @override
  String get createGroup => 'Crea gruppo';

  @override
  String get group => 'Gruppo';

  @override
  String groupCode(String code) {
    return 'codice $code';
  }

  @override
  String get manage => 'Gestione';

  @override
  String get rename => 'Rinomina';

  @override
  String get changeDates => 'Modifica date';

  @override
  String get finishTrip => 'Concludi viaggio';

  @override
  String get finishTripSubtitle => 'Imposta la data di fine a oggi';

  @override
  String get reopenGroup => 'Riapri gruppo';

  @override
  String get closeGroup => 'Chiudi gruppo';

  @override
  String get reopenGroupSubtitle => 'I membri possono di nuovo aggiungere foto';

  @override
  String get closeGroupSubtitle =>
      'Nessuno può più aggiungere foto; tutto resta visibile';

  @override
  String get members => 'Membri';

  @override
  String memberYou(String name) {
    return '$name (tu)';
  }

  @override
  String get blockedTag => 'bloccato';

  @override
  String get adminTag => 'admin';

  @override
  String removeMemberTitle(String name) {
    return 'Rimuovere $name?';
  }

  @override
  String get removeMemberMessage => 'Le sue foto restano nel gruppo.';

  @override
  String get remove => 'Elimina';

  @override
  String get removeMember => 'Rimuovi';

  @override
  String blockTitle(String name) {
    return 'Bloccare $name?';
  }

  @override
  String blockMessage(String name) {
    return 'Non vedrai più foto e video di $name e non riceverai notifiche su di essi. Puoi annullare in Impostazioni.';
  }

  @override
  String get block => 'Blocca';

  @override
  String get makeMember => 'Rendi membro normale';

  @override
  String get makeAdmin => 'Rendi admin';

  @override
  String get removeFromGroup => 'Rimuovi dal gruppo';

  @override
  String get unblock => 'Sblocca';

  @override
  String get inviteFriendsButton => 'Invita amici';

  @override
  String get you => 'Tu';

  @override
  String get unarchive => 'Ripristina dall\'archivio';

  @override
  String get archive => 'Archivia';

  @override
  String get unarchiveSubtitle => 'Il gruppo torna tra i tuoi album';

  @override
  String archiveSubtitle(String section) {
    return 'Solo per te: il gruppo va in \"$section\" in fondo ai tuoi album';
  }

  @override
  String get archivedSection => 'Archiviati';

  @override
  String get hiddenPhotos => 'Foto nascoste';

  @override
  String get hiddenPhotosSubtitle => 'Foto che hai nascosto per te';

  @override
  String get leaveGroup => 'Lascia il gruppo';

  @override
  String get leaveGroupSubtitle =>
      'Le tue foto restano nel gruppo per gli altri';

  @override
  String get deleteGroup => 'Elimina gruppo';

  @override
  String get deleteGroupSubtitle => 'Tutte le foto vengono eliminate per tutti';

  @override
  String groupArchived(String groupName) {
    return '\"$groupName\" archiviato';
  }

  @override
  String groupUnarchived(String groupName) {
    return '\"$groupName\" è tornato tra i tuoi album';
  }

  @override
  String get undo => 'Annulla';

  @override
  String get groupNameTitle => 'Nome del gruppo';

  @override
  String get finishTripTitle => 'Concludere il viaggio?';

  @override
  String get finishTripMessage =>
      'La data di fine diventa oggi. Puoi ancora aggiungere foto; il recap è pronto.';

  @override
  String get finishTripConfirm => 'Concludi';

  @override
  String get tripFinished => 'Viaggio concluso';

  @override
  String leaveGroupTitle(String groupName) {
    return 'Lasciare \"$groupName\"?';
  }

  @override
  String get leaveGroupMessage =>
      'Le tue foto restano nel gruppo per gli altri. Puoi rientrare più tardi con il codice.';

  @override
  String get leave => 'Lascia';

  @override
  String groupDeleted(String groupName) {
    return '\"$groupName\" è stato eliminato';
  }

  @override
  String get youAreAdmin => 'sei admin';

  @override
  String get open => 'Apri';

  @override
  String get archiveMenuSubtitle =>
      'Solo per te, gli altri non se ne accorgono';

  @override
  String get deleteGroupMenuSubtitle => 'Per tutti, con tutte le foto';

  @override
  String get deleteGroupTitle => 'Eliminare il gruppo?';

  @override
  String deleteGroupMessage(int count, String groupName, int memberCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Tutte le $count foto e video',
      one: 'La foto o il video',
    );
    String _temp1 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'spariranno',
      one: 'sparirà',
    );
    String _temp2 = intl.Intl.pluralLogic(
      memberCount,
      locale: localeName,
      other: 'tutti i $memberCount membri',
      one: 'l\'unico membro',
    );
    return '$_temp0 in \"$groupName\" $_temp1 per $_temp2. Non si può annullare.';
  }

  @override
  String get deleteGroupOwnRoll => 'Il tuo rullino resta invariato.';

  @override
  String get deleteGroupTypeName => 'Digita il nome del gruppo per confermare:';

  @override
  String get deleteForEveryone => 'Elimina per tutti';

  @override
  String get save => 'Salva';

  @override
  String get yourAlbums => 'I tuoi album';

  @override
  String get uploadQueue => 'Coda di caricamento';

  @override
  String get noConnection => 'Nessuna connessione';

  @override
  String get albumsOfflineMessage =>
      'I tuoi album si caricano appena torni online. La fotocamera funziona comunque.';

  @override
  String get retry => 'Riprova';

  @override
  String get noAlbumsTitle => 'Ancora nessun album';

  @override
  String get noAlbumsMessage =>
      'Crea un gruppo per il tuo prossimo viaggio o unisciti a quello di un amico con il codice.';

  @override
  String get haveCode => 'Ho un codice';

  @override
  String get joinWithCode => 'Unisciti con codice o codice QR';

  @override
  String get camera => 'Fotocamera';

  @override
  String get restore => 'Ripristina';

  @override
  String get more => 'Altro';

  @override
  String get newAlbum => 'Nuovo';

  @override
  String get closedTag => 'chiuso';

  @override
  String get activeTag => 'attivo';

  @override
  String get uploadFailed => 'Caricamento non riuscito';

  @override
  String get queueNoSignal => 'Nessun segnale.';

  @override
  String get queueNoSignalMessage =>
      'Le tue foto sono già nel tuo album e verranno condivise appena torni online.';

  @override
  String get queueWaitingForWifi => 'In attesa del Wi-Fi.';

  @override
  String queueWifiOnlyOn(String setting) {
    return 'Hai attivato \"$setting\".';
  }

  @override
  String get queueVideosWifiOnly => 'I video vengono caricati solo via Wi-Fi.';

  @override
  String get queueAllShared => 'Tutto condiviso ✓';

  @override
  String queuePending(String items) {
    return '$items ancora da condividere';
  }

  @override
  String queuePendingBoth(String photos, String videos) {
    return '$photos e $videos ancora da condividere';
  }

  @override
  String get retryUpload => 'Riprova';

  @override
  String get removeFromQueue => 'Togli dalla coda';

  @override
  String get queueStatusWifi => 'Wi-Fi';

  @override
  String get queueStatusWaiting => 'in attesa';

  @override
  String get videosWifiOnlyTitle => 'Video solo via Wi-Fi';

  @override
  String get videosWifiOnlySubtitle => 'Risparmia i dati mobili';

  @override
  String get retryNow => 'Riprova ora';

  @override
  String get yourName => 'Il tuo nome';

  @override
  String get settings => 'Impostazioni';

  @override
  String get tapToChangeName => 'Tocca per cambiare il tuo nome';

  @override
  String get getCamTripPro => 'Passa a CamTrip Pro';

  @override
  String get photos => 'Foto';

  @override
  String get saveOwnPhotos => 'Salva le mie foto in un album per gruppo';

  @override
  String get autoSaveOthers => 'Salva automaticamente le foto degli altri';

  @override
  String get wifiOnlyTitle => 'Carica solo via Wi-Fi';

  @override
  String get dateStamp => 'Data impressa';

  @override
  String get notifications => 'Notifiche';

  @override
  String get notifyNewPhotos => 'Nuove foto (raggruppate)';

  @override
  String get notifyRecapReady => 'Recap pronto';

  @override
  String get camTripTeam => 'Team CamTrip';

  @override
  String get adminEntrySubtitle =>
      'Utenti, regalare Pro, segnalazioni e numeri';

  @override
  String get account => 'Account';

  @override
  String get manageSubscription => 'Gestisci abbonamento';

  @override
  String get blockedPeople => 'Persone bloccate';

  @override
  String get nobody => 'Nessuno';

  @override
  String peopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count persone',
      one: '1 persona',
    );
    return '$_temp0';
  }

  @override
  String get privacyPolicy => 'Informativa sulla privacy';

  @override
  String get contact => 'Contatti';

  @override
  String get signOut => 'Esci';

  @override
  String get deleteAccount => 'Elimina account';

  @override
  String get deleteAccountSubtitle =>
      'Elimina il tuo account e tutte le tue foto';

  @override
  String get deleteAccountTitle => 'Eliminare l\'account?';

  @override
  String get deleteAccountMessage =>
      'Il tuo account e tutte le tue foto e video verranno eliminati, anche dai gruppi. Un abbonamento attivo si disdice dall\'App Store o da Google Play.';

  @override
  String get blockedTitle => 'Bloccati';

  @override
  String get blockedSubtitle => 'Non vedi le foto di queste persone.';

  @override
  String get blockedNone => 'Non hai bloccato nessuno.';

  @override
  String get unblockShort => 'Sblocca';

  @override
  String get groupGone =>
      'Questo gruppo non esiste più o non ne fai più parte.';

  @override
  String photosSavedToAlbum(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto salvate in \"$album\"',
      one: '1 foto salvata in \"$album\"',
    );
    return '$_temp0';
  }

  @override
  String photosDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto eliminate',
      one: '1 foto eliminata',
    );
    return '$_temp0';
  }

  @override
  String photosDeletedSkipped(int count, int skipped) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto eliminate',
      one: '1 foto eliminata',
    );
    return '$_temp0, $skipped saltate';
  }

  @override
  String photosHiddenForYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto nascoste per te',
      one: '1 foto nascosta per te',
    );
    return '$_temp0';
  }

  @override
  String get addedToFavorites => 'Aggiunta ai preferiti';

  @override
  String get removedFromFavorites => 'Rimossa dai preferiti';

  @override
  String get photoAccessSettings =>
      'Consenti a CamTrip di accedere alle tue foto in Impostazioni';

  @override
  String photosBeingAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Aggiunta di $count foto in corso',
      one: 'Aggiunta di 1 foto in corso',
    );
    return '$_temp0';
  }

  @override
  String photosUnreadable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Impossibile leggere $count foto',
      one: 'Impossibile leggere 1 foto',
    );
    return '$_temp0';
  }

  @override
  String get groupNotLoaded => 'Gruppo non caricato';

  @override
  String get noFavoritesTitle => 'Ancora nessun preferito';

  @override
  String get noPhotosTitle => 'Ancora nessuna foto';

  @override
  String get noFavoritesMessage =>
      'Tocca la stella su una foto per metterla qui.';

  @override
  String get noPhotosMessage =>
      'Scatta la prima foto. Tutto il gruppo la vede subito.';

  @override
  String get openCamera => 'Apri la fotocamera';

  @override
  String savingProgress(int done, int total) {
    return 'Salvataggio... $done/$total';
  }

  @override
  String get sharePreparing => 'Preparazione...';

  @override
  String sharingProgress(int done, int total) {
    return 'Preparazione... $done/$total';
  }

  @override
  String get choosePhotos => 'Scegli foto';

  @override
  String selectedCount(int count) {
    return '$count selezionate';
  }

  @override
  String get selectNone => 'Deseleziona tutto';

  @override
  String get selectAll => 'Seleziona tutto';

  @override
  String photosWaitingToShare(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto in attesa di condivisione',
      one: '1 foto in attesa di condivisione',
    );
    return '$_temp0';
  }

  @override
  String get recapReadyTitle => 'Il tuo recap è pronto';

  @override
  String get recapReadySubtitle => 'Un video con musica del vostro viaggio';

  @override
  String get watch => 'Guarda';

  @override
  String get makeRecapNow => 'Crea ora un video recap';

  @override
  String freeGroupDeleteNotice(String date) {
    return 'Gruppo gratis: le foto restano fino al $date. Salvale o passa a Pro.';
  }

  @override
  String get filterAll => 'Tutte';

  @override
  String get filterFavorites => 'Preferiti';

  @override
  String get filterPerPerson => 'Per persona';

  @override
  String get filterPerson => 'Persona';

  @override
  String get select => 'Seleziona';

  @override
  String get hiddenFilter => 'Nascoste';

  @override
  String get photosBy => 'Foto di...';

  @override
  String get uploadedTag => 'caricata';

  @override
  String get saveAll => 'Salva tutto';

  @override
  String get favorite => 'Preferito';

  @override
  String get unfavorite => 'Togli preferito';

  @override
  String get hide => 'Nascondi';

  @override
  String get delete => 'Elimina';

  @override
  String deletePhotosTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Eliminare $count foto?',
      one: 'Eliminare la foto?',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Spariranno per tutti nel gruppo. Non si può annullare.',
      one: 'Sparirà per tutti nel gruppo. Non si può annullare.',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosNotAllowed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count foto sono di qualcun altro. Restano; solo un admin può eliminarle.',
      one: '1 foto è di qualcun altro. Resta; solo un admin può eliminarla.',
    );
    return '$_temp0';
  }

  @override
  String photosBackInGroup(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto sono di nuovo nel gruppo',
      one: '1 foto è di nuovo nel gruppo',
    );
    return '$_temp0';
  }

  @override
  String get showAll => 'Mostra tutte';

  @override
  String get hiddenPhotosExplainer =>
      'Solo tu non vedi più queste foto. Per gli altri nel gruppo sono ancora lì.';

  @override
  String get nothingHidden => 'Niente di nascosto';

  @override
  String get nothingHiddenMessage => 'Le foto che nascondi le ritrovi qui.';

  @override
  String showAgainCount(int count) {
    return 'Mostra di nuovo ($count)';
  }

  @override
  String get someone => 'Qualcuno';

  @override
  String get savedToAlbum => 'Salvata nel tuo album fotografico';

  @override
  String get share => 'Condividi';

  @override
  String get shareFailed => 'Condivisione non riuscita';

  @override
  String get reportTitle => 'Perché segnali questa foto?';

  @override
  String get reportSubtitle =>
      'Esaminiamo ogni segnalazione entro 24 ore. La foto viene nascosta subito per te.';

  @override
  String get reportThanks => 'Grazie, ci diamo un\'occhiata';

  @override
  String blockMessageAllGroups(String name) {
    return 'Non vedrai più foto e video di $name in nessun gruppo e non riceverai notifiche su di essi. Puoi annullare in Impostazioni.';
  }

  @override
  String userBlocked(String name) {
    return '$name è stato bloccato';
  }

  @override
  String get videoHiddenForYou => 'Video nascosto per te';

  @override
  String get photoHiddenForYou => 'Foto nascosta per te';

  @override
  String get setAsCover => 'Imposta come copertina';

  @override
  String get coverUpdated => 'Copertina aggiornata';

  @override
  String get hideForMe => 'Nascondi per me';

  @override
  String get hideForMeSubtitle => 'Gli altri nel gruppo la vedono ancora';

  @override
  String get reportPhoto => 'Segnala foto';

  @override
  String blockName(String name) {
    return 'Blocca $name';
  }

  @override
  String get forEveryoneInGroup => 'Per tutti nel gruppo';

  @override
  String get videoDeleted => 'Video eliminato';

  @override
  String get photoDeleted => 'Foto eliminata';

  @override
  String get photoAccessToSave =>
      'Consenti a CamTrip di accedere alle tue foto in Impostazioni per salvare';

  @override
  String get phoneFull => 'Il telefono è pieno';

  @override
  String get albumSaveFailedShort => 'Salvataggio nell\'album non riuscito';

  @override
  String get recapTemplateGoldenHour => 'Golden Hour';

  @override
  String get recapTemplateFast => 'Veloce';

  @override
  String get recapTemplateFilmRoll => 'Rullino';

  @override
  String get recapTemplatePolaroid => 'Polaroid';

  @override
  String get trackSummerEvening => 'Sera d\'estate';

  @override
  String get trackGoldenHour => 'Golden Hour';

  @override
  String get trackRoadtrip => 'Road trip';

  @override
  String get moodWarm => 'calda';

  @override
  String get moodCheerful => 'allegra';

  @override
  String friendsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count amici',
      one: '1 amico',
    );
    return '$_temp0';
  }

  @override
  String get madeWithCamTrip => 'Creato con CamTrip';

  @override
  String get tagline => 'Un rullino per tutto il gruppo';

  @override
  String get videoUnsupportedDevice =>
      'Impossibile creare il video su questo dispositivo';

  @override
  String get groupLoadFailed => 'Impossibile caricare questo gruppo.';

  @override
  String recapNeedsPhotos(int count) {
    return 'Per un recap servono almeno $count foto.';
  }

  @override
  String get recapFailed => 'Creazione del recap non riuscita. Riprova.';

  @override
  String get recapSaved => 'Recap salvato nel tuo album fotografico';

  @override
  String get recap => 'Recap';

  @override
  String get recapRendering => 'Creazione del recap...';

  @override
  String get videoRendering => 'Creazione del video...';

  @override
  String get template => 'Modello';

  @override
  String get musicLicense => 'Musica originale di CamTrip · royalty free';

  @override
  String get change => 'Cambia';

  @override
  String get noWatermark => 'Nessuna filigrana ✓';

  @override
  String get removeWatermarkPro => 'Rimuovi la filigrana con Pro';

  @override
  String get proSourceSubscription => 'Abbonamento';

  @override
  String get proSourceGift => 'Regalo';

  @override
  String get proSourceAdmin => 'Admin';

  @override
  String get proSourceGroup => 'Tramite gruppo';

  @override
  String get noPro => 'Nessun Pro';

  @override
  String proStatusNoEnd(String source) {
    return 'Pro ($source), senza data di fine';
  }

  @override
  String proStatusUntil(String source, String date) {
    return 'Pro ($source), fino al $date';
  }

  @override
  String get lifetime => 'A vita';

  @override
  String get pickDate => 'Scegli data';

  @override
  String get noAccess => 'Nessun accesso';

  @override
  String get adminOnlyTeam => 'La gestione è riservata al team CamTrip.';

  @override
  String get adminOverview => 'Panoramica';

  @override
  String get adminUsers => 'Utenti';

  @override
  String get adminReports => 'Segnalazioni';

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
  String get adminNewThisWeek => 'Nuovi questa settimana';

  @override
  String get adminGroups => 'Gruppi';

  @override
  String get adminProSubscription => 'Pro con abbonamento';

  @override
  String get adminProGift => 'Pro in regalo';

  @override
  String adminWithoutSubscription(int count) {
    return '$count senza abbonamento';
  }

  @override
  String get adminOpenReports => 'Segnalazioni aperte';

  @override
  String get adminSearchHint => 'Cerca per nome o e-mail';

  @override
  String get nobodyFound => 'Nessuno trovato';

  @override
  String get loadMore => 'Carica altro';

  @override
  String get noEmail => 'Nessuna e-mail';

  @override
  String adminDeletePhotoMessage(String groupName) {
    return 'La foto sparisce per tutti in \"$groupName\". Tutte le segnalazioni su questa foto vengono chiuse.';
  }

  @override
  String get adminBanMessage =>
      'Questo account non potrà più accedere né usare l\'app. Puoi annullare in seguito.';

  @override
  String get adminDismissTitle => 'Ignorare la segnalazione?';

  @override
  String get adminDismissMessage =>
      'La foto resta. La segnalazione viene segnata come gestita.';

  @override
  String get adminDismiss => 'Ignora';

  @override
  String get adminAccountBlocked => 'Account bloccato';

  @override
  String get adminReportDismissed => 'Segnalazione ignorata';

  @override
  String get adminNoReports => 'Nessuna segnalazione aperta';

  @override
  String get adminNoReportsMessage => 'Le foto segnalate compaiono qui.';

  @override
  String get deletedTag => 'Eliminata';

  @override
  String adminReportedBy(String name) {
    return 'Da $name';
  }

  @override
  String adminPhotoBy(String name) {
    return 'Foto di $name';
  }

  @override
  String reportsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count segnalazioni',
      one: '1 segnalazione',
    );
    return '$_temp0';
  }

  @override
  String get adminDeletePhoto => 'Elimina foto';

  @override
  String get adminBlockCreator => 'Blocca autore';

  @override
  String get loadFailed => 'Caricamento non riuscito';

  @override
  String get adminLifetimeProGiven => 'Pro a vita regalato';

  @override
  String get adminProGiven => 'Pro regalato';

  @override
  String adminGiveProUntil(String date) {
    return 'Regala Pro fino al $date';
  }

  @override
  String get adminGiveProLifetime => 'Regala Pro a vita';

  @override
  String adminGiveProFor(String period) {
    return 'Regala Pro per $period';
  }

  @override
  String get adminReasonHint => 'Motivo, ad es. amico, tester, influencer';

  @override
  String get adminGivePro => 'Regala Pro';

  @override
  String get adminRevokeTitle => 'Revocare il regalo?';

  @override
  String get adminRevokeMessage =>
      'Il Pro regalato termina subito. Un abbonamento personale continua normalmente.';

  @override
  String get adminRevoke => 'Revoca';

  @override
  String get adminGiftRevoked => 'Regalo revocato';

  @override
  String get adminUnbanTitle => 'Rimuovere il blocco?';

  @override
  String adminUnbanMessage(String name) {
    return '$name potrà accedere di nuovo.';
  }

  @override
  String get adminUnbanned => 'Blocco rimosso';

  @override
  String get adminBanUserMessage =>
      'Questo account non potrà più accedere né usare l\'app. Le foto restano.';

  @override
  String get adminUser => 'Utente';

  @override
  String get adminNotVerified => 'non verificata';

  @override
  String get adminRole => 'Ruolo';

  @override
  String get adminCreated => 'Creato';

  @override
  String get unknown => 'Sconosciuto';

  @override
  String get adminSignInWith => 'Accede con';

  @override
  String get adminEmailMethod => 'E-mail';

  @override
  String get adminPhotosAndVideos => 'Foto e video';

  @override
  String get adminStatus => 'Stato';

  @override
  String get adminActive => 'Attivo';

  @override
  String adminActiveUntil(String date) {
    return 'Attivo fino al $date';
  }

  @override
  String adminGiftFrom(String name) {
    return 'Regalo di $name';
  }

  @override
  String adminExpiredOn(String date) {
    return 'Scaduto il $date';
  }

  @override
  String get adminExpired => 'Scaduto';

  @override
  String adminUntil(String date) {
    return 'Fino al $date';
  }

  @override
  String get adminGiveProTitle => 'Regala Pro';

  @override
  String get adminGiveProNote =>
      'Vale anche per i gruppi di questa persona: un Pro nel gruppo = Pro per tutto il gruppo.';

  @override
  String get adminRevokeGift => 'Revoca regalo';

  @override
  String get adminModeration => 'Moderazione';

  @override
  String get adminCannotBanSelf => 'Non puoi bloccare te stesso.';

  @override
  String get adminCannotBanAdmin => 'Un admin non può essere bloccato.';

  @override
  String get adminUnban => 'Rimuovi blocco';

  @override
  String get adminBanAccount => 'Blocca account';

  @override
  String get googleSignInUnavailable =>
      'L\'accesso con Google non è ancora disponibile';

  @override
  String get cameraPickerTitle => 'Scegli la tua fotocamera';

  @override
  String get cameraPickerSubtitle =>
      'Ogni fotocamera dà alle tue foto un look tutto suo';

  @override
  String get cameraPickerChange => 'Cambia fotocamera';

  @override
  String get cameraPickerUnlock => 'Sblocca con Pro';

  @override
  String get cameraPickerSelected => 'Selezionata';

  @override
  String get cameraPickerStyleSummer => 'Estate';

  @override
  String get cameraPickerStyleSummerDescription =>
      'Colori caldi e sbiaditi di uno scatto anni \'90';

  @override
  String get cameraPickerStyleNight => 'Notte 800';

  @override
  String get cameraPickerStyleNightDescription =>
      'Pellicola da cinema: ombre verde-blu, luce calda, tanta grana';

  @override
  String get cameraPickerStyleSepia => 'Seppia';

  @override
  String get cameraPickerStyleSepiaDescription =>
      'Una vecchia stampa marrone dalla scatola delle scarpe';

  @override
  String get cameraPickerStyleLomo => 'Lomo';

  @override
  String get cameraPickerStyleLomoDescription =>
      'Colori accesi, angoli scuri e una dominante pazza';

  @override
  String get cameraPickerStyleMint => 'Menta';

  @override
  String get cameraPickerStyleMintDescription =>
      'Morbido e fresco con una tinta verde';

  @override
  String get cameraPickerStylePastel => 'Rosa';

  @override
  String get cameraPickerStylePastelDescription =>
      'Colori pastello con un bagliore rosa e bordo bianco';

  @override
  String get cameraPickerStyleSuper8 => 'Super 8';

  @override
  String get cameraPickerStyleSuper8Description =>
      'Sgranato e morbido, come un vecchio filmino di famiglia';

  @override
  String get paywallBenefitGroup => 'Un Pro = Pro per tutto il gruppo';

  @override
  String get paywallBenefitUnlimited => 'Membri illimitati, foto per sempre';

  @override
  String get paywallBenefitQuality => 'Senza filigrana, qualità originale';

  @override
  String paywallFreeTrial(String period) {
    return '$period gratis';
  }

  @override
  String paywallPriceYear(String price) {
    return '$price all\'anno.';
  }

  @override
  String paywallPriceYearTrial(String period, String price) {
    return '$period gratis, poi $price all\'anno.';
  }

  @override
  String paywallPriceMonth(String price) {
    return '$price al mese.';
  }

  @override
  String paywallPriceMonthTrial(String period, String price) {
    return '$period gratis, poi $price al mese.';
  }

  @override
  String paywallAutoRenew(String store) {
    return 'Si rinnova automaticamente. Disdici almeno 24 ore prima del rinnovo in $store.';
  }

  @override
  String get paywallDetailsTitle => 'Tutto ciò che offre Pro';

  @override
  String get paywallBenefitStyles => 'Tutti gli stili della fotocamera';

  @override
  String get allPhotosTitle => 'Tutte le foto';

  @override
  String get homeTabAlbums => 'Album';

  @override
  String get allPhotosEmptyTitle => 'Ancora nessuna foto';

  @override
  String get allPhotosEmptyMessage =>
      'Apri la fotocamera e scatta la tua prima foto.';

  @override
  String get allPhotosLoadFailed => 'Impossibile caricare le tue foto';

  @override
  String get cameraSettingsTitle => 'Impostazioni fotocamera';

  @override
  String get cameraSettingsMore => 'Altre impostazioni';

  @override
  String get cameraSettingsGrid => 'Griglia';

  @override
  String get cameraSettingsHaptics => 'Vibra allo scatto';

  @override
  String get cameraSettingsDateStamp => 'Data in basso a destra';

  @override
  String get cameraSettingsSound => 'Suono dello scatto';

  @override
  String get cameraSettingsSoundHint => 'Muto se il telefono è in silenzioso';

  @override
  String get cameraSettingsTimer => 'Autoscatto';

  @override
  String get cameraSettingsTimerOff => 'No';

  @override
  String cameraSettingsTimerSeconds(int seconds) {
    return '$seconds s';
  }

  @override
  String get cameraSettingsTimerCancelHint =>
      'Tocca il pulsante di scatto per annullare';

  @override
  String get cameraSettingsMirror => 'Selfie a specchio';

  @override
  String get cameraSettingsSaveToRoll => 'Salva nel rullino';

  @override
  String get cameraSettingsQuality => 'Qualità';

  @override
  String get cameraSettingsQualityStandard => 'Standard';

  @override
  String get cameraSettingsQualityHigh => 'Alta';

  @override
  String get cameraLowLightHint => 'Poca luce - attiva il flash';

  @override
  String get cameraFlashUnavailable => 'Questa fotocamera non ha il flash';

  @override
  String get cameraFlashScreen => 'Flash schermo';

  @override
  String get cameraFlashCycleHint => 'Tocca per passare tra no, sì e auto';

  @override
  String get cameraFlip => 'Passa tra fotocamera anteriore e posteriore';

  @override
  String get cameraFlipHint =>
      'Tocca due volte il mirino per girare la fotocamera';

  @override
  String cameraPickerPaywallStyles(int count, String styles) {
    return 'Tutte le $count fotocamere, tra cui $styles';
  }

  @override
  String get styleFlash => 'Flash 400';

  @override
  String get styleFlashDescription =>
      'Flash diretto su pellicola calda: tono ambra, grana, rossi intensi';
}
