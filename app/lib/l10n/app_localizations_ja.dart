// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get cancel => 'キャンセル';

  @override
  String get yes => 'はい';

  @override
  String inviteMessageIntro(String groupName) {
    return 'CamTripの「$groupName」に参加しない？みんなの写真がすぐに見られるよ。';
  }

  @override
  String inviteMessageCode(String code) {
    return 'またはコードを入力: $code';
  }

  @override
  String get memberFallbackName => '友だち';

  @override
  String get reportReasonInappropriate => '不適切または不快な内容';

  @override
  String get reportReasonSpam => 'スパム';

  @override
  String get reportReasonOther => 'その他';

  @override
  String dateRangeSameMonth(
    String startDay,
    String endDay,
    String month,
    String monthNum,
    String endDate,
  ) {
    return '$monthNum$startDay～$endDay';
  }

  @override
  String get errorOffline => '接続できません。少ししてからもう一度お試しください。';

  @override
  String errorSomethingWrongStatus(int status) {
    return '問題が発生しました（$status）';
  }

  @override
  String get errorSomethingWrong => '問題が発生しました';

  @override
  String get apiInvalidCredentials => 'メールアドレスまたはパスワードが正しくありません';

  @override
  String get apiInvalidCode => 'このコードは正しくないか、有効期限が切れています。新しいコードをリクエストしてください。';

  @override
  String get apiEmailTaken =>
      'このメールアドレスのアカウントはすでにあります。ログインするか、「パスワードを忘れた場合」を選んでください。';

  @override
  String apiEmailTakenProvider(String provider) {
    return 'このメールアドレスのアカウントはすでにあります。$providerでログインしてください。';
  }

  @override
  String apiWeakPassword(int min) {
    return '$min文字以上のパスワードを設定してください';
  }

  @override
  String apiNameTooLong(int max) {
    return '名前は$max文字以内にしてください';
  }

  @override
  String get apiRateLimited => '試行回数が多すぎます。15分後にもう一度お試しください。';

  @override
  String apiAccountBanned(String email) {
    return 'アカウントがブロックされています。お心当たりがない場合は$emailまでご連絡ください。';
  }

  @override
  String get apiProRequired => 'このカメラスタイルはCamTrip Pro専用です';

  @override
  String get apiGroupClosed => 'このグループは締め切られました';

  @override
  String get apiGroupCodeNotFound => 'このコードのグループは見つかりません';

  @override
  String apiGroupFull(int max) {
    return 'このグループは満員です（最大$max人）。メンバーの1人がCamTrip Proなら、人数無制限で参加できます。';
  }

  @override
  String get apiLastMember => 'あなたが最後のメンバーです。代わりにグループを削除してください。';

  @override
  String get apiAdminRequired => 'CamTripの管理者専用です';

  @override
  String get apiUploadIncomplete => 'アップロードが完了していません';

  @override
  String get apiInvalidInput => '入力が正しくありません';

  @override
  String get apiNotSignedIn => 'ログインしていません';

  @override
  String get apiAccountGone => 'このアカウントは存在しません';

  @override
  String get apiPhotoNotFound => '写真が見つかりません';

  @override
  String get apiGroupNotFound => 'グループが見つかりません';

  @override
  String get apiMemberNotFound => 'メンバーが見つかりません';

  @override
  String get apiPersonNotFound => 'ユーザーが見つかりません';

  @override
  String get apiUserNotFound => 'ユーザーが見つかりません';

  @override
  String get apiAdminOnly => 'この操作は管理者のみ可能です';

  @override
  String get apiCannotBlockSelf => '自分をブロックすることはできません';

  @override
  String get apiCannotReportOwn => '自分の写真は報告できません';

  @override
  String get apiDeleteOwnOnly => '削除できるのは自分の写真だけです';

  @override
  String get apiOwnerCannotBeRemoved => 'グループの作成者は削除できません';

  @override
  String get apiOwnerStaysAdmin => 'グループの作成者は管理者のままです';

  @override
  String get apiNeedsOneAdmin => 'グループには管理者が1人以上必要です';

  @override
  String get apiEndBeforeStart => '終了日が開始日より前になっています';

  @override
  String get apiPermanentNoEndDate => '常に開いているグループには終了日がありません';

  @override
  String get apiCannotBanAdmin => '管理者はブロックできません';

  @override
  String get apiReportNotFound => '報告が見つかりません';

  @override
  String get apiPhotoOwnerUnknown => 'この写真の撮影者はもう分かりません';

  @override
  String get validationNameRequired => '名前を入力してください';

  @override
  String validationMaxChars(int max) {
    return '$max文字以内';
  }

  @override
  String get validationEmailRequired => 'メールアドレスを入力してください';

  @override
  String get validationEmailInvalid => 'メールアドレスが正しくありません';

  @override
  String get validationPasswordRequired => 'パスワードを設定してください';

  @override
  String validationMinChars(int min) {
    return '$min文字以上';
  }

  @override
  String get validationPasswordTooLong => 'パスワードが長すぎます';

  @override
  String get validationPasswordEmpty => 'パスワードを入力してください';

  @override
  String get validationCodeRequired => 'メールに届いたコードを入力してください';

  @override
  String get validationCodeDigits => 'コードは6桁の数字です';

  @override
  String get onboarding1Title => 'グループみんなで\nひとつのフィルム。';

  @override
  String get onboarding1Body => 'レトロなカメラで撮影。撮った写真はすぐにみんなに届き、自分のアルバムにも保存されます。';

  @override
  String get onboarding2Title => '写真を送り合う\n手間はもうなし。';

  @override
  String get onboarding2Body => 'グループを作ってコードを共有するだけ。「あの写真送って？」はもう必要ありません。';

  @override
  String get onboarding3Title => '旅のあとは\n振り返り動画。';

  @override
  String get onboarding3Body => 'CamTripがベストな瞬間を集めて、音楽付きの動画を作ります。';

  @override
  String get onboardingInvited => '招待されています！ログインして参加しましょう。';

  @override
  String get signInAppleFailed => 'Appleでログインできませんでした';

  @override
  String get signInGoogleFailed => 'Googleでログインできませんでした';

  @override
  String get signInFailed => 'ログインできませんでした';

  @override
  String get next => '次へ';

  @override
  String get legalPrefix => '続行すると、';

  @override
  String get legalTerms => '利用規約';

  @override
  String get legalAnd => 'と';

  @override
  String get legalPrivacy => 'プライバシーポリシー';

  @override
  String get legalSuffix => 'に同意したものとみなされます。';

  @override
  String get continueWithApple => 'Appleで続ける';

  @override
  String get continueWithGoogle => 'Googleで続ける';

  @override
  String get createAccount => 'アカウントを作成';

  @override
  String get signIn => 'ログイン';

  @override
  String get or => 'または';

  @override
  String get registerSubtitle => '誰が撮った写真か、友だちに分かるようになります。';

  @override
  String get loginSubtitle => 'おかえりなさい。';

  @override
  String get forgotPasswordTitle => 'パスワードを忘れた場合';

  @override
  String get forgotPasswordPushSubtitle =>
      'まだどこかでログインしていますか？その端末に、新しいパスワードを設定するための6桁のコードを通知で送ります。';

  @override
  String get newPassword => '新しいパスワード';

  @override
  String get resetPushInfo =>
      'まだどこかでログインしている場合は、その端末にコード付きの通知が届きます。ログインできない場合は、同じメールアドレスのAppleまたはGoogleでログインしてください - アカウントが連携されます。';

  @override
  String get sendCode => 'コードを送信';

  @override
  String get savePassword => 'パスワードを保存';

  @override
  String get errorTryAgain => '問題が発生しました。もう一度お試しください。';

  @override
  String get back => '戻る';

  @override
  String get name => '名前';

  @override
  String get email => 'メールアドレス';

  @override
  String get codeFromPush => '通知のコード';

  @override
  String get password => 'パスワード';

  @override
  String get hidePassword => 'パスワードを隠す';

  @override
  String get showPassword => 'パスワードを表示';

  @override
  String get forgotPasswordLink => 'パスワードを忘れた場合';

  @override
  String get haveAccount => 'アカウントをお持ちですか？';

  @override
  String get newToCamTrip => 'CamTripは初めてですか？';

  @override
  String get rememberedIt => '思い出しましたか？';

  @override
  String get noCodeReceived => 'コードが届かない場合';

  @override
  String get resendCode => '再送信';

  @override
  String onboardingDemoRoll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '撮影者$count人、フィルム1本',
    );
    return '$_temp0';
  }

  @override
  String membersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'メンバー$count人',
    );
    return '$_temp0';
  }

  @override
  String photosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '写真$count枚',
    );
    return '$_temp0';
  }

  @override
  String videosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '動画$count本',
    );
    return '$_temp0';
  }

  @override
  String get justNow => 'たった今';

  @override
  String get badgeNew => 'NEW';

  @override
  String recapTitle(String groupName) {
    return '$groupNameの振り返り';
  }

  @override
  String get styleFilm => 'フィルム';

  @override
  String get styleInstant => 'インスタント';

  @override
  String get styleDisposable => '使い捨て';

  @override
  String get styleBw => 'モノクロ';

  @override
  String get styleGolden => 'ゴールデン';

  @override
  String get styleChrome => 'クローム';

  @override
  String get styleFilmDescription => '温かみのある色、粒子感、オレンジの日付';

  @override
  String get styleInstantDescription => 'やわらかな色と白いフチ';

  @override
  String get styleDisposableDescription => '強いフラッシュ、周辺減光、光漏れ';

  @override
  String get styleBwDescription => '深いコントラストの粒子感あるモノクロ';

  @override
  String get styleGoldenDescription => 'いつでもゴールデンアワーのやさしい金色の光';

  @override
  String get styleChromeDescription => 'リバーサルフィルムのようなクールで鮮やかな色';

  @override
  String get shutterStopRecording => '録画を停止';

  @override
  String get shutterStartRecording => 'ビデオ録画を開始';

  @override
  String get shutterTakePhoto => '写真を撮る';

  @override
  String get modePhoto => '写真';

  @override
  String get modeVideo => 'ビデオ';

  @override
  String get cameraNotFound => 'カメラが見つかりません';

  @override
  String get cameraAccessNeeded => 'CamTripにカメラへのアクセスを許可してください。設定でオンにできます。';

  @override
  String get cameraStartFailed => 'カメラを起動できませんでした';

  @override
  String get albumAccessNeeded => 'アルバムにも保存するには、CamTripに写真へのアクセスを許可してください';

  @override
  String get albumSaveFailed => 'アルバムに保存できませんでした。写真は共有されます。';

  @override
  String styleProFallback(String style) {
    return 'このスタイルはPro専用です。このグループでは$styleで撮影します。';
  }

  @override
  String get photoFailed => '撮影できませんでした。もう一度お試しください。';

  @override
  String get recordingFailed => '録画できませんでした';

  @override
  String get videoFailed => '動画を作成できませんでした。もう一度お試しください。';

  @override
  String get shootInGroup => '撮影するグループ';

  @override
  String get close => '閉じる';

  @override
  String get flash => 'フラッシュ';

  @override
  String get flashOn => 'オン';

  @override
  String get flashOff => 'オフ';

  @override
  String get flashAuto => '自動';

  @override
  String get chooseGroup => 'グループを選択';

  @override
  String get switchCamera => 'カメラを切り替え';

  @override
  String get createOrJoinFirst => '先にグループを作成するか参加してください';

  @override
  String get proViaGroup => 'グループのPro';

  @override
  String proViaName(String name) {
    return '$nameさんのPro';
  }

  @override
  String get proStylesFreeViaMember => 'Proメンバーのおかげで、このグループではProスタイルを無料で使えます';

  @override
  String proStylesFreeViaName(String name) {
    return 'このグループのProスタイル: $nameさんのおかげで無料';
  }

  @override
  String get subscriptionsUnavailable =>
      '現在サブスクリプションをご利用いただけません。後でもう一度お試しください。';

  @override
  String get paymentPending => 'お支払いを処理中です。完了するとProが有効になります。';

  @override
  String get purchaseFailed => '購入できませんでした。後でもう一度お試しください。';

  @override
  String get restoreUnavailable => '現在購入を復元できません。後でもう一度お試しください。';

  @override
  String get restoreFailed => '復元できませんでした。後でもう一度お試しください。';

  @override
  String get welcomePro => 'CamTrip Proへようこそ！🎉';

  @override
  String get proRestored => 'Proを復元しました';

  @override
  String get noPurchaseFound => '以前の購入が見つかりません';

  @override
  String periodDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count日間',
    );
    return '$_temp0';
  }

  @override
  String periodWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count週間',
    );
    return '$_temp0';
  }

  @override
  String periodMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countか月',
    );
    return '$_temp0';
  }

  @override
  String periodYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count年',
    );
    return '$_temp0';
  }

  @override
  String get paywallHavePro => 'CamTrip Pro利用中';

  @override
  String get paywallSubtitle => '次の旅に必要なものがすべて。';

  @override
  String paywallFeatureStyles(String styles) {
    return 'すべてのカメラスタイル（$styles）';
  }

  @override
  String get paywallFeatureUnlimited => 'メンバーと保存容量が無制限、写真はずっと保存';

  @override
  String get paywallFeatureNoWatermark => 'ウォーターマークなしの振り返り動画';

  @override
  String get paywallFeatureOriginal => 'オリジナル画質でダウンロード';

  @override
  String get planYear => '年額';

  @override
  String get planMonth => '月額';

  @override
  String pricePerMonth(String price) {
    return '月あたり$price';
  }

  @override
  String paywallSaveBadge(int percent) {
    return '$percent%お得';
  }

  @override
  String get planMonthCancelAnytime => 'いつでも解約可能';

  @override
  String tryFree(String period) {
    return '$period無料で試す';
  }

  @override
  String get becomePro => 'Proにする';

  @override
  String get subscriptionsLoadFailed => 'サブスクリプションを読み込めませんでした。接続を確認してください。';

  @override
  String legalAnnual(String price) {
    return 'CamTrip Pro年額プラン: 1年あたり$price。';
  }

  @override
  String legalAnnualTrial(String period, String price) {
    return 'CamTrip Pro年額プラン: $period無料、その後1年あたり$price。';
  }

  @override
  String legalMonthly(String price) {
    return 'CamTrip Pro月額プラン: 1か月あたり$price。';
  }

  @override
  String legalMonthlyTrial(String period, String price) {
    return 'CamTrip Pro月額プラン: $period無料、その後1か月あたり$price。';
  }

  @override
  String get legalBillingApple =>
      'お支払いはApple IDに請求されます。期間終了の24時間前までに解約しない限り、サブスクリプションは自動更新されます。解約と管理はApp Storeのアカウント設定から行えます。';

  @override
  String get legalBillingGoogle =>
      'お支払いはGoogleアカウントに請求されます。期間終了の24時間前までに解約しない限り、サブスクリプションは自動更新されます。解約と管理はGoogle Playのアカウント設定から行えます。';

  @override
  String get restorePurchases => '購入を復元';

  @override
  String get terms => '利用規約';

  @override
  String get privacy => 'プライバシー';

  @override
  String get groupProTitle => 'グループに1人Proがいれば、みんながPro';

  @override
  String get groupProBody =>
      '1人がProなら、グループ全員がすべてのカメラスタイル、無制限のメンバー、ずっと残る写真、オリジナル画質、ウォーターマークなしの振り返り動画を使えます。';

  @override
  String get groupCreated => 'グループを作成しました ✓';

  @override
  String get inviteFriends => '友だちを招待';

  @override
  String get codeCopied => 'コードをコピーしました';

  @override
  String get shareLink => 'リンクを共有';

  @override
  String inviteSubject(String groupName) {
    return 'CamTripで$groupNameに参加しよう';
  }

  @override
  String inviteMembersUnlimited(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'メンバー$count人',
    );
    return '$_temp0 · 無制限（Pro）';
  }

  @override
  String inviteMembersLimit(int count, int limit) {
    return 'メンバー$count/$limit人 · Proなら無制限';
  }

  @override
  String get toCamera => 'カメラへ';

  @override
  String get done => '完了';

  @override
  String get joinEnterCode => '6文字のコードを入力してください';

  @override
  String get joinGroupTitle => 'グループに参加';

  @override
  String get joinGroupSubtitle => '友だちのコードを入力するか、QRコードをスキャンしてください。';

  @override
  String get typeCode => 'コードを入力';

  @override
  String get scanQr => 'QRをスキャン';

  @override
  String get join => '参加';

  @override
  String get groupNameRequired => 'グループ名を入力してください';

  @override
  String get newGroup => '新しいグループ';

  @override
  String get groupType => 'グループの種類';

  @override
  String get groupTypeVacation => '旅行';

  @override
  String get groupTypeVacationDescription => '開始日と終了日あり、終了後はアーカイブ';

  @override
  String get groupTypeEvent => 'イベント';

  @override
  String get groupTypeEventDescription => '1日または一晩、パーティーなど';

  @override
  String get groupTypePermanent => 'ずっとオープン';

  @override
  String get groupTypePermanentDescription => 'いつもの仲間と';

  @override
  String get date => '日付';

  @override
  String get departure => '出発';

  @override
  String get returnDate => '帰着';

  @override
  String get defaultCameraStyle => 'デフォルトのカメラスタイル';

  @override
  String freeLimitPermanent(int max) {
    return '無料: メンバー$max人まで。Proなら無制限。';
  }

  @override
  String freeLimitDated(int max, int days) {
    return '無料: メンバー$max人まで、写真は終了日から$days日後まで保存。Proなら無制限・無期限。';
  }

  @override
  String get createGroup => 'グループを作成';

  @override
  String get group => 'グループ';

  @override
  String groupCode(String code) {
    return 'コード $code';
  }

  @override
  String get manage => '管理';

  @override
  String get rename => '名前を変更';

  @override
  String get changeDates => '日付を変更';

  @override
  String get finishTrip => '旅行を終了';

  @override
  String get finishTripSubtitle => '終了日を今日にします';

  @override
  String get reopenGroup => 'グループを再開';

  @override
  String get closeGroup => 'グループを締め切る';

  @override
  String get reopenGroupSubtitle => 'メンバーが再び写真を追加できます';

  @override
  String get closeGroupSubtitle => '写真の追加はできなくなります。閲覧はそのまま可能です';

  @override
  String get members => 'メンバー';

  @override
  String memberYou(String name) {
    return '$name（あなた）';
  }

  @override
  String get blockedTag => 'ブロック中';

  @override
  String get adminTag => '管理者';

  @override
  String removeMemberTitle(String name) {
    return '$nameさんを削除しますか？';
  }

  @override
  String get removeMemberMessage => 'このメンバーの写真はグループに残ります。';

  @override
  String get remove => '削除';

  @override
  String get removeMember => '削除';

  @override
  String blockTitle(String name) {
    return '$nameさんをブロックしますか？';
  }

  @override
  String blockMessage(String name) {
    return '$nameさんの写真や動画は表示されなくなり、通知も届かなくなります。設定から解除できます。';
  }

  @override
  String get block => 'ブロック';

  @override
  String get makeMember => '一般メンバーにする';

  @override
  String get makeAdmin => '管理者にする';

  @override
  String get removeFromGroup => 'グループから削除';

  @override
  String get unblock => 'ブロックを解除';

  @override
  String get inviteFriendsButton => '友だちを招待';

  @override
  String get you => 'あなた';

  @override
  String get unarchive => 'アーカイブから戻す';

  @override
  String get archive => 'アーカイブ';

  @override
  String get unarchiveSubtitle => 'グループがアルバム一覧に戻ります';

  @override
  String archiveSubtitle(String section) {
    return 'あなただけ: グループはアルバム一覧の下の「$section」に移動します';
  }

  @override
  String get archivedSection => 'アーカイブ済み';

  @override
  String get hiddenPhotos => '非表示の写真';

  @override
  String get hiddenPhotosSubtitle => '自分用に非表示にした写真';

  @override
  String get leaveGroup => 'グループを退出';

  @override
  String get leaveGroupSubtitle => 'あなたの写真はほかのメンバーのためにグループに残ります';

  @override
  String get deleteGroup => 'グループを削除';

  @override
  String get deleteGroupSubtitle => '全員の写真がすべて削除されます';

  @override
  String groupArchived(String groupName) {
    return '「$groupName」をアーカイブしました';
  }

  @override
  String groupUnarchived(String groupName) {
    return '「$groupName」がアルバム一覧に戻りました';
  }

  @override
  String get undo => '元に戻す';

  @override
  String get groupNameTitle => 'グループ名';

  @override
  String get finishTripTitle => '旅行を終了しますか？';

  @override
  String get finishTripMessage => '終了日が今日になります。写真はまだ追加でき、振り返り動画の準備ができています。';

  @override
  String get finishTripConfirm => '終了する';

  @override
  String get tripFinished => '旅行を終了しました';

  @override
  String leaveGroupTitle(String groupName) {
    return '「$groupName」を退出しますか？';
  }

  @override
  String get leaveGroupMessage =>
      'あなたの写真はほかのメンバーのためにグループに残ります。コードを使えば後でまた参加できます。';

  @override
  String get leave => '退出';

  @override
  String groupDeleted(String groupName) {
    return '「$groupName」を削除しました';
  }

  @override
  String get youAreAdmin => 'あなたは管理者';

  @override
  String get open => '開く';

  @override
  String get archiveMenuSubtitle => 'あなただけの設定で、ほかの人には分かりません';

  @override
  String get deleteGroupMenuSubtitle => '全員から、すべての写真ごと';

  @override
  String get deleteGroupTitle => 'グループを削除しますか？';

  @override
  String deleteGroupMessage(int count, String groupName, int memberCount) {
    return '「$groupName」の写真と動画$count件が、メンバー$memberCount人全員から削除されます。この操作は取り消せません。';
  }

  @override
  String get deleteGroupOwnRoll => '端末のカメラロールは変更されません。';

  @override
  String get deleteGroupTypeName => '確認のためグループ名を入力してください:';

  @override
  String get deleteForEveryone => '全員から削除';

  @override
  String get save => '保存';

  @override
  String get yourAlbums => 'アルバム';

  @override
  String get uploadQueue => 'アップロード待ち';

  @override
  String get noConnection => '接続できません';

  @override
  String get albumsOfflineMessage => 'インターネットに接続するとアルバムが読み込まれます。カメラはそのまま使えます。';

  @override
  String get retry => '再試行';

  @override
  String get noAlbumsTitle => 'アルバムはまだありません';

  @override
  String get noAlbumsMessage => '次の旅行のグループを作るか、友だちのコードで参加しましょう。';

  @override
  String get haveCode => 'コードを持っている';

  @override
  String get joinWithCode => 'コードまたはQRコードで参加';

  @override
  String get camera => 'カメラ';

  @override
  String get restore => '戻す';

  @override
  String get more => 'その他';

  @override
  String get newAlbum => '新規';

  @override
  String get closedTag => '締め切り';

  @override
  String get activeTag => '使用中';

  @override
  String get uploadFailed => 'アップロードに失敗しました';

  @override
  String get queueNoSignal => '圏外です。';

  @override
  String get queueNoSignalMessage => '写真はアルバムに保存済みです。インターネットに接続するとすぐに共有されます。';

  @override
  String get queueWaitingForWifi => 'Wi-Fiを待っています。';

  @override
  String queueWifiOnlyOn(String setting) {
    return '「$setting」がオンになっています。';
  }

  @override
  String get queueVideosWifiOnly => '動画はWi-Fi接続時のみアップロードされます。';

  @override
  String get queueAllShared => 'すべて共有しました ✓';

  @override
  String queuePending(String items) {
    return '共有待ち: $items';
  }

  @override
  String queuePendingBoth(String photos, String videos) {
    return '共有待ち: $photos、$videos';
  }

  @override
  String get retryUpload => '再試行';

  @override
  String get removeFromQueue => '待機リストから削除';

  @override
  String get queueStatusWifi => 'Wi-Fi';

  @override
  String get queueStatusWaiting => '待機中';

  @override
  String get videosWifiOnlyTitle => '動画はWi-Fiのみ';

  @override
  String get videosWifiOnlySubtitle => 'モバイルデータを節約';

  @override
  String get retryNow => '今すぐ再試行';

  @override
  String get yourName => '名前';

  @override
  String get settings => '設定';

  @override
  String get tapToChangeName => 'タップして名前を変更';

  @override
  String get getCamTripPro => 'CamTrip Proにする';

  @override
  String get photos => '写真';

  @override
  String get saveOwnPhotos => '自分の写真をグループごとのアルバムに保存';

  @override
  String get autoSaveOthers => 'ほかの人の写真を自動で保存';

  @override
  String get wifiOnlyTitle => 'Wi-Fi接続時のみアップロード';

  @override
  String get dateStamp => '日付スタンプ';

  @override
  String get notifications => '通知';

  @override
  String get notifyNewPhotos => '新しい写真（まとめて通知）';

  @override
  String get notifyRecapReady => '振り返り動画の完成';

  @override
  String get camTripTeam => 'CamTripチーム';

  @override
  String get adminEntrySubtitle => 'ユーザー、Proの付与、報告、統計';

  @override
  String get account => 'アカウント';

  @override
  String get manageSubscription => 'サブスクリプションを管理';

  @override
  String get blockedPeople => 'ブロック中のユーザー';

  @override
  String get nobody => 'なし';

  @override
  String peopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count人',
    );
    return '$_temp0';
  }

  @override
  String get privacyPolicy => 'プライバシーポリシー';

  @override
  String get contact => 'お問い合わせ';

  @override
  String get signOut => 'ログアウト';

  @override
  String get deleteAccount => 'アカウントを削除';

  @override
  String get deleteAccountSubtitle => 'アカウントとすべての写真を削除します';

  @override
  String get deleteAccountTitle => 'アカウントを削除しますか？';

  @override
  String get deleteAccountMessage =>
      'アカウントとすべての写真・動画が、グループからも削除されます。有効なサブスクリプションはApp StoreまたはGoogle Playで解約してください。';

  @override
  String get blockedTitle => 'ブロック中';

  @override
  String get blockedSubtitle => 'これらのユーザーの写真は表示されません。';

  @override
  String get blockedNone => 'ブロックしているユーザーはいません。';

  @override
  String get unblockShort => '解除';

  @override
  String get groupGone => 'このグループはもう存在しないか、あなたはメンバーではなくなりました。';

  @override
  String photosSavedToAlbum(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '写真$count枚を「$album」に保存しました',
    );
    return '$_temp0';
  }

  @override
  String photosDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '写真$count枚を削除しました',
    );
    return '$_temp0';
  }

  @override
  String photosDeletedSkipped(int count, int skipped) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '写真$count枚を削除しました',
    );
    return '$_temp0（$skipped枚はスキップ）';
  }

  @override
  String photosHiddenForYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '写真$count枚を非表示にしました',
    );
    return '$_temp0';
  }

  @override
  String get addedToFavorites => 'お気に入りに追加しました';

  @override
  String get removedFromFavorites => 'お気に入りから外しました';

  @override
  String get photoAccessSettings => '設定でCamTripに写真へのアクセスを許可してください';

  @override
  String photosBeingAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '写真$count枚を追加しています',
    );
    return '$_temp0';
  }

  @override
  String photosUnreadable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '写真$count枚を読み込めませんでした',
    );
    return '$_temp0';
  }

  @override
  String get groupNotLoaded => 'グループを読み込めませんでした';

  @override
  String get noFavoritesTitle => 'お気に入りはまだありません';

  @override
  String get noPhotosTitle => '写真はまだありません';

  @override
  String get noFavoritesMessage => '写真の星をタップすると、ここに表示されます。';

  @override
  String get noPhotosMessage => '最初の1枚を撮りましょう。グループのみんながすぐに見られます。';

  @override
  String get openCamera => 'カメラを開く';

  @override
  String savingProgress(int done, int total) {
    return '保存中... $done/$total';
  }

  @override
  String get sharePreparing => '準備中...';

  @override
  String sharingProgress(int done, int total) {
    return '準備中... $done/$total';
  }

  @override
  String get choosePhotos => '写真を選択';

  @override
  String selectedCount(int count) {
    return '$count件選択中';
  }

  @override
  String get selectNone => '選択を解除';

  @override
  String get selectAll => 'すべて選択';

  @override
  String photosWaitingToShare(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '写真$count枚が共有待ちです',
    );
    return '$_temp0';
  }

  @override
  String get recapReadyTitle => '振り返り動画ができました';

  @override
  String get recapReadySubtitle => '旅の思い出を音楽付きの動画に';

  @override
  String get watch => '見る';

  @override
  String get makeRecapNow => '今すぐ振り返り動画を作る';

  @override
  String freeGroupDeleteNotice(String date) {
    return '無料グループ: 写真は$dateまで保存されます。保存するかProにしましょう。';
  }

  @override
  String get filterAll => 'すべて';

  @override
  String get filterFavorites => 'お気に入り';

  @override
  String get filterPerPerson => '人で絞り込む';

  @override
  String get filterPerson => '人';

  @override
  String get select => '選択';

  @override
  String get hiddenFilter => '非表示';

  @override
  String get photosBy => '写真を撮った人...';

  @override
  String get uploadedTag => 'アップロード';

  @override
  String get saveAll => 'すべて保存';

  @override
  String get favorite => 'お気に入り';

  @override
  String get unfavorite => 'お気に入り解除';

  @override
  String get hide => '非表示';

  @override
  String get delete => '削除';

  @override
  String deletePhotosTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '写真$count枚を削除しますか？',
      one: '写真を削除しますか？',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'グループの全員から削除されます。この操作は取り消せません。',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosNotAllowed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '写真$count枚はほかの人のものです。削除されずに残ります。削除できるのは管理者だけです。',
    );
    return '$_temp0';
  }

  @override
  String photosBackInGroup(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '写真$count枚がグループに戻りました',
    );
    return '$_temp0';
  }

  @override
  String get showAll => 'すべて表示';

  @override
  String get hiddenPhotosExplainer =>
      'これらの写真はあなたにだけ表示されません。グループのほかの人には表示されたままです。';

  @override
  String get nothingHidden => '非表示の写真はありません';

  @override
  String get nothingHiddenMessage => '非表示にした写真はここに表示されます。';

  @override
  String showAgainCount(int count) {
    return '再表示（$count）';
  }

  @override
  String get someone => 'だれか';

  @override
  String get savedToAlbum => '写真アルバムに保存しました';

  @override
  String get share => '共有';

  @override
  String get shareFailed => '共有できませんでした';

  @override
  String get reportTitle => 'この写真を報告する理由は？';

  @override
  String get reportSubtitle => '報告はすべて24時間以内に確認します。写真はすぐにあなたには非表示になります。';

  @override
  String get reportThanks => 'ありがとうございます。確認します';

  @override
  String blockMessageAllGroups(String name) {
    return 'どのグループでも$nameさんの写真や動画は表示されなくなり、通知も届かなくなります。設定から解除できます。';
  }

  @override
  String userBlocked(String name) {
    return '$nameさんをブロックしました';
  }

  @override
  String get videoHiddenForYou => '動画を非表示にしました';

  @override
  String get photoHiddenForYou => '写真を非表示にしました';

  @override
  String get setAsCover => 'カバーに設定';

  @override
  String get coverUpdated => 'カバー写真を変更しました';

  @override
  String get hideForMe => '自分だけ非表示';

  @override
  String get hideForMeSubtitle => 'グループのほかの人には表示されたままです';

  @override
  String get reportPhoto => '写真を報告';

  @override
  String blockName(String name) {
    return '$nameさんをブロック';
  }

  @override
  String get forEveryoneInGroup => 'グループの全員から';

  @override
  String get videoDeleted => '動画を削除しました';

  @override
  String get photoDeleted => '写真を削除しました';

  @override
  String get photoAccessToSave => '保存するには、設定でCamTripに写真へのアクセスを許可してください';

  @override
  String get phoneFull => '端末の空き容量がありません';

  @override
  String get albumSaveFailedShort => 'アルバムに保存できませんでした';

  @override
  String get recapTemplateGoldenHour => 'ゴールデンアワー';

  @override
  String get recapTemplateFast => 'スピード';

  @override
  String get recapTemplateFilmRoll => 'フィルム';

  @override
  String get recapTemplatePolaroid => 'ポラロイド';

  @override
  String get trackSummerEvening => '夏の夕暮れ';

  @override
  String get trackGoldenHour => 'ゴールデンアワー';

  @override
  String get trackRoadtrip => 'ロードトリップ';

  @override
  String get moodWarm => 'あたたかい';

  @override
  String get moodCheerful => '明るい';

  @override
  String friendsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '友だち$count人',
    );
    return '$_temp0';
  }

  @override
  String get madeWithCamTrip => 'Made with CamTrip';

  @override
  String get tagline => 'グループみんなでひとつのフィルム';

  @override
  String get videoUnsupportedDevice => 'この端末では動画を作成できませんでした';

  @override
  String get groupLoadFailed => 'このグループを読み込めませんでした。';

  @override
  String recapNeedsPhotos(int count) {
    return '振り返り動画には写真が$count枚以上必要です。';
  }

  @override
  String get recapFailed => '振り返り動画を作成できませんでした。もう一度お試しください。';

  @override
  String get recapSaved => '振り返り動画を写真アルバムに保存しました';

  @override
  String get recap => '振り返り';

  @override
  String get recapRendering => '振り返りを作成中...';

  @override
  String get videoRendering => '動画を作成中...';

  @override
  String get template => 'テンプレート';

  @override
  String get musicLicense => 'CamTripオリジナル音楽 · ロイヤリティフリー';

  @override
  String get change => '変更';

  @override
  String get noWatermark => 'ウォーターマークなし ✓';

  @override
  String get removeWatermarkPro => 'Proでウォーターマークを外す';

  @override
  String get proSourceSubscription => 'サブスクリプション';

  @override
  String get proSourceGift => 'ギフト';

  @override
  String get proSourceAdmin => '管理者';

  @override
  String get proSourceGroup => 'グループ経由';

  @override
  String get noPro => 'Proなし';

  @override
  String proStatusNoEnd(String source) {
    return 'Pro（$source）、終了日なし';
  }

  @override
  String proStatusUntil(String source, String date) {
    return 'Pro（$source）、$dateまで';
  }

  @override
  String get lifetime => '永久';

  @override
  String get pickDate => '日付を選択';

  @override
  String get noAccess => 'アクセスできません';

  @override
  String get adminOnlyTeam => '管理画面はCamTripチーム専用です。';

  @override
  String get adminOverview => '概要';

  @override
  String get adminUsers => 'ユーザー';

  @override
  String get adminReports => '報告';

  @override
  String adminsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '管理者$count人',
    );
    return '$_temp0';
  }

  @override
  String get adminNewThisWeek => '今週の新規';

  @override
  String get adminGroups => 'グループ';

  @override
  String get adminProSubscription => 'サブスクのPro';

  @override
  String get adminProGift => 'ギフトのPro';

  @override
  String adminWithoutSubscription(int count) {
    return 'サブスクなし$count人';
  }

  @override
  String get adminOpenReports => '未対応の報告';

  @override
  String get adminSearchHint => '名前またはメールで検索';

  @override
  String get nobodyFound => '見つかりません';

  @override
  String get loadMore => 'さらに読み込む';

  @override
  String get noEmail => 'メールなし';

  @override
  String adminDeletePhotoMessage(String groupName) {
    return 'この写真は「$groupName」の全員から削除されます。この写真への報告はすべて対応済みになります。';
  }

  @override
  String get adminBanMessage => 'このアカウントはログインもアプリの利用もできなくなります。後で元に戻せます。';

  @override
  String get adminDismissTitle => '報告を却下しますか？';

  @override
  String get adminDismissMessage => '写真は残ります。報告は対応済みになります。';

  @override
  String get adminDismiss => '却下';

  @override
  String get adminAccountBlocked => 'アカウントをブロックしました';

  @override
  String get adminReportDismissed => '報告を却下しました';

  @override
  String get adminNoReports => '未対応の報告はありません';

  @override
  String get adminNoReportsMessage => '報告された写真はここに表示されます。';

  @override
  String get deletedTag => '削除済み';

  @override
  String adminReportedBy(String name) {
    return '報告者: $name';
  }

  @override
  String adminPhotoBy(String name) {
    return '撮影者: $name';
  }

  @override
  String reportsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '報告$count件',
    );
    return '$_temp0';
  }

  @override
  String get adminDeletePhoto => '写真を削除';

  @override
  String get adminBlockCreator => '撮影者をブロック';

  @override
  String get loadFailed => '読み込めませんでした';

  @override
  String get adminLifetimeProGiven => '永久Proを付与しました';

  @override
  String get adminProGiven => 'Proを付与しました';

  @override
  String adminGiveProUntil(String date) {
    return '$dateまでProを付与';
  }

  @override
  String get adminGiveProLifetime => '永久Proを付与';

  @override
  String adminGiveProFor(String period) {
    return '${period}Proを付与';
  }

  @override
  String get adminReasonHint => '理由（例: 友人、テスター、インフルエンサー）';

  @override
  String get adminGivePro => 'Proを付与';

  @override
  String get adminRevokeTitle => 'ギフトを取り消しますか？';

  @override
  String get adminRevokeMessage => '付与したProはすぐに終了します。本人のサブスクリプションはそのまま続きます。';

  @override
  String get adminRevoke => '取り消す';

  @override
  String get adminGiftRevoked => 'ギフトを取り消しました';

  @override
  String get adminUnbanTitle => 'ブロックを解除しますか？';

  @override
  String adminUnbanMessage(String name) {
    return '$nameさんは再びログインできるようになります。';
  }

  @override
  String get adminUnbanned => 'ブロックを解除しました';

  @override
  String get adminBanUserMessage => 'このアカウントはログインもアプリの利用もできなくなります。写真は残ります。';

  @override
  String get adminUser => 'ユーザー';

  @override
  String get adminNotVerified => '未確認';

  @override
  String get adminRole => '役割';

  @override
  String get adminCreated => '作成日';

  @override
  String get unknown => '不明';

  @override
  String get adminSignInWith => 'ログイン方法';

  @override
  String get adminEmailMethod => 'メール';

  @override
  String get adminPhotosAndVideos => '写真と動画';

  @override
  String get adminStatus => 'ステータス';

  @override
  String get adminActive => '有効';

  @override
  String adminActiveUntil(String date) {
    return '$dateまで有効';
  }

  @override
  String adminGiftFrom(String name) {
    return '$nameさんからのギフト';
  }

  @override
  String adminExpiredOn(String date) {
    return '$dateに期限切れ';
  }

  @override
  String get adminExpired => '期限切れ';

  @override
  String adminUntil(String date) {
    return '$dateまで';
  }

  @override
  String get adminGiveProTitle => 'Proを付与';

  @override
  String get adminGiveProNote => 'この人のグループにも適用されます: グループに1人Proがいれば、みんながProです。';

  @override
  String get adminRevokeGift => 'ギフトを取り消す';

  @override
  String get adminModeration => 'モデレーション';

  @override
  String get adminCannotBanSelf => '自分をブロックすることはできません。';

  @override
  String get adminCannotBanAdmin => '管理者はブロックできません。';

  @override
  String get adminUnban => 'ブロックを解除';

  @override
  String get adminBanAccount => 'アカウントをブロック';

  @override
  String get googleSignInUnavailable => 'Googleでのログインはまだ利用できません';

  @override
  String get cameraPickerTitle => 'カメラを選ぶ';

  @override
  String get cameraPickerSubtitle => 'カメラごとに写真の雰囲気が変わります';

  @override
  String get cameraPickerChange => 'カメラを切り替え';

  @override
  String get cameraPickerUnlock => 'Proでロック解除';

  @override
  String get cameraPickerSelected => '選択中';

  @override
  String get cameraPickerStyleSummer => 'サマー';

  @override
  String get cameraPickerStyleSummerDescription => '90年代のスナップのような、あたたかく色あせた色';

  @override
  String get cameraPickerStyleNight => 'ナイト800';

  @override
  String get cameraPickerStyleNightDescription => '映画フィルム風: 青緑の影、あたたかい光、強い粒子感';

  @override
  String get cameraPickerStyleSepia => 'セピア';

  @override
  String get cameraPickerStyleSepiaDescription => '靴箱から出てきた古い茶色のプリント';

  @override
  String get cameraPickerStyleLomo => 'ロモ';

  @override
  String get cameraPickerStyleLomoDescription => '鮮やかな色、暗い四隅、大胆な色かぶり';

  @override
  String get cameraPickerStyleMint => 'ミント';

  @override
  String get cameraPickerStyleMintDescription => 'グリーンがかった、やわらかくさわやかな色';

  @override
  String get cameraPickerStylePastel => 'ピンク';

  @override
  String get cameraPickerStylePastelDescription => 'ピンクに輝くパステルカラーと白いフチ';

  @override
  String get cameraPickerStyleSuper8 => 'スーパー8';

  @override
  String get cameraPickerStyleSuper8Description => '古いホームビデオのような、粒子感のあるやわらかな映像';

  @override
  String get paywallBenefitGroup => '1人がProならグループ全員がPro';

  @override
  String get paywallBenefitUnlimited => 'メンバー無制限、写真はずっと保存';

  @override
  String get paywallBenefitQuality => 'ウォーターマークなし、オリジナル画質';

  @override
  String paywallFreeTrial(String period) {
    return '$period無料';
  }

  @override
  String paywallPriceYear(String price) {
    return '1年あたり$price。';
  }

  @override
  String paywallPriceYearTrial(String period, String price) {
    return '$period無料、その後1年あたり$price。';
  }

  @override
  String paywallPriceMonth(String price) {
    return '1か月あたり$price。';
  }

  @override
  String paywallPriceMonthTrial(String period, String price) {
    return '$period無料、その後1か月あたり$price。';
  }

  @override
  String paywallAutoRenew(String store) {
    return '自動更新されます。更新の24時間前までに$storeで解約できます。';
  }

  @override
  String get paywallDetailsTitle => 'Proでできること';

  @override
  String get paywallBenefitStyles => 'すべてのカメラスタイル';

  @override
  String get allPhotosTitle => 'すべての写真';

  @override
  String get homeTabAlbums => 'アルバム';

  @override
  String get allPhotosEmptyTitle => 'まだ写真がありません';

  @override
  String get allPhotosEmptyMessage => 'カメラを開いて、最初の1枚を撮りましょう。';

  @override
  String get allPhotosLoadFailed => '写真を読み込めませんでした';

  @override
  String get cameraSettingsTitle => 'カメラ設定';

  @override
  String get cameraSettingsMore => 'その他の設定';

  @override
  String get cameraSettingsGrid => 'グリッド';

  @override
  String get cameraSettingsHaptics => '撮影時に振動';

  @override
  String get cameraSettingsDateStamp => '右下に日付';

  @override
  String get cameraSettingsSound => 'シャッター音';

  @override
  String get cameraSettingsSoundHint => 'マナーモード中は鳴りません';

  @override
  String get cameraSettingsTimer => 'セルフタイマー';

  @override
  String get cameraSettingsTimerOff => 'オフ';

  @override
  String cameraSettingsTimerSeconds(int seconds) {
    return '$seconds秒';
  }

  @override
  String get cameraSettingsTimerCancelHint => 'シャッターをタップでキャンセル';

  @override
  String get cameraSettingsMirror => 'セルフィーを反転';

  @override
  String get cameraSettingsSaveToRoll => 'カメラロールに保存';

  @override
  String get cameraSettingsQuality => '画質';

  @override
  String get cameraSettingsQualityStandard => '標準';

  @override
  String get cameraSettingsQualityHigh => '高画質';

  @override
  String get cameraLowLightHint => '暗いです - フラッシュをオンにしましょう';

  @override
  String get cameraFlashUnavailable => 'このカメラにはフラッシュがありません';

  @override
  String get cameraFlashScreen => '画面フラッシュ';

  @override
  String get cameraFlashCycleHint => 'タップでオフ・オン・自動を切り替え';

  @override
  String get cameraFlip => 'フロント/背面カメラを切り替え';

  @override
  String get cameraFlipHint => 'ファインダーをダブルタップでカメラを切り替え';

  @override
  String cameraPickerPaywallStyles(int count, String styles) {
    return '全$count種類のカメラ（$stylesなど）';
  }

  @override
  String get styleFlash => 'フラッシュ400';

  @override
  String get styleFlashDescription => '暖かいフィルムに直接フラッシュ：琥珀色の光、粒子、鮮やかな赤';
}
