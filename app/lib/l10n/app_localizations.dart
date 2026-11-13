import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_cs.dart';
import 'app_localizations_da.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fi.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_nb.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('cs'),
    Locale('da'),
    Locale('de'),
    Locale('es'),
    Locale('fi'),
    Locale('fr'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('nb'),
    Locale('nl'),
    Locale('pl'),
    Locale('pt'),
    Locale('pt', 'BR'),
    Locale('sv'),
    Locale('tr'),
    Locale('zh'),
  ];

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @inviteMessageIntro.
  ///
  /// In en, this message translates to:
  /// **'Want to join \"{groupName}\" on CamTrip? Then we see each other\'s photos right away.'**
  String inviteMessageIntro(String groupName);

  /// No description provided for @inviteMessageCode.
  ///
  /// In en, this message translates to:
  /// **'Or enter the code: {code}'**
  String inviteMessageCode(String code);

  /// No description provided for @memberFallbackName.
  ///
  /// In en, this message translates to:
  /// **'Friend'**
  String get memberFallbackName;

  /// No description provided for @reportReasonInappropriate.
  ///
  /// In en, this message translates to:
  /// **'Inappropriate or offensive'**
  String get reportReasonInappropriate;

  /// No description provided for @reportReasonSpam.
  ///
  /// In en, this message translates to:
  /// **'Spam'**
  String get reportReasonSpam;

  /// No description provided for @reportReasonOther.
  ///
  /// In en, this message translates to:
  /// **'Something else'**
  String get reportReasonOther;

  /// No description provided for @dateRangeSameMonth.
  ///
  /// In en, this message translates to:
  /// **'{month} {startDay}-{endDay}'**
  String dateRangeSameMonth(
    String startDay,
    String endDay,
    String month,
    String monthNum,
    String endDate,
  );

  /// No description provided for @errorOffline.
  ///
  /// In en, this message translates to:
  /// **'No connection. Try again in a moment.'**
  String get errorOffline;

  /// No description provided for @errorSomethingWrongStatus.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong ({status})'**
  String errorSomethingWrongStatus(int status);

  /// No description provided for @errorSomethingWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get errorSomethingWrong;

  /// No description provided for @apiInvalidCredentials.
  ///
  /// In en, this message translates to:
  /// **'E-mail address or password is incorrect'**
  String get apiInvalidCredentials;

  /// No description provided for @apiInvalidCode.
  ///
  /// In en, this message translates to:
  /// **'This code is incorrect or has expired. Request a new code.'**
  String get apiInvalidCode;

  /// No description provided for @apiEmailTaken.
  ///
  /// In en, this message translates to:
  /// **'An account with this e-mail address already exists. Sign in, or choose \"Forgot password?\".'**
  String get apiEmailTaken;

  /// No description provided for @apiEmailTakenProvider.
  ///
  /// In en, this message translates to:
  /// **'An account with this e-mail address already exists. Sign in with {provider}.'**
  String apiEmailTakenProvider(String provider);

  /// No description provided for @apiWeakPassword.
  ///
  /// In en, this message translates to:
  /// **'Choose a password of at least {min} characters'**
  String apiWeakPassword(int min);

  /// No description provided for @apiNameTooLong.
  ///
  /// In en, this message translates to:
  /// **'Your name can be at most {max} characters'**
  String apiNameTooLong(int max);

  /// No description provided for @apiRateLimited.
  ///
  /// In en, this message translates to:
  /// **'Too many attempts. Try again in 15 minutes.'**
  String get apiRateLimited;

  /// No description provided for @apiAccountBanned.
  ///
  /// In en, this message translates to:
  /// **'Your account has been blocked. Contact {email} if you think this is a mistake.'**
  String apiAccountBanned(String email);

  /// No description provided for @apiProRequired.
  ///
  /// In en, this message translates to:
  /// **'This camera style is part of CamTrip Pro'**
  String get apiProRequired;

  /// No description provided for @apiGroupClosed.
  ///
  /// In en, this message translates to:
  /// **'This group has been closed'**
  String get apiGroupClosed;

  /// No description provided for @apiGroupCodeNotFound.
  ///
  /// In en, this message translates to:
  /// **'No group found with this code'**
  String get apiGroupCodeNotFound;

  /// No description provided for @apiGroupFull.
  ///
  /// In en, this message translates to:
  /// **'This group is full (max. {max} members). If one member has CamTrip Pro, anyone can join.'**
  String apiGroupFull(int max);

  /// No description provided for @apiLastMember.
  ///
  /// In en, this message translates to:
  /// **'You are the last member. Delete the group instead.'**
  String get apiLastMember;

  /// No description provided for @apiAdminRequired.
  ///
  /// In en, this message translates to:
  /// **'Only for CamTrip administrators'**
  String get apiAdminRequired;

  /// No description provided for @apiUploadIncomplete.
  ///
  /// In en, this message translates to:
  /// **'The upload is not complete'**
  String get apiUploadIncomplete;

  /// No description provided for @apiInvalidInput.
  ///
  /// In en, this message translates to:
  /// **'Invalid input'**
  String get apiInvalidInput;

  /// No description provided for @apiNotSignedIn.
  ///
  /// In en, this message translates to:
  /// **'Not signed in'**
  String get apiNotSignedIn;

  /// No description provided for @apiAccountGone.
  ///
  /// In en, this message translates to:
  /// **'This account no longer exists'**
  String get apiAccountGone;

  /// No description provided for @apiPhotoNotFound.
  ///
  /// In en, this message translates to:
  /// **'Photo not found'**
  String get apiPhotoNotFound;

  /// No description provided for @apiGroupNotFound.
  ///
  /// In en, this message translates to:
  /// **'Group not found'**
  String get apiGroupNotFound;

  /// No description provided for @apiMemberNotFound.
  ///
  /// In en, this message translates to:
  /// **'Member not found'**
  String get apiMemberNotFound;

  /// No description provided for @apiPersonNotFound.
  ///
  /// In en, this message translates to:
  /// **'Person not found'**
  String get apiPersonNotFound;

  /// No description provided for @apiUserNotFound.
  ///
  /// In en, this message translates to:
  /// **'User not found'**
  String get apiUserNotFound;

  /// No description provided for @apiAdminOnly.
  ///
  /// In en, this message translates to:
  /// **'Only an admin can do this'**
  String get apiAdminOnly;

  /// No description provided for @apiCannotBlockSelf.
  ///
  /// In en, this message translates to:
  /// **'You can\'t block yourself'**
  String get apiCannotBlockSelf;

  /// No description provided for @apiCannotReportOwn.
  ///
  /// In en, this message translates to:
  /// **'You can\'t report your own photo'**
  String get apiCannotReportOwn;

  /// No description provided for @apiDeleteOwnOnly.
  ///
  /// In en, this message translates to:
  /// **'You can only delete your own photos'**
  String get apiDeleteOwnOnly;

  /// No description provided for @apiOwnerCannotBeRemoved.
  ///
  /// In en, this message translates to:
  /// **'The group\'s creator can\'t be removed'**
  String get apiOwnerCannotBeRemoved;

  /// No description provided for @apiOwnerStaysAdmin.
  ///
  /// In en, this message translates to:
  /// **'The creator always stays an admin'**
  String get apiOwnerStaysAdmin;

  /// No description provided for @apiNeedsOneAdmin.
  ///
  /// In en, this message translates to:
  /// **'A group needs at least one admin'**
  String get apiNeedsOneAdmin;

  /// No description provided for @apiEndBeforeStart.
  ///
  /// In en, this message translates to:
  /// **'The end date is before the start date'**
  String get apiEndBeforeStart;

  /// No description provided for @apiPermanentNoEndDate.
  ///
  /// In en, this message translates to:
  /// **'A group that\'s always open has no end date'**
  String get apiPermanentNoEndDate;

  /// No description provided for @apiCannotBanAdmin.
  ///
  /// In en, this message translates to:
  /// **'An administrator can\'t be blocked'**
  String get apiCannotBanAdmin;

  /// No description provided for @apiReportNotFound.
  ///
  /// In en, this message translates to:
  /// **'Report not found'**
  String get apiReportNotFound;

  /// No description provided for @apiPhotoOwnerUnknown.
  ///
  /// In en, this message translates to:
  /// **'The person who took this photo is no longer known'**
  String get apiPhotoOwnerUnknown;

  /// No description provided for @validationNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get validationNameRequired;

  /// No description provided for @validationMaxChars.
  ///
  /// In en, this message translates to:
  /// **'At most {max} characters'**
  String validationMaxChars(int max);

  /// No description provided for @validationEmailRequired.
  ///
  /// In en, this message translates to:
  /// **'Enter your e-mail address'**
  String get validationEmailRequired;

  /// No description provided for @validationEmailInvalid.
  ///
  /// In en, this message translates to:
  /// **'This e-mail address isn\'t valid'**
  String get validationEmailInvalid;

  /// No description provided for @validationPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'Choose a password'**
  String get validationPasswordRequired;

  /// No description provided for @validationMinChars.
  ///
  /// In en, this message translates to:
  /// **'At least {min} characters'**
  String validationMinChars(int min);

  /// No description provided for @validationPasswordTooLong.
  ///
  /// In en, this message translates to:
  /// **'This password is too long'**
  String get validationPasswordTooLong;

  /// No description provided for @validationPasswordEmpty.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get validationPasswordEmpty;

  /// No description provided for @validationCodeRequired.
  ///
  /// In en, this message translates to:
  /// **'Enter the code from the e-mail'**
  String get validationCodeRequired;

  /// No description provided for @validationCodeDigits.
  ///
  /// In en, this message translates to:
  /// **'The code has 6 digits'**
  String get validationCodeDigits;

  /// No description provided for @onboarding1Title.
  ///
  /// In en, this message translates to:
  /// **'One roll\nfor the whole group.'**
  String get onboarding1Title;

  /// No description provided for @onboarding1Body.
  ///
  /// In en, this message translates to:
  /// **'Shoot with a retro camera. Everyone sees your photos instantly, and they\'re right in your own album too.'**
  String get onboarding1Body;

  /// No description provided for @onboarding2Title.
  ///
  /// In en, this message translates to:
  /// **'No more\nsending photos around.'**
  String get onboarding2Title;

  /// No description provided for @onboarding2Body.
  ///
  /// In en, this message translates to:
  /// **'Create a group, share the code, done. Never again \"can you send me those photos?\"'**
  String get onboarding2Body;

  /// No description provided for @onboarding3Title.
  ///
  /// In en, this message translates to:
  /// **'A recap video\nafterwards.'**
  String get onboarding3Title;

  /// No description provided for @onboarding3Body.
  ///
  /// In en, this message translates to:
  /// **'CamTrip makes a video with music of your best moments together.'**
  String get onboarding3Body;

  /// No description provided for @onboardingInvited.
  ///
  /// In en, this message translates to:
  /// **'You\'ve been invited! Sign in to join.'**
  String get onboardingInvited;

  /// No description provided for @signInAppleFailed.
  ///
  /// In en, this message translates to:
  /// **'Signing in with Apple didn\'t work'**
  String get signInAppleFailed;

  /// No description provided for @signInGoogleFailed.
  ///
  /// In en, this message translates to:
  /// **'Signing in with Google didn\'t work'**
  String get signInGoogleFailed;

  /// No description provided for @signInFailed.
  ///
  /// In en, this message translates to:
  /// **'Signing in didn\'t work'**
  String get signInFailed;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @legalPrefix.
  ///
  /// In en, this message translates to:
  /// **'By continuing you agree to the '**
  String get legalPrefix;

  /// No description provided for @legalTerms.
  ///
  /// In en, this message translates to:
  /// **'terms'**
  String get legalTerms;

  /// No description provided for @legalAnd.
  ///
  /// In en, this message translates to:
  /// **' and the '**
  String get legalAnd;

  /// No description provided for @legalPrivacy.
  ///
  /// In en, this message translates to:
  /// **'privacy policy'**
  String get legalPrivacy;

  /// No description provided for @legalSuffix.
  ///
  /// In en, this message translates to:
  /// **'.'**
  String get legalSuffix;

  /// No description provided for @continueWithApple.
  ///
  /// In en, this message translates to:
  /// **'Continue with Apple'**
  String get continueWithApple;

  /// No description provided for @continueWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get continueWithGoogle;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get createAccount;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signIn;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get or;

  /// No description provided for @registerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'So your friends can see who took the photos.'**
  String get registerSubtitle;

  /// No description provided for @loginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome back.'**
  String get loginSubtitle;

  /// No description provided for @forgotPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Forgot password'**
  String get forgotPasswordTitle;

  /// No description provided for @forgotPasswordPushSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Still signed in somewhere? We\'ll send a 6-digit code there as a push notification so you can set a new password.'**
  String get forgotPasswordPushSubtitle;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get newPassword;

  /// Shown after "Forgot password?": neutral, never says whether the account exists. CamTrip sends no e-mail.
  ///
  /// In en, this message translates to:
  /// **'If you\'re still signed in somewhere, you\'ll get a push notification there with a code. Can\'t get in? Sign in with Apple or Google using the same e-mail address - your account will be linked.'**
  String get resetPushInfo;

  /// No description provided for @sendCode.
  ///
  /// In en, this message translates to:
  /// **'Send code'**
  String get sendCode;

  /// No description provided for @savePassword.
  ///
  /// In en, this message translates to:
  /// **'Save password'**
  String get savePassword;

  /// No description provided for @errorTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get errorTryAgain;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'E-mail address'**
  String get email;

  /// No description provided for @codeFromPush.
  ///
  /// In en, this message translates to:
  /// **'Code from the notification'**
  String get codeFromPush;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @hidePassword.
  ///
  /// In en, this message translates to:
  /// **'Hide password'**
  String get hidePassword;

  /// No description provided for @showPassword.
  ///
  /// In en, this message translates to:
  /// **'Show password'**
  String get showPassword;

  /// No description provided for @forgotPasswordLink.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgotPasswordLink;

  /// No description provided for @haveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get haveAccount;

  /// No description provided for @newToCamTrip.
  ///
  /// In en, this message translates to:
  /// **'New to CamTrip?'**
  String get newToCamTrip;

  /// No description provided for @rememberedIt.
  ///
  /// In en, this message translates to:
  /// **'Remembered it?'**
  String get rememberedIt;

  /// No description provided for @noCodeReceived.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t get a code?'**
  String get noCodeReceived;

  /// No description provided for @resendCode.
  ///
  /// In en, this message translates to:
  /// **'Send again'**
  String get resendCode;

  /// No description provided for @onboardingDemoRoll.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 photographer, 1 roll} other{{count} photographers, 1 roll}}'**
  String onboardingDemoRoll(int count);

  /// No description provided for @membersCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 member} other{{count} members}}'**
  String membersCount(int count);

  /// No description provided for @photosCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 photo} other{{count} photos}}'**
  String photosCount(int count);

  /// No description provided for @videosCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 video} other{{count} videos}}'**
  String videosCount(int count);

  /// No description provided for @justNow.
  ///
  /// In en, this message translates to:
  /// **'now'**
  String get justNow;

  /// No description provided for @badgeNew.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get badgeNew;

  /// No description provided for @recapTitle.
  ///
  /// In en, this message translates to:
  /// **'Recap {groupName}'**
  String recapTitle(String groupName);

  /// No description provided for @styleFilm.
  ///
  /// In en, this message translates to:
  /// **'Film'**
  String get styleFilm;

  /// No description provided for @styleInstant.
  ///
  /// In en, this message translates to:
  /// **'Instant'**
  String get styleInstant;

  /// No description provided for @styleDisposable.
  ///
  /// In en, this message translates to:
  /// **'Disposable'**
  String get styleDisposable;

  /// No description provided for @styleBw.
  ///
  /// In en, this message translates to:
  /// **'B&W'**
  String get styleBw;

  /// No description provided for @styleGolden.
  ///
  /// In en, this message translates to:
  /// **'Golden'**
  String get styleGolden;

  /// No description provided for @styleChrome.
  ///
  /// In en, this message translates to:
  /// **'Chrome'**
  String get styleChrome;

  /// No description provided for @styleFilmDescription.
  ///
  /// In en, this message translates to:
  /// **'Warm colours, grain and an orange date stamp'**
  String get styleFilmDescription;

  /// No description provided for @styleInstantDescription.
  ///
  /// In en, this message translates to:
  /// **'Soft colours and a white border'**
  String get styleInstantDescription;

  /// No description provided for @styleDisposableDescription.
  ///
  /// In en, this message translates to:
  /// **'Harsh flash, vignette and light leaks'**
  String get styleDisposableDescription;

  /// No description provided for @styleBwDescription.
  ///
  /// In en, this message translates to:
  /// **'Grainy black and white with deep contrast'**
  String get styleBwDescription;

  /// No description provided for @styleGoldenDescription.
  ///
  /// In en, this message translates to:
  /// **'Always golden hour, a soft golden glow'**
  String get styleGoldenDescription;

  /// No description provided for @styleChromeDescription.
  ///
  /// In en, this message translates to:
  /// **'Cool, saturated and sharp, like slide film'**
  String get styleChromeDescription;

  /// No description provided for @shutterStopRecording.
  ///
  /// In en, this message translates to:
  /// **'Stop recording'**
  String get shutterStopRecording;

  /// No description provided for @shutterStartRecording.
  ///
  /// In en, this message translates to:
  /// **'Start video recording'**
  String get shutterStartRecording;

  /// No description provided for @shutterTakePhoto.
  ///
  /// In en, this message translates to:
  /// **'Take photo'**
  String get shutterTakePhoto;

  /// No description provided for @modePhoto.
  ///
  /// In en, this message translates to:
  /// **'Photo'**
  String get modePhoto;

  /// No description provided for @modeVideo.
  ///
  /// In en, this message translates to:
  /// **'Video'**
  String get modeVideo;

  /// No description provided for @cameraNotFound.
  ///
  /// In en, this message translates to:
  /// **'No camera found'**
  String get cameraNotFound;

  /// No description provided for @cameraAccessNeeded.
  ///
  /// In en, this message translates to:
  /// **'CamTrip needs access to your camera. Turn it on in Settings.'**
  String get cameraAccessNeeded;

  /// No description provided for @cameraStartFailed.
  ///
  /// In en, this message translates to:
  /// **'The camera couldn\'t start'**
  String get cameraStartFailed;

  /// No description provided for @albumAccessNeeded.
  ///
  /// In en, this message translates to:
  /// **'Give CamTrip access to your photos to also save them to your album'**
  String get albumAccessNeeded;

  /// No description provided for @albumSaveFailed.
  ///
  /// In en, this message translates to:
  /// **'Saving to your album didn\'t work. The photo is still shared.'**
  String get albumSaveFailed;

  /// No description provided for @styleProFallback.
  ///
  /// In en, this message translates to:
  /// **'This style is part of Pro. In this group you shoot with {style}.'**
  String styleProFallback(String style);

  /// No description provided for @photoFailed.
  ///
  /// In en, this message translates to:
  /// **'Taking the photo didn\'t work. Please try again.'**
  String get photoFailed;

  /// No description provided for @recordingFailed.
  ///
  /// In en, this message translates to:
  /// **'Recording video didn\'t work'**
  String get recordingFailed;

  /// No description provided for @videoFailed.
  ///
  /// In en, this message translates to:
  /// **'Making the video didn\'t work. Please try again.'**
  String get videoFailed;

  /// No description provided for @shootInGroup.
  ///
  /// In en, this message translates to:
  /// **'Shoot in group'**
  String get shootInGroup;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @flash.
  ///
  /// In en, this message translates to:
  /// **'Flash'**
  String get flash;

  /// No description provided for @flashOn.
  ///
  /// In en, this message translates to:
  /// **'On'**
  String get flashOn;

  /// No description provided for @flashOff.
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get flashOff;

  /// No description provided for @flashAuto.
  ///
  /// In en, this message translates to:
  /// **'Auto'**
  String get flashAuto;

  /// No description provided for @chooseGroup.
  ///
  /// In en, this message translates to:
  /// **'Choose group'**
  String get chooseGroup;

  /// No description provided for @switchCamera.
  ///
  /// In en, this message translates to:
  /// **'Switch camera'**
  String get switchCamera;

  /// No description provided for @createOrJoinFirst.
  ///
  /// In en, this message translates to:
  /// **'Create or join a group first'**
  String get createOrJoinFirst;

  /// No description provided for @proViaGroup.
  ///
  /// In en, this message translates to:
  /// **'Pro via the group'**
  String get proViaGroup;

  /// No description provided for @proViaName.
  ///
  /// In en, this message translates to:
  /// **'Pro via {name}'**
  String proViaName(String name);

  /// No description provided for @proStylesFreeViaMember.
  ///
  /// In en, this message translates to:
  /// **'Pro styles in this group are free for you thanks to a Pro member'**
  String get proStylesFreeViaMember;

  /// No description provided for @proStylesFreeViaName.
  ///
  /// In en, this message translates to:
  /// **'Pro styles in this group: free for you thanks to {name}'**
  String proStylesFreeViaName(String name);

  /// No description provided for @subscriptionsUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Subscriptions aren\'t available right now. Please try again later.'**
  String get subscriptionsUnavailable;

  /// No description provided for @paymentPending.
  ///
  /// In en, this message translates to:
  /// **'Your payment is still being processed. Pro turns on as soon as it\'s done.'**
  String get paymentPending;

  /// No description provided for @purchaseFailed.
  ///
  /// In en, this message translates to:
  /// **'The purchase didn\'t work. Please try again later.'**
  String get purchaseFailed;

  /// No description provided for @restoreUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Restoring purchases isn\'t possible right now. Please try again later.'**
  String get restoreUnavailable;

  /// No description provided for @restoreFailed.
  ///
  /// In en, this message translates to:
  /// **'Restoring didn\'t work. Please try again later.'**
  String get restoreFailed;

  /// No description provided for @welcomePro.
  ///
  /// In en, this message translates to:
  /// **'Welcome to CamTrip Pro! 🎉'**
  String get welcomePro;

  /// No description provided for @proRestored.
  ///
  /// In en, this message translates to:
  /// **'Pro has been restored'**
  String get proRestored;

  /// No description provided for @noPurchaseFound.
  ///
  /// In en, this message translates to:
  /// **'No previous purchase found'**
  String get noPurchaseFound;

  /// No description provided for @periodDays.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 day} other{{count} days}}'**
  String periodDays(int count);

  /// No description provided for @periodWeeks.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 week} other{{count} weeks}}'**
  String periodWeeks(int count);

  /// No description provided for @periodMonths.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 month} other{{count} months}}'**
  String periodMonths(int count);

  /// No description provided for @periodYears.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 year} other{{count} years}}'**
  String periodYears(int count);

  /// No description provided for @paywallHavePro.
  ///
  /// In en, this message translates to:
  /// **'You have CamTrip Pro'**
  String get paywallHavePro;

  /// No description provided for @paywallSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Everything for your next trip.'**
  String get paywallSubtitle;

  /// No description provided for @paywallFeatureStyles.
  ///
  /// In en, this message translates to:
  /// **'All camera styles ({styles})'**
  String paywallFeatureStyles(String styles);

  /// No description provided for @paywallFeatureUnlimited.
  ///
  /// In en, this message translates to:
  /// **'Unlimited members and storage, photos are kept forever'**
  String get paywallFeatureUnlimited;

  /// No description provided for @paywallFeatureNoWatermark.
  ///
  /// In en, this message translates to:
  /// **'Recaps without a watermark'**
  String get paywallFeatureNoWatermark;

  /// No description provided for @paywallFeatureOriginal.
  ///
  /// In en, this message translates to:
  /// **'Download in original quality'**
  String get paywallFeatureOriginal;

  /// No description provided for @planYear.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get planYear;

  /// No description provided for @planMonth.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get planMonth;

  /// No description provided for @pricePerMonth.
  ///
  /// In en, this message translates to:
  /// **'{price} per month'**
  String pricePerMonth(String price);

  /// No description provided for @paywallSaveBadge.
  ///
  /// In en, this message translates to:
  /// **'SAVE {percent}%'**
  String paywallSaveBadge(int percent);

  /// No description provided for @planMonthCancelAnytime.
  ///
  /// In en, this message translates to:
  /// **'cancel anytime'**
  String get planMonthCancelAnytime;

  /// No description provided for @tryFree.
  ///
  /// In en, this message translates to:
  /// **'Try {period} for free'**
  String tryFree(String period);

  /// No description provided for @becomePro.
  ///
  /// In en, this message translates to:
  /// **'Get Pro'**
  String get becomePro;

  /// No description provided for @subscriptionsLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Subscriptions couldn\'t be loaded. Check your connection.'**
  String get subscriptionsLoadFailed;

  /// No description provided for @legalAnnual.
  ///
  /// In en, this message translates to:
  /// **'CamTrip Pro annual subscription: {price} per year.'**
  String legalAnnual(String price);

  /// No description provided for @legalAnnualTrial.
  ///
  /// In en, this message translates to:
  /// **'CamTrip Pro annual subscription: {period} free, then {price} per year.'**
  String legalAnnualTrial(String period, String price);

  /// No description provided for @legalMonthly.
  ///
  /// In en, this message translates to:
  /// **'CamTrip Pro monthly subscription: {price} per month.'**
  String legalMonthly(String price);

  /// No description provided for @legalMonthlyTrial.
  ///
  /// In en, this message translates to:
  /// **'CamTrip Pro monthly subscription: {period} free, then {price} per month.'**
  String legalMonthlyTrial(String period, String price);

  /// No description provided for @legalBillingApple.
  ///
  /// In en, this message translates to:
  /// **'Payment is charged to your Apple ID. The subscription renews automatically unless you cancel it at least 24 hours before the end of the period. You can cancel and manage it in your App Store account settings.'**
  String get legalBillingApple;

  /// No description provided for @legalBillingGoogle.
  ///
  /// In en, this message translates to:
  /// **'Payment is charged to your Google account. The subscription renews automatically unless you cancel it at least 24 hours before the end of the period. You can cancel and manage it in your Google Play account settings.'**
  String get legalBillingGoogle;

  /// No description provided for @restorePurchases.
  ///
  /// In en, this message translates to:
  /// **'Restore purchases'**
  String get restorePurchases;

  /// No description provided for @terms.
  ///
  /// In en, this message translates to:
  /// **'Terms'**
  String get terms;

  /// No description provided for @privacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get privacy;

  /// No description provided for @groupProTitle.
  ///
  /// In en, this message translates to:
  /// **'One Pro in the group = Pro for everyone in that group'**
  String get groupProTitle;

  /// No description provided for @groupProBody.
  ///
  /// In en, this message translates to:
  /// **'If one person has Pro, the whole group gets all camera styles, unlimited members, photos that are kept, original quality and recaps without a watermark.'**
  String get groupProBody;

  /// No description provided for @groupCreated.
  ///
  /// In en, this message translates to:
  /// **'Group created ✓'**
  String get groupCreated;

  /// No description provided for @inviteFriends.
  ///
  /// In en, this message translates to:
  /// **'Invite your friends'**
  String get inviteFriends;

  /// No description provided for @codeCopied.
  ///
  /// In en, this message translates to:
  /// **'Code copied'**
  String get codeCopied;

  /// No description provided for @shareLink.
  ///
  /// In en, this message translates to:
  /// **'Share link'**
  String get shareLink;

  /// No description provided for @inviteSubject.
  ///
  /// In en, this message translates to:
  /// **'Join {groupName} on CamTrip'**
  String inviteSubject(String groupName);

  /// No description provided for @inviteMembersUnlimited.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 member} other{{count} members}} · unlimited (Pro)'**
  String inviteMembersUnlimited(int count);

  /// No description provided for @inviteMembersLimit.
  ///
  /// In en, this message translates to:
  /// **'{count} of {limit} members · Pro: unlimited'**
  String inviteMembersLimit(int count, int limit);

  /// No description provided for @toCamera.
  ///
  /// In en, this message translates to:
  /// **'Go to the camera'**
  String get toCamera;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @joinEnterCode.
  ///
  /// In en, this message translates to:
  /// **'Enter the 6-character code'**
  String get joinEnterCode;

  /// No description provided for @joinGroupTitle.
  ///
  /// In en, this message translates to:
  /// **'Join a group'**
  String get joinGroupTitle;

  /// No description provided for @joinGroupSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your friends\' code, or scan their QR code.'**
  String get joinGroupSubtitle;

  /// No description provided for @typeCode.
  ///
  /// In en, this message translates to:
  /// **'Type code'**
  String get typeCode;

  /// No description provided for @scanQr.
  ///
  /// In en, this message translates to:
  /// **'Scan QR'**
  String get scanQr;

  /// No description provided for @join.
  ///
  /// In en, this message translates to:
  /// **'Join'**
  String get join;

  /// No description provided for @groupNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Give your group a name'**
  String get groupNameRequired;

  /// No description provided for @newGroup.
  ///
  /// In en, this message translates to:
  /// **'New group'**
  String get newGroup;

  /// No description provided for @groupType.
  ///
  /// In en, this message translates to:
  /// **'Group type'**
  String get groupType;

  /// No description provided for @groupTypeVacation.
  ///
  /// In en, this message translates to:
  /// **'Holiday'**
  String get groupTypeVacation;

  /// No description provided for @groupTypeVacationDescription.
  ///
  /// In en, this message translates to:
  /// **'With a start and end date, then archived'**
  String get groupTypeVacationDescription;

  /// No description provided for @groupTypeEvent.
  ///
  /// In en, this message translates to:
  /// **'Event'**
  String get groupTypeEvent;

  /// No description provided for @groupTypeEventDescription.
  ///
  /// In en, this message translates to:
  /// **'One day or evening, e.g. a party'**
  String get groupTypeEventDescription;

  /// No description provided for @groupTypePermanent.
  ///
  /// In en, this message translates to:
  /// **'Always open'**
  String get groupTypePermanent;

  /// No description provided for @groupTypePermanentDescription.
  ///
  /// In en, this message translates to:
  /// **'For your regular group of friends'**
  String get groupTypePermanentDescription;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @departure.
  ///
  /// In en, this message translates to:
  /// **'Departure'**
  String get departure;

  /// No description provided for @returnDate.
  ///
  /// In en, this message translates to:
  /// **'Return'**
  String get returnDate;

  /// No description provided for @defaultCameraStyle.
  ///
  /// In en, this message translates to:
  /// **'Default camera style'**
  String get defaultCameraStyle;

  /// No description provided for @freeLimitPermanent.
  ///
  /// In en, this message translates to:
  /// **'Free: up to {max} members. Unlimited with Pro.'**
  String freeLimitPermanent(int max);

  /// No description provided for @freeLimitDated.
  ///
  /// In en, this message translates to:
  /// **'Free: up to {max} members, photos are kept until {days} days after the end date. Unlimited and forever with Pro.'**
  String freeLimitDated(int max, int days);

  /// No description provided for @createGroup.
  ///
  /// In en, this message translates to:
  /// **'Create group'**
  String get createGroup;

  /// No description provided for @group.
  ///
  /// In en, this message translates to:
  /// **'Group'**
  String get group;

  /// No description provided for @groupCode.
  ///
  /// In en, this message translates to:
  /// **'code {code}'**
  String groupCode(String code);

  /// No description provided for @manage.
  ///
  /// In en, this message translates to:
  /// **'Manage'**
  String get manage;

  /// No description provided for @rename.
  ///
  /// In en, this message translates to:
  /// **'Rename'**
  String get rename;

  /// No description provided for @changeDates.
  ///
  /// In en, this message translates to:
  /// **'Change dates'**
  String get changeDates;

  /// No description provided for @finishTrip.
  ///
  /// In en, this message translates to:
  /// **'Finish trip'**
  String get finishTrip;

  /// No description provided for @finishTripSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Sets the end date to today'**
  String get finishTripSubtitle;

  /// No description provided for @reopenGroup.
  ///
  /// In en, this message translates to:
  /// **'Reopen group'**
  String get reopenGroup;

  /// No description provided for @closeGroup.
  ///
  /// In en, this message translates to:
  /// **'Close group'**
  String get closeGroup;

  /// No description provided for @reopenGroupSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Members can add photos again'**
  String get reopenGroupSubtitle;

  /// No description provided for @closeGroupSubtitle.
  ///
  /// In en, this message translates to:
  /// **'No one can add photos anymore; everything can still be viewed'**
  String get closeGroupSubtitle;

  /// No description provided for @members.
  ///
  /// In en, this message translates to:
  /// **'Members'**
  String get members;

  /// No description provided for @memberYou.
  ///
  /// In en, this message translates to:
  /// **'{name} (you)'**
  String memberYou(String name);

  /// No description provided for @blockedTag.
  ///
  /// In en, this message translates to:
  /// **'blocked'**
  String get blockedTag;

  /// No description provided for @adminTag.
  ///
  /// In en, this message translates to:
  /// **'admin'**
  String get adminTag;

  /// No description provided for @removeMemberTitle.
  ///
  /// In en, this message translates to:
  /// **'Remove {name}?'**
  String removeMemberTitle(String name);

  /// No description provided for @removeMemberMessage.
  ///
  /// In en, this message translates to:
  /// **'Their photos stay in the group.'**
  String get removeMemberMessage;

  /// No description provided for @remove.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get remove;

  /// No description provided for @removeMember.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get removeMember;

  /// No description provided for @blockTitle.
  ///
  /// In en, this message translates to:
  /// **'Block {name}?'**
  String blockTitle(String name);

  /// No description provided for @blockMessage.
  ///
  /// In en, this message translates to:
  /// **'You\'ll no longer see photos and videos from {name} or get notifications about them. You can undo this in Settings.'**
  String blockMessage(String name);

  /// No description provided for @block.
  ///
  /// In en, this message translates to:
  /// **'Block'**
  String get block;

  /// No description provided for @makeMember.
  ///
  /// In en, this message translates to:
  /// **'Make regular member'**
  String get makeMember;

  /// No description provided for @makeAdmin.
  ///
  /// In en, this message translates to:
  /// **'Make admin'**
  String get makeAdmin;

  /// No description provided for @removeFromGroup.
  ///
  /// In en, this message translates to:
  /// **'Remove from group'**
  String get removeFromGroup;

  /// No description provided for @unblock.
  ///
  /// In en, this message translates to:
  /// **'Unblock'**
  String get unblock;

  /// No description provided for @inviteFriendsButton.
  ///
  /// In en, this message translates to:
  /// **'Invite friends'**
  String get inviteFriendsButton;

  /// No description provided for @you.
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get you;

  /// No description provided for @unarchive.
  ///
  /// In en, this message translates to:
  /// **'Restore from archive'**
  String get unarchive;

  /// No description provided for @archive.
  ///
  /// In en, this message translates to:
  /// **'Archive'**
  String get archive;

  /// No description provided for @unarchiveSubtitle.
  ///
  /// In en, this message translates to:
  /// **'The group is back with your albums'**
  String get unarchiveSubtitle;

  /// No description provided for @archiveSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Only for you: the group moves to \"{section}\" at the bottom of your albums'**
  String archiveSubtitle(String section);

  /// No description provided for @archivedSection.
  ///
  /// In en, this message translates to:
  /// **'Archived'**
  String get archivedSection;

  /// No description provided for @hiddenPhotos.
  ///
  /// In en, this message translates to:
  /// **'Hidden photos'**
  String get hiddenPhotos;

  /// No description provided for @hiddenPhotosSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Photos you\'ve hidden for yourself'**
  String get hiddenPhotosSubtitle;

  /// No description provided for @leaveGroup.
  ///
  /// In en, this message translates to:
  /// **'Leave group'**
  String get leaveGroup;

  /// No description provided for @leaveGroupSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your photos stay in the group for the others'**
  String get leaveGroupSubtitle;

  /// No description provided for @deleteGroup.
  ///
  /// In en, this message translates to:
  /// **'Delete group'**
  String get deleteGroup;

  /// No description provided for @deleteGroupSubtitle.
  ///
  /// In en, this message translates to:
  /// **'All photos are deleted for everyone'**
  String get deleteGroupSubtitle;

  /// No description provided for @groupArchived.
  ///
  /// In en, this message translates to:
  /// **'\"{groupName}\" archived'**
  String groupArchived(String groupName);

  /// No description provided for @groupUnarchived.
  ///
  /// In en, this message translates to:
  /// **'\"{groupName}\" is back with your albums'**
  String groupUnarchived(String groupName);

  /// No description provided for @undo.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get undo;

  /// No description provided for @groupNameTitle.
  ///
  /// In en, this message translates to:
  /// **'Group name'**
  String get groupNameTitle;

  /// No description provided for @finishTripTitle.
  ///
  /// In en, this message translates to:
  /// **'Finish trip?'**
  String get finishTripTitle;

  /// No description provided for @finishTripMessage.
  ///
  /// In en, this message translates to:
  /// **'The end date becomes today. You can still add photos; the recap is ready.'**
  String get finishTripMessage;

  /// No description provided for @finishTripConfirm.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get finishTripConfirm;

  /// No description provided for @tripFinished.
  ///
  /// In en, this message translates to:
  /// **'Trip finished'**
  String get tripFinished;

  /// No description provided for @leaveGroupTitle.
  ///
  /// In en, this message translates to:
  /// **'Leave \"{groupName}\"?'**
  String leaveGroupTitle(String groupName);

  /// No description provided for @leaveGroupMessage.
  ///
  /// In en, this message translates to:
  /// **'Your photos stay in the group for the others. You can join again later with the code.'**
  String get leaveGroupMessage;

  /// No description provided for @leave.
  ///
  /// In en, this message translates to:
  /// **'Leave'**
  String get leave;

  /// No description provided for @groupDeleted.
  ///
  /// In en, this message translates to:
  /// **'\"{groupName}\" has been deleted'**
  String groupDeleted(String groupName);

  /// No description provided for @youAreAdmin.
  ///
  /// In en, this message translates to:
  /// **'you\'re an admin'**
  String get youAreAdmin;

  /// No description provided for @open.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get open;

  /// No description provided for @archiveMenuSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Only for you, the others won\'t notice'**
  String get archiveMenuSubtitle;

  /// No description provided for @deleteGroupMenuSubtitle.
  ///
  /// In en, this message translates to:
  /// **'For everyone, with all photos'**
  String get deleteGroupMenuSubtitle;

  /// No description provided for @deleteGroupTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete group?'**
  String get deleteGroupTitle;

  /// No description provided for @deleteGroupMessage.
  ///
  /// In en, this message translates to:
  /// **'All {count, plural, =1{1 photo or video} other{{count} photos and videos}} in \"{groupName}\" will disappear for all {memberCount, plural, =1{1 member} other{{memberCount} members}}. This can\'t be undone.'**
  String deleteGroupMessage(int count, String groupName, int memberCount);

  /// No description provided for @deleteGroupOwnRoll.
  ///
  /// In en, this message translates to:
  /// **'Your own camera roll stays unchanged.'**
  String get deleteGroupOwnRoll;

  /// No description provided for @deleteGroupTypeName.
  ///
  /// In en, this message translates to:
  /// **'Type the group name to confirm:'**
  String get deleteGroupTypeName;

  /// No description provided for @deleteForEveryone.
  ///
  /// In en, this message translates to:
  /// **'Delete for everyone'**
  String get deleteForEveryone;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @yourAlbums.
  ///
  /// In en, this message translates to:
  /// **'Your albums'**
  String get yourAlbums;

  /// No description provided for @uploadQueue.
  ///
  /// In en, this message translates to:
  /// **'Upload queue'**
  String get uploadQueue;

  /// No description provided for @noConnection.
  ///
  /// In en, this message translates to:
  /// **'No connection'**
  String get noConnection;

  /// No description provided for @albumsOfflineMessage.
  ///
  /// In en, this message translates to:
  /// **'Your albums will load once you\'re back online. The camera still works.'**
  String get albumsOfflineMessage;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get retry;

  /// No description provided for @noAlbumsTitle.
  ///
  /// In en, this message translates to:
  /// **'No albums yet'**
  String get noAlbumsTitle;

  /// No description provided for @noAlbumsMessage.
  ///
  /// In en, this message translates to:
  /// **'Create a group for your next trip, or join a friend\'s with their code.'**
  String get noAlbumsMessage;

  /// No description provided for @haveCode.
  ///
  /// In en, this message translates to:
  /// **'I have a code'**
  String get haveCode;

  /// No description provided for @joinWithCode.
  ///
  /// In en, this message translates to:
  /// **'Join with a code or QR code'**
  String get joinWithCode;

  /// No description provided for @camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// No description provided for @restore.
  ///
  /// In en, this message translates to:
  /// **'Restore'**
  String get restore;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// No description provided for @newAlbum.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get newAlbum;

  /// No description provided for @closedTag.
  ///
  /// In en, this message translates to:
  /// **'closed'**
  String get closedTag;

  /// No description provided for @activeTag.
  ///
  /// In en, this message translates to:
  /// **'active'**
  String get activeTag;

  /// No description provided for @uploadFailed.
  ///
  /// In en, this message translates to:
  /// **'Upload failed'**
  String get uploadFailed;

  /// No description provided for @queueNoSignal.
  ///
  /// In en, this message translates to:
  /// **'No signal.'**
  String get queueNoSignal;

  /// No description provided for @queueNoSignalMessage.
  ///
  /// In en, this message translates to:
  /// **'Your photos are already in your album and will be shared as soon as you\'re back online.'**
  String get queueNoSignalMessage;

  /// No description provided for @queueWaitingForWifi.
  ///
  /// In en, this message translates to:
  /// **'Waiting for Wi-Fi.'**
  String get queueWaitingForWifi;

  /// No description provided for @queueWifiOnlyOn.
  ///
  /// In en, this message translates to:
  /// **'You have \"{setting}\" turned on.'**
  String queueWifiOnlyOn(String setting);

  /// No description provided for @queueVideosWifiOnly.
  ///
  /// In en, this message translates to:
  /// **'Videos only go over Wi-Fi.'**
  String get queueVideosWifiOnly;

  /// No description provided for @queueAllShared.
  ///
  /// In en, this message translates to:
  /// **'Everything has been shared ✓'**
  String get queueAllShared;

  /// No description provided for @queuePending.
  ///
  /// In en, this message translates to:
  /// **'{items} still to share'**
  String queuePending(String items);

  /// No description provided for @queuePendingBoth.
  ///
  /// In en, this message translates to:
  /// **'{photos} and {videos} still to share'**
  String queuePendingBoth(String photos, String videos);

  /// No description provided for @retryUpload.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get retryUpload;

  /// No description provided for @removeFromQueue.
  ///
  /// In en, this message translates to:
  /// **'Remove from queue'**
  String get removeFromQueue;

  /// No description provided for @queueStatusWifi.
  ///
  /// In en, this message translates to:
  /// **'Wi-Fi'**
  String get queueStatusWifi;

  /// No description provided for @queueStatusWaiting.
  ///
  /// In en, this message translates to:
  /// **'waiting'**
  String get queueStatusWaiting;

  /// No description provided for @videosWifiOnlyTitle.
  ///
  /// In en, this message translates to:
  /// **'Videos over Wi-Fi only'**
  String get videosWifiOnlyTitle;

  /// No description provided for @videosWifiOnlySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Saves your mobile data'**
  String get videosWifiOnlySubtitle;

  /// No description provided for @retryNow.
  ///
  /// In en, this message translates to:
  /// **'Try again now'**
  String get retryNow;

  /// No description provided for @yourName.
  ///
  /// In en, this message translates to:
  /// **'Your name'**
  String get yourName;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @tapToChangeName.
  ///
  /// In en, this message translates to:
  /// **'Tap to change your name'**
  String get tapToChangeName;

  /// No description provided for @getCamTripPro.
  ///
  /// In en, this message translates to:
  /// **'Get CamTrip Pro'**
  String get getCamTripPro;

  /// No description provided for @photos.
  ///
  /// In en, this message translates to:
  /// **'Photos'**
  String get photos;

  /// No description provided for @saveOwnPhotos.
  ///
  /// In en, this message translates to:
  /// **'Save my own photos to an album per group'**
  String get saveOwnPhotos;

  /// No description provided for @autoSaveOthers.
  ///
  /// In en, this message translates to:
  /// **'Automatically save others\' photos'**
  String get autoSaveOthers;

  /// No description provided for @wifiOnlyTitle.
  ///
  /// In en, this message translates to:
  /// **'Upload over Wi-Fi only'**
  String get wifiOnlyTitle;

  /// No description provided for @dateStamp.
  ///
  /// In en, this message translates to:
  /// **'Date stamp'**
  String get dateStamp;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @notifyNewPhotos.
  ///
  /// In en, this message translates to:
  /// **'New photos (bundled)'**
  String get notifyNewPhotos;

  /// No description provided for @notifyRecapReady.
  ///
  /// In en, this message translates to:
  /// **'Recap ready'**
  String get notifyRecapReady;

  /// No description provided for @camTripTeam.
  ///
  /// In en, this message translates to:
  /// **'CamTrip team'**
  String get camTripTeam;

  /// No description provided for @adminEntrySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Users, giving Pro, reports and stats'**
  String get adminEntrySubtitle;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @manageSubscription.
  ///
  /// In en, this message translates to:
  /// **'Manage subscription'**
  String get manageSubscription;

  /// No description provided for @blockedPeople.
  ///
  /// In en, this message translates to:
  /// **'Blocked people'**
  String get blockedPeople;

  /// No description provided for @nobody.
  ///
  /// In en, this message translates to:
  /// **'Nobody'**
  String get nobody;

  /// No description provided for @peopleCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 person} other{{count} people}}'**
  String peopleCount(int count);

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get privacyPolicy;

  /// No description provided for @contact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contact;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get signOut;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get deleteAccount;

  /// No description provided for @deleteAccountSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Deletes your account and all your photos'**
  String get deleteAccountSubtitle;

  /// No description provided for @deleteAccountTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete account?'**
  String get deleteAccountTitle;

  /// No description provided for @deleteAccountMessage.
  ///
  /// In en, this message translates to:
  /// **'Your account and all your photos and videos will be deleted, including from the groups. Cancel any active subscription in the App Store or Google Play.'**
  String get deleteAccountMessage;

  /// No description provided for @blockedTitle.
  ///
  /// In en, this message translates to:
  /// **'Blocked'**
  String get blockedTitle;

  /// No description provided for @blockedSubtitle.
  ///
  /// In en, this message translates to:
  /// **'You don\'t see photos from these people.'**
  String get blockedSubtitle;

  /// No description provided for @blockedNone.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t blocked anyone.'**
  String get blockedNone;

  /// No description provided for @unblockShort.
  ///
  /// In en, this message translates to:
  /// **'Unblock'**
  String get unblockShort;

  /// No description provided for @groupGone.
  ///
  /// In en, this message translates to:
  /// **'This group no longer exists, or you\'re no longer a member.'**
  String get groupGone;

  /// No description provided for @photosSavedToAlbum.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 photo saved to \"{album}\"} other{{count} photos saved to \"{album}\"}}'**
  String photosSavedToAlbum(int count, String album);

  /// No description provided for @photosDeleted.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 photo deleted} other{{count} photos deleted}}'**
  String photosDeleted(int count);

  /// No description provided for @photosDeletedSkipped.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 photo deleted} other{{count} photos deleted}}, {skipped} skipped'**
  String photosDeletedSkipped(int count, int skipped);

  /// No description provided for @photosHiddenForYou.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 photo hidden for you} other{{count} photos hidden for you}}'**
  String photosHiddenForYou(int count);

  /// No description provided for @addedToFavorites.
  ///
  /// In en, this message translates to:
  /// **'Added to favourites'**
  String get addedToFavorites;

  /// No description provided for @removedFromFavorites.
  ///
  /// In en, this message translates to:
  /// **'Removed from favourites'**
  String get removedFromFavorites;

  /// No description provided for @photoAccessSettings.
  ///
  /// In en, this message translates to:
  /// **'Give CamTrip access to your photos in Settings'**
  String get photoAccessSettings;

  /// No description provided for @photosBeingAdded.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 photo is being added} other{{count} photos are being added}}'**
  String photosBeingAdded(int count);

  /// No description provided for @photosUnreadable.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 photo couldn\'t be read} other{{count} photos couldn\'t be read}}'**
  String photosUnreadable(int count);

  /// No description provided for @groupNotLoaded.
  ///
  /// In en, this message translates to:
  /// **'Group not loaded'**
  String get groupNotLoaded;

  /// No description provided for @noFavoritesTitle.
  ///
  /// In en, this message translates to:
  /// **'No favourites yet'**
  String get noFavoritesTitle;

  /// No description provided for @noPhotosTitle.
  ///
  /// In en, this message translates to:
  /// **'No photos yet'**
  String get noPhotosTitle;

  /// No description provided for @noFavoritesMessage.
  ///
  /// In en, this message translates to:
  /// **'Tap the star on a photo to put it here.'**
  String get noFavoritesMessage;

  /// No description provided for @noPhotosMessage.
  ///
  /// In en, this message translates to:
  /// **'Take the first photo. Everyone in the group sees it right away.'**
  String get noPhotosMessage;

  /// No description provided for @openCamera.
  ///
  /// In en, this message translates to:
  /// **'Open the camera'**
  String get openCamera;

  /// No description provided for @savingProgress.
  ///
  /// In en, this message translates to:
  /// **'Saving... {done}/{total}'**
  String savingProgress(int done, int total);

  /// No description provided for @choosePhotos.
  ///
  /// In en, this message translates to:
  /// **'Choose photos'**
  String get choosePhotos;

  /// No description provided for @selectedCount.
  ///
  /// In en, this message translates to:
  /// **'{count} selected'**
  String selectedCount(int count);

  /// No description provided for @selectNone.
  ///
  /// In en, this message translates to:
  /// **'Select none'**
  String get selectNone;

  /// No description provided for @selectAll.
  ///
  /// In en, this message translates to:
  /// **'Select all'**
  String get selectAll;

  /// No description provided for @photosWaitingToShare.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 photo waiting to be shared} other{{count} photos waiting to be shared}}'**
  String photosWaitingToShare(int count);

  /// No description provided for @recapReadyTitle.
  ///
  /// In en, this message translates to:
  /// **'Your recap is ready'**
  String get recapReadyTitle;

  /// No description provided for @recapReadySubtitle.
  ///
  /// In en, this message translates to:
  /// **'A video with music of your trip'**
  String get recapReadySubtitle;

  /// No description provided for @watch.
  ///
  /// In en, this message translates to:
  /// **'Watch'**
  String get watch;

  /// No description provided for @makeRecapNow.
  ///
  /// In en, this message translates to:
  /// **'Make a recap video now'**
  String get makeRecapNow;

  /// No description provided for @freeGroupDeleteNotice.
  ///
  /// In en, this message translates to:
  /// **'Free group: photos are kept until {date}. Save them or get Pro.'**
  String freeGroupDeleteNotice(String date);

  /// No description provided for @filterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get filterAll;

  /// No description provided for @filterFavorites.
  ///
  /// In en, this message translates to:
  /// **'Favourites'**
  String get filterFavorites;

  /// No description provided for @filterPerPerson.
  ///
  /// In en, this message translates to:
  /// **'By person'**
  String get filterPerPerson;

  /// No description provided for @filterPerson.
  ///
  /// In en, this message translates to:
  /// **'Person'**
  String get filterPerson;

  /// No description provided for @select.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get select;

  /// No description provided for @hiddenFilter.
  ///
  /// In en, this message translates to:
  /// **'Hidden'**
  String get hiddenFilter;

  /// No description provided for @photosBy.
  ///
  /// In en, this message translates to:
  /// **'Photos by...'**
  String get photosBy;

  /// No description provided for @uploadedTag.
  ///
  /// In en, this message translates to:
  /// **'uploaded'**
  String get uploadedTag;

  /// No description provided for @saveAll.
  ///
  /// In en, this message translates to:
  /// **'Save all'**
  String get saveAll;

  /// No description provided for @favorite.
  ///
  /// In en, this message translates to:
  /// **'Favourite'**
  String get favorite;

  /// No description provided for @unfavorite.
  ///
  /// In en, this message translates to:
  /// **'Unfavourite'**
  String get unfavorite;

  /// No description provided for @hide.
  ///
  /// In en, this message translates to:
  /// **'Hide'**
  String get hide;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @deletePhotosTitle.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Delete photo?} other{Delete {count} photos?}}'**
  String deletePhotosTitle(int count);

  /// No description provided for @deletePhotosMessage.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{It disappears for everyone in the group. This can\'t be undone.} other{They disappear for everyone in the group. This can\'t be undone.}}'**
  String deletePhotosMessage(int count);

  /// No description provided for @deletePhotosNotAllowed.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 photo belongs to someone else. It stays; only an admin can delete it.} other{{count} photos belong to someone else. They stay; only an admin can delete them.}}'**
  String deletePhotosNotAllowed(int count);

  /// No description provided for @photosBackInGroup.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 photo is back in the group} other{{count} photos are back in the group}}'**
  String photosBackInGroup(int count);

  /// No description provided for @showAll.
  ///
  /// In en, this message translates to:
  /// **'Show all'**
  String get showAll;

  /// No description provided for @hiddenPhotosExplainer.
  ///
  /// In en, this message translates to:
  /// **'Only you no longer see these photos. For the others in the group they\'re still there.'**
  String get hiddenPhotosExplainer;

  /// No description provided for @nothingHidden.
  ///
  /// In en, this message translates to:
  /// **'Nothing hidden'**
  String get nothingHidden;

  /// No description provided for @nothingHiddenMessage.
  ///
  /// In en, this message translates to:
  /// **'Photos you hide will show up here.'**
  String get nothingHiddenMessage;

  /// No description provided for @showAgainCount.
  ///
  /// In en, this message translates to:
  /// **'Show again ({count})'**
  String showAgainCount(int count);

  /// No description provided for @someone.
  ///
  /// In en, this message translates to:
  /// **'Someone'**
  String get someone;

  /// No description provided for @savedToAlbum.
  ///
  /// In en, this message translates to:
  /// **'Saved to your photo album'**
  String get savedToAlbum;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @shareFailed.
  ///
  /// In en, this message translates to:
  /// **'Sharing didn\'t work'**
  String get shareFailed;

  /// No description provided for @reportTitle.
  ///
  /// In en, this message translates to:
  /// **'Why are you reporting this photo?'**
  String get reportTitle;

  /// No description provided for @reportSubtitle.
  ///
  /// In en, this message translates to:
  /// **'We review every report within 24 hours. The photo is hidden for you right away.'**
  String get reportSubtitle;

  /// No description provided for @reportThanks.
  ///
  /// In en, this message translates to:
  /// **'Thanks, we\'ll look into it'**
  String get reportThanks;

  /// No description provided for @blockMessageAllGroups.
  ///
  /// In en, this message translates to:
  /// **'You\'ll no longer see photos and videos from {name} in any group, or get notifications about them. You can undo this in Settings.'**
  String blockMessageAllGroups(String name);

  /// No description provided for @userBlocked.
  ///
  /// In en, this message translates to:
  /// **'{name} has been blocked'**
  String userBlocked(String name);

  /// No description provided for @videoHiddenForYou.
  ///
  /// In en, this message translates to:
  /// **'Video hidden for you'**
  String get videoHiddenForYou;

  /// No description provided for @photoHiddenForYou.
  ///
  /// In en, this message translates to:
  /// **'Photo hidden for you'**
  String get photoHiddenForYou;

  /// No description provided for @setAsCover.
  ///
  /// In en, this message translates to:
  /// **'Set as cover'**
  String get setAsCover;

  /// No description provided for @coverUpdated.
  ///
  /// In en, this message translates to:
  /// **'Cover photo updated'**
  String get coverUpdated;

  /// No description provided for @hideForMe.
  ///
  /// In en, this message translates to:
  /// **'Hide for me'**
  String get hideForMe;

  /// No description provided for @hideForMeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'The others in the group can still see it'**
  String get hideForMeSubtitle;

  /// No description provided for @reportPhoto.
  ///
  /// In en, this message translates to:
  /// **'Report photo'**
  String get reportPhoto;

  /// No description provided for @blockName.
  ///
  /// In en, this message translates to:
  /// **'Block {name}'**
  String blockName(String name);

  /// No description provided for @forEveryoneInGroup.
  ///
  /// In en, this message translates to:
  /// **'For everyone in the group'**
  String get forEveryoneInGroup;

  /// No description provided for @videoDeleted.
  ///
  /// In en, this message translates to:
  /// **'Video deleted'**
  String get videoDeleted;

  /// No description provided for @photoDeleted.
  ///
  /// In en, this message translates to:
  /// **'Photo deleted'**
  String get photoDeleted;

  /// No description provided for @photoAccessToSave.
  ///
  /// In en, this message translates to:
  /// **'Give CamTrip access to your photos in Settings to save them'**
  String get photoAccessToSave;

  /// No description provided for @phoneFull.
  ///
  /// In en, this message translates to:
  /// **'Your phone is full'**
  String get phoneFull;

  /// No description provided for @albumSaveFailedShort.
  ///
  /// In en, this message translates to:
  /// **'Saving to your album didn\'t work'**
  String get albumSaveFailedShort;

  /// No description provided for @recapTemplateGoldenHour.
  ///
  /// In en, this message translates to:
  /// **'Golden Hour'**
  String get recapTemplateGoldenHour;

  /// No description provided for @recapTemplateFast.
  ///
  /// In en, this message translates to:
  /// **'Fast'**
  String get recapTemplateFast;

  /// No description provided for @recapTemplateFilmRoll.
  ///
  /// In en, this message translates to:
  /// **'Film roll'**
  String get recapTemplateFilmRoll;

  /// No description provided for @recapTemplatePolaroid.
  ///
  /// In en, this message translates to:
  /// **'Polaroid'**
  String get recapTemplatePolaroid;

  /// No description provided for @trackSummerEvening.
  ///
  /// In en, this message translates to:
  /// **'Summer Evening'**
  String get trackSummerEvening;

  /// No description provided for @trackGoldenHour.
  ///
  /// In en, this message translates to:
  /// **'Golden Hour'**
  String get trackGoldenHour;

  /// No description provided for @trackRoadtrip.
  ///
  /// In en, this message translates to:
  /// **'Road Trip'**
  String get trackRoadtrip;

  /// No description provided for @moodWarm.
  ///
  /// In en, this message translates to:
  /// **'warm'**
  String get moodWarm;

  /// No description provided for @moodCheerful.
  ///
  /// In en, this message translates to:
  /// **'upbeat'**
  String get moodCheerful;

  /// No description provided for @friendsCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 friend} other{{count} friends}}'**
  String friendsCount(int count);

  /// No description provided for @madeWithCamTrip.
  ///
  /// In en, this message translates to:
  /// **'Made with CamTrip'**
  String get madeWithCamTrip;

  /// No description provided for @tagline.
  ///
  /// In en, this message translates to:
  /// **'One roll for the whole group'**
  String get tagline;

  /// No description provided for @videoUnsupportedDevice.
  ///
  /// In en, this message translates to:
  /// **'Making the video didn\'t work on this device'**
  String get videoUnsupportedDevice;

  /// No description provided for @groupLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'This group couldn\'t be loaded.'**
  String get groupLoadFailed;

  /// No description provided for @recapNeedsPhotos.
  ///
  /// In en, this message translates to:
  /// **'You need at least {count} photos for a recap.'**
  String recapNeedsPhotos(int count);

  /// No description provided for @recapFailed.
  ///
  /// In en, this message translates to:
  /// **'Making the recap didn\'t work. Please try again.'**
  String get recapFailed;

  /// No description provided for @recapSaved.
  ///
  /// In en, this message translates to:
  /// **'Recap saved to your photo album'**
  String get recapSaved;

  /// No description provided for @recap.
  ///
  /// In en, this message translates to:
  /// **'Recap'**
  String get recap;

  /// No description provided for @recapRendering.
  ///
  /// In en, this message translates to:
  /// **'Making recap...'**
  String get recapRendering;

  /// No description provided for @videoRendering.
  ///
  /// In en, this message translates to:
  /// **'Making video...'**
  String get videoRendering;

  /// No description provided for @template.
  ///
  /// In en, this message translates to:
  /// **'Template'**
  String get template;

  /// No description provided for @musicLicense.
  ///
  /// In en, this message translates to:
  /// **'CamTrip\'s own music · royalty-free'**
  String get musicLicense;

  /// No description provided for @change.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get change;

  /// No description provided for @noWatermark.
  ///
  /// In en, this message translates to:
  /// **'No watermark ✓'**
  String get noWatermark;

  /// No description provided for @removeWatermarkPro.
  ///
  /// In en, this message translates to:
  /// **'Remove the watermark with Pro'**
  String get removeWatermarkPro;

  /// No description provided for @proSourceSubscription.
  ///
  /// In en, this message translates to:
  /// **'Subscription'**
  String get proSourceSubscription;

  /// No description provided for @proSourceGift.
  ///
  /// In en, this message translates to:
  /// **'Gift'**
  String get proSourceGift;

  /// No description provided for @proSourceAdmin.
  ///
  /// In en, this message translates to:
  /// **'Admin'**
  String get proSourceAdmin;

  /// No description provided for @proSourceGroup.
  ///
  /// In en, this message translates to:
  /// **'Via group'**
  String get proSourceGroup;

  /// No description provided for @noPro.
  ///
  /// In en, this message translates to:
  /// **'No Pro'**
  String get noPro;

  /// No description provided for @proStatusNoEnd.
  ///
  /// In en, this message translates to:
  /// **'Pro ({source}), no end date'**
  String proStatusNoEnd(String source);

  /// No description provided for @proStatusUntil.
  ///
  /// In en, this message translates to:
  /// **'Pro ({source}), until {date}'**
  String proStatusUntil(String source, String date);

  /// No description provided for @lifetime.
  ///
  /// In en, this message translates to:
  /// **'Lifetime'**
  String get lifetime;

  /// No description provided for @pickDate.
  ///
  /// In en, this message translates to:
  /// **'Pick a date'**
  String get pickDate;

  /// No description provided for @noAccess.
  ///
  /// In en, this message translates to:
  /// **'No access'**
  String get noAccess;

  /// No description provided for @adminOnlyTeam.
  ///
  /// In en, this message translates to:
  /// **'Admin is only for the CamTrip team.'**
  String get adminOnlyTeam;

  /// No description provided for @adminOverview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get adminOverview;

  /// No description provided for @adminUsers.
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get adminUsers;

  /// No description provided for @adminReports.
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get adminReports;

  /// No description provided for @adminsCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 admin} other{{count} admins}}'**
  String adminsCount(int count);

  /// No description provided for @adminNewThisWeek.
  ///
  /// In en, this message translates to:
  /// **'New this week'**
  String get adminNewThisWeek;

  /// No description provided for @adminGroups.
  ///
  /// In en, this message translates to:
  /// **'Groups'**
  String get adminGroups;

  /// No description provided for @adminProSubscription.
  ///
  /// In en, this message translates to:
  /// **'Pro via subscription'**
  String get adminProSubscription;

  /// No description provided for @adminProGift.
  ///
  /// In en, this message translates to:
  /// **'Pro as a gift'**
  String get adminProGift;

  /// No description provided for @adminWithoutSubscription.
  ///
  /// In en, this message translates to:
  /// **'{count} without a subscription'**
  String adminWithoutSubscription(int count);

  /// No description provided for @adminOpenReports.
  ///
  /// In en, this message translates to:
  /// **'Open reports'**
  String get adminOpenReports;

  /// No description provided for @adminSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search by name or e-mail'**
  String get adminSearchHint;

  /// No description provided for @nobodyFound.
  ///
  /// In en, this message translates to:
  /// **'Nobody found'**
  String get nobodyFound;

  /// No description provided for @loadMore.
  ///
  /// In en, this message translates to:
  /// **'Load more'**
  String get loadMore;

  /// No description provided for @noEmail.
  ///
  /// In en, this message translates to:
  /// **'No e-mail'**
  String get noEmail;

  /// No description provided for @adminDeletePhotoMessage.
  ///
  /// In en, this message translates to:
  /// **'The photo disappears for everyone in \"{groupName}\". All reports on this photo are resolved.'**
  String adminDeletePhotoMessage(String groupName);

  /// No description provided for @adminBanMessage.
  ///
  /// In en, this message translates to:
  /// **'This account can no longer sign in or use the app. You can undo this later.'**
  String get adminBanMessage;

  /// No description provided for @adminDismissTitle.
  ///
  /// In en, this message translates to:
  /// **'Dismiss report?'**
  String get adminDismissTitle;

  /// No description provided for @adminDismissMessage.
  ///
  /// In en, this message translates to:
  /// **'The photo stays. The report is marked as resolved.'**
  String get adminDismissMessage;

  /// No description provided for @adminDismiss.
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get adminDismiss;

  /// No description provided for @adminAccountBlocked.
  ///
  /// In en, this message translates to:
  /// **'Account blocked'**
  String get adminAccountBlocked;

  /// No description provided for @adminReportDismissed.
  ///
  /// In en, this message translates to:
  /// **'Report dismissed'**
  String get adminReportDismissed;

  /// No description provided for @adminNoReports.
  ///
  /// In en, this message translates to:
  /// **'No open reports'**
  String get adminNoReports;

  /// No description provided for @adminNoReportsMessage.
  ///
  /// In en, this message translates to:
  /// **'Reported photos show up here.'**
  String get adminNoReportsMessage;

  /// No description provided for @deletedTag.
  ///
  /// In en, this message translates to:
  /// **'Deleted'**
  String get deletedTag;

  /// No description provided for @adminReportedBy.
  ///
  /// In en, this message translates to:
  /// **'By {name}'**
  String adminReportedBy(String name);

  /// No description provided for @adminPhotoBy.
  ///
  /// In en, this message translates to:
  /// **'Photo by {name}'**
  String adminPhotoBy(String name);

  /// No description provided for @reportsCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 report} other{{count} reports}}'**
  String reportsCount(int count);

  /// No description provided for @adminDeletePhoto.
  ///
  /// In en, this message translates to:
  /// **'Delete photo'**
  String get adminDeletePhoto;

  /// No description provided for @adminBlockCreator.
  ///
  /// In en, this message translates to:
  /// **'Block creator'**
  String get adminBlockCreator;

  /// No description provided for @loadFailed.
  ///
  /// In en, this message translates to:
  /// **'Loading didn\'t work'**
  String get loadFailed;

  /// No description provided for @adminLifetimeProGiven.
  ///
  /// In en, this message translates to:
  /// **'Lifetime Pro given'**
  String get adminLifetimeProGiven;

  /// No description provided for @adminProGiven.
  ///
  /// In en, this message translates to:
  /// **'Pro given'**
  String get adminProGiven;

  /// No description provided for @adminGiveProUntil.
  ///
  /// In en, this message translates to:
  /// **'Give Pro until {date}'**
  String adminGiveProUntil(String date);

  /// No description provided for @adminGiveProLifetime.
  ///
  /// In en, this message translates to:
  /// **'Give Pro for life'**
  String get adminGiveProLifetime;

  /// No description provided for @adminGiveProFor.
  ///
  /// In en, this message translates to:
  /// **'Give Pro for {period}'**
  String adminGiveProFor(String period);

  /// No description provided for @adminReasonHint.
  ///
  /// In en, this message translates to:
  /// **'Reason, e.g. friend, tester, influencer'**
  String get adminReasonHint;

  /// No description provided for @adminGivePro.
  ///
  /// In en, this message translates to:
  /// **'Give Pro'**
  String get adminGivePro;

  /// No description provided for @adminRevokeTitle.
  ///
  /// In en, this message translates to:
  /// **'Revoke gift?'**
  String get adminRevokeTitle;

  /// No description provided for @adminRevokeMessage.
  ///
  /// In en, this message translates to:
  /// **'The gifted Pro stops right away. Their own subscription keeps running.'**
  String get adminRevokeMessage;

  /// No description provided for @adminRevoke.
  ///
  /// In en, this message translates to:
  /// **'Revoke'**
  String get adminRevoke;

  /// No description provided for @adminGiftRevoked.
  ///
  /// In en, this message translates to:
  /// **'Gift revoked'**
  String get adminGiftRevoked;

  /// No description provided for @adminUnbanTitle.
  ///
  /// In en, this message translates to:
  /// **'Lift block?'**
  String get adminUnbanTitle;

  /// No description provided for @adminUnbanMessage.
  ///
  /// In en, this message translates to:
  /// **'{name} can sign in again.'**
  String adminUnbanMessage(String name);

  /// No description provided for @adminUnbanned.
  ///
  /// In en, this message translates to:
  /// **'Block lifted'**
  String get adminUnbanned;

  /// No description provided for @adminBanUserMessage.
  ///
  /// In en, this message translates to:
  /// **'This account can no longer sign in or use the app. Photos stay.'**
  String get adminBanUserMessage;

  /// No description provided for @adminUser.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get adminUser;

  /// No description provided for @adminNotVerified.
  ///
  /// In en, this message translates to:
  /// **'not verified'**
  String get adminNotVerified;

  /// No description provided for @adminRole.
  ///
  /// In en, this message translates to:
  /// **'Role'**
  String get adminRole;

  /// No description provided for @adminCreated.
  ///
  /// In en, this message translates to:
  /// **'Created'**
  String get adminCreated;

  /// No description provided for @unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get unknown;

  /// No description provided for @adminSignInWith.
  ///
  /// In en, this message translates to:
  /// **'Signs in with'**
  String get adminSignInWith;

  /// No description provided for @adminEmailMethod.
  ///
  /// In en, this message translates to:
  /// **'E-mail'**
  String get adminEmailMethod;

  /// No description provided for @adminPhotosAndVideos.
  ///
  /// In en, this message translates to:
  /// **'Photos and videos'**
  String get adminPhotosAndVideos;

  /// No description provided for @adminStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get adminStatus;

  /// No description provided for @adminActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get adminActive;

  /// No description provided for @adminActiveUntil.
  ///
  /// In en, this message translates to:
  /// **'Active until {date}'**
  String adminActiveUntil(String date);

  /// No description provided for @adminGiftFrom.
  ///
  /// In en, this message translates to:
  /// **'Gift from {name}'**
  String adminGiftFrom(String name);

  /// No description provided for @adminExpiredOn.
  ///
  /// In en, this message translates to:
  /// **'Expired on {date}'**
  String adminExpiredOn(String date);

  /// No description provided for @adminExpired.
  ///
  /// In en, this message translates to:
  /// **'Expired'**
  String get adminExpired;

  /// No description provided for @adminUntil.
  ///
  /// In en, this message translates to:
  /// **'Until {date}'**
  String adminUntil(String date);

  /// No description provided for @adminGiveProTitle.
  ///
  /// In en, this message translates to:
  /// **'Give Pro'**
  String get adminGiveProTitle;

  /// No description provided for @adminGiveProNote.
  ///
  /// In en, this message translates to:
  /// **'Also works for this person\'s groups: one Pro in the group = Pro for everyone in that group.'**
  String get adminGiveProNote;

  /// No description provided for @adminRevokeGift.
  ///
  /// In en, this message translates to:
  /// **'Revoke gift'**
  String get adminRevokeGift;

  /// No description provided for @adminModeration.
  ///
  /// In en, this message translates to:
  /// **'Moderation'**
  String get adminModeration;

  /// No description provided for @adminCannotBanSelf.
  ///
  /// In en, this message translates to:
  /// **'You can\'t block yourself.'**
  String get adminCannotBanSelf;

  /// No description provided for @adminCannotBanAdmin.
  ///
  /// In en, this message translates to:
  /// **'An admin can\'t be blocked.'**
  String get adminCannotBanAdmin;

  /// No description provided for @adminUnban.
  ///
  /// In en, this message translates to:
  /// **'Lift block'**
  String get adminUnban;

  /// No description provided for @adminBanAccount.
  ///
  /// In en, this message translates to:
  /// **'Block account'**
  String get adminBanAccount;

  /// No description provided for @googleSignInUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Signing in with Google isn\'t available yet'**
  String get googleSignInUnavailable;

  /// No description provided for @cameraPickerTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose your camera'**
  String get cameraPickerTitle;

  /// No description provided for @cameraPickerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Every camera gives your photos its own look'**
  String get cameraPickerSubtitle;

  /// No description provided for @cameraPickerChange.
  ///
  /// In en, this message translates to:
  /// **'Switch camera'**
  String get cameraPickerChange;

  /// No description provided for @cameraPickerUnlock.
  ///
  /// In en, this message translates to:
  /// **'Unlock with Pro'**
  String get cameraPickerUnlock;

  /// No description provided for @cameraPickerSelected.
  ///
  /// In en, this message translates to:
  /// **'Selected'**
  String get cameraPickerSelected;

  /// No description provided for @cameraPickerStyleSummer.
  ///
  /// In en, this message translates to:
  /// **'Summer'**
  String get cameraPickerStyleSummer;

  /// No description provided for @cameraPickerStyleSummerDescription.
  ///
  /// In en, this message translates to:
  /// **'Warm, faded colours of a 90s snapshot'**
  String get cameraPickerStyleSummerDescription;

  /// No description provided for @cameraPickerStyleNight.
  ///
  /// In en, this message translates to:
  /// **'Night 800'**
  String get cameraPickerStyleNight;

  /// No description provided for @cameraPickerStyleNightDescription.
  ///
  /// In en, this message translates to:
  /// **'Cinema film: teal shadows, warm light, lots of grain'**
  String get cameraPickerStyleNightDescription;

  /// No description provided for @cameraPickerStyleSepia.
  ///
  /// In en, this message translates to:
  /// **'Sepia'**
  String get cameraPickerStyleSepia;

  /// No description provided for @cameraPickerStyleSepiaDescription.
  ///
  /// In en, this message translates to:
  /// **'An old brown print from the shoebox'**
  String get cameraPickerStyleSepiaDescription;

  /// No description provided for @cameraPickerStyleLomo.
  ///
  /// In en, this message translates to:
  /// **'Lomo'**
  String get cameraPickerStyleLomo;

  /// No description provided for @cameraPickerStyleLomoDescription.
  ///
  /// In en, this message translates to:
  /// **'Bold colours, dark corners and a wild colour cast'**
  String get cameraPickerStyleLomoDescription;

  /// No description provided for @cameraPickerStyleMint.
  ///
  /// In en, this message translates to:
  /// **'Mint'**
  String get cameraPickerStyleMint;

  /// No description provided for @cameraPickerStyleMintDescription.
  ///
  /// In en, this message translates to:
  /// **'Soft and fresh with a green tint'**
  String get cameraPickerStyleMintDescription;

  /// No description provided for @cameraPickerStylePastel.
  ///
  /// In en, this message translates to:
  /// **'Pink'**
  String get cameraPickerStylePastel;

  /// No description provided for @cameraPickerStylePastelDescription.
  ///
  /// In en, this message translates to:
  /// **'Pastel colours with a pink glow and a white border'**
  String get cameraPickerStylePastelDescription;

  /// No description provided for @cameraPickerStyleSuper8.
  ///
  /// In en, this message translates to:
  /// **'Super 8'**
  String get cameraPickerStyleSuper8;

  /// No description provided for @cameraPickerStyleSuper8Description.
  ///
  /// In en, this message translates to:
  /// **'Grainy and soft, like an old home movie'**
  String get cameraPickerStyleSuper8Description;

  /// No description provided for @paywallBenefitGroup.
  ///
  /// In en, this message translates to:
  /// **'One Pro = Pro for the whole group'**
  String get paywallBenefitGroup;

  /// No description provided for @paywallBenefitUnlimited.
  ///
  /// In en, this message translates to:
  /// **'Unlimited members, photos kept forever'**
  String get paywallBenefitUnlimited;

  /// No description provided for @paywallBenefitQuality.
  ///
  /// In en, this message translates to:
  /// **'No watermark, original quality'**
  String get paywallBenefitQuality;

  /// No description provided for @paywallFreeTrial.
  ///
  /// In en, this message translates to:
  /// **'{period} free'**
  String paywallFreeTrial(String period);

  /// No description provided for @paywallPriceYear.
  ///
  /// In en, this message translates to:
  /// **'{price} per year.'**
  String paywallPriceYear(String price);

  /// No description provided for @paywallPriceYearTrial.
  ///
  /// In en, this message translates to:
  /// **'{period} free, then {price} per year.'**
  String paywallPriceYearTrial(String period, String price);

  /// No description provided for @paywallPriceMonth.
  ///
  /// In en, this message translates to:
  /// **'{price} per month.'**
  String paywallPriceMonth(String price);

  /// No description provided for @paywallPriceMonthTrial.
  ///
  /// In en, this message translates to:
  /// **'{period} free, then {price} per month.'**
  String paywallPriceMonthTrial(String period, String price);

  /// No description provided for @paywallAutoRenew.
  ///
  /// In en, this message translates to:
  /// **'Renews automatically. Cancel at least 24 hours before renewal in {store}.'**
  String paywallAutoRenew(String store);

  /// No description provided for @paywallDetailsTitle.
  ///
  /// In en, this message translates to:
  /// **'Everything in Pro'**
  String get paywallDetailsTitle;

  /// No description provided for @paywallBenefitStyles.
  ///
  /// In en, this message translates to:
  /// **'All camera styles'**
  String get paywallBenefitStyles;

  /// "Alle foto's" view: all photos the user made themselves, across every album
  ///
  /// In en, this message translates to:
  /// **'All photos'**
  String get allPhotosTitle;

  /// Home screen segmented control: the albums tab (the other tab is "Alle foto's")
  ///
  /// In en, this message translates to:
  /// **'Albums'**
  String get homeTabAlbums;

  /// No description provided for @allPhotosEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No photos yet'**
  String get allPhotosEmptyTitle;

  /// No description provided for @allPhotosEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'Open the camera and take your first photo.'**
  String get allPhotosEmptyMessage;

  /// No description provided for @allPhotosLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Your photos couldn\'t be loaded'**
  String get allPhotosLoadFailed;

  /// No description provided for @cameraSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Camera settings'**
  String get cameraSettingsTitle;

  /// No description provided for @cameraSettingsMore.
  ///
  /// In en, this message translates to:
  /// **'More settings'**
  String get cameraSettingsMore;

  /// No description provided for @cameraSettingsGrid.
  ///
  /// In en, this message translates to:
  /// **'Grid'**
  String get cameraSettingsGrid;

  /// No description provided for @cameraSettingsHaptics.
  ///
  /// In en, this message translates to:
  /// **'Vibrate on capture'**
  String get cameraSettingsHaptics;

  /// No description provided for @cameraSettingsDateStamp.
  ///
  /// In en, this message translates to:
  /// **'Date stamp bottom right'**
  String get cameraSettingsDateStamp;

  /// No description provided for @cameraSettingsSound.
  ///
  /// In en, this message translates to:
  /// **'Shutter sound'**
  String get cameraSettingsSound;

  /// No description provided for @cameraSettingsSoundHint.
  ///
  /// In en, this message translates to:
  /// **'Silent when your phone is on silent'**
  String get cameraSettingsSoundHint;

  /// No description provided for @cameraSettingsTimer.
  ///
  /// In en, this message translates to:
  /// **'Self-timer'**
  String get cameraSettingsTimer;

  /// No description provided for @cameraSettingsTimerOff.
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get cameraSettingsTimerOff;

  /// No description provided for @cameraSettingsTimerSeconds.
  ///
  /// In en, this message translates to:
  /// **'{seconds} s'**
  String cameraSettingsTimerSeconds(int seconds);

  /// No description provided for @cameraSettingsTimerCancelHint.
  ///
  /// In en, this message translates to:
  /// **'Tap the shutter to cancel'**
  String get cameraSettingsTimerCancelHint;

  /// No description provided for @cameraSettingsMirror.
  ///
  /// In en, this message translates to:
  /// **'Mirror selfies'**
  String get cameraSettingsMirror;

  /// No description provided for @cameraSettingsSaveToRoll.
  ///
  /// In en, this message translates to:
  /// **'Save to camera roll'**
  String get cameraSettingsSaveToRoll;

  /// No description provided for @cameraSettingsQuality.
  ///
  /// In en, this message translates to:
  /// **'Quality'**
  String get cameraSettingsQuality;

  /// No description provided for @cameraSettingsQualityStandard.
  ///
  /// In en, this message translates to:
  /// **'Standard'**
  String get cameraSettingsQualityStandard;

  /// No description provided for @cameraSettingsQualityHigh.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get cameraSettingsQualityHigh;

  /// No description provided for @cameraLowLightHint.
  ///
  /// In en, this message translates to:
  /// **'Low light - turn on the flash'**
  String get cameraLowLightHint;

  /// No description provided for @cameraFlashUnavailable.
  ///
  /// In en, this message translates to:
  /// **'This camera has no flash'**
  String get cameraFlashUnavailable;

  /// No description provided for @cameraFlashScreen.
  ///
  /// In en, this message translates to:
  /// **'Screen flash'**
  String get cameraFlashScreen;

  /// No description provided for @cameraFlashCycleHint.
  ///
  /// In en, this message translates to:
  /// **'Tap to switch between off, on and auto'**
  String get cameraFlashCycleHint;

  /// No description provided for @cameraFlip.
  ///
  /// In en, this message translates to:
  /// **'Switch between front and back camera'**
  String get cameraFlip;

  /// No description provided for @cameraFlipHint.
  ///
  /// In en, this message translates to:
  /// **'Double-tap the viewfinder to flip the camera'**
  String get cameraFlipHint;

  /// No description provided for @cameraPickerPaywallStyles.
  ///
  /// In en, this message translates to:
  /// **'All {count} cameras, including {styles}'**
  String cameraPickerPaywallStyles(int count, String styles);

  /// Name of the default camera style: a compact camera with direct flash on warm ISO 400 film. Keep the number 400.
  ///
  /// In en, this message translates to:
  /// **'Flash 400'**
  String get styleFlash;

  /// One-line description of the Flash 400 camera style.
  ///
  /// In en, this message translates to:
  /// **'Direct flash on warm film: amber glow, grain, rich reds'**
  String get styleFlashDescription;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'cs',
    'da',
    'de',
    'en',
    'es',
    'fi',
    'fr',
    'it',
    'ja',
    'ko',
    'nb',
    'nl',
    'pl',
    'pt',
    'sv',
    'tr',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'pt':
      {
        switch (locale.countryCode) {
          case 'BR':
            return AppLocalizationsPtBr();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'cs':
      return AppLocalizationsCs();
    case 'da':
      return AppLocalizationsDa();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fi':
      return AppLocalizationsFi();
    case 'fr':
      return AppLocalizationsFr();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'nb':
      return AppLocalizationsNb();
    case 'nl':
      return AppLocalizationsNl();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'sv':
      return AppLocalizationsSv();
    case 'tr':
      return AppLocalizationsTr();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
