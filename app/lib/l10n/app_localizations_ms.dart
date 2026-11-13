// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malay (`ms`).
class AppLocalizationsMs extends AppLocalizations {
  AppLocalizationsMs([String locale = 'ms']) : super(locale);

  @override
  String get cancel => 'Batal';

  @override
  String get yes => 'Ya';

  @override
  String inviteMessageIntro(String groupName) {
    return 'Nak sertai \"$groupName\" di CamTrip? Nanti kita boleh terus lihat foto masing-masing.';
  }

  @override
  String inviteMessageCode(String code) {
    return 'Atau masukkan kod: $code';
  }

  @override
  String get memberFallbackName => 'Kawan';

  @override
  String get reportReasonInappropriate => 'Tidak sesuai atau menyinggung';

  @override
  String get reportReasonSpam => 'Spam';

  @override
  String get reportReasonOther => 'Lain-lain';

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
  String get errorOffline => 'Tiada sambungan. Cuba lagi sebentar lagi.';

  @override
  String errorSomethingWrongStatus(int status) {
    return 'Ada masalah ($status)';
  }

  @override
  String get errorSomethingWrong => 'Ada masalah';

  @override
  String get apiInvalidCredentials =>
      'Alamat e-mel atau kata laluan tidak betul';

  @override
  String get apiInvalidCode =>
      'Kod ini tidak betul atau sudah tamat tempoh. Minta kod baharu.';

  @override
  String get apiEmailTaken =>
      'Akaun dengan alamat e-mel ini sudah wujud. Log masuk, atau pilih \"Lupa kata laluan?\".';

  @override
  String apiEmailTakenProvider(String provider) {
    return 'Akaun dengan alamat e-mel ini sudah wujud. Log masuk dengan $provider.';
  }

  @override
  String apiWeakPassword(int min) {
    return 'Pilih kata laluan sekurang-kurangnya $min aksara';
  }

  @override
  String apiNameTooLong(int max) {
    return 'Nama anda boleh mengandungi paling banyak $max aksara';
  }

  @override
  String get apiRateLimited =>
      'Terlalu banyak cubaan. Cuba lagi dalam 15 minit.';

  @override
  String apiAccountBanned(String email) {
    return 'Akaun anda telah disekat. Hubungi $email jika anda rasa ini satu kesilapan.';
  }

  @override
  String get apiProRequired =>
      'Gaya kamera ini sebahagian daripada CamTrip Pro';

  @override
  String get apiGroupClosed => 'Kumpulan ini telah ditutup';

  @override
  String get apiGroupCodeNotFound => 'Tiada kumpulan dengan kod ini';

  @override
  String apiGroupFull(int max) {
    return 'Kumpulan ini penuh (maks. $max ahli). Jika seorang ahli ada CamTrip Pro, sesiapa pun boleh sertai.';
  }

  @override
  String get apiLastMember =>
      'Anda ahli terakhir. Padamkan sahaja kumpulan ini.';

  @override
  String get apiAdminRequired => 'Hanya untuk pentadbir CamTrip';

  @override
  String get apiUploadIncomplete => 'Muat naik belum selesai';

  @override
  String get apiInvalidInput => 'Input tidak sah';

  @override
  String get apiNotSignedIn => 'Belum log masuk';

  @override
  String get apiAccountGone => 'Akaun ini sudah tiada';

  @override
  String get apiPhotoNotFound => 'Foto tidak ditemui';

  @override
  String get apiGroupNotFound => 'Kumpulan tidak ditemui';

  @override
  String get apiMemberNotFound => 'Ahli tidak ditemui';

  @override
  String get apiPersonNotFound => 'Orang tidak ditemui';

  @override
  String get apiUserNotFound => 'Pengguna tidak ditemui';

  @override
  String get apiAdminOnly => 'Hanya admin boleh buat ini';

  @override
  String get apiCannotBlockSelf => 'Anda tidak boleh menyekat diri sendiri';

  @override
  String get apiCannotReportOwn => 'Anda tidak boleh melaporkan foto sendiri';

  @override
  String get apiDeleteOwnOnly => 'Anda hanya boleh memadam foto sendiri';

  @override
  String get apiOwnerCannotBeRemoved =>
      'Pencipta kumpulan tidak boleh dikeluarkan';

  @override
  String get apiOwnerStaysAdmin => 'Pencipta sentiasa kekal sebagai admin';

  @override
  String get apiNeedsOneAdmin =>
      'Kumpulan perlu sekurang-kurangnya seorang admin';

  @override
  String get apiEndBeforeStart =>
      'Tarikh tamat lebih awal daripada tarikh mula';

  @override
  String get apiPermanentNoEndDate =>
      'Kumpulan yang sentiasa dibuka tiada tarikh tamat';

  @override
  String get apiCannotBanAdmin => 'Pentadbir tidak boleh disekat';

  @override
  String get apiReportNotFound => 'Laporan tidak ditemui';

  @override
  String get apiPhotoOwnerUnknown =>
      'Orang yang mengambil foto ini tidak lagi diketahui';

  @override
  String get validationNameRequired => 'Masukkan nama anda';

  @override
  String validationMaxChars(int max) {
    return 'Paling banyak $max aksara';
  }

  @override
  String get validationEmailRequired => 'Masukkan alamat e-mel anda';

  @override
  String get validationEmailInvalid => 'Alamat e-mel ini tidak sah';

  @override
  String get validationPasswordRequired => 'Pilih kata laluan';

  @override
  String validationMinChars(int min) {
    return 'Sekurang-kurangnya $min aksara';
  }

  @override
  String get validationPasswordTooLong => 'Kata laluan ini terlalu panjang';

  @override
  String get validationPasswordEmpty => 'Masukkan kata laluan anda';

  @override
  String get validationCodeRequired => 'Masukkan kod daripada e-mel';

  @override
  String get validationCodeDigits => 'Kod ini ada 6 digit';

  @override
  String get onboarding1Title => 'Satu gulung filem\nuntuk seluruh geng.';

  @override
  String get onboarding1Body =>
      'Ambil gambar dengan kamera retro. Semua orang terus nampak foto anda, dan foto itu juga terus ada dalam album anda.';

  @override
  String get onboarding2Title => 'Tak perlu lagi\nhantar-hantar foto.';

  @override
  String get onboarding2Body =>
      'Buat kumpulan, kongsi kod, siap. Tiada lagi \"boleh hantar foto-foto tu?\"';

  @override
  String get onboarding3Title => 'Video recap\nselepas itu.';

  @override
  String get onboarding3Body =>
      'CamTrip menghasilkan video bermuzik daripada detik terbaik anda bersama.';

  @override
  String get onboardingInvited => 'Anda dijemput! Log masuk untuk menyertai.';

  @override
  String get signInAppleFailed => 'Log masuk dengan Apple tidak berjaya';

  @override
  String get signInGoogleFailed => 'Log masuk dengan Google tidak berjaya';

  @override
  String get signInFailed => 'Log masuk tidak berjaya';

  @override
  String get next => 'Seterusnya';

  @override
  String get legalPrefix => 'Dengan meneruskan, anda bersetuju dengan';

  @override
  String get legalTerms => 'terma';

  @override
  String get legalAnd => ' dan';

  @override
  String get legalPrivacy => 'dasar privasi';

  @override
  String get legalSuffix => '.';

  @override
  String get continueWithApple => 'Teruskan dengan Apple';

  @override
  String get continueWithGoogle => 'Teruskan dengan Google';

  @override
  String get createAccount => 'Buat akaun';

  @override
  String get signIn => 'Log masuk';

  @override
  String get or => 'atau';

  @override
  String get registerSubtitle =>
      'Supaya kawan-kawan anda tahu siapa yang ambil foto.';

  @override
  String get loginSubtitle => 'Selamat kembali.';

  @override
  String get forgotPasswordTitle => 'Lupa kata laluan';

  @override
  String get forgotPasswordPushSubtitle =>
      'Masih log masuk di tempat lain? Kami akan hantar kod 6 digit ke sana sebagai pemberitahuan tolak supaya anda boleh tetapkan kata laluan baharu.';

  @override
  String get newPassword => 'Kata laluan baharu';

  @override
  String get resetPushInfo =>
      'Jika anda masih log masuk di tempat lain, anda akan terima pemberitahuan tolak berserta kod di sana. Tidak dapat masuk? Log masuk dengan Apple atau Google menggunakan alamat e-mel yang sama - akaun anda akan dipautkan.';

  @override
  String get sendCode => 'Hantar kod';

  @override
  String get savePassword => 'Simpan kata laluan';

  @override
  String get errorTryAgain => 'Ada masalah. Sila cuba lagi.';

  @override
  String get back => 'Kembali';

  @override
  String get name => 'Nama';

  @override
  String get email => 'Alamat e-mel';

  @override
  String get codeFromPush => 'Kod daripada pemberitahuan';

  @override
  String get password => 'Kata laluan';

  @override
  String get hidePassword => 'Sembunyikan kata laluan';

  @override
  String get showPassword => 'Tunjukkan kata laluan';

  @override
  String get forgotPasswordLink => 'Lupa kata laluan?';

  @override
  String get haveAccount => 'Sudah ada akaun?';

  @override
  String get newToCamTrip => 'Baru di CamTrip?';

  @override
  String get rememberedIt => 'Sudah ingat?';

  @override
  String get noCodeReceived => 'Tidak terima kod?';

  @override
  String get resendCode => 'Hantar semula';

  @override
  String onboardingDemoRoll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count jurugambar, 1 gulung',
    );
    return '$_temp0';
  }

  @override
  String membersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ahli',
    );
    return '$_temp0';
  }

  @override
  String photosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto',
    );
    return '$_temp0';
  }

  @override
  String videosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count video',
    );
    return '$_temp0';
  }

  @override
  String get justNow => 'baru tadi';

  @override
  String get badgeNew => 'Baharu';

  @override
  String recapTitle(String groupName) {
    return 'Recap $groupName';
  }

  @override
  String get styleFilm => 'Film';

  @override
  String get styleInstant => 'Instant';

  @override
  String get styleDisposable => 'Pakai Buang';

  @override
  String get styleBw => 'H&P';

  @override
  String get styleGolden => 'Golden';

  @override
  String get styleChrome => 'Chrome';

  @override
  String get styleFilmDescription =>
      'Warna hangat, bijian dan tarikh berwarna oren';

  @override
  String get styleInstantDescription => 'Warna lembut dan bingkai putih';

  @override
  String get styleDisposableDescription =>
      'Denyar terang, vignet dan kebocoran cahaya';

  @override
  String get styleBwDescription =>
      'Hitam putih berbijian dengan kontras mendalam';

  @override
  String get styleGoldenDescription =>
      'Sentiasa golden hour, sinar keemasan yang lembut';

  @override
  String get styleChromeDescription =>
      'Sejuk, tepu dan tajam, seperti filem slaid';

  @override
  String get shutterStopRecording => 'Hentikan rakaman';

  @override
  String get shutterStartRecording => 'Mula merakam video';

  @override
  String get shutterTakePhoto => 'Ambil foto';

  @override
  String get modePhoto => 'Foto';

  @override
  String get modeVideo => 'Video';

  @override
  String get cameraNotFound => 'Kamera tidak ditemui';

  @override
  String get cameraAccessNeeded =>
      'CamTrip perlukan akses ke kamera anda. Hidupkan di Tetapan.';

  @override
  String get cameraStartFailed => 'Kamera tidak dapat dimulakan';

  @override
  String get albumAccessNeeded =>
      'Beri CamTrip akses ke foto anda supaya foto juga disimpan dalam album anda';

  @override
  String get albumSaveFailed =>
      'Gagal menyimpan ke album. Foto tetap dikongsi.';

  @override
  String styleProFallback(String style) {
    return 'Gaya ini sebahagian daripada Pro. Dalam kumpulan ini anda mengambil gambar dengan $style.';
  }

  @override
  String get photoFailed => 'Gagal mengambil foto. Sila cuba lagi.';

  @override
  String get recordingFailed => 'Gagal merakam video';

  @override
  String get videoFailed => 'Gagal membuat video. Sila cuba lagi.';

  @override
  String get shootInGroup => 'Ambil gambar dalam kumpulan';

  @override
  String get close => 'Tutup';

  @override
  String get flash => 'Denyar';

  @override
  String get flashOn => 'Hidup';

  @override
  String get flashOff => 'Mati';

  @override
  String get flashAuto => 'Auto';

  @override
  String get chooseGroup => 'Pilih kumpulan';

  @override
  String get switchCamera => 'Tukar kamera';

  @override
  String get createOrJoinFirst => 'Buat atau sertai kumpulan dahulu';

  @override
  String get proViaGroup => 'Pro melalui kumpulan';

  @override
  String proViaName(String name) {
    return 'Pro melalui $name';
  }

  @override
  String get proStylesFreeViaMember =>
      'Gaya Pro dalam kumpulan ini percuma untuk anda berkat ahli Pro';

  @override
  String proStylesFreeViaName(String name) {
    return 'Gaya Pro dalam kumpulan ini: percuma untuk anda berkat $name';
  }

  @override
  String get subscriptionsUnavailable =>
      'Langganan tidak tersedia sekarang. Sila cuba lagi nanti.';

  @override
  String get paymentPending =>
      'Bayaran anda masih diproses. Pro akan hidup sebaik sahaja selesai.';

  @override
  String get purchaseFailed => 'Pembelian tidak berjaya. Sila cuba lagi nanti.';

  @override
  String get restoreUnavailable =>
      'Pembelian tidak dapat dipulihkan sekarang. Sila cuba lagi nanti.';

  @override
  String get restoreFailed => 'Pemulihan tidak berjaya. Sila cuba lagi nanti.';

  @override
  String get welcomePro => 'Selamat datang ke CamTrip Pro! 🎉';

  @override
  String get proRestored => 'Pro telah dipulihkan';

  @override
  String get noPurchaseFound => 'Tiada pembelian terdahulu ditemui';

  @override
  String periodDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hari',
    );
    return '$_temp0';
  }

  @override
  String periodWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minggu',
    );
    return '$_temp0';
  }

  @override
  String periodMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bulan',
    );
    return '$_temp0';
  }

  @override
  String periodYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tahun',
    );
    return '$_temp0';
  }

  @override
  String get paywallHavePro => 'Anda ada CamTrip Pro';

  @override
  String get paywallSubtitle =>
      'Segalanya untuk percutian anda yang seterusnya.';

  @override
  String paywallFeatureStyles(String styles) {
    return 'Semua gaya kamera ($styles)';
  }

  @override
  String get paywallFeatureUnlimited =>
      'Ahli dan storan tanpa had, foto disimpan selama-lamanya';

  @override
  String get paywallFeatureNoWatermark => 'Recap tanpa tera air';

  @override
  String get paywallFeatureOriginal => 'Muat turun dalam kualiti asal';

  @override
  String get planYear => 'Tahunan';

  @override
  String get planMonth => 'Bulanan';

  @override
  String pricePerMonth(String price) {
    return '$price sebulan';
  }

  @override
  String paywallSaveBadge(int percent) {
    return 'JIMAT $percent%';
  }

  @override
  String get planMonthCancelAnytime => 'batal bila-bila masa';

  @override
  String tryFree(String period) {
    return 'Cuba $period secara percuma';
  }

  @override
  String get becomePro => 'Dapatkan Pro';

  @override
  String get subscriptionsLoadFailed =>
      'Langganan tidak dapat dimuatkan. Semak sambungan anda.';

  @override
  String legalAnnual(String price) {
    return 'Langganan tahunan CamTrip Pro: $price setahun.';
  }

  @override
  String legalAnnualTrial(String period, String price) {
    return 'Langganan tahunan CamTrip Pro: $period percuma, kemudian $price setahun.';
  }

  @override
  String legalMonthly(String price) {
    return 'Langganan bulanan CamTrip Pro: $price sebulan.';
  }

  @override
  String legalMonthlyTrial(String period, String price) {
    return 'Langganan bulanan CamTrip Pro: $period percuma, kemudian $price sebulan.';
  }

  @override
  String get legalBillingApple =>
      'Bayaran dicaj ke Apple ID anda. Langganan diperbaharui secara automatik melainkan anda membatalkannya sekurang-kurangnya 24 jam sebelum tempoh tamat. Anda boleh membatalkan dan mengurusnya dalam tetapan akaun App Store anda.';

  @override
  String get legalBillingGoogle =>
      'Bayaran dicaj ke akaun Google anda. Langganan diperbaharui secara automatik melainkan anda membatalkannya sekurang-kurangnya 24 jam sebelum tempoh tamat. Anda boleh membatalkan dan mengurusnya dalam tetapan akaun Google Play anda.';

  @override
  String get restorePurchases => 'Pulihkan pembelian';

  @override
  String get terms => 'Terma';

  @override
  String get privacy => 'Privasi';

  @override
  String get groupProTitle =>
      'Satu Pro dalam kumpulan = Pro untuk semua dalam kumpulan itu';

  @override
  String get groupProBody =>
      'Jika seorang ada Pro, seluruh kumpulan dapat semua gaya kamera, ahli tanpa had, foto yang disimpan, kualiti asal dan recap tanpa tera air.';

  @override
  String get groupCreated => 'Kumpulan dibuat ✓';

  @override
  String get inviteFriends => 'Jemput kawan-kawan anda';

  @override
  String get codeCopied => 'Kod disalin';

  @override
  String get shareLink => 'Kongsi pautan';

  @override
  String inviteSubject(String groupName) {
    return 'Sertai $groupName di CamTrip';
  }

  @override
  String inviteMembersUnlimited(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ahli',
    );
    return '$_temp0 · tanpa had (Pro)';
  }

  @override
  String inviteMembersLimit(int count, int limit) {
    return '$count daripada $limit ahli · Pro: tanpa had';
  }

  @override
  String get toCamera => 'Ke kamera';

  @override
  String get done => 'Selesai';

  @override
  String get joinEnterCode => 'Masukkan kod 6 aksara';

  @override
  String get joinGroupTitle => 'Sertai kumpulan';

  @override
  String get joinGroupSubtitle =>
      'Masukkan kod kawan anda, atau imbas kod QR mereka.';

  @override
  String get typeCode => 'Taip kod';

  @override
  String get scanQr => 'Imbas QR';

  @override
  String get join => 'Sertai';

  @override
  String get groupNameRequired => 'Beri nama kepada kumpulan anda';

  @override
  String get newGroup => 'Kumpulan baharu';

  @override
  String get groupType => 'Jenis kumpulan';

  @override
  String get groupTypeVacation => 'Percutian';

  @override
  String get groupTypeVacationDescription =>
      'Dengan tarikh mula dan tamat, kemudian diarkibkan';

  @override
  String get groupTypeEvent => 'Acara';

  @override
  String get groupTypeEventDescription => 'Satu hari atau malam, cth. parti';

  @override
  String get groupTypePermanent => 'Sentiasa dibuka';

  @override
  String get groupTypePermanentDescription => 'Untuk geng kawan tetap anda';

  @override
  String get date => 'Tarikh';

  @override
  String get departure => 'Berlepas';

  @override
  String get returnDate => 'Pulang';

  @override
  String get defaultCameraStyle => 'Gaya kamera lalai';

  @override
  String freeLimitPermanent(int max) {
    return 'Percuma: hingga $max ahli. Tanpa had dengan Pro.';
  }

  @override
  String freeLimitDated(int max, int days) {
    return 'Percuma: hingga $max ahli, foto disimpan hingga $days hari selepas tarikh tamat. Tanpa had dan selama-lamanya dengan Pro.';
  }

  @override
  String get createGroup => 'Buat kumpulan';

  @override
  String get group => 'Kumpulan';

  @override
  String groupCode(String code) {
    return 'kod $code';
  }

  @override
  String get manage => 'Urus';

  @override
  String get rename => 'Namakan semula';

  @override
  String get changeDates => 'Tukar tarikh';

  @override
  String get finishTrip => 'Tamatkan percutian';

  @override
  String get finishTripSubtitle => 'Tarikh tamat ditetapkan kepada hari ini';

  @override
  String get reopenGroup => 'Buka semula kumpulan';

  @override
  String get closeGroup => 'Tutup kumpulan';

  @override
  String get reopenGroupSubtitle => 'Ahli boleh menambah foto semula';

  @override
  String get closeGroupSubtitle =>
      'Tiada sesiapa boleh menambah foto lagi; semuanya masih boleh dilihat';

  @override
  String get members => 'Ahli';

  @override
  String memberYou(String name) {
    return '$name (anda)';
  }

  @override
  String get blockedTag => 'disekat';

  @override
  String get adminTag => 'admin';

  @override
  String removeMemberTitle(String name) {
    return 'Keluarkan $name?';
  }

  @override
  String get removeMemberMessage => 'Foto mereka kekal dalam kumpulan.';

  @override
  String get remove => 'Padam';

  @override
  String get removeMember => 'Keluarkan';

  @override
  String blockTitle(String name) {
    return 'Sekat $name?';
  }

  @override
  String blockMessage(String name) {
    return 'Anda tidak akan lagi melihat foto dan video daripada $name atau menerima pemberitahuan tentangnya. Anda boleh membatalkan ini di Tetapan.';
  }

  @override
  String get block => 'Sekat';

  @override
  String get makeMember => 'Jadikan ahli biasa';

  @override
  String get makeAdmin => 'Jadikan admin';

  @override
  String get removeFromGroup => 'Keluarkan daripada kumpulan';

  @override
  String get unblock => 'Nyahsekat';

  @override
  String get inviteFriendsButton => 'Jemput kawan';

  @override
  String get you => 'Anda';

  @override
  String get unarchive => 'Pulihkan daripada arkib';

  @override
  String get archive => 'Arkibkan';

  @override
  String get unarchiveSubtitle => 'Kumpulan kembali bersama album anda';

  @override
  String archiveSubtitle(String section) {
    return 'Hanya untuk anda: kumpulan dipindahkan ke \"$section\" di bahagian bawah album anda';
  }

  @override
  String get archivedSection => 'Diarkibkan';

  @override
  String get hiddenPhotos => 'Foto tersembunyi';

  @override
  String get hiddenPhotosSubtitle =>
      'Foto yang anda sembunyikan untuk diri sendiri';

  @override
  String get leaveGroup => 'Tinggalkan kumpulan';

  @override
  String get leaveGroupSubtitle =>
      'Foto anda kekal dalam kumpulan untuk yang lain';

  @override
  String get deleteGroup => 'Padam kumpulan';

  @override
  String get deleteGroupSubtitle => 'Semua foto dipadam untuk semua orang';

  @override
  String groupArchived(String groupName) {
    return '\"$groupName\" diarkibkan';
  }

  @override
  String groupUnarchived(String groupName) {
    return '\"$groupName\" kembali bersama album anda';
  }

  @override
  String get undo => 'Buat asal';

  @override
  String get groupNameTitle => 'Nama kumpulan';

  @override
  String get finishTripTitle => 'Tamatkan percutian?';

  @override
  String get finishTripMessage =>
      'Tarikh tamat menjadi hari ini. Anda masih boleh menambah foto; recap sudah sedia.';

  @override
  String get finishTripConfirm => 'Tamatkan';

  @override
  String get tripFinished => 'Percutian tamat';

  @override
  String leaveGroupTitle(String groupName) {
    return 'Tinggalkan \"$groupName\"?';
  }

  @override
  String get leaveGroupMessage =>
      'Foto anda kekal dalam kumpulan untuk yang lain. Anda boleh sertai semula kemudian dengan kod.';

  @override
  String get leave => 'Tinggalkan';

  @override
  String groupDeleted(String groupName) {
    return '\"$groupName\" telah dipadam';
  }

  @override
  String get youAreAdmin => 'anda admin';

  @override
  String get open => 'Buka';

  @override
  String get archiveMenuSubtitle =>
      'Hanya untuk anda, yang lain tidak akan perasan';

  @override
  String get deleteGroupMenuSubtitle => 'Untuk semua orang, dengan semua foto';

  @override
  String get deleteGroupTitle => 'Padam kumpulan?';

  @override
  String deleteGroupMessage(int count, String groupName, int memberCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Kesemua $count foto dan video',
      one: '1 foto atau video',
    );
    String _temp1 = intl.Intl.pluralLogic(
      memberCount,
      locale: localeName,
      other: 'kesemua $memberCount ahli',
      one: '1 ahli',
    );
    return '$_temp0 dalam \"$groupName\" akan hilang untuk $_temp1. Ini tidak boleh dibuat asal.';
  }

  @override
  String get deleteGroupOwnRoll => 'Galeri telefon anda kekal tidak berubah.';

  @override
  String get deleteGroupTypeName => 'Taip nama kumpulan untuk mengesahkan:';

  @override
  String get deleteForEveryone => 'Padam untuk semua';

  @override
  String get save => 'Simpan';

  @override
  String get yourAlbums => 'Album anda';

  @override
  String get uploadQueue => 'Baris gilir muat naik';

  @override
  String get noConnection => 'Tiada sambungan';

  @override
  String get albumsOfflineMessage =>
      'Album anda akan dimuatkan apabila anda kembali dalam talian. Kamera masih berfungsi.';

  @override
  String get retry => 'Cuba lagi';

  @override
  String get noAlbumsTitle => 'Belum ada album';

  @override
  String get noAlbumsMessage =>
      'Buat kumpulan untuk percutian seterusnya, atau sertai kumpulan kawan dengan kod mereka.';

  @override
  String get haveCode => 'Saya ada kod';

  @override
  String get joinWithCode => 'Sertai dengan kod atau kod QR';

  @override
  String get camera => 'Kamera';

  @override
  String get restore => 'Pulihkan';

  @override
  String get more => 'Lagi';

  @override
  String get newAlbum => 'Baharu';

  @override
  String get closedTag => 'ditutup';

  @override
  String get activeTag => 'aktif';

  @override
  String get uploadFailed => 'Muat naik gagal';

  @override
  String get queueNoSignal => 'Tiada isyarat.';

  @override
  String get queueNoSignalMessage =>
      'Foto anda sudah ada dalam album dan akan dikongsi sebaik sahaja anda kembali dalam talian.';

  @override
  String get queueWaitingForWifi => 'Menunggu Wi-Fi.';

  @override
  String queueWifiOnlyOn(String setting) {
    return 'Anda menghidupkan \"$setting\".';
  }

  @override
  String get queueVideosWifiOnly => 'Video hanya dihantar melalui Wi-Fi.';

  @override
  String get queueAllShared => 'Semua sudah dikongsi ✓';

  @override
  String queuePending(String items) {
    return '$items lagi untuk dikongsi';
  }

  @override
  String queuePendingBoth(String photos, String videos) {
    return '$photos dan $videos lagi untuk dikongsi';
  }

  @override
  String get retryUpload => 'Cuba lagi';

  @override
  String get removeFromQueue => 'Buang daripada baris gilir';

  @override
  String get queueStatusWifi => 'Wi-Fi';

  @override
  String get queueStatusWaiting => 'menunggu';

  @override
  String get videosWifiOnlyTitle => 'Video melalui Wi-Fi sahaja';

  @override
  String get videosWifiOnlySubtitle => 'Menjimatkan data mudah alih anda';

  @override
  String get retryNow => 'Cuba sekarang';

  @override
  String get yourName => 'Nama anda';

  @override
  String get settings => 'Tetapan';

  @override
  String get tapToChangeName => 'Ketik untuk menukar nama anda';

  @override
  String get getCamTripPro => 'Dapatkan CamTrip Pro';

  @override
  String get photos => 'Foto';

  @override
  String get saveOwnPhotos => 'Simpan foto saya ke album bagi setiap kumpulan';

  @override
  String get autoSaveOthers => 'Simpan foto orang lain secara automatik';

  @override
  String get wifiOnlyTitle => 'Muat naik melalui Wi-Fi sahaja';

  @override
  String get dateStamp => 'Cop tarikh';

  @override
  String get notifications => 'Pemberitahuan';

  @override
  String get notifyNewPhotos => 'Foto baharu (digabungkan)';

  @override
  String get notifyRecapReady => 'Recap sedia';

  @override
  String get camTripTeam => 'Pasukan CamTrip';

  @override
  String get adminEntrySubtitle => 'Pengguna, beri Pro, laporan dan statistik';

  @override
  String get account => 'Akaun';

  @override
  String get manageSubscription => 'Urus langganan';

  @override
  String get blockedPeople => 'Orang yang disekat';

  @override
  String get nobody => 'Tiada sesiapa';

  @override
  String peopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count orang',
    );
    return '$_temp0';
  }

  @override
  String get privacyPolicy => 'Dasar privasi';

  @override
  String get contact => 'Hubungi';

  @override
  String get signOut => 'Log keluar';

  @override
  String get deleteAccount => 'Padam akaun';

  @override
  String get deleteAccountSubtitle => 'Memadam akaun anda dan semua foto anda';

  @override
  String get deleteAccountTitle => 'Padam akaun?';

  @override
  String get deleteAccountMessage =>
      'Akaun anda serta semua foto dan video anda akan dipadam, termasuk daripada kumpulan. Batalkan langganan aktif di App Store atau Google Play.';

  @override
  String get blockedTitle => 'Disekat';

  @override
  String get blockedSubtitle =>
      'Anda tidak melihat foto daripada orang-orang ini.';

  @override
  String get blockedNone => 'Anda belum menyekat sesiapa.';

  @override
  String get unblockShort => 'Nyahsekat';

  @override
  String get groupGone =>
      'Kumpulan ini sudah tiada, atau anda bukan lagi ahli.';

  @override
  String photosSavedToAlbum(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto disimpan ke \"$album\"',
    );
    return '$_temp0';
  }

  @override
  String photosDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto dipadam',
    );
    return '$_temp0';
  }

  @override
  String photosDeletedSkipped(int count, int skipped) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto dipadam',
    );
    return '$_temp0, $skipped dilangkau';
  }

  @override
  String photosHiddenForYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto disembunyikan untuk anda',
    );
    return '$_temp0';
  }

  @override
  String get addedToFavorites => 'Ditambah ke kegemaran';

  @override
  String get removedFromFavorites => 'Dibuang daripada kegemaran';

  @override
  String get photoAccessSettings =>
      'Beri CamTrip akses ke foto anda di Tetapan';

  @override
  String photosBeingAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto sedang ditambah',
    );
    return '$_temp0';
  }

  @override
  String photosUnreadable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto tidak dapat dibaca',
    );
    return '$_temp0';
  }

  @override
  String get groupNotLoaded => 'Kumpulan tidak dimuatkan';

  @override
  String get noFavoritesTitle => 'Belum ada kegemaran';

  @override
  String get noPhotosTitle => 'Belum ada foto';

  @override
  String get noFavoritesMessage =>
      'Ketik bintang pada foto untuk meletakkannya di sini.';

  @override
  String get noPhotosMessage =>
      'Ambil foto pertama. Semua dalam kumpulan terus nampak.';

  @override
  String get openCamera => 'Buka kamera';

  @override
  String savingProgress(int done, int total) {
    return 'Menyimpan... $done/$total';
  }

  @override
  String get sharePreparing => 'Menyediakan...';

  @override
  String sharingProgress(int done, int total) {
    return 'Menyediakan... $done/$total';
  }

  @override
  String get choosePhotos => 'Pilih foto';

  @override
  String selectedCount(int count) {
    return '$count dipilih';
  }

  @override
  String get selectNone => 'Nyahpilih semua';

  @override
  String get selectAll => 'Pilih semua';

  @override
  String photosWaitingToShare(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto menunggu untuk dikongsi',
    );
    return '$_temp0';
  }

  @override
  String get recapReadyTitle => 'Recap anda sudah sedia';

  @override
  String get recapReadySubtitle => 'Video bermuzik daripada percutian anda';

  @override
  String get watch => 'Tonton';

  @override
  String get makeRecapNow => 'Buat video recap sekarang';

  @override
  String freeGroupDeleteNotice(String date) {
    return 'Kumpulan percuma: foto disimpan hingga $date. Simpan foto atau dapatkan Pro.';
  }

  @override
  String get filterAll => 'Semua';

  @override
  String get filterFavorites => 'Kegemaran';

  @override
  String get filterPerPerson => 'Ikut orang';

  @override
  String get filterPerson => 'Orang';

  @override
  String get select => 'Pilih';

  @override
  String get hiddenFilter => 'Tersembunyi';

  @override
  String get photosBy => 'Foto oleh...';

  @override
  String get uploadedTag => 'dimuat naik';

  @override
  String get saveAll => 'Simpan semua';

  @override
  String get favorite => 'Kegemaran';

  @override
  String get unfavorite => 'Buang kegemaran';

  @override
  String get hide => 'Sembunyikan';

  @override
  String get delete => 'Padam';

  @override
  String deletePhotosTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Padam $count foto?',
      one: 'Padam foto?',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Foto akan hilang untuk semua orang dalam kumpulan. Ini tidak boleh dibuat asal.',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosNotAllowed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count foto milik orang lain. Foto itu kekal; hanya admin boleh memadamnya.',
    );
    return '$_temp0';
  }

  @override
  String photosBackInGroup(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto kembali dalam kumpulan',
    );
    return '$_temp0';
  }

  @override
  String get showAll => 'Tunjukkan semua';

  @override
  String get hiddenPhotosExplainer =>
      'Hanya anda yang tidak lagi melihat foto ini. Bagi yang lain dalam kumpulan, foto masih ada.';

  @override
  String get nothingHidden => 'Tiada yang disembunyikan';

  @override
  String get nothingHiddenMessage =>
      'Foto yang anda sembunyikan akan muncul di sini.';

  @override
  String showAgainCount(int count) {
    return 'Tunjukkan semula ($count)';
  }

  @override
  String get someone => 'Seseorang';

  @override
  String get savedToAlbum => 'Disimpan ke album foto anda';

  @override
  String get share => 'Kongsi';

  @override
  String get shareFailed => 'Gagal berkongsi';

  @override
  String get reportTitle => 'Kenapa anda melaporkan foto ini?';

  @override
  String get reportSubtitle =>
      'Kami menyemak setiap laporan dalam masa 24 jam. Foto terus disembunyikan untuk anda.';

  @override
  String get reportThanks => 'Terima kasih, kami akan menyemaknya';

  @override
  String blockMessageAllGroups(String name) {
    return 'Anda tidak akan lagi melihat foto dan video daripada $name dalam mana-mana kumpulan, atau menerima pemberitahuan tentangnya. Anda boleh membatalkan ini di Tetapan.';
  }

  @override
  String userBlocked(String name) {
    return '$name telah disekat';
  }

  @override
  String get videoHiddenForYou => 'Video disembunyikan untuk anda';

  @override
  String get photoHiddenForYou => 'Foto disembunyikan untuk anda';

  @override
  String get setAsCover => 'Jadikan kulit';

  @override
  String get coverUpdated => 'Foto kulit dikemas kini';

  @override
  String get hideForMe => 'Sembunyikan untuk saya';

  @override
  String get hideForMeSubtitle =>
      'Yang lain dalam kumpulan masih boleh melihatnya';

  @override
  String get reportPhoto => 'Laporkan foto';

  @override
  String blockName(String name) {
    return 'Sekat $name';
  }

  @override
  String get forEveryoneInGroup => 'Untuk semua dalam kumpulan';

  @override
  String get videoDeleted => 'Video dipadam';

  @override
  String get photoDeleted => 'Foto dipadam';

  @override
  String get photoAccessToSave =>
      'Beri CamTrip akses ke foto anda di Tetapan untuk menyimpannya';

  @override
  String get phoneFull => 'Storan telefon anda penuh';

  @override
  String get albumSaveFailedShort => 'Gagal menyimpan ke album';

  @override
  String get recapTemplateGoldenHour => 'Golden Hour';

  @override
  String get recapTemplateFast => 'Pantas';

  @override
  String get recapTemplateFilmRoll => 'Gulung filem';

  @override
  String get recapTemplatePolaroid => 'Polaroid';

  @override
  String get trackSummerEvening => 'Petang Musim Panas';

  @override
  String get trackGoldenHour => 'Golden Hour';

  @override
  String get trackRoadtrip => 'Road Trip';

  @override
  String get moodWarm => 'hangat';

  @override
  String get moodCheerful => 'ceria';

  @override
  String friendsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kawan',
    );
    return '$_temp0';
  }

  @override
  String get madeWithCamTrip => 'Dibuat dengan CamTrip';

  @override
  String get tagline => 'Satu gulung filem untuk seluruh geng';

  @override
  String get videoUnsupportedDevice => 'Gagal membuat video pada peranti ini';

  @override
  String get groupLoadFailed => 'Kumpulan ini tidak dapat dimuatkan.';

  @override
  String recapNeedsPhotos(int count) {
    return 'Anda perlukan sekurang-kurangnya $count foto untuk recap.';
  }

  @override
  String get recapFailed => 'Gagal membuat recap. Sila cuba lagi.';

  @override
  String get recapSaved => 'Recap disimpan ke album foto anda';

  @override
  String get recap => 'Recap';

  @override
  String get recapRendering => 'Membuat recap...';

  @override
  String get videoRendering => 'Membuat video...';

  @override
  String get template => 'Templat';

  @override
  String get musicLicense => 'Muzik CamTrip sendiri · bebas royalti';

  @override
  String get change => 'Tukar';

  @override
  String get noWatermark => 'Tanpa tera air ✓';

  @override
  String get removeWatermarkPro => 'Buang tera air dengan Pro';

  @override
  String get proSourceSubscription => 'Langganan';

  @override
  String get proSourceGift => 'Hadiah';

  @override
  String get proSourceAdmin => 'Admin';

  @override
  String get proSourceGroup => 'Melalui kumpulan';

  @override
  String get noPro => 'Tiada Pro';

  @override
  String proStatusNoEnd(String source) {
    return 'Pro ($source), tiada tarikh tamat';
  }

  @override
  String proStatusUntil(String source, String date) {
    return 'Pro ($source), hingga $date';
  }

  @override
  String get lifetime => 'Seumur hidup';

  @override
  String get pickDate => 'Pilih tarikh';

  @override
  String get noAccess => 'Tiada akses';

  @override
  String get adminOnlyTeam => 'Urus hanya untuk pasukan CamTrip.';

  @override
  String get adminOverview => 'Gambaran keseluruhan';

  @override
  String get adminUsers => 'Pengguna';

  @override
  String get adminReports => 'Laporan';

  @override
  String adminsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count admin',
    );
    return '$_temp0';
  }

  @override
  String get adminNewThisWeek => 'Baharu minggu ini';

  @override
  String get adminGroups => 'Kumpulan';

  @override
  String get adminProSubscription => 'Pro melalui langganan';

  @override
  String get adminProGift => 'Pro sebagai hadiah';

  @override
  String adminWithoutSubscription(int count) {
    return '$count tanpa langganan';
  }

  @override
  String get adminOpenReports => 'Laporan terbuka';

  @override
  String get adminSearchHint => 'Cari ikut nama atau e-mel';

  @override
  String get nobodyFound => 'Tiada sesiapa ditemui';

  @override
  String get loadMore => 'Muat lagi';

  @override
  String get noEmail => 'Tiada e-mel';

  @override
  String adminDeletePhotoMessage(String groupName) {
    return 'Foto hilang untuk semua orang dalam \"$groupName\". Semua laporan tentang foto ini diselesaikan.';
  }

  @override
  String get adminBanMessage =>
      'Akaun ini tidak lagi boleh log masuk atau menggunakan aplikasi. Anda boleh membatalkan ini kemudian.';

  @override
  String get adminDismissTitle => 'Tolak laporan?';

  @override
  String get adminDismissMessage =>
      'Foto kekal. Laporan ditanda sebagai selesai.';

  @override
  String get adminDismiss => 'Tolak';

  @override
  String get adminAccountBlocked => 'Akaun disekat';

  @override
  String get adminReportDismissed => 'Laporan ditolak';

  @override
  String get adminNoReports => 'Tiada laporan terbuka';

  @override
  String get adminNoReportsMessage => 'Foto yang dilaporkan muncul di sini.';

  @override
  String get deletedTag => 'Dipadam';

  @override
  String adminReportedBy(String name) {
    return 'Oleh $name';
  }

  @override
  String adminPhotoBy(String name) {
    return 'Foto oleh $name';
  }

  @override
  String reportsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count laporan',
    );
    return '$_temp0';
  }

  @override
  String get adminDeletePhoto => 'Padam foto';

  @override
  String get adminBlockCreator => 'Sekat pencipta';

  @override
  String get loadFailed => 'Gagal memuatkan';

  @override
  String get adminLifetimeProGiven => 'Pro seumur hidup diberikan';

  @override
  String get adminProGiven => 'Pro diberikan';

  @override
  String adminGiveProUntil(String date) {
    return 'Beri Pro hingga $date';
  }

  @override
  String get adminGiveProLifetime => 'Beri Pro seumur hidup';

  @override
  String adminGiveProFor(String period) {
    return 'Beri Pro selama $period';
  }

  @override
  String get adminReasonHint => 'Sebab, cth. kawan, penguji, influencer';

  @override
  String get adminGivePro => 'Beri Pro';

  @override
  String get adminRevokeTitle => 'Tarik balik hadiah?';

  @override
  String get adminRevokeMessage =>
      'Pro hadiah berhenti serta-merta. Langganan mereka sendiri terus berjalan.';

  @override
  String get adminRevoke => 'Tarik balik';

  @override
  String get adminGiftRevoked => 'Hadiah ditarik balik';

  @override
  String get adminUnbanTitle => 'Tarik balik sekatan?';

  @override
  String adminUnbanMessage(String name) {
    return '$name boleh log masuk semula.';
  }

  @override
  String get adminUnbanned => 'Sekatan ditarik balik';

  @override
  String get adminBanUserMessage =>
      'Akaun ini tidak lagi boleh log masuk atau menggunakan aplikasi. Foto kekal.';

  @override
  String get adminUser => 'Pengguna';

  @override
  String get adminNotVerified => 'belum disahkan';

  @override
  String get adminRole => 'Peranan';

  @override
  String get adminCreated => 'Dicipta';

  @override
  String get unknown => 'Tidak diketahui';

  @override
  String get adminSignInWith => 'Log masuk dengan';

  @override
  String get adminEmailMethod => 'E-mel';

  @override
  String get adminPhotosAndVideos => 'Foto dan video';

  @override
  String get adminStatus => 'Status';

  @override
  String get adminActive => 'Aktif';

  @override
  String adminActiveUntil(String date) {
    return 'Aktif hingga $date';
  }

  @override
  String adminGiftFrom(String name) {
    return 'Hadiah daripada $name';
  }

  @override
  String adminExpiredOn(String date) {
    return 'Tamat pada $date';
  }

  @override
  String get adminExpired => 'Tamat';

  @override
  String adminUntil(String date) {
    return 'Hingga $date';
  }

  @override
  String get adminGiveProTitle => 'Beri Pro';

  @override
  String get adminGiveProNote =>
      'Juga berfungsi untuk kumpulan orang ini: satu Pro dalam kumpulan = Pro untuk semua dalam kumpulan itu.';

  @override
  String get adminRevokeGift => 'Tarik balik hadiah';

  @override
  String get adminModeration => 'Moderasi';

  @override
  String get adminCannotBanSelf => 'Anda tidak boleh menyekat diri sendiri.';

  @override
  String get adminCannotBanAdmin => 'Admin tidak boleh disekat.';

  @override
  String get adminUnban => 'Tarik balik sekatan';

  @override
  String get adminBanAccount => 'Sekat akaun';

  @override
  String get googleSignInUnavailable =>
      'Log masuk dengan Google belum tersedia';

  @override
  String get cameraPickerTitle => 'Pilih kamera anda';

  @override
  String get cameraPickerSubtitle =>
      'Setiap kamera memberi foto anda rupa tersendiri';

  @override
  String get cameraPickerChange => 'Tukar kamera';

  @override
  String get cameraPickerUnlock => 'Buka kunci dengan Pro';

  @override
  String get cameraPickerSelected => 'Dipilih';

  @override
  String get cameraPickerStyleSummer => 'Musim Panas';

  @override
  String get cameraPickerStyleSummerDescription =>
      'Warna hangat dan pudar seperti gambar tahun 90-an';

  @override
  String get cameraPickerStyleNight => 'Malam 800';

  @override
  String get cameraPickerStyleNightDescription =>
      'Filem pawagam: bayang teal, cahaya hangat, banyak bijian';

  @override
  String get cameraPickerStyleSepia => 'Sepia';

  @override
  String get cameraPickerStyleSepiaDescription =>
      'Cetakan coklat lama dari kotak kasut';

  @override
  String get cameraPickerStyleLomo => 'Lomo';

  @override
  String get cameraPickerStyleLomoDescription =>
      'Warna berani, sudut gelap dan rona warna liar';

  @override
  String get cameraPickerStyleMint => 'Pudina';

  @override
  String get cameraPickerStyleMintDescription =>
      'Lembut dan segar dengan rona hijau';

  @override
  String get cameraPickerStylePastel => 'Merah Jambu';

  @override
  String get cameraPickerStylePastelDescription =>
      'Warna pastel dengan sinar merah jambu dan bingkai putih';

  @override
  String get cameraPickerStyleSuper8 => 'Super 8';

  @override
  String get cameraPickerStyleSuper8Description =>
      'Berbijian dan lembut, seperti video keluarga lama';

  @override
  String get paywallBenefitGroup => 'Satu Pro = Pro untuk seluruh kumpulan';

  @override
  String get paywallBenefitUnlimited =>
      'Ahli tanpa had, foto disimpan selama-lamanya';

  @override
  String get paywallBenefitQuality => 'Tanpa tera air, kualiti asal';

  @override
  String paywallFreeTrial(String period) {
    return '$period percuma';
  }

  @override
  String paywallPriceYear(String price) {
    return '$price setahun.';
  }

  @override
  String paywallPriceYearTrial(String period, String price) {
    return '$period percuma, kemudian $price setahun.';
  }

  @override
  String paywallPriceMonth(String price) {
    return '$price sebulan.';
  }

  @override
  String paywallPriceMonthTrial(String period, String price) {
    return '$period percuma, kemudian $price sebulan.';
  }

  @override
  String paywallAutoRenew(String store) {
    return 'Diperbaharui secara automatik. Batalkan sekurang-kurangnya 24 jam sebelum pembaharuan di $store.';
  }

  @override
  String get paywallDetailsTitle => 'Semua dalam Pro';

  @override
  String get paywallBenefitStyles => 'Semua gaya kamera';

  @override
  String get allPhotosTitle => 'Semua foto';

  @override
  String get homeTabAlbums => 'Album';

  @override
  String get allPhotosEmptyTitle => 'Belum ada foto';

  @override
  String get allPhotosEmptyMessage =>
      'Buka kamera dan ambil foto pertama anda.';

  @override
  String get allPhotosLoadFailed => 'Foto anda tidak dapat dimuatkan';

  @override
  String get cameraSettingsTitle => 'Tetapan kamera';

  @override
  String get cameraSettingsMore => 'Tetapan lain';

  @override
  String get cameraSettingsGrid => 'Grid';

  @override
  String get cameraSettingsHaptics => 'Bergetar semasa mengambil gambar';

  @override
  String get cameraSettingsDateStamp => 'Cop tarikh di bawah kanan';

  @override
  String get cameraSettingsSound => 'Bunyi pengatup';

  @override
  String get cameraSettingsSoundHint =>
      'Senyap apabila telefon dalam mod senyap';

  @override
  String get cameraSettingsTimer => 'Pemasa';

  @override
  String get cameraSettingsTimerOff => 'Mati';

  @override
  String cameraSettingsTimerSeconds(int seconds) {
    return '$seconds s';
  }

  @override
  String get cameraSettingsTimerCancelHint =>
      'Ketik pengatup untuk membatalkan';

  @override
  String get cameraSettingsMirror => 'Cerminkan swafoto';

  @override
  String get cameraSettingsSaveToRoll => 'Simpan ke galeri';

  @override
  String get cameraSettingsQuality => 'Kualiti';

  @override
  String get cameraSettingsQualityStandard => 'Standard';

  @override
  String get cameraSettingsQualityHigh => 'Tinggi';

  @override
  String get cameraLowLightHint => 'Cahaya malap - hidupkan denyar';

  @override
  String get cameraFlashUnavailable => 'Kamera ini tiada denyar';

  @override
  String get cameraFlashScreen => 'Denyar skrin';

  @override
  String get cameraFlashCycleHint =>
      'Ketik untuk bertukar antara mati, hidup dan auto';

  @override
  String get cameraFlip => 'Tukar antara kamera depan dan belakang';

  @override
  String get cameraFlipHint =>
      'Ketik dua kali pada pemidang tilik untuk menterbalikkan kamera';

  @override
  String cameraPickerPaywallStyles(int count, String styles) {
    return 'Kesemua $count kamera, termasuk $styles';
  }

  @override
  String get styleFlash => 'Denyar 400';

  @override
  String get styleFlashDescription =>
      'Denyar terus pada filem hangat: sinar ambar, bijian, merah pekat';

  @override
  String cameraTimerButton(String state) {
    return 'Pemasa: $state';
  }

  @override
  String get cameraTimerCycleHint =>
      'Ketik untuk bertukar antara mati, 3 s dan 10 s';

  @override
  String get cameraLastShotOpen => 'Foto terkini, membuka album';

  @override
  String get cameraLastShotEmpty => 'Belum ada foto, membuka album';

  @override
  String get deleteOnlyOwnOrAdmin =>
      'Hanya pengambil gambar atau admin boleh memadam ini';

  @override
  String get videoPlay => 'Main';

  @override
  String get videoPause => 'Jeda';

  @override
  String get language => 'Bahasa';

  @override
  String get languageSystem => 'Bahasa sistem';

  @override
  String languageSystemCurrent(String language) {
    return 'Sistem ($language)';
  }

  @override
  String get languageSearchHint => 'Cari bahasa';

  @override
  String get languageNoResults => 'Bahasa tidak ditemui';

  @override
  String get personalRollTitle => 'Gulungan saya';

  @override
  String get personalRollSubtitle => 'Untuk anda sahaja';

  @override
  String get personalRollPickerSubtitle => 'Foto lepas, untuk anda sahaja';

  @override
  String get personalRollMove => 'Ke album';

  @override
  String get personalRollMoveTitle => 'Alih ke album';

  @override
  String get personalRollMoveNoAlbums =>
      'Cipta album dahulu atau sertai satu dengan kod.';

  @override
  String personalRollMoved(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto dialihkan ke $album',
    );
    return '$_temp0';
  }

  @override
  String get personalRollPrivateNote =>
      'Hanya anda boleh melihat foto ini. Alihkannya ke album untuk berkongsi.';

  @override
  String get paywallTripPassSub =>
      'Hanya perjalanan ini, untuk seluruh kumpulan';

  @override
  String get paywallOneTime => 'sekali beli';

  @override
  String get paywallBestValue => 'Paling jimat';

  @override
  String paywallRollFullTitle(int used, int limit) {
    return 'Gulungan filem anda penuh - $used/$limit foto';
  }

  @override
  String get paywallRollFullSub =>
      'Terus ambil gambar dengan Trip Pass atau Pro.';

  @override
  String get paywallCameraTitle => 'Kamera ini sebahagian daripada Pro';

  @override
  String paywallCameraSub(int count) {
    return 'Buka semua $count kamera.';
  }

  @override
  String get paywallWatermarkTitle => 'Recap tanpa tera air';

  @override
  String get paywallWatermarkSub => 'Kongsi recap tanpa logo CamTrip.';

  @override
  String get paywallDeletionTitle => 'Simpan perjalanan anda';

  @override
  String paywallDeletionSub(String date) {
    return 'Perjalanan percuma dipadam pada $date. Dengan Trip Pass atau Pro ia kekal selamanya.';
  }

  @override
  String paywallTripPassTerms(String price) {
    return 'Pembelian sekali $price untuk perjalanan ini. Bukan langganan.';
  }

  @override
  String get buyTripPass => 'Beli Trip Pass';

  @override
  String get tripPassActive =>
      'Trip Pass aktif: perjalanan ini Pro untuk semua';

  @override
  String get tripPassActivating =>
      'Bayaran diterima. Trip Pass akan aktif sebentar lagi.';

  @override
  String proViaTripPass(String name) {
    return 'Trip Pass daripada $name';
  }

  @override
  String rollCounterSemantics(int used, int limit) {
    return '$used daripada $limit gambar pada filem anda';
  }

  @override
  String rollHeldTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto tidak muat lagi pada filem',
      one: '1 foto tidak muat lagi pada filem',
    );
    return '$_temp0';
  }

  @override
  String get rollHeldBody => 'Simpan dengan Pro atau Trip Pass';

  @override
  String deletionBannerTitle(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Simpan perjalanan anda - tinggal $days hari',
      one: 'Simpan perjalanan anda - tinggal 1 hari',
    );
    return '$_temp0';
  }

  @override
  String get deletionBannerBody =>
      'Perjalanan percuma dipadam 30 hari selepas tamat. Dengan Trip Pass atau Pro ia kekal selamanya.';

  @override
  String apiRollFull(int limit) {
    return 'Filem anda penuh ($limit gambar). Dapatkan Trip Pass atau Pro untuk teruskan.';
  }

  @override
  String get apiTripPassFailed =>
      'Trip Pass tidak dapat diaktifkan. Hubungi support@camtrip.app.';

  @override
  String get apiTripPassExists => 'Perjalanan ini sudah ada Trip Pass.';

  @override
  String get tripPassUnavailable =>
      'Trip Pass tidak tersedia sekarang. Cuba lagi nanti.';

  @override
  String get tripMapTitle => 'Peta perjalanan';

  @override
  String get tripMapOpen => 'Peta dan statistik';

  @override
  String get tripMapLoadFailed => 'Peta tidak dapat dimuatkan';

  @override
  String get tripMapStatDays => 'Hari';

  @override
  String get tripMapStatPhotos => 'Foto';

  @override
  String get tripMapStatVideos => 'Video';

  @override
  String get tripMapStatMembers => 'Ahli';

  @override
  String get tripMapStatDistance => 'km dilalui';

  @override
  String get tripMapStatCountries => 'Negara';

  @override
  String get tripMapStatPlaces => 'Tempat';

  @override
  String tripMapBusiestDay(String day, int count) {
    return 'Foto paling banyak: $day ($count)';
  }

  @override
  String tripMapTopPhotographer(String name, int count) {
    return 'Jurugambar terbaik: $name ($count)';
  }

  @override
  String get tripMapOffTitle => 'Peta perjalanan dimatikan';

  @override
  String get tripMapOffMessage =>
      'Pentadbir boleh menghidupkan peta dalam tetapan kumpulan. Statistik sentiasa boleh kamu lihat.';

  @override
  String get tripMapOffMessageAdmin =>
      'Hidupkan peta untuk melihat di mana foto kamu semua diambil. Setiap orang memilih sendiri sama ada mahu menyertai.';

  @override
  String get tripMapEnable => 'Hidupkan peta';

  @override
  String get tripMapEmptyTitle => 'Belum ada tempat pada peta';

  @override
  String get tripMapEmptyMessage =>
      'Foto baharu ahli yang berkongsi lokasi muncul di sini, dibundarkan kira-kira 100 m.';

  @override
  String get tripMapConsentTitle => 'Peta perjalanan';

  @override
  String get tripMapConsentQuestion =>
      'Kongsi lokasi foto kamu diambil pada peta kumpulan ini?';

  @override
  String get tripMapConsentDetail =>
      'Hanya ahli kumpulan yang melihatnya, dibundarkan kira-kira 100 m. Lokasi tidak pernah disimpan dalam foto itu sendiri dan kamu boleh mematikannya bila-bila masa dalam tetapan kumpulan.';

  @override
  String get tripMapConsentYes => 'Ya, kongsi';

  @override
  String get tripMapConsentNo => 'Tidak';

  @override
  String get tripMapLocationDenied =>
      'Tiada akses kepada lokasi kamu. Kamu boleh membenarkannya dalam tetapan telefon.';

  @override
  String get tripMapSettingSubtitle =>
      'Tunjukkan pada peta di mana foto diambil. Ahli memilih sendiri sama ada mahu berkongsi.';

  @override
  String get tripMapDisableTitle => 'Matikan peta?';

  @override
  String get tripMapDisableMessage =>
      'Semua lokasi dalam kumpulan ini akan dipadam. Jika kamu menghidupkan peta semula, kami akan bertanya kepada semua orang sekali lagi.';

  @override
  String get tripMapDisable => 'Matikan';

  @override
  String get tripMapMySharing => 'Kongsi lokasi saya';

  @override
  String get tripMapMySharingOn =>
      'Foto baharu kamu muncul pada peta (dibundarkan kira-kira 100 m).';

  @override
  String get tripMapMySharingOff =>
      'Dimatikan. Foto kamu tidak muncul pada peta.';

  @override
  String get tripMapStopSharingTitle => 'Berhenti berkongsi lokasi?';

  @override
  String get tripMapStopSharingMessage =>
      'Lokasi semua foto kamu dalam kumpulan ini akan dipadam.';

  @override
  String get tripMapStopSharing => 'Berhenti berkongsi';
}
