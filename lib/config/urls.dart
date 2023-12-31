// ignore_for_file: non_constant_identifier_names

/*
 * @Author: Terry
 * @Date: 2023-10-12 15:05:06
 * @LastEditors: Terry
 * @LastEditTime: 2024-01-03 18:44:41
 * @FilePath: /loannow/lib/config/urls.dart
 */

import 'package:loannow/utils/secure_cipher_utils.dart';

class Urls {
  // static String BASE_URL = "https://houd.cashpera.com/h5/";

  static String BASE_URL = "http://api.cashloan.phdev.bowenfin.com/h5/";

  static String WEB_URL_PRIVACY =
      "https://www.cashpera.com/app/cashph/PrivacyPolicy.html";

  static String LOGIN_VERFIFY_CODE =
      "Hxg8OBkhRR74Saha3prBycuJAXLohkwHL0kepihd9A4="
          .aseUnlook() /* /login/requestVerifyCode */;
  static String LOGIN_VERFIFY_CODE_VOICE =
      "60iZAWVmEJSRNtrvGcqknJY4YNfNmIV9FXtuD3eMkWk="
          .aseUnlook() /* /login/requestVoiceVerifyCode */;

  static String SIGN_IN =
      "5QZivNptKgK2M1OE/h2zKw==".aseUnlook() /* /login/signIn */;
  static String SIGN_OUT =
      "7hcEZtVMgLxUvn9meYe8Lw==".aseUnlook() /* /login/signOut */;

  static String DEVICE_SAVE =
      "qORM2Rt7kz9kp6WFhDmN/A==".aseUnlook() /* /device/save */;
  static String USER_INFO = "A1kB9vyI4hu6cWjlTGhppN1PIGBtH2DTQGjqSNIcxec="
      .aseUnlook() /* /member/userInfo */;
  static String CHECK_AREA =
      "fyW/tMUTXjNUwK/y4y7x1Q==".aseUnlook() /* /tool/checkArea */;
  static String SYSTEM_CONFIG =
      "qmAlEvlmwvyYxWmThtf7Jg==".aseUnlook() /* /systemConfig/ */;
  static String ACCOUNT_DELETE = "q9h2ffzqBOJJGomah7hUP/NWsQ1psYLpM6k2evgPt5Q="
      .aseUnlook() /* /member/appDeletion */;
  static String PRIVACY_TRACKING_SAVEORMODIFY =
      "9JK5tYBrsaW+6niyyR4vaizgPUfGI3epIosiFtiX2YE="
          .aseUnlook() /* /privacyTracking/saveOrModify */;

  /// 获取订单状态-
  static String APPLICATION_LATEST =
      "UhJogcJQ3DsJmeF2Qdsydc7RyXUZoJWMBLq1Qr2/0b8="
          .aseUnlook() /* /application/latest */;
  static String APPLICATION_HISTORY =
      "cHQD9bnJWe5wIq3Bmq0fxBTR1QaYkG2OEBa4yeYRGtQ="
          .aseUnlook() /* /application/history */;
  static String APPLICATION_CANAPPLY =
      "39U0cKuGDG/Hz0NrfheTw7Sz1Q+p1ceHcQAqR8NXC5w="
          .aseUnlook() /* /application/canApply */;

  static String OPERATION_RECORD =
      "CrM89oUMSWbGpUFXWoMWS8pOMu0Z3MCo5g/oBl8g8uY="
          .aseUnlook() /* /member/operationRecord/save */;
  static String MODIFY_PHONE_VERIFY_CODE =
      "97ohdyoZGQflkdKat90SsAi+WzpJuzkwZgeGXQipIdDPXfYeNpelM7CCQUxRBv5m"
          .aseUnlook() /* /member/modifyPhoneSendVerifyCode */;

  static String MODIFY_PHONE = "97ohdyoZGQflkdKat90SsEtOLJQvJ6cA1ln4qklJ/QI="
      .aseUnlook() /* /member/modifyPhone */;
  static String BASIS_INFO_LOAD =
      "TbPURgtYrguCFWKYsoAZ4g==".aseUnlook() /* /basisInfo/load */;
  static String BASIS_INFO_SAVE =
      "9RhIODf3fk3AdO6njXBcDw==".aseUnlook() /* /basisInfo/save */;
  static String APPLIST_SAVE = "I7PtfSEbrW813ifk9PdDt5MF+gYllNnsQPSDwSTT3BE="
      .aseUnlook() /* /appInstalled/save */;
  static String SMS_LIST_SAVE = "VTIc1woISaf547GcY3aH+Cdwmz3r26xOSPrbipRtsrQ="
      .aseUnlook() /* /personalNoteRecord/save */;
  static String CONTACT_LIST_SAVE =
      "K/LIy8hIGV5Dqf/ExbWl1EYUjPnoFUNUjrHfizLyecI="
          .aseUnlook() /* /personalContact/save */;

  /// 优惠卷弹框
  static String COUPON_PROMPT = "ofm/3PldhTC/IX6GRnq/r6I2+4z+g6I8s78LOqdDDEU="
      .aseUnlook() /* /coupon/usableCouponPrompt */;

  /// 版本检查
  static String APPVERSION_NEEDUPDATE =
      "1mgr00UZOEZWvHgB91blPyDMn52zySxueFuzecZS31U="
          .aseUnlook() /* /appVersion/needUpdate */;

  /// 是否可以修改渠道
  static String PAYMENTCHANNELCHG =
      "QQVa+yVNyslSG+XfEqskVxSJqRBfGP68ELi+4y4mrSQD7BXkCeObvPUkbpPc4rov"
          .aseUnlook() /* /paymentChannelChg/queryApplicationChgInfo */;

  /// 跑马灯
  static String MARQUEES =
      "QRbgd+qBD6Yxxn9HuaXFGA==".aseUnlook() /* /marquees */;

  /// 检查数据上传情况
  static String BASIS_INFO_UPLOADSIGN =
      "KBaQdj7zdowkq3FhbrfuhvecEmak8B8BO69va7qtNGnSGJhWkdqN3/24BLjgi/4n"
          .aseUnlook() /* /basisInfo/personalInfoUploadSign */;

  /// 检查提前跑特征结果
  static String APPLICATION_CHECK_BEFORE_FEATURE =
      "uthIfouOgV1j6w23IRBwfdz4Y/7yOhFZa0jt8RleTyw="
          .aseUnlook() /* /application/checkBeforeFeature */;

  /// 检查是否弹出评论框
  static String MEMBER_GOOGLE_COMMENT =
      "Q2/I/Fu4r+P/TRCJkMzmd2G2sdDLN7H/czwz8btwrcg="
          .aseUnlook() /* /member/googleComment */;

  /// 弹出评论框之后通知后端
  static String MEMBER_SUB_GOOGLE_COMMENT =
      "V1SME0wHyr/whtA25npCn1B6Q5+2fLzjcNeeaCBFzNY="
          .aseUnlook() /* /member/subGoogleComment */;
}

class WebPageUrl {
  // static String baseUrl = "https://hfive.cashpera.com";

  static String baseUrl = "http://cashmepera-phdev.bowenfin.com";

  /// 基本信息页面地址
  static String applyStepBasalUrl = "$baseUrl/apply-step/basal";

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

  /// 注销页面
  static String accountDeletion = "$baseUrl/accountDeletion";
}


// openssl req -new -key cashph.pem -out CertificateSigningRequest.certSigningRequest -subj "/C=PH/ST=Manila/L=Manila/O=DC TECH MICRO SERVICES, INC./CN=PH"
// openssl x509 -inform der -in ios_distribution.cer -out distribution.pem

// openssl pkcs12 -export -clcerts -inkey cashph.pem -in distribution.pem -out cashph_dis.p12 -name "cashph_dis" -passout pass:123456


// pjsd-hhiy-xdww-vien
// ios-uploader -u ilya1ahfpan@mail.com -p pjsd-hhiy-xdww-vien -f