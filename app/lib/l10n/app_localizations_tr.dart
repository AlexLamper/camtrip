// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get cancel => 'Vazgeç';

  @override
  String get yes => 'Evet';

  @override
  String inviteMessageIntro(String groupName) {
    return 'CamTrip\'te \"$groupName\" grubuna katılır mısın? Böylece birbirimizin fotoğraflarını hemen görürüz.';
  }

  @override
  String inviteMessageCode(String code) {
    return 'Ya da kodu gir: $code';
  }

  @override
  String get memberFallbackName => 'Arkadaş';

  @override
  String get reportReasonInappropriate => 'Uygunsuz veya rahatsız edici';

  @override
  String get reportReasonSpam => 'Spam';

  @override
  String get reportReasonOther => 'Başka bir şey';

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
  String get errorOffline => 'Bağlantı yok. Biraz sonra tekrar dene.';

  @override
  String errorSomethingWrongStatus(int status) {
    return 'Bir sorun oluştu ($status)';
  }

  @override
  String get errorSomethingWrong => 'Bir sorun oluştu';

  @override
  String get apiInvalidCredentials => 'E-posta adresi veya şifre yanlış';

  @override
  String get apiInvalidCode =>
      'Bu kod yanlış ya da süresi dolmuş. Yeni bir kod iste.';

  @override
  String get apiEmailTaken =>
      'Bu e-posta adresiyle zaten bir hesap var. Giriş yap ya da \"Şifreni mi unuttun?\" seçeneğini kullan.';

  @override
  String apiEmailTakenProvider(String provider) {
    return 'Bu e-posta adresiyle zaten bir hesap var. $provider ile giriş yap.';
  }

  @override
  String apiWeakPassword(int min) {
    return 'En az $min karakterli bir şifre seç';
  }

  @override
  String apiNameTooLong(int max) {
    return 'Adın en fazla $max karakter olabilir';
  }

  @override
  String get apiRateLimited =>
      'Çok fazla deneme. Çeyrek saat sonra tekrar dene.';

  @override
  String apiAccountBanned(String email) {
    return 'Hesabın engellendi. Bunun bir hata olduğunu düşünüyorsan $email adresine yaz.';
  }

  @override
  String get apiProRequired => 'Bu kamera stili CamTrip Pro\'ya dahil';

  @override
  String get apiGroupClosed => 'Bu grup kapatıldı';

  @override
  String get apiGroupCodeNotFound => 'Bu kodla bir grup bulunamadı';

  @override
  String apiGroupFull(int max) {
    return 'Bu grup dolu (en fazla $max üye). Bir üyede CamTrip Pro varsa sınırsız kişi katılabilir.';
  }

  @override
  String get apiLastMember => 'Son üye sensin. Bunun yerine grubu sil.';

  @override
  String get apiAdminRequired => 'Yalnızca CamTrip yöneticileri için';

  @override
  String get apiUploadIncomplete => 'Yükleme tamamlanmadı';

  @override
  String get apiInvalidInput => 'Geçersiz giriş';

  @override
  String get apiNotSignedIn => 'Giriş yapılmadı';

  @override
  String get apiAccountGone => 'Bu hesap artık yok';

  @override
  String get apiPhotoNotFound => 'Fotoğraf bulunamadı';

  @override
  String get apiGroupNotFound => 'Grup bulunamadı';

  @override
  String get apiMemberNotFound => 'Üye bulunamadı';

  @override
  String get apiPersonNotFound => 'Kişi bulunamadı';

  @override
  String get apiUserNotFound => 'Kullanıcı bulunamadı';

  @override
  String get apiAdminOnly => 'Bunu yalnızca bir yönetici yapabilir';

  @override
  String get apiCannotBlockSelf => 'Kendini engelleyemezsin';

  @override
  String get apiCannotReportOwn => 'Kendi fotoğrafını şikâyet edemezsin';

  @override
  String get apiDeleteOwnOnly => 'Yalnızca kendi fotoğraflarını silebilirsin';

  @override
  String get apiOwnerCannotBeRemoved => 'Grubu oluşturan kişi çıkarılamaz';

  @override
  String get apiOwnerStaysAdmin => 'Grubu oluşturan kişi yönetici olarak kalır';

  @override
  String get apiNeedsOneAdmin => 'Bir grubun en az bir yöneticisi olmalı';

  @override
  String get apiEndBeforeStart => 'Bitiş tarihi başlangıç tarihinden önce';

  @override
  String get apiPermanentNoEndDate =>
      'Her zaman açık bir grubun bitiş tarihi olmaz';

  @override
  String get apiCannotBanAdmin => 'Bir yönetici engellenemez';

  @override
  String get apiReportNotFound => 'Şikâyet bulunamadı';

  @override
  String get apiPhotoOwnerUnknown =>
      'Bu fotoğrafı kimin çektiği artık bilinmiyor';

  @override
  String get validationNameRequired => 'Adını gir';

  @override
  String validationMaxChars(int max) {
    return 'En fazla $max karakter';
  }

  @override
  String get validationEmailRequired => 'E-posta adresini gir';

  @override
  String get validationEmailInvalid => 'Bu e-posta adresi geçerli değil';

  @override
  String get validationPasswordRequired => 'Bir şifre seç';

  @override
  String validationMinChars(int min) {
    return 'En az $min karakter';
  }

  @override
  String get validationPasswordTooLong => 'Bu şifre çok uzun';

  @override
  String get validationPasswordEmpty => 'Şifreni gir';

  @override
  String get validationCodeRequired => 'E-postadaki kodu gir';

  @override
  String get validationCodeDigits => 'Kod 6 haneli';

  @override
  String get onboarding1Title => 'Tüm grup için\ntek bir film.';

  @override
  String get onboarding1Body =>
      'Retro bir kamerayla çek. Herkes fotoğraflarını anında görür, fotoğraflar da hemen kendi albümüne düşer.';

  @override
  String get onboarding2Title => 'Fotoğraf göndermeye\nson.';

  @override
  String get onboarding2Body =>
      'Bir grup oluştur, kodu paylaş, bitti. Bir daha asla \"o fotoğrafları atar mısın?\" yok.';

  @override
  String get onboarding3Title => 'Sonunda bir\nözet video.';

  @override
  String get onboarding3Body =>
      'CamTrip en güzel anlarınızdan müzikli bir video hazırlar.';

  @override
  String get onboardingInvited => 'Davet edildin! Katılmak için giriş yap.';

  @override
  String get signInAppleFailed => 'Apple ile giriş yapılamadı';

  @override
  String get signInGoogleFailed => 'Google ile giriş yapılamadı';

  @override
  String get signInFailed => 'Giriş yapılamadı';

  @override
  String get next => 'İleri';

  @override
  String get legalPrefix => 'Devam ederek ';

  @override
  String get legalTerms => 'koşulları';

  @override
  String get legalAnd => ' ve ';

  @override
  String get legalPrivacy => 'gizlilik politikasını';

  @override
  String get legalSuffix => ' kabul etmiş olursun.';

  @override
  String get continueWithApple => 'Apple ile devam et';

  @override
  String get continueWithGoogle => 'Google ile devam et';

  @override
  String get createAccount => 'Hesap oluştur';

  @override
  String get signIn => 'Giriş yap';

  @override
  String get or => 'veya';

  @override
  String get registerSubtitle =>
      'Böylece arkadaşların fotoğrafları kimin çektiğini görür.';

  @override
  String get loginSubtitle => 'Tekrar hoş geldin.';

  @override
  String get forgotPasswordTitle => 'Şifremi unuttum';

  @override
  String get forgotPasswordPushSubtitle =>
      'Hâlâ bir yerde oturumun açık mı? Yeni bir şifre belirlemen için oraya bildirim olarak 6 haneli bir kod göndeririz.';

  @override
  String get newPassword => 'Yeni şifre';

  @override
  String get resetPushInfo =>
      'Hâlâ bir yerde oturumun açıksa oraya kod içeren bir bildirim gelir. Giriş yapamıyor musun? Aynı e-posta adresiyle Apple veya Google ile giriş yap - hesabın bağlanır.';

  @override
  String get sendCode => 'Kodu gönder';

  @override
  String get savePassword => 'Şifreyi kaydet';

  @override
  String get errorTryAgain => 'Bir sorun oluştu. Tekrar dene.';

  @override
  String get back => 'Geri';

  @override
  String get name => 'Ad';

  @override
  String get email => 'E-posta adresi';

  @override
  String get codeFromPush => 'Bildirimdeki kod';

  @override
  String get password => 'Şifre';

  @override
  String get hidePassword => 'Şifreyi gizle';

  @override
  String get showPassword => 'Şifreyi göster';

  @override
  String get forgotPasswordLink => 'Şifreni mi unuttun?';

  @override
  String get haveAccount => 'Zaten hesabın var mı?';

  @override
  String get newToCamTrip => 'CamTrip\'te yeni misin?';

  @override
  String get rememberedIt => 'Hatırladın mı?';

  @override
  String get noCodeReceived => 'Kod gelmedi mi?';

  @override
  String get resendCode => 'Tekrar gönder';

  @override
  String onboardingDemoRoll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotoğrafçı, 1 film',
      one: '1 fotoğrafçı, 1 film',
    );
    return '$_temp0';
  }

  @override
  String membersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count üye',
      one: '1 üye',
    );
    return '$_temp0';
  }

  @override
  String photosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotoğraf',
      one: '1 fotoğraf',
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
  String get justNow => 'şimdi';

  @override
  String get badgeNew => 'Yeni';

  @override
  String recapTitle(String groupName) {
    return '$groupName özeti';
  }

  @override
  String get styleFilm => 'Film';

  @override
  String get styleInstant => 'Instant';

  @override
  String get styleDisposable => 'Tek kullanımlık';

  @override
  String get styleBw => 'S/B';

  @override
  String get styleGolden => 'Golden';

  @override
  String get styleChrome => 'Chrome';

  @override
  String get styleFilmDescription =>
      'Sıcak renkler, gren ve turuncu tarih damgası';

  @override
  String get styleInstantDescription => 'Yumuşak renkler ve beyaz çerçeve';

  @override
  String get styleDisposableDescription =>
      'Sert flaş, vinyet ve ışık sızıntıları';

  @override
  String get styleBwDescription => 'Derin kontrastlı, grenli siyah beyaz';

  @override
  String get styleGoldenDescription => 'Hep altın saat, yumuşak altın parıltı';

  @override
  String get styleChromeDescription =>
      'Slayt filmi gibi soğuk, doygun ve keskin';

  @override
  String get shutterStopRecording => 'Kaydı durdur';

  @override
  String get shutterStartRecording => 'Video kaydını başlat';

  @override
  String get shutterTakePhoto => 'Fotoğraf çek';

  @override
  String get modePhoto => 'Fotoğraf';

  @override
  String get modeVideo => 'Video';

  @override
  String get cameraNotFound => 'Kamera bulunamadı';

  @override
  String get cameraAccessNeeded =>
      'CamTrip\'in kamerana erişmesi gerekiyor. Bunu Ayarlar\'dan aç.';

  @override
  String get cameraStartFailed => 'Kamera başlatılamadı';

  @override
  String get albumAccessNeeded =>
      'Fotoğrafları albümüne de kaydetmek için CamTrip\'e fotoğraflarına erişim izni ver';

  @override
  String get albumSaveFailed =>
      'Albüme kaydedilemedi. Fotoğraf yine de paylaşılıyor.';

  @override
  String styleProFallback(String style) {
    return 'Bu stil Pro\'ya dahil. Bu grupta $style ile çekiyorsun.';
  }

  @override
  String get photoFailed => 'Fotoğraf çekilemedi. Tekrar dene.';

  @override
  String get recordingFailed => 'Video kaydedilemedi';

  @override
  String get videoFailed => 'Video oluşturulamadı. Tekrar dene.';

  @override
  String get shootInGroup => 'Grupta çek';

  @override
  String get close => 'Kapat';

  @override
  String get flash => 'Flaş';

  @override
  String get flashOn => 'Açık';

  @override
  String get flashOff => 'Kapalı';

  @override
  String get flashAuto => 'Oto';

  @override
  String get chooseGroup => 'Grup seç';

  @override
  String get switchCamera => 'Kamerayı değiştir';

  @override
  String get createOrJoinFirst => 'Önce bir grup oluştur ya da bir gruba katıl';

  @override
  String get proViaGroup => 'Grup sayesinde Pro';

  @override
  String proViaName(String name) {
    return '$name sayesinde Pro';
  }

  @override
  String get proStylesFreeViaMember =>
      'Bu gruptaki Pro stiller, bir Pro üye sayesinde senin için ücretsiz';

  @override
  String proStylesFreeViaName(String name) {
    return 'Bu gruptaki Pro stiller: $name sayesinde senin için ücretsiz';
  }

  @override
  String get subscriptionsUnavailable =>
      'Abonelikler şu anda kullanılamıyor. Daha sonra tekrar dene.';

  @override
  String get paymentPending =>
      'Ödemen hâlâ işleniyor. Tamamlanınca Pro açılır.';

  @override
  String get purchaseFailed =>
      'Satın alma başarısız oldu. Daha sonra tekrar dene.';

  @override
  String get restoreUnavailable =>
      'Satın almalar şu anda geri yüklenemiyor. Daha sonra tekrar dene.';

  @override
  String get restoreFailed =>
      'Geri yükleme başarısız oldu. Daha sonra tekrar dene.';

  @override
  String get welcomePro => 'CamTrip Pro\'ya hoş geldin! 🎉';

  @override
  String get proRestored => 'Pro geri yüklendi';

  @override
  String get noPurchaseFound => 'Önceki satın alma bulunamadı';

  @override
  String periodDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gün',
      one: '1 gün',
    );
    return '$_temp0';
  }

  @override
  String periodWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hafta',
      one: '1 hafta',
    );
    return '$_temp0';
  }

  @override
  String periodMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ay',
      one: '1 ay',
    );
    return '$_temp0';
  }

  @override
  String periodYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count yıl',
      one: '1 yıl',
    );
    return '$_temp0';
  }

  @override
  String get paywallHavePro => 'CamTrip Pro\'n var';

  @override
  String get paywallSubtitle => 'Bir sonraki gezin için her şey.';

  @override
  String paywallFeatureStyles(String styles) {
    return 'Tüm kamera stilleri ($styles)';
  }

  @override
  String get paywallFeatureUnlimited =>
      'Sınırsız üye ve depolama, fotoğraflar sonsuza kadar saklanır';

  @override
  String get paywallFeatureNoWatermark => 'Filigransız özetler';

  @override
  String get paywallFeatureOriginal => 'Orijinal kalitede indirme';

  @override
  String get planYear => 'Yıllık';

  @override
  String get planMonth => 'Aylık';

  @override
  String pricePerMonth(String price) {
    return 'Ayda $price';
  }

  @override
  String paywallSaveBadge(int percent) {
    return '%$percent TASARRUF';
  }

  @override
  String get planMonthCancelAnytime => 'istediğin zaman iptal et';

  @override
  String tryFree(String period) {
    return '$period ücretsiz dene';
  }

  @override
  String get becomePro => 'Pro\'ya geç';

  @override
  String get subscriptionsLoadFailed =>
      'Abonelikler yüklenemedi. Bağlantını kontrol et.';

  @override
  String legalAnnual(String price) {
    return 'CamTrip Pro yıllık abonelik: yılda $price.';
  }

  @override
  String legalAnnualTrial(String period, String price) {
    return 'CamTrip Pro yıllık abonelik: $period ücretsiz, ardından yılda $price.';
  }

  @override
  String legalMonthly(String price) {
    return 'CamTrip Pro aylık abonelik: ayda $price.';
  }

  @override
  String legalMonthlyTrial(String period, String price) {
    return 'CamTrip Pro aylık abonelik: $period ücretsiz, ardından ayda $price.';
  }

  @override
  String get legalBillingApple =>
      'Ödeme Apple Kimliğin üzerinden alınır. Dönem bitmeden en az 24 saat önce iptal etmezsen abonelik otomatik olarak yenilenir. Aboneliği App Store hesap ayarlarından iptal edip yönetebilirsin.';

  @override
  String get legalBillingGoogle =>
      'Ödeme Google hesabın üzerinden alınır. Dönem bitmeden en az 24 saat önce iptal etmezsen abonelik otomatik olarak yenilenir. Aboneliği Google Play hesap ayarlarından iptal edip yönetebilirsin.';

  @override
  String get restorePurchases => 'Satın almaları geri yükle';

  @override
  String get terms => 'Koşullar';

  @override
  String get privacy => 'Gizlilik';

  @override
  String get groupProTitle => 'Grupta bir Pro = gruptaki herkese Pro';

  @override
  String get groupProBody =>
      'Bir kişide Pro varsa tüm grup bütün kamera stillerini, sınırsız üyeyi, saklanan fotoğrafları, orijinal kaliteyi ve filigransız özetleri alır.';

  @override
  String get groupCreated => 'Grup oluşturuldu ✓';

  @override
  String get inviteFriends => 'Arkadaşlarını davet et';

  @override
  String get codeCopied => 'Kod kopyalandı';

  @override
  String get shareLink => 'Bağlantıyı paylaş';

  @override
  String inviteSubject(String groupName) {
    return 'CamTrip\'te $groupName grubuna katıl';
  }

  @override
  String inviteMembersUnlimited(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count üye',
      one: '1 üye',
    );
    return '$_temp0 · sınırsız (Pro)';
  }

  @override
  String inviteMembersLimit(int count, int limit) {
    return '$count/$limit üye · Pro: sınırsız';
  }

  @override
  String get toCamera => 'Kameraya git';

  @override
  String get done => 'Bitti';

  @override
  String get joinEnterCode => '6 karakterli kodu gir';

  @override
  String get joinGroupTitle => 'Bir gruba katıl';

  @override
  String get joinGroupSubtitle =>
      'Arkadaşlarının kodunu gir ya da QR kodlarını tara.';

  @override
  String get typeCode => 'Kodu yaz';

  @override
  String get scanQr => 'QR tara';

  @override
  String get join => 'Katıl';

  @override
  String get groupNameRequired => 'Grubuna bir ad ver';

  @override
  String get newGroup => 'Yeni grup';

  @override
  String get groupType => 'Grup türü';

  @override
  String get groupTypeVacation => 'Tatil';

  @override
  String get groupTypeVacationDescription =>
      'Başlangıç ve bitiş tarihli, sonra arşive';

  @override
  String get groupTypeEvent => 'Etkinlik';

  @override
  String get groupTypeEventDescription => 'Bir gün ya da akşam, ör. bir parti';

  @override
  String get groupTypePermanent => 'Hep açık';

  @override
  String get groupTypePermanentDescription => 'Değişmeyen arkadaş grubun için';

  @override
  String get date => 'Tarih';

  @override
  String get departure => 'Gidiş';

  @override
  String get returnDate => 'Dönüş';

  @override
  String get defaultCameraStyle => 'Varsayılan kamera stili';

  @override
  String freeLimitPermanent(int max) {
    return 'Ücretsiz: en fazla $max üye. Pro ile sınırsız.';
  }

  @override
  String freeLimitDated(int max, int days) {
    return 'Ücretsiz: en fazla $max üye, fotoğraflar bitiş tarihinden $days gün sonrasına kadar saklanır. Pro ile sınırsız ve sonsuza kadar.';
  }

  @override
  String get createGroup => 'Grup oluştur';

  @override
  String get group => 'Grup';

  @override
  String groupCode(String code) {
    return 'kod $code';
  }

  @override
  String get manage => 'Yönetim';

  @override
  String get rename => 'Yeniden adlandır';

  @override
  String get changeDates => 'Tarihleri değiştir';

  @override
  String get finishTrip => 'Geziyi bitir';

  @override
  String get finishTripSubtitle => 'Bitiş tarihini bugüne ayarlar';

  @override
  String get reopenGroup => 'Grubu yeniden aç';

  @override
  String get closeGroup => 'Grubu kapat';

  @override
  String get reopenGroupSubtitle => 'Üyeler yeniden fotoğraf ekleyebilir';

  @override
  String get closeGroupSubtitle =>
      'Artık kimse fotoğraf ekleyemez; her şey görüntülenebilir kalır';

  @override
  String get members => 'Üyeler';

  @override
  String memberYou(String name) {
    return '$name (sen)';
  }

  @override
  String get blockedTag => 'engellendi';

  @override
  String get adminTag => 'yönetici';

  @override
  String removeMemberTitle(String name) {
    return '$name çıkarılsın mı?';
  }

  @override
  String get removeMemberMessage => 'Fotoğrafları grupta kalır.';

  @override
  String get remove => 'Sil';

  @override
  String get removeMember => 'Çıkar';

  @override
  String blockTitle(String name) {
    return '$name engellensin mi?';
  }

  @override
  String blockMessage(String name) {
    return '$name kişisinin fotoğraf ve videolarını artık görmezsin, bunlarla ilgili bildirim de almazsın. Bunu Ayarlar\'dan geri alabilirsin.';
  }

  @override
  String get block => 'Engelle';

  @override
  String get makeMember => 'Normal üye yap';

  @override
  String get makeAdmin => 'Yönetici yap';

  @override
  String get removeFromGroup => 'Gruptan çıkar';

  @override
  String get unblock => 'Engeli kaldır';

  @override
  String get inviteFriendsButton => 'Arkadaşlarını davet et';

  @override
  String get you => 'Sen';

  @override
  String get unarchive => 'Arşivden çıkar';

  @override
  String get archive => 'Arşivle';

  @override
  String get unarchiveSubtitle => 'Grup yeniden albümlerinin arasında';

  @override
  String archiveSubtitle(String section) {
    return 'Yalnızca senin için: grup, albümlerinin altındaki \"$section\" bölümüne taşınır';
  }

  @override
  String get archivedSection => 'Arşivlenenler';

  @override
  String get hiddenPhotos => 'Gizlenen fotoğraflar';

  @override
  String get hiddenPhotosSubtitle => 'Kendin için gizlediğin fotoğraflar';

  @override
  String get leaveGroup => 'Gruptan ayrıl';

  @override
  String get leaveGroupSubtitle => 'Fotoğrafların diğerleri için grupta kalır';

  @override
  String get deleteGroup => 'Grubu sil';

  @override
  String get deleteGroupSubtitle => 'Tüm fotoğraflar herkes için silinir';

  @override
  String groupArchived(String groupName) {
    return '\"$groupName\" arşivlendi';
  }

  @override
  String groupUnarchived(String groupName) {
    return '\"$groupName\" yeniden albümlerinin arasında';
  }

  @override
  String get undo => 'Geri al';

  @override
  String get groupNameTitle => 'Grup adı';

  @override
  String get finishTripTitle => 'Gezi bitirilsin mi?';

  @override
  String get finishTripMessage =>
      'Bitiş tarihi bugün olur. Yine de fotoğraf ekleyebilirsin; özet hazır.';

  @override
  String get finishTripConfirm => 'Bitir';

  @override
  String get tripFinished => 'Gezi bitti';

  @override
  String leaveGroupTitle(String groupName) {
    return '\"$groupName\" grubundan ayrılınsın mı?';
  }

  @override
  String get leaveGroupMessage =>
      'Fotoğrafların diğerleri için grupta kalır. Daha sonra kodla yeniden katılabilirsin.';

  @override
  String get leave => 'Ayrıl';

  @override
  String groupDeleted(String groupName) {
    return '\"$groupName\" silindi';
  }

  @override
  String get youAreAdmin => 'yöneticisin';

  @override
  String get open => 'Aç';

  @override
  String get archiveMenuSubtitle => 'Yalnızca senin için, diğerleri fark etmez';

  @override
  String get deleteGroupMenuSubtitle => 'Herkes için, tüm fotoğraflarla';

  @override
  String get deleteGroupTitle => 'Grup silinsin mi?';

  @override
  String deleteGroupMessage(int count, String groupName, int memberCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotoğraf ve videonun tümü',
      one: 'fotoğraf veya video',
    );
    String _temp1 = intl.Intl.pluralLogic(
      memberCount,
      locale: localeName,
      other: '$memberCount üyenin hepsi',
      one: 'tek üye',
    );
    return '\"$groupName\" içindeki $_temp0 $_temp1 için silinecek. Bu işlem geri alınamaz.';
  }

  @override
  String get deleteGroupOwnRoll => 'Telefonundaki kendi film rulon değişmez.';

  @override
  String get deleteGroupTypeName => 'Onaylamak için grubun adını yaz:';

  @override
  String get deleteForEveryone => 'Herkes için sil';

  @override
  String get save => 'Kaydet';

  @override
  String get yourAlbums => 'Albümlerin';

  @override
  String get uploadQueue => 'Yükleme sırası';

  @override
  String get noConnection => 'Bağlantı yok';

  @override
  String get albumsOfflineMessage =>
      'Albümlerin internete yeniden bağlandığında yüklenir. Kamera yine de çalışır.';

  @override
  String get retry => 'Tekrar dene';

  @override
  String get noAlbumsTitle => 'Henüz albüm yok';

  @override
  String get noAlbumsMessage =>
      'Bir sonraki gezin için grup oluştur ya da bir arkadaşının grubuna koduyla katıl.';

  @override
  String get haveCode => 'Kodum var';

  @override
  String get joinWithCode => 'Kod veya QR kodla katıl';

  @override
  String get camera => 'Kamera';

  @override
  String get restore => 'Geri yükle';

  @override
  String get more => 'Daha fazla';

  @override
  String get newAlbum => 'Yeni';

  @override
  String get closedTag => 'kapalı';

  @override
  String get activeTag => 'aktif';

  @override
  String get uploadFailed => 'Yükleme başarısız';

  @override
  String get queueNoSignal => 'Sinyal yok.';

  @override
  String get queueNoSignalMessage =>
      'Fotoğrafların zaten albümünde ve internete yeniden bağlandığında paylaşılacak.';

  @override
  String get queueWaitingForWifi => 'Wi-Fi bekleniyor.';

  @override
  String queueWifiOnlyOn(String setting) {
    return '\"$setting\" ayarın açık.';
  }

  @override
  String get queueVideosWifiOnly => 'Videolar yalnızca Wi-Fi ile yüklenir.';

  @override
  String get queueAllShared => 'Her şey paylaşıldı ✓';

  @override
  String queuePending(String items) {
    return 'Paylaşılacak: $items';
  }

  @override
  String queuePendingBoth(String photos, String videos) {
    return 'Paylaşılacak: $photos ve $videos';
  }

  @override
  String get retryUpload => 'Tekrar dene';

  @override
  String get removeFromQueue => 'Sıradan çıkar';

  @override
  String get queueStatusWifi => 'Wi-Fi';

  @override
  String get queueStatusWaiting => 'bekliyor';

  @override
  String get videosWifiOnlyTitle => 'Videolar yalnızca Wi-Fi ile';

  @override
  String get videosWifiOnlySubtitle => 'Mobil verini korur';

  @override
  String get retryNow => 'Şimdi tekrar dene';

  @override
  String get yourName => 'Adın';

  @override
  String get settings => 'Ayarlar';

  @override
  String get tapToChangeName => 'Adını değiştirmek için dokun';

  @override
  String get getCamTripPro => 'CamTrip Pro\'ya geç';

  @override
  String get photos => 'Fotoğraflar';

  @override
  String get saveOwnPhotos =>
      'Kendi fotoğraflarımı her grup için bir albüme kaydet';

  @override
  String get autoSaveOthers => 'Başkalarının fotoğraflarını otomatik kaydet';

  @override
  String get wifiOnlyTitle => 'Yalnızca Wi-Fi ile yükle';

  @override
  String get dateStamp => 'Tarih damgası';

  @override
  String get notifications => 'Bildirimler';

  @override
  String get notifyNewPhotos => 'Yeni fotoğraflar (toplu)';

  @override
  String get notifyRecapReady => 'Özet hazır';

  @override
  String get camTripTeam => 'CamTrip ekibi';

  @override
  String get adminEntrySubtitle =>
      'Kullanıcılar, Pro verme, şikâyetler ve rakamlar';

  @override
  String get account => 'Hesap';

  @override
  String get manageSubscription => 'Aboneliği yönet';

  @override
  String get blockedPeople => 'Engellenen kişiler';

  @override
  String get nobody => 'Kimse';

  @override
  String peopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kişi',
      one: '1 kişi',
    );
    return '$_temp0';
  }

  @override
  String get privacyPolicy => 'Gizlilik politikası';

  @override
  String get contact => 'İletişim';

  @override
  String get signOut => 'Çıkış yap';

  @override
  String get deleteAccount => 'Hesabı sil';

  @override
  String get deleteAccountSubtitle => 'Hesabını ve tüm fotoğraflarını siler';

  @override
  String get deleteAccountTitle => 'Hesap silinsin mi?';

  @override
  String get deleteAccountMessage =>
      'Hesabın ve tüm fotoğraf ve videoların gruplar dahil silinir. Devam eden bir aboneliği App Store veya Google Play\'den iptal edersin.';

  @override
  String get blockedTitle => 'Engellenenler';

  @override
  String get blockedSubtitle => 'Bu kişilerin fotoğraflarını görmüyorsun.';

  @override
  String get blockedNone => 'Kimseyi engellemedin.';

  @override
  String get unblockShort => 'Kaldır';

  @override
  String get groupGone => 'Bu grup artık yok ya da artık üyesi değilsin.';

  @override
  String photosSavedToAlbum(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotoğraf \"$album\" albümüne kaydedildi',
      one: '1 fotoğraf \"$album\" albümüne kaydedildi',
    );
    return '$_temp0';
  }

  @override
  String photosDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotoğraf silindi',
      one: '1 fotoğraf silindi',
    );
    return '$_temp0';
  }

  @override
  String photosDeletedSkipped(int count, int skipped) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotoğraf silindi',
      one: '1 fotoğraf silindi',
    );
    return '$_temp0, $skipped tanesi atlandı';
  }

  @override
  String photosHiddenForYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotoğraf senin için gizlendi',
      one: '1 fotoğraf senin için gizlendi',
    );
    return '$_temp0';
  }

  @override
  String get addedToFavorites => 'Favorilere eklendi';

  @override
  String get removedFromFavorites => 'Favorilerden çıkarıldı';

  @override
  String get photoAccessSettings =>
      'Ayarlar\'dan CamTrip\'e fotoğraflarına erişim izni ver';

  @override
  String photosBeingAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotoğraf ekleniyor',
      one: '1 fotoğraf ekleniyor',
    );
    return '$_temp0';
  }

  @override
  String photosUnreadable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotoğraf okunamadı',
      one: '1 fotoğraf okunamadı',
    );
    return '$_temp0';
  }

  @override
  String get groupNotLoaded => 'Grup yüklenmedi';

  @override
  String get noFavoritesTitle => 'Henüz favori yok';

  @override
  String get noPhotosTitle => 'Henüz fotoğraf yok';

  @override
  String get noFavoritesMessage =>
      'Buraya eklemek için bir fotoğraftaki yıldıza dokun.';

  @override
  String get noPhotosMessage =>
      'İlk fotoğrafı çek. Gruptaki herkes hemen görür.';

  @override
  String get openCamera => 'Kamerayı aç';

  @override
  String savingProgress(int done, int total) {
    return 'Kaydediliyor... $done/$total';
  }

  @override
  String get choosePhotos => 'Fotoğraf seç';

  @override
  String selectedCount(int count) {
    return '$count seçildi';
  }

  @override
  String get selectNone => 'Hiçbirini seçme';

  @override
  String get selectAll => 'Tümünü seç';

  @override
  String photosWaitingToShare(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotoğraf paylaşılmayı bekliyor',
      one: '1 fotoğraf paylaşılmayı bekliyor',
    );
    return '$_temp0';
  }

  @override
  String get recapReadyTitle => 'Özetin hazır';

  @override
  String get recapReadySubtitle => 'Gezinizden müzikli bir video';

  @override
  String get watch => 'İzle';

  @override
  String get makeRecapNow => 'Şimdi özet video oluştur';

  @override
  String freeGroupDeleteNotice(String date) {
    return 'Ücretsiz grup: fotoğraflar $date tarihine kadar saklanır. Kaydet ya da Pro\'ya geç.';
  }

  @override
  String get filterAll => 'Tümü';

  @override
  String get filterFavorites => 'Favoriler';

  @override
  String get filterPerPerson => 'Kişiye göre';

  @override
  String get filterPerson => 'Kişi';

  @override
  String get select => 'Seç';

  @override
  String get hiddenFilter => 'Gizlenenler';

  @override
  String get photosBy => 'Kimin fotoğrafları...';

  @override
  String get uploadedTag => 'yüklendi';

  @override
  String get saveAll => 'Tümünü kaydet';

  @override
  String get favorite => 'Favori';

  @override
  String get unfavorite => 'Favoriden çıkar';

  @override
  String get hide => 'Gizle';

  @override
  String get delete => 'Sil';

  @override
  String deletePhotosTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotoğraf silinsin mi?',
      one: 'Fotoğraf silinsin mi?',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Gruptaki herkes için kaybolurlar. Bu işlem geri alınamaz.',
      one: 'Gruptaki herkes için kaybolur. Bu işlem geri alınamaz.',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosNotAllowed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count fotoğraf başka birine ait. Kalırlar; yalnızca bir yönetici silebilir.',
      one:
          '1 fotoğraf başka birine ait. Kalır; yalnızca bir yönetici silebilir.',
    );
    return '$_temp0';
  }

  @override
  String photosBackInGroup(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotoğraf yeniden grupta',
      one: '1 fotoğraf yeniden grupta',
    );
    return '$_temp0';
  }

  @override
  String get showAll => 'Tümünü göster';

  @override
  String get hiddenPhotosExplainer =>
      'Bu fotoğrafları artık yalnızca sen görmüyorsun. Gruptaki diğerleri için hâlâ oradalar.';

  @override
  String get nothingHidden => 'Gizlenen bir şey yok';

  @override
  String get nothingHiddenMessage => 'Gizlediğin fotoğrafları burada bulursun.';

  @override
  String showAgainCount(int count) {
    return 'Yeniden göster ($count)';
  }

  @override
  String get someone => 'Biri';

  @override
  String get savedToAlbum => 'Fotoğraf albümüne kaydedildi';

  @override
  String get share => 'Paylaş';

  @override
  String get shareFailed => 'Paylaşılamadı';

  @override
  String get reportTitle => 'Bu fotoğrafı neden şikâyet ediyorsun?';

  @override
  String get reportSubtitle =>
      'Her şikâyeti 24 saat içinde inceliyoruz. Fotoğraf senin için hemen gizlenir.';

  @override
  String get reportThanks => 'Teşekkürler, inceleyeceğiz';

  @override
  String blockMessageAllGroups(String name) {
    return '$name kişisinin fotoğraf ve videolarını artık hiçbir grupta görmezsin, bunlarla ilgili bildirim de almazsın. Bunu Ayarlar\'dan geri alabilirsin.';
  }

  @override
  String userBlocked(String name) {
    return '$name engellendi';
  }

  @override
  String get videoHiddenForYou => 'Video senin için gizlendi';

  @override
  String get photoHiddenForYou => 'Fotoğraf senin için gizlendi';

  @override
  String get setAsCover => 'Kapak yap';

  @override
  String get coverUpdated => 'Kapak fotoğrafı değiştirildi';

  @override
  String get hideForMe => 'Benim için gizle';

  @override
  String get hideForMeSubtitle => 'Gruptaki diğerleri görmeye devam eder';

  @override
  String get reportPhoto => 'Fotoğrafı şikâyet et';

  @override
  String blockName(String name) {
    return '$name kişisini engelle';
  }

  @override
  String get forEveryoneInGroup => 'Gruptaki herkes için';

  @override
  String get videoDeleted => 'Video silindi';

  @override
  String get photoDeleted => 'Fotoğraf silindi';

  @override
  String get photoAccessToSave =>
      'Kaydetmek için Ayarlar\'dan CamTrip\'e fotoğraflarına erişim izni ver';

  @override
  String get phoneFull => 'Telefonun dolu';

  @override
  String get albumSaveFailedShort => 'Albüme kaydedilemedi';

  @override
  String get recapTemplateGoldenHour => 'Golden Hour';

  @override
  String get recapTemplateFast => 'Hızlı';

  @override
  String get recapTemplateFilmRoll => 'Film şeridi';

  @override
  String get recapTemplatePolaroid => 'Polaroid';

  @override
  String get trackSummerEvening => 'Yaz Akşamı';

  @override
  String get trackGoldenHour => 'Golden Hour';

  @override
  String get trackRoadtrip => 'Yol Macerası';

  @override
  String get moodWarm => 'sıcak';

  @override
  String get moodCheerful => 'neşeli';

  @override
  String friendsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count arkadaş',
      one: '1 arkadaş',
    );
    return '$_temp0';
  }

  @override
  String get madeWithCamTrip => 'CamTrip ile yapıldı';

  @override
  String get tagline => 'Tüm grup için tek bir film';

  @override
  String get videoUnsupportedDevice => 'Bu cihazda video oluşturulamadı';

  @override
  String get groupLoadFailed => 'Bu grup yüklenemedi.';

  @override
  String recapNeedsPhotos(int count) {
    return 'Özet için en az $count fotoğraf gerekiyor.';
  }

  @override
  String get recapFailed => 'Özet oluşturulamadı. Tekrar dene.';

  @override
  String get recapSaved => 'Özet fotoğraf albümüne kaydedildi';

  @override
  String get recap => 'Özet';

  @override
  String get recapRendering => 'Özet hazırlanıyor...';

  @override
  String get videoRendering => 'Video hazırlanıyor...';

  @override
  String get template => 'Şablon';

  @override
  String get musicLicense => 'CamTrip\'in kendi müziği · telifsiz';

  @override
  String get change => 'Değiştir';

  @override
  String get noWatermark => 'Filigran yok ✓';

  @override
  String get removeWatermarkPro => 'Pro ile filigranı kaldır';

  @override
  String get proSourceSubscription => 'Abonelik';

  @override
  String get proSourceGift => 'Hediye';

  @override
  String get proSourceAdmin => 'Yönetici';

  @override
  String get proSourceGroup => 'Grup üzerinden';

  @override
  String get noPro => 'Pro yok';

  @override
  String proStatusNoEnd(String source) {
    return 'Pro ($source), bitiş tarihi yok';
  }

  @override
  String proStatusUntil(String source, String date) {
    return 'Pro ($source), $date tarihine kadar';
  }

  @override
  String get lifetime => 'Ömür boyu';

  @override
  String get pickDate => 'Tarih seç';

  @override
  String get noAccess => 'Erişim yok';

  @override
  String get adminOnlyTeam => 'Yönetim yalnızca CamTrip ekibi içindir.';

  @override
  String get adminOverview => 'Genel bakış';

  @override
  String get adminUsers => 'Kullanıcılar';

  @override
  String get adminReports => 'Şikâyetler';

  @override
  String adminsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count yönetici',
      one: '1 yönetici',
    );
    return '$_temp0';
  }

  @override
  String get adminNewThisWeek => 'Bu hafta yeni';

  @override
  String get adminGroups => 'Gruplar';

  @override
  String get adminProSubscription => 'Abonelikle Pro';

  @override
  String get adminProGift => 'Hediye Pro';

  @override
  String adminWithoutSubscription(int count) {
    return '$count abonesiz';
  }

  @override
  String get adminOpenReports => 'Açık şikâyetler';

  @override
  String get adminSearchHint => 'Ad veya e-postaya göre ara';

  @override
  String get nobodyFound => 'Kimse bulunamadı';

  @override
  String get loadMore => 'Daha fazla yükle';

  @override
  String get noEmail => 'E-posta yok';

  @override
  String adminDeletePhotoMessage(String groupName) {
    return 'Fotoğraf \"$groupName\" grubundaki herkes için kaybolur. Bu fotoğrafla ilgili tüm şikâyetler kapatılır.';
  }

  @override
  String get adminBanMessage =>
      'Bu hesap artık giriş yapamaz ve uygulamayı kullanamaz. Bunu daha sonra geri alabilirsin.';

  @override
  String get adminDismissTitle => 'Şikâyet yok sayılsın mı?';

  @override
  String get adminDismissMessage =>
      'Fotoğraf kalır. Şikâyet çözüldü olarak işaretlenir.';

  @override
  String get adminDismiss => 'Yok say';

  @override
  String get adminAccountBlocked => 'Hesap engellendi';

  @override
  String get adminReportDismissed => 'Şikâyet yok sayıldı';

  @override
  String get adminNoReports => 'Açık şikâyet yok';

  @override
  String get adminNoReportsMessage =>
      'Şikâyet edilen fotoğraflar burada görünür.';

  @override
  String get deletedTag => 'Silindi';

  @override
  String adminReportedBy(String name) {
    return 'Şikâyet eden: $name';
  }

  @override
  String adminPhotoBy(String name) {
    return 'Fotoğrafı çeken: $name';
  }

  @override
  String reportsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count şikâyet',
      one: '1 şikâyet',
    );
    return '$_temp0';
  }

  @override
  String get adminDeletePhoto => 'Fotoğrafı sil';

  @override
  String get adminBlockCreator => 'Çekeni engelle';

  @override
  String get loadFailed => 'Yüklenemedi';

  @override
  String get adminLifetimeProGiven => 'Ömür boyu Pro verildi';

  @override
  String get adminProGiven => 'Pro verildi';

  @override
  String adminGiveProUntil(String date) {
    return '$date tarihine kadar Pro ver';
  }

  @override
  String get adminGiveProLifetime => 'Ömür boyu Pro ver';

  @override
  String adminGiveProFor(String period) {
    return '$period Pro ver';
  }

  @override
  String get adminReasonHint => 'Neden, ör. arkadaş, test eden, influencer';

  @override
  String get adminGivePro => 'Pro ver';

  @override
  String get adminRevokeTitle => 'Hediye geri alınsın mı?';

  @override
  String get adminRevokeMessage =>
      'Hediye edilen Pro hemen sona erer. Kişinin kendi aboneliği devam eder.';

  @override
  String get adminRevoke => 'Geri al';

  @override
  String get adminGiftRevoked => 'Hediye geri alındı';

  @override
  String get adminUnbanTitle => 'Engel kaldırılsın mı?';

  @override
  String adminUnbanMessage(String name) {
    return '$name yeniden giriş yapabilir.';
  }

  @override
  String get adminUnbanned => 'Engel kaldırıldı';

  @override
  String get adminBanUserMessage =>
      'Bu hesap artık giriş yapamaz ve uygulamayı kullanamaz. Fotoğraflar kalır.';

  @override
  String get adminUser => 'Kullanıcı';

  @override
  String get adminNotVerified => 'doğrulanmadı';

  @override
  String get adminRole => 'Rol';

  @override
  String get adminCreated => 'Oluşturulma';

  @override
  String get unknown => 'Bilinmiyor';

  @override
  String get adminSignInWith => 'Giriş yöntemi';

  @override
  String get adminEmailMethod => 'E-posta';

  @override
  String get adminPhotosAndVideos => 'Fotoğraf ve videolar';

  @override
  String get adminStatus => 'Durum';

  @override
  String get adminActive => 'Aktif';

  @override
  String adminActiveUntil(String date) {
    return '$date tarihine kadar aktif';
  }

  @override
  String adminGiftFrom(String name) {
    return '$name kişisinden hediye';
  }

  @override
  String adminExpiredOn(String date) {
    return '$date tarihinde sona erdi';
  }

  @override
  String get adminExpired => 'Süresi doldu';

  @override
  String adminUntil(String date) {
    return '$date tarihine kadar';
  }

  @override
  String get adminGiveProTitle => 'Pro ver';

  @override
  String get adminGiveProNote =>
      'Bu kişinin grupları için de geçerli: grupta bir Pro = gruptaki herkese Pro.';

  @override
  String get adminRevokeGift => 'Hediyeyi geri al';

  @override
  String get adminModeration => 'Moderasyon';

  @override
  String get adminCannotBanSelf => 'Kendini engelleyemezsin.';

  @override
  String get adminCannotBanAdmin => 'Bir yönetici engellenemez.';

  @override
  String get adminUnban => 'Engeli kaldır';

  @override
  String get adminBanAccount => 'Hesabı engelle';

  @override
  String get googleSignInUnavailable => 'Google ile giriş henüz kullanılamıyor';

  @override
  String get cameraPickerTitle => 'Kameranı seç';

  @override
  String get cameraPickerSubtitle =>
      'Her kamera fotoğraflarına kendi tarzını verir';

  @override
  String get cameraPickerChange => 'Kamerayı değiştir';

  @override
  String get cameraPickerUnlock => 'Pro ile aç';

  @override
  String get cameraPickerSelected => 'Seçildi';

  @override
  String get cameraPickerStyleSummer => 'Yaz';

  @override
  String get cameraPickerStyleSummerDescription =>
      '90\'lar fotoğrafının sıcak, solgun renkleri';

  @override
  String get cameraPickerStyleNight => 'Gece 800';

  @override
  String get cameraPickerStyleNightDescription =>
      'Sinema filmi: camgöbeği gölgeler, sıcak ışık, bol gren';

  @override
  String get cameraPickerStyleSepia => 'Sepya';

  @override
  String get cameraPickerStyleSepiaDescription =>
      'Ayakkabı kutusundan eski kahverengi bir baskı';

  @override
  String get cameraPickerStyleLomo => 'Lomo';

  @override
  String get cameraPickerStyleLomoDescription =>
      'Canlı renkler, karanlık köşeler ve çılgın bir renk tonu';

  @override
  String get cameraPickerStyleMint => 'Nane';

  @override
  String get cameraPickerStyleMintDescription =>
      'Yeşil tonlu, yumuşak ve ferah';

  @override
  String get cameraPickerStylePastel => 'Pembe';

  @override
  String get cameraPickerStylePastelDescription =>
      'Pembe ışıltılı ve beyaz çerçeveli pastel renkler';

  @override
  String get cameraPickerStyleSuper8 => 'Super 8';

  @override
  String get cameraPickerStyleSuper8Description =>
      'Eski bir ev videosu gibi grenli ve yumuşak';

  @override
  String get paywallBenefitGroup => 'Bir Pro = tüm gruba Pro';

  @override
  String get paywallBenefitUnlimited =>
      'Sınırsız üye, fotoğraflar hep saklanır';

  @override
  String get paywallBenefitQuality => 'Filigransız, orijinal kalite';

  @override
  String paywallFreeTrial(String period) {
    return '$period ücretsiz';
  }

  @override
  String paywallPriceYear(String price) {
    return 'Yılda $price.';
  }

  @override
  String paywallPriceYearTrial(String period, String price) {
    return '$period ücretsiz, ardından yılda $price.';
  }

  @override
  String paywallPriceMonth(String price) {
    return 'Ayda $price.';
  }

  @override
  String paywallPriceMonthTrial(String period, String price) {
    return '$period ücretsiz, ardından ayda $price.';
  }

  @override
  String paywallAutoRenew(String store) {
    return 'Otomatik olarak yenilenir. Yenilemeden en az 24 saat önce $store üzerinden iptal et.';
  }

  @override
  String get paywallDetailsTitle => 'Pro\'daki her şey';

  @override
  String get paywallBenefitStyles => 'Tüm kamera stilleri';

  @override
  String get allPhotosTitle => 'Tüm fotoğraflar';

  @override
  String get homeTabAlbums => 'Albümler';

  @override
  String get allPhotosEmptyTitle => 'Henüz fotoğraf yok';

  @override
  String get allPhotosEmptyMessage => 'Kamerayı aç ve ilk fotoğrafını çek.';

  @override
  String get allPhotosLoadFailed => 'Fotoğrafların yüklenemedi';

  @override
  String get cameraSettingsTitle => 'Kamera ayarları';

  @override
  String get cameraSettingsMore => 'Diğer ayarlar';

  @override
  String get cameraSettingsGrid => 'Izgara';

  @override
  String get cameraSettingsHaptics => 'Çekimde titreşim';

  @override
  String get cameraSettingsDateStamp => 'Sağ altta tarih damgası';

  @override
  String get cameraSettingsSound => 'Deklanşör sesi';

  @override
  String get cameraSettingsSoundHint => 'Telefonun sessizdeyken sessiz';

  @override
  String get cameraSettingsTimer => 'Zamanlayıcı';

  @override
  String get cameraSettingsTimerOff => 'Kapalı';

  @override
  String cameraSettingsTimerSeconds(int seconds) {
    return '$seconds sn';
  }

  @override
  String get cameraSettingsTimerCancelHint =>
      'İptal etmek için deklanşöre dokun';

  @override
  String get cameraSettingsMirror => 'Selfie\'leri aynala';

  @override
  String get cameraSettingsSaveToRoll => 'Film rulosuna kaydet';

  @override
  String get cameraSettingsQuality => 'Kalite';

  @override
  String get cameraSettingsQualityStandard => 'Standart';

  @override
  String get cameraSettingsQualityHigh => 'Yüksek';

  @override
  String get cameraLowLightHint => 'Az ışık - flaşı aç';

  @override
  String get cameraFlashUnavailable => 'Bu kamerada flaş yok';

  @override
  String get cameraFlashScreen => 'Ekran flaşı';

  @override
  String get cameraFlashCycleHint =>
      'Kapalı, açık ve otomatik arasında geçmek için dokun';

  @override
  String get cameraFlip => 'Ön ve arka kamera arasında geçiş yap';

  @override
  String get cameraFlipHint => 'Kamerayı çevirmek için vizöre iki kez dokun';

  @override
  String cameraPickerPaywallStyles(int count, String styles) {
    return '$styles dahil $count kameranın tümü';
  }

  @override
  String get styleFlash => 'Flaş 400';

  @override
  String get styleFlashDescription =>
      'Sıcak filmde doğrudan flaş: kehribar ışıltı, gren, canlı kırmızılar';
}
