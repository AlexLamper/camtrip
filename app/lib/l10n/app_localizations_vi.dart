// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get cancel => 'Hủy';

  @override
  String get yes => 'Có';

  @override
  String inviteMessageIntro(String groupName) {
    return 'Tham gia \"$groupName\" trên CamTrip nhé? Như vậy mình thấy ảnh của nhau ngay lập tức.';
  }

  @override
  String inviteMessageCode(String code) {
    return 'Hoặc nhập mã: $code';
  }

  @override
  String get memberFallbackName => 'Bạn';

  @override
  String get reportReasonInappropriate => 'Không phù hợp hoặc xúc phạm';

  @override
  String get reportReasonSpam => 'Spam';

  @override
  String get reportReasonOther => 'Lý do khác';

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
  String get errorOffline => 'Không có kết nối. Hãy thử lại sau giây lát.';

  @override
  String errorSomethingWrongStatus(int status) {
    return 'Đã xảy ra lỗi ($status)';
  }

  @override
  String get errorSomethingWrong => 'Đã xảy ra lỗi';

  @override
  String get apiInvalidCredentials => 'Địa chỉ email hoặc mật khẩu không đúng';

  @override
  String get apiInvalidCode =>
      'Mã này không đúng hoặc đã hết hạn. Hãy yêu cầu mã mới.';

  @override
  String get apiEmailTaken =>
      'Đã có tài khoản dùng địa chỉ email này. Hãy đăng nhập hoặc chọn \"Quên mật khẩu?\".';

  @override
  String apiEmailTakenProvider(String provider) {
    return 'Đã có tài khoản dùng địa chỉ email này. Hãy đăng nhập bằng $provider.';
  }

  @override
  String apiWeakPassword(int min) {
    return 'Chọn mật khẩu có ít nhất $min ký tự';
  }

  @override
  String apiNameTooLong(int max) {
    return 'Tên của bạn tối đa $max ký tự';
  }

  @override
  String get apiRateLimited => 'Quá nhiều lần thử. Hãy thử lại sau 15 phút.';

  @override
  String apiAccountBanned(String email) {
    return 'Tài khoản của bạn đã bị khóa. Liên hệ $email nếu bạn nghĩ đây là nhầm lẫn.';
  }

  @override
  String get apiProRequired => 'Phong cách máy ảnh này thuộc CamTrip Pro';

  @override
  String get apiGroupClosed => 'Nhóm này đã đóng';

  @override
  String get apiGroupCodeNotFound => 'Không tìm thấy nhóm với mã này';

  @override
  String apiGroupFull(int max) {
    return 'Nhóm đã đầy (tối đa $max thành viên). Nếu một thành viên có CamTrip Pro, ai cũng có thể tham gia.';
  }

  @override
  String get apiLastMember =>
      'Bạn là thành viên cuối cùng. Hãy xóa nhóm thay vào đó.';

  @override
  String get apiAdminRequired => 'Chỉ dành cho quản trị viên CamTrip';

  @override
  String get apiUploadIncomplete => 'Tải lên chưa hoàn tất';

  @override
  String get apiInvalidInput => 'Dữ liệu không hợp lệ';

  @override
  String get apiNotSignedIn => 'Chưa đăng nhập';

  @override
  String get apiAccountGone => 'Tài khoản này không còn tồn tại';

  @override
  String get apiPhotoNotFound => 'Không tìm thấy ảnh';

  @override
  String get apiGroupNotFound => 'Không tìm thấy nhóm';

  @override
  String get apiMemberNotFound => 'Không tìm thấy thành viên';

  @override
  String get apiPersonNotFound => 'Không tìm thấy người này';

  @override
  String get apiUserNotFound => 'Không tìm thấy người dùng';

  @override
  String get apiAdminOnly => 'Chỉ quản trị viên mới làm được việc này';

  @override
  String get apiCannotBlockSelf => 'Bạn không thể tự chặn chính mình';

  @override
  String get apiCannotReportOwn => 'Bạn không thể báo cáo ảnh của chính mình';

  @override
  String get apiDeleteOwnOnly => 'Bạn chỉ có thể xóa ảnh của mình';

  @override
  String get apiOwnerCannotBeRemoved => 'Không thể xóa người tạo nhóm';

  @override
  String get apiOwnerStaysAdmin => 'Người tạo nhóm luôn là quản trị viên';

  @override
  String get apiNeedsOneAdmin => 'Nhóm cần ít nhất một quản trị viên';

  @override
  String get apiEndBeforeStart => 'Ngày kết thúc trước ngày bắt đầu';

  @override
  String get apiPermanentNoEndDate => 'Nhóm luôn mở không có ngày kết thúc';

  @override
  String get apiCannotBanAdmin => 'Không thể chặn quản trị viên';

  @override
  String get apiReportNotFound => 'Không tìm thấy báo cáo';

  @override
  String get apiPhotoOwnerUnknown => 'Không còn biết ai đã chụp ảnh này';

  @override
  String get validationNameRequired => 'Nhập tên của bạn';

  @override
  String validationMaxChars(int max) {
    return 'Tối đa $max ký tự';
  }

  @override
  String get validationEmailRequired => 'Nhập địa chỉ email của bạn';

  @override
  String get validationEmailInvalid => 'Địa chỉ email này không hợp lệ';

  @override
  String get validationPasswordRequired => 'Chọn mật khẩu';

  @override
  String validationMinChars(int min) {
    return 'Ít nhất $min ký tự';
  }

  @override
  String get validationPasswordTooLong => 'Mật khẩu này quá dài';

  @override
  String get validationPasswordEmpty => 'Nhập mật khẩu của bạn';

  @override
  String get validationCodeRequired => 'Nhập mã trong email';

  @override
  String get validationCodeDigits => 'Mã gồm 6 chữ số';

  @override
  String get onboarding1Title => 'Một cuộn phim\ncho cả nhóm.';

  @override
  String get onboarding1Body =>
      'Chụp bằng máy ảnh retro. Mọi người thấy ảnh của bạn ngay lập tức, và ảnh cũng có ngay trong album của bạn.';

  @override
  String get onboarding2Title => 'Không còn phải\ngửi ảnh qua lại.';

  @override
  String get onboarding2Body =>
      'Tạo nhóm, chia sẻ mã, xong. Không bao giờ phải hỏi \"gửi mình mấy tấm ảnh đó được không?\"';

  @override
  String get onboarding3Title => 'Video tổng kết\nsau chuyến đi.';

  @override
  String get onboarding3Body =>
      'CamTrip làm một video có nhạc từ những khoảnh khắc đẹp nhất của cả nhóm.';

  @override
  String get onboardingInvited => 'Bạn được mời! Đăng nhập để tham gia.';

  @override
  String get signInAppleFailed => 'Không đăng nhập được bằng Apple';

  @override
  String get signInGoogleFailed => 'Không đăng nhập được bằng Google';

  @override
  String get signInFailed => 'Không đăng nhập được';

  @override
  String get next => 'Tiếp';

  @override
  String get legalPrefix => 'Khi tiếp tục, bạn đồng ý với';

  @override
  String get legalTerms => 'điều khoản';

  @override
  String get legalAnd => ' và';

  @override
  String get legalPrivacy => 'chính sách quyền riêng tư';

  @override
  String get legalSuffix => '.';

  @override
  String get continueWithApple => 'Tiếp tục với Apple';

  @override
  String get continueWithGoogle => 'Tiếp tục với Google';

  @override
  String get createAccount => 'Tạo tài khoản';

  @override
  String get signIn => 'Đăng nhập';

  @override
  String get or => 'hoặc';

  @override
  String get registerSubtitle => 'Để bạn bè biết ai đã chụp ảnh.';

  @override
  String get loginSubtitle => 'Chào mừng bạn quay lại.';

  @override
  String get forgotPasswordTitle => 'Quên mật khẩu';

  @override
  String get forgotPasswordPushSubtitle =>
      'Bạn vẫn đang đăng nhập ở đâu đó? Chúng tôi sẽ gửi mã 6 chữ số đến đó qua thông báo đẩy để bạn đặt mật khẩu mới.';

  @override
  String get newPassword => 'Mật khẩu mới';

  @override
  String get resetPushInfo =>
      'Nếu bạn vẫn đang đăng nhập ở đâu đó, bạn sẽ nhận được thông báo đẩy kèm mã ở đó. Không vào được? Đăng nhập bằng Apple hoặc Google với cùng địa chỉ email - tài khoản của bạn sẽ được liên kết.';

  @override
  String get sendCode => 'Gửi mã';

  @override
  String get savePassword => 'Lưu mật khẩu';

  @override
  String get errorTryAgain => 'Đã xảy ra lỗi. Vui lòng thử lại.';

  @override
  String get back => 'Quay lại';

  @override
  String get name => 'Tên';

  @override
  String get email => 'Địa chỉ email';

  @override
  String get codeFromPush => 'Mã từ thông báo';

  @override
  String get password => 'Mật khẩu';

  @override
  String get hidePassword => 'Ẩn mật khẩu';

  @override
  String get showPassword => 'Hiện mật khẩu';

  @override
  String get forgotPasswordLink => 'Quên mật khẩu?';

  @override
  String get haveAccount => 'Đã có tài khoản?';

  @override
  String get newToCamTrip => 'Mới dùng CamTrip?';

  @override
  String get rememberedIt => 'Nhớ ra rồi?';

  @override
  String get noCodeReceived => 'Không nhận được mã?';

  @override
  String get resendCode => 'Gửi lại';

  @override
  String onboardingDemoRoll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count người chụp, 1 cuộn phim',
    );
    return '$_temp0';
  }

  @override
  String membersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count thành viên',
    );
    return '$_temp0';
  }

  @override
  String photosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ảnh',
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
  String get justNow => 'vừa xong';

  @override
  String get badgeNew => 'Mới';

  @override
  String recapTitle(String groupName) {
    return 'Tổng kết $groupName';
  }

  @override
  String get styleFilm => 'Film';

  @override
  String get styleInstant => 'Instant';

  @override
  String get styleDisposable => 'Dùng một lần';

  @override
  String get styleBw => 'Đen trắng';

  @override
  String get styleGolden => 'Golden';

  @override
  String get styleChrome => 'Chrome';

  @override
  String get styleFilmDescription => 'Màu ấm, hạt nhiễu và ngày tháng màu cam';

  @override
  String get styleInstantDescription => 'Màu dịu và viền trắng';

  @override
  String get styleDisposableDescription =>
      'Đèn flash gắt, viền tối và vệt sáng lọt';

  @override
  String get styleBwDescription => 'Đen trắng có hạt với độ tương phản sâu';

  @override
  String get styleGoldenDescription => 'Luôn là giờ vàng, ánh vàng dịu nhẹ';

  @override
  String get styleChromeDescription =>
      'Lạnh, rực và sắc nét như phim dương bản';

  @override
  String get shutterStopRecording => 'Dừng quay';

  @override
  String get shutterStartRecording => 'Bắt đầu quay video';

  @override
  String get shutterTakePhoto => 'Chụp ảnh';

  @override
  String get modePhoto => 'Ảnh';

  @override
  String get modeVideo => 'Video';

  @override
  String get cameraNotFound => 'Không tìm thấy máy ảnh';

  @override
  String get cameraAccessNeeded =>
      'CamTrip cần quyền truy cập máy ảnh. Hãy bật trong Cài đặt.';

  @override
  String get cameraStartFailed => 'Không khởi động được máy ảnh';

  @override
  String get albumAccessNeeded =>
      'Cho phép CamTrip truy cập ảnh để lưu ảnh vào album của bạn';

  @override
  String get albumSaveFailed =>
      'Không lưu được vào album. Ảnh vẫn đã được chia sẻ.';

  @override
  String styleProFallback(String style) {
    return 'Phong cách này thuộc Pro. Trong nhóm này bạn chụp bằng $style.';
  }

  @override
  String get photoFailed => 'Không chụp được ảnh. Vui lòng thử lại.';

  @override
  String get recordingFailed => 'Không quay được video';

  @override
  String get videoFailed => 'Không tạo được video. Vui lòng thử lại.';

  @override
  String get shootInGroup => 'Chụp vào nhóm';

  @override
  String get close => 'Đóng';

  @override
  String get flash => 'Đèn flash';

  @override
  String get flashOn => 'Bật';

  @override
  String get flashOff => 'Tắt';

  @override
  String get flashAuto => 'Tự động';

  @override
  String get chooseGroup => 'Chọn nhóm';

  @override
  String get switchCamera => 'Đổi máy ảnh';

  @override
  String get createOrJoinFirst => 'Hãy tạo hoặc tham gia một nhóm trước';

  @override
  String get proViaGroup => 'Pro nhờ nhóm';

  @override
  String proViaName(String name) {
    return 'Pro nhờ $name';
  }

  @override
  String get proStylesFreeViaMember =>
      'Các phong cách Pro trong nhóm này miễn phí cho bạn nhờ một thành viên Pro';

  @override
  String proStylesFreeViaName(String name) {
    return 'Phong cách Pro trong nhóm này: miễn phí cho bạn nhờ $name';
  }

  @override
  String get subscriptionsUnavailable =>
      'Hiện không có gói đăng ký. Vui lòng thử lại sau.';

  @override
  String get paymentPending =>
      'Thanh toán của bạn đang được xử lý. Pro sẽ bật ngay khi hoàn tất.';

  @override
  String get purchaseFailed => 'Mua không thành công. Vui lòng thử lại sau.';

  @override
  String get restoreUnavailable =>
      'Hiện không thể khôi phục giao dịch. Vui lòng thử lại sau.';

  @override
  String get restoreFailed =>
      'Khôi phục không thành công. Vui lòng thử lại sau.';

  @override
  String get welcomePro => 'Chào mừng đến với CamTrip Pro! 🎉';

  @override
  String get proRestored => 'Đã khôi phục Pro';

  @override
  String get noPurchaseFound => 'Không tìm thấy giao dịch trước đó';

  @override
  String periodDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ngày',
    );
    return '$_temp0';
  }

  @override
  String periodWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tuần',
    );
    return '$_temp0';
  }

  @override
  String periodMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tháng',
    );
    return '$_temp0';
  }

  @override
  String periodYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count năm',
    );
    return '$_temp0';
  }

  @override
  String get paywallHavePro => 'Bạn đang có CamTrip Pro';

  @override
  String get paywallSubtitle => 'Mọi thứ cho chuyến đi tiếp theo của bạn.';

  @override
  String paywallFeatureStyles(String styles) {
    return 'Tất cả phong cách máy ảnh ($styles)';
  }

  @override
  String get paywallFeatureUnlimited =>
      'Không giới hạn thành viên và dung lượng, ảnh được giữ mãi mãi';

  @override
  String get paywallFeatureNoWatermark => 'Video tổng kết không có hình mờ';

  @override
  String get paywallFeatureOriginal => 'Tải về chất lượng gốc';

  @override
  String get planYear => 'Năm';

  @override
  String get planMonth => 'Tháng';

  @override
  String pricePerMonth(String price) {
    return '$price mỗi tháng';
  }

  @override
  String paywallSaveBadge(int percent) {
    return 'TIẾT KIỆM $percent%';
  }

  @override
  String get planMonthCancelAnytime => 'hủy bất cứ lúc nào';

  @override
  String tryFree(String period) {
    return 'Dùng thử $period miễn phí';
  }

  @override
  String get becomePro => 'Nâng cấp Pro';

  @override
  String get subscriptionsLoadFailed =>
      'Không tải được gói đăng ký. Hãy kiểm tra kết nối.';

  @override
  String legalAnnual(String price) {
    return 'Gói CamTrip Pro hằng năm: $price mỗi năm.';
  }

  @override
  String legalAnnualTrial(String period, String price) {
    return 'Gói CamTrip Pro hằng năm: miễn phí $period, sau đó $price mỗi năm.';
  }

  @override
  String legalMonthly(String price) {
    return 'Gói CamTrip Pro hằng tháng: $price mỗi tháng.';
  }

  @override
  String legalMonthlyTrial(String period, String price) {
    return 'Gói CamTrip Pro hằng tháng: miễn phí $period, sau đó $price mỗi tháng.';
  }

  @override
  String get legalBillingApple =>
      'Khoản thanh toán được tính vào Apple ID của bạn. Gói đăng ký tự động gia hạn trừ khi bạn hủy ít nhất 24 giờ trước khi kỳ hạn kết thúc. Bạn có thể hủy và quản lý trong cài đặt tài khoản App Store.';

  @override
  String get legalBillingGoogle =>
      'Khoản thanh toán được tính vào tài khoản Google của bạn. Gói đăng ký tự động gia hạn trừ khi bạn hủy ít nhất 24 giờ trước khi kỳ hạn kết thúc. Bạn có thể hủy và quản lý trong cài đặt tài khoản Google Play.';

  @override
  String get restorePurchases => 'Khôi phục giao dịch';

  @override
  String get terms => 'Điều khoản';

  @override
  String get privacy => 'Quyền riêng tư';

  @override
  String get groupProTitle =>
      'Một Pro trong nhóm = Pro cho mọi người trong nhóm đó';

  @override
  String get groupProBody =>
      'Nếu một người có Pro, cả nhóm được dùng mọi phong cách máy ảnh, không giới hạn thành viên, ảnh được giữ lại, chất lượng gốc và video tổng kết không có hình mờ.';

  @override
  String get groupCreated => 'Đã tạo nhóm ✓';

  @override
  String get inviteFriends => 'Mời bạn bè';

  @override
  String get codeCopied => 'Đã sao chép mã';

  @override
  String get shareLink => 'Chia sẻ liên kết';

  @override
  String inviteSubject(String groupName) {
    return 'Tham gia $groupName trên CamTrip';
  }

  @override
  String inviteMembersUnlimited(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count thành viên',
    );
    return '$_temp0 · không giới hạn (Pro)';
  }

  @override
  String inviteMembersLimit(int count, int limit) {
    return '$count/$limit thành viên · Pro: không giới hạn';
  }

  @override
  String get toCamera => 'Đến máy ảnh';

  @override
  String get done => 'Xong';

  @override
  String get joinEnterCode => 'Nhập mã 6 ký tự';

  @override
  String get joinGroupTitle => 'Tham gia nhóm';

  @override
  String get joinGroupSubtitle => 'Nhập mã của bạn bè hoặc quét mã QR của họ.';

  @override
  String get typeCode => 'Nhập mã';

  @override
  String get scanQr => 'Quét QR';

  @override
  String get join => 'Tham gia';

  @override
  String get groupNameRequired => 'Đặt tên cho nhóm';

  @override
  String get newGroup => 'Nhóm mới';

  @override
  String get groupType => 'Loại nhóm';

  @override
  String get groupTypeVacation => 'Kỳ nghỉ';

  @override
  String get groupTypeVacationDescription =>
      'Có ngày bắt đầu và kết thúc, sau đó lưu trữ';

  @override
  String get groupTypeEvent => 'Sự kiện';

  @override
  String get groupTypeEventDescription =>
      'Một ngày hoặc một buổi tối, ví dụ một bữa tiệc';

  @override
  String get groupTypePermanent => 'Luôn mở';

  @override
  String get groupTypePermanentDescription => 'Cho nhóm bạn thân cố định';

  @override
  String get date => 'Ngày';

  @override
  String get departure => 'Khởi hành';

  @override
  String get returnDate => 'Trở về';

  @override
  String get defaultCameraStyle => 'Phong cách máy ảnh mặc định';

  @override
  String freeLimitPermanent(int max) {
    return 'Miễn phí: tối đa $max thành viên. Không giới hạn với Pro.';
  }

  @override
  String freeLimitDated(int max, int days) {
    return 'Miễn phí: tối đa $max thành viên, ảnh được giữ đến $days ngày sau ngày kết thúc. Không giới hạn và mãi mãi với Pro.';
  }

  @override
  String get createGroup => 'Tạo nhóm';

  @override
  String get group => 'Nhóm';

  @override
  String groupCode(String code) {
    return 'mã $code';
  }

  @override
  String get manage => 'Quản lý';

  @override
  String get rename => 'Đổi tên';

  @override
  String get changeDates => 'Đổi ngày';

  @override
  String get finishTrip => 'Kết thúc chuyến đi';

  @override
  String get finishTripSubtitle => 'Đặt ngày kết thúc là hôm nay';

  @override
  String get reopenGroup => 'Mở lại nhóm';

  @override
  String get closeGroup => 'Đóng nhóm';

  @override
  String get reopenGroupSubtitle => 'Thành viên có thể thêm ảnh trở lại';

  @override
  String get closeGroupSubtitle =>
      'Không ai thêm ảnh được nữa; vẫn xem được mọi thứ';

  @override
  String get members => 'Thành viên';

  @override
  String memberYou(String name) {
    return '$name (bạn)';
  }

  @override
  String get blockedTag => 'đã chặn';

  @override
  String get adminTag => 'quản trị';

  @override
  String removeMemberTitle(String name) {
    return 'Xóa $name khỏi nhóm?';
  }

  @override
  String get removeMemberMessage => 'Ảnh của họ vẫn ở lại trong nhóm.';

  @override
  String get remove => 'Xóa';

  @override
  String get removeMember => 'Xóa';

  @override
  String blockTitle(String name) {
    return 'Chặn $name?';
  }

  @override
  String blockMessage(String name) {
    return 'Bạn sẽ không còn thấy ảnh và video của $name hay nhận thông báo về chúng. Bạn có thể hoàn tác trong Cài đặt.';
  }

  @override
  String get block => 'Chặn';

  @override
  String get makeMember => 'Đặt làm thành viên thường';

  @override
  String get makeAdmin => 'Đặt làm quản trị viên';

  @override
  String get removeFromGroup => 'Xóa khỏi nhóm';

  @override
  String get unblock => 'Bỏ chặn';

  @override
  String get inviteFriendsButton => 'Mời bạn bè';

  @override
  String get you => 'Bạn';

  @override
  String get unarchive => 'Khôi phục từ lưu trữ';

  @override
  String get archive => 'Lưu trữ';

  @override
  String get unarchiveSubtitle => 'Nhóm đã trở lại cùng các album của bạn';

  @override
  String archiveSubtitle(String section) {
    return 'Chỉ với bạn: nhóm chuyển xuống mục \"$section\" ở cuối danh sách album';
  }

  @override
  String get archivedSection => 'Đã lưu trữ';

  @override
  String get hiddenPhotos => 'Ảnh đã ẩn';

  @override
  String get hiddenPhotosSubtitle => 'Ảnh bạn đã ẩn đối với mình';

  @override
  String get leaveGroup => 'Rời nhóm';

  @override
  String get leaveGroupSubtitle =>
      'Ảnh của bạn vẫn ở lại trong nhóm cho người khác';

  @override
  String get deleteGroup => 'Xóa nhóm';

  @override
  String get deleteGroupSubtitle => 'Mọi ảnh bị xóa đối với tất cả mọi người';

  @override
  String groupArchived(String groupName) {
    return 'Đã lưu trữ \"$groupName\"';
  }

  @override
  String groupUnarchived(String groupName) {
    return '\"$groupName\" đã trở lại cùng các album của bạn';
  }

  @override
  String get undo => 'Hoàn tác';

  @override
  String get groupNameTitle => 'Tên nhóm';

  @override
  String get finishTripTitle => 'Kết thúc chuyến đi?';

  @override
  String get finishTripMessage =>
      'Ngày kết thúc sẽ là hôm nay. Bạn vẫn có thể thêm ảnh; video tổng kết đã sẵn sàng.';

  @override
  String get finishTripConfirm => 'Kết thúc';

  @override
  String get tripFinished => 'Đã kết thúc chuyến đi';

  @override
  String leaveGroupTitle(String groupName) {
    return 'Rời \"$groupName\"?';
  }

  @override
  String get leaveGroupMessage =>
      'Ảnh của bạn vẫn ở lại trong nhóm cho người khác. Bạn có thể tham gia lại sau bằng mã.';

  @override
  String get leave => 'Rời';

  @override
  String groupDeleted(String groupName) {
    return 'Đã xóa \"$groupName\"';
  }

  @override
  String get youAreAdmin => 'bạn là quản trị viên';

  @override
  String get open => 'Mở';

  @override
  String get archiveMenuSubtitle => 'Chỉ với bạn, người khác sẽ không biết';

  @override
  String get deleteGroupMenuSubtitle => 'Với mọi người, cùng toàn bộ ảnh';

  @override
  String get deleteGroupTitle => 'Xóa nhóm?';

  @override
  String deleteGroupMessage(int count, String groupName, int memberCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Toàn bộ $count ảnh và video',
      one: '1 ảnh hoặc video',
    );
    String _temp1 = intl.Intl.pluralLogic(
      memberCount,
      locale: localeName,
      other: 'cả $memberCount thành viên',
      one: '1 thành viên',
    );
    return '$_temp0 trong \"$groupName\" sẽ biến mất với $_temp1. Không thể hoàn tác.';
  }

  @override
  String get deleteGroupOwnRoll => 'Thư viện ảnh của bạn vẫn giữ nguyên.';

  @override
  String get deleteGroupTypeName => 'Nhập tên nhóm để xác nhận:';

  @override
  String get deleteForEveryone => 'Xóa với mọi người';

  @override
  String get save => 'Lưu';

  @override
  String get yourAlbums => 'Album của bạn';

  @override
  String get uploadQueue => 'Hàng đợi tải lên';

  @override
  String get noConnection => 'Không có kết nối';

  @override
  String get albumsOfflineMessage =>
      'Album sẽ tải khi bạn có mạng trở lại. Máy ảnh vẫn hoạt động.';

  @override
  String get retry => 'Thử lại';

  @override
  String get noAlbumsTitle => 'Chưa có album nào';

  @override
  String get noAlbumsMessage =>
      'Tạo nhóm cho chuyến đi tiếp theo, hoặc tham gia nhóm của bạn bè bằng mã của họ.';

  @override
  String get haveCode => 'Tôi có mã';

  @override
  String get joinWithCode => 'Tham gia bằng mã hoặc mã QR';

  @override
  String get camera => 'Máy ảnh';

  @override
  String get restore => 'Khôi phục';

  @override
  String get more => 'Thêm';

  @override
  String get newAlbum => 'Mới';

  @override
  String get closedTag => 'đã đóng';

  @override
  String get activeTag => 'đang mở';

  @override
  String get uploadFailed => 'Tải lên thất bại';

  @override
  String get queueNoSignal => 'Không có sóng.';

  @override
  String get queueNoSignalMessage =>
      'Ảnh của bạn đã ở trong album và sẽ được chia sẻ ngay khi bạn có mạng trở lại.';

  @override
  String get queueWaitingForWifi => 'Đang chờ Wi-Fi.';

  @override
  String queueWifiOnlyOn(String setting) {
    return 'Bạn đang bật \"$setting\".';
  }

  @override
  String get queueVideosWifiOnly => 'Video chỉ gửi qua Wi-Fi.';

  @override
  String get queueAllShared => 'Đã chia sẻ tất cả ✓';

  @override
  String queuePending(String items) {
    return 'Còn $items cần chia sẻ';
  }

  @override
  String queuePendingBoth(String photos, String videos) {
    return 'Còn $photos và $videos cần chia sẻ';
  }

  @override
  String get retryUpload => 'Thử lại';

  @override
  String get removeFromQueue => 'Xóa khỏi hàng đợi';

  @override
  String get queueStatusWifi => 'Wi-Fi';

  @override
  String get queueStatusWaiting => 'đang chờ';

  @override
  String get videosWifiOnlyTitle => 'Video chỉ qua Wi-Fi';

  @override
  String get videosWifiOnlySubtitle => 'Tiết kiệm dữ liệu di động';

  @override
  String get retryNow => 'Thử lại ngay';

  @override
  String get yourName => 'Tên của bạn';

  @override
  String get settings => 'Cài đặt';

  @override
  String get tapToChangeName => 'Chạm để đổi tên';

  @override
  String get getCamTripPro => 'Nâng cấp CamTrip Pro';

  @override
  String get photos => 'Ảnh';

  @override
  String get saveOwnPhotos => 'Lưu ảnh của tôi vào album riêng cho mỗi nhóm';

  @override
  String get autoSaveOthers => 'Tự động lưu ảnh của người khác';

  @override
  String get wifiOnlyTitle => 'Chỉ tải lên qua Wi-Fi';

  @override
  String get dateStamp => 'Dấu ngày tháng';

  @override
  String get notifications => 'Thông báo';

  @override
  String get notifyNewPhotos => 'Ảnh mới (gộp lại)';

  @override
  String get notifyRecapReady => 'Video tổng kết đã xong';

  @override
  String get camTripTeam => 'Đội ngũ CamTrip';

  @override
  String get adminEntrySubtitle => 'Người dùng, tặng Pro, báo cáo và thống kê';

  @override
  String get account => 'Tài khoản';

  @override
  String get manageSubscription => 'Quản lý gói đăng ký';

  @override
  String get blockedPeople => 'Người đã chặn';

  @override
  String get nobody => 'Không có ai';

  @override
  String peopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count người',
    );
    return '$_temp0';
  }

  @override
  String get privacyPolicy => 'Chính sách quyền riêng tư';

  @override
  String get contact => 'Liên hệ';

  @override
  String get signOut => 'Đăng xuất';

  @override
  String get deleteAccount => 'Xóa tài khoản';

  @override
  String get deleteAccountSubtitle => 'Xóa tài khoản và toàn bộ ảnh của bạn';

  @override
  String get deleteAccountTitle => 'Xóa tài khoản?';

  @override
  String get deleteAccountMessage =>
      'Tài khoản cùng toàn bộ ảnh và video của bạn sẽ bị xóa, kể cả trong các nhóm. Hãy hủy gói đăng ký đang hoạt động trong App Store hoặc Google Play.';

  @override
  String get blockedTitle => 'Đã chặn';

  @override
  String get blockedSubtitle => 'Bạn không thấy ảnh của những người này.';

  @override
  String get blockedNone => 'Bạn chưa chặn ai.';

  @override
  String get unblockShort => 'Bỏ chặn';

  @override
  String get groupGone =>
      'Nhóm này không còn tồn tại, hoặc bạn không còn là thành viên.';

  @override
  String photosSavedToAlbum(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Đã lưu $count ảnh vào \"$album\"',
    );
    return '$_temp0';
  }

  @override
  String photosDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Đã xóa $count ảnh',
    );
    return '$_temp0';
  }

  @override
  String photosDeletedSkipped(int count, int skipped) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Đã xóa $count ảnh',
    );
    return '$_temp0, bỏ qua $skipped';
  }

  @override
  String photosHiddenForYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Đã ẩn $count ảnh đối với bạn',
    );
    return '$_temp0';
  }

  @override
  String get addedToFavorites => 'Đã thêm vào yêu thích';

  @override
  String get removedFromFavorites => 'Đã bỏ khỏi yêu thích';

  @override
  String get photoAccessSettings =>
      'Cho phép CamTrip truy cập ảnh trong Cài đặt';

  @override
  String photosBeingAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Đang thêm $count ảnh',
    );
    return '$_temp0';
  }

  @override
  String photosUnreadable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Không đọc được $count ảnh',
    );
    return '$_temp0';
  }

  @override
  String get groupNotLoaded => 'Chưa tải được nhóm';

  @override
  String get noFavoritesTitle => 'Chưa có ảnh yêu thích';

  @override
  String get noPhotosTitle => 'Chưa có ảnh nào';

  @override
  String get noFavoritesMessage =>
      'Chạm vào ngôi sao trên ảnh để đưa ảnh vào đây.';

  @override
  String get noPhotosMessage =>
      'Chụp tấm ảnh đầu tiên. Mọi người trong nhóm sẽ thấy ngay.';

  @override
  String get openCamera => 'Mở máy ảnh';

  @override
  String savingProgress(int done, int total) {
    return 'Đang lưu... $done/$total';
  }

  @override
  String get sharePreparing => 'Đang chuẩn bị...';

  @override
  String sharingProgress(int done, int total) {
    return 'Đang chuẩn bị... $done/$total';
  }

  @override
  String get choosePhotos => 'Chọn ảnh';

  @override
  String selectedCount(int count) {
    return 'Đã chọn $count';
  }

  @override
  String get selectNone => 'Bỏ chọn';

  @override
  String get selectAll => 'Chọn tất cả';

  @override
  String photosWaitingToShare(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ảnh đang chờ chia sẻ',
    );
    return '$_temp0';
  }

  @override
  String get recapReadyTitle => 'Video tổng kết của bạn đã xong';

  @override
  String get recapReadySubtitle => 'Video có nhạc về chuyến đi của bạn';

  @override
  String get watch => 'Xem';

  @override
  String get makeRecapNow => 'Làm video tổng kết ngay';

  @override
  String freeGroupDeleteNotice(String date) {
    return 'Nhóm miễn phí: ảnh được giữ đến $date. Hãy lưu lại hoặc nâng cấp Pro.';
  }

  @override
  String get filterAll => 'Tất cả';

  @override
  String get filterFavorites => 'Yêu thích';

  @override
  String get filterPerPerson => 'Theo người';

  @override
  String get filterPerson => 'Người';

  @override
  String get select => 'Chọn';

  @override
  String get hiddenFilter => 'Đã ẩn';

  @override
  String get photosBy => 'Ảnh của...';

  @override
  String get uploadedTag => 'đã tải lên';

  @override
  String get saveAll => 'Lưu tất cả';

  @override
  String get favorite => 'Yêu thích';

  @override
  String get unfavorite => 'Bỏ yêu thích';

  @override
  String get hide => 'Ẩn';

  @override
  String get delete => 'Xóa';

  @override
  String deletePhotosTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Xóa $count ảnh?',
      one: 'Xóa ảnh?',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ảnh sẽ biến mất với mọi người trong nhóm. Không thể hoàn tác.',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosNotAllowed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count ảnh thuộc về người khác. Ảnh vẫn giữ lại; chỉ quản trị viên mới xóa được.',
    );
    return '$_temp0';
  }

  @override
  String photosBackInGroup(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ảnh đã trở lại nhóm',
    );
    return '$_temp0';
  }

  @override
  String get showAll => 'Hiện tất cả';

  @override
  String get hiddenPhotosExplainer =>
      'Chỉ mình bạn không còn thấy những ảnh này. Với những người khác trong nhóm, ảnh vẫn còn đó.';

  @override
  String get nothingHidden => 'Không có ảnh nào bị ẩn';

  @override
  String get nothingHiddenMessage => 'Ảnh bạn ẩn sẽ xuất hiện ở đây.';

  @override
  String showAgainCount(int count) {
    return 'Hiện lại ($count)';
  }

  @override
  String get someone => 'Ai đó';

  @override
  String get savedToAlbum => 'Đã lưu vào album ảnh';

  @override
  String get share => 'Chia sẻ';

  @override
  String get shareFailed => 'Không chia sẻ được';

  @override
  String get reportTitle => 'Vì sao bạn báo cáo ảnh này?';

  @override
  String get reportSubtitle =>
      'Chúng tôi xem xét mọi báo cáo trong vòng 24 giờ. Ảnh sẽ bị ẩn với bạn ngay lập tức.';

  @override
  String get reportThanks => 'Cảm ơn, chúng tôi sẽ xem xét';

  @override
  String blockMessageAllGroups(String name) {
    return 'Bạn sẽ không còn thấy ảnh và video của $name trong bất kỳ nhóm nào hay nhận thông báo về chúng. Bạn có thể hoàn tác trong Cài đặt.';
  }

  @override
  String userBlocked(String name) {
    return 'Đã chặn $name';
  }

  @override
  String get videoHiddenForYou => 'Đã ẩn video đối với bạn';

  @override
  String get photoHiddenForYou => 'Đã ẩn ảnh đối với bạn';

  @override
  String get setAsCover => 'Đặt làm ảnh bìa';

  @override
  String get coverUpdated => 'Đã cập nhật ảnh bìa';

  @override
  String get hideForMe => 'Ẩn đối với tôi';

  @override
  String get hideForMeSubtitle => 'Những người khác trong nhóm vẫn thấy';

  @override
  String get reportPhoto => 'Báo cáo ảnh';

  @override
  String blockName(String name) {
    return 'Chặn $name';
  }

  @override
  String get forEveryoneInGroup => 'Với mọi người trong nhóm';

  @override
  String get videoDeleted => 'Đã xóa video';

  @override
  String get photoDeleted => 'Đã xóa ảnh';

  @override
  String get photoAccessToSave =>
      'Cho phép CamTrip truy cập ảnh trong Cài đặt để lưu ảnh';

  @override
  String get phoneFull => 'Bộ nhớ điện thoại đã đầy';

  @override
  String get albumSaveFailedShort => 'Không lưu được vào album';

  @override
  String get recapTemplateGoldenHour => 'Golden Hour';

  @override
  String get recapTemplateFast => 'Nhanh';

  @override
  String get recapTemplateFilmRoll => 'Cuộn phim';

  @override
  String get recapTemplatePolaroid => 'Polaroid';

  @override
  String get trackSummerEvening => 'Chiều hè';

  @override
  String get trackGoldenHour => 'Golden Hour';

  @override
  String get trackRoadtrip => 'Road Trip';

  @override
  String get moodWarm => 'ấm áp';

  @override
  String get moodCheerful => 'vui tươi';

  @override
  String friendsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count người bạn',
    );
    return '$_temp0';
  }

  @override
  String get madeWithCamTrip => 'Làm bằng CamTrip';

  @override
  String get tagline => 'Một cuộn phim cho cả nhóm';

  @override
  String get videoUnsupportedDevice => 'Không tạo được video trên thiết bị này';

  @override
  String get groupLoadFailed => 'Không tải được nhóm này.';

  @override
  String recapNeedsPhotos(int count) {
    return 'Cần ít nhất $count ảnh để làm video tổng kết.';
  }

  @override
  String get recapFailed => 'Không tạo được video tổng kết. Vui lòng thử lại.';

  @override
  String get recapSaved => 'Đã lưu video tổng kết vào album ảnh';

  @override
  String get recap => 'Tổng kết';

  @override
  String get recapRendering => 'Đang làm video tổng kết...';

  @override
  String get videoRendering => 'Đang làm video...';

  @override
  String get template => 'Mẫu';

  @override
  String get musicLicense => 'Nhạc riêng của CamTrip · miễn phí bản quyền';

  @override
  String get change => 'Đổi';

  @override
  String get noWatermark => 'Không có hình mờ ✓';

  @override
  String get removeWatermarkPro => 'Bỏ hình mờ với Pro';

  @override
  String get proSourceSubscription => 'Gói đăng ký';

  @override
  String get proSourceGift => 'Quà tặng';

  @override
  String get proSourceAdmin => 'Quản trị';

  @override
  String get proSourceGroup => 'Nhờ nhóm';

  @override
  String get noPro => 'Không có Pro';

  @override
  String proStatusNoEnd(String source) {
    return 'Pro ($source), không có ngày hết hạn';
  }

  @override
  String proStatusUntil(String source, String date) {
    return 'Pro ($source), đến $date';
  }

  @override
  String get lifetime => 'Trọn đời';

  @override
  String get pickDate => 'Chọn ngày';

  @override
  String get noAccess => 'Không có quyền truy cập';

  @override
  String get adminOnlyTeam => 'Mục quản lý chỉ dành cho đội ngũ CamTrip.';

  @override
  String get adminOverview => 'Tổng quan';

  @override
  String get adminUsers => 'Người dùng';

  @override
  String get adminReports => 'Báo cáo';

  @override
  String adminsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count quản trị viên',
    );
    return '$_temp0';
  }

  @override
  String get adminNewThisWeek => 'Mới trong tuần';

  @override
  String get adminGroups => 'Nhóm';

  @override
  String get adminProSubscription => 'Pro qua gói đăng ký';

  @override
  String get adminProGift => 'Pro được tặng';

  @override
  String adminWithoutSubscription(int count) {
    return '$count không có gói đăng ký';
  }

  @override
  String get adminOpenReports => 'Báo cáo đang mở';

  @override
  String get adminSearchHint => 'Tìm theo tên hoặc email';

  @override
  String get nobodyFound => 'Không tìm thấy ai';

  @override
  String get loadMore => 'Tải thêm';

  @override
  String get noEmail => 'Không có email';

  @override
  String adminDeletePhotoMessage(String groupName) {
    return 'Ảnh sẽ biến mất với mọi người trong \"$groupName\". Mọi báo cáo về ảnh này sẽ được xử lý xong.';
  }

  @override
  String get adminBanMessage =>
      'Tài khoản này sẽ không thể đăng nhập hay dùng ứng dụng nữa. Bạn có thể hoàn tác sau.';

  @override
  String get adminDismissTitle => 'Bỏ qua báo cáo?';

  @override
  String get adminDismissMessage =>
      'Ảnh vẫn giữ lại. Báo cáo được đánh dấu là đã xử lý.';

  @override
  String get adminDismiss => 'Bỏ qua';

  @override
  String get adminAccountBlocked => 'Đã chặn tài khoản';

  @override
  String get adminReportDismissed => 'Đã bỏ qua báo cáo';

  @override
  String get adminNoReports => 'Không có báo cáo đang mở';

  @override
  String get adminNoReportsMessage => 'Ảnh bị báo cáo sẽ hiện ở đây.';

  @override
  String get deletedTag => 'Đã xóa';

  @override
  String adminReportedBy(String name) {
    return 'Bởi $name';
  }

  @override
  String adminPhotoBy(String name) {
    return 'Ảnh của $name';
  }

  @override
  String reportsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count báo cáo',
    );
    return '$_temp0';
  }

  @override
  String get adminDeletePhoto => 'Xóa ảnh';

  @override
  String get adminBlockCreator => 'Chặn người chụp';

  @override
  String get loadFailed => 'Tải không thành công';

  @override
  String get adminLifetimeProGiven => 'Đã tặng Pro trọn đời';

  @override
  String get adminProGiven => 'Đã tặng Pro';

  @override
  String adminGiveProUntil(String date) {
    return 'Tặng Pro đến $date';
  }

  @override
  String get adminGiveProLifetime => 'Tặng Pro trọn đời';

  @override
  String adminGiveProFor(String period) {
    return 'Tặng Pro trong $period';
  }

  @override
  String get adminReasonHint => 'Lý do, ví dụ bạn bè, người thử nghiệm, KOL';

  @override
  String get adminGivePro => 'Tặng Pro';

  @override
  String get adminRevokeTitle => 'Thu hồi quà tặng?';

  @override
  String get adminRevokeMessage =>
      'Pro được tặng sẽ dừng ngay. Gói đăng ký riêng của họ vẫn tiếp tục.';

  @override
  String get adminRevoke => 'Thu hồi';

  @override
  String get adminGiftRevoked => 'Đã thu hồi quà tặng';

  @override
  String get adminUnbanTitle => 'Gỡ chặn?';

  @override
  String adminUnbanMessage(String name) {
    return '$name có thể đăng nhập lại.';
  }

  @override
  String get adminUnbanned => 'Đã gỡ chặn';

  @override
  String get adminBanUserMessage =>
      'Tài khoản này sẽ không thể đăng nhập hay dùng ứng dụng nữa. Ảnh vẫn giữ lại.';

  @override
  String get adminUser => 'Người dùng';

  @override
  String get adminNotVerified => 'chưa xác minh';

  @override
  String get adminRole => 'Vai trò';

  @override
  String get adminCreated => 'Ngày tạo';

  @override
  String get unknown => 'Không rõ';

  @override
  String get adminSignInWith => 'Đăng nhập bằng';

  @override
  String get adminEmailMethod => 'Email';

  @override
  String get adminPhotosAndVideos => 'Ảnh và video';

  @override
  String get adminStatus => 'Trạng thái';

  @override
  String get adminActive => 'Đang hoạt động';

  @override
  String adminActiveUntil(String date) {
    return 'Hoạt động đến $date';
  }

  @override
  String adminGiftFrom(String name) {
    return 'Quà tặng từ $name';
  }

  @override
  String adminExpiredOn(String date) {
    return 'Hết hạn ngày $date';
  }

  @override
  String get adminExpired => 'Đã hết hạn';

  @override
  String adminUntil(String date) {
    return 'Đến $date';
  }

  @override
  String get adminGiveProTitle => 'Tặng Pro';

  @override
  String get adminGiveProNote =>
      'Áp dụng cả cho các nhóm của người này: một Pro trong nhóm = Pro cho mọi người trong nhóm đó.';

  @override
  String get adminRevokeGift => 'Thu hồi quà tặng';

  @override
  String get adminModeration => 'Kiểm duyệt';

  @override
  String get adminCannotBanSelf => 'Bạn không thể tự chặn chính mình.';

  @override
  String get adminCannotBanAdmin => 'Không thể chặn quản trị viên.';

  @override
  String get adminUnban => 'Gỡ chặn';

  @override
  String get adminBanAccount => 'Chặn tài khoản';

  @override
  String get googleSignInUnavailable => 'Chưa thể đăng nhập bằng Google';

  @override
  String get cameraPickerTitle => 'Chọn máy ảnh';

  @override
  String get cameraPickerSubtitle => 'Mỗi máy ảnh cho ảnh của bạn một vẻ riêng';

  @override
  String get cameraPickerChange => 'Đổi máy ảnh';

  @override
  String get cameraPickerUnlock => 'Mở khóa với Pro';

  @override
  String get cameraPickerSelected => 'Đã chọn';

  @override
  String get cameraPickerStyleSummer => 'Mùa hè';

  @override
  String get cameraPickerStyleSummerDescription =>
      'Màu ấm, phai như ảnh chụp thập niên 90';

  @override
  String get cameraPickerStyleNight => 'Đêm 800';

  @override
  String get cameraPickerStyleNightDescription =>
      'Phim điện ảnh: bóng xanh mòng két, ánh sáng ấm, nhiều hạt';

  @override
  String get cameraPickerStyleSepia => 'Sepia';

  @override
  String get cameraPickerStyleSepiaDescription =>
      'Tấm ảnh nâu cũ trong hộp giày';

  @override
  String get cameraPickerStyleLomo => 'Lomo';

  @override
  String get cameraPickerStyleLomoDescription =>
      'Màu đậm, góc tối và tông màu phá cách';

  @override
  String get cameraPickerStyleMint => 'Bạc hà';

  @override
  String get cameraPickerStyleMintDescription =>
      'Dịu và tươi mát với sắc xanh lá';

  @override
  String get cameraPickerStylePastel => 'Hồng';

  @override
  String get cameraPickerStylePastelDescription =>
      'Màu pastel với ánh hồng và viền trắng';

  @override
  String get cameraPickerStyleSuper8 => 'Super 8';

  @override
  String get cameraPickerStyleSuper8Description =>
      'Có hạt và mềm mại như phim gia đình xưa';

  @override
  String get paywallBenefitGroup => 'Một Pro = Pro cho cả nhóm';

  @override
  String get paywallBenefitUnlimited =>
      'Không giới hạn thành viên, ảnh được giữ mãi mãi';

  @override
  String get paywallBenefitQuality => 'Không hình mờ, chất lượng gốc';

  @override
  String paywallFreeTrial(String period) {
    return 'Miễn phí $period';
  }

  @override
  String paywallPriceYear(String price) {
    return '$price mỗi năm.';
  }

  @override
  String paywallPriceYearTrial(String period, String price) {
    return 'Miễn phí $period, sau đó $price mỗi năm.';
  }

  @override
  String paywallPriceMonth(String price) {
    return '$price mỗi tháng.';
  }

  @override
  String paywallPriceMonthTrial(String period, String price) {
    return 'Miễn phí $period, sau đó $price mỗi tháng.';
  }

  @override
  String paywallAutoRenew(String store) {
    return 'Tự động gia hạn. Hủy ít nhất 24 giờ trước khi gia hạn trong $store.';
  }

  @override
  String get paywallDetailsTitle => 'Mọi thứ trong Pro';

  @override
  String get paywallBenefitStyles => 'Tất cả phong cách máy ảnh';

  @override
  String get allPhotosTitle => 'Tất cả ảnh';

  @override
  String get homeTabAlbums => 'Album';

  @override
  String get allPhotosEmptyTitle => 'Chưa có ảnh nào';

  @override
  String get allPhotosEmptyMessage => 'Mở máy ảnh và chụp tấm ảnh đầu tiên.';

  @override
  String get allPhotosLoadFailed => 'Không tải được ảnh của bạn';

  @override
  String get cameraSettingsTitle => 'Cài đặt máy ảnh';

  @override
  String get cameraSettingsMore => 'Cài đặt khác';

  @override
  String get cameraSettingsGrid => 'Lưới';

  @override
  String get cameraSettingsHaptics => 'Rung khi chụp';

  @override
  String get cameraSettingsDateStamp => 'Ngày tháng ở góc dưới bên phải';

  @override
  String get cameraSettingsSound => 'Âm màn trập';

  @override
  String get cameraSettingsSoundHint =>
      'Im lặng khi điện thoại ở chế độ im lặng';

  @override
  String get cameraSettingsTimer => 'Hẹn giờ';

  @override
  String get cameraSettingsTimerOff => 'Tắt';

  @override
  String cameraSettingsTimerSeconds(int seconds) {
    return '$seconds giây';
  }

  @override
  String get cameraSettingsTimerCancelHint => 'Chạm nút chụp để hủy';

  @override
  String get cameraSettingsMirror => 'Lật ảnh selfie';

  @override
  String get cameraSettingsSaveToRoll => 'Lưu vào thư viện ảnh';

  @override
  String get cameraSettingsQuality => 'Chất lượng';

  @override
  String get cameraSettingsQualityStandard => 'Tiêu chuẩn';

  @override
  String get cameraSettingsQualityHigh => 'Cao';

  @override
  String get cameraLowLightHint => 'Thiếu sáng - hãy bật đèn flash';

  @override
  String get cameraFlashUnavailable => 'Máy ảnh này không có đèn flash';

  @override
  String get cameraFlashScreen => 'Flash màn hình';

  @override
  String get cameraFlashCycleHint => 'Chạm để chuyển giữa tắt, bật và tự động';

  @override
  String get cameraFlip => 'Chuyển giữa máy ảnh trước và sau';

  @override
  String get cameraFlipHint => 'Chạm hai lần vào khung ngắm để đổi máy ảnh';

  @override
  String cameraPickerPaywallStyles(int count, String styles) {
    return 'Cả $count máy ảnh, gồm $styles';
  }

  @override
  String get styleFlash => 'Flash 400';

  @override
  String get styleFlashDescription =>
      'Flash trực tiếp trên phim ấm: ánh hổ phách, hạt nhiễu, đỏ rực';

  @override
  String cameraTimerButton(String state) {
    return 'Hẹn giờ: $state';
  }

  @override
  String get cameraTimerCycleHint =>
      'Chạm để chuyển giữa tắt, 3 giây và 10 giây';

  @override
  String get cameraLastShotOpen => 'Ảnh mới nhất, mở album';

  @override
  String get cameraLastShotEmpty => 'Chưa có ảnh, mở album';

  @override
  String get deleteOnlyOwnOrAdmin =>
      'Chỉ người chụp hoặc quản trị viên mới xóa được';

  @override
  String get videoPlay => 'Phát';

  @override
  String get videoPause => 'Tạm dừng';

  @override
  String get language => 'Ngôn ngữ';

  @override
  String get languageSystem => 'Ngôn ngữ hệ thống';

  @override
  String languageSystemCurrent(String language) {
    return 'Hệ thống ($language)';
  }

  @override
  String get languageSearchHint => 'Tìm ngôn ngữ';

  @override
  String get languageNoResults => 'Không tìm thấy ngôn ngữ';

  @override
  String get personalRollTitle => 'Cuộn phim của tôi';

  @override
  String get personalRollSubtitle => 'Chỉ mình bạn';

  @override
  String get personalRollPickerSubtitle => 'Ảnh lẻ, chỉ mình bạn';

  @override
  String get personalRollMove => 'Vào album';

  @override
  String get personalRollMoveTitle => 'Chuyển vào album';

  @override
  String get personalRollMoveNoAlbums =>
      'Hãy tạo album trước hoặc tham gia bằng mã.';

  @override
  String personalRollMoved(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Đã chuyển $count ảnh vào $album',
    );
    return '$_temp0';
  }

  @override
  String get personalRollPrivateNote =>
      'Chỉ bạn thấy những ảnh này. Chuyển chúng vào album để chia sẻ.';

  @override
  String get paywallTripPassSub => 'Chỉ chuyến đi này, cho cả nhóm';

  @override
  String get paywallOneTime => 'một lần';

  @override
  String get paywallBestValue => 'Đáng giá nhất';

  @override
  String paywallRollFullTitle(int used, int limit) {
    return 'Cuộn phim đã đầy - $used/$limit ảnh';
  }

  @override
  String get paywallRollFullSub => 'Chụp tiếp với Trip Pass hoặc Pro.';

  @override
  String get paywallCameraTitle => 'Máy ảnh này thuộc Pro';

  @override
  String paywallCameraSub(int count) {
    return 'Mở khóa cả $count máy ảnh.';
  }

  @override
  String get paywallWatermarkTitle => 'Video tổng kết không hình mờ';

  @override
  String get paywallWatermarkSub =>
      'Chia sẻ video tổng kết không có logo CamTrip.';

  @override
  String get paywallDeletionTitle => 'Giữ lại chuyến đi';

  @override
  String paywallDeletionSub(String date) {
    return 'Chuyến đi miễn phí sẽ bị xóa vào $date. Trip Pass hoặc Pro giữ lại mãi mãi.';
  }

  @override
  String paywallTripPassTerms(String price) {
    return 'Mua một lần $price cho chuyến đi này. Không phải gói đăng ký.';
  }

  @override
  String get buyTripPass => 'Mua Trip Pass';

  @override
  String get tripPassActive =>
      'Trip Pass đang hoạt động: chuyến đi này là Pro cho mọi người';

  @override
  String get tripPassActivating =>
      'Đã nhận thanh toán. Trip Pass của bạn sẽ hoạt động trong giây lát.';

  @override
  String proViaTripPass(String name) {
    return 'Trip Pass của $name';
  }

  @override
  String rollCounterSemantics(int used, int limit) {
    return 'Đã chụp $used trên $limit ảnh của cuộn phim';
  }

  @override
  String rollHeldTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ảnh không còn chỗ trên cuộn phim',
    );
    return '$_temp0';
  }

  @override
  String get rollHeldBody => 'Giữ lại với Pro hoặc Trip Pass';

  @override
  String deletionBannerTitle(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Giữ lại chuyến đi - còn $days ngày',
    );
    return '$_temp0';
  }

  @override
  String get deletionBannerBody =>
      'Chuyến đi miễn phí bị xóa 30 ngày sau khi kết thúc. Trip Pass hoặc Pro giữ lại mãi mãi.';

  @override
  String apiRollFull(int limit) {
    return 'Cuộn phim đã đầy ($limit ảnh). Mua Trip Pass hoặc Pro để chụp tiếp.';
  }

  @override
  String get apiTripPassFailed =>
      'Không kích hoạt được Trip Pass. Liên hệ support@camtrip.app.';

  @override
  String get apiTripPassExists => 'Chuyến đi này đã có Trip Pass.';

  @override
  String get tripPassUnavailable =>
      'Hiện chưa dùng được Trip Pass. Vui lòng thử lại sau.';

  @override
  String get tripMapTitle => 'Bản đồ chuyến đi';

  @override
  String get tripMapOpen => 'Bản đồ và thống kê';

  @override
  String get tripMapLoadFailed => 'Không tải được bản đồ';

  @override
  String get tripMapStatDays => 'Ngày';

  @override
  String get tripMapStatPhotos => 'Ảnh';

  @override
  String get tripMapStatVideos => 'Video';

  @override
  String get tripMapStatMembers => 'Thành viên';

  @override
  String get tripMapStatDistance => 'km đã đi';

  @override
  String get tripMapStatCountries => 'Quốc gia';

  @override
  String get tripMapStatPlaces => 'Địa điểm';

  @override
  String tripMapBusiestDay(String day, int count) {
    return 'Nhiều ảnh nhất: $day ($count)';
  }

  @override
  String tripMapTopPhotographer(String name, int count) {
    return 'Nhiếp ảnh gia hàng đầu: $name ($count)';
  }

  @override
  String get tripMapOffTitle => 'Bản đồ chuyến đi đang tắt';

  @override
  String get tripMapOffMessage =>
      'Quản trị viên có thể bật bản đồ trong cài đặt nhóm. Bạn luôn xem được thống kê.';

  @override
  String get tripMapOffMessageAdmin =>
      'Bật bản đồ để xem ảnh của cả nhóm được chụp ở đâu. Mỗi người tự quyết định có tham gia không.';

  @override
  String get tripMapEnable => 'Bật bản đồ';

  @override
  String get tripMapEmptyTitle => 'Chưa có địa điểm nào trên bản đồ';

  @override
  String get tripMapEmptyMessage =>
      'Ảnh mới của thành viên chia sẻ vị trí sẽ xuất hiện ở đây, làm tròn khoảng 100 m.';

  @override
  String get tripMapConsentTitle => 'Bản đồ chuyến đi';

  @override
  String get tripMapConsentQuestion =>
      'Chia sẻ nơi bạn chụp ảnh trên bản đồ của nhóm này?';

  @override
  String get tripMapConsentDetail =>
      'Chỉ thành viên nhóm thấy, làm tròn khoảng 100 m. Vị trí không bao giờ được lưu vào ảnh và bạn có thể tắt bất cứ lúc nào trong cài đặt nhóm.';

  @override
  String get tripMapConsentYes => 'Có, chia sẻ';

  @override
  String get tripMapConsentNo => 'Không';

  @override
  String get tripMapLocationDenied =>
      'Không có quyền truy cập vị trí. Bạn có thể cho phép trong cài đặt điện thoại.';

  @override
  String get tripMapSettingSubtitle =>
      'Hiển thị trên bản đồ nơi ảnh được chụp. Thành viên tự quyết định có chia sẻ không.';

  @override
  String get tripMapDisableTitle => 'Tắt bản đồ?';

  @override
  String get tripMapDisableMessage =>
      'Mọi vị trí trong nhóm này sẽ bị xóa. Nếu bật lại bản đồ sau này, chúng tôi sẽ hỏi lại mọi người.';

  @override
  String get tripMapDisable => 'Tắt';

  @override
  String get tripMapMySharing => 'Chia sẻ vị trí của tôi';

  @override
  String get tripMapMySharingOn =>
      'Ảnh mới của bạn xuất hiện trên bản đồ (làm tròn khoảng 100 m).';

  @override
  String get tripMapMySharingOff =>
      'Đang tắt. Ảnh của bạn không xuất hiện trên bản đồ.';

  @override
  String get tripMapStopSharingTitle => 'Ngừng chia sẻ vị trí?';

  @override
  String get tripMapStopSharingMessage =>
      'Vị trí của mọi ảnh của bạn trong nhóm này sẽ bị xóa.';

  @override
  String get tripMapStopSharing => 'Ngừng chia sẻ';
}
