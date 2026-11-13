// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get cancel => 'Batal';

  @override
  String get yes => 'Ya';

  @override
  String inviteMessageIntro(String groupName) {
    return 'Mau gabung ke \"$groupName\" di CamTrip? Nanti kita langsung bisa lihat foto satu sama lain.';
  }

  @override
  String inviteMessageCode(String code) {
    return 'Atau masukkan kode: $code';
  }

  @override
  String get memberFallbackName => 'Teman';

  @override
  String get reportReasonInappropriate => 'Tidak pantas atau menyinggung';

  @override
  String get reportReasonSpam => 'Spam';

  @override
  String get reportReasonOther => 'Lainnya';

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
  String get errorOffline => 'Tidak ada koneksi. Coba lagi sebentar lagi.';

  @override
  String errorSomethingWrongStatus(int status) {
    return 'Terjadi kesalahan ($status)';
  }

  @override
  String get errorSomethingWrong => 'Terjadi kesalahan';

  @override
  String get apiInvalidCredentials => 'Alamat email atau kata sandi salah';

  @override
  String get apiInvalidCode =>
      'Kode ini salah atau sudah kedaluwarsa. Minta kode baru.';

  @override
  String get apiEmailTaken =>
      'Akun dengan alamat email ini sudah ada. Masuk, atau pilih \"Lupa kata sandi?\".';

  @override
  String apiEmailTakenProvider(String provider) {
    return 'Akun dengan alamat email ini sudah ada. Masuk dengan $provider.';
  }

  @override
  String apiWeakPassword(int min) {
    return 'Pilih kata sandi minimal $min karakter';
  }

  @override
  String apiNameTooLong(int max) {
    return 'Nama kamu maksimal $max karakter';
  }

  @override
  String get apiRateLimited =>
      'Terlalu banyak percobaan. Coba lagi dalam 15 menit.';

  @override
  String apiAccountBanned(String email) {
    return 'Akun kamu diblokir. Hubungi $email kalau menurutmu ini keliru.';
  }

  @override
  String get apiProRequired => 'Gaya kamera ini bagian dari CamTrip Pro';

  @override
  String get apiGroupClosed => 'Grup ini sudah ditutup';

  @override
  String get apiGroupCodeNotFound => 'Tidak ada grup dengan kode ini';

  @override
  String apiGroupFull(int max) {
    return 'Grup ini penuh (maks. $max anggota). Kalau satu anggota punya CamTrip Pro, siapa pun bisa bergabung.';
  }

  @override
  String get apiLastMember => 'Kamu anggota terakhir. Hapus saja grupnya.';

  @override
  String get apiAdminRequired => 'Hanya untuk administrator CamTrip';

  @override
  String get apiUploadIncomplete => 'Unggahan belum selesai';

  @override
  String get apiInvalidInput => 'Input tidak valid';

  @override
  String get apiNotSignedIn => 'Belum masuk';

  @override
  String get apiAccountGone => 'Akun ini sudah tidak ada';

  @override
  String get apiPhotoNotFound => 'Foto tidak ditemukan';

  @override
  String get apiGroupNotFound => 'Grup tidak ditemukan';

  @override
  String get apiMemberNotFound => 'Anggota tidak ditemukan';

  @override
  String get apiPersonNotFound => 'Orang tidak ditemukan';

  @override
  String get apiUserNotFound => 'Pengguna tidak ditemukan';

  @override
  String get apiAdminOnly => 'Hanya admin yang bisa melakukan ini';

  @override
  String get apiCannotBlockSelf => 'Kamu tidak bisa memblokir diri sendiri';

  @override
  String get apiCannotReportOwn => 'Kamu tidak bisa melaporkan foto sendiri';

  @override
  String get apiDeleteOwnOnly => 'Kamu hanya bisa menghapus foto sendiri';

  @override
  String get apiOwnerCannotBeRemoved => 'Pembuat grup tidak bisa dikeluarkan';

  @override
  String get apiOwnerStaysAdmin => 'Pembuat grup selalu tetap jadi admin';

  @override
  String get apiNeedsOneAdmin => 'Grup perlu minimal satu admin';

  @override
  String get apiEndBeforeStart => 'Tanggal selesai sebelum tanggal mulai';

  @override
  String get apiPermanentNoEndDate =>
      'Grup yang selalu terbuka tidak punya tanggal selesai';

  @override
  String get apiCannotBanAdmin => 'Administrator tidak bisa diblokir';

  @override
  String get apiReportNotFound => 'Laporan tidak ditemukan';

  @override
  String get apiPhotoOwnerUnknown =>
      'Orang yang mengambil foto ini sudah tidak diketahui';

  @override
  String get validationNameRequired => 'Masukkan namamu';

  @override
  String validationMaxChars(int max) {
    return 'Maksimal $max karakter';
  }

  @override
  String get validationEmailRequired => 'Masukkan alamat emailmu';

  @override
  String get validationEmailInvalid => 'Alamat email ini tidak valid';

  @override
  String get validationPasswordRequired => 'Pilih kata sandi';

  @override
  String validationMinChars(int min) {
    return 'Minimal $min karakter';
  }

  @override
  String get validationPasswordTooLong => 'Kata sandi ini terlalu panjang';

  @override
  String get validationPasswordEmpty => 'Masukkan kata sandimu';

  @override
  String get validationCodeRequired => 'Masukkan kode dari email';

  @override
  String get validationCodeDigits => 'Kodenya 6 digit';

  @override
  String get onboarding1Title => 'Satu rol film\nuntuk satu geng.';

  @override
  String get onboarding1Body =>
      'Potret pakai kamera retro. Semua langsung lihat fotomu, dan fotonya juga langsung ada di albummu.';

  @override
  String get onboarding2Title => 'Tak perlu lagi\nkirim-kirim foto.';

  @override
  String get onboarding2Body =>
      'Buat grup, bagikan kodenya, beres. Tak ada lagi \"kirimin foto-foto itu dong?\"';

  @override
  String get onboarding3Title => 'Video recap\nsetelahnya.';

  @override
  String get onboarding3Body =>
      'CamTrip membuat video berlatar musik dari momen terbaik kalian bersama.';

  @override
  String get onboardingInvited => 'Kamu diundang! Masuk untuk bergabung.';

  @override
  String get signInAppleFailed => 'Gagal masuk dengan Apple';

  @override
  String get signInGoogleFailed => 'Gagal masuk dengan Google';

  @override
  String get signInFailed => 'Gagal masuk';

  @override
  String get next => 'Lanjut';

  @override
  String get legalPrefix => 'Dengan melanjutkan, kamu menyetujui';

  @override
  String get legalTerms => 'ketentuan';

  @override
  String get legalAnd => ' dan';

  @override
  String get legalPrivacy => 'kebijakan privasi';

  @override
  String get legalSuffix => '.';

  @override
  String get continueWithApple => 'Lanjutkan dengan Apple';

  @override
  String get continueWithGoogle => 'Lanjutkan dengan Google';

  @override
  String get createAccount => 'Buat akun';

  @override
  String get signIn => 'Masuk';

  @override
  String get or => 'atau';

  @override
  String get registerSubtitle =>
      'Biar teman-temanmu tahu siapa yang mengambil foto.';

  @override
  String get loginSubtitle => 'Selamat datang kembali.';

  @override
  String get forgotPasswordTitle => 'Lupa kata sandi';

  @override
  String get forgotPasswordPushSubtitle =>
      'Masih masuk di perangkat lain? Kami kirim kode 6 digit ke sana sebagai notifikasi push supaya kamu bisa buat kata sandi baru.';

  @override
  String get newPassword => 'Kata sandi baru';

  @override
  String get resetPushInfo =>
      'Kalau kamu masih masuk di perangkat lain, kamu akan dapat notifikasi push berisi kode di sana. Tidak bisa masuk? Masuk dengan Apple atau Google memakai alamat email yang sama - akunmu akan ditautkan.';

  @override
  String get sendCode => 'Kirim kode';

  @override
  String get savePassword => 'Simpan kata sandi';

  @override
  String get errorTryAgain => 'Terjadi kesalahan. Coba lagi.';

  @override
  String get back => 'Kembali';

  @override
  String get name => 'Nama';

  @override
  String get email => 'Alamat email';

  @override
  String get codeFromPush => 'Kode dari notifikasi';

  @override
  String get password => 'Kata sandi';

  @override
  String get hidePassword => 'Sembunyikan kata sandi';

  @override
  String get showPassword => 'Tampilkan kata sandi';

  @override
  String get forgotPasswordLink => 'Lupa kata sandi?';

  @override
  String get haveAccount => 'Sudah punya akun?';

  @override
  String get newToCamTrip => 'Baru di CamTrip?';

  @override
  String get rememberedIt => 'Sudah ingat?';

  @override
  String get noCodeReceived => 'Tidak dapat kode?';

  @override
  String get resendCode => 'Kirim ulang';

  @override
  String onboardingDemoRoll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotografer, 1 rol',
    );
    return '$_temp0';
  }

  @override
  String membersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count anggota',
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
  String get justNow => 'baru saja';

  @override
  String get badgeNew => 'Baru';

  @override
  String recapTitle(String groupName) {
    return 'Recap $groupName';
  }

  @override
  String get styleFilm => 'Film';

  @override
  String get styleInstant => 'Instant';

  @override
  String get styleDisposable => 'Sekali Pakai';

  @override
  String get styleBw => 'H&P';

  @override
  String get styleGolden => 'Golden';

  @override
  String get styleChrome => 'Chrome';

  @override
  String get styleFilmDescription => 'Warna hangat, grain, dan tanggal oranye';

  @override
  String get styleInstantDescription => 'Warna lembut dan bingkai putih';

  @override
  String get styleDisposableDescription =>
      'Flash tajam, vinyet, dan bocoran cahaya';

  @override
  String get styleBwDescription => 'Hitam putih ber-grain dengan kontras dalam';

  @override
  String get styleGoldenDescription =>
      'Selalu golden hour, kilau keemasan yang lembut';

  @override
  String get styleChromeDescription =>
      'Dingin, pekat, dan tajam seperti film slide';

  @override
  String get shutterStopRecording => 'Hentikan rekaman';

  @override
  String get shutterStartRecording => 'Mulai merekam video';

  @override
  String get shutterTakePhoto => 'Ambil foto';

  @override
  String get modePhoto => 'Foto';

  @override
  String get modeVideo => 'Video';

  @override
  String get cameraNotFound => 'Kamera tidak ditemukan';

  @override
  String get cameraAccessNeeded =>
      'CamTrip perlu akses ke kameramu. Aktifkan di Pengaturan.';

  @override
  String get cameraStartFailed => 'Kamera tidak bisa dimulai';

  @override
  String get albumAccessNeeded =>
      'Beri CamTrip akses ke fotomu supaya foto juga tersimpan di albummu';

  @override
  String get albumSaveFailed =>
      'Gagal menyimpan ke album. Fotonya tetap dibagikan.';

  @override
  String styleProFallback(String style) {
    return 'Gaya ini bagian dari Pro. Di grup ini kamu memotret dengan $style.';
  }

  @override
  String get photoFailed => 'Gagal mengambil foto. Coba lagi.';

  @override
  String get recordingFailed => 'Gagal merekam video';

  @override
  String get videoFailed => 'Gagal membuat video. Coba lagi.';

  @override
  String get shootInGroup => 'Memotret di grup';

  @override
  String get close => 'Tutup';

  @override
  String get flash => 'Flash';

  @override
  String get flashOn => 'Nyala';

  @override
  String get flashOff => 'Mati';

  @override
  String get flashAuto => 'Otomatis';

  @override
  String get chooseGroup => 'Pilih grup';

  @override
  String get switchCamera => 'Ganti kamera';

  @override
  String get createOrJoinFirst => 'Buat atau gabung ke grup dulu';

  @override
  String get proViaGroup => 'Pro lewat grup';

  @override
  String proViaName(String name) {
    return 'Pro lewat $name';
  }

  @override
  String get proStylesFreeViaMember =>
      'Gaya Pro di grup ini gratis untukmu berkat anggota Pro';

  @override
  String proStylesFreeViaName(String name) {
    return 'Gaya Pro di grup ini: gratis untukmu berkat $name';
  }

  @override
  String get subscriptionsUnavailable =>
      'Langganan sedang tidak tersedia. Coba lagi nanti.';

  @override
  String get paymentPending =>
      'Pembayaranmu masih diproses. Pro aktif begitu selesai.';

  @override
  String get purchaseFailed => 'Pembelian gagal. Coba lagi nanti.';

  @override
  String get restoreUnavailable =>
      'Pembelian belum bisa dipulihkan sekarang. Coba lagi nanti.';

  @override
  String get restoreFailed => 'Gagal memulihkan. Coba lagi nanti.';

  @override
  String get welcomePro => 'Selamat datang di CamTrip Pro! 🎉';

  @override
  String get proRestored => 'Pro sudah dipulihkan';

  @override
  String get noPurchaseFound => 'Tidak ada pembelian sebelumnya';

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
  String get paywallHavePro => 'Kamu punya CamTrip Pro';

  @override
  String get paywallSubtitle => 'Semua untuk perjalananmu berikutnya.';

  @override
  String paywallFeatureStyles(String styles) {
    return 'Semua gaya kamera ($styles)';
  }

  @override
  String get paywallFeatureUnlimited =>
      'Anggota dan penyimpanan tanpa batas, foto disimpan selamanya';

  @override
  String get paywallFeatureNoWatermark => 'Recap tanpa watermark';

  @override
  String get paywallFeatureOriginal => 'Unduh dalam kualitas asli';

  @override
  String get planYear => 'Tahunan';

  @override
  String get planMonth => 'Bulanan';

  @override
  String pricePerMonth(String price) {
    return '$price per bulan';
  }

  @override
  String paywallSaveBadge(int percent) {
    return 'HEMAT $percent%';
  }

  @override
  String get planMonthCancelAnytime => 'batalkan kapan saja';

  @override
  String tryFree(String period) {
    return 'Coba gratis $period';
  }

  @override
  String get becomePro => 'Jadi Pro';

  @override
  String get subscriptionsLoadFailed =>
      'Langganan gagal dimuat. Periksa koneksimu.';

  @override
  String legalAnnual(String price) {
    return 'Langganan tahunan CamTrip Pro: $price per tahun.';
  }

  @override
  String legalAnnualTrial(String period, String price) {
    return 'Langganan tahunan CamTrip Pro: gratis $period, lalu $price per tahun.';
  }

  @override
  String legalMonthly(String price) {
    return 'Langganan bulanan CamTrip Pro: $price per bulan.';
  }

  @override
  String legalMonthlyTrial(String period, String price) {
    return 'Langganan bulanan CamTrip Pro: gratis $period, lalu $price per bulan.';
  }

  @override
  String get legalBillingApple =>
      'Pembayaran ditagihkan ke Apple ID-mu. Langganan diperpanjang otomatis kecuali kamu membatalkannya paling lambat 24 jam sebelum periode berakhir. Kamu bisa membatalkan dan mengelolanya di pengaturan akun App Store.';

  @override
  String get legalBillingGoogle =>
      'Pembayaran ditagihkan ke akun Google-mu. Langganan diperpanjang otomatis kecuali kamu membatalkannya paling lambat 24 jam sebelum periode berakhir. Kamu bisa membatalkan dan mengelolanya di pengaturan akun Google Play.';

  @override
  String get restorePurchases => 'Pulihkan pembelian';

  @override
  String get terms => 'Ketentuan';

  @override
  String get privacy => 'Privasi';

  @override
  String get groupProTitle =>
      'Satu Pro di grup = Pro untuk semua orang di grup itu';

  @override
  String get groupProBody =>
      'Kalau satu orang punya Pro, seluruh grup dapat semua gaya kamera, anggota tanpa batas, foto yang disimpan, kualitas asli, dan recap tanpa watermark.';

  @override
  String get groupCreated => 'Grup dibuat ✓';

  @override
  String get inviteFriends => 'Undang teman-temanmu';

  @override
  String get codeCopied => 'Kode disalin';

  @override
  String get shareLink => 'Bagikan tautan';

  @override
  String inviteSubject(String groupName) {
    return 'Gabung ke $groupName di CamTrip';
  }

  @override
  String inviteMembersUnlimited(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count anggota',
    );
    return '$_temp0 · tanpa batas (Pro)';
  }

  @override
  String inviteMembersLimit(int count, int limit) {
    return '$count dari $limit anggota · Pro: tanpa batas';
  }

  @override
  String get toCamera => 'Ke kamera';

  @override
  String get done => 'Selesai';

  @override
  String get joinEnterCode => 'Masukkan kode 6 karakter';

  @override
  String get joinGroupTitle => 'Gabung ke grup';

  @override
  String get joinGroupSubtitle =>
      'Masukkan kode temanmu, atau pindai kode QR mereka.';

  @override
  String get typeCode => 'Ketik kode';

  @override
  String get scanQr => 'Pindai QR';

  @override
  String get join => 'Gabung';

  @override
  String get groupNameRequired => 'Beri nama grupmu';

  @override
  String get newGroup => 'Grup baru';

  @override
  String get groupType => 'Jenis grup';

  @override
  String get groupTypeVacation => 'Liburan';

  @override
  String get groupTypeVacationDescription =>
      'Dengan tanggal mulai dan selesai, lalu diarsipkan';

  @override
  String get groupTypeEvent => 'Acara';

  @override
  String get groupTypeEventDescription =>
      'Satu hari atau malam, misalnya pesta';

  @override
  String get groupTypePermanent => 'Selalu terbuka';

  @override
  String get groupTypePermanentDescription => 'Untuk geng tetapmu';

  @override
  String get date => 'Tanggal';

  @override
  String get departure => 'Berangkat';

  @override
  String get returnDate => 'Pulang';

  @override
  String get defaultCameraStyle => 'Gaya kamera bawaan';

  @override
  String freeLimitPermanent(int max) {
    return 'Gratis: hingga $max anggota. Tanpa batas dengan Pro.';
  }

  @override
  String freeLimitDated(int max, int days) {
    return 'Gratis: hingga $max anggota, foto disimpan hingga $days hari setelah tanggal selesai. Tanpa batas dan selamanya dengan Pro.';
  }

  @override
  String get createGroup => 'Buat grup';

  @override
  String get group => 'Grup';

  @override
  String groupCode(String code) {
    return 'kode $code';
  }

  @override
  String get manage => 'Kelola';

  @override
  String get rename => 'Ganti nama';

  @override
  String get changeDates => 'Ubah tanggal';

  @override
  String get finishTrip => 'Selesaikan perjalanan';

  @override
  String get finishTripSubtitle => 'Tanggal selesai diatur ke hari ini';

  @override
  String get reopenGroup => 'Buka kembali grup';

  @override
  String get closeGroup => 'Tutup grup';

  @override
  String get reopenGroupSubtitle => 'Anggota bisa menambahkan foto lagi';

  @override
  String get closeGroupSubtitle =>
      'Tak ada yang bisa menambahkan foto lagi; semuanya tetap bisa dilihat';

  @override
  String get members => 'Anggota';

  @override
  String memberYou(String name) {
    return '$name (kamu)';
  }

  @override
  String get blockedTag => 'diblokir';

  @override
  String get adminTag => 'admin';

  @override
  String removeMemberTitle(String name) {
    return 'Keluarkan $name?';
  }

  @override
  String get removeMemberMessage => 'Foto-fotonya tetap ada di grup.';

  @override
  String get remove => 'Hapus';

  @override
  String get removeMember => 'Keluarkan';

  @override
  String blockTitle(String name) {
    return 'Blokir $name?';
  }

  @override
  String blockMessage(String name) {
    return 'Kamu tidak akan lagi melihat foto dan video dari $name atau mendapat notifikasi tentangnya. Kamu bisa membatalkan ini di Pengaturan.';
  }

  @override
  String get block => 'Blokir';

  @override
  String get makeMember => 'Jadikan anggota biasa';

  @override
  String get makeAdmin => 'Jadikan admin';

  @override
  String get removeFromGroup => 'Keluarkan dari grup';

  @override
  String get unblock => 'Buka blokir';

  @override
  String get inviteFriendsButton => 'Undang teman';

  @override
  String get you => 'Kamu';

  @override
  String get unarchive => 'Pulihkan dari arsip';

  @override
  String get archive => 'Arsipkan';

  @override
  String get unarchiveSubtitle => 'Grup kembali ke albummu';

  @override
  String archiveSubtitle(String section) {
    return 'Hanya untukmu: grup pindah ke \"$section\" di bagian bawah albummu';
  }

  @override
  String get archivedSection => 'Diarsipkan';

  @override
  String get hiddenPhotos => 'Foto tersembunyi';

  @override
  String get hiddenPhotosSubtitle => 'Foto yang kamu sembunyikan untuk dirimu';

  @override
  String get leaveGroup => 'Keluar dari grup';

  @override
  String get leaveGroupSubtitle => 'Fotomu tetap ada di grup untuk yang lain';

  @override
  String get deleteGroup => 'Hapus grup';

  @override
  String get deleteGroupSubtitle => 'Semua foto dihapus untuk semua orang';

  @override
  String groupArchived(String groupName) {
    return '\"$groupName\" diarsipkan';
  }

  @override
  String groupUnarchived(String groupName) {
    return '\"$groupName\" kembali ke albummu';
  }

  @override
  String get undo => 'Urungkan';

  @override
  String get groupNameTitle => 'Nama grup';

  @override
  String get finishTripTitle => 'Selesaikan perjalanan?';

  @override
  String get finishTripMessage =>
      'Tanggal selesai menjadi hari ini. Kamu masih bisa menambahkan foto; recap sudah siap.';

  @override
  String get finishTripConfirm => 'Selesaikan';

  @override
  String get tripFinished => 'Perjalanan selesai';

  @override
  String leaveGroupTitle(String groupName) {
    return 'Keluar dari \"$groupName\"?';
  }

  @override
  String get leaveGroupMessage =>
      'Fotomu tetap ada di grup untuk yang lain. Kamu bisa bergabung lagi nanti dengan kode.';

  @override
  String get leave => 'Keluar';

  @override
  String groupDeleted(String groupName) {
    return '\"$groupName\" sudah dihapus';
  }

  @override
  String get youAreAdmin => 'kamu admin';

  @override
  String get open => 'Buka';

  @override
  String get archiveMenuSubtitle => 'Hanya untukmu, yang lain tidak akan tahu';

  @override
  String get deleteGroupMenuSubtitle => 'Untuk semua orang, beserta semua foto';

  @override
  String get deleteGroupTitle => 'Hapus grup?';

  @override
  String deleteGroupMessage(int count, String groupName, int memberCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Semua $count foto dan video',
      one: '1 foto atau video',
    );
    String _temp1 = intl.Intl.pluralLogic(
      memberCount,
      locale: localeName,
      other: 'semua $memberCount anggota',
      one: '1 anggota',
    );
    return '$_temp0 di \"$groupName\" akan hilang untuk $_temp1. Ini tidak bisa dibatalkan.';
  }

  @override
  String get deleteGroupOwnRoll => 'Galeri di ponselmu tidak berubah.';

  @override
  String get deleteGroupTypeName => 'Ketik nama grup untuk konfirmasi:';

  @override
  String get deleteForEveryone => 'Hapus untuk semua';

  @override
  String get save => 'Simpan';

  @override
  String get yourAlbums => 'Albummu';

  @override
  String get uploadQueue => 'Antrean unggahan';

  @override
  String get noConnection => 'Tidak ada koneksi';

  @override
  String get albumsOfflineMessage =>
      'Albummu akan dimuat begitu kamu online lagi. Kamera tetap bisa dipakai.';

  @override
  String get retry => 'Coba lagi';

  @override
  String get noAlbumsTitle => 'Belum ada album';

  @override
  String get noAlbumsMessage =>
      'Buat grup untuk perjalanan berikutnya, atau gabung ke grup teman dengan kodenya.';

  @override
  String get haveCode => 'Aku punya kode';

  @override
  String get joinWithCode => 'Gabung dengan kode atau kode QR';

  @override
  String get camera => 'Kamera';

  @override
  String get restore => 'Pulihkan';

  @override
  String get more => 'Lainnya';

  @override
  String get newAlbum => 'Baru';

  @override
  String get closedTag => 'ditutup';

  @override
  String get activeTag => 'aktif';

  @override
  String get uploadFailed => 'Unggahan gagal';

  @override
  String get queueNoSignal => 'Tidak ada sinyal.';

  @override
  String get queueNoSignalMessage =>
      'Fotomu sudah ada di albummu dan akan dibagikan begitu kamu online lagi.';

  @override
  String get queueWaitingForWifi => 'Menunggu Wi-Fi.';

  @override
  String queueWifiOnlyOn(String setting) {
    return 'Kamu mengaktifkan \"$setting\".';
  }

  @override
  String get queueVideosWifiOnly => 'Video hanya dikirim lewat Wi-Fi.';

  @override
  String get queueAllShared => 'Semua sudah dibagikan ✓';

  @override
  String queuePending(String items) {
    return '$items lagi akan dibagikan';
  }

  @override
  String queuePendingBoth(String photos, String videos) {
    return '$photos dan $videos lagi akan dibagikan';
  }

  @override
  String get retryUpload => 'Coba lagi';

  @override
  String get removeFromQueue => 'Hapus dari antrean';

  @override
  String get queueStatusWifi => 'Wi-Fi';

  @override
  String get queueStatusWaiting => 'menunggu';

  @override
  String get videosWifiOnlyTitle => 'Video hanya lewat Wi-Fi';

  @override
  String get videosWifiOnlySubtitle => 'Menghemat kuota internetmu';

  @override
  String get retryNow => 'Coba sekarang';

  @override
  String get yourName => 'Namamu';

  @override
  String get settings => 'Pengaturan';

  @override
  String get tapToChangeName => 'Ketuk untuk mengganti nama';

  @override
  String get getCamTripPro => 'Dapatkan CamTrip Pro';

  @override
  String get photos => 'Foto';

  @override
  String get saveOwnPhotos => 'Simpan fotoku ke album per grup';

  @override
  String get autoSaveOthers => 'Simpan foto orang lain secara otomatis';

  @override
  String get wifiOnlyTitle => 'Unggah hanya lewat Wi-Fi';

  @override
  String get dateStamp => 'Cap tanggal';

  @override
  String get notifications => 'Notifikasi';

  @override
  String get notifyNewPhotos => 'Foto baru (digabung)';

  @override
  String get notifyRecapReady => 'Recap siap';

  @override
  String get camTripTeam => 'Tim CamTrip';

  @override
  String get adminEntrySubtitle => 'Pengguna, beri Pro, laporan, dan statistik';

  @override
  String get account => 'Akun';

  @override
  String get manageSubscription => 'Kelola langganan';

  @override
  String get blockedPeople => 'Orang yang diblokir';

  @override
  String get nobody => 'Tidak ada';

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
  String get privacyPolicy => 'Kebijakan privasi';

  @override
  String get contact => 'Kontak';

  @override
  String get signOut => 'Keluar';

  @override
  String get deleteAccount => 'Hapus akun';

  @override
  String get deleteAccountSubtitle => 'Menghapus akunmu dan semua fotomu';

  @override
  String get deleteAccountTitle => 'Hapus akun?';

  @override
  String get deleteAccountMessage =>
      'Akunmu serta semua foto dan videomu akan dihapus, termasuk dari grup. Batalkan langganan aktif di App Store atau Google Play.';

  @override
  String get blockedTitle => 'Diblokir';

  @override
  String get blockedSubtitle => 'Kamu tidak melihat foto dari orang-orang ini.';

  @override
  String get blockedNone => 'Kamu belum memblokir siapa pun.';

  @override
  String get unblockShort => 'Buka blokir';

  @override
  String get groupGone =>
      'Grup ini sudah tidak ada, atau kamu bukan anggota lagi.';

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
      other: '$count foto dihapus',
    );
    return '$_temp0';
  }

  @override
  String photosDeletedSkipped(int count, int skipped) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto dihapus',
    );
    return '$_temp0, $skipped dilewati';
  }

  @override
  String photosHiddenForYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto disembunyikan untukmu',
    );
    return '$_temp0';
  }

  @override
  String get addedToFavorites => 'Ditambahkan ke favorit';

  @override
  String get removedFromFavorites => 'Dihapus dari favorit';

  @override
  String get photoAccessSettings =>
      'Beri CamTrip akses ke fotomu di Pengaturan';

  @override
  String photosBeingAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto sedang ditambahkan',
    );
    return '$_temp0';
  }

  @override
  String photosUnreadable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto tidak bisa dibaca',
    );
    return '$_temp0';
  }

  @override
  String get groupNotLoaded => 'Grup belum dimuat';

  @override
  String get noFavoritesTitle => 'Belum ada favorit';

  @override
  String get noPhotosTitle => 'Belum ada foto';

  @override
  String get noFavoritesMessage =>
      'Ketuk bintang di foto untuk menaruhnya di sini.';

  @override
  String get noPhotosMessage =>
      'Ambil foto pertama. Semua di grup langsung melihatnya.';

  @override
  String get openCamera => 'Buka kamera';

  @override
  String savingProgress(int done, int total) {
    return 'Menyimpan... $done/$total';
  }

  @override
  String get sharePreparing => 'Menyiapkan...';

  @override
  String sharingProgress(int done, int total) {
    return 'Menyiapkan... $done/$total';
  }

  @override
  String get choosePhotos => 'Pilih foto';

  @override
  String selectedCount(int count) {
    return '$count dipilih';
  }

  @override
  String get selectNone => 'Batalkan pilihan';

  @override
  String get selectAll => 'Pilih semua';

  @override
  String photosWaitingToShare(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto menunggu dibagikan',
    );
    return '$_temp0';
  }

  @override
  String get recapReadyTitle => 'Recap-mu sudah siap';

  @override
  String get recapReadySubtitle => 'Video berlatar musik dari perjalananmu';

  @override
  String get watch => 'Tonton';

  @override
  String get makeRecapNow => 'Buat video recap sekarang';

  @override
  String freeGroupDeleteNotice(String date) {
    return 'Grup gratis: foto disimpan sampai $date. Simpan fotonya atau jadi Pro.';
  }

  @override
  String get filterAll => 'Semua';

  @override
  String get filterFavorites => 'Favorit';

  @override
  String get filterPerPerson => 'Per orang';

  @override
  String get filterPerson => 'Orang';

  @override
  String get select => 'Pilih';

  @override
  String get hiddenFilter => 'Tersembunyi';

  @override
  String get photosBy => 'Foto dari...';

  @override
  String get uploadedTag => 'diunggah';

  @override
  String get saveAll => 'Simpan semua';

  @override
  String get favorite => 'Favorit';

  @override
  String get unfavorite => 'Hapus favorit';

  @override
  String get hide => 'Sembunyikan';

  @override
  String get delete => 'Hapus';

  @override
  String deletePhotosTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Hapus $count foto?',
      one: 'Hapus foto?',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Foto akan hilang untuk semua orang di grup. Ini tidak bisa dibatalkan.',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosNotAllowed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count foto milik orang lain. Foto tersebut tetap ada; hanya admin yang bisa menghapusnya.',
    );
    return '$_temp0';
  }

  @override
  String photosBackInGroup(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto kembali ke grup',
    );
    return '$_temp0';
  }

  @override
  String get showAll => 'Tampilkan semua';

  @override
  String get hiddenPhotosExplainer =>
      'Hanya kamu yang tidak lagi melihat foto-foto ini. Bagi anggota lain, foto tetap ada.';

  @override
  String get nothingHidden => 'Tidak ada yang disembunyikan';

  @override
  String get nothingHiddenMessage =>
      'Foto yang kamu sembunyikan akan muncul di sini.';

  @override
  String showAgainCount(int count) {
    return 'Tampilkan lagi ($count)';
  }

  @override
  String get someone => 'Seseorang';

  @override
  String get savedToAlbum => 'Tersimpan di album fotomu';

  @override
  String get share => 'Bagikan';

  @override
  String get shareFailed => 'Gagal membagikan';

  @override
  String get reportTitle => 'Kenapa kamu melaporkan foto ini?';

  @override
  String get reportSubtitle =>
      'Kami meninjau setiap laporan dalam 24 jam. Foto langsung disembunyikan untukmu.';

  @override
  String get reportThanks => 'Terima kasih, akan kami periksa';

  @override
  String blockMessageAllGroups(String name) {
    return 'Kamu tidak akan lagi melihat foto dan video dari $name di grup mana pun, atau mendapat notifikasi tentangnya. Kamu bisa membatalkan ini di Pengaturan.';
  }

  @override
  String userBlocked(String name) {
    return '$name sudah diblokir';
  }

  @override
  String get videoHiddenForYou => 'Video disembunyikan untukmu';

  @override
  String get photoHiddenForYou => 'Foto disembunyikan untukmu';

  @override
  String get setAsCover => 'Jadikan sampul';

  @override
  String get coverUpdated => 'Foto sampul diperbarui';

  @override
  String get hideForMe => 'Sembunyikan untukku';

  @override
  String get hideForMeSubtitle => 'Anggota lain di grup masih bisa melihatnya';

  @override
  String get reportPhoto => 'Laporkan foto';

  @override
  String blockName(String name) {
    return 'Blokir $name';
  }

  @override
  String get forEveryoneInGroup => 'Untuk semua di grup';

  @override
  String get videoDeleted => 'Video dihapus';

  @override
  String get photoDeleted => 'Foto dihapus';

  @override
  String get photoAccessToSave =>
      'Beri CamTrip akses ke fotomu di Pengaturan untuk menyimpannya';

  @override
  String get phoneFull => 'Memori ponselmu penuh';

  @override
  String get albumSaveFailedShort => 'Gagal menyimpan ke album';

  @override
  String get recapTemplateGoldenHour => 'Golden Hour';

  @override
  String get recapTemplateFast => 'Cepat';

  @override
  String get recapTemplateFilmRoll => 'Rol film';

  @override
  String get recapTemplatePolaroid => 'Polaroid';

  @override
  String get trackSummerEvening => 'Senja Musim Panas';

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
      other: '$count teman',
    );
    return '$_temp0';
  }

  @override
  String get madeWithCamTrip => 'Dibuat dengan CamTrip';

  @override
  String get tagline => 'Satu rol film untuk satu geng';

  @override
  String get videoUnsupportedDevice => 'Gagal membuat video di perangkat ini';

  @override
  String get groupLoadFailed => 'Grup ini gagal dimuat.';

  @override
  String recapNeedsPhotos(int count) {
    return 'Kamu perlu minimal $count foto untuk recap.';
  }

  @override
  String get recapFailed => 'Gagal membuat recap. Coba lagi.';

  @override
  String get recapSaved => 'Recap disimpan ke album fotomu';

  @override
  String get recap => 'Recap';

  @override
  String get recapRendering => 'Membuat recap...';

  @override
  String get videoRendering => 'Membuat video...';

  @override
  String get template => 'Template';

  @override
  String get musicLicense => 'Musik CamTrip sendiri · bebas royalti';

  @override
  String get change => 'Ubah';

  @override
  String get noWatermark => 'Tanpa watermark ✓';

  @override
  String get removeWatermarkPro => 'Hapus watermark dengan Pro';

  @override
  String get proSourceSubscription => 'Langganan';

  @override
  String get proSourceGift => 'Hadiah';

  @override
  String get proSourceAdmin => 'Admin';

  @override
  String get proSourceGroup => 'Lewat grup';

  @override
  String get noPro => 'Tanpa Pro';

  @override
  String proStatusNoEnd(String source) {
    return 'Pro ($source), tanpa tanggal berakhir';
  }

  @override
  String proStatusUntil(String source, String date) {
    return 'Pro ($source), sampai $date';
  }

  @override
  String get lifetime => 'Seumur hidup';

  @override
  String get pickDate => 'Pilih tanggal';

  @override
  String get noAccess => 'Tidak ada akses';

  @override
  String get adminOnlyTeam => 'Kelola hanya untuk tim CamTrip.';

  @override
  String get adminOverview => 'Ringkasan';

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
  String get adminNewThisWeek => 'Baru minggu ini';

  @override
  String get adminGroups => 'Grup';

  @override
  String get adminProSubscription => 'Pro lewat langganan';

  @override
  String get adminProGift => 'Pro sebagai hadiah';

  @override
  String adminWithoutSubscription(int count) {
    return '$count tanpa langganan';
  }

  @override
  String get adminOpenReports => 'Laporan terbuka';

  @override
  String get adminSearchHint => 'Cari nama atau email';

  @override
  String get nobodyFound => 'Tidak ada yang ditemukan';

  @override
  String get loadMore => 'Muat lagi';

  @override
  String get noEmail => 'Tanpa email';

  @override
  String adminDeletePhotoMessage(String groupName) {
    return 'Foto hilang untuk semua orang di \"$groupName\". Semua laporan tentang foto ini diselesaikan.';
  }

  @override
  String get adminBanMessage =>
      'Akun ini tidak bisa lagi masuk atau memakai aplikasi. Kamu bisa membatalkannya nanti.';

  @override
  String get adminDismissTitle => 'Abaikan laporan?';

  @override
  String get adminDismissMessage => 'Foto tetap ada. Laporan ditandai selesai.';

  @override
  String get adminDismiss => 'Abaikan';

  @override
  String get adminAccountBlocked => 'Akun diblokir';

  @override
  String get adminReportDismissed => 'Laporan diabaikan';

  @override
  String get adminNoReports => 'Tidak ada laporan terbuka';

  @override
  String get adminNoReportsMessage => 'Foto yang dilaporkan muncul di sini.';

  @override
  String get deletedTag => 'Dihapus';

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
  String get adminDeletePhoto => 'Hapus foto';

  @override
  String get adminBlockCreator => 'Blokir pembuat';

  @override
  String get loadFailed => 'Gagal memuat';

  @override
  String get adminLifetimeProGiven => 'Pro seumur hidup diberikan';

  @override
  String get adminProGiven => 'Pro diberikan';

  @override
  String adminGiveProUntil(String date) {
    return 'Beri Pro sampai $date';
  }

  @override
  String get adminGiveProLifetime => 'Beri Pro seumur hidup';

  @override
  String adminGiveProFor(String period) {
    return 'Beri Pro selama $period';
  }

  @override
  String get adminReasonHint => 'Alasan, misalnya teman, penguji, influencer';

  @override
  String get adminGivePro => 'Beri Pro';

  @override
  String get adminRevokeTitle => 'Cabut hadiah?';

  @override
  String get adminRevokeMessage =>
      'Pro hadiah langsung berhenti. Langganan miliknya sendiri tetap berjalan.';

  @override
  String get adminRevoke => 'Cabut';

  @override
  String get adminGiftRevoked => 'Hadiah dicabut';

  @override
  String get adminUnbanTitle => 'Buka blokir?';

  @override
  String adminUnbanMessage(String name) {
    return '$name bisa masuk lagi.';
  }

  @override
  String get adminUnbanned => 'Blokir dibuka';

  @override
  String get adminBanUserMessage =>
      'Akun ini tidak bisa lagi masuk atau memakai aplikasi. Foto tetap ada.';

  @override
  String get adminUser => 'Pengguna';

  @override
  String get adminNotVerified => 'belum diverifikasi';

  @override
  String get adminRole => 'Peran';

  @override
  String get adminCreated => 'Dibuat';

  @override
  String get unknown => 'Tidak diketahui';

  @override
  String get adminSignInWith => 'Masuk dengan';

  @override
  String get adminEmailMethod => 'Email';

  @override
  String get adminPhotosAndVideos => 'Foto dan video';

  @override
  String get adminStatus => 'Status';

  @override
  String get adminActive => 'Aktif';

  @override
  String adminActiveUntil(String date) {
    return 'Aktif sampai $date';
  }

  @override
  String adminGiftFrom(String name) {
    return 'Hadiah dari $name';
  }

  @override
  String adminExpiredOn(String date) {
    return 'Berakhir pada $date';
  }

  @override
  String get adminExpired => 'Berakhir';

  @override
  String adminUntil(String date) {
    return 'Sampai $date';
  }

  @override
  String get adminGiveProTitle => 'Beri Pro';

  @override
  String get adminGiveProNote =>
      'Berlaku juga untuk grup orang ini: satu Pro di grup = Pro untuk semua orang di grup itu.';

  @override
  String get adminRevokeGift => 'Cabut hadiah';

  @override
  String get adminModeration => 'Moderasi';

  @override
  String get adminCannotBanSelf => 'Kamu tidak bisa memblokir diri sendiri.';

  @override
  String get adminCannotBanAdmin => 'Admin tidak bisa diblokir.';

  @override
  String get adminUnban => 'Buka blokir';

  @override
  String get adminBanAccount => 'Blokir akun';

  @override
  String get googleSignInUnavailable => 'Masuk dengan Google belum tersedia';

  @override
  String get cameraPickerTitle => 'Pilih kameramu';

  @override
  String get cameraPickerSubtitle =>
      'Setiap kamera memberi fotomu tampilan khas';

  @override
  String get cameraPickerChange => 'Ganti kamera';

  @override
  String get cameraPickerUnlock => 'Buka dengan Pro';

  @override
  String get cameraPickerSelected => 'Dipilih';

  @override
  String get cameraPickerStyleSummer => 'Musim Panas';

  @override
  String get cameraPickerStyleSummerDescription =>
      'Warna hangat dan pudar seperti foto tahun 90-an';

  @override
  String get cameraPickerStyleNight => 'Malam 800';

  @override
  String get cameraPickerStyleNightDescription =>
      'Film bioskop: bayangan teal, cahaya hangat, banyak grain';

  @override
  String get cameraPickerStyleSepia => 'Sepia';

  @override
  String get cameraPickerStyleSepiaDescription =>
      'Cetakan cokelat lama dari kotak sepatu';

  @override
  String get cameraPickerStyleLomo => 'Lomo';

  @override
  String get cameraPickerStyleLomoDescription =>
      'Warna mencolok, sudut gelap, dan rona warna liar';

  @override
  String get cameraPickerStyleMint => 'Mint';

  @override
  String get cameraPickerStyleMintDescription =>
      'Lembut dan segar dengan rona hijau';

  @override
  String get cameraPickerStylePastel => 'Pink';

  @override
  String get cameraPickerStylePastelDescription =>
      'Warna pastel dengan kilau pink dan bingkai putih';

  @override
  String get cameraPickerStyleSuper8 => 'Super 8';

  @override
  String get cameraPickerStyleSuper8Description =>
      'Ber-grain dan lembut, seperti video rumahan lama';

  @override
  String get paywallBenefitGroup => 'Satu Pro = Pro untuk seluruh grup';

  @override
  String get paywallBenefitUnlimited =>
      'Anggota tanpa batas, foto disimpan selamanya';

  @override
  String get paywallBenefitQuality => 'Tanpa watermark, kualitas asli';

  @override
  String paywallFreeTrial(String period) {
    return 'Gratis $period';
  }

  @override
  String paywallPriceYear(String price) {
    return '$price per tahun.';
  }

  @override
  String paywallPriceYearTrial(String period, String price) {
    return 'Gratis $period, lalu $price per tahun.';
  }

  @override
  String paywallPriceMonth(String price) {
    return '$price per bulan.';
  }

  @override
  String paywallPriceMonthTrial(String period, String price) {
    return 'Gratis $period, lalu $price per bulan.';
  }

  @override
  String paywallAutoRenew(String store) {
    return 'Diperpanjang otomatis. Batalkan paling lambat 24 jam sebelum perpanjangan di $store.';
  }

  @override
  String get paywallDetailsTitle => 'Semua di Pro';

  @override
  String get paywallBenefitStyles => 'Semua gaya kamera';

  @override
  String get allPhotosTitle => 'Semua foto';

  @override
  String get homeTabAlbums => 'Album';

  @override
  String get allPhotosEmptyTitle => 'Belum ada foto';

  @override
  String get allPhotosEmptyMessage => 'Buka kamera dan ambil foto pertamamu.';

  @override
  String get allPhotosLoadFailed => 'Fotomu gagal dimuat';

  @override
  String get cameraSettingsTitle => 'Pengaturan kamera';

  @override
  String get cameraSettingsMore => 'Pengaturan lainnya';

  @override
  String get cameraSettingsGrid => 'Kisi';

  @override
  String get cameraSettingsHaptics => 'Getar saat memotret';

  @override
  String get cameraSettingsDateStamp => 'Cap tanggal di kanan bawah';

  @override
  String get cameraSettingsSound => 'Suara rana';

  @override
  String get cameraSettingsSoundHint => 'Senyap saat ponsel dalam mode senyap';

  @override
  String get cameraSettingsTimer => 'Timer';

  @override
  String get cameraSettingsTimerOff => 'Mati';

  @override
  String cameraSettingsTimerSeconds(int seconds) {
    return '$seconds dtk';
  }

  @override
  String get cameraSettingsTimerCancelHint => 'Ketuk rana untuk membatalkan';

  @override
  String get cameraSettingsMirror => 'Cerminkan selfie';

  @override
  String get cameraSettingsSaveToRoll => 'Simpan ke galeri';

  @override
  String get cameraSettingsQuality => 'Kualitas';

  @override
  String get cameraSettingsQualityStandard => 'Standar';

  @override
  String get cameraSettingsQualityHigh => 'Tinggi';

  @override
  String get cameraLowLightHint => 'Cahaya redup - nyalakan flash';

  @override
  String get cameraFlashUnavailable => 'Kamera ini tidak punya flash';

  @override
  String get cameraFlashScreen => 'Flash layar';

  @override
  String get cameraFlashCycleHint =>
      'Ketuk untuk beralih antara mati, nyala, dan otomatis';

  @override
  String get cameraFlip => 'Beralih antara kamera depan dan belakang';

  @override
  String get cameraFlipHint =>
      'Ketuk dua kali jendela bidik untuk membalik kamera';

  @override
  String cameraPickerPaywallStyles(int count, String styles) {
    return 'Semua $count kamera, termasuk $styles';
  }

  @override
  String get styleFlash => 'Flash 400';

  @override
  String get styleFlashDescription =>
      'Flash langsung di film hangat: kilau amber, grain, merah pekat';

  @override
  String cameraTimerButton(String state) {
    return 'Timer: $state';
  }

  @override
  String get cameraTimerCycleHint =>
      'Ketuk untuk beralih antara mati, 3 dtk, dan 10 dtk';

  @override
  String get cameraLastShotOpen => 'Foto terakhir, membuka album';

  @override
  String get cameraLastShotEmpty => 'Belum ada foto, membuka album';

  @override
  String get deleteOnlyOwnOrAdmin =>
      'Hanya pemotret atau admin yang bisa menghapus ini';

  @override
  String get videoPlay => 'Putar';

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
  String get languageNoResults => 'Bahasa tidak ditemukan';

  @override
  String get personalRollTitle => 'Rol saya';

  @override
  String get personalRollSubtitle => 'Hanya untukmu';

  @override
  String get personalRollPickerSubtitle => 'Foto lepas, hanya untukmu';

  @override
  String get personalRollMove => 'Ke album';

  @override
  String get personalRollMoveTitle => 'Pindahkan ke album';

  @override
  String get personalRollMoveNoAlbums =>
      'Buat album dulu atau gabung ke album dengan kode.';

  @override
  String personalRollMoved(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto dipindahkan ke $album',
    );
    return '$_temp0';
  }

  @override
  String get personalRollPrivateNote =>
      'Hanya kamu yang bisa melihat foto ini. Pindahkan ke album untuk membagikannya.';

  @override
  String get paywallTripPassSub => 'Hanya perjalanan ini, untuk seluruh grup';

  @override
  String get paywallOneTime => 'sekali bayar';

  @override
  String get paywallBestValue => 'Paling hemat';

  @override
  String paywallRollFullTitle(int used, int limit) {
    return 'Rol filmmu penuh - $used/$limit foto';
  }

  @override
  String get paywallRollFullSub => 'Terus memotret dengan Trip Pass atau Pro.';

  @override
  String get paywallCameraTitle => 'Kamera ini bagian dari Pro';

  @override
  String paywallCameraSub(int count) {
    return 'Buka semua $count kamera.';
  }

  @override
  String get paywallWatermarkTitle => 'Recap tanpa watermark';

  @override
  String get paywallWatermarkSub => 'Bagikan recap tanpa logo CamTrip.';

  @override
  String get paywallDeletionTitle => 'Simpan perjalananmu';

  @override
  String paywallDeletionSub(String date) {
    return 'Perjalanan gratis dihapus pada $date. Dengan Trip Pass atau Pro tersimpan selamanya.';
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
      'Pembayaran diterima. Trip Pass segera aktif.';

  @override
  String proViaTripPass(String name) {
    return 'Trip Pass dari $name';
  }

  @override
  String rollCounterSemantics(int used, int limit) {
    return '$used dari $limit jepretan di rol filmmu';
  }

  @override
  String rollHeldTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto tidak muat lagi di rol',
      one: '1 foto tidak muat lagi di rol',
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
      other: 'Simpan perjalananmu - sisa $days hari',
      one: 'Simpan perjalananmu - sisa 1 hari',
    );
    return '$_temp0';
  }

  @override
  String get deletionBannerBody =>
      'Perjalanan gratis dihapus 30 hari setelah selesai. Dengan Trip Pass atau Pro tersimpan selamanya.';

  @override
  String apiRollFull(int limit) {
    return 'Rol filmmu penuh ($limit jepretan). Ambil Trip Pass atau Pro untuk lanjut.';
  }

  @override
  String get apiTripPassFailed =>
      'Trip Pass tidak bisa diaktifkan. Hubungi support@camtrip.app.';

  @override
  String get apiTripPassExists => 'Perjalanan ini sudah punya Trip Pass.';

  @override
  String get tripPassUnavailable =>
      'Trip Pass sedang tidak tersedia. Coba lagi nanti.';

  @override
  String get tripMapTitle => 'Peta perjalanan';

  @override
  String get tripMapOpen => 'Peta dan statistik';

  @override
  String get tripMapLoadFailed => 'Peta tidak bisa dimuat';

  @override
  String get tripMapStatDays => 'Hari';

  @override
  String get tripMapStatPhotos => 'Foto';

  @override
  String get tripMapStatVideos => 'Video';

  @override
  String get tripMapStatMembers => 'Anggota';

  @override
  String get tripMapStatDistance => 'km ditempuh';

  @override
  String get tripMapStatCountries => 'Negara';

  @override
  String get tripMapStatPlaces => 'Tempat';

  @override
  String tripMapBusiestDay(String day, int count) {
    return 'Foto terbanyak: $day ($count)';
  }

  @override
  String tripMapTopPhotographer(String name, int count) {
    return 'Fotografer teratas: $name ($count)';
  }

  @override
  String get tripMapOffTitle => 'Peta perjalanan nonaktif';

  @override
  String get tripMapOffMessage =>
      'Admin bisa mengaktifkan peta di pengaturan grup. Statistik selalu bisa kamu lihat.';

  @override
  String get tripMapOffMessageAdmin =>
      'Aktifkan peta untuk melihat di mana foto kalian diambil. Setiap orang memilih sendiri apakah ikut.';

  @override
  String get tripMapEnable => 'Aktifkan peta';

  @override
  String get tripMapEmptyTitle => 'Belum ada tempat di peta';

  @override
  String get tripMapEmptyMessage =>
      'Foto baru dari anggota yang berbagi lokasi muncul di sini, dibulatkan sekitar 100 m.';

  @override
  String get tripMapConsentTitle => 'Peta perjalanan';

  @override
  String get tripMapConsentQuestion =>
      'Bagikan lokasi pengambilan fotomu di peta grup ini?';

  @override
  String get tripMapConsentDetail =>
      'Hanya anggota grup yang melihatnya, dibulatkan sekitar 100 m. Lokasi tidak pernah disimpan di dalam foto, dan kamu bisa menonaktifkannya kapan saja di pengaturan grup.';

  @override
  String get tripMapConsentYes => 'Ya, bagikan';

  @override
  String get tripMapConsentNo => 'Tidak';

  @override
  String get tripMapLocationDenied =>
      'Tidak ada akses ke lokasimu. Kamu bisa mengizinkannya di pengaturan ponsel.';

  @override
  String get tripMapSettingSubtitle =>
      'Tampilkan di peta di mana foto diambil. Anggota memilih sendiri apakah berbagi.';

  @override
  String get tripMapDisableTitle => 'Nonaktifkan peta?';

  @override
  String get tripMapDisableMessage =>
      'Semua lokasi di grup ini akan dihapus. Jika peta diaktifkan lagi, kami akan bertanya ke semua orang lagi.';

  @override
  String get tripMapDisable => 'Nonaktifkan';

  @override
  String get tripMapMySharing => 'Bagikan lokasiku';

  @override
  String get tripMapMySharingOn =>
      'Foto barumu muncul di peta (dibulatkan sekitar 100 m).';

  @override
  String get tripMapMySharingOff => 'Nonaktif. Fotomu tidak muncul di peta.';

  @override
  String get tripMapStopSharingTitle => 'Berhenti berbagi lokasi?';

  @override
  String get tripMapStopSharingMessage =>
      'Lokasi semua fotomu di grup ini akan dihapus.';

  @override
  String get tripMapStopSharing => 'Berhenti berbagi';
}
