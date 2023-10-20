// ignore_for_file: constant_identifier_names

/// 埋点名字
class OperationCode {
  static const String APP_START = "app_start";
  static const String FIRST_OPEN = "first_open";

  static const String SEND_VOICE_CODE = "sendVoiceMessage";
  static const String SHOW_VOICE_DIALOG = "showVoiceMessageDialog";
  static const String SEND_VOICE_CODE_SUCCESS = "sendVoiceMessageSuccess";

  static const String LOGIN_CODE_FAIL = "loginCodeFail";
  static const String LOGIN_SEND_CODE = "loginSendCode";
  static const String LOGON_CLICK = "loginOrRegisteredClick";
  static const String LOGIN_CODE_SUCCESS = "loginCodeSuccess";

  static const String LOGIN = "login";
  static const String REGIST = "registered";
  static const String OPEN_LINK = "OpenCustomLink_";

  static const String UPLOAD_APP_START = "upload_apps_start";
  static const String UPLOAD_APP_SUCCESS = "upload_apps_success";

  static const String UPLOAD_APP_FAIL = "upload_apps_fail";
  static const String UPLOAD_SMS_START = "upload_sms_start";

  static const String UPLOAD_SMS_FAIL = "upload_sms_fail";
  static const String UPLOAD_SMS_SUCCESS = "upload_sms_success";
}
