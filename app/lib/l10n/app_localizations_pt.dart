// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get cancel => 'Cancelar';

  @override
  String get yes => 'Sim';

  @override
  String inviteMessageIntro(String groupName) {
    return 'Juntas-te a \"$groupName\" no CamTrip? Assim vemos logo as fotos de todos.';
  }

  @override
  String inviteMessageCode(String code) {
    return 'Ou introduz o código: $code';
  }

  @override
  String get memberFallbackName => 'Amigo';

  @override
  String get reportReasonInappropriate => 'Inadequado ou ofensivo';

  @override
  String get reportReasonSpam => 'Spam';

  @override
  String get reportReasonOther => 'Outra coisa';

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
  String get errorOffline => 'Sem ligação. Tenta novamente daqui a pouco.';

  @override
  String errorSomethingWrongStatus(int status) {
    return 'Algo correu mal ($status)';
  }

  @override
  String get errorSomethingWrong => 'Algo correu mal';

  @override
  String get apiInvalidCredentials => 'E-mail ou palavra-passe incorretos';

  @override
  String get apiInvalidCode =>
      'Este código está incorreto ou expirou. Pede um código novo.';

  @override
  String get apiEmailTaken =>
      'Já existe uma conta com este e-mail. Inicia sessão ou escolhe \"Esqueceste-te da palavra-passe?\".';

  @override
  String apiEmailTakenProvider(String provider) {
    return 'Já existe uma conta com este e-mail. Inicia sessão com $provider.';
  }

  @override
  String apiWeakPassword(int min) {
    return 'Escolhe uma palavra-passe com pelo menos $min caracteres';
  }

  @override
  String apiNameTooLong(int max) {
    return 'O teu nome pode ter no máximo $max caracteres';
  }

  @override
  String get apiRateLimited =>
      'Demasiadas tentativas. Tenta novamente daqui a um quarto de hora.';

  @override
  String apiAccountBanned(String email) {
    return 'A tua conta foi bloqueada. Contacta $email se achas que é um erro.';
  }

  @override
  String get apiProRequired => 'Este estilo de câmara faz parte do CamTrip Pro';

  @override
  String get apiGroupClosed => 'Este grupo foi fechado';

  @override
  String get apiGroupCodeNotFound => 'Nenhum grupo encontrado com este código';

  @override
  String apiGroupFull(int max) {
    return 'Este grupo está cheio (máx. $max membros). Se um membro tiver CamTrip Pro, pode entrar quem quiser.';
  }

  @override
  String get apiLastMember => 'És o último membro. Elimina antes o grupo.';

  @override
  String get apiAdminRequired => 'Só para administradores do CamTrip';

  @override
  String get apiUploadIncomplete => 'O envio não está completo';

  @override
  String get apiInvalidInput => 'Dados inválidos';

  @override
  String get apiNotSignedIn => 'Sessão não iniciada';

  @override
  String get apiAccountGone => 'Esta conta já não existe';

  @override
  String get apiPhotoNotFound => 'Foto não encontrada';

  @override
  String get apiGroupNotFound => 'Grupo não encontrado';

  @override
  String get apiMemberNotFound => 'Membro não encontrado';

  @override
  String get apiPersonNotFound => 'Pessoa não encontrada';

  @override
  String get apiUserNotFound => 'Utilizador não encontrado';

  @override
  String get apiAdminOnly => 'Só um admin pode fazer isto';

  @override
  String get apiCannotBlockSelf => 'Não te podes bloquear a ti próprio';

  @override
  String get apiCannotReportOwn => 'Não podes denunciar a tua própria foto';

  @override
  String get apiDeleteOwnOnly => 'Só podes eliminar as tuas próprias fotos';

  @override
  String get apiOwnerCannotBeRemoved =>
      'Quem criou o grupo não pode ser removido';

  @override
  String get apiOwnerStaysAdmin => 'Quem criou o grupo continua a ser admin';

  @override
  String get apiNeedsOneAdmin => 'Um grupo precisa de pelo menos um admin';

  @override
  String get apiEndBeforeStart => 'A data de fim é anterior à data de início';

  @override
  String get apiPermanentNoEndDate =>
      'Um grupo sempre aberto não tem data de fim';

  @override
  String get apiCannotBanAdmin => 'Um administrador não pode ser bloqueado';

  @override
  String get apiReportNotFound => 'Denúncia não encontrada';

  @override
  String get apiPhotoOwnerUnknown => 'Já não se sabe quem tirou esta foto';

  @override
  String get validationNameRequired => 'Escreve o teu nome';

  @override
  String validationMaxChars(int max) {
    return 'No máximo $max caracteres';
  }

  @override
  String get validationEmailRequired => 'Escreve o teu e-mail';

  @override
  String get validationEmailInvalid => 'Este e-mail não é válido';

  @override
  String get validationPasswordRequired => 'Escolhe uma palavra-passe';

  @override
  String validationMinChars(int min) {
    return 'Pelo menos $min caracteres';
  }

  @override
  String get validationPasswordTooLong =>
      'Esta palavra-passe é demasiado longa';

  @override
  String get validationPasswordEmpty => 'Escreve a tua palavra-passe';

  @override
  String get validationCodeRequired => 'Introduz o código do e-mail';

  @override
  String get validationCodeDigits => 'O código tem 6 algarismos';

  @override
  String get onboarding1Title => 'Um rolo\npara o grupo todo.';

  @override
  String get onboarding1Body =>
      'Fotografa com uma câmara retro. Todos veem as tuas fotos logo, e elas ficam também no teu álbum.';

  @override
  String get onboarding2Title => 'Acabou o\nreencaminhar fotos.';

  @override
  String get onboarding2Body =>
      'Cria um grupo, partilha o código, e pronto. Nunca mais \"mandas-me essas fotos?\"';

  @override
  String get onboarding3Title => 'No fim, um\nvídeo resumo.';

  @override
  String get onboarding3Body =>
      'O CamTrip faz um vídeo com música dos vossos melhores momentos.';

  @override
  String get onboardingInvited =>
      'Foste convidado! Inicia sessão para participar.';

  @override
  String get signInAppleFailed => 'Não foi possível iniciar sessão com a Apple';

  @override
  String get signInGoogleFailed =>
      'Não foi possível iniciar sessão com a Google';

  @override
  String get signInFailed => 'Não foi possível iniciar sessão';

  @override
  String get next => 'Seguinte';

  @override
  String get legalPrefix => 'Ao continuar, aceitas os ';

  @override
  String get legalTerms => 'termos';

  @override
  String get legalAnd => ' e a ';

  @override
  String get legalPrivacy => 'política de privacidade';

  @override
  String get legalSuffix => '.';

  @override
  String get continueWithApple => 'Continuar com a Apple';

  @override
  String get continueWithGoogle => 'Continuar com a Google';

  @override
  String get createAccount => 'Criar conta';

  @override
  String get signIn => 'Iniciar sessão';

  @override
  String get or => 'ou';

  @override
  String get registerSubtitle =>
      'Assim os teus amigos veem quem tira as fotos.';

  @override
  String get loginSubtitle => 'Bem-vindo de volta.';

  @override
  String get forgotPasswordTitle => 'Esqueci-me da palavra-passe';

  @override
  String get forgotPasswordPushSubtitle =>
      'Ainda tens sessão iniciada nalgum dispositivo? Enviamos-te lá um código de 6 dígitos por notificação para definires uma nova palavra-passe.';

  @override
  String get newPassword => 'Nova palavra-passe';

  @override
  String get resetPushInfo =>
      'Se ainda tiveres sessão iniciada nalgum dispositivo, recebes lá uma notificação com um código. Não consegues entrar? Inicia sessão com a Apple ou a Google com o mesmo e-mail - a tua conta fica associada.';

  @override
  String get sendCode => 'Enviar código';

  @override
  String get savePassword => 'Guardar palavra-passe';

  @override
  String get errorTryAgain => 'Algo correu mal. Tenta novamente.';

  @override
  String get back => 'Voltar';

  @override
  String get name => 'Nome';

  @override
  String get email => 'E-mail';

  @override
  String get codeFromPush => 'Código da notificação';

  @override
  String get password => 'Palavra-passe';

  @override
  String get hidePassword => 'Ocultar palavra-passe';

  @override
  String get showPassword => 'Mostrar palavra-passe';

  @override
  String get forgotPasswordLink => 'Esqueceste-te da palavra-passe?';

  @override
  String get haveAccount => 'Já tens conta?';

  @override
  String get newToCamTrip => 'És novo no CamTrip?';

  @override
  String get rememberedIt => 'Já te lembraste?';

  @override
  String get noCodeReceived => 'Não recebeste o código?';

  @override
  String get resendCode => 'Enviar novamente';

  @override
  String onboardingDemoRoll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotógrafos, 1 rolo',
      one: '1 fotógrafo, 1 rolo',
    );
    return '$_temp0';
  }

  @override
  String membersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count membros',
      one: '1 membro',
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
  String get justNow => 'agora';

  @override
  String get badgeNew => 'Nova';

  @override
  String recapTitle(String groupName) {
    return 'Resumo $groupName';
  }

  @override
  String get styleFilm => 'Film';

  @override
  String get styleInstant => 'Instant';

  @override
  String get styleDisposable => 'Descartável';

  @override
  String get styleBw => 'P&B';

  @override
  String get styleGolden => 'Golden';

  @override
  String get styleChrome => 'Chrome';

  @override
  String get styleFilmDescription =>
      'Cores quentes, grão e data laranja impressa';

  @override
  String get styleInstantDescription => 'Cores suaves e uma moldura branca';

  @override
  String get styleDisposableDescription =>
      'Flash forte, vinheta e fugas de luz';

  @override
  String get styleBwDescription =>
      'Preto e branco granulado com contraste profundo';

  @override
  String get styleGoldenDescription =>
      'Sempre hora dourada, um brilho dourado suave';

  @override
  String get styleChromeDescription =>
      'Frio, saturado e nítido, como diapositivo';

  @override
  String get shutterStopRecording => 'Parar gravação';

  @override
  String get shutterStartRecording => 'Iniciar gravação de vídeo';

  @override
  String get shutterTakePhoto => 'Tirar foto';

  @override
  String get modePhoto => 'Foto';

  @override
  String get modeVideo => 'Vídeo';

  @override
  String get cameraNotFound => 'Nenhuma câmara encontrada';

  @override
  String get cameraAccessNeeded =>
      'O CamTrip precisa de acesso à tua câmara. Ativa-o nas Definições.';

  @override
  String get cameraStartFailed => 'Não foi possível iniciar a câmara';

  @override
  String get albumAccessNeeded =>
      'Dá acesso às tuas fotos ao CamTrip para as guardares também no teu álbum';

  @override
  String get albumSaveFailed =>
      'Não foi possível guardar no teu álbum. A foto é partilhada na mesma.';

  @override
  String styleProFallback(String style) {
    return 'Este estilo faz parte do Pro. Neste grupo fotografas com $style.';
  }

  @override
  String get photoFailed => 'Não foi possível tirar a foto. Tenta novamente.';

  @override
  String get recordingFailed => 'Não foi possível gravar o vídeo';

  @override
  String get videoFailed => 'Não foi possível criar o vídeo. Tenta novamente.';

  @override
  String get shootInGroup => 'Fotografar no grupo';

  @override
  String get close => 'Fechar';

  @override
  String get flash => 'Flash';

  @override
  String get flashOn => 'Sim';

  @override
  String get flashOff => 'Não';

  @override
  String get flashAuto => 'Auto';

  @override
  String get chooseGroup => 'Escolher grupo';

  @override
  String get switchCamera => 'Mudar de câmara';

  @override
  String get createOrJoinFirst => 'Primeiro cria um grupo ou junta-te a um';

  @override
  String get proViaGroup => 'Pro através do grupo';

  @override
  String proViaName(String name) {
    return 'Pro através de $name';
  }

  @override
  String get proStylesFreeViaMember =>
      'Os estilos Pro neste grupo são grátis para ti graças a um membro Pro';

  @override
  String proStylesFreeViaName(String name) {
    return 'Estilos Pro neste grupo: grátis para ti graças a $name';
  }

  @override
  String get subscriptionsUnavailable =>
      'As subscrições não estão disponíveis agora. Tenta mais tarde.';

  @override
  String get paymentPending =>
      'O teu pagamento ainda está a ser processado. O Pro ativa-se assim que estiver concluído.';

  @override
  String get purchaseFailed =>
      'Não foi possível concluir a compra. Tenta mais tarde.';

  @override
  String get restoreUnavailable =>
      'Agora não é possível restaurar compras. Tenta mais tarde.';

  @override
  String get restoreFailed => 'Não foi possível restaurar. Tenta mais tarde.';

  @override
  String get welcomePro => 'Bem-vindo ao CamTrip Pro! 🎉';

  @override
  String get proRestored => 'O Pro foi restaurado';

  @override
  String get noPurchaseFound => 'Nenhuma compra anterior encontrada';

  @override
  String periodDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dias',
      one: '1 dia',
    );
    return '$_temp0';
  }

  @override
  String periodWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count semanas',
      one: '1 semana',
    );
    return '$_temp0';
  }

  @override
  String periodMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count meses',
      one: '1 mês',
    );
    return '$_temp0';
  }

  @override
  String periodYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count anos',
      one: '1 ano',
    );
    return '$_temp0';
  }

  @override
  String get paywallHavePro => 'Tens CamTrip Pro';

  @override
  String get paywallSubtitle => 'Tudo para a tua próxima viagem.';

  @override
  String paywallFeatureStyles(String styles) {
    return 'Todos os estilos de câmara ($styles)';
  }

  @override
  String get paywallFeatureUnlimited =>
      'Membros e armazenamento ilimitados, as fotos ficam guardadas para sempre';

  @override
  String get paywallFeatureNoWatermark => 'Resumos sem marca de água';

  @override
  String get paywallFeatureOriginal => 'Transferir em qualidade original';

  @override
  String get planYear => 'Ano';

  @override
  String get planMonth => 'Mês';

  @override
  String pricePerMonth(String price) {
    return '$price por mês';
  }

  @override
  String paywallSaveBadge(int percent) {
    return 'POUPA $percent%';
  }

  @override
  String get planMonthCancelAnytime => 'cancela quando quiseres';

  @override
  String tryFree(String period) {
    return 'Experimenta $period grátis';
  }

  @override
  String get becomePro => 'Aderir ao Pro';

  @override
  String get subscriptionsLoadFailed =>
      'Não foi possível carregar as subscrições. Verifica a tua ligação.';

  @override
  String legalAnnual(String price) {
    return 'Subscrição anual do CamTrip Pro: $price por ano.';
  }

  @override
  String legalAnnualTrial(String period, String price) {
    return 'Subscrição anual do CamTrip Pro: $period grátis, depois $price por ano.';
  }

  @override
  String legalMonthly(String price) {
    return 'Subscrição mensal do CamTrip Pro: $price por mês.';
  }

  @override
  String legalMonthlyTrial(String period, String price) {
    return 'Subscrição mensal do CamTrip Pro: $period grátis, depois $price por mês.';
  }

  @override
  String get legalBillingApple =>
      'O pagamento é cobrado no teu ID Apple. A subscrição renova-se automaticamente, a menos que a canceles pelo menos 24 horas antes do fim do período. Podes cancelá-la e geri-la nas definições da tua conta da App Store.';

  @override
  String get legalBillingGoogle =>
      'O pagamento é cobrado na tua conta Google. A subscrição renova-se automaticamente, a menos que a canceles pelo menos 24 horas antes do fim do período. Podes cancelá-la e geri-la nas definições da tua conta do Google Play.';

  @override
  String get restorePurchases => 'Restaurar compras';

  @override
  String get terms => 'Termos';

  @override
  String get privacy => 'Privacidade';

  @override
  String get groupProTitle => 'Um Pro no grupo = Pro para todo o grupo';

  @override
  String get groupProBody =>
      'Se uma pessoa tiver Pro, o grupo todo recebe todos os estilos de câmara, membros ilimitados, fotos que ficam guardadas, qualidade original e resumos sem marca de água.';

  @override
  String get groupCreated => 'Grupo criado ✓';

  @override
  String get inviteFriends => 'Convida os teus amigos';

  @override
  String get codeCopied => 'Código copiado';

  @override
  String get shareLink => 'Partilhar link';

  @override
  String inviteSubject(String groupName) {
    return 'Junta-te a $groupName no CamTrip';
  }

  @override
  String inviteMembersUnlimited(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count membros',
      one: '1 membro',
    );
    return '$_temp0 · ilimitado (Pro)';
  }

  @override
  String inviteMembersLimit(int count, int limit) {
    return '$count de $limit membros · Pro: ilimitado';
  }

  @override
  String get toCamera => 'Ir para a câmara';

  @override
  String get done => 'Concluído';

  @override
  String get joinEnterCode => 'Introduz o código de 6 caracteres';

  @override
  String get joinGroupTitle => 'Entrar num grupo';

  @override
  String get joinGroupSubtitle =>
      'Introduz o código dos teus amigos ou lê o código QR deles.';

  @override
  String get typeCode => 'Escrever código';

  @override
  String get scanQr => 'Ler QR';

  @override
  String get join => 'Entrar';

  @override
  String get groupNameRequired => 'Dá um nome ao teu grupo';

  @override
  String get newGroup => 'Novo grupo';

  @override
  String get groupType => 'Tipo de grupo';

  @override
  String get groupTypeVacation => 'Férias';

  @override
  String get groupTypeVacationDescription =>
      'Com data de início e de fim, depois vai para o arquivo';

  @override
  String get groupTypeEvent => 'Evento';

  @override
  String get groupTypeEventDescription =>
      'Um dia ou uma noite, p. ex. uma festa';

  @override
  String get groupTypePermanent => 'Sempre aberto';

  @override
  String get groupTypePermanentDescription =>
      'Para o teu grupo de amigos de sempre';

  @override
  String get date => 'Data';

  @override
  String get departure => 'Partida';

  @override
  String get returnDate => 'Regresso';

  @override
  String get defaultCameraStyle => 'Estilo de câmara predefinido';

  @override
  String freeLimitPermanent(int max) {
    return 'Grátis: até $max membros. Ilimitado com Pro.';
  }

  @override
  String freeLimitDated(int max, int days) {
    return 'Grátis: até $max membros, as fotos ficam até $days dias depois da data de fim. Ilimitado e para sempre com Pro.';
  }

  @override
  String get createGroup => 'Criar grupo';

  @override
  String get group => 'Grupo';

  @override
  String groupCode(String code) {
    return 'código $code';
  }

  @override
  String get manage => 'Gestão';

  @override
  String get rename => 'Mudar nome';

  @override
  String get changeDates => 'Alterar datas';

  @override
  String get finishTrip => 'Terminar viagem';

  @override
  String get finishTripSubtitle => 'Define a data de fim para hoje';

  @override
  String get reopenGroup => 'Reabrir grupo';

  @override
  String get closeGroup => 'Fechar grupo';

  @override
  String get reopenGroupSubtitle => 'Os membros podem voltar a adicionar fotos';

  @override
  String get closeGroupSubtitle =>
      'Ninguém pode adicionar mais fotos; tudo continua visível';

  @override
  String get members => 'Membros';

  @override
  String memberYou(String name) {
    return '$name (tu)';
  }

  @override
  String get blockedTag => 'bloqueado';

  @override
  String get adminTag => 'admin';

  @override
  String removeMemberTitle(String name) {
    return 'Remover $name?';
  }

  @override
  String get removeMemberMessage => 'As fotos ficam no grupo.';

  @override
  String get remove => 'Eliminar';

  @override
  String get removeMember => 'Remover';

  @override
  String blockTitle(String name) {
    return 'Bloquear $name?';
  }

  @override
  String blockMessage(String name) {
    return 'Deixas de ver fotos e vídeos de $name e não recebes notificações sobre eles. Podes anular isto nas Definições.';
  }

  @override
  String get block => 'Bloquear';

  @override
  String get makeMember => 'Tornar membro normal';

  @override
  String get makeAdmin => 'Tornar admin';

  @override
  String get removeFromGroup => 'Remover do grupo';

  @override
  String get unblock => 'Desbloquear';

  @override
  String get inviteFriendsButton => 'Convidar amigos';

  @override
  String get you => 'Tu';

  @override
  String get unarchive => 'Tirar do arquivo';

  @override
  String get archive => 'Arquivar';

  @override
  String get unarchiveSubtitle => 'O grupo volta a estar nos teus álbuns';

  @override
  String archiveSubtitle(String section) {
    return 'Só para ti: o grupo passa para \"$section\" no fundo dos teus álbuns';
  }

  @override
  String get archivedSection => 'Arquivados';

  @override
  String get hiddenPhotos => 'Fotos ocultas';

  @override
  String get hiddenPhotosSubtitle => 'Fotos que ocultaste para ti';

  @override
  String get leaveGroup => 'Sair do grupo';

  @override
  String get leaveGroupSubtitle =>
      'As tuas fotos ficam no grupo para os outros';

  @override
  String get deleteGroup => 'Eliminar grupo';

  @override
  String get deleteGroupSubtitle => 'Todas as fotos são eliminadas para todos';

  @override
  String groupArchived(String groupName) {
    return '\"$groupName\" arquivado';
  }

  @override
  String groupUnarchived(String groupName) {
    return '\"$groupName\" voltou aos teus álbuns';
  }

  @override
  String get undo => 'Anular';

  @override
  String get groupNameTitle => 'Nome do grupo';

  @override
  String get finishTripTitle => 'Terminar a viagem?';

  @override
  String get finishTripMessage =>
      'A data de fim passa a ser hoje. Ainda podes adicionar fotos; o resumo está pronto.';

  @override
  String get finishTripConfirm => 'Terminar';

  @override
  String get tripFinished => 'Viagem terminada';

  @override
  String leaveGroupTitle(String groupName) {
    return 'Sair de \"$groupName\"?';
  }

  @override
  String get leaveGroupMessage =>
      'As tuas fotos ficam no grupo para os outros. Podes voltar a entrar mais tarde com o código.';

  @override
  String get leave => 'Sair';

  @override
  String groupDeleted(String groupName) {
    return '\"$groupName\" foi eliminado';
  }

  @override
  String get youAreAdmin => 'és admin';

  @override
  String get open => 'Abrir';

  @override
  String get archiveMenuSubtitle => 'Só para ti, os outros não dão por nada';

  @override
  String get deleteGroupMenuSubtitle => 'Para todos, com todas as fotos';

  @override
  String get deleteGroupTitle => 'Eliminar o grupo?';

  @override
  String deleteGroupMessage(int count, String groupName, int memberCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Todas as $count fotos e vídeos',
      one: 'A foto ou o vídeo',
    );
    String _temp1 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'vão desaparecer',
      one: 'vai desaparecer',
    );
    String _temp2 = intl.Intl.pluralLogic(
      memberCount,
      locale: localeName,
      other: 'todos os $memberCount membros',
      one: 'o único membro',
    );
    return '$_temp0 em \"$groupName\" $_temp1 para $_temp2. Isto não pode ser anulado.';
  }

  @override
  String get deleteGroupOwnRoll => 'O teu próprio rolo da câmara fica igual.';

  @override
  String get deleteGroupTypeName => 'Escreve o nome do grupo para confirmar:';

  @override
  String get deleteForEveryone => 'Eliminar para todos';

  @override
  String get save => 'Guardar';

  @override
  String get yourAlbums => 'Os teus álbuns';

  @override
  String get uploadQueue => 'Fila de envio';

  @override
  String get noConnection => 'Sem ligação';

  @override
  String get albumsOfflineMessage =>
      'Os teus álbuns carregam assim que voltares a ter internet. A câmara funciona na mesma.';

  @override
  String get retry => 'Tentar novamente';

  @override
  String get noAlbumsTitle => 'Ainda sem álbuns';

  @override
  String get noAlbumsMessage =>
      'Cria um grupo para a tua próxima viagem ou junta-te ao de um amigo com o código.';

  @override
  String get haveCode => 'Tenho um código';

  @override
  String get joinWithCode => 'Entrar com código ou código QR';

  @override
  String get camera => 'Câmara';

  @override
  String get restore => 'Repor';

  @override
  String get more => 'Mais';

  @override
  String get newAlbum => 'Novo';

  @override
  String get closedTag => 'fechado';

  @override
  String get activeTag => 'ativo';

  @override
  String get uploadFailed => 'Falha no envio';

  @override
  String get queueNoSignal => 'Sem rede.';

  @override
  String get queueNoSignalMessage =>
      'As tuas fotos já estão no teu álbum e serão partilhadas assim que voltares a ter internet.';

  @override
  String get queueWaitingForWifi => 'À espera de Wi-Fi.';

  @override
  String queueWifiOnlyOn(String setting) {
    return 'Tens \"$setting\" ativado.';
  }

  @override
  String get queueVideosWifiOnly => 'Os vídeos só são enviados por Wi-Fi.';

  @override
  String get queueAllShared => 'Está tudo partilhado ✓';

  @override
  String queuePending(String items) {
    return '$items por partilhar';
  }

  @override
  String queuePendingBoth(String photos, String videos) {
    return '$photos e $videos por partilhar';
  }

  @override
  String get retryUpload => 'Tentar novamente';

  @override
  String get removeFromQueue => 'Retirar da fila';

  @override
  String get queueStatusWifi => 'Wi-Fi';

  @override
  String get queueStatusWaiting => 'em espera';

  @override
  String get videosWifiOnlyTitle => 'Vídeos só por Wi-Fi';

  @override
  String get videosWifiOnlySubtitle => 'Poupa os teus dados móveis';

  @override
  String get retryNow => 'Tentar novamente agora';

  @override
  String get yourName => 'O teu nome';

  @override
  String get settings => 'Definições';

  @override
  String get tapToChangeName => 'Toca para mudar o teu nome';

  @override
  String get getCamTripPro => 'Aderir ao CamTrip Pro';

  @override
  String get photos => 'Fotos';

  @override
  String get saveOwnPhotos => 'Guardar as minhas fotos num álbum por grupo';

  @override
  String get autoSaveOthers => 'Guardar automaticamente as fotos dos outros';

  @override
  String get wifiOnlyTitle => 'Enviar só por Wi-Fi';

  @override
  String get dateStamp => 'Data impressa';

  @override
  String get notifications => 'Notificações';

  @override
  String get notifyNewPhotos => 'Novas fotos (agrupadas)';

  @override
  String get notifyRecapReady => 'Resumo pronto';

  @override
  String get camTripTeam => 'Equipa CamTrip';

  @override
  String get adminEntrySubtitle =>
      'Utilizadores, oferecer Pro, denúncias e números';

  @override
  String get account => 'Conta';

  @override
  String get manageSubscription => 'Gerir subscrição';

  @override
  String get blockedPeople => 'Pessoas bloqueadas';

  @override
  String get nobody => 'Ninguém';

  @override
  String peopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pessoas',
      one: '1 pessoa',
    );
    return '$_temp0';
  }

  @override
  String get privacyPolicy => 'Política de privacidade';

  @override
  String get contact => 'Contacto';

  @override
  String get signOut => 'Terminar sessão';

  @override
  String get deleteAccount => 'Eliminar conta';

  @override
  String get deleteAccountSubtitle =>
      'Elimina a tua conta e todas as tuas fotos';

  @override
  String get deleteAccountTitle => 'Eliminar a conta?';

  @override
  String get deleteAccountMessage =>
      'A tua conta e todas as tuas fotos e vídeos serão eliminados, também dos grupos. Uma subscrição ativa cancela-se na App Store ou no Google Play.';

  @override
  String get blockedTitle => 'Bloqueados';

  @override
  String get blockedSubtitle => 'Não vês fotos destas pessoas.';

  @override
  String get blockedNone => 'Não bloqueaste ninguém.';

  @override
  String get unblockShort => 'Desbloquear';

  @override
  String get groupGone => 'Este grupo já não existe ou já não és membro.';

  @override
  String photosSavedToAlbum(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotos guardadas em \"$album\"',
      one: '1 foto guardada em \"$album\"',
    );
    return '$_temp0';
  }

  @override
  String photosDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotos eliminadas',
      one: '1 foto eliminada',
    );
    return '$_temp0';
  }

  @override
  String photosDeletedSkipped(int count, int skipped) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotos eliminadas',
      one: '1 foto eliminada',
    );
    return '$_temp0, $skipped ignoradas';
  }

  @override
  String photosHiddenForYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotos ocultas para ti',
      one: '1 foto oculta para ti',
    );
    return '$_temp0';
  }

  @override
  String get addedToFavorites => 'Adicionada aos favoritos';

  @override
  String get removedFromFavorites => 'Removida dos favoritos';

  @override
  String get photoAccessSettings =>
      'Dá acesso às tuas fotos ao CamTrip nas Definições';

  @override
  String photosBeingAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'A adicionar $count fotos',
      one: 'A adicionar 1 foto',
    );
    return '$_temp0';
  }

  @override
  String photosUnreadable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Não foi possível ler $count fotos',
      one: 'Não foi possível ler 1 foto',
    );
    return '$_temp0';
  }

  @override
  String get groupNotLoaded => 'Grupo não carregado';

  @override
  String get noFavoritesTitle => 'Ainda sem favoritos';

  @override
  String get noPhotosTitle => 'Ainda sem fotos';

  @override
  String get noFavoritesMessage =>
      'Toca na estrela de uma foto para a pôr aqui.';

  @override
  String get noPhotosMessage => 'Tira a primeira foto. O grupo todo vê-a logo.';

  @override
  String get openCamera => 'Abrir a câmara';

  @override
  String savingProgress(int done, int total) {
    return 'A guardar... $done/$total';
  }

  @override
  String get choosePhotos => 'Escolher fotos';

  @override
  String selectedCount(int count) {
    return '$count selecionadas';
  }

  @override
  String get selectNone => 'Desmarcar tudo';

  @override
  String get selectAll => 'Selecionar tudo';

  @override
  String photosWaitingToShare(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotos à espera de serem partilhadas',
      one: '1 foto à espera de ser partilhada',
    );
    return '$_temp0';
  }

  @override
  String get recapReadyTitle => 'O teu resumo está pronto';

  @override
  String get recapReadySubtitle => 'Um vídeo com música da vossa viagem';

  @override
  String get watch => 'Ver';

  @override
  String get makeRecapNow => 'Criar já um vídeo resumo';

  @override
  String freeGroupDeleteNotice(String date) {
    return 'Grupo grátis: as fotos ficam até $date. Guarda-as ou adere ao Pro.';
  }

  @override
  String get filterAll => 'Todas';

  @override
  String get filterFavorites => 'Favoritos';

  @override
  String get filterPerPerson => 'Por pessoa';

  @override
  String get filterPerson => 'Pessoa';

  @override
  String get select => 'Selecionar';

  @override
  String get hiddenFilter => 'Ocultas';

  @override
  String get photosBy => 'Fotos de...';

  @override
  String get uploadedTag => 'carregada';

  @override
  String get saveAll => 'Guardar tudo';

  @override
  String get favorite => 'Favorito';

  @override
  String get unfavorite => 'Tirar favorito';

  @override
  String get hide => 'Ocultar';

  @override
  String get delete => 'Eliminar';

  @override
  String deletePhotosTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Eliminar $count fotos?',
      one: 'Eliminar a foto?',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Vão desaparecer para todos no grupo. Isto não pode ser anulado.',
      one: 'Vai desaparecer para todos no grupo. Isto não pode ser anulado.',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosNotAllowed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count fotos são de outra pessoa. Ficam; só um admin as pode eliminar.',
      one: '1 foto é de outra pessoa. Fica; só um admin a pode eliminar.',
    );
    return '$_temp0';
  }

  @override
  String photosBackInGroup(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotos voltaram ao grupo',
      one: '1 foto voltou ao grupo',
    );
    return '$_temp0';
  }

  @override
  String get showAll => 'Mostrar tudo';

  @override
  String get hiddenPhotosExplainer =>
      'Só tu deixas de ver estas fotos. Para os outros no grupo continuam lá.';

  @override
  String get nothingHidden => 'Nada oculto';

  @override
  String get nothingHiddenMessage => 'As fotos que ocultares aparecem aqui.';

  @override
  String showAgainCount(int count) {
    return 'Mostrar outra vez ($count)';
  }

  @override
  String get someone => 'Alguém';

  @override
  String get savedToAlbum => 'Guardada no teu álbum de fotos';

  @override
  String get share => 'Partilhar';

  @override
  String get shareFailed => 'Não foi possível partilhar';

  @override
  String get reportTitle => 'Porque estás a denunciar esta foto?';

  @override
  String get reportSubtitle =>
      'Analisamos cada denúncia em 24 horas. A foto fica logo oculta para ti.';

  @override
  String get reportThanks => 'Obrigado, vamos ver';

  @override
  String blockMessageAllGroups(String name) {
    return 'Deixas de ver fotos e vídeos de $name em qualquer grupo e não recebes notificações sobre eles. Podes anular isto nas Definições.';
  }

  @override
  String userBlocked(String name) {
    return '$name foi bloqueado';
  }

  @override
  String get videoHiddenForYou => 'Vídeo oculto para ti';

  @override
  String get photoHiddenForYou => 'Foto oculta para ti';

  @override
  String get setAsCover => 'Definir como capa';

  @override
  String get coverUpdated => 'Foto de capa alterada';

  @override
  String get hideForMe => 'Ocultar para mim';

  @override
  String get hideForMeSubtitle => 'Os outros no grupo continuam a vê-la';

  @override
  String get reportPhoto => 'Denunciar foto';

  @override
  String blockName(String name) {
    return 'Bloquear $name';
  }

  @override
  String get forEveryoneInGroup => 'Para todos no grupo';

  @override
  String get videoDeleted => 'Vídeo eliminado';

  @override
  String get photoDeleted => 'Foto eliminada';

  @override
  String get photoAccessToSave =>
      'Dá acesso às tuas fotos ao CamTrip nas Definições para guardar';

  @override
  String get phoneFull => 'O teu telemóvel está cheio';

  @override
  String get albumSaveFailedShort => 'Não foi possível guardar no teu álbum';

  @override
  String get recapTemplateGoldenHour => 'Golden Hour';

  @override
  String get recapTemplateFast => 'Rápido';

  @override
  String get recapTemplateFilmRoll => 'Rolo';

  @override
  String get recapTemplatePolaroid => 'Polaroid';

  @override
  String get trackSummerEvening => 'Fim de tarde de verão';

  @override
  String get trackGoldenHour => 'Golden Hour';

  @override
  String get trackRoadtrip => 'Road trip';

  @override
  String get moodWarm => 'calorosa';

  @override
  String get moodCheerful => 'alegre';

  @override
  String friendsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count amigos',
      one: '1 amigo',
    );
    return '$_temp0';
  }

  @override
  String get madeWithCamTrip => 'Feito com CamTrip';

  @override
  String get tagline => 'Um rolo para o grupo todo';

  @override
  String get videoUnsupportedDevice =>
      'Não foi possível criar o vídeo neste dispositivo';

  @override
  String get groupLoadFailed => 'Não foi possível carregar este grupo.';

  @override
  String recapNeedsPhotos(int count) {
    return 'Precisas de pelo menos $count fotos para um resumo.';
  }

  @override
  String get recapFailed => 'Não foi possível criar o resumo. Tenta novamente.';

  @override
  String get recapSaved => 'Resumo guardado no teu álbum de fotos';

  @override
  String get recap => 'Resumo';

  @override
  String get recapRendering => 'A criar resumo...';

  @override
  String get videoRendering => 'A criar vídeo...';

  @override
  String get template => 'Modelo';

  @override
  String get musicLicense =>
      'Música própria do CamTrip · sem direitos de autor';

  @override
  String get change => 'Mudar';

  @override
  String get noWatermark => 'Sem marca de água ✓';

  @override
  String get removeWatermarkPro => 'Remove a marca de água com Pro';

  @override
  String get proSourceSubscription => 'Subscrição';

  @override
  String get proSourceGift => 'Oferta';

  @override
  String get proSourceAdmin => 'Admin';

  @override
  String get proSourceGroup => 'Através do grupo';

  @override
  String get noPro => 'Sem Pro';

  @override
  String proStatusNoEnd(String source) {
    return 'Pro ($source), sem data de fim';
  }

  @override
  String proStatusUntil(String source, String date) {
    return 'Pro ($source), até $date';
  }

  @override
  String get lifetime => 'Vitalício';

  @override
  String get pickDate => 'Escolher data';

  @override
  String get noAccess => 'Sem acesso';

  @override
  String get adminOnlyTeam => 'A gestão é só para a equipa CamTrip.';

  @override
  String get adminOverview => 'Resumo';

  @override
  String get adminUsers => 'Utilizadores';

  @override
  String get adminReports => 'Denúncias';

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
  String get adminNewThisWeek => 'Novos esta semana';

  @override
  String get adminGroups => 'Grupos';

  @override
  String get adminProSubscription => 'Pro por subscrição';

  @override
  String get adminProGift => 'Pro oferecido';

  @override
  String adminWithoutSubscription(int count) {
    return '$count sem subscrição';
  }

  @override
  String get adminOpenReports => 'Denúncias abertas';

  @override
  String get adminSearchHint => 'Pesquisar por nome ou e-mail';

  @override
  String get nobodyFound => 'Ninguém encontrado';

  @override
  String get loadMore => 'Carregar mais';

  @override
  String get noEmail => 'Sem e-mail';

  @override
  String adminDeletePhotoMessage(String groupName) {
    return 'A foto desaparece para todos em \"$groupName\". Todas as denúncias desta foto ficam resolvidas.';
  }

  @override
  String get adminBanMessage =>
      'Esta conta deixa de poder iniciar sessão e usar a app. Podes anular isto mais tarde.';

  @override
  String get adminDismissTitle => 'Ignorar denúncia?';

  @override
  String get adminDismissMessage =>
      'A foto fica. A denúncia é marcada como resolvida.';

  @override
  String get adminDismiss => 'Ignorar';

  @override
  String get adminAccountBlocked => 'Conta bloqueada';

  @override
  String get adminReportDismissed => 'Denúncia ignorada';

  @override
  String get adminNoReports => 'Sem denúncias abertas';

  @override
  String get adminNoReportsMessage => 'As fotos denunciadas aparecem aqui.';

  @override
  String get deletedTag => 'Eliminada';

  @override
  String adminReportedBy(String name) {
    return 'Por $name';
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
      other: '$count denúncias',
      one: '1 denúncia',
    );
    return '$_temp0';
  }

  @override
  String get adminDeletePhoto => 'Eliminar foto';

  @override
  String get adminBlockCreator => 'Bloquear autor';

  @override
  String get loadFailed => 'Não foi possível carregar';

  @override
  String get adminLifetimeProGiven => 'Pro vitalício oferecido';

  @override
  String get adminProGiven => 'Pro oferecido';

  @override
  String adminGiveProUntil(String date) {
    return 'Oferecer Pro até $date';
  }

  @override
  String get adminGiveProLifetime => 'Oferecer Pro vitalício';

  @override
  String adminGiveProFor(String period) {
    return 'Oferecer Pro por $period';
  }

  @override
  String get adminReasonHint => 'Motivo, p. ex. amigo, tester, influencer';

  @override
  String get adminGivePro => 'Oferecer Pro';

  @override
  String get adminRevokeTitle => 'Retirar oferta?';

  @override
  String get adminRevokeMessage =>
      'O Pro oferecido termina já. Uma subscrição própria continua normalmente.';

  @override
  String get adminRevoke => 'Retirar';

  @override
  String get adminGiftRevoked => 'Oferta retirada';

  @override
  String get adminUnbanTitle => 'Levantar bloqueio?';

  @override
  String adminUnbanMessage(String name) {
    return '$name pode voltar a iniciar sessão.';
  }

  @override
  String get adminUnbanned => 'Bloqueio levantado';

  @override
  String get adminBanUserMessage =>
      'Esta conta deixa de poder iniciar sessão e usar a app. As fotos ficam.';

  @override
  String get adminUser => 'Utilizador';

  @override
  String get adminNotVerified => 'não confirmado';

  @override
  String get adminRole => 'Função';

  @override
  String get adminCreated => 'Criado';

  @override
  String get unknown => 'Desconhecido';

  @override
  String get adminSignInWith => 'Inicia sessão com';

  @override
  String get adminEmailMethod => 'E-mail';

  @override
  String get adminPhotosAndVideos => 'Fotos e vídeos';

  @override
  String get adminStatus => 'Estado';

  @override
  String get adminActive => 'Ativa';

  @override
  String adminActiveUntil(String date) {
    return 'Ativa até $date';
  }

  @override
  String adminGiftFrom(String name) {
    return 'Oferta de $name';
  }

  @override
  String adminExpiredOn(String date) {
    return 'Expirou a $date';
  }

  @override
  String get adminExpired => 'Expirado';

  @override
  String adminUntil(String date) {
    return 'Até $date';
  }

  @override
  String get adminGiveProTitle => 'Oferecer Pro';

  @override
  String get adminGiveProNote =>
      'Vale também para os grupos desta pessoa: um Pro no grupo = Pro para todo o grupo.';

  @override
  String get adminRevokeGift => 'Retirar oferta';

  @override
  String get adminModeration => 'Moderação';

  @override
  String get adminCannotBanSelf => 'Não te podes bloquear a ti próprio.';

  @override
  String get adminCannotBanAdmin => 'Um admin não pode ser bloqueado.';

  @override
  String get adminUnban => 'Levantar bloqueio';

  @override
  String get adminBanAccount => 'Bloquear conta';

  @override
  String get googleSignInUnavailable =>
      'O início de sessão com a Google ainda não está disponível';
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr() : super('pt_BR');

  @override
  String get cancel => 'Cancelar';

  @override
  String get yes => 'Sim';

  @override
  String inviteMessageIntro(String groupName) {
    return 'Bora entrar em \"$groupName\" no CamTrip? Assim todo mundo vê as fotos na hora.';
  }

  @override
  String inviteMessageCode(String code) {
    return 'Ou digite o código: $code';
  }

  @override
  String get memberFallbackName => 'Amigo';

  @override
  String get reportReasonInappropriate => 'Inadequado ou ofensivo';

  @override
  String get reportReasonSpam => 'Spam';

  @override
  String get reportReasonOther => 'Outro motivo';

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
  String get errorOffline => 'Sem conexão. Tente de novo daqui a pouco.';

  @override
  String errorSomethingWrongStatus(int status) {
    return 'Algo deu errado ($status)';
  }

  @override
  String get errorSomethingWrong => 'Algo deu errado';

  @override
  String get apiInvalidCredentials => 'E-mail ou senha incorretos';

  @override
  String get apiInvalidCode =>
      'Este código está incorreto ou expirou. Peça um novo código.';

  @override
  String get apiEmailTaken =>
      'Já existe uma conta com este e-mail. Entre ou escolha \"Esqueceu a senha?\".';

  @override
  String apiEmailTakenProvider(String provider) {
    return 'Já existe uma conta com este e-mail. Entre com $provider.';
  }

  @override
  String apiWeakPassword(int min) {
    return 'Escolha uma senha com pelo menos $min caracteres';
  }

  @override
  String apiNameTooLong(int max) {
    return 'Seu nome pode ter no máximo $max caracteres';
  }

  @override
  String get apiRateLimited =>
      'Muitas tentativas. Tente de novo em 15 minutos.';

  @override
  String apiAccountBanned(String email) {
    return 'Sua conta foi bloqueada. Fale com $email se achar que é um engano.';
  }

  @override
  String get apiProRequired => 'Este estilo de câmera faz parte do CamTrip Pro';

  @override
  String get apiGroupClosed => 'Este grupo foi encerrado';

  @override
  String get apiGroupCodeNotFound => 'Nenhum grupo encontrado com este código';

  @override
  String apiGroupFull(int max) {
    return 'Este grupo está cheio (máx. $max membros). Se um membro tiver CamTrip Pro, pode entrar quem quiser.';
  }

  @override
  String get apiLastMember =>
      'Você é o último membro. Exclua o grupo em vez disso.';

  @override
  String get apiAdminRequired => 'Apenas para administradores do CamTrip';

  @override
  String get apiUploadIncomplete => 'O envio não está completo';

  @override
  String get apiInvalidInput => 'Dados inválidos';

  @override
  String get apiNotSignedIn => 'Você não entrou';

  @override
  String get apiAccountGone => 'Esta conta não existe mais';

  @override
  String get apiPhotoNotFound => 'Foto não encontrada';

  @override
  String get apiGroupNotFound => 'Grupo não encontrado';

  @override
  String get apiMemberNotFound => 'Membro não encontrado';

  @override
  String get apiPersonNotFound => 'Pessoa não encontrada';

  @override
  String get apiUserNotFound => 'Usuário não encontrado';

  @override
  String get apiAdminOnly => 'Só um admin pode fazer isso';

  @override
  String get apiCannotBlockSelf => 'Você não pode bloquear a si mesmo';

  @override
  String get apiCannotReportOwn => 'Você não pode denunciar sua própria foto';

  @override
  String get apiDeleteOwnOnly => 'Você só pode excluir suas próprias fotos';

  @override
  String get apiOwnerCannotBeRemoved =>
      'Quem criou o grupo não pode ser removido';

  @override
  String get apiOwnerStaysAdmin => 'Quem criou o grupo continua admin';

  @override
  String get apiNeedsOneAdmin => 'Um grupo precisa de pelo menos um admin';

  @override
  String get apiEndBeforeStart =>
      'A data de término é anterior à data de início';

  @override
  String get apiPermanentNoEndDate =>
      'Um grupo sempre aberto não tem data de término';

  @override
  String get apiCannotBanAdmin => 'Um administrador não pode ser bloqueado';

  @override
  String get apiReportNotFound => 'Denúncia não encontrada';

  @override
  String get apiPhotoOwnerUnknown => 'Não se sabe mais quem tirou esta foto';

  @override
  String get validationNameRequired => 'Digite seu nome';

  @override
  String validationMaxChars(int max) {
    return 'No máximo $max caracteres';
  }

  @override
  String get validationEmailRequired => 'Digite seu e-mail';

  @override
  String get validationEmailInvalid => 'Este e-mail não é válido';

  @override
  String get validationPasswordRequired => 'Escolha uma senha';

  @override
  String validationMinChars(int min) {
    return 'Pelo menos $min caracteres';
  }

  @override
  String get validationPasswordTooLong => 'Esta senha é muito longa';

  @override
  String get validationPasswordEmpty => 'Digite sua senha';

  @override
  String get validationCodeRequired => 'Digite o código do e-mail';

  @override
  String get validationCodeDigits => 'O código tem 6 dígitos';

  @override
  String get onboarding1Title => 'Um filme\npara o grupo todo.';

  @override
  String get onboarding1Body =>
      'Fotografe com uma câmera retrô. Todo mundo vê suas fotos na hora, e elas já ficam no seu próprio álbum.';

  @override
  String get onboarding2Title => 'Chega de ficar\nmandando fotos.';

  @override
  String get onboarding2Body =>
      'Crie um grupo, compartilhe o código, pronto. Nunca mais \"me manda aquelas fotos?\"';

  @override
  String get onboarding3Title => 'No final, um\nvídeo retrospectiva.';

  @override
  String get onboarding3Body =>
      'O CamTrip faz um vídeo com música dos melhores momentos de vocês.';

  @override
  String get onboardingInvited => 'Você foi convidado! Entre para participar.';

  @override
  String get signInAppleFailed => 'Não deu para entrar com a Apple';

  @override
  String get signInGoogleFailed => 'Não deu para entrar com o Google';

  @override
  String get signInFailed => 'Não deu para entrar';

  @override
  String get next => 'Continuar';

  @override
  String get legalPrefix => 'Ao continuar, você aceita os ';

  @override
  String get legalTerms => 'termos';

  @override
  String get legalAnd => ' e a ';

  @override
  String get legalPrivacy => 'política de privacidade';

  @override
  String get legalSuffix => '.';

  @override
  String get continueWithApple => 'Continuar com a Apple';

  @override
  String get continueWithGoogle => 'Continuar com o Google';

  @override
  String get createAccount => 'Criar conta';

  @override
  String get signIn => 'Entrar';

  @override
  String get or => 'ou';

  @override
  String get registerSubtitle => 'Assim seus amigos sabem quem tirou as fotos.';

  @override
  String get loginSubtitle => 'Que bom te ver de novo.';

  @override
  String get forgotPasswordTitle => 'Esqueci a senha';

  @override
  String get forgotPasswordPushSubtitle =>
      'Ainda está conectado em algum aparelho? Enviamos para lá um código de 6 dígitos por notificação para você criar uma nova senha.';

  @override
  String get newPassword => 'Nova senha';

  @override
  String get resetPushInfo =>
      'Se você ainda estiver conectado em algum aparelho, vai receber lá uma notificação com um código. Não consegue entrar? Entre com Apple ou Google usando o mesmo e-mail - sua conta será vinculada.';

  @override
  String get sendCode => 'Enviar código';

  @override
  String get savePassword => 'Salvar senha';

  @override
  String get errorTryAgain => 'Algo deu errado. Tente de novo.';

  @override
  String get back => 'Voltar';

  @override
  String get name => 'Nome';

  @override
  String get email => 'E-mail';

  @override
  String get codeFromPush => 'Código da notificação';

  @override
  String get password => 'Senha';

  @override
  String get hidePassword => 'Ocultar senha';

  @override
  String get showPassword => 'Mostrar senha';

  @override
  String get forgotPasswordLink => 'Esqueceu a senha?';

  @override
  String get haveAccount => 'Já tem uma conta?';

  @override
  String get newToCamTrip => 'Novo no CamTrip?';

  @override
  String get rememberedIt => 'Lembrou?';

  @override
  String get noCodeReceived => 'Não recebeu o código?';

  @override
  String get resendCode => 'Enviar de novo';

  @override
  String onboardingDemoRoll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotógrafos, 1 filme',
      one: '1 fotógrafo, 1 filme',
    );
    return '$_temp0';
  }

  @override
  String membersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count membros',
      one: '1 membro',
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
  String get justNow => 'agora';

  @override
  String get badgeNew => 'Nova';

  @override
  String recapTitle(String groupName) {
    return 'Retrospectiva $groupName';
  }

  @override
  String get styleFilm => 'Film';

  @override
  String get styleInstant => 'Instant';

  @override
  String get styleDisposable => 'Descartável';

  @override
  String get styleBw => 'P&B';

  @override
  String get styleGolden => 'Golden';

  @override
  String get styleChrome => 'Chrome';

  @override
  String get styleFilmDescription =>
      'Cores quentes, granulado e data laranja impressa';

  @override
  String get styleInstantDescription => 'Cores suaves e uma borda branca';

  @override
  String get styleDisposableDescription =>
      'Flash forte, vinheta e vazamentos de luz';

  @override
  String get styleBwDescription =>
      'Preto e branco granulado com contraste profundo';

  @override
  String get styleGoldenDescription =>
      'Sempre golden hour, um brilho dourado suave';

  @override
  String get styleChromeDescription => 'Frio, saturado e nítido, como slide';

  @override
  String get shutterStopRecording => 'Parar gravação';

  @override
  String get shutterStartRecording => 'Começar a gravar vídeo';

  @override
  String get shutterTakePhoto => 'Tirar foto';

  @override
  String get modePhoto => 'Foto';

  @override
  String get modeVideo => 'Vídeo';

  @override
  String get cameraNotFound => 'Nenhuma câmera encontrada';

  @override
  String get cameraAccessNeeded =>
      'O CamTrip precisa de acesso à sua câmera. Ative nos Ajustes.';

  @override
  String get cameraStartFailed => 'Não foi possível iniciar a câmera';

  @override
  String get albumAccessNeeded =>
      'Dê ao CamTrip acesso às suas fotos para salvá-las também no seu álbum';

  @override
  String get albumSaveFailed =>
      'Não deu para salvar no seu álbum. A foto é compartilhada mesmo assim.';

  @override
  String styleProFallback(String style) {
    return 'Este estilo faz parte do Pro. Neste grupo você fotografa com $style.';
  }

  @override
  String get photoFailed => 'Não deu para tirar a foto. Tente de novo.';

  @override
  String get recordingFailed => 'Não deu para gravar o vídeo';

  @override
  String get videoFailed => 'Não deu para criar o vídeo. Tente de novo.';

  @override
  String get shootInGroup => 'Fotografar no grupo';

  @override
  String get close => 'Fechar';

  @override
  String get flash => 'Flash';

  @override
  String get flashOn => 'Sim';

  @override
  String get flashOff => 'Não';

  @override
  String get flashAuto => 'Auto';

  @override
  String get chooseGroup => 'Escolher grupo';

  @override
  String get switchCamera => 'Trocar câmera';

  @override
  String get createOrJoinFirst => 'Primeiro crie um grupo ou entre em um';

  @override
  String get proViaGroup => 'Pro pelo grupo';

  @override
  String proViaName(String name) {
    return 'Pro por $name';
  }

  @override
  String get proStylesFreeViaMember =>
      'Os estilos Pro deste grupo são grátis para você graças a um membro Pro';

  @override
  String proStylesFreeViaName(String name) {
    return 'Estilos Pro neste grupo: grátis para você graças a $name';
  }

  @override
  String get subscriptionsUnavailable =>
      'As assinaturas não estão disponíveis agora. Tente mais tarde.';

  @override
  String get paymentPending =>
      'Seu pagamento ainda está sendo processado. O Pro ativa assim que for concluído.';

  @override
  String get purchaseFailed =>
      'Não deu para concluir a compra. Tente mais tarde.';

  @override
  String get restoreUnavailable =>
      'Não dá para restaurar compras agora. Tente mais tarde.';

  @override
  String get restoreFailed => 'Não deu para restaurar. Tente mais tarde.';

  @override
  String get welcomePro => 'Boas-vindas ao CamTrip Pro! 🎉';

  @override
  String get proRestored => 'O Pro foi restaurado';

  @override
  String get noPurchaseFound => 'Nenhuma compra anterior encontrada';

  @override
  String periodDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dias',
      one: '1 dia',
    );
    return '$_temp0';
  }

  @override
  String periodWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count semanas',
      one: '1 semana',
    );
    return '$_temp0';
  }

  @override
  String periodMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count meses',
      one: '1 mês',
    );
    return '$_temp0';
  }

  @override
  String periodYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count anos',
      one: '1 ano',
    );
    return '$_temp0';
  }

  @override
  String get paywallHavePro => 'Você tem CamTrip Pro';

  @override
  String get paywallSubtitle => 'Tudo para a sua próxima viagem.';

  @override
  String paywallFeatureStyles(String styles) {
    return 'Todos os estilos de câmera ($styles)';
  }

  @override
  String get paywallFeatureUnlimited =>
      'Membros e armazenamento ilimitados, fotos guardadas para sempre';

  @override
  String get paywallFeatureNoWatermark => 'Retrospectivas sem marca d\'água';

  @override
  String get paywallFeatureOriginal => 'Download em qualidade original';

  @override
  String get planYear => 'Anual';

  @override
  String get planMonth => 'Mensal';

  @override
  String pricePerMonth(String price) {
    return '$price por mês';
  }

  @override
  String paywallSaveBadge(int percent) {
    return 'ECONOMIZE $percent%';
  }

  @override
  String get planMonthCancelAnytime => 'cancele quando quiser';

  @override
  String tryFree(String period) {
    return 'Teste $period grátis';
  }

  @override
  String get becomePro => 'Assinar o Pro';

  @override
  String get subscriptionsLoadFailed =>
      'Não deu para carregar as assinaturas. Verifique sua conexão.';

  @override
  String legalAnnual(String price) {
    return 'Assinatura anual do CamTrip Pro: $price por ano.';
  }

  @override
  String legalAnnualTrial(String period, String price) {
    return 'Assinatura anual do CamTrip Pro: $period grátis, depois $price por ano.';
  }

  @override
  String legalMonthly(String price) {
    return 'Assinatura mensal do CamTrip Pro: $price por mês.';
  }

  @override
  String legalMonthlyTrial(String period, String price) {
    return 'Assinatura mensal do CamTrip Pro: $period grátis, depois $price por mês.';
  }

  @override
  String get legalBillingApple =>
      'O pagamento é cobrado no seu ID Apple. A assinatura é renovada automaticamente, a menos que você cancele pelo menos 24 horas antes do fim do período. Você pode cancelar e gerenciar nos ajustes da sua conta da App Store.';

  @override
  String get legalBillingGoogle =>
      'O pagamento é cobrado na sua conta do Google. A assinatura é renovada automaticamente, a menos que você cancele pelo menos 24 horas antes do fim do período. Você pode cancelar e gerenciar nas configurações da sua conta do Google Play.';

  @override
  String get restorePurchases => 'Restaurar compras';

  @override
  String get terms => 'Termos';

  @override
  String get privacy => 'Privacidade';

  @override
  String get groupProTitle => 'Um Pro no grupo = Pro para todo mundo do grupo';

  @override
  String get groupProBody =>
      'Se uma pessoa tiver Pro, o grupo todo ganha todos os estilos de câmera, membros ilimitados, fotos guardadas, qualidade original e retrospectivas sem marca d\'água.';

  @override
  String get groupCreated => 'Grupo criado ✓';

  @override
  String get inviteFriends => 'Convide seus amigos';

  @override
  String get codeCopied => 'Código copiado';

  @override
  String get shareLink => 'Compartilhar link';

  @override
  String inviteSubject(String groupName) {
    return 'Entre em $groupName no CamTrip';
  }

  @override
  String inviteMembersUnlimited(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count membros',
      one: '1 membro',
    );
    return '$_temp0 · ilimitado (Pro)';
  }

  @override
  String inviteMembersLimit(int count, int limit) {
    return '$count de $limit membros · Pro: ilimitado';
  }

  @override
  String get toCamera => 'Ir para a câmera';

  @override
  String get done => 'Pronto';

  @override
  String get joinEnterCode => 'Digite o código de 6 caracteres';

  @override
  String get joinGroupTitle => 'Entrar em um grupo';

  @override
  String get joinGroupSubtitle =>
      'Digite o código dos seus amigos ou escaneie o QR code deles.';

  @override
  String get typeCode => 'Digitar código';

  @override
  String get scanQr => 'Escanear QR';

  @override
  String get join => 'Entrar';

  @override
  String get groupNameRequired => 'Dê um nome ao seu grupo';

  @override
  String get newGroup => 'Novo grupo';

  @override
  String get groupType => 'Tipo de grupo';

  @override
  String get groupTypeVacation => 'Viagem de férias';

  @override
  String get groupTypeVacationDescription =>
      'Com data de início e de término, depois vai para o arquivo';

  @override
  String get groupTypeEvent => 'Evento';

  @override
  String get groupTypeEventDescription => 'Um dia ou uma noite, tipo uma festa';

  @override
  String get groupTypePermanent => 'Sempre aberto';

  @override
  String get groupTypePermanentDescription => 'Para a sua turma de sempre';

  @override
  String get date => 'Data';

  @override
  String get departure => 'Ida';

  @override
  String get returnDate => 'Volta';

  @override
  String get defaultCameraStyle => 'Estilo de câmera padrão';

  @override
  String freeLimitPermanent(int max) {
    return 'Grátis: até $max membros. Ilimitado com Pro.';
  }

  @override
  String freeLimitDated(int max, int days) {
    return 'Grátis: até $max membros, as fotos ficam até $days dias depois da data de término. Ilimitado e para sempre com Pro.';
  }

  @override
  String get createGroup => 'Criar grupo';

  @override
  String get group => 'Grupo';

  @override
  String groupCode(String code) {
    return 'código $code';
  }

  @override
  String get manage => 'Gerenciar';

  @override
  String get rename => 'Renomear';

  @override
  String get changeDates => 'Alterar datas';

  @override
  String get finishTrip => 'Encerrar viagem';

  @override
  String get finishTripSubtitle => 'Muda a data de término para hoje';

  @override
  String get reopenGroup => 'Reabrir grupo';

  @override
  String get closeGroup => 'Encerrar grupo';

  @override
  String get reopenGroupSubtitle => 'Os membros podem adicionar fotos de novo';

  @override
  String get closeGroupSubtitle =>
      'Ninguém pode adicionar mais fotos; tudo continua visível';

  @override
  String get members => 'Membros';

  @override
  String memberYou(String name) {
    return '$name (você)';
  }

  @override
  String get blockedTag => 'bloqueado';

  @override
  String get adminTag => 'admin';

  @override
  String removeMemberTitle(String name) {
    return 'Remover $name?';
  }

  @override
  String get removeMemberMessage => 'As fotos dessa pessoa continuam no grupo.';

  @override
  String get remove => 'Excluir';

  @override
  String get removeMember => 'Remover';

  @override
  String blockTitle(String name) {
    return 'Bloquear $name?';
  }

  @override
  String blockMessage(String name) {
    return 'Você não verá mais fotos e vídeos de $name nem receberá notificações sobre eles. Dá para desfazer nos Ajustes.';
  }

  @override
  String get block => 'Bloquear';

  @override
  String get makeMember => 'Tornar membro comum';

  @override
  String get makeAdmin => 'Tornar admin';

  @override
  String get removeFromGroup => 'Remover do grupo';

  @override
  String get unblock => 'Desbloquear';

  @override
  String get inviteFriendsButton => 'Convidar amigos';

  @override
  String get you => 'Você';

  @override
  String get unarchive => 'Tirar do arquivo';

  @override
  String get archive => 'Arquivar';

  @override
  String get unarchiveSubtitle => 'O grupo volta para os seus álbuns';

  @override
  String archiveSubtitle(String section) {
    return 'Só para você: o grupo vai para \"$section\" no fim dos seus álbuns';
  }

  @override
  String get archivedSection => 'Arquivados';

  @override
  String get hiddenPhotos => 'Fotos ocultas';

  @override
  String get hiddenPhotosSubtitle => 'Fotos que você ocultou para si';

  @override
  String get leaveGroup => 'Sair do grupo';

  @override
  String get leaveGroupSubtitle => 'Suas fotos ficam no grupo para os outros';

  @override
  String get deleteGroup => 'Excluir grupo';

  @override
  String get deleteGroupSubtitle =>
      'Todas as fotos são excluídas para todo mundo';

  @override
  String groupArchived(String groupName) {
    return '\"$groupName\" arquivado';
  }

  @override
  String groupUnarchived(String groupName) {
    return '\"$groupName\" voltou para os seus álbuns';
  }

  @override
  String get undo => 'Desfazer';

  @override
  String get groupNameTitle => 'Nome do grupo';

  @override
  String get finishTripTitle => 'Encerrar a viagem?';

  @override
  String get finishTripMessage =>
      'A data de término vira hoje. Ainda dá para adicionar fotos; a retrospectiva está pronta.';

  @override
  String get finishTripConfirm => 'Encerrar';

  @override
  String get tripFinished => 'Viagem encerrada';

  @override
  String leaveGroupTitle(String groupName) {
    return 'Sair de \"$groupName\"?';
  }

  @override
  String get leaveGroupMessage =>
      'Suas fotos ficam no grupo para os outros. Você pode voltar depois com o código.';

  @override
  String get leave => 'Sair';

  @override
  String groupDeleted(String groupName) {
    return '\"$groupName\" foi excluído';
  }

  @override
  String get youAreAdmin => 'você é admin';

  @override
  String get open => 'Abrir';

  @override
  String get archiveMenuSubtitle => 'Só para você, os outros nem percebem';

  @override
  String get deleteGroupMenuSubtitle => 'Para todo mundo, com todas as fotos';

  @override
  String get deleteGroupTitle => 'Excluir o grupo?';

  @override
  String deleteGroupMessage(int count, String groupName, int memberCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Todas as $count fotos e vídeos',
      one: 'A foto ou o vídeo',
    );
    String _temp1 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'vão sumir',
      one: 'vai sumir',
    );
    String _temp2 = intl.Intl.pluralLogic(
      memberCount,
      locale: localeName,
      other: 'todos os $memberCount membros',
      one: 'o único membro',
    );
    return '$_temp0 em \"$groupName\" $_temp1 para $_temp2. Não dá para desfazer.';
  }

  @override
  String get deleteGroupOwnRoll =>
      'O rolo da câmera do seu celular continua igual.';

  @override
  String get deleteGroupTypeName => 'Digite o nome do grupo para confirmar:';

  @override
  String get deleteForEveryone => 'Excluir para todos';

  @override
  String get save => 'Salvar';

  @override
  String get yourAlbums => 'Seus álbuns';

  @override
  String get uploadQueue => 'Fila de envio';

  @override
  String get noConnection => 'Sem conexão';

  @override
  String get albumsOfflineMessage =>
      'Seus álbuns carregam assim que você tiver internet de novo. A câmera funciona normalmente.';

  @override
  String get retry => 'Tentar de novo';

  @override
  String get noAlbumsTitle => 'Nenhum álbum ainda';

  @override
  String get noAlbumsMessage =>
      'Crie um grupo para a sua próxima viagem ou entre no de um amigo com o código.';

  @override
  String get haveCode => 'Tenho um código';

  @override
  String get joinWithCode => 'Entrar com código ou QR code';

  @override
  String get camera => 'Câmera';

  @override
  String get restore => 'Restaurar';

  @override
  String get more => 'Mais';

  @override
  String get newAlbum => 'Novo';

  @override
  String get closedTag => 'encerrado';

  @override
  String get activeTag => 'ativo';

  @override
  String get uploadFailed => 'Falha no envio';

  @override
  String get queueNoSignal => 'Sem sinal.';

  @override
  String get queueNoSignalMessage =>
      'Suas fotos já estão no seu álbum e serão compartilhadas assim que você tiver internet de novo.';

  @override
  String get queueWaitingForWifi => 'Aguardando Wi-Fi.';

  @override
  String queueWifiOnlyOn(String setting) {
    return 'Você ativou \"$setting\".';
  }

  @override
  String get queueVideosWifiOnly => 'Os vídeos só são enviados pelo Wi-Fi.';

  @override
  String get queueAllShared => 'Tudo compartilhado ✓';

  @override
  String queuePending(String items) {
    return '$items para compartilhar';
  }

  @override
  String queuePendingBoth(String photos, String videos) {
    return '$photos e $videos para compartilhar';
  }

  @override
  String get retryUpload => 'Tentar de novo';

  @override
  String get removeFromQueue => 'Tirar da fila';

  @override
  String get queueStatusWifi => 'Wi-Fi';

  @override
  String get queueStatusWaiting => 'aguardando';

  @override
  String get videosWifiOnlyTitle => 'Vídeos só pelo Wi-Fi';

  @override
  String get videosWifiOnlySubtitle => 'Economiza seus dados móveis';

  @override
  String get retryNow => 'Tentar de novo agora';

  @override
  String get yourName => 'Seu nome';

  @override
  String get settings => 'Ajustes';

  @override
  String get tapToChangeName => 'Toque para mudar seu nome';

  @override
  String get getCamTripPro => 'Assinar o CamTrip Pro';

  @override
  String get photos => 'Fotos';

  @override
  String get saveOwnPhotos => 'Salvar minhas fotos em um álbum por grupo';

  @override
  String get autoSaveOthers => 'Salvar automaticamente as fotos dos outros';

  @override
  String get wifiOnlyTitle => 'Enviar só pelo Wi-Fi';

  @override
  String get dateStamp => 'Data impressa';

  @override
  String get notifications => 'Notificações';

  @override
  String get notifyNewPhotos => 'Novas fotos (agrupadas)';

  @override
  String get notifyRecapReady => 'Retrospectiva pronta';

  @override
  String get camTripTeam => 'Equipe CamTrip';

  @override
  String get adminEntrySubtitle => 'Usuários, dar Pro, denúncias e números';

  @override
  String get account => 'Conta';

  @override
  String get manageSubscription => 'Gerenciar assinatura';

  @override
  String get blockedPeople => 'Pessoas bloqueadas';

  @override
  String get nobody => 'Ninguém';

  @override
  String peopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pessoas',
      one: '1 pessoa',
    );
    return '$_temp0';
  }

  @override
  String get privacyPolicy => 'Política de privacidade';

  @override
  String get contact => 'Contato';

  @override
  String get signOut => 'Sair';

  @override
  String get deleteAccount => 'Excluir conta';

  @override
  String get deleteAccountSubtitle => 'Exclui sua conta e todas as suas fotos';

  @override
  String get deleteAccountTitle => 'Excluir a conta?';

  @override
  String get deleteAccountMessage =>
      'Sua conta e todas as suas fotos e vídeos serão excluídos, inclusive dos grupos. Cancele uma assinatura ativa na App Store ou no Google Play.';

  @override
  String get blockedTitle => 'Bloqueados';

  @override
  String get blockedSubtitle => 'Você não vê fotos dessas pessoas.';

  @override
  String get blockedNone => 'Você não bloqueou ninguém.';

  @override
  String get unblockShort => 'Desbloquear';

  @override
  String get groupGone =>
      'Este grupo não existe mais ou você não é mais membro.';

  @override
  String photosSavedToAlbum(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotos salvas em \"$album\"',
      one: '1 foto salva em \"$album\"',
    );
    return '$_temp0';
  }

  @override
  String photosDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotos excluídas',
      one: '1 foto excluída',
    );
    return '$_temp0';
  }

  @override
  String photosDeletedSkipped(int count, int skipped) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotos excluídas',
      one: '1 foto excluída',
    );
    return '$_temp0, $skipped ignoradas';
  }

  @override
  String photosHiddenForYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotos ocultas para você',
      one: '1 foto oculta para você',
    );
    return '$_temp0';
  }

  @override
  String get addedToFavorites => 'Adicionada aos favoritos';

  @override
  String get removedFromFavorites => 'Removida dos favoritos';

  @override
  String get photoAccessSettings =>
      'Dê ao CamTrip acesso às suas fotos nos Ajustes';

  @override
  String photosBeingAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Adicionando $count fotos',
      one: 'Adicionando 1 foto',
    );
    return '$_temp0';
  }

  @override
  String photosUnreadable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Não deu para ler $count fotos',
      one: 'Não deu para ler 1 foto',
    );
    return '$_temp0';
  }

  @override
  String get groupNotLoaded => 'Grupo não carregado';

  @override
  String get noFavoritesTitle => 'Nenhum favorito ainda';

  @override
  String get noPhotosTitle => 'Nenhuma foto ainda';

  @override
  String get noFavoritesMessage =>
      'Toque na estrela de uma foto para colocá-la aqui.';

  @override
  String get noPhotosMessage =>
      'Tire a primeira foto. O grupo todo vê na hora.';

  @override
  String get openCamera => 'Abrir a câmera';

  @override
  String savingProgress(int done, int total) {
    return 'Salvando... $done/$total';
  }

  @override
  String get choosePhotos => 'Escolher fotos';

  @override
  String selectedCount(int count) {
    return '$count selecionadas';
  }

  @override
  String get selectNone => 'Desmarcar tudo';

  @override
  String get selectAll => 'Selecionar tudo';

  @override
  String photosWaitingToShare(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotos esperando para serem compartilhadas',
      one: '1 foto esperando para ser compartilhada',
    );
    return '$_temp0';
  }

  @override
  String get recapReadyTitle => 'Sua retrospectiva está pronta';

  @override
  String get recapReadySubtitle => 'Um vídeo com música da viagem de vocês';

  @override
  String get watch => 'Assistir';

  @override
  String get makeRecapNow => 'Criar agora um vídeo retrospectiva';

  @override
  String freeGroupDeleteNotice(String date) {
    return 'Grupo grátis: as fotos ficam até $date. Salve-as ou assine o Pro.';
  }

  @override
  String get filterAll => 'Todas';

  @override
  String get filterFavorites => 'Favoritos';

  @override
  String get filterPerPerson => 'Por pessoa';

  @override
  String get filterPerson => 'Pessoa';

  @override
  String get select => 'Selecionar';

  @override
  String get hiddenFilter => 'Ocultas';

  @override
  String get photosBy => 'Fotos de...';

  @override
  String get uploadedTag => 'enviada';

  @override
  String get saveAll => 'Salvar tudo';

  @override
  String get favorite => 'Favoritar';

  @override
  String get unfavorite => 'Desfavoritar';

  @override
  String get hide => 'Ocultar';

  @override
  String get delete => 'Excluir';

  @override
  String deletePhotosTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Excluir $count fotos?',
      one: 'Excluir a foto?',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Elas vão sumir para todo mundo no grupo. Não dá para desfazer.',
      one: 'Ela vai sumir para todo mundo no grupo. Não dá para desfazer.',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosNotAllowed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count fotos são de outra pessoa. Elas ficam; só um admin pode excluí-las.',
      one: '1 foto é de outra pessoa. Ela fica; só um admin pode excluí-la.',
    );
    return '$_temp0';
  }

  @override
  String photosBackInGroup(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotos voltaram para o grupo',
      one: '1 foto voltou para o grupo',
    );
    return '$_temp0';
  }

  @override
  String get showAll => 'Mostrar tudo';

  @override
  String get hiddenPhotosExplainer =>
      'Só você deixa de ver essas fotos. Para os outros do grupo elas continuam lá.';

  @override
  String get nothingHidden => 'Nada oculto';

  @override
  String get nothingHiddenMessage => 'As fotos que você ocultar aparecem aqui.';

  @override
  String showAgainCount(int count) {
    return 'Mostrar de novo ($count)';
  }

  @override
  String get someone => 'Alguém';

  @override
  String get savedToAlbum => 'Salva no seu álbum de fotos';

  @override
  String get share => 'Compartilhar';

  @override
  String get shareFailed => 'Não deu para compartilhar';

  @override
  String get reportTitle => 'Por que você está denunciando esta foto?';

  @override
  String get reportSubtitle =>
      'Analisamos cada denúncia em até 24 horas. A foto fica oculta para você na hora.';

  @override
  String get reportThanks => 'Valeu, vamos dar uma olhada';

  @override
  String blockMessageAllGroups(String name) {
    return 'Você não verá mais fotos e vídeos de $name em nenhum grupo nem receberá notificações sobre eles. Dá para desfazer nos Ajustes.';
  }

  @override
  String userBlocked(String name) {
    return '$name foi bloqueado';
  }

  @override
  String get videoHiddenForYou => 'Vídeo oculto para você';

  @override
  String get photoHiddenForYou => 'Foto oculta para você';

  @override
  String get setAsCover => 'Usar como capa';

  @override
  String get coverUpdated => 'Capa atualizada';

  @override
  String get hideForMe => 'Ocultar para mim';

  @override
  String get hideForMeSubtitle => 'Os outros do grupo continuam vendo';

  @override
  String get reportPhoto => 'Denunciar foto';

  @override
  String blockName(String name) {
    return 'Bloquear $name';
  }

  @override
  String get forEveryoneInGroup => 'Para todo mundo do grupo';

  @override
  String get videoDeleted => 'Vídeo excluído';

  @override
  String get photoDeleted => 'Foto excluída';

  @override
  String get photoAccessToSave =>
      'Dê ao CamTrip acesso às suas fotos nos Ajustes para salvar';

  @override
  String get phoneFull => 'Seu celular está cheio';

  @override
  String get albumSaveFailedShort => 'Não deu para salvar no seu álbum';

  @override
  String get recapTemplateGoldenHour => 'Golden Hour';

  @override
  String get recapTemplateFast => 'Rápido';

  @override
  String get recapTemplateFilmRoll => 'Filme';

  @override
  String get recapTemplatePolaroid => 'Polaroid';

  @override
  String get trackSummerEvening => 'Fim de tarde de verão';

  @override
  String get trackGoldenHour => 'Golden Hour';

  @override
  String get trackRoadtrip => 'Pé na estrada';

  @override
  String get moodWarm => 'aconchegante';

  @override
  String get moodCheerful => 'animada';

  @override
  String friendsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count amigos',
      one: '1 amigo',
    );
    return '$_temp0';
  }

  @override
  String get madeWithCamTrip => 'Feito com CamTrip';

  @override
  String get tagline => 'Um filme para o grupo todo';

  @override
  String get videoUnsupportedDevice =>
      'Não deu para criar o vídeo neste aparelho';

  @override
  String get groupLoadFailed => 'Não deu para carregar este grupo.';

  @override
  String recapNeedsPhotos(int count) {
    return 'Você precisa de pelo menos $count fotos para uma retrospectiva.';
  }

  @override
  String get recapFailed =>
      'Não deu para criar a retrospectiva. Tente de novo.';

  @override
  String get recapSaved => 'Retrospectiva salva no seu álbum de fotos';

  @override
  String get recap => 'Retrospectiva';

  @override
  String get recapRendering => 'Criando retrospectiva...';

  @override
  String get videoRendering => 'Criando vídeo...';

  @override
  String get template => 'Modelo';

  @override
  String get musicLicense => 'Música própria do CamTrip · livre de direitos';

  @override
  String get change => 'Trocar';

  @override
  String get noWatermark => 'Sem marca d\'água ✓';

  @override
  String get removeWatermarkPro => 'Tire a marca d\'água com o Pro';

  @override
  String get proSourceSubscription => 'Assinatura';

  @override
  String get proSourceGift => 'Presente';

  @override
  String get proSourceAdmin => 'Admin';

  @override
  String get proSourceGroup => 'Pelo grupo';

  @override
  String get noPro => 'Sem Pro';

  @override
  String proStatusNoEnd(String source) {
    return 'Pro ($source), sem data de término';
  }

  @override
  String proStatusUntil(String source, String date) {
    return 'Pro ($source), até $date';
  }

  @override
  String get lifetime => 'Vitalício';

  @override
  String get pickDate => 'Escolher data';

  @override
  String get noAccess => 'Sem acesso';

  @override
  String get adminOnlyTeam => 'A gestão é só para a equipe do CamTrip.';

  @override
  String get adminOverview => 'Visão geral';

  @override
  String get adminUsers => 'Usuários';

  @override
  String get adminReports => 'Denúncias';

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
  String get adminNewThisWeek => 'Novos nesta semana';

  @override
  String get adminGroups => 'Grupos';

  @override
  String get adminProSubscription => 'Pro por assinatura';

  @override
  String get adminProGift => 'Pro de presente';

  @override
  String adminWithoutSubscription(int count) {
    return '$count sem assinatura';
  }

  @override
  String get adminOpenReports => 'Denúncias abertas';

  @override
  String get adminSearchHint => 'Buscar por nome ou e-mail';

  @override
  String get nobodyFound => 'Ninguém encontrado';

  @override
  String get loadMore => 'Carregar mais';

  @override
  String get noEmail => 'Sem e-mail';

  @override
  String adminDeletePhotoMessage(String groupName) {
    return 'A foto some para todo mundo em \"$groupName\". Todas as denúncias desta foto são resolvidas.';
  }

  @override
  String get adminBanMessage =>
      'Esta conta não poderá mais entrar nem usar o app. Dá para desfazer depois.';

  @override
  String get adminDismissTitle => 'Ignorar denúncia?';

  @override
  String get adminDismissMessage =>
      'A foto continua. A denúncia é marcada como resolvida.';

  @override
  String get adminDismiss => 'Ignorar';

  @override
  String get adminAccountBlocked => 'Conta bloqueada';

  @override
  String get adminReportDismissed => 'Denúncia ignorada';

  @override
  String get adminNoReports => 'Nenhuma denúncia aberta';

  @override
  String get adminNoReportsMessage => 'As fotos denunciadas aparecem aqui.';

  @override
  String get deletedTag => 'Excluída';

  @override
  String adminReportedBy(String name) {
    return 'Por $name';
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
      other: '$count denúncias',
      one: '1 denúncia',
    );
    return '$_temp0';
  }

  @override
  String get adminDeletePhoto => 'Excluir foto';

  @override
  String get adminBlockCreator => 'Bloquear autor';

  @override
  String get loadFailed => 'Não deu para carregar';

  @override
  String get adminLifetimeProGiven => 'Pro vitalício concedido';

  @override
  String get adminProGiven => 'Pro concedido';

  @override
  String adminGiveProUntil(String date) {
    return 'Dar Pro até $date';
  }

  @override
  String get adminGiveProLifetime => 'Dar Pro vitalício';

  @override
  String adminGiveProFor(String period) {
    return 'Dar Pro por $period';
  }

  @override
  String get adminReasonHint => 'Motivo, ex.: amigo, tester, influencer';

  @override
  String get adminGivePro => 'Dar Pro';

  @override
  String get adminRevokeTitle => 'Revogar presente?';

  @override
  String get adminRevokeMessage =>
      'O Pro de presente termina na hora. Uma assinatura própria continua normalmente.';

  @override
  String get adminRevoke => 'Revogar';

  @override
  String get adminGiftRevoked => 'Presente revogado';

  @override
  String get adminUnbanTitle => 'Remover bloqueio?';

  @override
  String adminUnbanMessage(String name) {
    return '$name poderá entrar de novo.';
  }

  @override
  String get adminUnbanned => 'Bloqueio removido';

  @override
  String get adminBanUserMessage =>
      'Esta conta não poderá mais entrar nem usar o app. As fotos continuam.';

  @override
  String get adminUser => 'Usuário';

  @override
  String get adminNotVerified => 'não confirmado';

  @override
  String get adminRole => 'Função';

  @override
  String get adminCreated => 'Criado em';

  @override
  String get unknown => 'Desconhecido';

  @override
  String get adminSignInWith => 'Entra com';

  @override
  String get adminEmailMethod => 'E-mail';

  @override
  String get adminPhotosAndVideos => 'Fotos e vídeos';

  @override
  String get adminStatus => 'Status';

  @override
  String get adminActive => 'Ativa';

  @override
  String adminActiveUntil(String date) {
    return 'Ativa até $date';
  }

  @override
  String adminGiftFrom(String name) {
    return 'Presente de $name';
  }

  @override
  String adminExpiredOn(String date) {
    return 'Expirou em $date';
  }

  @override
  String get adminExpired => 'Expirado';

  @override
  String adminUntil(String date) {
    return 'Até $date';
  }

  @override
  String get adminGiveProTitle => 'Dar Pro';

  @override
  String get adminGiveProNote =>
      'Também vale para os grupos dessa pessoa: um Pro no grupo = Pro para todo mundo do grupo.';

  @override
  String get adminRevokeGift => 'Revogar presente';

  @override
  String get adminModeration => 'Moderação';

  @override
  String get adminCannotBanSelf => 'Você não pode bloquear a si mesmo.';

  @override
  String get adminCannotBanAdmin => 'Um admin não pode ser bloqueado.';

  @override
  String get adminUnban => 'Remover bloqueio';

  @override
  String get adminBanAccount => 'Bloquear conta';

  @override
  String get googleSignInUnavailable =>
      'Entrar com o Google ainda não está disponível';
}
