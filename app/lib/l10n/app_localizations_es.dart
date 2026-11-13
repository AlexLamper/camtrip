// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get cancel => 'Cancelar';

  @override
  String get yes => 'Sí';

  @override
  String inviteMessageIntro(String groupName) {
    return '¿Te unes a «$groupName» en CamTrip? Así vemos las fotos de todos al instante.';
  }

  @override
  String inviteMessageCode(String code) {
    return 'O introduce el código: $code';
  }

  @override
  String get memberFallbackName => 'Amigo';

  @override
  String get reportReasonInappropriate => 'Inapropiado u ofensivo';

  @override
  String get reportReasonSpam => 'Spam';

  @override
  String get reportReasonOther => 'Otra cosa';

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
  String get errorOffline => 'Sin conexión. Inténtalo de nuevo en un momento.';

  @override
  String errorSomethingWrongStatus(int status) {
    return 'Algo salió mal ($status)';
  }

  @override
  String get errorSomethingWrong => 'Algo salió mal';

  @override
  String get apiInvalidCredentials =>
      'El correo o la contraseña no son correctos';

  @override
  String get apiInvalidCode =>
      'Este código no es correcto o ha caducado. Pide un código nuevo.';

  @override
  String get apiEmailTaken =>
      'Ya existe una cuenta con este correo. Inicia sesión o elige «¿Olvidaste tu contraseña?».';

  @override
  String apiEmailTakenProvider(String provider) {
    return 'Ya existe una cuenta con este correo. Inicia sesión con $provider.';
  }

  @override
  String apiWeakPassword(int min) {
    return 'Elige una contraseña de al menos $min caracteres';
  }

  @override
  String apiNameTooLong(int max) {
    return 'Tu nombre puede tener como máximo $max caracteres';
  }

  @override
  String get apiRateLimited =>
      'Demasiados intentos. Vuelve a intentarlo en un cuarto de hora.';

  @override
  String apiAccountBanned(String email) {
    return 'Tu cuenta ha sido bloqueada. Escribe a $email si crees que es un error.';
  }

  @override
  String get apiProRequired => 'Este estilo de cámara es de CamTrip Pro';

  @override
  String get apiGroupClosed => 'Este grupo está cerrado';

  @override
  String get apiGroupCodeNotFound => 'No hay ningún grupo con este código';

  @override
  String apiGroupFull(int max) {
    return 'Este grupo está lleno (máx. $max miembros). Si un miembro tiene CamTrip Pro, puede unirse gente sin límite.';
  }

  @override
  String get apiLastMember => 'Eres el último miembro. Mejor elimina el grupo.';

  @override
  String get apiAdminRequired => 'Solo para administradores de CamTrip';

  @override
  String get apiUploadIncomplete => 'La subida no está completa';

  @override
  String get apiInvalidInput => 'Datos no válidos';

  @override
  String get apiNotSignedIn => 'No has iniciado sesión';

  @override
  String get apiAccountGone => 'Esta cuenta ya no existe';

  @override
  String get apiPhotoNotFound => 'Foto no encontrada';

  @override
  String get apiGroupNotFound => 'Grupo no encontrado';

  @override
  String get apiMemberNotFound => 'Miembro no encontrado';

  @override
  String get apiPersonNotFound => 'Persona no encontrada';

  @override
  String get apiUserNotFound => 'Usuario no encontrado';

  @override
  String get apiAdminOnly => 'Solo un admin puede hacer esto';

  @override
  String get apiCannotBlockSelf => 'No puedes bloquearte a ti mismo';

  @override
  String get apiCannotReportOwn => 'No puedes denunciar tu propia foto';

  @override
  String get apiDeleteOwnOnly => 'Solo puedes eliminar tus propias fotos';

  @override
  String get apiOwnerCannotBeRemoved =>
      'Quien creó el grupo no puede ser eliminado';

  @override
  String get apiOwnerStaysAdmin => 'Quien creó el grupo sigue siendo admin';

  @override
  String get apiNeedsOneAdmin => 'Un grupo necesita al menos un admin';

  @override
  String get apiEndBeforeStart => 'La fecha de fin es anterior a la de inicio';

  @override
  String get apiPermanentNoEndDate =>
      'Un grupo siempre abierto no tiene fecha de fin';

  @override
  String get apiCannotBanAdmin => 'Un administrador no se puede bloquear';

  @override
  String get apiReportNotFound => 'Denuncia no encontrada';

  @override
  String get apiPhotoOwnerUnknown => 'Ya no se sabe quién hizo esta foto';

  @override
  String get validationNameRequired => 'Escribe tu nombre';

  @override
  String validationMaxChars(int max) {
    return 'Máximo $max caracteres';
  }

  @override
  String get validationEmailRequired => 'Escribe tu correo electrónico';

  @override
  String get validationEmailInvalid => 'Este correo no es válido';

  @override
  String get validationPasswordRequired => 'Elige una contraseña';

  @override
  String validationMinChars(int min) {
    return 'Al menos $min caracteres';
  }

  @override
  String get validationPasswordTooLong => 'Esta contraseña es demasiado larga';

  @override
  String get validationPasswordEmpty => 'Escribe tu contraseña';

  @override
  String get validationCodeRequired => 'Introduce el código del correo';

  @override
  String get validationCodeDigits => 'El código tiene 6 cifras';

  @override
  String get onboarding1Title => 'Un carrete\npara todo el grupo.';

  @override
  String get onboarding1Body =>
      'Dispara con una cámara retro. Todos ven tus fotos al instante, y también aparecen en tu propio álbum.';

  @override
  String get onboarding2Title => 'Olvídate de\nreenviar fotos.';

  @override
  String get onboarding2Body =>
      'Crea un grupo, comparte el código y listo. Nunca más «¿me pasas esas fotos?»';

  @override
  String get onboarding3Title => 'Después, un\nvídeo resumen.';

  @override
  String get onboarding3Body =>
      'CamTrip crea un vídeo con música de vuestros mejores momentos.';

  @override
  String get onboardingInvited =>
      '¡Te han invitado! Inicia sesión para unirte.';

  @override
  String get signInAppleFailed => 'No se pudo iniciar sesión con Apple';

  @override
  String get signInGoogleFailed => 'No se pudo iniciar sesión con Google';

  @override
  String get signInFailed => 'No se pudo iniciar sesión';

  @override
  String get next => 'Siguiente';

  @override
  String get legalPrefix => 'Al continuar, aceptas los ';

  @override
  String get legalTerms => 'términos';

  @override
  String get legalAnd => ' y la ';

  @override
  String get legalPrivacy => 'política de privacidad';

  @override
  String get legalSuffix => '.';

  @override
  String get continueWithApple => 'Continuar con Apple';

  @override
  String get continueWithGoogle => 'Continuar con Google';

  @override
  String get createAccount => 'Crear cuenta';

  @override
  String get signIn => 'Iniciar sesión';

  @override
  String get or => 'o';

  @override
  String get registerSubtitle => 'Así tus amigos ven quién hace las fotos.';

  @override
  String get loginSubtitle => 'Hola de nuevo.';

  @override
  String get forgotPasswordTitle => 'Contraseña olvidada';

  @override
  String get forgotPasswordPushSubtitle =>
      '¿Sigues con la sesión iniciada en algún dispositivo? Te enviaremos allí un código de 6 dígitos por notificación para crear una contraseña nueva.';

  @override
  String get newPassword => 'Contraseña nueva';

  @override
  String get resetPushInfo =>
      'Si sigues con la sesión iniciada en algún dispositivo, recibirás allí una notificación con un código. ¿No puedes entrar? Inicia sesión con Apple o Google con el mismo correo electrónico - tu cuenta se vinculará.';

  @override
  String get sendCode => 'Enviar código';

  @override
  String get savePassword => 'Guardar contraseña';

  @override
  String get errorTryAgain => 'Algo salió mal. Inténtalo de nuevo.';

  @override
  String get back => 'Atrás';

  @override
  String get name => 'Nombre';

  @override
  String get email => 'Correo electrónico';

  @override
  String get codeFromPush => 'Código de la notificación';

  @override
  String get password => 'Contraseña';

  @override
  String get hidePassword => 'Ocultar contraseña';

  @override
  String get showPassword => 'Mostrar contraseña';

  @override
  String get forgotPasswordLink => '¿Olvidaste tu contraseña?';

  @override
  String get haveAccount => '¿Ya tienes cuenta?';

  @override
  String get newToCamTrip => '¿Nuevo en CamTrip?';

  @override
  String get rememberedIt => '¿Ya te acuerdas?';

  @override
  String get noCodeReceived => '¿No te ha llegado el código?';

  @override
  String get resendCode => 'Reenviar';

  @override
  String onboardingDemoRoll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotógrafos, 1 carrete',
      one: '1 fotógrafo, 1 carrete',
    );
    return '$_temp0';
  }

  @override
  String membersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count miembros',
      one: '1 miembro',
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
  String get justNow => 'ahora';

  @override
  String get badgeNew => 'Nuevo';

  @override
  String recapTitle(String groupName) {
    return 'Resumen $groupName';
  }

  @override
  String get styleFilm => 'Film';

  @override
  String get styleInstant => 'Instant';

  @override
  String get styleDisposable => 'Desechable';

  @override
  String get styleBw => 'B/N';

  @override
  String get styleGolden => 'Golden';

  @override
  String get styleChrome => 'Chrome';

  @override
  String get styleFilmDescription =>
      'Colores cálidos, grano y fecha naranja impresa';

  @override
  String get styleInstantDescription => 'Colores suaves y un marco blanco';

  @override
  String get styleDisposableDescription =>
      'Flash fuerte, viñeta y fugas de luz';

  @override
  String get styleBwDescription =>
      'Blanco y negro granulado con contraste profundo';

  @override
  String get styleGoldenDescription =>
      'Siempre hora dorada, un suave brillo dorado';

  @override
  String get styleChromeDescription =>
      'Frío, saturado y nítido, como una diapositiva';

  @override
  String get shutterStopRecording => 'Detener grabación';

  @override
  String get shutterStartRecording => 'Empezar a grabar vídeo';

  @override
  String get shutterTakePhoto => 'Hacer foto';

  @override
  String get modePhoto => 'Foto';

  @override
  String get modeVideo => 'Vídeo';

  @override
  String get cameraNotFound => 'No se encontró ninguna cámara';

  @override
  String get cameraAccessNeeded =>
      'CamTrip necesita acceso a tu cámara. Actívalo en Ajustes.';

  @override
  String get cameraStartFailed => 'La cámara no pudo iniciarse';

  @override
  String get albumAccessNeeded =>
      'Da acceso a tus fotos a CamTrip para guardarlas también en tu álbum';

  @override
  String get albumSaveFailed =>
      'No se pudo guardar en tu álbum. La foto se comparte igualmente.';

  @override
  String styleProFallback(String style) {
    return 'Este estilo es de Pro. En este grupo disparas con $style.';
  }

  @override
  String get photoFailed => 'No se pudo hacer la foto. Inténtalo de nuevo.';

  @override
  String get recordingFailed => 'No se pudo grabar el vídeo';

  @override
  String get videoFailed => 'No se pudo crear el vídeo. Inténtalo de nuevo.';

  @override
  String get shootInGroup => 'Disparar en el grupo';

  @override
  String get close => 'Cerrar';

  @override
  String get flash => 'Flash';

  @override
  String get flashOn => 'Sí';

  @override
  String get flashOff => 'No';

  @override
  String get flashAuto => 'Auto';

  @override
  String get chooseGroup => 'Elegir grupo';

  @override
  String get switchCamera => 'Cambiar cámara';

  @override
  String get createOrJoinFirst => 'Primero crea un grupo o únete a uno';

  @override
  String get proViaGroup => 'Pro gracias al grupo';

  @override
  String proViaName(String name) {
    return 'Pro gracias a $name';
  }

  @override
  String get proStylesFreeViaMember =>
      'Los estilos Pro de este grupo son gratis para ti gracias a un miembro Pro';

  @override
  String proStylesFreeViaName(String name) {
    return 'Estilos Pro en este grupo: gratis para ti gracias a $name';
  }

  @override
  String get subscriptionsUnavailable =>
      'Las suscripciones no están disponibles ahora. Inténtalo más tarde.';

  @override
  String get paymentPending =>
      'Tu pago aún se está procesando. Pro se activará en cuanto termine.';

  @override
  String get purchaseFailed =>
      'No se pudo completar la compra. Inténtalo más tarde.';

  @override
  String get restoreUnavailable =>
      'Ahora no se pueden restaurar las compras. Inténtalo más tarde.';

  @override
  String get restoreFailed => 'No se pudo restaurar. Inténtalo más tarde.';

  @override
  String get welcomePro => '¡Bienvenido a CamTrip Pro! 🎉';

  @override
  String get proRestored => 'Pro se ha restaurado';

  @override
  String get noPurchaseFound => 'No se encontró ninguna compra anterior';

  @override
  String periodDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count días',
      one: '1 día',
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
      one: '1 mes',
    );
    return '$_temp0';
  }

  @override
  String periodYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count años',
      one: '1 año',
    );
    return '$_temp0';
  }

  @override
  String get paywallHavePro => 'Tienes CamTrip Pro';

  @override
  String get paywallSubtitle => 'Todo para tu próximo viaje.';

  @override
  String paywallFeatureStyles(String styles) {
    return 'Todos los estilos de cámara ($styles)';
  }

  @override
  String get paywallFeatureUnlimited =>
      'Miembros y almacenamiento ilimitados, las fotos se guardan para siempre';

  @override
  String get paywallFeatureNoWatermark => 'Resúmenes sin marca de agua';

  @override
  String get paywallFeatureOriginal => 'Descarga en calidad original';

  @override
  String get planYear => 'Año';

  @override
  String get planMonth => 'Mes';

  @override
  String pricePerMonth(String price) {
    return '$price al mes';
  }

  @override
  String paywallSaveBadge(int percent) {
    return 'AHORRA $percent %';
  }

  @override
  String get planMonthCancelAnytime => 'cancela cuando quieras';

  @override
  String tryFree(String period) {
    return 'Prueba $period gratis';
  }

  @override
  String get becomePro => 'Hazte Pro';

  @override
  String get subscriptionsLoadFailed =>
      'No se pudieron cargar las suscripciones. Comprueba tu conexión.';

  @override
  String legalAnnual(String price) {
    return 'Suscripción anual a CamTrip Pro: $price al año.';
  }

  @override
  String legalAnnualTrial(String period, String price) {
    return 'Suscripción anual a CamTrip Pro: $period gratis y después $price al año.';
  }

  @override
  String legalMonthly(String price) {
    return 'Suscripción mensual a CamTrip Pro: $price al mes.';
  }

  @override
  String legalMonthlyTrial(String period, String price) {
    return 'Suscripción mensual a CamTrip Pro: $period gratis y después $price al mes.';
  }

  @override
  String get legalBillingApple =>
      'El pago se carga a tu Apple ID. La suscripción se renueva automáticamente salvo que la canceles al menos 24 horas antes de que termine el periodo. Puedes cancelarla y gestionarla en los ajustes de tu cuenta de App Store.';

  @override
  String get legalBillingGoogle =>
      'El pago se carga a tu cuenta de Google. La suscripción se renueva automáticamente salvo que la canceles al menos 24 horas antes de que termine el periodo. Puedes cancelarla y gestionarla en los ajustes de tu cuenta de Google Play.';

  @override
  String get restorePurchases => 'Restaurar compras';

  @override
  String get terms => 'Términos';

  @override
  String get privacy => 'Privacidad';

  @override
  String get groupProTitle => 'Un Pro en el grupo = Pro para todo el grupo';

  @override
  String get groupProBody =>
      'Si una persona tiene Pro, todo el grupo obtiene todos los estilos de cámara, miembros ilimitados, fotos que se conservan, calidad original y resúmenes sin marca de agua.';

  @override
  String get groupCreated => 'Grupo creado ✓';

  @override
  String get inviteFriends => 'Invita a tus amigos';

  @override
  String get codeCopied => 'Código copiado';

  @override
  String get shareLink => 'Compartir enlace';

  @override
  String inviteSubject(String groupName) {
    return 'Únete a $groupName en CamTrip';
  }

  @override
  String inviteMembersUnlimited(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count miembros',
      one: '1 miembro',
    );
    return '$_temp0 · ilimitado (Pro)';
  }

  @override
  String inviteMembersLimit(int count, int limit) {
    return '$count de $limit miembros · Pro: ilimitado';
  }

  @override
  String get toCamera => 'Ir a la cámara';

  @override
  String get done => 'Listo';

  @override
  String get joinEnterCode => 'Introduce el código de 6 caracteres';

  @override
  String get joinGroupTitle => 'Unirse a un grupo';

  @override
  String get joinGroupSubtitle =>
      'Introduce el código de tus amigos o escanea su código QR.';

  @override
  String get typeCode => 'Escribir código';

  @override
  String get scanQr => 'Escanear QR';

  @override
  String get join => 'Unirse';

  @override
  String get groupNameRequired => 'Ponle un nombre a tu grupo';

  @override
  String get newGroup => 'Nuevo grupo';

  @override
  String get groupType => 'Tipo de grupo';

  @override
  String get groupTypeVacation => 'Vacaciones';

  @override
  String get groupTypeVacationDescription =>
      'Con fecha de inicio y fin, luego al archivo';

  @override
  String get groupTypeEvent => 'Evento';

  @override
  String get groupTypeEventDescription =>
      'Un día o una noche, p. ej. una fiesta';

  @override
  String get groupTypePermanent => 'Siempre abierto';

  @override
  String get groupTypePermanentDescription =>
      'Para tu grupo de amigos de siempre';

  @override
  String get date => 'Fecha';

  @override
  String get departure => 'Salida';

  @override
  String get returnDate => 'Vuelta';

  @override
  String get defaultCameraStyle => 'Estilo de cámara predeterminado';

  @override
  String freeLimitPermanent(int max) {
    return 'Gratis: hasta $max miembros. Ilimitado con Pro.';
  }

  @override
  String freeLimitDated(int max, int days) {
    return 'Gratis: hasta $max miembros, las fotos se guardan hasta $days días después de la fecha de fin. Ilimitado y para siempre con Pro.';
  }

  @override
  String get createGroup => 'Crear grupo';

  @override
  String get group => 'Grupo';

  @override
  String groupCode(String code) {
    return 'código $code';
  }

  @override
  String get manage => 'Gestión';

  @override
  String get rename => 'Cambiar nombre';

  @override
  String get changeDates => 'Cambiar fechas';

  @override
  String get finishTrip => 'Terminar viaje';

  @override
  String get finishTripSubtitle => 'Pone la fecha de fin en hoy';

  @override
  String get reopenGroup => 'Reabrir grupo';

  @override
  String get closeGroup => 'Cerrar grupo';

  @override
  String get reopenGroupSubtitle => 'Los miembros pueden volver a añadir fotos';

  @override
  String get closeGroupSubtitle =>
      'Nadie puede añadir más fotos; todo se puede seguir viendo';

  @override
  String get members => 'Miembros';

  @override
  String memberYou(String name) {
    return '$name (tú)';
  }

  @override
  String get blockedTag => 'bloqueado';

  @override
  String get adminTag => 'admin';

  @override
  String removeMemberTitle(String name) {
    return '¿Quitar a $name?';
  }

  @override
  String get removeMemberMessage => 'Sus fotos se quedan en el grupo.';

  @override
  String get remove => 'Eliminar';

  @override
  String get removeMember => 'Quitar';

  @override
  String blockTitle(String name) {
    return '¿Bloquear a $name?';
  }

  @override
  String blockMessage(String name) {
    return 'Ya no verás fotos ni vídeos de $name ni recibirás notificaciones sobre ellos. Puedes deshacerlo en Ajustes.';
  }

  @override
  String get block => 'Bloquear';

  @override
  String get makeMember => 'Hacer miembro normal';

  @override
  String get makeAdmin => 'Hacer admin';

  @override
  String get removeFromGroup => 'Quitar del grupo';

  @override
  String get unblock => 'Desbloquear';

  @override
  String get inviteFriendsButton => 'Invitar amigos';

  @override
  String get you => 'Tú';

  @override
  String get unarchive => 'Sacar del archivo';

  @override
  String get archive => 'Archivar';

  @override
  String get unarchiveSubtitle => 'El grupo vuelve a estar entre tus álbumes';

  @override
  String archiveSubtitle(String section) {
    return 'Solo para ti: el grupo pasa a «$section» al final de tus álbumes';
  }

  @override
  String get archivedSection => 'Archivados';

  @override
  String get hiddenPhotos => 'Fotos ocultas';

  @override
  String get hiddenPhotosSubtitle => 'Fotos que has ocultado para ti';

  @override
  String get leaveGroup => 'Salir del grupo';

  @override
  String get leaveGroupSubtitle =>
      'Tus fotos se quedan en el grupo para los demás';

  @override
  String get deleteGroup => 'Eliminar grupo';

  @override
  String get deleteGroupSubtitle => 'Todas las fotos se eliminan para todos';

  @override
  String groupArchived(String groupName) {
    return '«$groupName» archivado';
  }

  @override
  String groupUnarchived(String groupName) {
    return '«$groupName» vuelve a estar entre tus álbumes';
  }

  @override
  String get undo => 'Deshacer';

  @override
  String get groupNameTitle => 'Nombre del grupo';

  @override
  String get finishTripTitle => '¿Terminar el viaje?';

  @override
  String get finishTripMessage =>
      'La fecha de fin pasa a ser hoy. Aún puedes añadir fotos; el resumen está listo.';

  @override
  String get finishTripConfirm => 'Terminar';

  @override
  String get tripFinished => 'Viaje terminado';

  @override
  String leaveGroupTitle(String groupName) {
    return '¿Salir de «$groupName»?';
  }

  @override
  String get leaveGroupMessage =>
      'Tus fotos se quedan en el grupo para los demás. Puedes volver a unirte más tarde con el código.';

  @override
  String get leave => 'Salir';

  @override
  String groupDeleted(String groupName) {
    return '«$groupName» se ha eliminado';
  }

  @override
  String get youAreAdmin => 'eres admin';

  @override
  String get open => 'Abrir';

  @override
  String get archiveMenuSubtitle => 'Solo para ti, los demás no lo notan';

  @override
  String get deleteGroupMenuSubtitle => 'Para todos, con todas las fotos';

  @override
  String get deleteGroupTitle => '¿Eliminar el grupo?';

  @override
  String deleteGroupMessage(int count, String groupName, int memberCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Las $count fotos y vídeos',
      one: 'La foto o el vídeo',
    );
    String _temp1 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'desaparecerán',
      one: 'desaparecerá',
    );
    String _temp2 = intl.Intl.pluralLogic(
      memberCount,
      locale: localeName,
      other: 'los $memberCount miembros',
      one: 'el único miembro',
    );
    return '$_temp0 de «$groupName» $_temp1 para $_temp2. Esto no se puede deshacer.';
  }

  @override
  String get deleteGroupOwnRoll => 'Tu propio carrete no cambia.';

  @override
  String get deleteGroupTypeName =>
      'Escribe el nombre del grupo para confirmar:';

  @override
  String get deleteForEveryone => 'Eliminar para todos';

  @override
  String get save => 'Guardar';

  @override
  String get yourAlbums => 'Tus álbumes';

  @override
  String get uploadQueue => 'Cola de subida';

  @override
  String get noConnection => 'Sin conexión';

  @override
  String get albumsOfflineMessage =>
      'Tus álbumes se cargarán cuando vuelvas a tener internet. La cámara funciona igualmente.';

  @override
  String get retry => 'Reintentar';

  @override
  String get noAlbumsTitle => 'Aún no hay álbumes';

  @override
  String get noAlbumsMessage =>
      'Crea un grupo para tu próximo viaje o únete al de un amigo con su código.';

  @override
  String get haveCode => 'Tengo un código';

  @override
  String get joinWithCode => 'Unirse con un código o código QR';

  @override
  String get camera => 'Cámara';

  @override
  String get restore => 'Restaurar';

  @override
  String get more => 'Más';

  @override
  String get newAlbum => 'Nuevo';

  @override
  String get closedTag => 'cerrado';

  @override
  String get activeTag => 'activo';

  @override
  String get uploadFailed => 'Error al subir';

  @override
  String get queueNoSignal => 'Sin cobertura.';

  @override
  String get queueNoSignalMessage =>
      'Tus fotos ya están en tu álbum y se compartirán en cuanto vuelvas a tener internet.';

  @override
  String get queueWaitingForWifi => 'Esperando wifi.';

  @override
  String queueWifiOnlyOn(String setting) {
    return 'Tienes activado «$setting».';
  }

  @override
  String get queueVideosWifiOnly => 'Los vídeos solo se suben por wifi.';

  @override
  String get queueAllShared => 'Todo compartido ✓';

  @override
  String queuePending(String items) {
    return '$items pendientes de compartir';
  }

  @override
  String queuePendingBoth(String photos, String videos) {
    return '$photos y $videos pendientes de compartir';
  }

  @override
  String get retryUpload => 'Reintentar';

  @override
  String get removeFromQueue => 'Quitar de la cola';

  @override
  String get queueStatusWifi => 'wifi';

  @override
  String get queueStatusWaiting => 'en espera';

  @override
  String get videosWifiOnlyTitle => 'Vídeos solo por wifi';

  @override
  String get videosWifiOnlySubtitle => 'Ahorra datos móviles';

  @override
  String get retryNow => 'Reintentar ahora';

  @override
  String get yourName => 'Tu nombre';

  @override
  String get settings => 'Ajustes';

  @override
  String get tapToChangeName => 'Toca para cambiar tu nombre';

  @override
  String get getCamTripPro => 'Hazte CamTrip Pro';

  @override
  String get photos => 'Fotos';

  @override
  String get saveOwnPhotos => 'Guardar mis fotos en un álbum por grupo';

  @override
  String get autoSaveOthers => 'Guardar automáticamente las fotos de los demás';

  @override
  String get wifiOnlyTitle => 'Subir solo por wifi';

  @override
  String get dateStamp => 'Fecha impresa';

  @override
  String get notifications => 'Notificaciones';

  @override
  String get notifyNewPhotos => 'Fotos nuevas (agrupadas)';

  @override
  String get notifyRecapReady => 'Resumen listo';

  @override
  String get camTripTeam => 'Equipo CamTrip';

  @override
  String get adminEntrySubtitle => 'Usuarios, regalar Pro, denuncias y cifras';

  @override
  String get account => 'Cuenta';

  @override
  String get manageSubscription => 'Gestionar suscripción';

  @override
  String get blockedPeople => 'Personas bloqueadas';

  @override
  String get nobody => 'Nadie';

  @override
  String peopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count personas',
      one: '1 persona',
    );
    return '$_temp0';
  }

  @override
  String get privacyPolicy => 'Política de privacidad';

  @override
  String get contact => 'Contacto';

  @override
  String get signOut => 'Cerrar sesión';

  @override
  String get deleteAccount => 'Eliminar cuenta';

  @override
  String get deleteAccountSubtitle => 'Elimina tu cuenta y todas tus fotos';

  @override
  String get deleteAccountTitle => '¿Eliminar la cuenta?';

  @override
  String get deleteAccountMessage =>
      'Se eliminarán tu cuenta y todas tus fotos y vídeos, también de los grupos. Una suscripción activa se cancela en App Store o Google Play.';

  @override
  String get blockedTitle => 'Bloqueados';

  @override
  String get blockedSubtitle => 'No ves fotos de estas personas.';

  @override
  String get blockedNone => 'No has bloqueado a nadie.';

  @override
  String get unblockShort => 'Desbloquear';

  @override
  String get groupGone => 'Este grupo ya no existe o ya no eres miembro.';

  @override
  String photosSavedToAlbum(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotos guardadas en «$album»',
      one: '1 foto guardada en «$album»',
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
    return '$_temp0, $skipped omitidas';
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
  String get addedToFavorites => 'Añadida a favoritos';

  @override
  String get removedFromFavorites => 'Quitada de favoritos';

  @override
  String get photoAccessSettings =>
      'Da acceso a tus fotos a CamTrip en Ajustes';

  @override
  String photosBeingAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Añadiendo $count fotos',
      one: 'Añadiendo 1 foto',
    );
    return '$_temp0';
  }

  @override
  String photosUnreadable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'No se pudieron leer $count fotos',
      one: 'No se pudo leer 1 foto',
    );
    return '$_temp0';
  }

  @override
  String get groupNotLoaded => 'Grupo no cargado';

  @override
  String get noFavoritesTitle => 'Aún no hay favoritos';

  @override
  String get noPhotosTitle => 'Aún no hay fotos';

  @override
  String get noFavoritesMessage =>
      'Toca la estrella de una foto para tenerla aquí.';

  @override
  String get noPhotosMessage =>
      'Haz la primera foto. Todo el grupo la ve al instante.';

  @override
  String get openCamera => 'Abrir la cámara';

  @override
  String savingProgress(int done, int total) {
    return 'Guardando... $done/$total';
  }

  @override
  String get sharePreparing => 'Preparando...';

  @override
  String sharingProgress(int done, int total) {
    return 'Preparando... $done/$total';
  }

  @override
  String get choosePhotos => 'Elegir fotos';

  @override
  String selectedCount(int count) {
    return '$count seleccionadas';
  }

  @override
  String get selectNone => 'No seleccionar nada';

  @override
  String get selectAll => 'Seleccionar todo';

  @override
  String photosWaitingToShare(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotos pendientes de compartir',
      one: '1 foto pendiente de compartir',
    );
    return '$_temp0';
  }

  @override
  String get recapReadyTitle => 'Tu resumen está listo';

  @override
  String get recapReadySubtitle => 'Un vídeo con música de vuestro viaje';

  @override
  String get watch => 'Ver';

  @override
  String get makeRecapNow => 'Crear un vídeo resumen ahora';

  @override
  String freeGroupDeleteNotice(String date) {
    return 'Grupo gratis: las fotos se guardan hasta el $date. Guárdalas o hazte Pro.';
  }

  @override
  String get filterAll => 'Todas';

  @override
  String get filterFavorites => 'Favoritos';

  @override
  String get filterPerPerson => 'Por persona';

  @override
  String get filterPerson => 'Persona';

  @override
  String get select => 'Seleccionar';

  @override
  String get hiddenFilter => 'Ocultas';

  @override
  String get photosBy => 'Fotos de...';

  @override
  String get uploadedTag => 'subida';

  @override
  String get saveAll => 'Guardar todo';

  @override
  String get favorite => 'Favorito';

  @override
  String get unfavorite => 'Quitar favorito';

  @override
  String get hide => 'Ocultar';

  @override
  String get delete => 'Eliminar';

  @override
  String deletePhotosTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '¿Eliminar $count fotos?',
      one: '¿Eliminar la foto?',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Desaparecerán para todo el grupo. Esto no se puede deshacer.',
      one: 'Desaparecerá para todo el grupo. Esto no se puede deshacer.',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosNotAllowed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count fotos son de otra persona. Se quedan; solo un admin puede eliminarlas.',
      one:
          '1 foto es de otra persona. Se queda; solo un admin puede eliminarla.',
    );
    return '$_temp0';
  }

  @override
  String photosBackInGroup(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotos vuelven a estar en el grupo',
      one: '1 foto vuelve a estar en el grupo',
    );
    return '$_temp0';
  }

  @override
  String get showAll => 'Mostrar todo';

  @override
  String get hiddenPhotosExplainer =>
      'Solo tú dejas de ver estas fotos. Para el resto del grupo siguen ahí.';

  @override
  String get nothingHidden => 'Nada oculto';

  @override
  String get nothingHiddenMessage => 'Las fotos que ocultes aparecerán aquí.';

  @override
  String showAgainCount(int count) {
    return 'Volver a mostrar ($count)';
  }

  @override
  String get someone => 'Alguien';

  @override
  String get savedToAlbum => 'Guardada en tu álbum de fotos';

  @override
  String get share => 'Compartir';

  @override
  String get shareFailed => 'No se pudo compartir';

  @override
  String get reportTitle => '¿Por qué denuncias esta foto?';

  @override
  String get reportSubtitle =>
      'Revisamos cada denuncia en 24 horas. La foto se oculta para ti al momento.';

  @override
  String get reportThanks => 'Gracias, lo revisaremos';

  @override
  String blockMessageAllGroups(String name) {
    return 'Ya no verás fotos ni vídeos de $name en ningún grupo ni recibirás notificaciones sobre ellos. Puedes deshacerlo en Ajustes.';
  }

  @override
  String userBlocked(String name) {
    return '$name ha sido bloqueado';
  }

  @override
  String get videoHiddenForYou => 'Vídeo oculto para ti';

  @override
  String get photoHiddenForYou => 'Foto oculta para ti';

  @override
  String get setAsCover => 'Usar como portada';

  @override
  String get coverUpdated => 'Portada actualizada';

  @override
  String get hideForMe => 'Ocultar para mí';

  @override
  String get hideForMeSubtitle => 'Los demás del grupo la siguen viendo';

  @override
  String get reportPhoto => 'Denunciar foto';

  @override
  String blockName(String name) {
    return 'Bloquear a $name';
  }

  @override
  String get forEveryoneInGroup => 'Para todo el grupo';

  @override
  String get videoDeleted => 'Vídeo eliminado';

  @override
  String get photoDeleted => 'Foto eliminada';

  @override
  String get photoAccessToSave =>
      'Da acceso a tus fotos a CamTrip en Ajustes para poder guardar';

  @override
  String get phoneFull => 'Tu móvil está lleno';

  @override
  String get albumSaveFailedShort => 'No se pudo guardar en tu álbum';

  @override
  String get recapTemplateGoldenHour => 'Golden Hour';

  @override
  String get recapTemplateFast => 'Rápido';

  @override
  String get recapTemplateFilmRoll => 'Carrete';

  @override
  String get recapTemplatePolaroid => 'Polaroid';

  @override
  String get trackSummerEvening => 'Tarde de verano';

  @override
  String get trackGoldenHour => 'Golden Hour';

  @override
  String get trackRoadtrip => 'Road trip';

  @override
  String get moodWarm => 'cálida';

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
  String get madeWithCamTrip => 'Hecho con CamTrip';

  @override
  String get tagline => 'Un carrete para todo el grupo';

  @override
  String get videoUnsupportedDevice =>
      'No se pudo crear el vídeo en este dispositivo';

  @override
  String get groupLoadFailed => 'No se pudo cargar este grupo.';

  @override
  String recapNeedsPhotos(int count) {
    return 'Necesitas al menos $count fotos para un resumen.';
  }

  @override
  String get recapFailed => 'No se pudo crear el resumen. Inténtalo de nuevo.';

  @override
  String get recapSaved => 'Resumen guardado en tu álbum de fotos';

  @override
  String get recap => 'Resumen';

  @override
  String get recapRendering => 'Creando resumen...';

  @override
  String get videoRendering => 'Creando vídeo...';

  @override
  String get template => 'Plantilla';

  @override
  String get musicLicense => 'Música propia de CamTrip · libre de derechos';

  @override
  String get change => 'Cambiar';

  @override
  String get noWatermark => 'Sin marca de agua ✓';

  @override
  String get removeWatermarkPro => 'Quita la marca de agua con Pro';

  @override
  String get proSourceSubscription => 'Suscripción';

  @override
  String get proSourceGift => 'Regalo';

  @override
  String get proSourceAdmin => 'Admin';

  @override
  String get proSourceGroup => 'Por el grupo';

  @override
  String get noPro => 'Sin Pro';

  @override
  String proStatusNoEnd(String source) {
    return 'Pro ($source), sin fecha de fin';
  }

  @override
  String proStatusUntil(String source, String date) {
    return 'Pro ($source), hasta el $date';
  }

  @override
  String get lifetime => 'De por vida';

  @override
  String get pickDate => 'Elegir fecha';

  @override
  String get noAccess => 'Sin acceso';

  @override
  String get adminOnlyTeam => 'La gestión es solo para el equipo de CamTrip.';

  @override
  String get adminOverview => 'Resumen';

  @override
  String get adminUsers => 'Usuarios';

  @override
  String get adminReports => 'Denuncias';

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
  String get adminNewThisWeek => 'Nuevos esta semana';

  @override
  String get adminGroups => 'Grupos';

  @override
  String get adminProSubscription => 'Pro por suscripción';

  @override
  String get adminProGift => 'Pro de regalo';

  @override
  String adminWithoutSubscription(int count) {
    return '$count sin suscripción';
  }

  @override
  String get adminOpenReports => 'Denuncias abiertas';

  @override
  String get adminSearchHint => 'Buscar por nombre o correo';

  @override
  String get nobodyFound => 'No se encontró a nadie';

  @override
  String get loadMore => 'Cargar más';

  @override
  String get noEmail => 'Sin correo';

  @override
  String adminDeletePhotoMessage(String groupName) {
    return 'La foto desaparece para todos en «$groupName». Todas las denuncias de esta foto se cierran.';
  }

  @override
  String get adminBanMessage =>
      'Esta cuenta ya no podrá iniciar sesión ni usar la app. Puedes deshacerlo más tarde.';

  @override
  String get adminDismissTitle => '¿Ignorar la denuncia?';

  @override
  String get adminDismissMessage =>
      'La foto se queda. La denuncia se marca como resuelta.';

  @override
  String get adminDismiss => 'Ignorar';

  @override
  String get adminAccountBlocked => 'Cuenta bloqueada';

  @override
  String get adminReportDismissed => 'Denuncia ignorada';

  @override
  String get adminNoReports => 'No hay denuncias abiertas';

  @override
  String get adminNoReportsMessage => 'Las fotos denunciadas aparecen aquí.';

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
      other: '$count denuncias',
      one: '1 denuncia',
    );
    return '$_temp0';
  }

  @override
  String get adminDeletePhoto => 'Eliminar foto';

  @override
  String get adminBlockCreator => 'Bloquear autor';

  @override
  String get loadFailed => 'No se pudo cargar';

  @override
  String get adminLifetimeProGiven => 'Pro de por vida regalado';

  @override
  String get adminProGiven => 'Pro regalado';

  @override
  String adminGiveProUntil(String date) {
    return 'Regalar Pro hasta el $date';
  }

  @override
  String get adminGiveProLifetime => 'Regalar Pro de por vida';

  @override
  String adminGiveProFor(String period) {
    return 'Regalar Pro durante $period';
  }

  @override
  String get adminReasonHint => 'Motivo, p. ej. amigo, tester, influencer';

  @override
  String get adminGivePro => 'Regalar Pro';

  @override
  String get adminRevokeTitle => '¿Retirar el regalo?';

  @override
  String get adminRevokeMessage =>
      'El Pro regalado termina al momento. Una suscripción propia sigue activa.';

  @override
  String get adminRevoke => 'Retirar';

  @override
  String get adminGiftRevoked => 'Regalo retirado';

  @override
  String get adminUnbanTitle => '¿Quitar el bloqueo?';

  @override
  String adminUnbanMessage(String name) {
    return '$name podrá volver a iniciar sesión.';
  }

  @override
  String get adminUnbanned => 'Bloqueo quitado';

  @override
  String get adminBanUserMessage =>
      'Esta cuenta ya no podrá iniciar sesión ni usar la app. Las fotos se quedan.';

  @override
  String get adminUser => 'Usuario';

  @override
  String get adminNotVerified => 'sin verificar';

  @override
  String get adminRole => 'Rol';

  @override
  String get adminCreated => 'Creado';

  @override
  String get unknown => 'Desconocido';

  @override
  String get adminSignInWith => 'Inicia sesión con';

  @override
  String get adminEmailMethod => 'Correo';

  @override
  String get adminPhotosAndVideos => 'Fotos y vídeos';

  @override
  String get adminStatus => 'Estado';

  @override
  String get adminActive => 'Activa';

  @override
  String adminActiveUntil(String date) {
    return 'Activa hasta el $date';
  }

  @override
  String adminGiftFrom(String name) {
    return 'Regalo de $name';
  }

  @override
  String adminExpiredOn(String date) {
    return 'Caducó el $date';
  }

  @override
  String get adminExpired => 'Caducado';

  @override
  String adminUntil(String date) {
    return 'Hasta el $date';
  }

  @override
  String get adminGiveProTitle => 'Regalar Pro';

  @override
  String get adminGiveProNote =>
      'También vale para los grupos de esta persona: un Pro en el grupo = Pro para todo el grupo.';

  @override
  String get adminRevokeGift => 'Retirar regalo';

  @override
  String get adminModeration => 'Moderación';

  @override
  String get adminCannotBanSelf => 'No puedes bloquearte a ti mismo.';

  @override
  String get adminCannotBanAdmin => 'Un admin no se puede bloquear.';

  @override
  String get adminUnban => 'Quitar bloqueo';

  @override
  String get adminBanAccount => 'Bloquear cuenta';

  @override
  String get googleSignInUnavailable =>
      'El inicio de sesión con Google aún no está disponible';

  @override
  String get cameraPickerTitle => 'Elige tu cámara';

  @override
  String get cameraPickerSubtitle =>
      'Cada cámara da a tus fotos su propio estilo';

  @override
  String get cameraPickerChange => 'Cambiar de cámara';

  @override
  String get cameraPickerUnlock => 'Desbloquear con Pro';

  @override
  String get cameraPickerSelected => 'Seleccionada';

  @override
  String get cameraPickerStyleSummer => 'Verano';

  @override
  String get cameraPickerStyleSummerDescription =>
      'Colores cálidos y desvaídos de una foto de los 90';

  @override
  String get cameraPickerStyleNight => 'Noche 800';

  @override
  String get cameraPickerStyleNightDescription =>
      'Película de cine: sombras verdeazuladas, luz cálida, mucho grano';

  @override
  String get cameraPickerStyleSepia => 'Sepia';

  @override
  String get cameraPickerStyleSepiaDescription =>
      'Una vieja copia marrón de la caja de zapatos';

  @override
  String get cameraPickerStyleLomo => 'Lomo';

  @override
  String get cameraPickerStyleLomoDescription =>
      'Colores intensos, esquinas oscuras y un tono loco';

  @override
  String get cameraPickerStyleMint => 'Menta';

  @override
  String get cameraPickerStyleMintDescription =>
      'Suave y fresco con un tono verde';

  @override
  String get cameraPickerStylePastel => 'Rosa';

  @override
  String get cameraPickerStylePastelDescription =>
      'Colores pastel con un brillo rosa y borde blanco';

  @override
  String get cameraPickerStyleSuper8 => 'Super 8';

  @override
  String get cameraPickerStyleSuper8Description =>
      'Granulado y suave, como un viejo vídeo casero';

  @override
  String get paywallBenefitGroup => 'Un Pro = Pro para todo el grupo';

  @override
  String get paywallBenefitUnlimited =>
      'Miembros ilimitados, fotos para siempre';

  @override
  String get paywallBenefitQuality => 'Sin marca de agua, calidad original';

  @override
  String paywallFreeTrial(String period) {
    return '$period gratis';
  }

  @override
  String paywallPriceYear(String price) {
    return '$price al año.';
  }

  @override
  String paywallPriceYearTrial(String period, String price) {
    return '$period gratis y después $price al año.';
  }

  @override
  String paywallPriceMonth(String price) {
    return '$price al mes.';
  }

  @override
  String paywallPriceMonthTrial(String period, String price) {
    return '$period gratis y después $price al mes.';
  }

  @override
  String paywallAutoRenew(String store) {
    return 'Se renueva automáticamente. Cancela al menos 24 horas antes de la renovación en $store.';
  }

  @override
  String get paywallDetailsTitle => 'Todo lo que incluye Pro';

  @override
  String get paywallBenefitStyles => 'Todos los estilos de cámara';

  @override
  String get allPhotosTitle => 'Todas las fotos';

  @override
  String get homeTabAlbums => 'Álbumes';

  @override
  String get allPhotosEmptyTitle => 'Aún no hay fotos';

  @override
  String get allPhotosEmptyMessage => 'Abre la cámara y haz tu primera foto.';

  @override
  String get allPhotosLoadFailed => 'No se pudieron cargar tus fotos';

  @override
  String get cameraSettingsTitle => 'Ajustes de cámara';

  @override
  String get cameraSettingsMore => 'Más ajustes';

  @override
  String get cameraSettingsGrid => 'Cuadrícula';

  @override
  String get cameraSettingsHaptics => 'Vibrar al disparar';

  @override
  String get cameraSettingsDateStamp => 'Fecha abajo a la derecha';

  @override
  String get cameraSettingsSound => 'Sonido del obturador';

  @override
  String get cameraSettingsSoundHint =>
      'En silencio si tu móvil está en silencio';

  @override
  String get cameraSettingsTimer => 'Temporizador';

  @override
  String get cameraSettingsTimerOff => 'No';

  @override
  String cameraSettingsTimerSeconds(int seconds) {
    return '$seconds s';
  }

  @override
  String get cameraSettingsTimerCancelHint =>
      'Toca el disparador para cancelar';

  @override
  String get cameraSettingsMirror => 'Selfies en espejo';

  @override
  String get cameraSettingsSaveToRoll => 'Guardar en el carrete';

  @override
  String get cameraSettingsQuality => 'Calidad';

  @override
  String get cameraSettingsQualityStandard => 'Estándar';

  @override
  String get cameraSettingsQualityHigh => 'Alta';

  @override
  String get cameraLowLightHint => 'Poca luz - activa el flash';

  @override
  String get cameraFlashUnavailable => 'Esta cámara no tiene flash';

  @override
  String get cameraFlashScreen => 'Flash de pantalla';

  @override
  String get cameraFlashCycleHint => 'Toca para cambiar entre no, sí y auto';

  @override
  String get cameraFlip => 'Cambiar entre cámara frontal y trasera';

  @override
  String get cameraFlipHint => 'Toca dos veces el visor para girar la cámara';

  @override
  String cameraPickerPaywallStyles(int count, String styles) {
    return 'Las $count cámaras, incluidas $styles';
  }

  @override
  String get styleFlash => 'Flash 400';

  @override
  String get styleFlashDescription =>
      'Flash directo sobre película cálida: tono ámbar, grano, rojos intensos';

  @override
  String cameraTimerButton(String state) {
    return 'Temporizador: $state';
  }

  @override
  String get cameraTimerCycleHint => 'Toca para cambiar entre no, 3 s y 10 s';

  @override
  String get cameraLastShotOpen => 'Última foto, abre el álbum';

  @override
  String get cameraLastShotEmpty => 'Aún no hay fotos, abre el álbum';

  @override
  String get deleteOnlyOwnOrAdmin =>
      'Solo quien lo hizo o un administrador puede eliminarlo';

  @override
  String get videoPlay => 'Reproducir';

  @override
  String get videoPause => 'Pausar';

  @override
  String get language => 'Idioma';

  @override
  String get languageSystem => 'Idioma del sistema';

  @override
  String languageSystemCurrent(String language) {
    return 'Sistema ($language)';
  }

  @override
  String get languageSearchHint => 'Buscar idioma';

  @override
  String get languageNoResults => 'No se ha encontrado ningún idioma';

  @override
  String get personalRollTitle => 'Mi carrete';

  @override
  String get personalRollSubtitle => 'Solo para ti';

  @override
  String get personalRollPickerSubtitle => 'Fotos sueltas, solo para ti';

  @override
  String get personalRollMove => 'A álbum';

  @override
  String get personalRollMoveTitle => 'Mover a un álbum';

  @override
  String get personalRollMoveNoAlbums =>
      'Primero crea un álbum o únete a uno con un código.';

  @override
  String personalRollMoved(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotos movidas a $album',
      one: '1 foto movida a $album',
    );
    return '$_temp0';
  }

  @override
  String get personalRollPrivateNote =>
      'Solo tú ves estas fotos. Muévelas a un álbum para compartirlas.';

  @override
  String get paywallTripPassSub => 'Solo este viaje, para todo el grupo';

  @override
  String get paywallOneTime => 'pago único';

  @override
  String get paywallBestValue => 'Mejor precio';

  @override
  String paywallRollFullTitle(int used, int limit) {
    return 'Tu carrete está lleno - $used/$limit fotos';
  }

  @override
  String get paywallRollFullSub => 'Sigue disparando con un Trip Pass o Pro.';

  @override
  String get paywallCameraTitle => 'Esta cámara es de Pro';

  @override
  String paywallCameraSub(int count) {
    return 'Desbloquea las $count cámaras.';
  }

  @override
  String get paywallWatermarkTitle => 'Recap sin marca de agua';

  @override
  String get paywallWatermarkSub => 'Comparte tu recap sin el logo de CamTrip.';

  @override
  String get paywallDeletionTitle => 'Guarda tu viaje';

  @override
  String paywallDeletionSub(String date) {
    return 'Los viajes gratis se borran el $date. Con un Trip Pass o Pro se queda para siempre.';
  }

  @override
  String paywallTripPassTerms(String price) {
    return 'Compra única de $price para este viaje. Sin suscripción.';
  }

  @override
  String get buyTripPass => 'Comprar Trip Pass';

  @override
  String get tripPassActive => 'Trip Pass activo: este viaje es Pro para todos';

  @override
  String get tripPassActivating =>
      'Pago recibido. Tu Trip Pass estará activo enseguida.';

  @override
  String proViaTripPass(String name) {
    return 'Trip Pass de $name';
  }

  @override
  String rollCounterSemantics(int used, int limit) {
    return '$used de $limit fotos en tu carrete';
  }

  @override
  String rollHeldTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotos ya no caben en tu carrete',
      one: '1 foto ya no cabe en tu carrete',
    );
    return '$_temp0';
  }

  @override
  String get rollHeldBody => 'Guárdalas con Pro o un Trip Pass';

  @override
  String deletionBannerTitle(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Guarda tu viaje - quedan $days días',
      one: 'Guarda tu viaje - queda 1 día',
    );
    return '$_temp0';
  }

  @override
  String get deletionBannerBody =>
      'Los viajes gratis se borran 30 días después de terminar. Con un Trip Pass o Pro se queda para siempre.';

  @override
  String apiRollFull(int limit) {
    return 'Tu carrete está lleno ($limit fotos). Consigue un Trip Pass o Pro para seguir.';
  }

  @override
  String get apiTripPassFailed =>
      'No se pudo activar el Trip Pass. Escribe a support@camtrip.app.';

  @override
  String get apiTripPassExists => 'Este viaje ya tiene un Trip Pass.';

  @override
  String get tripPassUnavailable =>
      'El Trip Pass no está disponible ahora. Inténtalo más tarde.';

  @override
  String get tripMapTitle => 'Mapa del viaje';

  @override
  String get tripMapOpen => 'Mapa y estadísticas';

  @override
  String get tripMapLoadFailed => 'No se pudo cargar el mapa';

  @override
  String get tripMapStatDays => 'Días';

  @override
  String get tripMapStatPhotos => 'Fotos';

  @override
  String get tripMapStatVideos => 'Vídeos';

  @override
  String get tripMapStatMembers => 'Miembros';

  @override
  String get tripMapStatDistance => 'km recorridos';

  @override
  String get tripMapStatCountries => 'Países';

  @override
  String get tripMapStatPlaces => 'Lugares';

  @override
  String tripMapBusiestDay(String day, int count) {
    return 'Más fotos el $day ($count)';
  }

  @override
  String tripMapTopPhotographer(String name, int count) {
    return 'Mejor fotógrafo: $name ($count)';
  }

  @override
  String get tripMapOffTitle => 'El mapa del viaje está desactivado';

  @override
  String get tripMapOffMessage =>
      'Un admin puede activar el mapa en los ajustes del grupo. Las estadísticas siempre las ves.';

  @override
  String get tripMapOffMessageAdmin =>
      'Activa el mapa para ver dónde se hicieron vuestras fotos. Cada uno decide si participa.';

  @override
  String get tripMapEnable => 'Activar el mapa';

  @override
  String get tripMapEmptyTitle => 'Aún no hay lugares en el mapa';

  @override
  String get tripMapEmptyMessage =>
      'Las fotos nuevas de los miembros que comparten su ubicación aparecen aquí, redondeadas a unos 100 m.';

  @override
  String get tripMapConsentTitle => 'Mapa del viaje';

  @override
  String get tripMapConsentQuestion =>
      '¿Compartir dónde hiciste tus fotos en el mapa de este grupo?';

  @override
  String get tripMapConsentDetail =>
      'Solo lo ven los miembros del grupo, redondeado a unos 100 m. La ubicación nunca se guarda en la foto y puedes desactivarlo cuando quieras en los ajustes del grupo.';

  @override
  String get tripMapConsentYes => 'Sí, compartir';

  @override
  String get tripMapConsentNo => 'No';

  @override
  String get tripMapLocationDenied =>
      'No hay acceso a tu ubicación. Puedes permitirlo en los ajustes del teléfono.';

  @override
  String get tripMapSettingSubtitle =>
      'Mostrar en un mapa dónde se hicieron las fotos. Cada miembro decide si comparte.';

  @override
  String get tripMapDisableTitle => '¿Desactivar el mapa?';

  @override
  String get tripMapDisableMessage =>
      'Se borran todas las ubicaciones de este grupo. Si vuelves a activar el mapa, preguntaremos de nuevo a todos.';

  @override
  String get tripMapDisable => 'Desactivar';

  @override
  String get tripMapMySharing => 'Compartir mi ubicación';

  @override
  String get tripMapMySharingOn =>
      'Tus fotos nuevas aparecen en el mapa (redondeadas a unos 100 m).';

  @override
  String get tripMapMySharingOff =>
      'Desactivado. Tus fotos no aparecen en el mapa.';

  @override
  String get tripMapStopSharingTitle => '¿Dejar de compartir tu ubicación?';

  @override
  String get tripMapStopSharingMessage =>
      'Se borran las ubicaciones de todas tus fotos en este grupo.';

  @override
  String get tripMapStopSharing => 'Dejar de compartir';
}
