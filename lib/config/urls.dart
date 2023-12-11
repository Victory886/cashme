// ignore_for_file: non_constant_identifier_names

/*
 * @Author: Terry
 * @Date: 2023-10-12 15:05:06
 * @LastEditors: Terry
 * @LastEditTime: 2023-12-07 15:03:46
 * @FilePath: /loannow/lib/config/urls.dart
 */
import 'package:loannow/utils/secure_cipher_utils.dart';

class Urls {
  ///正式环境：https://apinew.cashme.ph/
  static String BASE_URL = "http://api.cashloan.phdev.bowenfin.com/h5/";

  static String WEB_URL_PRIVACY =
      "http://agreement-phdev.bowenfin.com/app/cashmepera/PrivacyPolicy.html";

  static String WEB_URL_REPAY =
      "http://mgr.cashloan.phdev.bowenfin.com/openapi/application/repayment-url/Mz09&LOdxHIQ/";

  static String LOGIN_VERFIFY_CODE = "/login/requestVerifyCode";
  static String LOGIN_VERFIFY_CODE_VOICE = "/login/requestVoiceVerifyCode";

  static String SIGN_IN = "/login/signIn";
  static String SIGN_OUT = "/login/signOut";

  static String DEVICE_SAVE = "/device/save";
  static String USER_INFO = "/member/userInfo";
  static String CHECK_AREA = "/tool/checkArea";
  static String SYSTEM_CONFIG = "/systemConfig/";
  static String ACCOUNT_DELETE = "/member/appDeletion";

  /// 获取订单状态-
  static String APPLICATION_LATEST = "/application/latest";
  static String APPLICATION_HISTORY = "/application/history";
  static String APPLICATION_CANAPPLY = "/application/canApply";

  static String OPERATION_RECORD = "/member/operationRecord/save";
  static String MODIFY_PHONE_VERIFY_CODE = "/member/modifyPhoneSendVerifyCode";

  static String MODIFY_PHONE = "/member/modifyPhone";
  static String BASIS_INFO_LOAD = "/basisInfo/load";
  static String BASIS_INFO_SAVE = "/basisInfo/save";
  static String APPLIST_SAVE = "/appInstalled/save";
  static String SMS_LIST_SAVE = "/personalNoteRecord/save";
  static String CONTACT_LIST_SAVE = "/personalContact/save";

  /// 优惠卷弹框
  static String COUPON_PROMPT = "/coupon/usableCouponPrompt";

  /// 版本检查
  static String APPVERSION_NEEDUPDATE = "/appVersion/needUpdate";

  /// 是否可以修改渠道
  static String PAYMENTCHANNELCHG =
      "/paymentChannelChg/queryApplicationChgInfo";

  /// 跑马灯
  static String MARQUEES = "/marquees";

  /// 检查数据上传情况
  static String BASIS_INFO_UPLOADSIGN = "/basisInfo/personalInfoUploadSign";

  /// 检查提前跑特征结果
  static String APPLICATION_CHECK_BEFORE_FEATURE =
      "/application/checkBeforeFeature";
}

class WebPageUrl {
  /// 基础地址
  static String baseUrl = "http://cashmepera-phdev.bowenfin.com";
  // static String baseUrl = "http://192.168.200.171:8000";

  ///正式环境：https://h5.cashme.ph/

  /// 基本信息页面地址
  static String applyStepBasalUrl = "$baseUrl/apply-step/basal";

  /// QA
  static String qaUrl = "http://www.phdev.bowenfin.com/madaPh/Q_A.html";

  /// 客服页面
  static String csUrl = "$baseUrl/customer-service";

  /// 修改手机号页面
  static String changePhoneUrl = "$baseUrl/changePhone";

  /// 优惠卷页面
  static String couponUrl = "$baseUrl/coupon";

  /// h5 中间页面
  static String middleUrl = "$baseUrl/middle";

  /// 还款中页面
  static String repayUrl = "$baseUrl/home/loan/repay";

  /// 渠道页面
  static String withdrawalUrl = "$baseUrl/apply-step/withdrawal";
}
