// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get cancel => '취소';

  @override
  String get yes => '예';

  @override
  String inviteMessageIntro(String groupName) {
    return 'CamTrip에서 \"$groupName\" 그룹에 함께할래? 서로 찍은 사진을 바로 볼 수 있어.';
  }

  @override
  String inviteMessageCode(String code) {
    return '또는 코드 입력: $code';
  }

  @override
  String get memberFallbackName => '친구';

  @override
  String get reportReasonInappropriate => '부적절하거나 불쾌한 콘텐츠';

  @override
  String get reportReasonSpam => '스팸';

  @override
  String get reportReasonOther => '기타';

  @override
  String dateRangeSameMonth(
    String startDay,
    String endDay,
    String month,
    String monthNum,
    String endDate,
  ) {
    return '$monthNum $startDay~$endDay';
  }

  @override
  String get errorOffline => '연결되지 않았습니다. 잠시 후 다시 시도하세요.';

  @override
  String errorSomethingWrongStatus(int status) {
    return '문제가 발생했습니다($status)';
  }

  @override
  String get errorSomethingWrong => '문제가 발생했습니다';

  @override
  String get apiInvalidCredentials => '이메일 또는 비밀번호가 올바르지 않습니다';

  @override
  String get apiInvalidCode => '코드가 올바르지 않거나 만료되었습니다. 새 코드를 요청하세요.';

  @override
  String get apiEmailTaken =>
      '이 이메일로 가입된 계정이 이미 있습니다. 로그인하거나 \"비밀번호를 잊으셨나요?\"를 선택하세요.';

  @override
  String apiEmailTakenProvider(String provider) {
    return '이 이메일로 가입된 계정이 이미 있습니다. $provider(으)로 로그인하세요.';
  }

  @override
  String apiWeakPassword(int min) {
    return '비밀번호는 $min자 이상이어야 합니다';
  }

  @override
  String apiNameTooLong(int max) {
    return '이름은 최대 $max자까지 가능합니다';
  }

  @override
  String get apiRateLimited => '시도 횟수가 너무 많습니다. 15분 후에 다시 시도하세요.';

  @override
  String apiAccountBanned(String email) {
    return '계정이 차단되었습니다. 잘못된 조치라고 생각되면 $email로 문의하세요.';
  }

  @override
  String get apiProRequired => '이 카메라 스타일은 CamTrip Pro 전용입니다';

  @override
  String get apiGroupClosed => '이 그룹은 마감되었습니다';

  @override
  String get apiGroupCodeNotFound => '이 코드의 그룹을 찾을 수 없습니다';

  @override
  String apiGroupFull(int max) {
    return '이 그룹은 가득 찼습니다(최대 $max명). 멤버 한 명이 CamTrip Pro면 인원 제한 없이 참여할 수 있습니다.';
  }

  @override
  String get apiLastMember => '마지막 멤버입니다. 대신 그룹을 삭제하세요.';

  @override
  String get apiAdminRequired => 'CamTrip 관리자 전용입니다';

  @override
  String get apiUploadIncomplete => '업로드가 완료되지 않았습니다';

  @override
  String get apiInvalidInput => '잘못된 입력입니다';

  @override
  String get apiNotSignedIn => '로그인되어 있지 않습니다';

  @override
  String get apiAccountGone => '더 이상 존재하지 않는 계정입니다';

  @override
  String get apiPhotoNotFound => '사진을 찾을 수 없습니다';

  @override
  String get apiGroupNotFound => '그룹을 찾을 수 없습니다';

  @override
  String get apiMemberNotFound => '멤버를 찾을 수 없습니다';

  @override
  String get apiPersonNotFound => '사용자를 찾을 수 없습니다';

  @override
  String get apiUserNotFound => '사용자를 찾을 수 없습니다';

  @override
  String get apiAdminOnly => '관리자만 할 수 있습니다';

  @override
  String get apiCannotBlockSelf => '자기 자신은 차단할 수 없습니다';

  @override
  String get apiCannotReportOwn => '내 사진은 신고할 수 없습니다';

  @override
  String get apiDeleteOwnOnly => '내 사진만 삭제할 수 있습니다';

  @override
  String get apiOwnerCannotBeRemoved => '그룹을 만든 사람은 내보낼 수 없습니다';

  @override
  String get apiOwnerStaysAdmin => '그룹을 만든 사람은 계속 관리자입니다';

  @override
  String get apiNeedsOneAdmin => '그룹에는 관리자가 한 명 이상 있어야 합니다';

  @override
  String get apiEndBeforeStart => '종료일이 시작일보다 앞입니다';

  @override
  String get apiPermanentNoEndDate => '항상 열려 있는 그룹에는 종료일이 없습니다';

  @override
  String get apiCannotBanAdmin => '관리자는 차단할 수 없습니다';

  @override
  String get apiReportNotFound => '신고를 찾을 수 없습니다';

  @override
  String get apiPhotoOwnerUnknown => '이 사진을 찍은 사람을 더 이상 알 수 없습니다';

  @override
  String get validationNameRequired => '이름을 입력하세요';

  @override
  String validationMaxChars(int max) {
    return '최대 $max자';
  }

  @override
  String get validationEmailRequired => '이메일 주소를 입력하세요';

  @override
  String get validationEmailInvalid => '올바른 이메일 주소가 아닙니다';

  @override
  String get validationPasswordRequired => '비밀번호를 정하세요';

  @override
  String validationMinChars(int min) {
    return '최소 $min자';
  }

  @override
  String get validationPasswordTooLong => '비밀번호가 너무 깁니다';

  @override
  String get validationPasswordEmpty => '비밀번호를 입력하세요';

  @override
  String get validationCodeRequired => '이메일로 받은 코드를 입력하세요';

  @override
  String get validationCodeDigits => '코드는 6자리 숫자입니다';

  @override
  String get onboarding1Title => '모두가 함께 쓰는\n필름 한 롤.';

  @override
  String get onboarding1Body =>
      '레트로 카메라로 찍으세요. 찍은 사진은 모두에게 바로 보이고, 내 앨범에도 바로 저장돼요.';

  @override
  String get onboarding2Title => '사진 주고받기는\n이제 그만.';

  @override
  String get onboarding2Body =>
      '그룹을 만들고 코드를 공유하면 끝. 더 이상 \"그 사진 좀 보내 줘\"는 없어요.';

  @override
  String get onboarding3Title => '여행이 끝나면\n하이라이트 영상.';

  @override
  String get onboarding3Body => 'CamTrip이 최고의 순간을 모아 음악이 담긴 영상으로 만들어 드려요.';

  @override
  String get onboardingInvited => '초대받았어요! 로그인하고 참여하세요.';

  @override
  String get signInAppleFailed => 'Apple로 로그인하지 못했습니다';

  @override
  String get signInGoogleFailed => 'Google로 로그인하지 못했습니다';

  @override
  String get signInFailed => '로그인하지 못했습니다';

  @override
  String get next => '다음';

  @override
  String get legalPrefix => '계속하면 ';

  @override
  String get legalTerms => '이용약관';

  @override
  String get legalAnd => ' 및 ';

  @override
  String get legalPrivacy => '개인정보 처리방침';

  @override
  String get legalSuffix => '에 동의하게 됩니다.';

  @override
  String get continueWithApple => 'Apple로 계속하기';

  @override
  String get continueWithGoogle => 'Google로 계속하기';

  @override
  String get createAccount => '계정 만들기';

  @override
  String get signIn => '로그인';

  @override
  String get or => '또는';

  @override
  String get registerSubtitle => '누가 찍은 사진인지 친구들이 알 수 있어요.';

  @override
  String get loginSubtitle => '다시 오신 것을 환영해요.';

  @override
  String get forgotPasswordTitle => '비밀번호 찾기';

  @override
  String get forgotPasswordPushSubtitle =>
      '아직 다른 기기에 로그인되어 있나요? 그 기기로 새 비밀번호 설정용 6자리 코드를 알림으로 보내 드려요.';

  @override
  String get newPassword => '새 비밀번호';

  @override
  String get resetPushInfo =>
      '아직 다른 기기에 로그인되어 있다면 그 기기로 코드가 담긴 알림이 가요. 로그인할 수 없나요? 같은 이메일 주소의 Apple 또는 Google로 로그인하세요 - 계정이 연결돼요.';

  @override
  String get sendCode => '코드 보내기';

  @override
  String get savePassword => '비밀번호 저장';

  @override
  String get errorTryAgain => '문제가 발생했습니다. 다시 시도하세요.';

  @override
  String get back => '뒤로';

  @override
  String get name => '이름';

  @override
  String get email => '이메일 주소';

  @override
  String get codeFromPush => '알림에 있는 코드';

  @override
  String get password => '비밀번호';

  @override
  String get hidePassword => '비밀번호 숨기기';

  @override
  String get showPassword => '비밀번호 보기';

  @override
  String get forgotPasswordLink => '비밀번호를 잊으셨나요?';

  @override
  String get haveAccount => '이미 계정이 있나요?';

  @override
  String get newToCamTrip => 'CamTrip이 처음인가요?';

  @override
  String get rememberedIt => '기억나셨나요?';

  @override
  String get noCodeReceived => '코드를 받지 못하셨나요?';

  @override
  String get resendCode => '다시 보내기';

  @override
  String onboardingDemoRoll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '포토그래퍼 $count명, 필름 1롤',
    );
    return '$_temp0';
  }

  @override
  String membersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '멤버 $count명',
    );
    return '$_temp0';
  }

  @override
  String photosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '사진 $count장',
    );
    return '$_temp0';
  }

  @override
  String videosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '동영상 $count개',
    );
    return '$_temp0';
  }

  @override
  String get justNow => '방금';

  @override
  String get badgeNew => 'NEW';

  @override
  String recapTitle(String groupName) {
    return '$groupName 하이라이트';
  }

  @override
  String get styleFilm => '필름';

  @override
  String get styleInstant => '인스턴트';

  @override
  String get styleDisposable => '일회용';

  @override
  String get styleBw => '흑백';

  @override
  String get styleGolden => '골든';

  @override
  String get styleChrome => '크롬';

  @override
  String get styleFilmDescription => '따뜻한 색감, 필름 그레인, 주황색 날짜 스탬프';

  @override
  String get styleInstantDescription => '부드러운 색감과 하얀 테두리';

  @override
  String get styleDisposableDescription => '강한 플래시, 비네트, 빛샘 효과';

  @override
  String get styleBwDescription => '깊은 대비의 거친 흑백';

  @override
  String get styleGoldenDescription => '언제나 골든아워, 부드러운 금빛';

  @override
  String get styleChromeDescription => '슬라이드 필름처럼 차갑고 선명하고 쨍한 색감';

  @override
  String get shutterStopRecording => '녹화 중지';

  @override
  String get shutterStartRecording => '동영상 녹화 시작';

  @override
  String get shutterTakePhoto => '사진 찍기';

  @override
  String get modePhoto => '사진';

  @override
  String get modeVideo => '동영상';

  @override
  String get cameraNotFound => '카메라를 찾을 수 없습니다';

  @override
  String get cameraAccessNeeded => 'CamTrip에 카메라 접근 권한이 필요합니다. 설정에서 허용하세요.';

  @override
  String get cameraStartFailed => '카메라를 시작할 수 없습니다';

  @override
  String get albumAccessNeeded => '사진을 앨범에도 저장하려면 CamTrip에 사진 접근 권한을 허용하세요';

  @override
  String get albumSaveFailed => '앨범에 저장하지 못했습니다. 사진은 그대로 공유됩니다.';

  @override
  String styleProFallback(String style) {
    return '이 스타일은 Pro 전용입니다. 이 그룹에서는 $style(으)로 촬영합니다.';
  }

  @override
  String get photoFailed => '사진을 찍지 못했습니다. 다시 시도하세요.';

  @override
  String get recordingFailed => '동영상을 녹화하지 못했습니다';

  @override
  String get videoFailed => '동영상을 만들지 못했습니다. 다시 시도하세요.';

  @override
  String get shootInGroup => '촬영할 그룹';

  @override
  String get close => '닫기';

  @override
  String get flash => '플래시';

  @override
  String get flashOn => '켬';

  @override
  String get flashOff => '끔';

  @override
  String get flashAuto => '자동';

  @override
  String get chooseGroup => '그룹 선택';

  @override
  String get switchCamera => '카메라 전환';

  @override
  String get createOrJoinFirst => '먼저 그룹을 만들거나 참여하세요';

  @override
  String get proViaGroup => '그룹 덕분에 Pro';

  @override
  String proViaName(String name) {
    return '$name 님 덕분에 Pro';
  }

  @override
  String get proStylesFreeViaMember =>
      'Pro 멤버 덕분에 이 그룹에서는 Pro 스타일을 무료로 쓸 수 있어요';

  @override
  String proStylesFreeViaName(String name) {
    return '이 그룹의 Pro 스타일: $name 님 덕분에 무료';
  }

  @override
  String get subscriptionsUnavailable => '지금은 구독을 이용할 수 없습니다. 나중에 다시 시도하세요.';

  @override
  String get paymentPending => '결제가 아직 처리 중입니다. 완료되면 Pro가 켜집니다.';

  @override
  String get purchaseFailed => '구매하지 못했습니다. 나중에 다시 시도하세요.';

  @override
  String get restoreUnavailable => '지금은 구매를 복원할 수 없습니다. 나중에 다시 시도하세요.';

  @override
  String get restoreFailed => '복원하지 못했습니다. 나중에 다시 시도하세요.';

  @override
  String get welcomePro => 'CamTrip Pro에 오신 것을 환영해요! 🎉';

  @override
  String get proRestored => 'Pro가 복원되었습니다';

  @override
  String get noPurchaseFound => '이전 구매 내역이 없습니다';

  @override
  String periodDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count일',
    );
    return '$_temp0';
  }

  @override
  String periodWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count주',
    );
    return '$_temp0';
  }

  @override
  String periodMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count개월',
    );
    return '$_temp0';
  }

  @override
  String periodYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count년',
    );
    return '$_temp0';
  }

  @override
  String get paywallHavePro => 'CamTrip Pro 이용 중';

  @override
  String get paywallSubtitle => '다음 여행에 필요한 모든 것.';

  @override
  String paywallFeatureStyles(String styles) {
    return '모든 카메라 스타일($styles)';
  }

  @override
  String get paywallFeatureUnlimited => '멤버 수와 저장 공간 무제한, 사진 영구 보관';

  @override
  String get paywallFeatureNoWatermark => '워터마크 없는 하이라이트 영상';

  @override
  String get paywallFeatureOriginal => '원본 화질로 다운로드';

  @override
  String get planYear => '연간';

  @override
  String get planMonth => '월간';

  @override
  String pricePerMonth(String price) {
    return '월 $price';
  }

  @override
  String paywallSaveBadge(int percent) {
    return '$percent% 할인';
  }

  @override
  String get planMonthCancelAnytime => '언제든 해지 가능';

  @override
  String tryFree(String period) {
    return '$period 무료 체험';
  }

  @override
  String get becomePro => 'Pro 시작하기';

  @override
  String get subscriptionsLoadFailed => '구독 정보를 불러오지 못했습니다. 연결을 확인하세요.';

  @override
  String legalAnnual(String price) {
    return 'CamTrip Pro 연간 구독: 연 $price.';
  }

  @override
  String legalAnnualTrial(String period, String price) {
    return 'CamTrip Pro 연간 구독: $period 무료, 이후 연 $price.';
  }

  @override
  String legalMonthly(String price) {
    return 'CamTrip Pro 월간 구독: 월 $price.';
  }

  @override
  String legalMonthlyTrial(String period, String price) {
    return 'CamTrip Pro 월간 구독: $period 무료, 이후 월 $price.';
  }

  @override
  String get legalBillingApple =>
      '결제는 Apple ID로 청구됩니다. 기간 종료 최소 24시간 전에 해지하지 않으면 구독이 자동으로 갱신됩니다. 해지 및 관리는 App Store 계정 설정에서 할 수 있습니다.';

  @override
  String get legalBillingGoogle =>
      '결제는 Google 계정으로 청구됩니다. 기간 종료 최소 24시간 전에 해지하지 않으면 구독이 자동으로 갱신됩니다. 해지 및 관리는 Google Play 계정 설정에서 할 수 있습니다.';

  @override
  String get restorePurchases => '구매 복원';

  @override
  String get terms => '약관';

  @override
  String get privacy => '개인정보';

  @override
  String get groupProTitle => '그룹에 Pro가 한 명이면 모두가 Pro';

  @override
  String get groupProBody =>
      '한 명만 Pro여도 그룹 전체가 모든 카메라 스타일, 무제한 멤버, 영구 보관되는 사진, 원본 화질, 워터마크 없는 하이라이트 영상을 이용할 수 있어요.';

  @override
  String get groupCreated => '그룹을 만들었어요 ✓';

  @override
  String get inviteFriends => '친구 초대하기';

  @override
  String get codeCopied => '코드를 복사했어요';

  @override
  String get shareLink => '링크 공유';

  @override
  String inviteSubject(String groupName) {
    return 'CamTrip에서 $groupName에 참여하세요';
  }

  @override
  String inviteMembersUnlimited(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '멤버 $count명',
    );
    return '$_temp0 · 무제한(Pro)';
  }

  @override
  String inviteMembersLimit(int count, int limit) {
    return '멤버 $count/$limit명 · Pro: 무제한';
  }

  @override
  String get toCamera => '카메라로 가기';

  @override
  String get done => '완료';

  @override
  String get joinEnterCode => '6자리 코드를 입력하세요';

  @override
  String get joinGroupTitle => '그룹 참여';

  @override
  String get joinGroupSubtitle => '친구의 코드를 입력하거나 QR 코드를 스캔하세요.';

  @override
  String get typeCode => '코드 입력';

  @override
  String get scanQr => 'QR 스캔';

  @override
  String get join => '참여';

  @override
  String get groupNameRequired => '그룹 이름을 정하세요';

  @override
  String get newGroup => '새 그룹';

  @override
  String get groupType => '그룹 유형';

  @override
  String get groupTypeVacation => '여행';

  @override
  String get groupTypeVacationDescription => '시작일과 종료일이 있고, 끝나면 보관됨';

  @override
  String get groupTypeEvent => '이벤트';

  @override
  String get groupTypeEventDescription => '하루나 저녁 한때, 예: 파티';

  @override
  String get groupTypePermanent => '항상 열림';

  @override
  String get groupTypePermanentDescription => '늘 함께하는 친구들과';

  @override
  String get date => '날짜';

  @override
  String get departure => '출발';

  @override
  String get returnDate => '귀가';

  @override
  String get defaultCameraStyle => '기본 카메라 스타일';

  @override
  String freeLimitPermanent(int max) {
    return '무료: 최대 $max명. Pro는 무제한.';
  }

  @override
  String freeLimitDated(int max, int days) {
    return '무료: 최대 $max명, 사진은 종료일 후 $days일까지 보관. Pro는 무제한, 영구 보관.';
  }

  @override
  String get createGroup => '그룹 만들기';

  @override
  String get group => '그룹';

  @override
  String groupCode(String code) {
    return '코드 $code';
  }

  @override
  String get manage => '관리';

  @override
  String get rename => '이름 변경';

  @override
  String get changeDates => '날짜 변경';

  @override
  String get finishTrip => '여행 마치기';

  @override
  String get finishTripSubtitle => '종료일을 오늘로 설정합니다';

  @override
  String get reopenGroup => '그룹 다시 열기';

  @override
  String get closeGroup => '그룹 마감';

  @override
  String get reopenGroupSubtitle => '멤버가 다시 사진을 추가할 수 있습니다';

  @override
  String get closeGroupSubtitle => '더 이상 사진을 추가할 수 없지만 계속 볼 수 있습니다';

  @override
  String get members => '멤버';

  @override
  String memberYou(String name) {
    return '$name(나)';
  }

  @override
  String get blockedTag => '차단됨';

  @override
  String get adminTag => '관리자';

  @override
  String removeMemberTitle(String name) {
    return '$name 님을 내보낼까요?';
  }

  @override
  String get removeMemberMessage => '이 멤버의 사진은 그룹에 남습니다.';

  @override
  String get remove => '삭제';

  @override
  String get removeMember => '내보내기';

  @override
  String blockTitle(String name) {
    return '$name 님을 차단할까요?';
  }

  @override
  String blockMessage(String name) {
    return '더 이상 $name 님의 사진과 동영상이 보이지 않고 관련 알림도 받지 않습니다. 설정에서 해제할 수 있습니다.';
  }

  @override
  String get block => '차단';

  @override
  String get makeMember => '일반 멤버로 변경';

  @override
  String get makeAdmin => '관리자로 지정';

  @override
  String get removeFromGroup => '그룹에서 내보내기';

  @override
  String get unblock => '차단 해제';

  @override
  String get inviteFriendsButton => '친구 초대';

  @override
  String get you => '나';

  @override
  String get unarchive => '보관 해제';

  @override
  String get archive => '보관';

  @override
  String get unarchiveSubtitle => '그룹이 다시 앨범 목록에 표시됩니다';

  @override
  String archiveSubtitle(String section) {
    return '나에게만 적용: 그룹이 앨범 목록 아래 \"$section\"(으)로 이동합니다';
  }

  @override
  String get archivedSection => '보관됨';

  @override
  String get hiddenPhotos => '숨긴 사진';

  @override
  String get hiddenPhotosSubtitle => '나만 안 보이게 숨긴 사진';

  @override
  String get leaveGroup => '그룹 나가기';

  @override
  String get leaveGroupSubtitle => '내 사진은 다른 멤버를 위해 그룹에 남습니다';

  @override
  String get deleteGroup => '그룹 삭제';

  @override
  String get deleteGroupSubtitle => '모든 사진이 모두에게서 삭제됩니다';

  @override
  String groupArchived(String groupName) {
    return '\"$groupName\" 보관됨';
  }

  @override
  String groupUnarchived(String groupName) {
    return '\"$groupName\"이(가) 다시 앨범 목록에 표시됩니다';
  }

  @override
  String get undo => '실행 취소';

  @override
  String get groupNameTitle => '그룹 이름';

  @override
  String get finishTripTitle => '여행을 마칠까요?';

  @override
  String get finishTripMessage =>
      '종료일이 오늘이 됩니다. 사진은 계속 추가할 수 있고, 하이라이트 영상이 준비되어 있어요.';

  @override
  String get finishTripConfirm => '마치기';

  @override
  String get tripFinished => '여행을 마쳤어요';

  @override
  String leaveGroupTitle(String groupName) {
    return '\"$groupName\"에서 나갈까요?';
  }

  @override
  String get leaveGroupMessage =>
      '내 사진은 다른 멤버를 위해 그룹에 남습니다. 나중에 코드로 다시 참여할 수 있어요.';

  @override
  String get leave => '나가기';

  @override
  String groupDeleted(String groupName) {
    return '\"$groupName\"을(를) 삭제했어요';
  }

  @override
  String get youAreAdmin => '내가 관리자';

  @override
  String get open => '열기';

  @override
  String get archiveMenuSubtitle => '나에게만 적용되며, 다른 사람은 알 수 없어요';

  @override
  String get deleteGroupMenuSubtitle => '모두에게서, 모든 사진과 함께';

  @override
  String get deleteGroupTitle => '그룹을 삭제할까요?';

  @override
  String deleteGroupMessage(int count, String groupName, int memberCount) {
    return '\"$groupName\"의 사진과 동영상 $count개가 멤버 $memberCount명 모두에게서 사라집니다. 되돌릴 수 없습니다.';
  }

  @override
  String get deleteGroupOwnRoll => '휴대폰의 카메라 롤은 그대로입니다.';

  @override
  String get deleteGroupTypeName => '확인하려면 그룹 이름을 입력하세요:';

  @override
  String get deleteForEveryone => '모두에게서 삭제';

  @override
  String get save => '저장';

  @override
  String get yourAlbums => '내 앨범';

  @override
  String get uploadQueue => '업로드 대기열';

  @override
  String get noConnection => '연결 없음';

  @override
  String get albumsOfflineMessage =>
      '인터넷에 다시 연결되면 앨범을 불러옵니다. 카메라는 그대로 쓸 수 있어요.';

  @override
  String get retry => '다시 시도';

  @override
  String get noAlbumsTitle => '아직 앨범이 없어요';

  @override
  String get noAlbumsMessage => '다음 여행을 위한 그룹을 만들거나, 친구의 코드로 참여하세요.';

  @override
  String get haveCode => '코드가 있어요';

  @override
  String get joinWithCode => '코드나 QR 코드로 참여';

  @override
  String get camera => '카메라';

  @override
  String get restore => '복원';

  @override
  String get more => '더 보기';

  @override
  String get newAlbum => '새로 만들기';

  @override
  String get closedTag => '마감됨';

  @override
  String get activeTag => '사용 중';

  @override
  String get uploadFailed => '업로드 실패';

  @override
  String get queueNoSignal => '신호 없음.';

  @override
  String get queueNoSignalMessage => '사진은 이미 앨범에 있으며, 인터넷에 다시 연결되면 바로 공유됩니다.';

  @override
  String get queueWaitingForWifi => 'Wi-Fi 대기 중.';

  @override
  String queueWifiOnlyOn(String setting) {
    return '\"$setting\"이(가) 켜져 있습니다.';
  }

  @override
  String get queueVideosWifiOnly => '동영상은 Wi-Fi에서만 업로드됩니다.';

  @override
  String get queueAllShared => '모두 공유했어요 ✓';

  @override
  String queuePending(String items) {
    return '공유 대기: $items';
  }

  @override
  String queuePendingBoth(String photos, String videos) {
    return '공유 대기: $photos, $videos';
  }

  @override
  String get retryUpload => '다시 시도';

  @override
  String get removeFromQueue => '대기열에서 삭제';

  @override
  String get queueStatusWifi => 'Wi-Fi';

  @override
  String get queueStatusWaiting => '대기 중';

  @override
  String get videosWifiOnlyTitle => '동영상은 Wi-Fi에서만';

  @override
  String get videosWifiOnlySubtitle => '모바일 데이터 절약';

  @override
  String get retryNow => '지금 다시 시도';

  @override
  String get yourName => '이름';

  @override
  String get settings => '설정';

  @override
  String get tapToChangeName => '탭해서 이름 변경';

  @override
  String get getCamTripPro => 'CamTrip Pro 시작하기';

  @override
  String get photos => '사진';

  @override
  String get saveOwnPhotos => '내 사진을 그룹별 앨범에 저장';

  @override
  String get autoSaveOthers => '다른 사람 사진 자동 저장';

  @override
  String get wifiOnlyTitle => 'Wi-Fi에서만 업로드';

  @override
  String get dateStamp => '날짜 스탬프';

  @override
  String get notifications => '알림';

  @override
  String get notifyNewPhotos => '새 사진(묶어서 알림)';

  @override
  String get notifyRecapReady => '하이라이트 완성';

  @override
  String get camTripTeam => 'CamTrip 팀';

  @override
  String get adminEntrySubtitle => '사용자, Pro 지급, 신고, 통계';

  @override
  String get account => '계정';

  @override
  String get manageSubscription => '구독 관리';

  @override
  String get blockedPeople => '차단한 사람';

  @override
  String get nobody => '없음';

  @override
  String peopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count명',
    );
    return '$_temp0';
  }

  @override
  String get privacyPolicy => '개인정보 처리방침';

  @override
  String get contact => '문의하기';

  @override
  String get signOut => '로그아웃';

  @override
  String get deleteAccount => '계정 삭제';

  @override
  String get deleteAccountSubtitle => '계정과 모든 사진을 삭제합니다';

  @override
  String get deleteAccountTitle => '계정을 삭제할까요?';

  @override
  String get deleteAccountMessage =>
      '계정과 모든 사진, 동영상이 그룹에서도 삭제됩니다. 이용 중인 구독은 App Store 또는 Google Play에서 해지하세요.';

  @override
  String get blockedTitle => '차단됨';

  @override
  String get blockedSubtitle => '이 사람들의 사진은 보이지 않습니다.';

  @override
  String get blockedNone => '차단한 사람이 없습니다.';

  @override
  String get unblockShort => '해제';

  @override
  String get groupGone => '이 그룹이 더 이상 없거나, 더 이상 멤버가 아닙니다.';

  @override
  String photosSavedToAlbum(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '사진 $count장을 \"$album\"에 저장했어요',
    );
    return '$_temp0';
  }

  @override
  String photosDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '사진 $count장을 삭제했어요',
    );
    return '$_temp0';
  }

  @override
  String photosDeletedSkipped(int count, int skipped) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '사진 $count장을 삭제했어요',
    );
    return '$_temp0, $skipped장은 건너뜀';
  }

  @override
  String photosHiddenForYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '사진 $count장을 숨겼어요',
    );
    return '$_temp0';
  }

  @override
  String get addedToFavorites => '즐겨찾기에 추가했어요';

  @override
  String get removedFromFavorites => '즐겨찾기에서 뺐어요';

  @override
  String get photoAccessSettings => '설정에서 CamTrip에 사진 접근 권한을 허용하세요';

  @override
  String photosBeingAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '사진 $count장을 추가하는 중',
    );
    return '$_temp0';
  }

  @override
  String photosUnreadable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '사진 $count장을 읽지 못했어요',
    );
    return '$_temp0';
  }

  @override
  String get groupNotLoaded => '그룹을 불러오지 못함';

  @override
  String get noFavoritesTitle => '아직 즐겨찾기가 없어요';

  @override
  String get noPhotosTitle => '아직 사진이 없어요';

  @override
  String get noFavoritesMessage => '사진의 별을 탭하면 여기에 모여요.';

  @override
  String get noPhotosMessage => '첫 사진을 찍어 보세요. 그룹의 모두가 바로 볼 수 있어요.';

  @override
  String get openCamera => '카메라 열기';

  @override
  String savingProgress(int done, int total) {
    return '저장 중... $done/$total';
  }

  @override
  String get choosePhotos => '사진 선택';

  @override
  String selectedCount(int count) {
    return '$count개 선택됨';
  }

  @override
  String get selectNone => '선택 해제';

  @override
  String get selectAll => '모두 선택';

  @override
  String photosWaitingToShare(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '사진 $count장이 공유를 기다리는 중',
    );
    return '$_temp0';
  }

  @override
  String get recapReadyTitle => '하이라이트 영상이 완성됐어요';

  @override
  String get recapReadySubtitle => '음악과 함께하는 여행 영상';

  @override
  String get watch => '보기';

  @override
  String get makeRecapNow => '지금 하이라이트 영상 만들기';

  @override
  String freeGroupDeleteNotice(String date) {
    return '무료 그룹: 사진은 $date까지 보관됩니다. 저장하거나 Pro를 시작하세요.';
  }

  @override
  String get filterAll => '전체';

  @override
  String get filterFavorites => '즐겨찾기';

  @override
  String get filterPerPerson => '사람별';

  @override
  String get filterPerson => '사람';

  @override
  String get select => '선택';

  @override
  String get hiddenFilter => '숨김';

  @override
  String get photosBy => '사진 찍은 사람...';

  @override
  String get uploadedTag => '업로드됨';

  @override
  String get saveAll => '모두 저장';

  @override
  String get favorite => '즐겨찾기';

  @override
  String get unfavorite => '즐겨찾기 해제';

  @override
  String get hide => '숨기기';

  @override
  String get delete => '삭제';

  @override
  String deletePhotosTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '사진 $count장을 삭제할까요?',
      one: '사진을 삭제할까요?',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '그룹의 모두에게서 사라집니다. 되돌릴 수 없습니다.',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosNotAllowed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '사진 $count장은 다른 사람의 사진이라 그대로 남습니다. 관리자만 삭제할 수 있어요.',
    );
    return '$_temp0';
  }

  @override
  String photosBackInGroup(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '사진 $count장이 그룹에 다시 표시돼요',
    );
    return '$_temp0';
  }

  @override
  String get showAll => '모두 보기';

  @override
  String get hiddenPhotosExplainer =>
      '이 사진은 나에게만 보이지 않아요. 그룹의 다른 사람에게는 그대로 보여요.';

  @override
  String get nothingHidden => '숨긴 사진 없음';

  @override
  String get nothingHiddenMessage => '숨긴 사진은 여기에서 찾을 수 있어요.';

  @override
  String showAgainCount(int count) {
    return '다시 보이기($count)';
  }

  @override
  String get someone => '누군가';

  @override
  String get savedToAlbum => '사진 앨범에 저장했어요';

  @override
  String get share => '공유';

  @override
  String get shareFailed => '공유하지 못했어요';

  @override
  String get reportTitle => '이 사진을 신고하는 이유는 무엇인가요?';

  @override
  String get reportSubtitle => '모든 신고는 24시간 이내에 검토합니다. 사진은 바로 숨겨져요.';

  @override
  String get reportThanks => '감사합니다. 확인해 볼게요';

  @override
  String blockMessageAllGroups(String name) {
    return '어떤 그룹에서도 $name 님의 사진과 동영상이 보이지 않고 관련 알림도 받지 않습니다. 설정에서 해제할 수 있습니다.';
  }

  @override
  String userBlocked(String name) {
    return '$name 님을 차단했어요';
  }

  @override
  String get videoHiddenForYou => '동영상을 숨겼어요';

  @override
  String get photoHiddenForYou => '사진을 숨겼어요';

  @override
  String get setAsCover => '커버로 설정';

  @override
  String get coverUpdated => '커버 사진을 바꿨어요';

  @override
  String get hideForMe => '나만 숨기기';

  @override
  String get hideForMeSubtitle => '그룹의 다른 사람에게는 계속 보여요';

  @override
  String get reportPhoto => '사진 신고';

  @override
  String blockName(String name) {
    return '$name 님 차단';
  }

  @override
  String get forEveryoneInGroup => '그룹의 모두에게서';

  @override
  String get videoDeleted => '동영상을 삭제했어요';

  @override
  String get photoDeleted => '사진을 삭제했어요';

  @override
  String get photoAccessToSave => '저장하려면 설정에서 CamTrip에 사진 접근 권한을 허용하세요';

  @override
  String get phoneFull => '휴대폰 저장 공간이 가득 찼어요';

  @override
  String get albumSaveFailedShort => '앨범에 저장하지 못했어요';

  @override
  String get recapTemplateGoldenHour => '골든아워';

  @override
  String get recapTemplateFast => '빠르게';

  @override
  String get recapTemplateFilmRoll => '필름 롤';

  @override
  String get recapTemplatePolaroid => '폴라로이드';

  @override
  String get trackSummerEvening => '여름 저녁';

  @override
  String get trackGoldenHour => '골든아워';

  @override
  String get trackRoadtrip => '로드 트립';

  @override
  String get moodWarm => '따뜻한';

  @override
  String get moodCheerful => '경쾌한';

  @override
  String friendsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '친구 $count명',
    );
    return '$_temp0';
  }

  @override
  String get madeWithCamTrip => 'Made with CamTrip';

  @override
  String get tagline => '모두가 함께 쓰는 필름 한 롤';

  @override
  String get videoUnsupportedDevice => '이 기기에서는 영상을 만들지 못했어요';

  @override
  String get groupLoadFailed => '이 그룹을 불러오지 못했어요.';

  @override
  String recapNeedsPhotos(int count) {
    return '하이라이트 영상을 만들려면 사진이 $count장 이상 필요해요.';
  }

  @override
  String get recapFailed => '하이라이트 영상을 만들지 못했어요. 다시 시도하세요.';

  @override
  String get recapSaved => '하이라이트 영상을 사진 앨범에 저장했어요';

  @override
  String get recap => '하이라이트';

  @override
  String get recapRendering => '하이라이트 만드는 중...';

  @override
  String get videoRendering => '영상 만드는 중...';

  @override
  String get template => '템플릿';

  @override
  String get musicLicense => 'CamTrip 오리지널 음악 · 저작권 걱정 없음';

  @override
  String get change => '변경';

  @override
  String get noWatermark => '워터마크 없음 ✓';

  @override
  String get removeWatermarkPro => 'Pro로 워터마크 없애기';

  @override
  String get proSourceSubscription => '구독';

  @override
  String get proSourceGift => '선물';

  @override
  String get proSourceAdmin => '관리자';

  @override
  String get proSourceGroup => '그룹 통해';

  @override
  String get noPro => 'Pro 없음';

  @override
  String proStatusNoEnd(String source) {
    return 'Pro($source), 종료일 없음';
  }

  @override
  String proStatusUntil(String source, String date) {
    return 'Pro($source), $date까지';
  }

  @override
  String get lifetime => '평생';

  @override
  String get pickDate => '날짜 선택';

  @override
  String get noAccess => '접근 권한 없음';

  @override
  String get adminOnlyTeam => '관리 화면은 CamTrip 팀 전용입니다.';

  @override
  String get adminOverview => '개요';

  @override
  String get adminUsers => '사용자';

  @override
  String get adminReports => '신고';

  @override
  String adminsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '관리자 $count명',
    );
    return '$_temp0';
  }

  @override
  String get adminNewThisWeek => '이번 주 신규';

  @override
  String get adminGroups => '그룹';

  @override
  String get adminProSubscription => '구독 Pro';

  @override
  String get adminProGift => '선물 Pro';

  @override
  String adminWithoutSubscription(int count) {
    return '구독 없음 $count명';
  }

  @override
  String get adminOpenReports => '미처리 신고';

  @override
  String get adminSearchHint => '이름 또는 이메일로 검색';

  @override
  String get nobodyFound => '찾을 수 없음';

  @override
  String get loadMore => '더 불러오기';

  @override
  String get noEmail => '이메일 없음';

  @override
  String adminDeletePhotoMessage(String groupName) {
    return '\"$groupName\"의 모두에게서 이 사진이 사라집니다. 이 사진에 대한 모든 신고가 처리됩니다.';
  }

  @override
  String get adminBanMessage =>
      '이 계정은 더 이상 로그인하거나 앱을 사용할 수 없습니다. 나중에 되돌릴 수 있습니다.';

  @override
  String get adminDismissTitle => '신고를 기각할까요?';

  @override
  String get adminDismissMessage => '사진은 그대로 남고, 신고는 처리됨으로 표시됩니다.';

  @override
  String get adminDismiss => '기각';

  @override
  String get adminAccountBlocked => '계정을 차단했어요';

  @override
  String get adminReportDismissed => '신고를 기각했어요';

  @override
  String get adminNoReports => '미처리 신고 없음';

  @override
  String get adminNoReportsMessage => '신고된 사진이 여기에 표시됩니다.';

  @override
  String get deletedTag => '삭제됨';

  @override
  String adminReportedBy(String name) {
    return '신고자: $name';
  }

  @override
  String adminPhotoBy(String name) {
    return '촬영자: $name';
  }

  @override
  String reportsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '신고 $count건',
    );
    return '$_temp0';
  }

  @override
  String get adminDeletePhoto => '사진 삭제';

  @override
  String get adminBlockCreator => '촬영자 차단';

  @override
  String get loadFailed => '불러오지 못했어요';

  @override
  String get adminLifetimeProGiven => '평생 Pro를 지급했어요';

  @override
  String get adminProGiven => 'Pro를 지급했어요';

  @override
  String adminGiveProUntil(String date) {
    return '$date까지 Pro 지급';
  }

  @override
  String get adminGiveProLifetime => '평생 Pro 지급';

  @override
  String adminGiveProFor(String period) {
    return '$period 동안 Pro 지급';
  }

  @override
  String get adminReasonHint => '사유(예: 친구, 테스터, 인플루언서)';

  @override
  String get adminGivePro => 'Pro 지급';

  @override
  String get adminRevokeTitle => '선물을 회수할까요?';

  @override
  String get adminRevokeMessage => '선물한 Pro는 바로 종료됩니다. 본인의 구독은 계속 유지됩니다.';

  @override
  String get adminRevoke => '회수';

  @override
  String get adminGiftRevoked => '선물을 회수했어요';

  @override
  String get adminUnbanTitle => '차단을 해제할까요?';

  @override
  String adminUnbanMessage(String name) {
    return '$name 님이 다시 로그인할 수 있습니다.';
  }

  @override
  String get adminUnbanned => '차단을 해제했어요';

  @override
  String get adminBanUserMessage =>
      '이 계정은 더 이상 로그인하거나 앱을 사용할 수 없습니다. 사진은 남습니다.';

  @override
  String get adminUser => '사용자';

  @override
  String get adminNotVerified => '미인증';

  @override
  String get adminRole => '역할';

  @override
  String get adminCreated => '가입일';

  @override
  String get unknown => '알 수 없음';

  @override
  String get adminSignInWith => '로그인 방법';

  @override
  String get adminEmailMethod => '이메일';

  @override
  String get adminPhotosAndVideos => '사진 및 동영상';

  @override
  String get adminStatus => '상태';

  @override
  String get adminActive => '활성';

  @override
  String adminActiveUntil(String date) {
    return '$date까지 활성';
  }

  @override
  String adminGiftFrom(String name) {
    return '$name 님의 선물';
  }

  @override
  String adminExpiredOn(String date) {
    return '$date 만료';
  }

  @override
  String get adminExpired => '만료됨';

  @override
  String adminUntil(String date) {
    return '$date까지';
  }

  @override
  String get adminGiveProTitle => 'Pro 지급';

  @override
  String get adminGiveProNote => '이 사람의 그룹에도 적용돼요: 그룹에 Pro가 한 명이면 모두가 Pro.';

  @override
  String get adminRevokeGift => '선물 회수';

  @override
  String get adminModeration => '모더레이션';

  @override
  String get adminCannotBanSelf => '자기 자신은 차단할 수 없습니다.';

  @override
  String get adminCannotBanAdmin => '관리자는 차단할 수 없습니다.';

  @override
  String get adminUnban => '차단 해제';

  @override
  String get adminBanAccount => '계정 차단';

  @override
  String get googleSignInUnavailable => 'Google 로그인은 아직 이용할 수 없습니다';
}
