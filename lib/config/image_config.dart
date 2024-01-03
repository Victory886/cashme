/*
 * @Author: Terry
 * @Date: 2023-12-04 15:24:04
 * @LastEditors: Terry
 * @LastEditTime: 2024-01-03 17:34:09
 * @FilePath: /loannow/lib/config/image_config.dart
 */
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
  static String appStartLogoImg = "images/start_logo_new";

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

  ///优惠卷弹框
  static String coupenTakeIt = "images/take_it";
  static String coupenBox = "images/coupen_box";
  static String coupenTopPoint = "images/coupen_alert_point";
  static String coupenTopLine = "images/coupen_alert_line";
  static String coupenInfo = "images/coupen_alert_info";
  static String coupenRank = "images/coupon_rank";

  /// 登录页面语音图片
  static String loginVoice = "images/login/voice";
}

String img(String imageName) {
  return "$imageName.png";
}
