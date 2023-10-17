/*
 * @Author: Terry
 * @Date: 2023-10-12 15:05:06
 * @LastEditors: Terry
 * @LastEditTime: 2023-10-12 17:03:45
 * @FilePath: /loannow/lib/config/urls.dart
 */
class Urls {
  static String BASE_URL = "http://api.cashloan.phdev.bowenfin.com/";
  static String WEB_URL_PRIVACY =
      "http://cashme.ph/app/cashme/https/PrivacyPolicy.html";
  static String WEB_URL_LOAN = "http://cashme.cashloan.phdev.bowenfin.com/";
  static String WEB_URL_REPAY =
      "http://mgr.cashloan.phdev.bowenfin.com/openapi/application/repayment-url/Mz09&LOdxHIQ/";

  static String LOGIN_VERFIFY_CODE = "login/requestVerifyCode";
  static String LOGIN_VERFIFY_CODE_VOICE = "login/requestVoiceVerifyCode";
  static String SIGN_IN = "login/signIn";
  static String DEVICE_SAVE = "device/save";
  static String USER_INFO = "member/userInfo";
  static String CHECK_AREA = "tool/checkArea";
  static String SYSTEM_CONFIG = "systemConfig/";
  static String OPERATION_RECORD = "member/operationRecord/save";
  static String APPLICATION_HISTORY = "application/history";
  static String APPLICATION_LATEST = "application/latest";
  static String ACCOUNT_DELETE = "member/appDeletion";
  static String MODIFY_PHONE_VERIFY_CODE = "member/modifyPhoneSendVerifyCode";
  static String MODIFY_PHONE = "member/modifyPhone";
  static String BASIS_INFO_LOAD = "basisInfo/load";
  static String BASIS_INFO_SAVE = "basisInfo/save";
  static String APPLIST_SAVE = "appInstalled/save";
  static String SMS_LIST_SAVE = "personalNoteRecord/save";
  static String CONTACT_LIST_SAVE = "personalContact//save";
  static String BASIS_INFO_UPLOADSIGN = "basisInfo/personalInfoUploadSign";
  static String APPLICATION_CHECK_BEFORE_FEATURE = "application/checkBeforeFeature";
}
