// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get cancel => 'Cancel';

  @override
  String get yes => 'Yes';

  @override
  String inviteMessageIntro(String groupName) {
    return 'Want to join \"$groupName\" on CamTrip? Then we see each other\'s photos right away.';
  }

  @override
  String inviteMessageCode(String code) {
    return 'Or enter the code: $code';
  }

  @override
  String get memberFallbackName => 'Friend';

  @override
  String get reportReasonInappropriate => 'Inappropriate or offensive';

  @override
  String get reportReasonSpam => 'Spam';

  @override
  String get reportReasonOther => 'Something else';

  @override
  String dateRangeSameMonth(
    String startDay,
    String endDay,
    String month,
    String monthNum,
    String endDate,
  ) {
    return '$month $startDay-$endDay';
  }

  @override
  String get errorOffline => 'No connection. Try again in a moment.';

  @override
  String errorSomethingWrongStatus(int status) {
    return 'Something went wrong ($status)';
  }

  @override
  String get errorSomethingWrong => 'Something went wrong';

  @override
  String get apiInvalidCredentials => 'E-mail address or password is incorrect';

  @override
  String get apiInvalidCode =>
      'This code is incorrect or has expired. Request a new code.';

  @override
  String get apiEmailTaken =>
      'An account with this e-mail address already exists. Sign in, or choose \"Forgot password?\".';

  @override
  String apiEmailTakenProvider(String provider) {
    return 'An account with this e-mail address already exists. Sign in with $provider.';
  }

  @override
  String apiWeakPassword(int min) {
    return 'Choose a password of at least $min characters';
  }

  @override
  String apiNameTooLong(int max) {
    return 'Your name can be at most $max characters';
  }

  @override
  String get apiRateLimited => 'Too many attempts. Try again in 15 minutes.';

  @override
  String apiAccountBanned(String email) {
    return 'Your account has been blocked. Contact $email if you think this is a mistake.';
  }

  @override
  String get apiProRequired => 'This camera style is part of CamTrip Pro';

  @override
  String get apiGroupClosed => 'This group has been closed';

  @override
  String get apiGroupCodeNotFound => 'No group found with this code';

  @override
  String apiGroupFull(int max) {
    return 'This group is full (max. $max members). If one member has CamTrip Pro, anyone can join.';
  }

  @override
  String get apiLastMember =>
      'You are the last member. Delete the group instead.';

  @override
  String get apiAdminRequired => 'Only for CamTrip administrators';

  @override
  String get apiUploadIncomplete => 'The upload is not complete';

  @override
  String get apiInvalidInput => 'Invalid input';

  @override
  String get apiNotSignedIn => 'Not signed in';

  @override
  String get apiAccountGone => 'This account no longer exists';

  @override
  String get apiPhotoNotFound => 'Photo not found';

  @override
  String get apiGroupNotFound => 'Group not found';

  @override
  String get apiMemberNotFound => 'Member not found';

  @override
  String get apiPersonNotFound => 'Person not found';

  @override
  String get apiUserNotFound => 'User not found';

  @override
  String get apiAdminOnly => 'Only an admin can do this';

  @override
  String get apiCannotBlockSelf => 'You can\'t block yourself';

  @override
  String get apiCannotReportOwn => 'You can\'t report your own photo';

  @override
  String get apiDeleteOwnOnly => 'You can only delete your own photos';

  @override
  String get apiOwnerCannotBeRemoved =>
      'The group\'s creator can\'t be removed';

  @override
  String get apiOwnerStaysAdmin => 'The creator always stays an admin';

  @override
  String get apiNeedsOneAdmin => 'A group needs at least one admin';

  @override
  String get apiEndBeforeStart => 'The end date is before the start date';

  @override
  String get apiPermanentNoEndDate =>
      'A group that\'s always open has no end date';

  @override
  String get apiCannotBanAdmin => 'An administrator can\'t be blocked';

  @override
  String get apiReportNotFound => 'Report not found';

  @override
  String get apiPhotoOwnerUnknown =>
      'The person who took this photo is no longer known';

  @override
  String get validationNameRequired => 'Enter your name';

  @override
  String validationMaxChars(int max) {
    return 'At most $max characters';
  }

  @override
  String get validationEmailRequired => 'Enter your e-mail address';

  @override
  String get validationEmailInvalid => 'This e-mail address isn\'t valid';

  @override
  String get validationPasswordRequired => 'Choose a password';

  @override
  String validationMinChars(int min) {
    return 'At least $min characters';
  }

  @override
  String get validationPasswordTooLong => 'This password is too long';

  @override
  String get validationPasswordEmpty => 'Enter your password';

  @override
  String get validationCodeRequired => 'Enter the code from the e-mail';

  @override
  String get validationCodeDigits => 'The code has 6 digits';

  @override
  String get onboarding1Title => 'One roll\nfor the whole group.';

  @override
  String get onboarding1Body =>
      'Shoot with a retro camera. Everyone sees your photos instantly, and they\'re right in your own album too.';

  @override
  String get onboarding2Title => 'No more\nsending photos around.';

  @override
  String get onboarding2Body =>
      'Create a group, share the code, done. Never again \"can you send me those photos?\"';

  @override
  String get onboarding3Title => 'A recap video\nafterwards.';

  @override
  String get onboarding3Body =>
      'CamTrip makes a video with music of your best moments together.';

  @override
  String get onboardingInvited => 'You\'ve been invited! Sign in to join.';

  @override
  String get signInAppleFailed => 'Signing in with Apple didn\'t work';

  @override
  String get signInGoogleFailed => 'Signing in with Google didn\'t work';

  @override
  String get signInFailed => 'Signing in didn\'t work';

  @override
  String get next => 'Next';

  @override
  String get legalPrefix => 'By continuing you agree to the ';

  @override
  String get legalTerms => 'terms';

  @override
  String get legalAnd => ' and the ';

  @override
  String get legalPrivacy => 'privacy policy';

  @override
  String get legalSuffix => '.';

  @override
  String get continueWithApple => 'Continue with Apple';

  @override
  String get continueWithGoogle => 'Continue with Google';

  @override
  String get createAccount => 'Create account';

  @override
  String get signIn => 'Sign in';

  @override
  String get or => 'or';

  @override
  String get registerSubtitle => 'So your friends can see who took the photos.';

  @override
  String get loginSubtitle => 'Welcome back.';

  @override
  String get forgotPasswordTitle => 'Forgot password';

  @override
  String get forgotPasswordPushSubtitle =>
      'Still signed in somewhere? We\'ll send a 6-digit code there as a push notification so you can set a new password.';

  @override
  String get newPassword => 'New password';

  @override
  String get resetPushInfo =>
      'If you\'re still signed in somewhere, you\'ll get a push notification there with a code. Can\'t get in? Sign in with Apple or Google using the same e-mail address - your account will be linked.';

  @override
  String get sendCode => 'Send code';

  @override
  String get savePassword => 'Save password';

  @override
  String get errorTryAgain => 'Something went wrong. Please try again.';

  @override
  String get back => 'Back';

  @override
  String get name => 'Name';

  @override
  String get email => 'E-mail address';

  @override
  String get codeFromPush => 'Code from the notification';

  @override
  String get password => 'Password';

  @override
  String get hidePassword => 'Hide password';

  @override
  String get showPassword => 'Show password';

  @override
  String get forgotPasswordLink => 'Forgot password?';

  @override
  String get haveAccount => 'Already have an account?';

  @override
  String get newToCamTrip => 'New to CamTrip?';

  @override
  String get rememberedIt => 'Remembered it?';

  @override
  String get noCodeReceived => 'Didn\'t get a code?';

  @override
  String get resendCode => 'Send again';

  @override
  String onboardingDemoRoll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count photographers, 1 roll',
      one: '1 photographer, 1 roll',
    );
    return '$_temp0';
  }

  @override
  String membersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count members',
      one: '1 member',
    );
    return '$_temp0';
  }

  @override
  String photosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count photos',
      one: '1 photo',
    );
    return '$_temp0';
  }

  @override
  String videosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count videos',
      one: '1 video',
    );
    return '$_temp0';
  }

  @override
  String get justNow => 'now';

  @override
  String get badgeNew => 'New';

  @override
  String recapTitle(String groupName) {
    return 'Recap $groupName';
  }

  @override
  String get styleFilm => 'Film';

  @override
  String get styleInstant => 'Instant';

  @override
  String get styleDisposable => 'Disposable';

  @override
  String get styleBw => 'B&W';

  @override
  String get styleGolden => 'Golden';

  @override
  String get styleChrome => 'Chrome';

  @override
  String get styleFilmDescription =>
      'Warm colours, grain and an orange date stamp';

  @override
  String get styleInstantDescription => 'Soft colours and a white border';

  @override
  String get styleDisposableDescription =>
      'Harsh flash, vignette and light leaks';

  @override
  String get styleBwDescription => 'Grainy black and white with deep contrast';

  @override
  String get styleGoldenDescription => 'Always golden hour, a soft golden glow';

  @override
  String get styleChromeDescription =>
      'Cool, saturated and sharp, like slide film';

  @override
  String get shutterStopRecording => 'Stop recording';

  @override
  String get shutterStartRecording => 'Start video recording';

  @override
  String get shutterTakePhoto => 'Take photo';

  @override
  String get modePhoto => 'Photo';

  @override
  String get modeVideo => 'Video';

  @override
  String get cameraNotFound => 'No camera found';

  @override
  String get cameraAccessNeeded =>
      'CamTrip needs access to your camera. Turn it on in Settings.';

  @override
  String get cameraStartFailed => 'The camera couldn\'t start';

  @override
  String get albumAccessNeeded =>
      'Give CamTrip access to your photos to also save them to your album';

  @override
  String get albumSaveFailed =>
      'Saving to your album didn\'t work. The photo is still shared.';

  @override
  String styleProFallback(String style) {
    return 'This style is part of Pro. In this group you shoot with $style.';
  }

  @override
  String get photoFailed => 'Taking the photo didn\'t work. Please try again.';

  @override
  String get recordingFailed => 'Recording video didn\'t work';

  @override
  String get videoFailed => 'Making the video didn\'t work. Please try again.';

  @override
  String get shootInGroup => 'Shoot in group';

  @override
  String get close => 'Close';

  @override
  String get flash => 'Flash';

  @override
  String get flashOn => 'On';

  @override
  String get flashOff => 'Off';

  @override
  String get flashAuto => 'Auto';

  @override
  String get chooseGroup => 'Choose group';

  @override
  String get switchCamera => 'Switch camera';

  @override
  String get createOrJoinFirst => 'Create or join a group first';

  @override
  String get proViaGroup => 'Pro via the group';

  @override
  String proViaName(String name) {
    return 'Pro via $name';
  }

  @override
  String get proStylesFreeViaMember =>
      'Pro styles in this group are free for you thanks to a Pro member';

  @override
  String proStylesFreeViaName(String name) {
    return 'Pro styles in this group: free for you thanks to $name';
  }

  @override
  String get subscriptionsUnavailable =>
      'Subscriptions aren\'t available right now. Please try again later.';

  @override
  String get paymentPending =>
      'Your payment is still being processed. Pro turns on as soon as it\'s done.';

  @override
  String get purchaseFailed =>
      'The purchase didn\'t work. Please try again later.';

  @override
  String get restoreUnavailable =>
      'Restoring purchases isn\'t possible right now. Please try again later.';

  @override
  String get restoreFailed => 'Restoring didn\'t work. Please try again later.';

  @override
  String get welcomePro => 'Welcome to CamTrip Pro! 🎉';

  @override
  String get proRestored => 'Pro has been restored';

  @override
  String get noPurchaseFound => 'No previous purchase found';

  @override
  String periodDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days',
      one: '1 day',
    );
    return '$_temp0';
  }

  @override
  String periodWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count weeks',
      one: '1 week',
    );
    return '$_temp0';
  }

  @override
  String periodMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count months',
      one: '1 month',
    );
    return '$_temp0';
  }

  @override
  String periodYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count years',
      one: '1 year',
    );
    return '$_temp0';
  }

  @override
  String get paywallHavePro => 'You have CamTrip Pro';

  @override
  String get paywallSubtitle => 'Everything for your next trip.';

  @override
  String paywallFeatureStyles(String styles) {
    return 'All camera styles ($styles)';
  }

  @override
  String get paywallFeatureUnlimited =>
      'Unlimited members and storage, photos are kept forever';

  @override
  String get paywallFeatureNoWatermark => 'Recaps without a watermark';

  @override
  String get paywallFeatureOriginal => 'Download in original quality';

  @override
  String get planYear => 'Year';

  @override
  String get planMonth => 'Month';

  @override
  String pricePerMonth(String price) {
    return '$price per month';
  }

  @override
  String paywallSaveBadge(int percent) {
    return 'SAVE $percent%';
  }

  @override
  String get planMonthCancelAnytime => 'cancel anytime';

  @override
  String tryFree(String period) {
    return 'Try $period for free';
  }

  @override
  String get becomePro => 'Get Pro';

  @override
  String get subscriptionsLoadFailed =>
      'Subscriptions couldn\'t be loaded. Check your connection.';

  @override
  String legalAnnual(String price) {
    return 'CamTrip Pro annual subscription: $price per year.';
  }

  @override
  String legalAnnualTrial(String period, String price) {
    return 'CamTrip Pro annual subscription: $period free, then $price per year.';
  }

  @override
  String legalMonthly(String price) {
    return 'CamTrip Pro monthly subscription: $price per month.';
  }

  @override
  String legalMonthlyTrial(String period, String price) {
    return 'CamTrip Pro monthly subscription: $period free, then $price per month.';
  }

  @override
  String get legalBillingApple =>
      'Payment is charged to your Apple ID. The subscription renews automatically unless you cancel it at least 24 hours before the end of the period. You can cancel and manage it in your App Store account settings.';

  @override
  String get legalBillingGoogle =>
      'Payment is charged to your Google account. The subscription renews automatically unless you cancel it at least 24 hours before the end of the period. You can cancel and manage it in your Google Play account settings.';

  @override
  String get restorePurchases => 'Restore purchases';

  @override
  String get terms => 'Terms';

  @override
  String get privacy => 'Privacy';

  @override
  String get groupProTitle =>
      'One Pro in the group = Pro for everyone in that group';

  @override
  String get groupProBody =>
      'If one person has Pro, the whole group gets all camera styles, unlimited members, photos that are kept, original quality and recaps without a watermark.';

  @override
  String get groupCreated => 'Group created ✓';

  @override
  String get inviteFriends => 'Invite your friends';

  @override
  String get codeCopied => 'Code copied';

  @override
  String get shareLink => 'Share link';

  @override
  String inviteSubject(String groupName) {
    return 'Join $groupName on CamTrip';
  }

  @override
  String inviteMembersUnlimited(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count members',
      one: '1 member',
    );
    return '$_temp0 · unlimited (Pro)';
  }

  @override
  String inviteMembersLimit(int count, int limit) {
    return '$count of $limit members · Pro: unlimited';
  }

  @override
  String get toCamera => 'Go to the camera';

  @override
  String get done => 'Done';

  @override
  String get joinEnterCode => 'Enter the 6-character code';

  @override
  String get joinGroupTitle => 'Join a group';

  @override
  String get joinGroupSubtitle =>
      'Enter your friends\' code, or scan their QR code.';

  @override
  String get typeCode => 'Type code';

  @override
  String get scanQr => 'Scan QR';

  @override
  String get join => 'Join';

  @override
  String get groupNameRequired => 'Give your group a name';

  @override
  String get newGroup => 'New group';

  @override
  String get groupType => 'Group type';

  @override
  String get groupTypeVacation => 'Holiday';

  @override
  String get groupTypeVacationDescription =>
      'With a start and end date, then archived';

  @override
  String get groupTypeEvent => 'Event';

  @override
  String get groupTypeEventDescription => 'One day or evening, e.g. a party';

  @override
  String get groupTypePermanent => 'Always open';

  @override
  String get groupTypePermanentDescription =>
      'For your regular group of friends';

  @override
  String get date => 'Date';

  @override
  String get departure => 'Departure';

  @override
  String get returnDate => 'Return';

  @override
  String get defaultCameraStyle => 'Default camera style';

  @override
  String freeLimitPermanent(int max) {
    return 'Free: up to $max members. Unlimited with Pro.';
  }

  @override
  String freeLimitDated(int max, int days) {
    return 'Free: up to $max members, photos are kept until $days days after the end date. Unlimited and forever with Pro.';
  }

  @override
  String get createGroup => 'Create group';

  @override
  String get group => 'Group';

  @override
  String groupCode(String code) {
    return 'code $code';
  }

  @override
  String get manage => 'Manage';

  @override
  String get rename => 'Rename';

  @override
  String get changeDates => 'Change dates';

  @override
  String get finishTrip => 'Finish trip';

  @override
  String get finishTripSubtitle => 'Sets the end date to today';

  @override
  String get reopenGroup => 'Reopen group';

  @override
  String get closeGroup => 'Close group';

  @override
  String get reopenGroupSubtitle => 'Members can add photos again';

  @override
  String get closeGroupSubtitle =>
      'No one can add photos anymore; everything can still be viewed';

  @override
  String get members => 'Members';

  @override
  String memberYou(String name) {
    return '$name (you)';
  }

  @override
  String get blockedTag => 'blocked';

  @override
  String get adminTag => 'admin';

  @override
  String removeMemberTitle(String name) {
    return 'Remove $name?';
  }

  @override
  String get removeMemberMessage => 'Their photos stay in the group.';

  @override
  String get remove => 'Delete';

  @override
  String get removeMember => 'Remove';

  @override
  String blockTitle(String name) {
    return 'Block $name?';
  }

  @override
  String blockMessage(String name) {
    return 'You\'ll no longer see photos and videos from $name or get notifications about them. You can undo this in Settings.';
  }

  @override
  String get block => 'Block';

  @override
  String get makeMember => 'Make regular member';

  @override
  String get makeAdmin => 'Make admin';

  @override
  String get removeFromGroup => 'Remove from group';

  @override
  String get unblock => 'Unblock';

  @override
  String get inviteFriendsButton => 'Invite friends';

  @override
  String get you => 'You';

  @override
  String get unarchive => 'Restore from archive';

  @override
  String get archive => 'Archive';

  @override
  String get unarchiveSubtitle => 'The group is back with your albums';

  @override
  String archiveSubtitle(String section) {
    return 'Only for you: the group moves to \"$section\" at the bottom of your albums';
  }

  @override
  String get archivedSection => 'Archived';

  @override
  String get hiddenPhotos => 'Hidden photos';

  @override
  String get hiddenPhotosSubtitle => 'Photos you\'ve hidden for yourself';

  @override
  String get leaveGroup => 'Leave group';

  @override
  String get leaveGroupSubtitle =>
      'Your photos stay in the group for the others';

  @override
  String get deleteGroup => 'Delete group';

  @override
  String get deleteGroupSubtitle => 'All photos are deleted for everyone';

  @override
  String groupArchived(String groupName) {
    return '\"$groupName\" archived';
  }

  @override
  String groupUnarchived(String groupName) {
    return '\"$groupName\" is back with your albums';
  }

  @override
  String get undo => 'Undo';

  @override
  String get groupNameTitle => 'Group name';

  @override
  String get finishTripTitle => 'Finish trip?';

  @override
  String get finishTripMessage =>
      'The end date becomes today. You can still add photos; the recap is ready.';

  @override
  String get finishTripConfirm => 'Finish';

  @override
  String get tripFinished => 'Trip finished';

  @override
  String leaveGroupTitle(String groupName) {
    return 'Leave \"$groupName\"?';
  }

  @override
  String get leaveGroupMessage =>
      'Your photos stay in the group for the others. You can join again later with the code.';

  @override
  String get leave => 'Leave';

  @override
  String groupDeleted(String groupName) {
    return '\"$groupName\" has been deleted';
  }

  @override
  String get youAreAdmin => 'you\'re an admin';

  @override
  String get open => 'Open';

  @override
  String get archiveMenuSubtitle => 'Only for you, the others won\'t notice';

  @override
  String get deleteGroupMenuSubtitle => 'For everyone, with all photos';

  @override
  String get deleteGroupTitle => 'Delete group?';

  @override
  String deleteGroupMessage(int count, String groupName, int memberCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count photos and videos',
      one: '1 photo or video',
    );
    String _temp1 = intl.Intl.pluralLogic(
      memberCount,
      locale: localeName,
      other: '$memberCount members',
      one: '1 member',
    );
    return 'All $_temp0 in \"$groupName\" will disappear for all $_temp1. This can\'t be undone.';
  }

  @override
  String get deleteGroupOwnRoll => 'Your own camera roll stays unchanged.';

  @override
  String get deleteGroupTypeName => 'Type the group name to confirm:';

  @override
  String get deleteForEveryone => 'Delete for everyone';

  @override
  String get save => 'Save';

  @override
  String get yourAlbums => 'Your albums';

  @override
  String get uploadQueue => 'Upload queue';

  @override
  String get noConnection => 'No connection';

  @override
  String get albumsOfflineMessage =>
      'Your albums will load once you\'re back online. The camera still works.';

  @override
  String get retry => 'Try again';

  @override
  String get noAlbumsTitle => 'No albums yet';

  @override
  String get noAlbumsMessage =>
      'Create a group for your next trip, or join a friend\'s with their code.';

  @override
  String get haveCode => 'I have a code';

  @override
  String get joinWithCode => 'Join with a code or QR code';

  @override
  String get camera => 'Camera';

  @override
  String get restore => 'Restore';

  @override
  String get more => 'More';

  @override
  String get newAlbum => 'New';

  @override
  String get closedTag => 'closed';

  @override
  String get activeTag => 'active';

  @override
  String get uploadFailed => 'Upload failed';

  @override
  String get queueNoSignal => 'No signal.';

  @override
  String get queueNoSignalMessage =>
      'Your photos are already in your album and will be shared as soon as you\'re back online.';

  @override
  String get queueWaitingForWifi => 'Waiting for Wi-Fi.';

  @override
  String queueWifiOnlyOn(String setting) {
    return 'You have \"$setting\" turned on.';
  }

  @override
  String get queueVideosWifiOnly => 'Videos only go over Wi-Fi.';

  @override
  String get queueAllShared => 'Everything has been shared ✓';

  @override
  String queuePending(String items) {
    return '$items still to share';
  }

  @override
  String queuePendingBoth(String photos, String videos) {
    return '$photos and $videos still to share';
  }

  @override
  String get retryUpload => 'Try again';

  @override
  String get removeFromQueue => 'Remove from queue';

  @override
  String get queueStatusWifi => 'Wi-Fi';

  @override
  String get queueStatusWaiting => 'waiting';

  @override
  String get videosWifiOnlyTitle => 'Videos over Wi-Fi only';

  @override
  String get videosWifiOnlySubtitle => 'Saves your mobile data';

  @override
  String get retryNow => 'Try again now';

  @override
  String get yourName => 'Your name';

  @override
  String get settings => 'Settings';

  @override
  String get tapToChangeName => 'Tap to change your name';

  @override
  String get getCamTripPro => 'Get CamTrip Pro';

  @override
  String get photos => 'Photos';

  @override
  String get saveOwnPhotos => 'Save my own photos to an album per group';

  @override
  String get autoSaveOthers => 'Automatically save others\' photos';

  @override
  String get wifiOnlyTitle => 'Upload over Wi-Fi only';

  @override
  String get dateStamp => 'Date stamp';

  @override
  String get notifications => 'Notifications';

  @override
  String get notifyNewPhotos => 'New photos (bundled)';

  @override
  String get notifyRecapReady => 'Recap ready';

  @override
  String get camTripTeam => 'CamTrip team';

  @override
  String get adminEntrySubtitle => 'Users, giving Pro, reports and stats';

  @override
  String get account => 'Account';

  @override
  String get manageSubscription => 'Manage subscription';

  @override
  String get blockedPeople => 'Blocked people';

  @override
  String get nobody => 'Nobody';

  @override
  String peopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count people',
      one: '1 person',
    );
    return '$_temp0';
  }

  @override
  String get privacyPolicy => 'Privacy policy';

  @override
  String get contact => 'Contact';

  @override
  String get signOut => 'Sign out';

  @override
  String get deleteAccount => 'Delete account';

  @override
  String get deleteAccountSubtitle =>
      'Deletes your account and all your photos';

  @override
  String get deleteAccountTitle => 'Delete account?';

  @override
  String get deleteAccountMessage =>
      'Your account and all your photos and videos will be deleted, including from the groups. Cancel any active subscription in the App Store or Google Play.';

  @override
  String get blockedTitle => 'Blocked';

  @override
  String get blockedSubtitle => 'You don\'t see photos from these people.';

  @override
  String get blockedNone => 'You haven\'t blocked anyone.';

  @override
  String get unblockShort => 'Unblock';

  @override
  String get groupGone =>
      'This group no longer exists, or you\'re no longer a member.';

  @override
  String photosSavedToAlbum(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count photos saved to \"$album\"',
      one: '1 photo saved to \"$album\"',
    );
    return '$_temp0';
  }

  @override
  String photosDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count photos deleted',
      one: '1 photo deleted',
    );
    return '$_temp0';
  }

  @override
  String photosDeletedSkipped(int count, int skipped) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count photos deleted',
      one: '1 photo deleted',
    );
    return '$_temp0, $skipped skipped';
  }

  @override
  String photosHiddenForYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count photos hidden for you',
      one: '1 photo hidden for you',
    );
    return '$_temp0';
  }

  @override
  String get addedToFavorites => 'Added to favourites';

  @override
  String get removedFromFavorites => 'Removed from favourites';

  @override
  String get photoAccessSettings =>
      'Give CamTrip access to your photos in Settings';

  @override
  String photosBeingAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count photos are being added',
      one: '1 photo is being added',
    );
    return '$_temp0';
  }

  @override
  String photosUnreadable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count photos couldn\'t be read',
      one: '1 photo couldn\'t be read',
    );
    return '$_temp0';
  }

  @override
  String get groupNotLoaded => 'Group not loaded';

  @override
  String get noFavoritesTitle => 'No favourites yet';

  @override
  String get noPhotosTitle => 'No photos yet';

  @override
  String get noFavoritesMessage => 'Tap the star on a photo to put it here.';

  @override
  String get noPhotosMessage =>
      'Take the first photo. Everyone in the group sees it right away.';

  @override
  String get openCamera => 'Open the camera';

  @override
  String savingProgress(int done, int total) {
    return 'Saving... $done/$total';
  }

  @override
  String get sharePreparing => 'Preparing...';

  @override
  String sharingProgress(int done, int total) {
    return 'Preparing... $done/$total';
  }

  @override
  String get choosePhotos => 'Choose photos';

  @override
  String selectedCount(int count) {
    return '$count selected';
  }

  @override
  String get selectNone => 'Select none';

  @override
  String get selectAll => 'Select all';

  @override
  String photosWaitingToShare(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count photos waiting to be shared',
      one: '1 photo waiting to be shared',
    );
    return '$_temp0';
  }

  @override
  String get recapReadyTitle => 'Your recap is ready';

  @override
  String get recapReadySubtitle => 'A video with music of your trip';

  @override
  String get watch => 'Watch';

  @override
  String get makeRecapNow => 'Make a recap video now';

  @override
  String freeGroupDeleteNotice(String date) {
    return 'Free group: photos are kept until $date. Save them or get Pro.';
  }

  @override
  String get filterAll => 'All';

  @override
  String get filterFavorites => 'Favourites';

  @override
  String get filterPerPerson => 'By person';

  @override
  String get filterPerson => 'Person';

  @override
  String get select => 'Select';

  @override
  String get hiddenFilter => 'Hidden';

  @override
  String get photosBy => 'Photos by...';

  @override
  String get uploadedTag => 'uploaded';

  @override
  String get saveAll => 'Save all';

  @override
  String get favorite => 'Favourite';

  @override
  String get unfavorite => 'Unfavourite';

  @override
  String get hide => 'Hide';

  @override
  String get delete => 'Delete';

  @override
  String deletePhotosTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Delete $count photos?',
      one: 'Delete photo?',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'They disappear for everyone in the group. This can\'t be undone.',
      one: 'It disappears for everyone in the group. This can\'t be undone.',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosNotAllowed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count photos belong to someone else. They stay; only an admin can delete them.',
      one:
          '1 photo belongs to someone else. It stays; only an admin can delete it.',
    );
    return '$_temp0';
  }

  @override
  String photosBackInGroup(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count photos are back in the group',
      one: '1 photo is back in the group',
    );
    return '$_temp0';
  }

  @override
  String get showAll => 'Show all';

  @override
  String get hiddenPhotosExplainer =>
      'Only you no longer see these photos. For the others in the group they\'re still there.';

  @override
  String get nothingHidden => 'Nothing hidden';

  @override
  String get nothingHiddenMessage => 'Photos you hide will show up here.';

  @override
  String showAgainCount(int count) {
    return 'Show again ($count)';
  }

  @override
  String get someone => 'Someone';

  @override
  String get savedToAlbum => 'Saved to your photo album';

  @override
  String get share => 'Share';

  @override
  String get shareFailed => 'Sharing didn\'t work';

  @override
  String get reportTitle => 'Why are you reporting this photo?';

  @override
  String get reportSubtitle =>
      'We review every report within 24 hours. The photo is hidden for you right away.';

  @override
  String get reportThanks => 'Thanks, we\'ll look into it';

  @override
  String blockMessageAllGroups(String name) {
    return 'You\'ll no longer see photos and videos from $name in any group, or get notifications about them. You can undo this in Settings.';
  }

  @override
  String userBlocked(String name) {
    return '$name has been blocked';
  }

  @override
  String get videoHiddenForYou => 'Video hidden for you';

  @override
  String get photoHiddenForYou => 'Photo hidden for you';

  @override
  String get setAsCover => 'Set as cover';

  @override
  String get coverUpdated => 'Cover photo updated';

  @override
  String get hideForMe => 'Hide for me';

  @override
  String get hideForMeSubtitle => 'The others in the group can still see it';

  @override
  String get reportPhoto => 'Report photo';

  @override
  String blockName(String name) {
    return 'Block $name';
  }

  @override
  String get forEveryoneInGroup => 'For everyone in the group';

  @override
  String get videoDeleted => 'Video deleted';

  @override
  String get photoDeleted => 'Photo deleted';

  @override
  String get photoAccessToSave =>
      'Give CamTrip access to your photos in Settings to save them';

  @override
  String get phoneFull => 'Your phone is full';

  @override
  String get albumSaveFailedShort => 'Saving to your album didn\'t work';

  @override
  String get recapTemplateGoldenHour => 'Golden Hour';

  @override
  String get recapTemplateFast => 'Fast';

  @override
  String get recapTemplateFilmRoll => 'Film roll';

  @override
  String get recapTemplatePolaroid => 'Polaroid';

  @override
  String get trackSummerEvening => 'Summer Evening';

  @override
  String get trackGoldenHour => 'Golden Hour';

  @override
  String get trackRoadtrip => 'Road Trip';

  @override
  String get moodWarm => 'warm';

  @override
  String get moodCheerful => 'upbeat';

  @override
  String friendsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count friends',
      one: '1 friend',
    );
    return '$_temp0';
  }

  @override
  String get madeWithCamTrip => 'Made with CamTrip';

  @override
  String get tagline => 'One roll for the whole group';

  @override
  String get videoUnsupportedDevice =>
      'Making the video didn\'t work on this device';

  @override
  String get groupLoadFailed => 'This group couldn\'t be loaded.';

  @override
  String recapNeedsPhotos(int count) {
    return 'You need at least $count photos for a recap.';
  }

  @override
  String get recapFailed => 'Making the recap didn\'t work. Please try again.';

  @override
  String get recapSaved => 'Recap saved to your photo album';

  @override
  String get recap => 'Recap';

  @override
  String get recapRendering => 'Making recap...';

  @override
  String get videoRendering => 'Making video...';

  @override
  String get template => 'Template';

  @override
  String get musicLicense => 'CamTrip\'s own music · royalty-free';

  @override
  String get change => 'Change';

  @override
  String get noWatermark => 'No watermark ✓';

  @override
  String get removeWatermarkPro => 'Remove the watermark with Pro';

  @override
  String get proSourceSubscription => 'Subscription';

  @override
  String get proSourceGift => 'Gift';

  @override
  String get proSourceAdmin => 'Admin';

  @override
  String get proSourceGroup => 'Via group';

  @override
  String get noPro => 'No Pro';

  @override
  String proStatusNoEnd(String source) {
    return 'Pro ($source), no end date';
  }

  @override
  String proStatusUntil(String source, String date) {
    return 'Pro ($source), until $date';
  }

  @override
  String get lifetime => 'Lifetime';

  @override
  String get pickDate => 'Pick a date';

  @override
  String get noAccess => 'No access';

  @override
  String get adminOnlyTeam => 'Admin is only for the CamTrip team.';

  @override
  String get adminOverview => 'Overview';

  @override
  String get adminUsers => 'Users';

  @override
  String get adminReports => 'Reports';

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
  String get adminNewThisWeek => 'New this week';

  @override
  String get adminGroups => 'Groups';

  @override
  String get adminProSubscription => 'Pro via subscription';

  @override
  String get adminProGift => 'Pro as a gift';

  @override
  String adminWithoutSubscription(int count) {
    return '$count without a subscription';
  }

  @override
  String get adminOpenReports => 'Open reports';

  @override
  String get adminSearchHint => 'Search by name or e-mail';

  @override
  String get nobodyFound => 'Nobody found';

  @override
  String get loadMore => 'Load more';

  @override
  String get noEmail => 'No e-mail';

  @override
  String adminDeletePhotoMessage(String groupName) {
    return 'The photo disappears for everyone in \"$groupName\". All reports on this photo are resolved.';
  }

  @override
  String get adminBanMessage =>
      'This account can no longer sign in or use the app. You can undo this later.';

  @override
  String get adminDismissTitle => 'Dismiss report?';

  @override
  String get adminDismissMessage =>
      'The photo stays. The report is marked as resolved.';

  @override
  String get adminDismiss => 'Dismiss';

  @override
  String get adminAccountBlocked => 'Account blocked';

  @override
  String get adminReportDismissed => 'Report dismissed';

  @override
  String get adminNoReports => 'No open reports';

  @override
  String get adminNoReportsMessage => 'Reported photos show up here.';

  @override
  String get deletedTag => 'Deleted';

  @override
  String adminReportedBy(String name) {
    return 'By $name';
  }

  @override
  String adminPhotoBy(String name) {
    return 'Photo by $name';
  }

  @override
  String reportsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count reports',
      one: '1 report',
    );
    return '$_temp0';
  }

  @override
  String get adminDeletePhoto => 'Delete photo';

  @override
  String get adminBlockCreator => 'Block creator';

  @override
  String get loadFailed => 'Loading didn\'t work';

  @override
  String get adminLifetimeProGiven => 'Lifetime Pro given';

  @override
  String get adminProGiven => 'Pro given';

  @override
  String adminGiveProUntil(String date) {
    return 'Give Pro until $date';
  }

  @override
  String get adminGiveProLifetime => 'Give Pro for life';

  @override
  String adminGiveProFor(String period) {
    return 'Give Pro for $period';
  }

  @override
  String get adminReasonHint => 'Reason, e.g. friend, tester, influencer';

  @override
  String get adminGivePro => 'Give Pro';

  @override
  String get adminRevokeTitle => 'Revoke gift?';

  @override
  String get adminRevokeMessage =>
      'The gifted Pro stops right away. Their own subscription keeps running.';

  @override
  String get adminRevoke => 'Revoke';

  @override
  String get adminGiftRevoked => 'Gift revoked';

  @override
  String get adminUnbanTitle => 'Lift block?';

  @override
  String adminUnbanMessage(String name) {
    return '$name can sign in again.';
  }

  @override
  String get adminUnbanned => 'Block lifted';

  @override
  String get adminBanUserMessage =>
      'This account can no longer sign in or use the app. Photos stay.';

  @override
  String get adminUser => 'User';

  @override
  String get adminNotVerified => 'not verified';

  @override
  String get adminRole => 'Role';

  @override
  String get adminCreated => 'Created';

  @override
  String get unknown => 'Unknown';

  @override
  String get adminSignInWith => 'Signs in with';

  @override
  String get adminEmailMethod => 'E-mail';

  @override
  String get adminPhotosAndVideos => 'Photos and videos';

  @override
  String get adminStatus => 'Status';

  @override
  String get adminActive => 'Active';

  @override
  String adminActiveUntil(String date) {
    return 'Active until $date';
  }

  @override
  String adminGiftFrom(String name) {
    return 'Gift from $name';
  }

  @override
  String adminExpiredOn(String date) {
    return 'Expired on $date';
  }

  @override
  String get adminExpired => 'Expired';

  @override
  String adminUntil(String date) {
    return 'Until $date';
  }

  @override
  String get adminGiveProTitle => 'Give Pro';

  @override
  String get adminGiveProNote =>
      'Also works for this person\'s groups: one Pro in the group = Pro for everyone in that group.';

  @override
  String get adminRevokeGift => 'Revoke gift';

  @override
  String get adminModeration => 'Moderation';

  @override
  String get adminCannotBanSelf => 'You can\'t block yourself.';

  @override
  String get adminCannotBanAdmin => 'An admin can\'t be blocked.';

  @override
  String get adminUnban => 'Lift block';

  @override
  String get adminBanAccount => 'Block account';

  @override
  String get googleSignInUnavailable =>
      'Signing in with Google isn\'t available yet';

  @override
  String get cameraPickerTitle => 'Choose your camera';

  @override
  String get cameraPickerSubtitle =>
      'Every camera gives your photos its own look';

  @override
  String get cameraPickerChange => 'Switch camera';

  @override
  String get cameraPickerUnlock => 'Unlock with Pro';

  @override
  String get cameraPickerSelected => 'Selected';

  @override
  String get cameraPickerStyleSummer => 'Summer';

  @override
  String get cameraPickerStyleSummerDescription =>
      'Warm, faded colours of a 90s snapshot';

  @override
  String get cameraPickerStyleNight => 'Night 800';

  @override
  String get cameraPickerStyleNightDescription =>
      'Cinema film: teal shadows, warm light, lots of grain';

  @override
  String get cameraPickerStyleSepia => 'Sepia';

  @override
  String get cameraPickerStyleSepiaDescription =>
      'An old brown print from the shoebox';

  @override
  String get cameraPickerStyleLomo => 'Lomo';

  @override
  String get cameraPickerStyleLomoDescription =>
      'Bold colours, dark corners and a wild colour cast';

  @override
  String get cameraPickerStyleMint => 'Mint';

  @override
  String get cameraPickerStyleMintDescription =>
      'Soft and fresh with a green tint';

  @override
  String get cameraPickerStylePastel => 'Pink';

  @override
  String get cameraPickerStylePastelDescription =>
      'Pastel colours with a pink glow and a white border';

  @override
  String get cameraPickerStyleSuper8 => 'Super 8';

  @override
  String get cameraPickerStyleSuper8Description =>
      'Grainy and soft, like an old home movie';

  @override
  String get paywallBenefitGroup => 'One Pro = Pro for the whole group';

  @override
  String get paywallBenefitUnlimited =>
      'Unlimited members, photos kept forever';

  @override
  String get paywallBenefitQuality => 'No watermark, original quality';

  @override
  String paywallFreeTrial(String period) {
    return '$period free';
  }

  @override
  String paywallPriceYear(String price) {
    return '$price per year.';
  }

  @override
  String paywallPriceYearTrial(String period, String price) {
    return '$period free, then $price per year.';
  }

  @override
  String paywallPriceMonth(String price) {
    return '$price per month.';
  }

  @override
  String paywallPriceMonthTrial(String period, String price) {
    return '$period free, then $price per month.';
  }

  @override
  String paywallAutoRenew(String store) {
    return 'Renews automatically. Cancel at least 24 hours before renewal in $store.';
  }

  @override
  String get paywallDetailsTitle => 'Everything in Pro';

  @override
  String get paywallBenefitStyles => 'All camera styles';

  @override
  String get allPhotosTitle => 'All photos';

  @override
  String get homeTabAlbums => 'Albums';

  @override
  String get allPhotosEmptyTitle => 'No photos yet';

  @override
  String get allPhotosEmptyMessage =>
      'Open the camera and take your first photo.';

  @override
  String get allPhotosLoadFailed => 'Your photos couldn\'t be loaded';

  @override
  String get cameraSettingsTitle => 'Camera settings';

  @override
  String get cameraSettingsMore => 'More settings';

  @override
  String get cameraSettingsGrid => 'Grid';

  @override
  String get cameraSettingsHaptics => 'Vibrate on capture';

  @override
  String get cameraSettingsDateStamp => 'Date stamp bottom right';

  @override
  String get cameraSettingsSound => 'Shutter sound';

  @override
  String get cameraSettingsSoundHint => 'Silent when your phone is on silent';

  @override
  String get cameraSettingsTimer => 'Self-timer';

  @override
  String get cameraSettingsTimerOff => 'Off';

  @override
  String cameraSettingsTimerSeconds(int seconds) {
    return '$seconds s';
  }

  @override
  String get cameraSettingsTimerCancelHint => 'Tap the shutter to cancel';

  @override
  String get cameraSettingsMirror => 'Mirror selfies';

  @override
  String get cameraSettingsSaveToRoll => 'Save to camera roll';

  @override
  String get cameraSettingsQuality => 'Quality';

  @override
  String get cameraSettingsQualityStandard => 'Standard';

  @override
  String get cameraSettingsQualityHigh => 'High';

  @override
  String get cameraLowLightHint => 'Low light - turn on the flash';

  @override
  String get cameraFlashUnavailable => 'This camera has no flash';

  @override
  String get cameraFlashScreen => 'Screen flash';

  @override
  String get cameraFlashCycleHint => 'Tap to switch between off, on and auto';

  @override
  String get cameraFlip => 'Switch between front and back camera';

  @override
  String get cameraFlipHint => 'Double-tap the viewfinder to flip the camera';

  @override
  String cameraPickerPaywallStyles(int count, String styles) {
    return 'All $count cameras, including $styles';
  }

  @override
  String get styleFlash => 'Flash 400';

  @override
  String get styleFlashDescription =>
      'Direct flash on warm film: amber glow, grain, rich reds';

  @override
  String cameraTimerButton(String state) {
    return 'Self-timer: $state';
  }

  @override
  String get cameraTimerCycleHint => 'Tap to switch between off, 3 s and 10 s';

  @override
  String get cameraLastShotOpen => 'Latest photo, opens the album';

  @override
  String get cameraLastShotEmpty => 'No photos yet, opens the album';

  @override
  String get deleteOnlyOwnOrAdmin =>
      'Only the person who took it or an admin can delete this';

  @override
  String get videoPlay => 'Play';

  @override
  String get videoPause => 'Pause';

  @override
  String get language => 'Language';

  @override
  String get languageSystem => 'System language';

  @override
  String languageSystemCurrent(String language) {
    return 'System ($language)';
  }

  @override
  String get languageSearchHint => 'Search languages';

  @override
  String get languageNoResults => 'No language found';

  @override
  String get personalRollTitle => 'My roll';

  @override
  String get personalRollSubtitle => 'Just for you';

  @override
  String get personalRollPickerSubtitle => 'Loose photos, just for you';

  @override
  String get personalRollMove => 'To album';

  @override
  String get personalRollMoveTitle => 'Move to album';

  @override
  String get personalRollMoveNoAlbums =>
      'Create an album or join one with a code first.';

  @override
  String personalRollMoved(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count photos moved to $album',
      one: '1 photo moved to $album',
    );
    return '$_temp0';
  }

  @override
  String get personalRollPrivateNote =>
      'Only you can see these photos. Move them to an album to share them.';

  @override
  String get paywallTripPassSub => 'Only this trip, for the whole group';

  @override
  String get paywallOneTime => 'one-time';

  @override
  String get paywallBestValue => 'Best value';

  @override
  String paywallRollFullTitle(int used, int limit) {
    return 'Your roll is full - $used/$limit photos';
  }

  @override
  String get paywallRollFullSub => 'Keep shooting with a Trip Pass or Pro.';

  @override
  String get paywallCameraTitle => 'This camera is part of Pro';

  @override
  String paywallCameraSub(int count) {
    return 'Unlock all $count cameras.';
  }

  @override
  String get paywallWatermarkTitle => 'Recap without watermark';

  @override
  String get paywallWatermarkSub =>
      'Share your recap without the CamTrip logo.';

  @override
  String get paywallDeletionTitle => 'Keep your trip';

  @override
  String paywallDeletionSub(String date) {
    return 'Free trips are deleted on $date. A Trip Pass or Pro keeps it forever.';
  }

  @override
  String paywallTripPassTerms(String price) {
    return 'One-time purchase of $price for this trip. Not a subscription.';
  }

  @override
  String get buyTripPass => 'Get Trip Pass';

  @override
  String get tripPassActive =>
      'Trip Pass active: this trip is Pro for everyone';

  @override
  String get tripPassActivating =>
      'Payment received. Your Trip Pass will be active in a moment.';

  @override
  String proViaTripPass(String name) {
    return 'Trip Pass from $name';
  }

  @override
  String rollCounterSemantics(int used, int limit) {
    return '$used of $limit shots on your roll';
  }

  @override
  String rollHeldTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count photos don\'t fit on your roll',
      one: '1 photo doesn\'t fit on your roll',
    );
    return '$_temp0';
  }

  @override
  String get rollHeldBody => 'Keep them with Pro or a Trip Pass';

  @override
  String deletionBannerTitle(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Keep your trip - $days days left',
      one: 'Keep your trip - 1 day left',
    );
    return '$_temp0';
  }

  @override
  String get deletionBannerBody =>
      'Free trips are deleted 30 days after they end. A Trip Pass or Pro keeps it forever.';

  @override
  String apiRollFull(int limit) {
    return 'Your roll is full ($limit shots). Get a Trip Pass or Pro to keep shooting.';
  }

  @override
  String get apiTripPassFailed =>
      'The Trip Pass could not be activated. Contact support@camtrip.app.';

  @override
  String get apiTripPassExists => 'This trip already has a Trip Pass.';

  @override
  String get tripPassUnavailable =>
      'The Trip Pass is not available right now. Try again later.';

  @override
  String get tripMapTitle => 'Trip map';

  @override
  String get tripMapOpen => 'Trip map and stats';

  @override
  String get tripMapLoadFailed => 'Couldn\'t load the trip map';

  @override
  String get tripMapStatDays => 'Days';

  @override
  String get tripMapStatPhotos => 'Photos';

  @override
  String get tripMapStatVideos => 'Videos';

  @override
  String get tripMapStatMembers => 'Members';

  @override
  String get tripMapStatDistance => 'km travelled';

  @override
  String get tripMapStatCountries => 'Countries';

  @override
  String get tripMapStatPlaces => 'Places';

  @override
  String tripMapBusiestDay(String day, int count) {
    return 'Most photos on $day ($count)';
  }

  @override
  String tripMapTopPhotographer(String name, int count) {
    return 'Top photographer: $name ($count)';
  }

  @override
  String get tripMapOffTitle => 'The trip map is off';

  @override
  String get tripMapOffMessage =>
      'A group admin can turn on the trip map in the group settings. You always see the stats.';

  @override
  String get tripMapOffMessageAdmin =>
      'Turn on the trip map to see where your photos were taken. Everyone decides for themselves whether to join in.';

  @override
  String get tripMapEnable => 'Turn on trip map';

  @override
  String get tripMapEmptyTitle => 'No places on the map yet';

  @override
  String get tripMapEmptyMessage =>
      'New photos from members who share their location appear here, rounded to about 100 m.';

  @override
  String get tripMapConsentTitle => 'Trip map';

  @override
  String get tripMapConsentQuestion =>
      'Share where your photos were taken on this group\'s trip map?';

  @override
  String get tripMapConsentDetail =>
      'Only group members see it, rounded to about 100 m. The location is never put in the photo itself, and you can turn this off at any time in the group settings.';

  @override
  String get tripMapConsentYes => 'Yes, share';

  @override
  String get tripMapConsentNo => 'No';

  @override
  String get tripMapLocationDenied =>
      'No access to your location. You can allow it in your phone\'s settings.';

  @override
  String get tripMapSettingSubtitle =>
      'Show on a map where photos were taken. Members decide for themselves whether to share.';

  @override
  String get tripMapDisableTitle => 'Turn off the trip map?';

  @override
  String get tripMapDisableMessage =>
      'All locations in this group are deleted. If you turn the map on again later, everyone is asked again.';

  @override
  String get tripMapDisable => 'Turn off';

  @override
  String get tripMapMySharing => 'Share my location';

  @override
  String get tripMapMySharingOn =>
      'Your new photos appear on the trip map (rounded to about 100 m).';

  @override
  String get tripMapMySharingOff =>
      'Off. Your photos don\'t appear on the map.';

  @override
  String get tripMapStopSharingTitle => 'Stop sharing your location?';

  @override
  String get tripMapStopSharingMessage =>
      'The locations of all your photos in this group are deleted.';

  @override
  String get tripMapStopSharing => 'Stop sharing';
}
