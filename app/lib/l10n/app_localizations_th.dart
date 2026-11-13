// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get cancel => 'ยกเลิก';

  @override
  String get yes => 'ใช่';

  @override
  String inviteMessageIntro(String groupName) {
    return 'มาเข้าร่วม \"$groupName\" ใน CamTrip กัน แล้วเราจะเห็นรูปของกันและกันทันที';
  }

  @override
  String inviteMessageCode(String code) {
    return 'หรือใส่รหัส: $code';
  }

  @override
  String get memberFallbackName => 'เพื่อน';

  @override
  String get reportReasonInappropriate => 'ไม่เหมาะสมหรือไม่สุภาพ';

  @override
  String get reportReasonSpam => 'สแปม';

  @override
  String get reportReasonOther => 'อื่นๆ';

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
  String get errorOffline => 'ไม่มีการเชื่อมต่อ ลองอีกครั้งในอีกสักครู่';

  @override
  String errorSomethingWrongStatus(int status) {
    return 'เกิดข้อผิดพลาด ($status)';
  }

  @override
  String get errorSomethingWrong => 'เกิดข้อผิดพลาด';

  @override
  String get apiInvalidCredentials => 'อีเมลหรือรหัสผ่านไม่ถูกต้อง';

  @override
  String get apiInvalidCode => 'รหัสนี้ไม่ถูกต้องหรือหมดอายุแล้ว ขอรหัสใหม่';

  @override
  String get apiEmailTaken =>
      'มีบัญชีที่ใช้อีเมลนี้อยู่แล้ว เข้าสู่ระบบ หรือเลือก \"ลืมรหัสผ่าน?\"';

  @override
  String apiEmailTakenProvider(String provider) {
    return 'มีบัญชีที่ใช้อีเมลนี้อยู่แล้ว เข้าสู่ระบบด้วย $provider';
  }

  @override
  String apiWeakPassword(int min) {
    return 'ตั้งรหัสผ่านอย่างน้อย $min ตัวอักษร';
  }

  @override
  String apiNameTooLong(int max) {
    return 'ชื่อยาวได้ไม่เกิน $max ตัวอักษร';
  }

  @override
  String get apiRateLimited => 'ลองหลายครั้งเกินไป ลองอีกครั้งใน 15 นาที';

  @override
  String apiAccountBanned(String email) {
    return 'บัญชีของคุณถูกระงับ ติดต่อ $email หากคิดว่าเป็นความผิดพลาด';
  }

  @override
  String get apiProRequired => 'สไตล์กล้องนี้เป็นส่วนหนึ่งของ CamTrip Pro';

  @override
  String get apiGroupClosed => 'กลุ่มนี้ปิดแล้ว';

  @override
  String get apiGroupCodeNotFound => 'ไม่พบกลุ่มที่ใช้รหัสนี้';

  @override
  String apiGroupFull(int max) {
    return 'กลุ่มนี้เต็มแล้ว (สูงสุด $max คน) หากสมาชิกคนหนึ่งมี CamTrip Pro ใครก็เข้าร่วมได้';
  }

  @override
  String get apiLastMember => 'คุณเป็นสมาชิกคนสุดท้าย ลบกลุ่มแทนดีกว่า';

  @override
  String get apiAdminRequired => 'สำหรับผู้ดูแลระบบ CamTrip เท่านั้น';

  @override
  String get apiUploadIncomplete => 'การอัปโหลดยังไม่เสร็จ';

  @override
  String get apiInvalidInput => 'ข้อมูลไม่ถูกต้อง';

  @override
  String get apiNotSignedIn => 'ยังไม่ได้เข้าสู่ระบบ';

  @override
  String get apiAccountGone => 'บัญชีนี้ไม่มีอยู่แล้ว';

  @override
  String get apiPhotoNotFound => 'ไม่พบรูป';

  @override
  String get apiGroupNotFound => 'ไม่พบกลุ่ม';

  @override
  String get apiMemberNotFound => 'ไม่พบสมาชิก';

  @override
  String get apiPersonNotFound => 'ไม่พบบุคคลนี้';

  @override
  String get apiUserNotFound => 'ไม่พบผู้ใช้';

  @override
  String get apiAdminOnly => 'เฉพาะแอดมินเท่านั้นที่ทำได้';

  @override
  String get apiCannotBlockSelf => 'บล็อกตัวเองไม่ได้';

  @override
  String get apiCannotReportOwn => 'รายงานรูปของตัวเองไม่ได้';

  @override
  String get apiDeleteOwnOnly => 'ลบได้เฉพาะรูปของตัวเอง';

  @override
  String get apiOwnerCannotBeRemoved => 'นำผู้สร้างกลุ่มออกไม่ได้';

  @override
  String get apiOwnerStaysAdmin => 'ผู้สร้างกลุ่มเป็นแอดมินเสมอ';

  @override
  String get apiNeedsOneAdmin => 'กลุ่มต้องมีแอดมินอย่างน้อยหนึ่งคน';

  @override
  String get apiEndBeforeStart => 'วันสิ้นสุดอยู่ก่อนวันเริ่มต้น';

  @override
  String get apiPermanentNoEndDate => 'กลุ่มที่เปิดตลอดไม่มีวันสิ้นสุด';

  @override
  String get apiCannotBanAdmin => 'บล็อกผู้ดูแลระบบไม่ได้';

  @override
  String get apiReportNotFound => 'ไม่พบรายงาน';

  @override
  String get apiPhotoOwnerUnknown => 'ไม่ทราบแล้วว่าใครถ่ายรูปนี้';

  @override
  String get validationNameRequired => 'ใส่ชื่อของคุณ';

  @override
  String validationMaxChars(int max) {
    return 'ไม่เกิน $max ตัวอักษร';
  }

  @override
  String get validationEmailRequired => 'ใส่อีเมลของคุณ';

  @override
  String get validationEmailInvalid => 'อีเมลนี้ไม่ถูกต้อง';

  @override
  String get validationPasswordRequired => 'ตั้งรหัสผ่าน';

  @override
  String validationMinChars(int min) {
    return 'อย่างน้อย $min ตัวอักษร';
  }

  @override
  String get validationPasswordTooLong => 'รหัสผ่านนี้ยาวเกินไป';

  @override
  String get validationPasswordEmpty => 'ใส่รหัสผ่านของคุณ';

  @override
  String get validationCodeRequired => 'ใส่รหัสจากอีเมล';

  @override
  String get validationCodeDigits => 'รหัสมี 6 หลัก';

  @override
  String get onboarding1Title => 'ฟิล์มม้วนเดียว\nสำหรับทั้งแก๊ง';

  @override
  String get onboarding1Body =>
      'ถ่ายด้วยกล้องเรโทร ทุกคนเห็นรูปของคุณทันที และรูปก็อยู่ในอัลบั้มของคุณด้วย';

  @override
  String get onboarding2Title => 'ไม่ต้อง\nส่งรูปไปมาอีกแล้ว';

  @override
  String get onboarding2Body =>
      'สร้างกลุ่ม แชร์รหัส เสร็จ ไม่ต้องถามอีกว่า \"ส่งรูปพวกนั้นให้หน่อยได้ไหม?\"';

  @override
  String get onboarding3Title => 'วิดีโอสรุป\nหลังจบทริป';

  @override
  String get onboarding3Body =>
      'CamTrip ทำวิดีโอพร้อมเพลงจากช่วงเวลาที่ดีที่สุดของพวกคุณ';

  @override
  String get onboardingInvited => 'คุณได้รับคำเชิญ! เข้าสู่ระบบเพื่อเข้าร่วม';

  @override
  String get signInAppleFailed => 'เข้าสู่ระบบด้วย Apple ไม่สำเร็จ';

  @override
  String get signInGoogleFailed => 'เข้าสู่ระบบด้วย Google ไม่สำเร็จ';

  @override
  String get signInFailed => 'เข้าสู่ระบบไม่สำเร็จ';

  @override
  String get next => 'ถัดไป';

  @override
  String get legalPrefix => 'การดำเนินการต่อถือว่าคุณยอมรับ';

  @override
  String get legalTerms => 'ข้อกำหนด';

  @override
  String get legalAnd => ' และ';

  @override
  String get legalPrivacy => 'นโยบายความเป็นส่วนตัว';

  @override
  String get legalSuffix => '';

  @override
  String get continueWithApple => 'ดำเนินการต่อด้วย Apple';

  @override
  String get continueWithGoogle => 'ดำเนินการต่อด้วย Google';

  @override
  String get createAccount => 'สร้างบัญชี';

  @override
  String get signIn => 'เข้าสู่ระบบ';

  @override
  String get or => 'หรือ';

  @override
  String get registerSubtitle => 'เพื่อให้เพื่อนรู้ว่าใครเป็นคนถ่ายรูป';

  @override
  String get loginSubtitle => 'ยินดีต้อนรับกลับมา';

  @override
  String get forgotPasswordTitle => 'ลืมรหัสผ่าน';

  @override
  String get forgotPasswordPushSubtitle =>
      'ยังเข้าสู่ระบบอยู่ที่อื่นไหม? เราจะส่งรหัส 6 หลักไปที่นั่นเป็นการแจ้งเตือนแบบพุช เพื่อให้คุณตั้งรหัสผ่านใหม่ได้';

  @override
  String get newPassword => 'รหัสผ่านใหม่';

  @override
  String get resetPushInfo =>
      'หากคุณยังเข้าสู่ระบบอยู่ที่อื่น คุณจะได้รับการแจ้งเตือนแบบพุชพร้อมรหัสที่นั่น เข้าไม่ได้? เข้าสู่ระบบด้วย Apple หรือ Google โดยใช้อีเมลเดียวกัน - บัญชีของคุณจะถูกเชื่อมกัน';

  @override
  String get sendCode => 'ส่งรหัส';

  @override
  String get savePassword => 'บันทึกรหัสผ่าน';

  @override
  String get errorTryAgain => 'เกิดข้อผิดพลาด โปรดลองอีกครั้ง';

  @override
  String get back => 'กลับ';

  @override
  String get name => 'ชื่อ';

  @override
  String get email => 'อีเมล';

  @override
  String get codeFromPush => 'รหัสจากการแจ้งเตือน';

  @override
  String get password => 'รหัสผ่าน';

  @override
  String get hidePassword => 'ซ่อนรหัสผ่าน';

  @override
  String get showPassword => 'แสดงรหัสผ่าน';

  @override
  String get forgotPasswordLink => 'ลืมรหัสผ่าน?';

  @override
  String get haveAccount => 'มีบัญชีอยู่แล้ว?';

  @override
  String get newToCamTrip => 'เพิ่งเคยใช้ CamTrip?';

  @override
  String get rememberedIt => 'นึกออกแล้ว?';

  @override
  String get noCodeReceived => 'ไม่ได้รับรหัส?';

  @override
  String get resendCode => 'ส่งอีกครั้ง';

  @override
  String onboardingDemoRoll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ช่างภาพ $count คน ฟิล์ม 1 ม้วน',
    );
    return '$_temp0';
  }

  @override
  String membersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'สมาชิก $count คน',
    );
    return '$_temp0';
  }

  @override
  String photosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count รูป',
    );
    return '$_temp0';
  }

  @override
  String videosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count วิดีโอ',
    );
    return '$_temp0';
  }

  @override
  String get justNow => 'เมื่อสักครู่';

  @override
  String get badgeNew => 'ใหม่';

  @override
  String recapTitle(String groupName) {
    return 'สรุป $groupName';
  }

  @override
  String get styleFilm => 'ฟิล์ม';

  @override
  String get styleInstant => 'อินสแตนท์';

  @override
  String get styleDisposable => 'ใช้แล้วทิ้ง';

  @override
  String get styleBw => 'ขาวดำ';

  @override
  String get styleGolden => 'โกลเด้น';

  @override
  String get styleChrome => 'โครม';

  @override
  String get styleFilmDescription => 'สีโทนอุ่น เกรน และวันที่สีส้ม';

  @override
  String get styleInstantDescription => 'สีนุ่มนวลและขอบขาว';

  @override
  String get styleDisposableDescription => 'แฟลชแรง ขอบมืด และแสงรั่ว';

  @override
  String get styleBwDescription => 'ขาวดำมีเกรน คอนทราสต์ลึก';

  @override
  String get styleGoldenDescription => 'โกลเด้นอาวร์ตลอดเวลา แสงทองนุ่มนวล';

  @override
  String get styleChromeDescription => 'โทนเย็น สีสด และคมชัด เหมือนฟิล์มสไลด์';

  @override
  String get shutterStopRecording => 'หยุดบันทึก';

  @override
  String get shutterStartRecording => 'เริ่มบันทึกวิดีโอ';

  @override
  String get shutterTakePhoto => 'ถ่ายรูป';

  @override
  String get modePhoto => 'รูป';

  @override
  String get modeVideo => 'วิดีโอ';

  @override
  String get cameraNotFound => 'ไม่พบกล้อง';

  @override
  String get cameraAccessNeeded =>
      'CamTrip ต้องการเข้าถึงกล้อง เปิดได้ในการตั้งค่า';

  @override
  String get cameraStartFailed => 'เปิดกล้องไม่ได้';

  @override
  String get albumAccessNeeded =>
      'อนุญาตให้ CamTrip เข้าถึงรูปภาพ เพื่อบันทึกรูปลงอัลบั้มของคุณด้วย';

  @override
  String get albumSaveFailed => 'บันทึกลงอัลบั้มไม่สำเร็จ แต่รูปยังแชร์อยู่';

  @override
  String styleProFallback(String style) {
    return 'สไตล์นี้เป็นส่วนหนึ่งของ Pro ในกลุ่มนี้คุณถ่ายด้วย $style';
  }

  @override
  String get photoFailed => 'ถ่ายรูปไม่สำเร็จ โปรดลองอีกครั้ง';

  @override
  String get recordingFailed => 'บันทึกวิดีโอไม่สำเร็จ';

  @override
  String get videoFailed => 'สร้างวิดีโอไม่สำเร็จ โปรดลองอีกครั้ง';

  @override
  String get shootInGroup => 'ถ่ายลงกลุ่ม';

  @override
  String get close => 'ปิด';

  @override
  String get flash => 'แฟลช';

  @override
  String get flashOn => 'เปิด';

  @override
  String get flashOff => 'ปิด';

  @override
  String get flashAuto => 'อัตโนมัติ';

  @override
  String get chooseGroup => 'เลือกกลุ่ม';

  @override
  String get switchCamera => 'สลับกล้อง';

  @override
  String get createOrJoinFirst => 'สร้างหรือเข้าร่วมกลุ่มก่อน';

  @override
  String get proViaGroup => 'Pro ผ่านกลุ่ม';

  @override
  String proViaName(String name) {
    return 'Pro จาก $name';
  }

  @override
  String get proStylesFreeViaMember =>
      'สไตล์ Pro ในกลุ่มนี้ใช้ได้ฟรี เพราะมีสมาชิกที่เป็น Pro';

  @override
  String proStylesFreeViaName(String name) {
    return 'สไตล์ Pro ในกลุ่มนี้: ใช้ฟรีเพราะ $name';
  }

  @override
  String get subscriptionsUnavailable =>
      'ตอนนี้ยังสมัครสมาชิกไม่ได้ โปรดลองอีกครั้งภายหลัง';

  @override
  String get paymentPending =>
      'การชำระเงินกำลังดำเนินการ Pro จะเปิดใช้ทันทีที่เสร็จ';

  @override
  String get purchaseFailed => 'ซื้อไม่สำเร็จ โปรดลองอีกครั้งภายหลัง';

  @override
  String get restoreUnavailable =>
      'ตอนนี้กู้คืนการซื้อไม่ได้ โปรดลองอีกครั้งภายหลัง';

  @override
  String get restoreFailed => 'กู้คืนไม่สำเร็จ โปรดลองอีกครั้งภายหลัง';

  @override
  String get welcomePro => 'ยินดีต้อนรับสู่ CamTrip Pro! 🎉';

  @override
  String get proRestored => 'กู้คืน Pro แล้ว';

  @override
  String get noPurchaseFound => 'ไม่พบการซื้อก่อนหน้า';

  @override
  String periodDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count วัน',
    );
    return '$_temp0';
  }

  @override
  String periodWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count สัปดาห์',
    );
    return '$_temp0';
  }

  @override
  String periodMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count เดือน',
    );
    return '$_temp0';
  }

  @override
  String periodYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ปี',
    );
    return '$_temp0';
  }

  @override
  String get paywallHavePro => 'คุณมี CamTrip Pro แล้ว';

  @override
  String get paywallSubtitle => 'ทุกอย่างสำหรับทริปถัดไปของคุณ';

  @override
  String paywallFeatureStyles(String styles) {
    return 'สไตล์กล้องทั้งหมด ($styles)';
  }

  @override
  String get paywallFeatureUnlimited =>
      'สมาชิกและพื้นที่ไม่จำกัด เก็บรูปไว้ตลอดไป';

  @override
  String get paywallFeatureNoWatermark => 'วิดีโอสรุปไม่มีลายน้ำ';

  @override
  String get paywallFeatureOriginal => 'ดาวน์โหลดคุณภาพต้นฉบับ';

  @override
  String get planYear => 'รายปี';

  @override
  String get planMonth => 'รายเดือน';

  @override
  String pricePerMonth(String price) {
    return '$price ต่อเดือน';
  }

  @override
  String paywallSaveBadge(int percent) {
    return 'ประหยัด $percent%';
  }

  @override
  String get planMonthCancelAnytime => 'ยกเลิกได้ทุกเมื่อ';

  @override
  String tryFree(String period) {
    return 'ทดลองใช้ฟรี $period';
  }

  @override
  String get becomePro => 'อัปเกรดเป็น Pro';

  @override
  String get subscriptionsLoadFailed => 'โหลดแพ็กเกจไม่ได้ ตรวจสอบการเชื่อมต่อ';

  @override
  String legalAnnual(String price) {
    return 'CamTrip Pro แบบรายปี: $price ต่อปี';
  }

  @override
  String legalAnnualTrial(String period, String price) {
    return 'CamTrip Pro แบบรายปี: ฟรี $period จากนั้น $price ต่อปี';
  }

  @override
  String legalMonthly(String price) {
    return 'CamTrip Pro แบบรายเดือน: $price ต่อเดือน';
  }

  @override
  String legalMonthlyTrial(String period, String price) {
    return 'CamTrip Pro แบบรายเดือน: ฟรี $period จากนั้น $price ต่อเดือน';
  }

  @override
  String get legalBillingApple =>
      'ระบบจะเรียกเก็บเงินจาก Apple ID ของคุณ การสมัครสมาชิกจะต่ออายุอัตโนมัติ เว้นแต่คุณยกเลิกอย่างน้อย 24 ชั่วโมงก่อนสิ้นสุดรอบ คุณยกเลิกและจัดการได้ในการตั้งค่าบัญชี App Store';

  @override
  String get legalBillingGoogle =>
      'ระบบจะเรียกเก็บเงินจากบัญชี Google ของคุณ การสมัครสมาชิกจะต่ออายุอัตโนมัติ เว้นแต่คุณยกเลิกอย่างน้อย 24 ชั่วโมงก่อนสิ้นสุดรอบ คุณยกเลิกและจัดการได้ในการตั้งค่าบัญชี Google Play';

  @override
  String get restorePurchases => 'กู้คืนการซื้อ';

  @override
  String get terms => 'ข้อกำหนด';

  @override
  String get privacy => 'ความเป็นส่วนตัว';

  @override
  String get groupProTitle => 'Pro หนึ่งคนในกลุ่ม = Pro สำหรับทุกคนในกลุ่มนั้น';

  @override
  String get groupProBody =>
      'หากมีคนหนึ่งเป็น Pro ทั้งกลุ่มจะได้สไตล์กล้องทั้งหมด สมาชิกไม่จำกัด เก็บรูปไว้ได้ คุณภาพต้นฉบับ และวิดีโอสรุปไม่มีลายน้ำ';

  @override
  String get groupCreated => 'สร้างกลุ่มแล้ว ✓';

  @override
  String get inviteFriends => 'ชวนเพื่อน';

  @override
  String get codeCopied => 'คัดลอกรหัสแล้ว';

  @override
  String get shareLink => 'แชร์ลิงก์';

  @override
  String inviteSubject(String groupName) {
    return 'เข้าร่วม $groupName ใน CamTrip';
  }

  @override
  String inviteMembersUnlimited(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'สมาชิก $count คน',
    );
    return '$_temp0 · ไม่จำกัด (Pro)';
  }

  @override
  String inviteMembersLimit(int count, int limit) {
    return 'สมาชิก $count จาก $limit คน · Pro: ไม่จำกัด';
  }

  @override
  String get toCamera => 'ไปที่กล้อง';

  @override
  String get done => 'เสร็จ';

  @override
  String get joinEnterCode => 'ใส่รหัส 6 ตัว';

  @override
  String get joinGroupTitle => 'เข้าร่วมกลุ่ม';

  @override
  String get joinGroupSubtitle => 'ใส่รหัสของเพื่อน หรือสแกนคิวอาร์โค้ด';

  @override
  String get typeCode => 'พิมพ์รหัส';

  @override
  String get scanQr => 'สแกน QR';

  @override
  String get join => 'เข้าร่วม';

  @override
  String get groupNameRequired => 'ตั้งชื่อกลุ่ม';

  @override
  String get newGroup => 'กลุ่มใหม่';

  @override
  String get groupType => 'ประเภทกลุ่ม';

  @override
  String get groupTypeVacation => 'วันหยุด';

  @override
  String get groupTypeVacationDescription =>
      'มีวันเริ่มต้นและวันสิ้นสุด จากนั้นจะถูกเก็บถาวร';

  @override
  String get groupTypeEvent => 'อีเวนต์';

  @override
  String get groupTypeEventDescription => 'หนึ่งวันหรือหนึ่งคืน เช่น ปาร์ตี้';

  @override
  String get groupTypePermanent => 'เปิดตลอด';

  @override
  String get groupTypePermanentDescription => 'สำหรับแก๊งเพื่อนประจำ';

  @override
  String get date => 'วันที่';

  @override
  String get departure => 'ออกเดินทาง';

  @override
  String get returnDate => 'เดินทางกลับ';

  @override
  String get defaultCameraStyle => 'สไตล์กล้องเริ่มต้น';

  @override
  String freeLimitPermanent(int max) {
    return 'ฟรี: สูงสุด $max คน ไม่จำกัดเมื่อใช้ Pro';
  }

  @override
  String freeLimitDated(int max, int days) {
    return 'ฟรี: สูงสุด $max คน เก็บรูปไว้ $days วันหลังวันสิ้นสุด ไม่จำกัดและตลอดไปเมื่อใช้ Pro';
  }

  @override
  String get createGroup => 'สร้างกลุ่ม';

  @override
  String get group => 'กลุ่ม';

  @override
  String groupCode(String code) {
    return 'รหัส $code';
  }

  @override
  String get manage => 'จัดการ';

  @override
  String get rename => 'เปลี่ยนชื่อ';

  @override
  String get changeDates => 'เปลี่ยนวันที่';

  @override
  String get finishTrip => 'จบทริป';

  @override
  String get finishTripSubtitle => 'ตั้งวันสิ้นสุดเป็นวันนี้';

  @override
  String get reopenGroup => 'เปิดกลุ่มอีกครั้ง';

  @override
  String get closeGroup => 'ปิดกลุ่ม';

  @override
  String get reopenGroupSubtitle => 'สมาชิกเพิ่มรูปได้อีกครั้ง';

  @override
  String get closeGroupSubtitle => 'ไม่มีใครเพิ่มรูปได้อีก แต่ยังดูทุกอย่างได้';

  @override
  String get members => 'สมาชิก';

  @override
  String memberYou(String name) {
    return '$name (คุณ)';
  }

  @override
  String get blockedTag => 'บล็อกแล้ว';

  @override
  String get adminTag => 'แอดมิน';

  @override
  String removeMemberTitle(String name) {
    return 'นำ $name ออก?';
  }

  @override
  String get removeMemberMessage => 'รูปของคนนี้ยังอยู่ในกลุ่ม';

  @override
  String get remove => 'ลบ';

  @override
  String get removeMember => 'นำออก';

  @override
  String blockTitle(String name) {
    return 'บล็อก $name?';
  }

  @override
  String blockMessage(String name) {
    return 'คุณจะไม่เห็นรูปและวิดีโอจาก $name และไม่ได้รับการแจ้งเตือนเกี่ยวกับสิ่งเหล่านั้นอีก ยกเลิกได้ในการตั้งค่า';
  }

  @override
  String get block => 'บล็อก';

  @override
  String get makeMember => 'ตั้งเป็นสมาชิกทั่วไป';

  @override
  String get makeAdmin => 'ตั้งเป็นแอดมิน';

  @override
  String get removeFromGroup => 'นำออกจากกลุ่ม';

  @override
  String get unblock => 'เลิกบล็อก';

  @override
  String get inviteFriendsButton => 'ชวนเพื่อน';

  @override
  String get you => 'คุณ';

  @override
  String get unarchive => 'นำออกจากที่เก็บถาวร';

  @override
  String get archive => 'เก็บถาวร';

  @override
  String get unarchiveSubtitle => 'กลุ่มกลับมาอยู่กับอัลบั้มของคุณแล้ว';

  @override
  String archiveSubtitle(String section) {
    return 'เฉพาะคุณ: กลุ่มจะย้ายไปที่ \"$section\" ด้านล่างอัลบั้มของคุณ';
  }

  @override
  String get archivedSection => 'เก็บถาวรแล้ว';

  @override
  String get hiddenPhotos => 'รูปที่ซ่อน';

  @override
  String get hiddenPhotosSubtitle => 'รูปที่คุณซ่อนไว้สำหรับตัวเอง';

  @override
  String get leaveGroup => 'ออกจากกลุ่ม';

  @override
  String get leaveGroupSubtitle => 'รูปของคุณยังอยู่ในกลุ่มสำหรับคนอื่น';

  @override
  String get deleteGroup => 'ลบกลุ่ม';

  @override
  String get deleteGroupSubtitle => 'รูปทั้งหมดจะถูกลบสำหรับทุกคน';

  @override
  String groupArchived(String groupName) {
    return 'เก็บ \"$groupName\" ถาวรแล้ว';
  }

  @override
  String groupUnarchived(String groupName) {
    return '\"$groupName\" กลับมาอยู่กับอัลบั้มของคุณแล้ว';
  }

  @override
  String get undo => 'เลิกทำ';

  @override
  String get groupNameTitle => 'ชื่อกลุ่ม';

  @override
  String get finishTripTitle => 'จบทริป?';

  @override
  String get finishTripMessage =>
      'วันสิ้นสุดจะเป็นวันนี้ ยังเพิ่มรูปได้ วิดีโอสรุปพร้อมแล้ว';

  @override
  String get finishTripConfirm => 'จบทริป';

  @override
  String get tripFinished => 'จบทริปแล้ว';

  @override
  String leaveGroupTitle(String groupName) {
    return 'ออกจาก \"$groupName\"?';
  }

  @override
  String get leaveGroupMessage =>
      'รูปของคุณยังอยู่ในกลุ่มสำหรับคนอื่น คุณกลับเข้าร่วมได้ภายหลังด้วยรหัส';

  @override
  String get leave => 'ออก';

  @override
  String groupDeleted(String groupName) {
    return 'ลบ \"$groupName\" แล้ว';
  }

  @override
  String get youAreAdmin => 'คุณเป็นแอดมิน';

  @override
  String get open => 'เปิด';

  @override
  String get archiveMenuSubtitle => 'เฉพาะคุณ คนอื่นจะไม่รู้';

  @override
  String get deleteGroupMenuSubtitle => 'สำหรับทุกคน พร้อมรูปทั้งหมด';

  @override
  String get deleteGroupTitle => 'ลบกลุ่ม?';

  @override
  String deleteGroupMessage(int count, String groupName, int memberCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'รูปและวิดีโอทั้งหมด $count รายการ',
    );
    String _temp1 = intl.Intl.pluralLogic(
      memberCount,
      locale: localeName,
      other: 'สมาชิกทั้ง $memberCount คน',
    );
    return '$_temp0ใน \"$groupName\" จะหายไปสำหรับ$_temp1 ยกเลิกไม่ได้';
  }

  @override
  String get deleteGroupOwnRoll => 'คลังรูปในเครื่องของคุณไม่เปลี่ยนแปลง';

  @override
  String get deleteGroupTypeName => 'พิมพ์ชื่อกลุ่มเพื่อยืนยัน:';

  @override
  String get deleteForEveryone => 'ลบสำหรับทุกคน';

  @override
  String get save => 'บันทึก';

  @override
  String get yourAlbums => 'อัลบั้มของคุณ';

  @override
  String get uploadQueue => 'คิวอัปโหลด';

  @override
  String get noConnection => 'ไม่มีการเชื่อมต่อ';

  @override
  String get albumsOfflineMessage =>
      'อัลบั้มจะโหลดเมื่อคุณกลับมาออนไลน์ กล้องยังใช้งานได้';

  @override
  String get retry => 'ลองอีกครั้ง';

  @override
  String get noAlbumsTitle => 'ยังไม่มีอัลบั้ม';

  @override
  String get noAlbumsMessage =>
      'สร้างกลุ่มสำหรับทริปถัดไป หรือเข้าร่วมกลุ่มของเพื่อนด้วยรหัส';

  @override
  String get haveCode => 'ฉันมีรหัส';

  @override
  String get joinWithCode => 'เข้าร่วมด้วยรหัสหรือคิวอาร์โค้ด';

  @override
  String get camera => 'กล้อง';

  @override
  String get restore => 'กู้คืน';

  @override
  String get more => 'เพิ่มเติม';

  @override
  String get newAlbum => 'ใหม่';

  @override
  String get closedTag => 'ปิดแล้ว';

  @override
  String get activeTag => 'ใช้งานอยู่';

  @override
  String get uploadFailed => 'อัปโหลดไม่สำเร็จ';

  @override
  String get queueNoSignal => 'ไม่มีสัญญาณ';

  @override
  String get queueNoSignalMessage =>
      'รูปของคุณอยู่ในอัลบั้มแล้ว และจะแชร์ทันทีที่คุณกลับมาออนไลน์';

  @override
  String get queueWaitingForWifi => 'กำลังรอ Wi-Fi';

  @override
  String queueWifiOnlyOn(String setting) {
    return 'คุณเปิด \"$setting\" อยู่';
  }

  @override
  String get queueVideosWifiOnly => 'วิดีโอส่งผ่าน Wi-Fi เท่านั้น';

  @override
  String get queueAllShared => 'แชร์ทั้งหมดแล้ว ✓';

  @override
  String queuePending(String items) {
    return 'เหลือ $items ที่ต้องแชร์';
  }

  @override
  String queuePendingBoth(String photos, String videos) {
    return 'เหลือ $photos และ $videos ที่ต้องแชร์';
  }

  @override
  String get retryUpload => 'ลองอีกครั้ง';

  @override
  String get removeFromQueue => 'นำออกจากคิว';

  @override
  String get queueStatusWifi => 'Wi-Fi';

  @override
  String get queueStatusWaiting => 'กำลังรอ';

  @override
  String get videosWifiOnlyTitle => 'วิดีโอผ่าน Wi-Fi เท่านั้น';

  @override
  String get videosWifiOnlySubtitle => 'ประหยัดอินเทอร์เน็ตมือถือ';

  @override
  String get retryNow => 'ลองตอนนี้';

  @override
  String get yourName => 'ชื่อของคุณ';

  @override
  String get settings => 'การตั้งค่า';

  @override
  String get tapToChangeName => 'แตะเพื่อเปลี่ยนชื่อ';

  @override
  String get getCamTripPro => 'รับ CamTrip Pro';

  @override
  String get photos => 'รูป';

  @override
  String get saveOwnPhotos => 'บันทึกรูปของฉันลงอัลบั้มแยกตามกลุ่ม';

  @override
  String get autoSaveOthers => 'บันทึกรูปของคนอื่นอัตโนมัติ';

  @override
  String get wifiOnlyTitle => 'อัปโหลดผ่าน Wi-Fi เท่านั้น';

  @override
  String get dateStamp => 'ประทับวันที่';

  @override
  String get notifications => 'การแจ้งเตือน';

  @override
  String get notifyNewPhotos => 'รูปใหม่ (รวมกัน)';

  @override
  String get notifyRecapReady => 'วิดีโอสรุปพร้อมแล้ว';

  @override
  String get camTripTeam => 'ทีม CamTrip';

  @override
  String get adminEntrySubtitle => 'ผู้ใช้ การให้ Pro รายงาน และสถิติ';

  @override
  String get account => 'บัญชี';

  @override
  String get manageSubscription => 'จัดการการสมัครสมาชิก';

  @override
  String get blockedPeople => 'คนที่บล็อก';

  @override
  String get nobody => 'ไม่มี';

  @override
  String peopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count คน',
    );
    return '$_temp0';
  }

  @override
  String get privacyPolicy => 'นโยบายความเป็นส่วนตัว';

  @override
  String get contact => 'ติดต่อ';

  @override
  String get signOut => 'ออกจากระบบ';

  @override
  String get deleteAccount => 'ลบบัญชี';

  @override
  String get deleteAccountSubtitle => 'ลบบัญชีและรูปทั้งหมดของคุณ';

  @override
  String get deleteAccountTitle => 'ลบบัญชี?';

  @override
  String get deleteAccountMessage =>
      'บัญชีของคุณรวมถึงรูปและวิดีโอทั้งหมดจะถูกลบ รวมถึงในกลุ่มด้วย ยกเลิกการสมัครสมาชิกที่ใช้งานอยู่ใน App Store หรือ Google Play';

  @override
  String get blockedTitle => 'ที่บล็อกไว้';

  @override
  String get blockedSubtitle => 'คุณจะไม่เห็นรูปจากคนเหล่านี้';

  @override
  String get blockedNone => 'คุณยังไม่ได้บล็อกใคร';

  @override
  String get unblockShort => 'เลิกบล็อก';

  @override
  String get groupGone => 'กลุ่มนี้ไม่มีอยู่แล้ว หรือคุณไม่ได้เป็นสมาชิกแล้ว';

  @override
  String photosSavedToAlbum(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'บันทึก $count รูปลง \"$album\" แล้ว',
    );
    return '$_temp0';
  }

  @override
  String photosDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ลบ $count รูปแล้ว',
    );
    return '$_temp0';
  }

  @override
  String photosDeletedSkipped(int count, int skipped) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ลบ $count รูปแล้ว',
    );
    return '$_temp0 ข้าม $skipped';
  }

  @override
  String photosHiddenForYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ซ่อน $count รูปสำหรับคุณแล้ว',
    );
    return '$_temp0';
  }

  @override
  String get addedToFavorites => 'เพิ่มในรายการโปรดแล้ว';

  @override
  String get removedFromFavorites => 'นำออกจากรายการโปรดแล้ว';

  @override
  String get photoAccessSettings =>
      'อนุญาตให้ CamTrip เข้าถึงรูปภาพในการตั้งค่า';

  @override
  String photosBeingAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'กำลังเพิ่ม $count รูป',
    );
    return '$_temp0';
  }

  @override
  String photosUnreadable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'อ่าน $count รูปไม่ได้',
    );
    return '$_temp0';
  }

  @override
  String get groupNotLoaded => 'ยังโหลดกลุ่มไม่ได้';

  @override
  String get noFavoritesTitle => 'ยังไม่มีรายการโปรด';

  @override
  String get noPhotosTitle => 'ยังไม่มีรูป';

  @override
  String get noFavoritesMessage => 'แตะดาวบนรูปเพื่อเพิ่มมาไว้ที่นี่';

  @override
  String get noPhotosMessage => 'ถ่ายรูปแรกเลย ทุกคนในกลุ่มจะเห็นทันที';

  @override
  String get openCamera => 'เปิดกล้อง';

  @override
  String savingProgress(int done, int total) {
    return 'กำลังบันทึก... $done/$total';
  }

  @override
  String get sharePreparing => 'กำลังเตรียม...';

  @override
  String sharingProgress(int done, int total) {
    return 'กำลังเตรียม... $done/$total';
  }

  @override
  String get choosePhotos => 'เลือกรูป';

  @override
  String selectedCount(int count) {
    return 'เลือกแล้ว $count';
  }

  @override
  String get selectNone => 'ไม่เลือก';

  @override
  String get selectAll => 'เลือกทั้งหมด';

  @override
  String photosWaitingToShare(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count รูปรอแชร์',
    );
    return '$_temp0';
  }

  @override
  String get recapReadyTitle => 'วิดีโอสรุปของคุณพร้อมแล้ว';

  @override
  String get recapReadySubtitle => 'วิดีโอพร้อมเพลงจากทริปของคุณ';

  @override
  String get watch => 'ดู';

  @override
  String get makeRecapNow => 'ทำวิดีโอสรุปตอนนี้';

  @override
  String freeGroupDeleteNotice(String date) {
    return 'กลุ่มฟรี: เก็บรูปไว้ถึง $date บันทึกไว้หรืออัปเกรดเป็น Pro';
  }

  @override
  String get filterAll => 'ทั้งหมด';

  @override
  String get filterFavorites => 'รายการโปรด';

  @override
  String get filterPerPerson => 'ตามคน';

  @override
  String get filterPerson => 'คน';

  @override
  String get select => 'เลือก';

  @override
  String get hiddenFilter => 'ที่ซ่อน';

  @override
  String get photosBy => 'รูปของ...';

  @override
  String get uploadedTag => 'อัปโหลดแล้ว';

  @override
  String get saveAll => 'บันทึกทั้งหมด';

  @override
  String get favorite => 'รายการโปรด';

  @override
  String get unfavorite => 'เลิกโปรด';

  @override
  String get hide => 'ซ่อน';

  @override
  String get delete => 'ลบ';

  @override
  String deletePhotosTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ลบ $count รูป?',
      one: 'ลบรูป?',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'รูปจะหายไปสำหรับทุกคนในกลุ่ม ยกเลิกไม่ได้',
    );
    return '$_temp0';
  }

  @override
  String deletePhotosNotAllowed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count รูปเป็นของคนอื่น รูปจะยังอยู่ เฉพาะแอดมินเท่านั้นที่ลบได้',
    );
    return '$_temp0';
  }

  @override
  String photosBackInGroup(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count รูปกลับมาในกลุ่มแล้ว',
    );
    return '$_temp0';
  }

  @override
  String get showAll => 'แสดงทั้งหมด';

  @override
  String get hiddenPhotosExplainer =>
      'มีแค่คุณที่ไม่เห็นรูปเหล่านี้ สำหรับคนอื่นในกลุ่มรูปยังอยู่';

  @override
  String get nothingHidden => 'ไม่มีอะไรถูกซ่อน';

  @override
  String get nothingHiddenMessage => 'รูปที่คุณซ่อนจะแสดงที่นี่';

  @override
  String showAgainCount(int count) {
    return 'แสดงอีกครั้ง ($count)';
  }

  @override
  String get someone => 'ใครบางคน';

  @override
  String get savedToAlbum => 'บันทึกลงอัลบั้มรูปแล้ว';

  @override
  String get share => 'แชร์';

  @override
  String get shareFailed => 'แชร์ไม่สำเร็จ';

  @override
  String get reportTitle => 'ทำไมคุณถึงรายงานรูปนี้?';

  @override
  String get reportSubtitle =>
      'เราตรวจสอบทุกรายงานภายใน 24 ชั่วโมง รูปจะถูกซ่อนสำหรับคุณทันที';

  @override
  String get reportThanks => 'ขอบคุณ เราจะตรวจสอบให้';

  @override
  String blockMessageAllGroups(String name) {
    return 'คุณจะไม่เห็นรูปและวิดีโอจาก $name ในกลุ่มใดๆ และไม่ได้รับการแจ้งเตือนเกี่ยวกับสิ่งเหล่านั้นอีก ยกเลิกได้ในการตั้งค่า';
  }

  @override
  String userBlocked(String name) {
    return 'บล็อก $name แล้ว';
  }

  @override
  String get videoHiddenForYou => 'ซ่อนวิดีโอสำหรับคุณแล้ว';

  @override
  String get photoHiddenForYou => 'ซ่อนรูปสำหรับคุณแล้ว';

  @override
  String get setAsCover => 'ตั้งเป็นปก';

  @override
  String get coverUpdated => 'อัปเดตรูปปกแล้ว';

  @override
  String get hideForMe => 'ซ่อนสำหรับฉัน';

  @override
  String get hideForMeSubtitle => 'คนอื่นในกลุ่มยังเห็นอยู่';

  @override
  String get reportPhoto => 'รายงานรูป';

  @override
  String blockName(String name) {
    return 'บล็อก $name';
  }

  @override
  String get forEveryoneInGroup => 'สำหรับทุกคนในกลุ่ม';

  @override
  String get videoDeleted => 'ลบวิดีโอแล้ว';

  @override
  String get photoDeleted => 'ลบรูปแล้ว';

  @override
  String get photoAccessToSave =>
      'อนุญาตให้ CamTrip เข้าถึงรูปภาพในการตั้งค่าเพื่อบันทึกรูป';

  @override
  String get phoneFull => 'พื้นที่โทรศัพท์เต็ม';

  @override
  String get albumSaveFailedShort => 'บันทึกลงอัลบั้มไม่สำเร็จ';

  @override
  String get recapTemplateGoldenHour => 'โกลเด้นอาวร์';

  @override
  String get recapTemplateFast => 'เร็ว';

  @override
  String get recapTemplateFilmRoll => 'ม้วนฟิล์ม';

  @override
  String get recapTemplatePolaroid => 'โพลารอยด์';

  @override
  String get trackSummerEvening => 'เย็นฤดูร้อน';

  @override
  String get trackGoldenHour => 'โกลเด้นอาวร์';

  @override
  String get trackRoadtrip => 'โรดทริป';

  @override
  String get moodWarm => 'อบอุ่น';

  @override
  String get moodCheerful => 'สดใส';

  @override
  String friendsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'เพื่อน $count คน',
    );
    return '$_temp0';
  }

  @override
  String get madeWithCamTrip => 'สร้างด้วย CamTrip';

  @override
  String get tagline => 'ฟิล์มม้วนเดียวสำหรับทั้งแก๊ง';

  @override
  String get videoUnsupportedDevice => 'สร้างวิดีโอบนอุปกรณ์นี้ไม่ได้';

  @override
  String get groupLoadFailed => 'โหลดกลุ่มนี้ไม่ได้';

  @override
  String recapNeedsPhotos(int count) {
    return 'ต้องมีอย่างน้อย $count รูปเพื่อทำวิดีโอสรุป';
  }

  @override
  String get recapFailed => 'สร้างวิดีโอสรุปไม่สำเร็จ โปรดลองอีกครั้ง';

  @override
  String get recapSaved => 'บันทึกวิดีโอสรุปลงอัลบั้มรูปแล้ว';

  @override
  String get recap => 'สรุป';

  @override
  String get recapRendering => 'กำลังทำวิดีโอสรุป...';

  @override
  String get videoRendering => 'กำลังทำวิดีโอ...';

  @override
  String get template => 'เทมเพลต';

  @override
  String get musicLicense => 'เพลงของ CamTrip เอง · ไม่มีค่าลิขสิทธิ์';

  @override
  String get change => 'เปลี่ยน';

  @override
  String get noWatermark => 'ไม่มีลายน้ำ ✓';

  @override
  String get removeWatermarkPro => 'ลบลายน้ำด้วย Pro';

  @override
  String get proSourceSubscription => 'สมัครสมาชิก';

  @override
  String get proSourceGift => 'ของขวัญ';

  @override
  String get proSourceAdmin => 'แอดมิน';

  @override
  String get proSourceGroup => 'ผ่านกลุ่ม';

  @override
  String get noPro => 'ไม่มี Pro';

  @override
  String proStatusNoEnd(String source) {
    return 'Pro ($source) ไม่มีวันหมดอายุ';
  }

  @override
  String proStatusUntil(String source, String date) {
    return 'Pro ($source) ถึง $date';
  }

  @override
  String get lifetime => 'ตลอดชีพ';

  @override
  String get pickDate => 'เลือกวันที่';

  @override
  String get noAccess => 'ไม่มีสิทธิ์เข้าถึง';

  @override
  String get adminOnlyTeam => 'ส่วนจัดการสำหรับทีม CamTrip เท่านั้น';

  @override
  String get adminOverview => 'ภาพรวม';

  @override
  String get adminUsers => 'ผู้ใช้';

  @override
  String get adminReports => 'รายงาน';

  @override
  String adminsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'แอดมิน $count คน',
    );
    return '$_temp0';
  }

  @override
  String get adminNewThisWeek => 'ใหม่สัปดาห์นี้';

  @override
  String get adminGroups => 'กลุ่ม';

  @override
  String get adminProSubscription => 'Pro แบบสมัครสมาชิก';

  @override
  String get adminProGift => 'Pro เป็นของขวัญ';

  @override
  String adminWithoutSubscription(int count) {
    return '$count คนไม่ได้สมัครสมาชิก';
  }

  @override
  String get adminOpenReports => 'รายงานที่เปิดอยู่';

  @override
  String get adminSearchHint => 'ค้นหาด้วยชื่อหรืออีเมล';

  @override
  String get nobodyFound => 'ไม่พบใคร';

  @override
  String get loadMore => 'โหลดเพิ่ม';

  @override
  String get noEmail => 'ไม่มีอีเมล';

  @override
  String adminDeletePhotoMessage(String groupName) {
    return 'รูปจะหายไปสำหรับทุกคนใน \"$groupName\" รายงานทั้งหมดเกี่ยวกับรูปนี้จะถูกปิด';
  }

  @override
  String get adminBanMessage =>
      'บัญชีนี้จะเข้าสู่ระบบหรือใช้แอปไม่ได้อีก ยกเลิกได้ภายหลัง';

  @override
  String get adminDismissTitle => 'ปัดตกรายงาน?';

  @override
  String get adminDismissMessage =>
      'รูปจะยังอยู่ รายงานจะถูกทำเครื่องหมายว่าจัดการแล้ว';

  @override
  String get adminDismiss => 'ปัดตก';

  @override
  String get adminAccountBlocked => 'บล็อกบัญชีแล้ว';

  @override
  String get adminReportDismissed => 'ปัดตกรายงานแล้ว';

  @override
  String get adminNoReports => 'ไม่มีรายงานที่เปิดอยู่';

  @override
  String get adminNoReportsMessage => 'รูปที่ถูกรายงานจะแสดงที่นี่';

  @override
  String get deletedTag => 'ลบแล้ว';

  @override
  String adminReportedBy(String name) {
    return 'โดย $name';
  }

  @override
  String adminPhotoBy(String name) {
    return 'รูปโดย $name';
  }

  @override
  String reportsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count รายงาน',
    );
    return '$_temp0';
  }

  @override
  String get adminDeletePhoto => 'ลบรูป';

  @override
  String get adminBlockCreator => 'บล็อกผู้ถ่าย';

  @override
  String get loadFailed => 'โหลดไม่สำเร็จ';

  @override
  String get adminLifetimeProGiven => 'ให้ Pro ตลอดชีพแล้ว';

  @override
  String get adminProGiven => 'ให้ Pro แล้ว';

  @override
  String adminGiveProUntil(String date) {
    return 'ให้ Pro ถึง $date';
  }

  @override
  String get adminGiveProLifetime => 'ให้ Pro ตลอดชีพ';

  @override
  String adminGiveProFor(String period) {
    return 'ให้ Pro $period';
  }

  @override
  String get adminReasonHint => 'เหตุผล เช่น เพื่อน ผู้ทดสอบ อินฟลูเอนเซอร์';

  @override
  String get adminGivePro => 'ให้ Pro';

  @override
  String get adminRevokeTitle => 'เพิกถอนของขวัญ?';

  @override
  String get adminRevokeMessage =>
      'Pro ที่ได้เป็นของขวัญจะหยุดทันที การสมัครสมาชิกของเขาเองยังใช้งานต่อ';

  @override
  String get adminRevoke => 'เพิกถอน';

  @override
  String get adminGiftRevoked => 'เพิกถอนของขวัญแล้ว';

  @override
  String get adminUnbanTitle => 'ยกเลิกการบล็อก?';

  @override
  String adminUnbanMessage(String name) {
    return '$name เข้าสู่ระบบได้อีกครั้ง';
  }

  @override
  String get adminUnbanned => 'ยกเลิกการบล็อกแล้ว';

  @override
  String get adminBanUserMessage =>
      'บัญชีนี้จะเข้าสู่ระบบหรือใช้แอปไม่ได้อีก รูปยังคงอยู่';

  @override
  String get adminUser => 'ผู้ใช้';

  @override
  String get adminNotVerified => 'ยังไม่ยืนยัน';

  @override
  String get adminRole => 'บทบาท';

  @override
  String get adminCreated => 'สร้างเมื่อ';

  @override
  String get unknown => 'ไม่ทราบ';

  @override
  String get adminSignInWith => 'เข้าสู่ระบบด้วย';

  @override
  String get adminEmailMethod => 'อีเมล';

  @override
  String get adminPhotosAndVideos => 'รูปและวิดีโอ';

  @override
  String get adminStatus => 'สถานะ';

  @override
  String get adminActive => 'ใช้งานอยู่';

  @override
  String adminActiveUntil(String date) {
    return 'ใช้งานได้ถึง $date';
  }

  @override
  String adminGiftFrom(String name) {
    return 'ของขวัญจาก $name';
  }

  @override
  String adminExpiredOn(String date) {
    return 'หมดอายุเมื่อ $date';
  }

  @override
  String get adminExpired => 'หมดอายุแล้ว';

  @override
  String adminUntil(String date) {
    return 'ถึง $date';
  }

  @override
  String get adminGiveProTitle => 'ให้ Pro';

  @override
  String get adminGiveProNote =>
      'ใช้กับกลุ่มของคนนี้ด้วย: Pro หนึ่งคนในกลุ่ม = Pro สำหรับทุกคนในกลุ่มนั้น';

  @override
  String get adminRevokeGift => 'เพิกถอนของขวัญ';

  @override
  String get adminModeration => 'การตรวจสอบเนื้อหา';

  @override
  String get adminCannotBanSelf => 'บล็อกตัวเองไม่ได้';

  @override
  String get adminCannotBanAdmin => 'บล็อกแอดมินไม่ได้';

  @override
  String get adminUnban => 'ยกเลิกการบล็อก';

  @override
  String get adminBanAccount => 'บล็อกบัญชี';

  @override
  String get googleSignInUnavailable => 'ยังเข้าสู่ระบบด้วย Google ไม่ได้';

  @override
  String get cameraPickerTitle => 'เลือกกล้องของคุณ';

  @override
  String get cameraPickerSubtitle => 'กล้องแต่ละตัวให้ลุคเฉพาะกับรูปของคุณ';

  @override
  String get cameraPickerChange => 'สลับกล้อง';

  @override
  String get cameraPickerUnlock => 'ปลดล็อกด้วย Pro';

  @override
  String get cameraPickerSelected => 'เลือกแล้ว';

  @override
  String get cameraPickerStyleSummer => 'ซัมเมอร์';

  @override
  String get cameraPickerStyleSummerDescription =>
      'สีอุ่นซีดจางแบบรูปถ่ายยุค 90';

  @override
  String get cameraPickerStyleNight => 'ไนท์ 800';

  @override
  String get cameraPickerStyleNightDescription =>
      'ฟิล์มภาพยนตร์: เงาสีเขียวอมฟ้า แสงอุ่น เกรนเยอะ';

  @override
  String get cameraPickerStyleSepia => 'ซีเปีย';

  @override
  String get cameraPickerStyleSepiaDescription =>
      'รูปสีน้ำตาลเก่าจากกล่องรองเท้า';

  @override
  String get cameraPickerStyleLomo => 'โลโม';

  @override
  String get cameraPickerStyleLomoDescription =>
      'สีจัดจ้าน มุมมืด และโทนสีสุดเหวี่ยง';

  @override
  String get cameraPickerStyleMint => 'มินต์';

  @override
  String get cameraPickerStyleMintDescription => 'นุ่มนวลและสดชื่นด้วยโทนเขียว';

  @override
  String get cameraPickerStylePastel => 'ชมพู';

  @override
  String get cameraPickerStylePastelDescription =>
      'สีพาสเทลกับแสงชมพูและขอบขาว';

  @override
  String get cameraPickerStyleSuper8 => 'ซูเปอร์ 8';

  @override
  String get cameraPickerStyleSuper8Description =>
      'มีเกรนและนุ่มนวล เหมือนหนังบ้านเก่าๆ';

  @override
  String get paywallBenefitGroup => 'Pro หนึ่งคน = Pro ทั้งกลุ่ม';

  @override
  String get paywallBenefitUnlimited => 'สมาชิกไม่จำกัด เก็บรูปไว้ตลอดไป';

  @override
  String get paywallBenefitQuality => 'ไม่มีลายน้ำ คุณภาพต้นฉบับ';

  @override
  String paywallFreeTrial(String period) {
    return 'ฟรี $period';
  }

  @override
  String paywallPriceYear(String price) {
    return '$price ต่อปี';
  }

  @override
  String paywallPriceYearTrial(String period, String price) {
    return 'ฟรี $period จากนั้น $price ต่อปี';
  }

  @override
  String paywallPriceMonth(String price) {
    return '$price ต่อเดือน';
  }

  @override
  String paywallPriceMonthTrial(String period, String price) {
    return 'ฟรี $period จากนั้น $price ต่อเดือน';
  }

  @override
  String paywallAutoRenew(String store) {
    return 'ต่ออายุอัตโนมัติ ยกเลิกอย่างน้อย 24 ชั่วโมงก่อนต่ออายุใน $store';
  }

  @override
  String get paywallDetailsTitle => 'ทุกอย่างใน Pro';

  @override
  String get paywallBenefitStyles => 'สไตล์กล้องทั้งหมด';

  @override
  String get allPhotosTitle => 'รูปทั้งหมด';

  @override
  String get homeTabAlbums => 'อัลบั้ม';

  @override
  String get allPhotosEmptyTitle => 'ยังไม่มีรูป';

  @override
  String get allPhotosEmptyMessage => 'เปิดกล้องแล้วถ่ายรูปแรกของคุณ';

  @override
  String get allPhotosLoadFailed => 'โหลดรูปของคุณไม่ได้';

  @override
  String get cameraSettingsTitle => 'การตั้งค่ากล้อง';

  @override
  String get cameraSettingsMore => 'การตั้งค่าเพิ่มเติม';

  @override
  String get cameraSettingsGrid => 'เส้นตาราง';

  @override
  String get cameraSettingsHaptics => 'สั่นเมื่อถ่าย';

  @override
  String get cameraSettingsDateStamp => 'วันที่มุมขวาล่าง';

  @override
  String get cameraSettingsSound => 'เสียงชัตเตอร์';

  @override
  String get cameraSettingsSoundHint =>
      'ไม่มีเสียงเมื่อโทรศัพท์อยู่ในโหมดเงียบ';

  @override
  String get cameraSettingsTimer => 'ตั้งเวลาถ่าย';

  @override
  String get cameraSettingsTimerOff => 'ปิด';

  @override
  String cameraSettingsTimerSeconds(int seconds) {
    return '$seconds วิ';
  }

  @override
  String get cameraSettingsTimerCancelHint => 'แตะชัตเตอร์เพื่อยกเลิก';

  @override
  String get cameraSettingsMirror => 'กลับด้านเซลฟี่';

  @override
  String get cameraSettingsSaveToRoll => 'บันทึกลงคลังรูป';

  @override
  String get cameraSettingsQuality => 'คุณภาพ';

  @override
  String get cameraSettingsQualityStandard => 'มาตรฐาน';

  @override
  String get cameraSettingsQualityHigh => 'สูง';

  @override
  String get cameraLowLightHint => 'แสงน้อย - เปิดแฟลช';

  @override
  String get cameraFlashUnavailable => 'กล้องนี้ไม่มีแฟลช';

  @override
  String get cameraFlashScreen => 'แฟลชหน้าจอ';

  @override
  String get cameraFlashCycleHint => 'แตะเพื่อสลับระหว่างปิด เปิด และอัตโนมัติ';

  @override
  String get cameraFlip => 'สลับกล้องหน้าและหลัง';

  @override
  String get cameraFlipHint => 'แตะช่องมองภาพสองครั้งเพื่อสลับกล้อง';

  @override
  String cameraPickerPaywallStyles(int count, String styles) {
    return 'กล้องทั้ง $count ตัว รวมถึง $styles';
  }

  @override
  String get styleFlash => 'แฟลช 400';

  @override
  String get styleFlashDescription =>
      'แฟลชตรงบนฟิล์มโทนอุ่น: แสงสีอำพัน เกรน สีแดงเข้ม';

  @override
  String cameraTimerButton(String state) {
    return 'ตั้งเวลาถ่าย: $state';
  }

  @override
  String get cameraTimerCycleHint => 'แตะเพื่อสลับระหว่างปิด 3 วิ และ 10 วิ';

  @override
  String get cameraLastShotOpen => 'รูปล่าสุด เปิดอัลบั้ม';

  @override
  String get cameraLastShotEmpty => 'ยังไม่มีรูป เปิดอัลบั้ม';

  @override
  String get deleteOnlyOwnOrAdmin => 'เฉพาะคนถ่ายหรือแอดมินเท่านั้นที่ลบได้';

  @override
  String get videoPlay => 'เล่น';

  @override
  String get videoPause => 'หยุดชั่วคราว';

  @override
  String get language => 'ภาษา';

  @override
  String get languageSystem => 'ภาษาของระบบ';

  @override
  String languageSystemCurrent(String language) {
    return 'ระบบ ($language)';
  }

  @override
  String get languageSearchHint => 'ค้นหาภาษา';

  @override
  String get languageNoResults => 'ไม่พบภาษา';

  @override
  String get personalRollTitle => 'ฟิล์มของฉัน';

  @override
  String get personalRollSubtitle => 'เฉพาะคุณ';

  @override
  String get personalRollPickerSubtitle => 'รูปแยก เฉพาะคุณ';

  @override
  String get personalRollMove => 'ไปที่อัลบั้ม';

  @override
  String get personalRollMoveTitle => 'ย้ายไปอัลบั้ม';

  @override
  String get personalRollMoveNoAlbums =>
      'สร้างอัลบั้มก่อน หรือเข้าร่วมด้วยรหัส';

  @override
  String personalRollMoved(int count, String album) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ย้าย $count รูปไปที่ $album แล้ว',
    );
    return '$_temp0';
  }

  @override
  String get personalRollPrivateNote =>
      'มีแค่คุณที่เห็นรูปเหล่านี้ ย้ายไปอัลบั้มเพื่อแชร์';

  @override
  String get paywallTripPassSub => 'เฉพาะทริปนี้ สำหรับทั้งกลุ่ม';

  @override
  String get paywallOneTime => 'ครั้งเดียว';

  @override
  String get paywallBestValue => 'คุ้มที่สุด';

  @override
  String paywallRollFullTitle(int used, int limit) {
    return 'ฟิล์มของคุณเต็มแล้ว - $used/$limit รูป';
  }

  @override
  String get paywallRollFullSub => 'ถ่ายต่อด้วย Trip Pass หรือ Pro';

  @override
  String get paywallCameraTitle => 'กล้องนี้เป็นส่วนหนึ่งของ Pro';

  @override
  String paywallCameraSub(int count) {
    return 'ปลดล็อกกล้องทั้ง $count ตัว';
  }

  @override
  String get paywallWatermarkTitle => 'วิดีโอสรุปไม่มีลายน้ำ';

  @override
  String get paywallWatermarkSub => 'แชร์วิดีโอสรุปโดยไม่มีโลโก้ CamTrip';

  @override
  String get paywallDeletionTitle => 'เก็บทริปของคุณไว้';

  @override
  String paywallDeletionSub(String date) {
    return 'ทริปฟรีจะถูกลบในวันที่ $date Trip Pass หรือ Pro จะเก็บไว้ตลอดไป';
  }

  @override
  String paywallTripPassTerms(String price) {
    return 'ซื้อครั้งเดียว $price สำหรับทริปนี้ ไม่ใช่การสมัครสมาชิก';
  }

  @override
  String get buyTripPass => 'ซื้อ Trip Pass';

  @override
  String get tripPassActive =>
      'Trip Pass ใช้งานอยู่: ทริปนี้เป็น Pro สำหรับทุกคน';

  @override
  String get tripPassActivating =>
      'ได้รับการชำระเงินแล้ว Trip Pass ของคุณจะใช้งานได้ในอีกสักครู่';

  @override
  String proViaTripPass(String name) {
    return 'Trip Pass จาก $name';
  }

  @override
  String rollCounterSemantics(int used, int limit) {
    return 'ถ่ายไปแล้ว $used จาก $limit รูปบนฟิล์มของคุณ';
  }

  @override
  String rollHeldTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count รูปไม่พอที่บนฟิล์มของคุณ',
    );
    return '$_temp0';
  }

  @override
  String get rollHeldBody => 'เก็บไว้ด้วย Pro หรือ Trip Pass';

  @override
  String deletionBannerTitle(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'เก็บทริปของคุณไว้ - เหลืออีก $days วัน',
    );
    return '$_temp0';
  }

  @override
  String get deletionBannerBody =>
      'ทริปฟรีจะถูกลบ 30 วันหลังจบทริป Trip Pass หรือ Pro จะเก็บไว้ตลอดไป';

  @override
  String apiRollFull(int limit) {
    return 'ฟิล์มของคุณเต็มแล้ว ($limit รูป) ซื้อ Trip Pass หรือ Pro เพื่อถ่ายต่อ';
  }

  @override
  String get apiTripPassFailed =>
      'เปิดใช้ Trip Pass ไม่ได้ ติดต่อ support@camtrip.app';

  @override
  String get apiTripPassExists => 'ทริปนี้มี Trip Pass แล้ว';

  @override
  String get tripPassUnavailable =>
      'ตอนนี้ยังใช้ Trip Pass ไม่ได้ โปรดลองอีกครั้งภายหลัง';

  @override
  String get tripMapTitle => 'แผนที่ทริป';

  @override
  String get tripMapOpen => 'แผนที่และสถิติ';

  @override
  String get tripMapLoadFailed => 'โหลดแผนที่ไม่ได้';

  @override
  String get tripMapStatDays => 'วัน';

  @override
  String get tripMapStatPhotos => 'รูป';

  @override
  String get tripMapStatVideos => 'วิดีโอ';

  @override
  String get tripMapStatMembers => 'สมาชิก';

  @override
  String get tripMapStatDistance => 'กม. ที่เดินทาง';

  @override
  String get tripMapStatCountries => 'ประเทศ';

  @override
  String get tripMapStatPlaces => 'สถานที่';

  @override
  String tripMapBusiestDay(String day, int count) {
    return 'รูปมากที่สุด: $day ($count)';
  }

  @override
  String tripMapTopPhotographer(String name, int count) {
    return 'ช่างภาพอันดับหนึ่ง: $name ($count)';
  }

  @override
  String get tripMapOffTitle => 'แผนที่ทริปปิดอยู่';

  @override
  String get tripMapOffMessage =>
      'แอดมินเปิดแผนที่ได้ในการตั้งค่ากลุ่ม คุณดูสถิติได้เสมอ';

  @override
  String get tripMapOffMessageAdmin =>
      'เปิดแผนที่เพื่อดูว่าถ่ายรูปกันที่ไหน แต่ละคนเลือกเองว่าจะร่วมหรือไม่';

  @override
  String get tripMapEnable => 'เปิดแผนที่';

  @override
  String get tripMapEmptyTitle => 'ยังไม่มีสถานที่บนแผนที่';

  @override
  String get tripMapEmptyMessage =>
      'รูปใหม่ของสมาชิกที่แชร์ตำแหน่งจะแสดงที่นี่ โดยปัดเป็นประมาณ 100 ม.';

  @override
  String get tripMapConsentTitle => 'แผนที่ทริป';

  @override
  String get tripMapConsentQuestion =>
      'แชร์ตำแหน่งที่ถ่ายรูปบนแผนที่ของกลุ่มนี้ไหม';

  @override
  String get tripMapConsentDetail =>
      'เฉพาะสมาชิกในกลุ่มที่เห็น โดยปัดเป็นประมาณ 100 ม. ตำแหน่งจะไม่ถูกบันทึกลงในรูป และปิดได้ทุกเมื่อในการตั้งค่ากลุ่ม';

  @override
  String get tripMapConsentYes => 'แชร์';

  @override
  String get tripMapConsentNo => 'ไม่แชร์';

  @override
  String get tripMapLocationDenied =>
      'เข้าถึงตำแหน่งของคุณไม่ได้ อนุญาตได้ในการตั้งค่าโทรศัพท์';

  @override
  String get tripMapSettingSubtitle =>
      'แสดงบนแผนที่ว่าถ่ายรูปที่ไหน สมาชิกเลือกเองว่าจะแชร์หรือไม่';

  @override
  String get tripMapDisableTitle => 'ปิดแผนที่ไหม';

  @override
  String get tripMapDisableMessage =>
      'ตำแหน่งทั้งหมดในกลุ่มนี้จะถูกลบ ถ้าเปิดแผนที่อีกครั้ง เราจะถามทุกคนใหม่';

  @override
  String get tripMapDisable => 'ปิด';

  @override
  String get tripMapMySharing => 'แชร์ตำแหน่งของฉัน';

  @override
  String get tripMapMySharingOn =>
      'รูปใหม่ของคุณจะแสดงบนแผนที่ (ปัดเป็นประมาณ 100 ม.)';

  @override
  String get tripMapMySharingOff => 'ปิดอยู่ รูปของคุณไม่แสดงบนแผนที่';

  @override
  String get tripMapStopSharingTitle => 'หยุดแชร์ตำแหน่งไหม';

  @override
  String get tripMapStopSharingMessage =>
      'ตำแหน่งของรูปทั้งหมดของคุณในกลุ่มนี้จะถูกลบ';

  @override
  String get tripMapStopSharing => 'หยุดแชร์';
}
