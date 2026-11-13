// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get cancel => '取消';

  @override
  String get yes => '是';

  @override
  String inviteMessageIntro(String groupName) {
    return '一起加入 CamTrip 上的「$groupName」吧？这样大家马上就能看到彼此的照片。';
  }

  @override
  String inviteMessageCode(String code) {
    return '或输入邀请码：$code';
  }

  @override
  String get memberFallbackName => '朋友';

  @override
  String get reportReasonInappropriate => '不当或冒犯性内容';

  @override
  String get reportReasonSpam => '垃圾信息';

  @override
  String get reportReasonOther => '其他原因';

  @override
  String dateRangeSameMonth(
    String startDay,
    String endDay,
    String month,
    String monthNum,
    String endDate,
  ) {
    return '$monthNum$startDay至$endDay';
  }

  @override
  String get errorOffline => '无网络连接，请稍后再试。';

  @override
  String errorSomethingWrongStatus(int status) {
    return '出错了（$status）';
  }

  @override
  String get errorSomethingWrong => '出错了';

  @override
  String get apiInvalidCredentials => '邮箱或密码不正确';

  @override
  String get apiInvalidCode => '验证码不正确或已过期，请重新获取。';

  @override
  String get apiEmailTaken => '该邮箱已注册账号。请登录，或选择“忘记密码？”。';

  @override
  String apiEmailTakenProvider(String provider) {
    return '该邮箱已注册账号。请使用 $provider 登录。';
  }

  @override
  String apiWeakPassword(int min) {
    return '请设置至少 $min 个字符的密码';
  }

  @override
  String apiNameTooLong(int max) {
    return '名字最多 $max 个字符';
  }

  @override
  String get apiRateLimited => '尝试次数过多，请 15 分钟后再试。';

  @override
  String apiAccountBanned(String email) {
    return '你的账号已被封禁。如有疑问，请联系 $email。';
  }

  @override
  String get apiProRequired => '此相机风格为 CamTrip Pro 专享';

  @override
  String get apiGroupClosed => '该群组已关闭';

  @override
  String get apiGroupCodeNotFound => '找不到使用此邀请码的群组';

  @override
  String apiGroupFull(int max) {
    return '该群组已满（最多 $max 名成员）。只要有一名成员拥有 CamTrip Pro，人数就不受限制。';
  }

  @override
  String get apiLastMember => '你是最后一名成员，请直接删除群组。';

  @override
  String get apiAdminRequired => '仅限 CamTrip 管理员';

  @override
  String get apiUploadIncomplete => '上传未完成';

  @override
  String get apiInvalidInput => '输入无效';

  @override
  String get apiNotSignedIn => '未登录';

  @override
  String get apiAccountGone => '该账号已不存在';

  @override
  String get apiPhotoNotFound => '找不到照片';

  @override
  String get apiGroupNotFound => '找不到群组';

  @override
  String get apiMemberNotFound => '找不到成员';

  @override
  String get apiPersonNotFound => '找不到此人';

  @override
  String get apiUserNotFound => '找不到用户';

  @override
  String get apiAdminOnly => '只有管理员可以执行此操作';

  @override
  String get apiCannotBlockSelf => '不能屏蔽自己';

  @override
  String get apiCannotReportOwn => '不能举报自己的照片';

  @override
  String get apiDeleteOwnOnly => '只能删除自己的照片';

  @override
  String get apiOwnerCannotBeRemoved => '不能移除群组创建者';

  @override
  String get apiOwnerStaysAdmin => '群组创建者始终是管理员';

  @override
  String get apiNeedsOneAdmin => '群组至少需要一名管理员';

  @override
  String get apiEndBeforeStart => '结束日期早于开始日期';

  @override
  String get apiPermanentNoEndDate => '长期开放的群组没有结束日期';

  @override
  String get apiCannotBanAdmin => '不能封禁管理员';

  @override
  String get apiReportNotFound => '找不到举报';

  @override
  String get apiPhotoOwnerUnknown => '已无法得知这张照片的拍摄者';

  @override
  String get validationNameRequired => '请输入你的名字';

  @override
  String validationMaxChars(int max) {
    return '最多 $max 个字符';
  }

  @override
  String get validationEmailRequired => '请输入邮箱地址';

  @override
  String get validationEmailInvalid => '邮箱地址无效';

  @override
  String get validationPasswordRequired => '请设置密码';

  @override
  String validationMinChars(int min) {
    return '至少 $min 个字符';
  }

  @override
  String get validationPasswordTooLong => '密码太长';

  @override
  String get validationPasswordEmpty => '请输入密码';

  @override
  String get validationCodeRequired => '请输入邮件中的验证码';

  @override
  String get validationCodeDigits => '验证码为 6 位数字';

  @override
  String get onboarding1Title => '全组共用\n一卷胶卷。';

  @override
  String get onboarding1Body => '用复古相机拍照。大家立刻就能看到你的照片，同时也会存进你自己的相册。';

  @override
  String get onboarding2Title => '不用再\n互相传照片。';

  @override
  String get onboarding2Body => '创建群组，分享邀请码，搞定。再也不用问“那些照片发我一下？”';

  @override
  String get onboarding3Title => '旅行结束后\n生成回顾视频。';

  @override
  String get onboarding3Body => 'CamTrip 会把你们最美好的瞬间做成配乐视频。';

  @override
  String get onboardingInvited => '你收到了邀请！登录后即可加入。';

  @override
  String get signInAppleFailed => '无法通过 Apple 登录';

  @override
  String get signInGoogleFailed => '无法通过 Google 登录';

  @override
  String get signInFailed => '登录失败';

  @override
  String get next => '下一步';

  @override
  String get legalPrefix => '继续即表示你同意';

  @override
  String get legalTerms => '使用条款';

  @override
  String get legalAnd => '和';

  @override
  String get legalPrivacy => '隐私政策';

  @override
  String get legalSuffix => '。';

  @override
  String get continueWithApple => '通过 Apple 继续';

  @override
  String get continueWithGoogle => '通过 Google 继续';

  @override
  String get createAccount => '创建账号';

  @override
  String get signIn => '登录';

  @override
  String get or => '或';

  @override
  String get registerSubtitle => '这样朋友们就知道照片是谁拍的。';

  @override
  String get loginSubtitle => '欢迎回来。';

  @override
  String get forgotPasswordTitle => '忘记密码';

  @override
  String get forgotPasswordPushSubtitle =>
      '你还在其他设备上登录着吗？我们会通过推送通知把 6 位数验证码发到那里，用来设置新密码。';

  @override
  String get newPassword => '新密码';

  @override
  String get resetPushInfo =>
      '如果你还在其他设备上登录着，那里会收到一条带验证码的推送通知。无法登录？请使用相同邮箱地址通过 Apple 或 Google 登录 - 你的账号会被关联。';

  @override
  String get sendCode => '发送验证码';

  @override
  String get savePassword => '保存密码';

  @override
  String get errorTryAgain => '出错了，请重试。';

  @override
  String get back => '返回';

  @override
  String get name => '名字';

  @override
  String get email => '邮箱地址';

  @override
  String get codeFromPush => '通知中的验证码';

  @override
  String get password => '密码';

  @override
  String get hidePassword => '隐藏密码';

  @override
  String get showPassword => '显示密码';

  @override
  String get forgotPasswordLink => '忘记密码？';

  @override
  String get haveAccount => '已有账号？';

  @override
  String get newToCamTrip => '第一次用 CamTrip？';

  @override
  String get rememberedIt => '想起来了？';

  @override
  String get noCodeReceived => '没收到验证码？';

  @override
  String get resendCode => '重新发送';

  @override
  String onboardingDemoRoll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 位摄影师，1 卷胶卷',
    );
    return '$_temp0';
  }

  @override
  String membersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 名成员',
    );
    return '$_temp0';
  }

  @override
  String photosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 张照片',
    );
    return '$_temp0';
  }

  @override
  String videosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个视频',
    );
    return '$_temp0';
  }

  @override
  String get justNow => '刚刚';

  @override
  String get badgeNew => '新';

  @override
  String recapTitle(String groupName) {
    return '$groupName 回顾';
  }

  @override
  String get styleFilm => '胶片';

  @override
  String get styleInstant => '拍立得';

  @override
  String get styleDisposable => '一次性';

  @override
  String get styleBw => '黑白';

  @override
  String get styleGolden => '金色';

  @override
  String get styleChrome => '铬彩';

  @override
  String get styleFilmDescription => '暖色调、颗粒感和橙色日期戳';

  @override
  String get styleInstantDescription => '柔和色调和白色边框';

  @override
  String get styleDisposableDescription => '强烈闪光、暗角和漏光';

  @override
  String get styleBwDescription => '颗粒感黑白，对比强烈';

  @override
  String get styleGoldenDescription => '永远的黄金时刻，柔和金色光晕';

  @override
  String get styleChromeDescription => '冷调、饱和、锐利，如反转片';

  @override
  String get shutterStopRecording => '停止录制';

  @override
  String get shutterStartRecording => '开始录制视频';

  @override
  String get shutterTakePhoto => '拍照';

  @override
  String get modePhoto => '照片';

  @override
  String get modeVideo => '视频';

  @override
  String get cameraNotFound => '未找到相机';

  @override
  String get cameraAccessNeeded => 'CamTrip 需要访问你的相机，请在“设置”中开启。';

  @override
  String get cameraStartFailed => '相机无法启动';

  @override
  String get albumAccessNeeded => '允许 CamTrip 访问你的照片，才能同时保存到相册';

  @override
  String get albumSaveFailed => '保存到相册失败，照片仍会分享。';

  @override
  String styleProFallback(String style) {
    return '此风格为 Pro 专享。在这个群组中你将使用$style拍摄。';
  }

  @override
  String get photoFailed => '拍照失败，请重试。';

  @override
  String get recordingFailed => '视频录制失败';

  @override
  String get videoFailed => '视频生成失败，请重试。';

  @override
  String get shootInGroup => '选择拍摄群组';

  @override
  String get close => '关闭';

  @override
  String get flash => '闪光灯';

  @override
  String get flashOn => '开';

  @override
  String get flashOff => '关';

  @override
  String get flashAuto => '自动';

  @override
  String get chooseGroup => '选择群组';

  @override
  String get switchCamera => '切换相机';

  @override
  String get createOrJoinFirst => '请先创建或加入一个群组';

  @override
  String get proViaGroup => '群组 Pro';

  @override
  String proViaName(String name) {
    return 'Pro 来自 $name';
  }

  @override
  String get proStylesFreeViaMember => '多亏一位 Pro 成员，你在这个群组中可免费使用 Pro 风格';

  @override
  String proStylesFreeViaName(String name) {
    return '本群组的 Pro 风格：多亏 $name，你可免费使用';
  }

  @override
  String get subscriptionsUnavailable => '订阅暂不可用，请稍后再试。';

  @override
  String get paymentPending => '你的付款仍在处理中，完成后 Pro 即会开通。';

  @override
  String get purchaseFailed => '购买失败，请稍后再试。';

  @override
  String get restoreUnavailable => '暂时无法恢复购买，请稍后再试。';

  @override
  String get restoreFailed => '恢复失败，请稍后再试。';

  @override
  String get welcomePro => '欢迎使用 CamTrip Pro！🎉';

  @override
  String get proRestored => 'Pro 已恢复';

  @override
  String get noPurchaseFound => '未找到以前的购买记录';

  @override
  String periodDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 天',
    );
    return '$_temp0';
  }

  @override
  String periodWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 周',
    );
    return '$_temp0';
  }

  @override
  String periodMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个月',
    );
    return '$_temp0';
  }

  @override
  String periodYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 年',
    );
    return '$_temp0';
  }

  @override
  String get paywallHavePro => '你已拥有 CamTrip Pro';

  @override
  String get paywallSubtitle => '下一次旅行所需的一切。';

  @override
  String paywallFeatureStyles(String styles) {
    return '所有相机风格（$styles）';
  }

  @override
  String get paywallFeatureUnlimited => '成员和存储空间不限，照片永久保留';

  @override
  String get paywallFeatureNoWatermark => '回顾视频无水印';

  @override
  String get paywallFeatureOriginal => '下载原图画质';

  @override
  String get planYear => '年付';

  @override
  String get planMonth => '月付';

  @override
  String pricePerMonth(String price) {
    return '每月 $price';
  }

  @override
  String paywallSaveBadge(int percent) {
    return '省 $percent%';
  }

  @override
  String get planMonthCancelAnytime => '随时取消';

  @override
  String tryFree(String period) {
    return '免费试用 $period';
  }

  @override
  String get becomePro => '开通 Pro';

  @override
  String get subscriptionsLoadFailed => '无法加载订阅，请检查网络连接。';

  @override
  String legalAnnual(String price) {
    return 'CamTrip Pro 年度订阅：每年 $price。';
  }

  @override
  String legalAnnualTrial(String period, String price) {
    return 'CamTrip Pro 年度订阅：免费 $period，之后每年 $price。';
  }

  @override
  String legalMonthly(String price) {
    return 'CamTrip Pro 月度订阅：每月 $price。';
  }

  @override
  String legalMonthlyTrial(String period, String price) {
    return 'CamTrip Pro 月度订阅：免费 $period，之后每月 $price。';
  }

  @override
  String get legalBillingApple =>
      '费用将通过你的 Apple ID 支付。除非在当前周期结束前至少 24 小时取消，否则订阅将自动续订。你可以在 App Store 账户设置中取消和管理订阅。';

  @override
  String get legalBillingGoogle =>
      '费用将通过你的 Google 账号支付。除非在当前周期结束前至少 24 小时取消，否则订阅将自动续订。你可以在 Google Play 账号设置中取消和管理订阅。';

  @override
  String get restorePurchases => '恢复购买';

  @override
  String get terms => '条款';

  @override
  String get privacy => '隐私';

  @override
  String get groupProTitle => '群组里有一人是 Pro，全组都是 Pro';

  @override
  String get groupProBody =>
      '只要有一个人拥有 Pro，全组都能使用所有相机风格、不限人数、照片永久保留、原图画质和无水印回顾视频。';

  @override
  String get groupCreated => '群组已创建 ✓';

  @override
  String get inviteFriends => '邀请朋友';

  @override
  String get codeCopied => '邀请码已复制';

  @override
  String get shareLink => '分享链接';

  @override
  String inviteSubject(String groupName) {
    return '加入 CamTrip 上的 $groupName';
  }

  @override
  String inviteMembersUnlimited(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 名成员',
    );
    return '$_temp0 · 不限人数（Pro）';
  }

  @override
  String inviteMembersLimit(int count, int limit) {
    return '$count/$limit 名成员 · Pro：不限人数';
  }

  @override
  String get toCamera => '去拍照';

  @override
  String get done => '完成';

  @override
  String get joinEnterCode => '请输入 6 位邀请码';

  @override
  String get joinGroupTitle => '加入群组';

  @override
  String get joinGroupSubtitle => '输入朋友的邀请码，或扫描他们的二维码。';

  @override
  String get typeCode => '输入邀请码';

  @override
  String get scanQr => '扫描二维码';

  @override
  String get join => '加入';

  @override
  String get groupNameRequired => '给群组起个名字';

  @override
  String get newGroup => '新建群组';

  @override
  String get groupType => '群组类型';

  @override
  String get groupTypeVacation => '度假';

  @override
  String get groupTypeVacationDescription => '有开始和结束日期，结束后归档';

  @override
  String get groupTypeEvent => '活动';

  @override
  String get groupTypeEventDescription => '一天或一个晚上，例如派对';

  @override
  String get groupTypePermanent => '长期开放';

  @override
  String get groupTypePermanentDescription => '适合固定的朋友圈';

  @override
  String get date => '日期';

  @override
  String get departure => '出发';

  @override
  String get returnDate => '返回';

  @override
  String get defaultCameraStyle => '默认相机风格';

  @override
  String freeLimitPermanent(int max) {
    return '免费版：最多 $max 名成员。Pro 不限人数。';
  }

  @override
  String freeLimitDated(int max, int days) {
    return '免费版：最多 $max 名成员，照片保留至结束日期后 $days 天。Pro 不限人数且永久保留。';
  }

  @override
  String get createGroup => '创建群组';

  @override
  String get group => '群组';

  @override
  String groupCode(String code) {
    return '邀请码 $code';
  }

  @override
  String get manage => '管理';

  @override
  String get rename => '重命名';

  @override
  String get changeDates => '修改日期';

  @override
  String get finishTrip => '结束旅行';

  @override
  String get finishTripSubtitle => '将结束日期设为今天';

  @override
  String get reopenGroup => '重新开放群组';

  @override
  String get closeGroup => '关闭群组';

  @override
  String get reopenGroupSubtitle => '成员可以再次添加照片';

  @override
  String get closeGroupSubtitle => '不能再添加照片，但所有内容仍可查看';

  @override
  String get members => '成员';

  @override
  String memberYou(String name) {
    return '$name（你）';
  }

  @override
  String get blockedTag => '已屏蔽';

  @override
  String get adminTag => '管理员';

  @override
  String removeMemberTitle(String name) {
    return '移除 $name？';
  }

  @override
  String get removeMemberMessage => '对方的照片会保留在群组中。';

  @override
  String get remove => '删除';

  @override
  String get removeMember => '移除';

  @override
  String blockTitle(String name) {
    return '屏蔽 $name？';
  }

  @override
  String blockMessage(String name) {
    return '你将不再看到 $name 的照片和视频，也不会收到相关通知。可在“设置”中取消屏蔽。';
  }

  @override
  String get block => '屏蔽';

  @override
  String get makeMember => '设为普通成员';

  @override
  String get makeAdmin => '设为管理员';

  @override
  String get removeFromGroup => '移出群组';

  @override
  String get unblock => '取消屏蔽';

  @override
  String get inviteFriendsButton => '邀请朋友';

  @override
  String get you => '你';

  @override
  String get unarchive => '取消归档';

  @override
  String get archive => '归档';

  @override
  String get unarchiveSubtitle => '群组将重新显示在你的相册中';

  @override
  String archiveSubtitle(String section) {
    return '仅对你生效：群组将移到相册底部的“$section”';
  }

  @override
  String get archivedSection => '已归档';

  @override
  String get hiddenPhotos => '已隐藏的照片';

  @override
  String get hiddenPhotosSubtitle => '你为自己隐藏的照片';

  @override
  String get leaveGroup => '退出群组';

  @override
  String get leaveGroupSubtitle => '你的照片会为其他人保留在群组中';

  @override
  String get deleteGroup => '删除群组';

  @override
  String get deleteGroupSubtitle => '所有照片将对所有人删除';

  @override
  String groupArchived(String groupName) {
    return '已归档「$groupName」';
  }

  @override
  String groupUnarchived(String groupName) {
    return '「$groupName」已回到你的相册';
  }

  @override
  String get undo => '撤销';

  @override
  String get groupNameTitle => '群组名称';

  @override
  String get finishTripTitle => '结束旅行？';

  @override
  String get finishTripMessage => '结束日期将设为今天。你仍可添加照片；回顾视频已准备好。';

  @override
  String get finishTripConfirm => '结束';

  @override
  String get tripFinished => '旅行已结束';

  @override
  String leaveGroupTitle(String groupName) {
    return '退出「$groupName」？';
  }

  @override
  String get leaveGroupMessage => '你的照片会为其他人保留在群组中。之后可以用邀请码重新加入。';

  @override
  String get leave => '退出';

  @override
  String groupDeleted(String groupName) {
    return '「$groupName」已删除';
  }

  @override
  String get youAreAdmin => '你是管理员';

  @override
  String get open => '打开';

  @override
  String get archiveMenuSubtitle => '仅对你生效，其他人不会察觉';

  @override
  String get deleteGroupMenuSubtitle => '对所有人，连同所有照片';

  @override
  String get deleteGroupTitle => '删除群组？';

  @override
  String deleteGroupMessage(int count, String groupName, int memberCount) {
    return '「$groupName」中的 $count 张照片和视频将对全部 $memberCount 名成员删除。此操作无法撤销。';
  }

  @override
  String get deleteGroupOwnRoll => '你手机里的相机胶卷不受影响。';

  @override
  String get deleteGroupTypeName => '请输入群组名称以确认：';

  @override
  String get deleteForEveryone => '对所有人删除';

  @override
  String get save => '保存';

  @override
  String get yourAlbums => '你的相册';

  @override
  String get uploadQueue => '上传队列';

  @override
  String get noConnection => '无网络连接';

  @override
  String get albumsOfflineMessage => '恢复网络后会加载你的相册。相机仍可正常使用。';

  @override
  String get retry => '重试';

  @override
  String get noAlbumsTitle => '还没有相册';

  @override
  String get noAlbumsMessage => '为下一次旅行创建群组，或用朋友的邀请码加入。';

  @override
  String get haveCode => '我有邀请码';

  @override
  String get joinWithCode => '通过邀请码或二维码加入';

  @override
  String get camera => '相机';

  @override
  String get restore => '恢复';

  @override
  String get more => '更多';

  @override
  String get newAlbum => '新建';

  @override
  String get closedTag => '已关闭';

  @override
  String get activeTag => '当前';

  @override
  String get uploadFailed => '上传失败';

  @override
  String get queueNoSignal => '无信号。';

  @override
  String get queueNoSignalMessage => '你的照片已在相册中，恢复网络后会立即分享。';

  @override
  String get queueWaitingForWifi => '正在等待 Wi-Fi。';

  @override
  String queueWifiOnlyOn(String setting) {
    return '你已开启“$setting”。';
  }

  @override
  String get queueVideosWifiOnly => '视频仅通过 Wi-Fi 上传。';

  @override
  String get queueAllShared => '已全部分享 ✓';

  @override
  String queuePending(String items) {
    return '待分享：$items';
  }

  @override
  String queuePendingBoth(String photos, String videos) {
    return '待分享：$photos、$videos';
  }

  @override
  String get retryUpload => '重试';

  @override
  String get removeFromQueue => '移出队列';

  @override
  String get queueStatusWifi => 'Wi-Fi';

  @override
  String get queueStatusWaiting => '等待中';

  @override
  String get videosWifiOnlyTitle => '视频仅通过 Wi-Fi 上传';

  @override
  String get videosWifiOnlySubtitle => '节省移动数据';

  @override
  String get retryNow => '立即重试';

  @override
  String get yourName => '你的名字';

  @override
  String get settings => '设置';

  @override
  String get tapToChangeName => '轻点以修改名字';

  @override
  String get getCamTripPro => '开通 CamTrip Pro';

  @override
  String get photos => '照片';

  @override
  String get saveOwnPhotos => '将自己的照片按群组保存到相册';

  @override
  String get autoSaveOthers => '自动保存他人的照片';

  @override
  String get wifiOnlyTitle => '仅通过 Wi-Fi 上传';

  @override
  String get dateStamp => '日期戳';

  @override
  String get notifications => '通知';

  @override
  String get notifyNewPhotos => '新照片（合并通知）';

  @override
  String get notifyRecapReady => '回顾视频已完成';

  @override
  String get camTripTeam => 'CamTrip 团队';

  @override
  String get adminEntrySubtitle => '用户、赠送 Pro、举报和数据';

  @override
  String get account => '账号';

  @override
  String get manageSubscription => '管理订阅';

  @override
  String get blockedPeople => '已屏蔽的人';

  @override
  String get nobody => '无';

  @override
  String peopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 人',
    );
    return '$_temp0';
  }

  @override
  String get privacyPolicy => '隐私政策';

  @override
  String get contact => '联系我们';

  @override
  String get signOut => '退出登录';

  @override
  String get deleteAccount => '删除账号';

  @override
  String get deleteAccountSubtitle => '删除你的账号和所有照片';

  @override
  String get deleteAccountTitle => '删除账号？';

  @override
  String get deleteAccountMessage =>
      '你的账号以及所有照片和视频都将被删除，包括群组中的内容。进行中的订阅请在 App Store 或 Google Play 中取消。';

  @override
  String get blockedTitle => '已屏蔽';

  @override
  String get blockedSubtitle => '你看不到这些人的照片。';

  @override
  String get blockedNone => '你没有屏蔽任何人。';

  @override
  String get unblockShort => '取消屏蔽';

  @override
  String get groupGone => '该群组已不存在，或你已不是成员。';

  @override
  String photosSavedToAlbum(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已将 $count 张照片保存到「$album」',
    );
    return '$_temp0';
  }

  @override
  String photosDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已删除 $count 张照片',
    );
    return '$_temp0';
  }

  @override
  String photosDeletedSkipped(int count, int skipped) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已删除 $count 张照片',
    );
    return '$_temp0，跳过 $skipped 张';
  }

  @override
  String photosHiddenForYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已为你隐藏 $count 张照片',
    );
    return '$_temp0';
  }

  @override
  String get addedToFavorites => '已加入收藏';

  @override
  String get removedFromFavorites => '已取消收藏';

  @override
  String get photoAccessSettings => '请在“设置”中允许 CamTrip 访问你的照片';

  @override
  String photosBeingAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '正在添加 $count 张照片',
    );
    return '$_temp0';
  }

  @override
  String photosUnreadable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '有 $count 张照片无法读取',
    );
    return '$_temp0';
  }

  @override
  String get groupNotLoaded => '群组未加载';

  @override
  String get noFavoritesTitle => '还没有收藏';

  @override
  String get noPhotosTitle => '还没有照片';

  @override
  String get noFavoritesMessage => '轻点照片上的星标，即可收藏到这里。';

  @override
  String get noPhotosMessage => '拍下第一张照片吧，群组里的每个人都能马上看到。';

  @override
  String get openCamera => '打开相机';

  @override
  String savingProgress(int done, int total) {
    return '正在保存... $done/$total';
  }

  @override
  String get sharePreparing => '正在准备...';

  @override
  String sharingProgress(int done, int total) {
    return '正在准备... $done/$total';
  }

  @override
  String get choosePhotos => '选择照片';

  @override
  String selectedCount(int count) {
    return '已选 $count 项';
  }

  @override
  String get selectNone => '取消全选';

  @override
  String get selectAll => '全选';

  @override
  String photosWaitingToShare(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 张照片等待分享',
    );
    return '$_temp0';
  }

  @override
  String get recapReadyTitle => '你的回顾视频已完成';

  @override
  String get recapReadySubtitle => '你们这次旅行的配乐视频';

  @override
  String get watch => '观看';

  @override
  String get makeRecapNow => '立即生成回顾视频';

  @override
  String freeGroupDeleteNotice(String date) {
    return '免费群组：照片保留至 $date。请保存照片或开通 Pro。';
  }

  @override
  String get filterAll => '全部';

  @override
  String get filterFavorites => '收藏';

  @override
  String get filterPerPerson => '按人筛选';

  @override
  String get filterPerson => '人';

  @override
  String get select => '选择';

  @override
  String get hiddenFilter => '已隐藏';

  @override
  String get photosBy => '拍摄者...';

  @override
  String get uploadedTag => '已上传';

  @override
  String get saveAll => '全部保存';

  @override
  String get favorite => '收藏';

  @override
  String get unfavorite => '取消收藏';

  @override
  String get hide => '隐藏';

  @override
  String get delete => '删除';

  @override
  String deletePhotosTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '删除 $count 张照片？',
      one: '删除照片？',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '群组中所有人都将看不到。此操作无法撤销。',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosNotAllowed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '有 $count 张照片属于其他人，会被保留；只有管理员可以删除。',
    );
    return '$_temp0';
  }

  @override
  String photosBackInGroup(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 张照片已重新显示在群组中',
    );
    return '$_temp0';
  }

  @override
  String get showAll => '全部显示';

  @override
  String get hiddenPhotosExplainer => '只有你看不到这些照片。群组里的其他人仍然可以看到。';

  @override
  String get nothingHidden => '没有隐藏的照片';

  @override
  String get nothingHiddenMessage => '你隐藏的照片会显示在这里。';

  @override
  String showAgainCount(int count) {
    return '重新显示（$count）';
  }

  @override
  String get someone => '某人';

  @override
  String get savedToAlbum => '已保存到你的相册';

  @override
  String get share => '分享';

  @override
  String get shareFailed => '分享失败';

  @override
  String get reportTitle => '你为什么要举报这张照片？';

  @override
  String get reportSubtitle => '我们会在 24 小时内审核每条举报。照片会立即对你隐藏。';

  @override
  String get reportThanks => '谢谢，我们会处理';

  @override
  String blockMessageAllGroups(String name) {
    return '你将不再在任何群组中看到 $name 的照片和视频，也不会收到相关通知。可在“设置”中取消屏蔽。';
  }

  @override
  String userBlocked(String name) {
    return '已屏蔽 $name';
  }

  @override
  String get videoHiddenForYou => '已为你隐藏视频';

  @override
  String get photoHiddenForYou => '已为你隐藏照片';

  @override
  String get setAsCover => '设为封面';

  @override
  String get coverUpdated => '封面照片已更新';

  @override
  String get hideForMe => '对我隐藏';

  @override
  String get hideForMeSubtitle => '群组里的其他人仍然可以看到';

  @override
  String get reportPhoto => '举报照片';

  @override
  String blockName(String name) {
    return '屏蔽 $name';
  }

  @override
  String get forEveryoneInGroup => '对群组中所有人';

  @override
  String get videoDeleted => '视频已删除';

  @override
  String get photoDeleted => '照片已删除';

  @override
  String get photoAccessToSave => '请在“设置”中允许 CamTrip 访问你的照片以便保存';

  @override
  String get phoneFull => '手机存储空间已满';

  @override
  String get albumSaveFailedShort => '保存到相册失败';

  @override
  String get recapTemplateGoldenHour => '黄金时刻';

  @override
  String get recapTemplateFast => '快节奏';

  @override
  String get recapTemplateFilmRoll => '胶卷';

  @override
  String get recapTemplatePolaroid => '宝丽来';

  @override
  String get trackSummerEvening => '夏日傍晚';

  @override
  String get trackGoldenHour => '黄金时刻';

  @override
  String get trackRoadtrip => '公路旅行';

  @override
  String get moodWarm => '温暖';

  @override
  String get moodCheerful => '欢快';

  @override
  String friendsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 位朋友',
    );
    return '$_temp0';
  }

  @override
  String get madeWithCamTrip => '用 CamTrip 制作';

  @override
  String get tagline => '全组共用一卷胶卷';

  @override
  String get videoUnsupportedDevice => '无法在此设备上生成视频';

  @override
  String get groupLoadFailed => '无法加载该群组。';

  @override
  String recapNeedsPhotos(int count) {
    return '生成回顾视频至少需要 $count 张照片。';
  }

  @override
  String get recapFailed => '回顾视频生成失败，请重试。';

  @override
  String get recapSaved => '回顾视频已保存到你的相册';

  @override
  String get recap => '回顾';

  @override
  String get recapRendering => '正在生成回顾...';

  @override
  String get videoRendering => '正在生成视频...';

  @override
  String get template => '模板';

  @override
  String get musicLicense => 'CamTrip 原创音乐 · 免版税';

  @override
  String get change => '更换';

  @override
  String get noWatermark => '无水印 ✓';

  @override
  String get removeWatermarkPro => '开通 Pro 去除水印';

  @override
  String get proSourceSubscription => '订阅';

  @override
  String get proSourceGift => '赠送';

  @override
  String get proSourceAdmin => '管理员';

  @override
  String get proSourceGroup => '来自群组';

  @override
  String get noPro => '无 Pro';

  @override
  String proStatusNoEnd(String source) {
    return 'Pro（$source），无结束日期';
  }

  @override
  String proStatusUntil(String source, String date) {
    return 'Pro（$source），截至 $date';
  }

  @override
  String get lifetime => '永久';

  @override
  String get pickDate => '选择日期';

  @override
  String get noAccess => '无权访问';

  @override
  String get adminOnlyTeam => '管理功能仅供 CamTrip 团队使用。';

  @override
  String get adminOverview => '概览';

  @override
  String get adminUsers => '用户';

  @override
  String get adminReports => '举报';

  @override
  String adminsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 名管理员',
    );
    return '$_temp0';
  }

  @override
  String get adminNewThisWeek => '本周新增';

  @override
  String get adminGroups => '群组';

  @override
  String get adminProSubscription => '订阅 Pro';

  @override
  String get adminProGift => '赠送 Pro';

  @override
  String adminWithoutSubscription(int count) {
    return '$count 人无订阅';
  }

  @override
  String get adminOpenReports => '待处理举报';

  @override
  String get adminSearchHint => '按名字或邮箱搜索';

  @override
  String get nobodyFound => '未找到';

  @override
  String get loadMore => '加载更多';

  @override
  String get noEmail => '无邮箱';

  @override
  String adminDeletePhotoMessage(String groupName) {
    return '照片将对「$groupName」中的所有人删除。与这张照片相关的举报将全部处理完毕。';
  }

  @override
  String get adminBanMessage => '该账号将无法再登录或使用应用。之后可以撤销。';

  @override
  String get adminDismissTitle => '忽略这条举报？';

  @override
  String get adminDismissMessage => '照片将保留。举报会被标记为已处理。';

  @override
  String get adminDismiss => '忽略';

  @override
  String get adminAccountBlocked => '账号已封禁';

  @override
  String get adminReportDismissed => '已忽略举报';

  @override
  String get adminNoReports => '没有待处理的举报';

  @override
  String get adminNoReportsMessage => '被举报的照片会显示在这里。';

  @override
  String get deletedTag => '已删除';

  @override
  String adminReportedBy(String name) {
    return '举报人：$name';
  }

  @override
  String adminPhotoBy(String name) {
    return '拍摄者：$name';
  }

  @override
  String reportsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 条举报',
    );
    return '$_temp0';
  }

  @override
  String get adminDeletePhoto => '删除照片';

  @override
  String get adminBlockCreator => '封禁拍摄者';

  @override
  String get loadFailed => '加载失败';

  @override
  String get adminLifetimeProGiven => '已赠送永久 Pro';

  @override
  String get adminProGiven => '已赠送 Pro';

  @override
  String adminGiveProUntil(String date) {
    return '赠送 Pro 至 $date';
  }

  @override
  String get adminGiveProLifetime => '赠送永久 Pro';

  @override
  String adminGiveProFor(String period) {
    return '赠送 Pro $period';
  }

  @override
  String get adminReasonHint => '原因，例如朋友、测试者、网红';

  @override
  String get adminGivePro => '赠送 Pro';

  @override
  String get adminRevokeTitle => '收回赠送？';

  @override
  String get adminRevokeMessage => '赠送的 Pro 将立即终止。对方自己的订阅不受影响。';

  @override
  String get adminRevoke => '收回';

  @override
  String get adminGiftRevoked => '已收回赠送';

  @override
  String get adminUnbanTitle => '解除封禁？';

  @override
  String adminUnbanMessage(String name) {
    return '$name 将可以重新登录。';
  }

  @override
  String get adminUnbanned => '已解除封禁';

  @override
  String get adminBanUserMessage => '该账号将无法再登录或使用应用。照片会保留。';

  @override
  String get adminUser => '用户';

  @override
  String get adminNotVerified => '未验证';

  @override
  String get adminRole => '角色';

  @override
  String get adminCreated => '创建时间';

  @override
  String get unknown => '未知';

  @override
  String get adminSignInWith => '登录方式';

  @override
  String get adminEmailMethod => '邮箱';

  @override
  String get adminPhotosAndVideos => '照片和视频';

  @override
  String get adminStatus => '状态';

  @override
  String get adminActive => '有效';

  @override
  String adminActiveUntil(String date) {
    return '有效期至 $date';
  }

  @override
  String adminGiftFrom(String name) {
    return '来自 $name 的赠送';
  }

  @override
  String adminExpiredOn(String date) {
    return '已于 $date 过期';
  }

  @override
  String get adminExpired => '已过期';

  @override
  String adminUntil(String date) {
    return '截至 $date';
  }

  @override
  String get adminGiveProTitle => '赠送 Pro';

  @override
  String get adminGiveProNote => '同样适用于此人的群组：群组里有一人是 Pro，全组都是 Pro。';

  @override
  String get adminRevokeGift => '收回赠送';

  @override
  String get adminModeration => '内容审核';

  @override
  String get adminCannotBanSelf => '不能封禁自己。';

  @override
  String get adminCannotBanAdmin => '不能封禁管理员。';

  @override
  String get adminUnban => '解除封禁';

  @override
  String get adminBanAccount => '封禁账号';

  @override
  String get googleSignInUnavailable => '暂不支持通过 Google 登录';

  @override
  String get cameraPickerTitle => '选择你的相机';

  @override
  String get cameraPickerSubtitle => '每台相机都会给照片带来独特的风格';

  @override
  String get cameraPickerChange => '切换相机';

  @override
  String get cameraPickerUnlock => '用 Pro 解锁';

  @override
  String get cameraPickerSelected => '已选择';

  @override
  String get cameraPickerStyleSummer => '夏日';

  @override
  String get cameraPickerStyleSummerDescription => '像 90 年代快照一样温暖、褪色的色彩';

  @override
  String get cameraPickerStyleNight => '夜色 800';

  @override
  String get cameraPickerStyleNightDescription => '电影胶片：青色阴影、暖色光线、颗粒感强';

  @override
  String get cameraPickerStyleSepia => '棕褐';

  @override
  String get cameraPickerStyleSepiaDescription => '鞋盒里翻出的老旧棕色照片';

  @override
  String get cameraPickerStyleLomo => 'LOMO';

  @override
  String get cameraPickerStyleLomoDescription => '浓烈的色彩、暗角和大胆的偏色';

  @override
  String get cameraPickerStyleMint => '薄荷';

  @override
  String get cameraPickerStyleMintDescription => '带绿色调的柔和清新色彩';

  @override
  String get cameraPickerStylePastel => '粉色';

  @override
  String get cameraPickerStylePastelDescription => '粉色光晕的马卡龙色调和白色边框';

  @override
  String get cameraPickerStyleSuper8 => '超8';

  @override
  String get cameraPickerStyleSuper8Description => '颗粒感十足、柔和，像老式家庭录像';

  @override
  String get paywallBenefitGroup => '一人 Pro，全组 Pro';

  @override
  String get paywallBenefitUnlimited => '成员不限，照片永久保留';

  @override
  String get paywallBenefitQuality => '无水印，原图画质';

  @override
  String paywallFreeTrial(String period) {
    return '免费 $period';
  }

  @override
  String paywallPriceYear(String price) {
    return '每年 $price。';
  }

  @override
  String paywallPriceYearTrial(String period, String price) {
    return '免费 $period，之后每年 $price。';
  }

  @override
  String paywallPriceMonth(String price) {
    return '每月 $price。';
  }

  @override
  String paywallPriceMonthTrial(String period, String price) {
    return '免费 $period，之后每月 $price。';
  }

  @override
  String paywallAutoRenew(String store) {
    return '自动续订。请在续订前至少 24 小时在 $store 中取消。';
  }

  @override
  String get paywallDetailsTitle => 'Pro 全部权益';

  @override
  String get paywallBenefitStyles => '所有相机风格';

  @override
  String get allPhotosTitle => '所有照片';

  @override
  String get homeTabAlbums => '相册';

  @override
  String get allPhotosEmptyTitle => '还没有照片';

  @override
  String get allPhotosEmptyMessage => '打开相机，拍下你的第一张照片。';

  @override
  String get allPhotosLoadFailed => '无法加载你的照片';

  @override
  String get cameraSettingsTitle => '相机设置';

  @override
  String get cameraSettingsMore => '更多设置';

  @override
  String get cameraSettingsGrid => '网格';

  @override
  String get cameraSettingsHaptics => '拍摄时振动';

  @override
  String get cameraSettingsDateStamp => '右下角日期';

  @override
  String get cameraSettingsSound => '快门声';

  @override
  String get cameraSettingsSoundHint => '手机静音时不发声';

  @override
  String get cameraSettingsTimer => '自拍定时';

  @override
  String get cameraSettingsTimerOff => '关';

  @override
  String cameraSettingsTimerSeconds(int seconds) {
    return '$seconds 秒';
  }

  @override
  String get cameraSettingsTimerCancelHint => '轻点快门可取消';

  @override
  String get cameraSettingsMirror => '镜像自拍';

  @override
  String get cameraSettingsSaveToRoll => '保存到相册';

  @override
  String get cameraSettingsQuality => '画质';

  @override
  String get cameraSettingsQualityStandard => '标准';

  @override
  String get cameraSettingsQualityHigh => '高';

  @override
  String get cameraLowLightHint => '光线不足 - 打开闪光灯吧';

  @override
  String get cameraFlashUnavailable => '这个相机没有闪光灯';

  @override
  String get cameraFlashScreen => '屏幕闪光';

  @override
  String get cameraFlashCycleHint => '轻点可在关、开和自动之间切换';

  @override
  String get cameraFlip => '切换前置/后置摄像头';

  @override
  String get cameraFlipHint => '双击取景器即可切换摄像头';

  @override
  String cameraPickerPaywallStyles(int count, String styles) {
    return '全部 $count 款相机（包括 $styles）';
  }

  @override
  String get styleFlash => '闪光 400';

  @override
  String get styleFlashDescription => '暖调胶片直闪：琥珀色调、颗粒感、浓郁红色';

  @override
  String cameraTimerButton(String state) {
    return '自拍定时：$state';
  }

  @override
  String get cameraTimerCycleHint => '轻点可在关、3 秒和 10 秒之间切换';

  @override
  String get cameraLastShotOpen => '最新照片，打开相册';

  @override
  String get cameraLastShotEmpty => '还没有照片，打开相册';

  @override
  String get deleteOnlyOwnOrAdmin => '只有拍摄者或管理员可以删除';

  @override
  String get videoPlay => '播放';

  @override
  String get videoPause => '暂停';

  @override
  String get language => '语言';

  @override
  String get languageSystem => '系统语言';

  @override
  String languageSystemCurrent(String language) {
    return '跟随系统（$language）';
  }

  @override
  String get languageSearchHint => '搜索语言';

  @override
  String get languageNoResults => '未找到语言';

  @override
  String get personalRollTitle => '我的胶卷';

  @override
  String get personalRollSubtitle => '仅自己可见';

  @override
  String get personalRollPickerSubtitle => '零散照片，仅自己可见';

  @override
  String get personalRollMove => '移到相册';

  @override
  String get personalRollMoveTitle => '移到相册';

  @override
  String get personalRollMoveNoAlbums => '请先创建相册，或用邀请码加入一个。';

  @override
  String personalRollMoved(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已将 $count 张照片移到$album',
    );
    return '$_temp0';
  }

  @override
  String get personalRollPrivateNote => '只有你能看到这些照片。移到相册即可分享。';

  @override
  String get paywallTripPassSub => '仅此旅行，全组共享';

  @override
  String get paywallOneTime => '一次性';

  @override
  String get paywallBestValue => '最划算';

  @override
  String paywallRollFullTitle(int used, int limit) {
    return '你的胶卷满了 - $used/$limit 张';
  }

  @override
  String get paywallRollFullSub => '用 Trip Pass 或 Pro 继续拍。';

  @override
  String get paywallCameraTitle => '这台相机属于 Pro';

  @override
  String paywallCameraSub(int count) {
    return '解锁全部 $count 台相机。';
  }

  @override
  String get paywallWatermarkTitle => '无水印回顾';

  @override
  String get paywallWatermarkSub => '分享不带 CamTrip 标志的回顾。';

  @override
  String get paywallDeletionTitle => '保留你的旅行';

  @override
  String paywallDeletionSub(String date) {
    return '免费旅行将于 $date 删除。有 Trip Pass 或 Pro 就能永久保留。';
  }

  @override
  String paywallTripPassTerms(String price) {
    return '为此旅行一次性购买 $price。不是订阅。';
  }

  @override
  String get buyTripPass => '购买 Trip Pass';

  @override
  String get tripPassActive => 'Trip Pass 已生效：此旅行对所有人都是 Pro';

  @override
  String get tripPassActivating => '已收到付款。你的 Trip Pass 马上生效。';

  @override
  String proViaTripPass(String name) {
    return '$name 的 Trip Pass';
  }

  @override
  String rollCounterSemantics(int used, int limit) {
    return '胶卷 $used/$limit 张';
  }

  @override
  String rollHeldTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '有 $count 张照片放不进胶卷了',
      one: '有 1 张照片放不进胶卷了',
    );
    return '$_temp0';
  }

  @override
  String get rollHeldBody => '用 Pro 或 Trip Pass 保留它们';

  @override
  String deletionBannerTitle(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '保留你的旅行 - 还剩 $days 天',
      one: '保留你的旅行 - 还剩 1 天',
    );
    return '$_temp0';
  }

  @override
  String get deletionBannerBody => '免费旅行在结束 30 天后删除。有 Trip Pass 或 Pro 就能永久保留。';

  @override
  String apiRollFull(int limit) {
    return '你的胶卷满了（$limit 张）。用 Trip Pass 或 Pro 继续拍。';
  }

  @override
  String get apiTripPassFailed => '无法激活 Trip Pass。请联系 support@camtrip.app。';

  @override
  String get apiTripPassExists => '此旅行已有 Trip Pass。';

  @override
  String get tripPassUnavailable => 'Trip Pass 暂时不可用，请稍后再试。';

  @override
  String get tripMapTitle => '旅行地图';

  @override
  String get tripMapOpen => '地图和统计';

  @override
  String get tripMapLoadFailed => '无法加载地图';

  @override
  String get tripMapStatDays => '天数';

  @override
  String get tripMapStatPhotos => '照片';

  @override
  String get tripMapStatVideos => '视频';

  @override
  String get tripMapStatMembers => '成员';

  @override
  String get tripMapStatDistance => '行程 (公里)';

  @override
  String get tripMapStatCountries => '国家';

  @override
  String get tripMapStatPlaces => '地点';

  @override
  String tripMapBusiestDay(String day, int count) {
    return '照片最多的一天: $day ($count)';
  }

  @override
  String tripMapTopPhotographer(String name, int count) {
    return '最佳摄影师: $name ($count)';
  }

  @override
  String get tripMapOffTitle => '旅行地图已关闭';

  @override
  String get tripMapOffMessage => '管理员可以在群组设置中开启旅行地图。统计数据你随时都能看到。';

  @override
  String get tripMapOffMessageAdmin => '开启旅行地图，看看你们的照片是在哪里拍的。是否参与由每个人自己决定。';

  @override
  String get tripMapEnable => '开启旅行地图';

  @override
  String get tripMapEmptyTitle => '地图上还没有地点';

  @override
  String get tripMapEmptyMessage => '分享位置的成员拍的新照片会显示在这里，位置精确到约 100 米。';

  @override
  String get tripMapConsentTitle => '旅行地图';

  @override
  String get tripMapConsentQuestion => '要在这个群组的旅行地图上分享你的照片拍摄地点吗？';

  @override
  String get tripMapConsentDetail =>
      '只有群组成员能看到，位置精确到约 100 米。位置绝不会写入照片本身，你随时可以在群组设置中关闭。';

  @override
  String get tripMapConsentYes => '分享';

  @override
  String get tripMapConsentNo => '不分享';

  @override
  String get tripMapLocationDenied => '无法访问你的位置。你可以在手机设置中允许。';

  @override
  String get tripMapSettingSubtitle => '在地图上显示照片拍摄地点。是否分享由成员自己决定。';

  @override
  String get tripMapDisableTitle => '关闭旅行地图？';

  @override
  String get tripMapDisableMessage => '这个群组中的所有位置都会被删除。以后重新开启地图时，会再次询问每个人。';

  @override
  String get tripMapDisable => '关闭';

  @override
  String get tripMapMySharing => '分享我的位置';

  @override
  String get tripMapMySharingOn => '你的新照片会显示在旅行地图上（精确到约 100 米）。';

  @override
  String get tripMapMySharingOff => '已关闭。你的照片不会显示在地图上。';

  @override
  String get tripMapStopSharingTitle => '停止分享你的位置？';

  @override
  String get tripMapStopSharingMessage => '你在这个群组中所有照片的位置都会被删除。';

  @override
  String get tripMapStopSharing => '停止分享';
}

/// The translations for Chinese, using the Han script (`zh_Hant`).
class AppLocalizationsZhHant extends AppLocalizationsZh {
  AppLocalizationsZhHant() : super('zh_Hant');

  @override
  String get cancel => '取消';

  @override
  String get yes => '是';

  @override
  String inviteMessageIntro(String groupName) {
    return '一起加入 CamTrip 上的「$groupName」吧？這樣大家馬上就能看到彼此的照片。';
  }

  @override
  String inviteMessageCode(String code) {
    return '或輸入邀請碼：$code';
  }

  @override
  String get memberFallbackName => '朋友';

  @override
  String get reportReasonInappropriate => '不當或冒犯性內容';

  @override
  String get reportReasonSpam => '垃圾資訊';

  @override
  String get reportReasonOther => '其他原因';

  @override
  String dateRangeSameMonth(
    String startDay,
    String endDay,
    String month,
    String monthNum,
    String endDate,
  ) {
    return '$monthNum$startDay至$endDay';
  }

  @override
  String get errorOffline => '無網路連線，請稍後再試。';

  @override
  String errorSomethingWrongStatus(int status) {
    return '出錯了（$status）';
  }

  @override
  String get errorSomethingWrong => '出錯了';

  @override
  String get apiInvalidCredentials => '電子郵件或密碼不正確';

  @override
  String get apiInvalidCode => '驗證碼不正確或已過期，請重新獲取。';

  @override
  String get apiEmailTaken => '該電子郵件已註冊帳號。請登入，或選擇「忘記密碼？」。';

  @override
  String apiEmailTakenProvider(String provider) {
    return '該電子郵件已註冊帳號。請使用 $provider 登入。';
  }

  @override
  String apiWeakPassword(int min) {
    return '請設定至少 $min 個字元的密碼';
  }

  @override
  String apiNameTooLong(int max) {
    return '名字最多 $max 個字元';
  }

  @override
  String get apiRateLimited => '嘗試次數過多，請 15 分鐘後再試。';

  @override
  String apiAccountBanned(String email) {
    return '你的帳號已被封禁。如有疑問，請聯絡 $email。';
  }

  @override
  String get apiProRequired => '此相機風格為 CamTrip Pro 專享';

  @override
  String get apiGroupClosed => '該群組已關閉';

  @override
  String get apiGroupCodeNotFound => '找不到使用此邀請碼的群組';

  @override
  String apiGroupFull(int max) {
    return '該群組已滿（最多 $max 名成員）。只要有一名成員擁有 CamTrip Pro，人數就不受限制。';
  }

  @override
  String get apiLastMember => '你是最後一名成員，請直接刪除群組。';

  @override
  String get apiAdminRequired => '僅限 CamTrip 管理員';

  @override
  String get apiUploadIncomplete => '上傳未完成';

  @override
  String get apiInvalidInput => '輸入無效';

  @override
  String get apiNotSignedIn => '未登入';

  @override
  String get apiAccountGone => '該帳號已不存在';

  @override
  String get apiPhotoNotFound => '找不到照片';

  @override
  String get apiGroupNotFound => '找不到群組';

  @override
  String get apiMemberNotFound => '找不到成員';

  @override
  String get apiPersonNotFound => '找不到此人';

  @override
  String get apiUserNotFound => '找不到使用者';

  @override
  String get apiAdminOnly => '只有管理員可以執行此操作';

  @override
  String get apiCannotBlockSelf => '不能遮蔽自己';

  @override
  String get apiCannotReportOwn => '不能舉報自己的照片';

  @override
  String get apiDeleteOwnOnly => '只能刪除自己的照片';

  @override
  String get apiOwnerCannotBeRemoved => '不能移除群組建立者';

  @override
  String get apiOwnerStaysAdmin => '群組建立者始終是管理員';

  @override
  String get apiNeedsOneAdmin => '群組至少需要一名管理員';

  @override
  String get apiEndBeforeStart => '結束日期早於開始日期';

  @override
  String get apiPermanentNoEndDate => '長期開放的群組沒有結束日期';

  @override
  String get apiCannotBanAdmin => '不能封禁管理員';

  @override
  String get apiReportNotFound => '找不到舉報';

  @override
  String get apiPhotoOwnerUnknown => '已無法得知這張照片的拍攝者';

  @override
  String get validationNameRequired => '請輸入你的名字';

  @override
  String validationMaxChars(int max) {
    return '最多 $max 個字元';
  }

  @override
  String get validationEmailRequired => '請輸入電子郵件地址';

  @override
  String get validationEmailInvalid => '電子郵件地址無效';

  @override
  String get validationPasswordRequired => '請設定密碼';

  @override
  String validationMinChars(int min) {
    return '至少 $min 個字元';
  }

  @override
  String get validationPasswordTooLong => '密碼太長';

  @override
  String get validationPasswordEmpty => '請輸入密碼';

  @override
  String get validationCodeRequired => '請輸入郵件中的驗證碼';

  @override
  String get validationCodeDigits => '驗證碼為 6 位數字';

  @override
  String get onboarding1Title => '全組共用\n一卷膠捲。';

  @override
  String get onboarding1Body => '用復古相機拍照。大家立刻就能看到你的照片，同時也會存進你自己的相簿。';

  @override
  String get onboarding2Title => '不用再\n互相傳照片。';

  @override
  String get onboarding2Body => '建立群組，分享邀請碼，搞定。再也不用問「那些照片傳給我？」';

  @override
  String get onboarding3Title => '旅行結束後\n製作回顧影片。';

  @override
  String get onboarding3Body => 'CamTrip 會把你們最美好的瞬間做成配樂影片。';

  @override
  String get onboardingInvited => '你收到了邀請！登入後即可加入。';

  @override
  String get signInAppleFailed => '無法透過 Apple 登入';

  @override
  String get signInGoogleFailed => '無法透過 Google 登入';

  @override
  String get signInFailed => '登入失敗';

  @override
  String get next => '下一步';

  @override
  String get legalPrefix => '繼續即表示你同意';

  @override
  String get legalTerms => '使用條款';

  @override
  String get legalAnd => '和';

  @override
  String get legalPrivacy => '隱私政策';

  @override
  String get legalSuffix => '。';

  @override
  String get continueWithApple => '透過 Apple 繼續';

  @override
  String get continueWithGoogle => '透過 Google 繼續';

  @override
  String get createAccount => '建立帳號';

  @override
  String get signIn => '登入';

  @override
  String get or => '或';

  @override
  String get registerSubtitle => '這樣朋友們就知道照片是誰拍的。';

  @override
  String get loginSubtitle => '歡迎回來。';

  @override
  String get forgotPasswordTitle => '忘記密碼';

  @override
  String get forgotPasswordPushSubtitle =>
      '你還在其他裝置上登入著嗎？我們會透過推送通知把 6 位數驗證碼發到那裡，用來設定新密碼。';

  @override
  String get newPassword => '新密碼';

  @override
  String get resetPushInfo =>
      '如果你還在其他裝置上登入著，那裡會收到一條帶驗證碼的推送通知。無法登入？請使用相同電子郵件地址透過 Apple 或 Google 登入 - 你的帳號會被關聯。';

  @override
  String get sendCode => '傳送驗證碼';

  @override
  String get savePassword => '儲存密碼';

  @override
  String get errorTryAgain => '出錯了，請重試。';

  @override
  String get back => '返回';

  @override
  String get name => '名字';

  @override
  String get email => '電子郵件地址';

  @override
  String get codeFromPush => '通知中的驗證碼';

  @override
  String get password => '密碼';

  @override
  String get hidePassword => '隱藏密碼';

  @override
  String get showPassword => '顯示密碼';

  @override
  String get forgotPasswordLink => '忘記密碼？';

  @override
  String get haveAccount => '已有帳號？';

  @override
  String get newToCamTrip => '第一次用 CamTrip？';

  @override
  String get rememberedIt => '想起來了？';

  @override
  String get noCodeReceived => '沒收到驗證碼？';

  @override
  String get resendCode => '重新發送';

  @override
  String onboardingDemoRoll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 位攝影師，1 卷膠捲',
    );
    return '$_temp0';
  }

  @override
  String membersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 名成員',
    );
    return '$_temp0';
  }

  @override
  String photosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 張照片',
    );
    return '$_temp0';
  }

  @override
  String videosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 個影片',
    );
    return '$_temp0';
  }

  @override
  String get justNow => '剛剛';

  @override
  String get badgeNew => '新';

  @override
  String recapTitle(String groupName) {
    return '$groupName 回顧';
  }

  @override
  String get styleFilm => '底片';

  @override
  String get styleInstant => '拍立得';

  @override
  String get styleDisposable => '一次性';

  @override
  String get styleBw => '黑白';

  @override
  String get styleGolden => '金色';

  @override
  String get styleChrome => '鉻彩';

  @override
  String get styleFilmDescription => '暖色調、顆粒感和橙色日期戳';

  @override
  String get styleInstantDescription => '柔和色調和白色邊框';

  @override
  String get styleDisposableDescription => '強烈閃光、暗角和漏光';

  @override
  String get styleBwDescription => '顆粒感黑白，對比強烈';

  @override
  String get styleGoldenDescription => '永遠的黃金時刻，柔和金色光暈';

  @override
  String get styleChromeDescription => '冷調、飽和、銳利，如正片';

  @override
  String get shutterStopRecording => '停止錄製';

  @override
  String get shutterStartRecording => '開始錄製影片';

  @override
  String get shutterTakePhoto => '拍照';

  @override
  String get modePhoto => '照片';

  @override
  String get modeVideo => '影片';

  @override
  String get cameraNotFound => '未找到相機';

  @override
  String get cameraAccessNeeded => 'CamTrip 需要存取你的相機，請在「設定」中開啟。';

  @override
  String get cameraStartFailed => '相機無法啟動';

  @override
  String get albumAccessNeeded => '允許 CamTrip 存取你的照片，才能同時儲存到相簿';

  @override
  String get albumSaveFailed => '儲存到相簿失敗，照片仍會分享。';

  @override
  String styleProFallback(String style) {
    return '此風格為 Pro 專享。在這個群組中你將使用$style拍攝。';
  }

  @override
  String get photoFailed => '拍照失敗，請重試。';

  @override
  String get recordingFailed => '影片錄製失敗';

  @override
  String get videoFailed => '影片製作失敗，請重試。';

  @override
  String get shootInGroup => '選擇拍攝群組';

  @override
  String get close => '關閉';

  @override
  String get flash => '閃光燈';

  @override
  String get flashOn => '開';

  @override
  String get flashOff => '關';

  @override
  String get flashAuto => '自動';

  @override
  String get chooseGroup => '選擇群組';

  @override
  String get switchCamera => '切換相機';

  @override
  String get createOrJoinFirst => '請先建立或加入一個群組';

  @override
  String get proViaGroup => '群組 Pro';

  @override
  String proViaName(String name) {
    return 'Pro 來自 $name';
  }

  @override
  String get proStylesFreeViaMember => '多虧一位 Pro 成員，你在這個群組中可免費使用 Pro 風格';

  @override
  String proStylesFreeViaName(String name) {
    return '本群組的 Pro 風格：多虧 $name，你可免費使用';
  }

  @override
  String get subscriptionsUnavailable => '訂閱暫不可用，請稍後再試。';

  @override
  String get paymentPending => '你的付款仍在處理中，完成後 Pro 即會開通。';

  @override
  String get purchaseFailed => '購買失敗，請稍後再試。';

  @override
  String get restoreUnavailable => '暫時無法恢復購買，請稍後再試。';

  @override
  String get restoreFailed => '恢復失敗，請稍後再試。';

  @override
  String get welcomePro => '歡迎使用 CamTrip Pro！🎉';

  @override
  String get proRestored => 'Pro 已恢復';

  @override
  String get noPurchaseFound => '未找到以前的購買記錄';

  @override
  String periodDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 天',
    );
    return '$_temp0';
  }

  @override
  String periodWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 週',
    );
    return '$_temp0';
  }

  @override
  String periodMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 個月',
    );
    return '$_temp0';
  }

  @override
  String periodYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 年',
    );
    return '$_temp0';
  }

  @override
  String get paywallHavePro => '你已擁有 CamTrip Pro';

  @override
  String get paywallSubtitle => '下一次旅行所需的一切。';

  @override
  String paywallFeatureStyles(String styles) {
    return '所有相機風格（$styles）';
  }

  @override
  String get paywallFeatureUnlimited => '成員和儲存空間不限，照片永久保留';

  @override
  String get paywallFeatureNoWatermark => '回顧影片無水印';

  @override
  String get paywallFeatureOriginal => '下載原圖畫質';

  @override
  String get planYear => '年付';

  @override
  String get planMonth => '月付';

  @override
  String pricePerMonth(String price) {
    return '每月 $price';
  }

  @override
  String paywallSaveBadge(int percent) {
    return '省 $percent%';
  }

  @override
  String get planMonthCancelAnytime => '隨時取消';

  @override
  String tryFree(String period) {
    return '免費試用 $period';
  }

  @override
  String get becomePro => '開通 Pro';

  @override
  String get subscriptionsLoadFailed => '無法載入訂閱，請檢查網路連線。';

  @override
  String legalAnnual(String price) {
    return 'CamTrip Pro 年度訂閱：每年 $price。';
  }

  @override
  String legalAnnualTrial(String period, String price) {
    return 'CamTrip Pro 年度訂閱：免費 $period，之後每年 $price。';
  }

  @override
  String legalMonthly(String price) {
    return 'CamTrip Pro 月度訂閱：每月 $price。';
  }

  @override
  String legalMonthlyTrial(String period, String price) {
    return 'CamTrip Pro 月度訂閱：免費 $period，之後每月 $price。';
  }

  @override
  String get legalBillingApple =>
      '費用將透過你的 Apple ID 支付。除非在當前週期結束前至少 24 小時取消，否則訂閱將自動續訂。你可以在 App Store 帳號設定中取消和管理訂閱。';

  @override
  String get legalBillingGoogle =>
      '費用將透過你的 Google 帳號支付。除非在當前週期結束前至少 24 小時取消，否則訂閱將自動續訂。你可以在 Google Play 帳號設定中取消和管理訂閱。';

  @override
  String get restorePurchases => '恢復購買';

  @override
  String get terms => '條款';

  @override
  String get privacy => '隱私';

  @override
  String get groupProTitle => '群組裡有一人是 Pro，全組都是 Pro';

  @override
  String get groupProBody =>
      '只要有一個人擁有 Pro，全組都能使用所有相機風格、不限人數、照片永久保留、原圖畫質和無水印回顧影片。';

  @override
  String get groupCreated => '群組已建立 ✓';

  @override
  String get inviteFriends => '邀請朋友';

  @override
  String get codeCopied => '邀請碼已複製';

  @override
  String get shareLink => '分享連結';

  @override
  String inviteSubject(String groupName) {
    return '加入 CamTrip 上的 $groupName';
  }

  @override
  String inviteMembersUnlimited(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 名成員',
    );
    return '$_temp0 · 不限人數（Pro）';
  }

  @override
  String inviteMembersLimit(int count, int limit) {
    return '$count/$limit 名成員 · Pro：不限人數';
  }

  @override
  String get toCamera => '去拍照';

  @override
  String get done => '完成';

  @override
  String get joinEnterCode => '請輸入 6 位邀請碼';

  @override
  String get joinGroupTitle => '加入群組';

  @override
  String get joinGroupSubtitle => '輸入朋友的邀請碼，或掃描他們的QR 碼。';

  @override
  String get typeCode => '輸入邀請碼';

  @override
  String get scanQr => '掃描QR 碼';

  @override
  String get join => '加入';

  @override
  String get groupNameRequired => '給群組取個名字';

  @override
  String get newGroup => '新建群組';

  @override
  String get groupType => '群組類型';

  @override
  String get groupTypeVacation => '度假';

  @override
  String get groupTypeVacationDescription => '有開始和結束日期，結束後歸檔';

  @override
  String get groupTypeEvent => '活動';

  @override
  String get groupTypeEventDescription => '一天或一個晚上，例如派對';

  @override
  String get groupTypePermanent => '長期開放';

  @override
  String get groupTypePermanentDescription => '適合固定的朋友圈';

  @override
  String get date => '日期';

  @override
  String get departure => '出發';

  @override
  String get returnDate => '返回';

  @override
  String get defaultCameraStyle => '預設相機風格';

  @override
  String freeLimitPermanent(int max) {
    return '免費版：最多 $max 名成員。Pro 不限人數。';
  }

  @override
  String freeLimitDated(int max, int days) {
    return '免費版：最多 $max 名成員，照片保留至結束日期後 $days 天。Pro 不限人數且永久保留。';
  }

  @override
  String get createGroup => '建立群組';

  @override
  String get group => '群組';

  @override
  String groupCode(String code) {
    return '邀請碼 $code';
  }

  @override
  String get manage => '管理';

  @override
  String get rename => '重新命名';

  @override
  String get changeDates => '修改日期';

  @override
  String get finishTrip => '結束旅行';

  @override
  String get finishTripSubtitle => '將結束日期設為今天';

  @override
  String get reopenGroup => '重新開放群組';

  @override
  String get closeGroup => '關閉群組';

  @override
  String get reopenGroupSubtitle => '成員可以再次新增照片';

  @override
  String get closeGroupSubtitle => '不能再新增照片，但所有內容仍可查看';

  @override
  String get members => '成員';

  @override
  String memberYou(String name) {
    return '$name（你）';
  }

  @override
  String get blockedTag => '已遮蔽';

  @override
  String get adminTag => '管理員';

  @override
  String removeMemberTitle(String name) {
    return '移除 $name？';
  }

  @override
  String get removeMemberMessage => '對方的照片會保留在群組中。';

  @override
  String get remove => '刪除';

  @override
  String get removeMember => '移除';

  @override
  String blockTitle(String name) {
    return '遮蔽 $name？';
  }

  @override
  String blockMessage(String name) {
    return '你將不再看到 $name 的照片和影片，也不會收到相關通知。可在「設定」中取消遮蔽。';
  }

  @override
  String get block => '遮蔽';

  @override
  String get makeMember => '設為普通成員';

  @override
  String get makeAdmin => '設為管理員';

  @override
  String get removeFromGroup => '移出群組';

  @override
  String get unblock => '取消遮蔽';

  @override
  String get inviteFriendsButton => '邀請朋友';

  @override
  String get you => '你';

  @override
  String get unarchive => '取消歸檔';

  @override
  String get archive => '歸檔';

  @override
  String get unarchiveSubtitle => '群組將重新顯示在你的相簿中';

  @override
  String archiveSubtitle(String section) {
    return '僅對你生效：群組將移到相簿底部的「$section」';
  }

  @override
  String get archivedSection => '已歸檔';

  @override
  String get hiddenPhotos => '已隱藏的照片';

  @override
  String get hiddenPhotosSubtitle => '你為自己隱藏的照片';

  @override
  String get leaveGroup => '離開群組';

  @override
  String get leaveGroupSubtitle => '你的照片會為其他人保留在群組中';

  @override
  String get deleteGroup => '刪除群組';

  @override
  String get deleteGroupSubtitle => '所有照片將對所有人刪除';

  @override
  String groupArchived(String groupName) {
    return '已歸檔「$groupName」';
  }

  @override
  String groupUnarchived(String groupName) {
    return '「$groupName」已回到你的相簿';
  }

  @override
  String get undo => '復原';

  @override
  String get groupNameTitle => '群組名稱';

  @override
  String get finishTripTitle => '結束旅行？';

  @override
  String get finishTripMessage => '結束日期將設為今天。你仍可新增照片；回顧影片已準備好。';

  @override
  String get finishTripConfirm => '結束';

  @override
  String get tripFinished => '旅行已結束';

  @override
  String leaveGroupTitle(String groupName) {
    return '離開「$groupName」？';
  }

  @override
  String get leaveGroupMessage => '你的照片會為其他人保留在群組中。之後可以用邀請碼重新加入。';

  @override
  String get leave => '離開';

  @override
  String groupDeleted(String groupName) {
    return '「$groupName」已刪除';
  }

  @override
  String get youAreAdmin => '你是管理員';

  @override
  String get open => '開啟';

  @override
  String get archiveMenuSubtitle => '僅對你生效，其他人不會察覺';

  @override
  String get deleteGroupMenuSubtitle => '對所有人，連同所有照片';

  @override
  String get deleteGroupTitle => '刪除群組？';

  @override
  String deleteGroupMessage(int count, String groupName, int memberCount) {
    return '「$groupName」中的 $count 張照片和影片將對全部 $memberCount 名成員刪除。此操作無法復原。';
  }

  @override
  String get deleteGroupOwnRoll => '你手機裡的相機膠捲不受影響。';

  @override
  String get deleteGroupTypeName => '請輸入群組名稱以確認：';

  @override
  String get deleteForEveryone => '對所有人刪除';

  @override
  String get save => '儲存';

  @override
  String get yourAlbums => '你的相簿';

  @override
  String get uploadQueue => '上傳佇列';

  @override
  String get noConnection => '無網路連線';

  @override
  String get albumsOfflineMessage => '恢復網路後會載入你的相簿。相機仍可正常使用。';

  @override
  String get retry => '重試';

  @override
  String get noAlbumsTitle => '還沒有相簿';

  @override
  String get noAlbumsMessage => '為下一次旅行建立群組，或用朋友的邀請碼加入。';

  @override
  String get haveCode => '我有邀請碼';

  @override
  String get joinWithCode => '透過邀請碼或QR 碼加入';

  @override
  String get camera => '相機';

  @override
  String get restore => '恢復';

  @override
  String get more => '更多';

  @override
  String get newAlbum => '新建';

  @override
  String get closedTag => '已關閉';

  @override
  String get activeTag => '進行中';

  @override
  String get uploadFailed => '上傳失敗';

  @override
  String get queueNoSignal => '無訊號。';

  @override
  String get queueNoSignalMessage => '你的照片已在相簿中，恢復網路後會立即分享。';

  @override
  String get queueWaitingForWifi => '正在等待 Wi-Fi。';

  @override
  String queueWifiOnlyOn(String setting) {
    return '你已開啟「$setting」。';
  }

  @override
  String get queueVideosWifiOnly => '影片僅透過 Wi-Fi 上傳。';

  @override
  String get queueAllShared => '已全部分享 ✓';

  @override
  String queuePending(String items) {
    return '待分享：$items';
  }

  @override
  String queuePendingBoth(String photos, String videos) {
    return '待分享：$photos、$videos';
  }

  @override
  String get retryUpload => '重試';

  @override
  String get removeFromQueue => '移出佇列';

  @override
  String get queueStatusWifi => 'Wi-Fi';

  @override
  String get queueStatusWaiting => '等待中';

  @override
  String get videosWifiOnlyTitle => '影片僅透過 Wi-Fi 上傳';

  @override
  String get videosWifiOnlySubtitle => '節省行動資料';

  @override
  String get retryNow => '立即重試';

  @override
  String get yourName => '你的名字';

  @override
  String get settings => '設定';

  @override
  String get tapToChangeName => '輕點以修改名字';

  @override
  String get getCamTripPro => '開通 CamTrip Pro';

  @override
  String get photos => '照片';

  @override
  String get saveOwnPhotos => '將自己的照片按群組儲存到相簿';

  @override
  String get autoSaveOthers => '自動儲存他人的照片';

  @override
  String get wifiOnlyTitle => '僅透過 Wi-Fi 上傳';

  @override
  String get dateStamp => '日期戳';

  @override
  String get notifications => '通知';

  @override
  String get notifyNewPhotos => '新照片（合併通知）';

  @override
  String get notifyRecapReady => '回顧影片已完成';

  @override
  String get camTripTeam => 'CamTrip 團隊';

  @override
  String get adminEntrySubtitle => '使用者、贈送 Pro、舉報和統計';

  @override
  String get account => '帳號';

  @override
  String get manageSubscription => '管理訂閱';

  @override
  String get blockedPeople => '已遮蔽的人';

  @override
  String get nobody => '無';

  @override
  String peopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 人',
    );
    return '$_temp0';
  }

  @override
  String get privacyPolicy => '隱私政策';

  @override
  String get contact => '聯絡我們';

  @override
  String get signOut => '登出';

  @override
  String get deleteAccount => '刪除帳號';

  @override
  String get deleteAccountSubtitle => '刪除你的帳號和所有照片';

  @override
  String get deleteAccountTitle => '刪除帳號？';

  @override
  String get deleteAccountMessage =>
      '你的帳號以及所有照片和影片都將被刪除，包括群組中的內容。進行中的訂閱請在 App Store 或 Google Play 中取消。';

  @override
  String get blockedTitle => '已遮蔽';

  @override
  String get blockedSubtitle => '你看不到這些人的照片。';

  @override
  String get blockedNone => '你沒有遮蔽任何人。';

  @override
  String get unblockShort => '取消遮蔽';

  @override
  String get groupGone => '該群組已不存在，或你已不是成員。';

  @override
  String photosSavedToAlbum(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已將 $count 張照片儲存到「$album」',
    );
    return '$_temp0';
  }

  @override
  String photosDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已刪除 $count 張照片',
    );
    return '$_temp0';
  }

  @override
  String photosDeletedSkipped(int count, int skipped) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已刪除 $count 張照片',
    );
    return '$_temp0，跳過 $skipped 張';
  }

  @override
  String photosHiddenForYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已為你隱藏 $count 張照片',
    );
    return '$_temp0';
  }

  @override
  String get addedToFavorites => '已加入收藏';

  @override
  String get removedFromFavorites => '已取消收藏';

  @override
  String get photoAccessSettings => '請在「設定」中允許 CamTrip 存取你的照片';

  @override
  String photosBeingAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '正在新增 $count 張照片',
    );
    return '$_temp0';
  }

  @override
  String photosUnreadable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '有 $count 張照片無法讀取',
    );
    return '$_temp0';
  }

  @override
  String get groupNotLoaded => '群組未載入';

  @override
  String get noFavoritesTitle => '還沒有收藏';

  @override
  String get noPhotosTitle => '還沒有照片';

  @override
  String get noFavoritesMessage => '輕點照片上的星標，即可收藏到這裡。';

  @override
  String get noPhotosMessage => '拍下第一張照片吧，群組裡的每個人都能馬上看到。';

  @override
  String get openCamera => '開啟相機';

  @override
  String savingProgress(int done, int total) {
    return '正在儲存... $done/$total';
  }

  @override
  String get sharePreparing => '正在準備...';

  @override
  String sharingProgress(int done, int total) {
    return '正在準備... $done/$total';
  }

  @override
  String get choosePhotos => '選擇照片';

  @override
  String selectedCount(int count) {
    return '已選 $count 項';
  }

  @override
  String get selectNone => '取消全選';

  @override
  String get selectAll => '全選';

  @override
  String photosWaitingToShare(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 張照片等待分享',
    );
    return '$_temp0';
  }

  @override
  String get recapReadyTitle => '你的回顧影片已完成';

  @override
  String get recapReadySubtitle => '你們這次旅行的配樂影片';

  @override
  String get watch => '觀看';

  @override
  String get makeRecapNow => '立即製作回顧影片';

  @override
  String freeGroupDeleteNotice(String date) {
    return '免費群組：照片保留至 $date。請儲存照片或開通 Pro。';
  }

  @override
  String get filterAll => '全部';

  @override
  String get filterFavorites => '收藏';

  @override
  String get filterPerPerson => '按人篩選';

  @override
  String get filterPerson => '人';

  @override
  String get select => '選擇';

  @override
  String get hiddenFilter => '已隱藏';

  @override
  String get photosBy => '拍攝者...';

  @override
  String get uploadedTag => '已上傳';

  @override
  String get saveAll => '全部儲存';

  @override
  String get favorite => '收藏';

  @override
  String get unfavorite => '取消收藏';

  @override
  String get hide => '隱藏';

  @override
  String get delete => '刪除';

  @override
  String deletePhotosTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '刪除 $count 張照片？',
      one: '刪除照片？',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '群組中所有人都將看不到。此操作無法復原。',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosNotAllowed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '有 $count 張照片屬於其他人，會被保留；只有管理員可以刪除。',
    );
    return '$_temp0';
  }

  @override
  String photosBackInGroup(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 張照片已重新顯示在群組中',
    );
    return '$_temp0';
  }

  @override
  String get showAll => '全部顯示';

  @override
  String get hiddenPhotosExplainer => '只有你看不到這些照片。群組裡的其他人仍然可以看到。';

  @override
  String get nothingHidden => '沒有隱藏的照片';

  @override
  String get nothingHiddenMessage => '你隱藏的照片會顯示在這裡。';

  @override
  String showAgainCount(int count) {
    return '重新顯示（$count）';
  }

  @override
  String get someone => '某人';

  @override
  String get savedToAlbum => '已儲存到你的相簿';

  @override
  String get share => '分享';

  @override
  String get shareFailed => '分享失敗';

  @override
  String get reportTitle => '你為什麼要舉報這張照片？';

  @override
  String get reportSubtitle => '我們會在 24 小時內審核每條舉報。照片會立即對你隱藏。';

  @override
  String get reportThanks => '謝謝，我們會處理';

  @override
  String blockMessageAllGroups(String name) {
    return '你將不再在任何群組中看到 $name 的照片和影片，也不會收到相關通知。可在「設定」中取消遮蔽。';
  }

  @override
  String userBlocked(String name) {
    return '已遮蔽 $name';
  }

  @override
  String get videoHiddenForYou => '已為你隱藏影片';

  @override
  String get photoHiddenForYou => '已為你隱藏照片';

  @override
  String get setAsCover => '設為封面';

  @override
  String get coverUpdated => '封面照片已更新';

  @override
  String get hideForMe => '對我隱藏';

  @override
  String get hideForMeSubtitle => '群組裡的其他人仍然可以看到';

  @override
  String get reportPhoto => '舉報照片';

  @override
  String blockName(String name) {
    return '遮蔽 $name';
  }

  @override
  String get forEveryoneInGroup => '對群組中所有人';

  @override
  String get videoDeleted => '影片已刪除';

  @override
  String get photoDeleted => '照片已刪除';

  @override
  String get photoAccessToSave => '請在「設定」中允許 CamTrip 存取你的照片以便儲存';

  @override
  String get phoneFull => '手機儲存空間已滿';

  @override
  String get albumSaveFailedShort => '儲存到相簿失敗';

  @override
  String get recapTemplateGoldenHour => '黃金時刻';

  @override
  String get recapTemplateFast => '快節奏';

  @override
  String get recapTemplateFilmRoll => '膠捲';

  @override
  String get recapTemplatePolaroid => '寶麗來';

  @override
  String get trackSummerEvening => '夏日傍晚';

  @override
  String get trackGoldenHour => '黃金時刻';

  @override
  String get trackRoadtrip => '公路旅行';

  @override
  String get moodWarm => '溫暖';

  @override
  String get moodCheerful => '歡快';

  @override
  String friendsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 位朋友',
    );
    return '$_temp0';
  }

  @override
  String get madeWithCamTrip => '用 CamTrip 製作';

  @override
  String get tagline => '全組共用一卷膠捲';

  @override
  String get videoUnsupportedDevice => '無法在此裝置上製作影片';

  @override
  String get groupLoadFailed => '無法載入該群組。';

  @override
  String recapNeedsPhotos(int count) {
    return '製作回顧影片至少需要 $count 張照片。';
  }

  @override
  String get recapFailed => '回顧影片製作失敗，請重試。';

  @override
  String get recapSaved => '回顧影片已儲存到你的相簿';

  @override
  String get recap => '回顧';

  @override
  String get recapRendering => '正在製作回顧...';

  @override
  String get videoRendering => '正在製作影片...';

  @override
  String get template => '模板';

  @override
  String get musicLicense => 'CamTrip 原創音樂 · 免版稅';

  @override
  String get change => '更換';

  @override
  String get noWatermark => '無水印 ✓';

  @override
  String get removeWatermarkPro => '開通 Pro 去除水印';

  @override
  String get proSourceSubscription => '訂閱';

  @override
  String get proSourceGift => '贈送';

  @override
  String get proSourceAdmin => '管理員';

  @override
  String get proSourceGroup => '來自群組';

  @override
  String get noPro => '無 Pro';

  @override
  String proStatusNoEnd(String source) {
    return 'Pro（$source），無結束日期';
  }

  @override
  String proStatusUntil(String source, String date) {
    return 'Pro（$source），截至 $date';
  }

  @override
  String get lifetime => '永久';

  @override
  String get pickDate => '選擇日期';

  @override
  String get noAccess => '無權存取';

  @override
  String get adminOnlyTeam => '管理功能僅供 CamTrip 團隊使用。';

  @override
  String get adminOverview => '概覽';

  @override
  String get adminUsers => '使用者';

  @override
  String get adminReports => '舉報';

  @override
  String adminsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 名管理員',
    );
    return '$_temp0';
  }

  @override
  String get adminNewThisWeek => '本週新增';

  @override
  String get adminGroups => '群組';

  @override
  String get adminProSubscription => '訂閱 Pro';

  @override
  String get adminProGift => '贈送 Pro';

  @override
  String adminWithoutSubscription(int count) {
    return '$count 人無訂閱';
  }

  @override
  String get adminOpenReports => '待處理舉報';

  @override
  String get adminSearchHint => '按名字或電子郵件搜尋';

  @override
  String get nobodyFound => '未找到';

  @override
  String get loadMore => '載入更多';

  @override
  String get noEmail => '無電子郵件';

  @override
  String adminDeletePhotoMessage(String groupName) {
    return '照片將對「$groupName」中的所有人刪除。與這張照片相關的舉報將全部處理完畢。';
  }

  @override
  String get adminBanMessage => '該帳號將無法再登入或使用 App。之後可以復原。';

  @override
  String get adminDismissTitle => '忽略這條舉報？';

  @override
  String get adminDismissMessage => '照片將保留。舉報會被標記為已處理。';

  @override
  String get adminDismiss => '忽略';

  @override
  String get adminAccountBlocked => '帳號已封禁';

  @override
  String get adminReportDismissed => '已忽略舉報';

  @override
  String get adminNoReports => '沒有待處理的舉報';

  @override
  String get adminNoReportsMessage => '被舉報的照片會顯示在這裡。';

  @override
  String get deletedTag => '已刪除';

  @override
  String adminReportedBy(String name) {
    return '舉報人：$name';
  }

  @override
  String adminPhotoBy(String name) {
    return '拍攝者：$name';
  }

  @override
  String reportsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 條舉報',
    );
    return '$_temp0';
  }

  @override
  String get adminDeletePhoto => '刪除照片';

  @override
  String get adminBlockCreator => '封禁拍攝者';

  @override
  String get loadFailed => '載入失敗';

  @override
  String get adminLifetimeProGiven => '已贈送永久 Pro';

  @override
  String get adminProGiven => '已贈送 Pro';

  @override
  String adminGiveProUntil(String date) {
    return '贈送 Pro 至 $date';
  }

  @override
  String get adminGiveProLifetime => '贈送永久 Pro';

  @override
  String adminGiveProFor(String period) {
    return '贈送 Pro $period';
  }

  @override
  String get adminReasonHint => '原因，例如朋友、測試者、網紅';

  @override
  String get adminGivePro => '贈送 Pro';

  @override
  String get adminRevokeTitle => '收回贈送？';

  @override
  String get adminRevokeMessage => '贈送的 Pro 將立即終止。對方自己的訂閱不受影響。';

  @override
  String get adminRevoke => '收回';

  @override
  String get adminGiftRevoked => '已收回贈送';

  @override
  String get adminUnbanTitle => '解除封禁？';

  @override
  String adminUnbanMessage(String name) {
    return '$name 將可以重新登入。';
  }

  @override
  String get adminUnbanned => '已解除封禁';

  @override
  String get adminBanUserMessage => '該帳號將無法再登入或使用 App。照片會保留。';

  @override
  String get adminUser => '使用者';

  @override
  String get adminNotVerified => '未驗證';

  @override
  String get adminRole => '角色';

  @override
  String get adminCreated => '建立時間';

  @override
  String get unknown => '未知';

  @override
  String get adminSignInWith => '登入方式';

  @override
  String get adminEmailMethod => '電子郵件';

  @override
  String get adminPhotosAndVideos => '照片和影片';

  @override
  String get adminStatus => '狀態';

  @override
  String get adminActive => '有效';

  @override
  String adminActiveUntil(String date) {
    return '有效期至 $date';
  }

  @override
  String adminGiftFrom(String name) {
    return '來自 $name 的贈送';
  }

  @override
  String adminExpiredOn(String date) {
    return '已於 $date 過期';
  }

  @override
  String get adminExpired => '已過期';

  @override
  String adminUntil(String date) {
    return '截至 $date';
  }

  @override
  String get adminGiveProTitle => '贈送 Pro';

  @override
  String get adminGiveProNote => '同樣適用於此人的群組：群組裡有一人是 Pro，全組都是 Pro。';

  @override
  String get adminRevokeGift => '收回贈送';

  @override
  String get adminModeration => '內容審核';

  @override
  String get adminCannotBanSelf => '不能封禁自己。';

  @override
  String get adminCannotBanAdmin => '不能封禁管理員。';

  @override
  String get adminUnban => '解除封禁';

  @override
  String get adminBanAccount => '封禁帳號';

  @override
  String get googleSignInUnavailable => '暫不支援透過 Google 登入';

  @override
  String get cameraPickerTitle => '選擇你的相機';

  @override
  String get cameraPickerSubtitle => '每臺相機都會給照片帶來獨特的風格';

  @override
  String get cameraPickerChange => '切換相機';

  @override
  String get cameraPickerUnlock => '用 Pro 解鎖';

  @override
  String get cameraPickerSelected => '已選擇';

  @override
  String get cameraPickerStyleSummer => '夏日';

  @override
  String get cameraPickerStyleSummerDescription => '像 90 年代快照一樣溫暖、褪色的色彩';

  @override
  String get cameraPickerStyleNight => '夜色 800';

  @override
  String get cameraPickerStyleNightDescription => '電影底片：青色陰影、暖色光線、顆粒感強';

  @override
  String get cameraPickerStyleSepia => '棕褐';

  @override
  String get cameraPickerStyleSepiaDescription => '鞋盒裡翻出的老舊棕色照片';

  @override
  String get cameraPickerStyleLomo => 'LOMO';

  @override
  String get cameraPickerStyleLomoDescription => '濃烈的色彩、暗角和大膽的偏色';

  @override
  String get cameraPickerStyleMint => '薄荷';

  @override
  String get cameraPickerStyleMintDescription => '帶綠色調的柔和清新色彩';

  @override
  String get cameraPickerStylePastel => '粉色';

  @override
  String get cameraPickerStylePastelDescription => '粉色光暈的馬卡龍色調和白色邊框';

  @override
  String get cameraPickerStyleSuper8 => '超8';

  @override
  String get cameraPickerStyleSuper8Description => '顆粒感十足、柔和，像老式家庭錄影';

  @override
  String get paywallBenefitGroup => '一人 Pro，全組 Pro';

  @override
  String get paywallBenefitUnlimited => '成員不限，照片永久保留';

  @override
  String get paywallBenefitQuality => '無水印，原圖畫質';

  @override
  String paywallFreeTrial(String period) {
    return '免費 $period';
  }

  @override
  String paywallPriceYear(String price) {
    return '每年 $price。';
  }

  @override
  String paywallPriceYearTrial(String period, String price) {
    return '免費 $period，之後每年 $price。';
  }

  @override
  String paywallPriceMonth(String price) {
    return '每月 $price。';
  }

  @override
  String paywallPriceMonthTrial(String period, String price) {
    return '免費 $period，之後每月 $price。';
  }

  @override
  String paywallAutoRenew(String store) {
    return '自動續訂。請在續訂前至少 24 小時在 $store 中取消。';
  }

  @override
  String get paywallDetailsTitle => 'Pro 全部權益';

  @override
  String get paywallBenefitStyles => '所有相機風格';

  @override
  String get allPhotosTitle => '所有照片';

  @override
  String get homeTabAlbums => '相簿';

  @override
  String get allPhotosEmptyTitle => '還沒有照片';

  @override
  String get allPhotosEmptyMessage => '開啟相機，拍下你的第一張照片。';

  @override
  String get allPhotosLoadFailed => '無法載入你的照片';

  @override
  String get cameraSettingsTitle => '相機設定';

  @override
  String get cameraSettingsMore => '更多設定';

  @override
  String get cameraSettingsGrid => '網格';

  @override
  String get cameraSettingsHaptics => '拍攝時振動';

  @override
  String get cameraSettingsDateStamp => '右下角日期';

  @override
  String get cameraSettingsSound => '快門聲';

  @override
  String get cameraSettingsSoundHint => '手機靜音時不發聲';

  @override
  String get cameraSettingsTimer => '自拍定時';

  @override
  String get cameraSettingsTimerOff => '關';

  @override
  String cameraSettingsTimerSeconds(int seconds) {
    return '$seconds 秒';
  }

  @override
  String get cameraSettingsTimerCancelHint => '輕點快門可取消';

  @override
  String get cameraSettingsMirror => '鏡像自拍';

  @override
  String get cameraSettingsSaveToRoll => '儲存到相簿';

  @override
  String get cameraSettingsQuality => '畫質';

  @override
  String get cameraSettingsQualityStandard => '標準';

  @override
  String get cameraSettingsQualityHigh => '高';

  @override
  String get cameraLowLightHint => '光線不足 - 開啟閃光燈吧';

  @override
  String get cameraFlashUnavailable => '這個相機沒有閃光燈';

  @override
  String get cameraFlashScreen => '螢幕閃光';

  @override
  String get cameraFlashCycleHint => '輕點可在關、開和自動之間切換';

  @override
  String get cameraFlip => '切換前置/後置鏡頭';

  @override
  String get cameraFlipHint => '雙擊取景器即可切換鏡頭';

  @override
  String cameraPickerPaywallStyles(int count, String styles) {
    return '全部 $count 款相機（包括 $styles）';
  }

  @override
  String get styleFlash => '閃光 400';

  @override
  String get styleFlashDescription => '暖調底片直閃：琥珀色調、顆粒感、濃郁紅色';

  @override
  String cameraTimerButton(String state) {
    return '自拍定時：$state';
  }

  @override
  String get cameraTimerCycleHint => '輕點可在關、3 秒和 10 秒之間切換';

  @override
  String get cameraLastShotOpen => '最新照片，開啟相簿';

  @override
  String get cameraLastShotEmpty => '還沒有照片，開啟相簿';

  @override
  String get deleteOnlyOwnOrAdmin => '只有拍攝者或管理員可以刪除';

  @override
  String get videoPlay => '播放';

  @override
  String get videoPause => '暫停';

  @override
  String get language => '語言';

  @override
  String get languageSystem => '系統語言';

  @override
  String languageSystemCurrent(String language) {
    return '跟隨系統（$language）';
  }

  @override
  String get languageSearchHint => '搜尋語言';

  @override
  String get languageNoResults => '未找到語言';

  @override
  String get personalRollTitle => '我的膠捲';

  @override
  String get personalRollSubtitle => '僅自己可見';

  @override
  String get personalRollPickerSubtitle => '零散照片，僅自己可見';

  @override
  String get personalRollMove => '移到相簿';

  @override
  String get personalRollMoveTitle => '移到相簿';

  @override
  String get personalRollMoveNoAlbums => '請先建立相簿，或用邀請碼加入一個。';

  @override
  String personalRollMoved(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已將 $count 張照片移到$album',
    );
    return '$_temp0';
  }

  @override
  String get personalRollPrivateNote => '只有你能看到這些照片。移到相簿即可分享。';

  @override
  String get paywallTripPassSub => '僅此旅行，全組共享';

  @override
  String get paywallOneTime => '一次性';

  @override
  String get paywallBestValue => '最划算';

  @override
  String paywallRollFullTitle(int used, int limit) {
    return '你的膠捲滿了 - $used/$limit 張';
  }

  @override
  String get paywallRollFullSub => '用 Trip Pass 或 Pro 繼續拍。';

  @override
  String get paywallCameraTitle => '這臺相機屬於 Pro';

  @override
  String paywallCameraSub(int count) {
    return '解鎖全部 $count 臺相機。';
  }

  @override
  String get paywallWatermarkTitle => '無水印回顧';

  @override
  String get paywallWatermarkSub => '分享不帶 CamTrip 標誌的回顧。';

  @override
  String get paywallDeletionTitle => '保留你的旅行';

  @override
  String paywallDeletionSub(String date) {
    return '免費旅行將於 $date 刪除。有 Trip Pass 或 Pro 就能永久保留。';
  }

  @override
  String paywallTripPassTerms(String price) {
    return '為此旅行一次性購買 $price。不是訂閱。';
  }

  @override
  String get buyTripPass => '購買 Trip Pass';

  @override
  String get tripPassActive => 'Trip Pass 已生效：此旅行對所有人都是 Pro';

  @override
  String get tripPassActivating => '已收到付款。你的 Trip Pass 馬上生效。';

  @override
  String proViaTripPass(String name) {
    return '$name 的 Trip Pass';
  }

  @override
  String rollCounterSemantics(int used, int limit) {
    return '膠捲 $used/$limit 張';
  }

  @override
  String rollHeldTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '有 $count 張照片放不進膠捲了',
      one: '有 1 張照片放不進膠捲了',
    );
    return '$_temp0';
  }

  @override
  String get rollHeldBody => '用 Pro 或 Trip Pass 保留它們';

  @override
  String deletionBannerTitle(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '保留你的旅行 - 還剩 $days 天',
      one: '保留你的旅行 - 還剩 1 天',
    );
    return '$_temp0';
  }

  @override
  String get deletionBannerBody => '免費旅行在結束 30 天后刪除。有 Trip Pass 或 Pro 就能永久保留。';

  @override
  String apiRollFull(int limit) {
    return '你的膠捲滿了（$limit 張）。用 Trip Pass 或 Pro 繼續拍。';
  }

  @override
  String get apiTripPassFailed => '無法啟用 Trip Pass。請聯絡 support@camtrip.app。';

  @override
  String get apiTripPassExists => '此旅行已有 Trip Pass。';

  @override
  String get tripPassUnavailable => 'Trip Pass 暫時不可用，請稍後再試。';

  @override
  String get tripMapTitle => '旅行地圖';

  @override
  String get tripMapOpen => '地圖和統計';

  @override
  String get tripMapLoadFailed => '無法載入地圖';

  @override
  String get tripMapStatDays => '天數';

  @override
  String get tripMapStatPhotos => '照片';

  @override
  String get tripMapStatVideos => '影片';

  @override
  String get tripMapStatMembers => '成員';

  @override
  String get tripMapStatDistance => '行程 (公里)';

  @override
  String get tripMapStatCountries => '國家';

  @override
  String get tripMapStatPlaces => '地點';

  @override
  String tripMapBusiestDay(String day, int count) {
    return '照片最多的一天: $day ($count)';
  }

  @override
  String tripMapTopPhotographer(String name, int count) {
    return '最佳攝影師: $name ($count)';
  }

  @override
  String get tripMapOffTitle => '旅行地圖已關閉';

  @override
  String get tripMapOffMessage => '管理員可以在群組設定中開啟旅行地圖。統計資料你隨時都能看到。';

  @override
  String get tripMapOffMessageAdmin => '開啟旅行地圖，看看你們的照片是在哪裡拍的。是否參與由每個人自己決定。';

  @override
  String get tripMapEnable => '開啟旅行地圖';

  @override
  String get tripMapEmptyTitle => '地圖上還沒有地點';

  @override
  String get tripMapEmptyMessage => '分享位置的成員拍的新照片會顯示在這裡，位置精確到約 100 米。';

  @override
  String get tripMapConsentTitle => '旅行地圖';

  @override
  String get tripMapConsentQuestion => '要在這個群組的旅行地圖上分享你的照片拍攝地點嗎？';

  @override
  String get tripMapConsentDetail =>
      '只有群組成員能看到，位置精確到約 100 米。位置絕不會寫入照片本身，你隨時可以在群組設定中關閉。';

  @override
  String get tripMapConsentYes => '分享';

  @override
  String get tripMapConsentNo => '不分享';

  @override
  String get tripMapLocationDenied => '無法存取你的位置。你可以在手機設定中允許。';

  @override
  String get tripMapSettingSubtitle => '在地圖上顯示照片拍攝地點。是否分享由成員自己決定。';

  @override
  String get tripMapDisableTitle => '關閉旅行地圖？';

  @override
  String get tripMapDisableMessage => '這個群組中的所有位置都會被刪除。以後重新開啟地圖時，會再次詢問每個人。';

  @override
  String get tripMapDisable => '關閉';

  @override
  String get tripMapMySharing => '分享我的位置';

  @override
  String get tripMapMySharingOn => '你的新照片會顯示在旅行地圖上（精確到約 100 米）。';

  @override
  String get tripMapMySharingOff => '已關閉。你的照片不會顯示在地圖上。';

  @override
  String get tripMapStopSharingTitle => '停止分享你的位置？';

  @override
  String get tripMapStopSharingMessage => '你在這個群組中所有照片的位置都會被刪除。';

  @override
  String get tripMapStopSharing => '停止分享';
}
