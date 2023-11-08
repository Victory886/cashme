// ignore_for_file: non_constant_identifier_names

/*
 * @Author: Terry
 * @Date: 2023-10-12 15:05:06
 * @LastEditors: Terry
 * @LastEditTime: 2023-11-07 11:23:42
 * @FilePath: /loannow/lib/config/urls.dart
 */
class Urls {
  static String BASE_URL = "http://api.cashloan.phdev.bowenfin.com/";
  static String WEB_URL_LOAN =
      "http://www.phdev.bowenfin.com/madaPh/PrivacyPolicy.html";
  static String WEB_URL_PRIVACY =
      "http://cashme.ph/app/cashme/https/PrivacyPolicy.html";
  static String WEB_URL_REPAY =
      "http://mgr.cashloan.phdev.bowenfin.com/openapi/application/repayment-url/Mz09&LOdxHIQ/";

  static String LOGIN_VERFIFY_CODE = "login/requestVerifyCode";
  static String LOGIN_VERFIFY_CODE_VOICE = "login/requestVoiceVerifyCode";

  static String SIGN_IN = "login/signIn";

  static String DEVICE_SAVE = "device/save";
  static String USER_INFO = "member/userInfo";
  static String CHECK_AREA = "tool/checkArea";
  static String SYSTEM_CONFIG = "systemConfig/";
  static String ACCOUNT_DELETE = "member/appDeletion";

  /// 获取订单状态
  static String APPLICATION_LATEST = "application/latest";
  static String APPLICATION_HISTORY = "application/history";

  static String OPERATION_RECORD = "member/operationRecord/save";
  static String MODIFY_PHONE_VERIFY_CODE = "member/modifyPhoneSendVerifyCode";

  static String MODIFY_PHONE = "member/modifyPhone";
  static String BASIS_INFO_LOAD = "basisInfo/load";
  static String BASIS_INFO_SAVE = "basisInfo/save";
  static String APPLIST_SAVE = "appInstalled/save";
  static String SMS_LIST_SAVE = "personalNoteRecord/save";
  static String CONTACT_LIST_SAVE = "personalContact/save";

  /// 是否可以修改渠道
  static String PAYMENTCHANNELCHG = "paymentChannelChg/queryApplicationChgInfo";

  /// 跑马灯
  static String MARQUEES = "marquees";

  /// 检查数据上传情况
  static String BASIS_INFO_UPLOADSIGN = "basisInfo/personalInfoUploadSign";

  /// 检查提前跑特征结果
  static String APPLICATION_CHECK_BEFORE_FEATURE =
      "application/checkBeforeFeature";
}

class WebPageUrl {
  static String baseUrl = "http://cashmepera-phdev.bowenfin.com";
  // static String baseUrl = "http://192.168.200.171:8000";

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

  /// 客服页面
  static String middleUrl = "$baseUrl/middle";

  /// 还款中页面
  static String repayUrl = "$baseUrl/home/loan/repay";

  /// 渠道页面
  static String withdrawalUrl = "$baseUrl/apply-step/withdrawal";
}

class R {
  /// 首页左上角logo图片
  static String homeLogo = "images/home/home_logo";

  /// 首页 中间大图
  static String homeProgress = "images/home/home_progress";

  /// 首页 下面的图片
  static String homeLoan = "images/home/home_loan";

  /// 首页背景图片
  static String homeBg = "images/home_bg";

  /// 首页 apply 按钮
  static String homeApplyArrow = "images/home_apply_arrow";

  /// app启动图片
  static String appStartImg = "images/app_start";

  /// app启动图的上logo
  static String appStartLogoImg = "images/start_logo";

  /// Tabbar 客服
  static String tabbarCS = "images/tabbar/tabbar_cs";

  /// Tabbar 背景
  static String tabbarBG = "images/tabbar/tabbar_bg";

  /// Tabbar 首页选中状态
  static String tabbarCashS = "images/tabbar/tabbar_cash_s";

  /// Tabbar 首页未选中状态
  static String tabbarCashN = "images/tabbar/tabbar_cash_n";

  /// Tabbar 我的选中状态
  static String tabbarMeS = "images/tabbar/tabbar_me_s";

  /// Tabbar 我的未选中状态
  static String tabbarMeN = "images/tabbar/tabbar_me_n";

  /// me
  static String meCoupon = "images/me/me_coupon";
  static String meHistory = "images/me/me_history";
  static String meHotline = "images/me/me_hotline";
  static String meInApp = "images/me/me_in_app";
  static String meMessenger = "images/me/me_messenger";
  static String mePrivacy = "images/me/me_privacy";

  /// 顶部背景图片
  static String meTopBG = "images/me/mine_bg";

  /// 登录页面语音图片
  static String loginVoice = "images/login/voice";
}

String img(String imageName) {
  return "$imageName.png";
}
