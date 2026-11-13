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
}
