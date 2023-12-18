/*
 * @Author: Terry
 * @Date: 2023-10-12 15:05:06
 * @LastEditors: Terry
 * @LastEditTime: 2023-12-11 16:23:03
 * @FilePath: /loannow/lib/generated/json/login_info_bean.g.dart
 */
import 'package:loannow/generated/json/base/json_convert_content.dart';
import 'package:loannow/beans/login_info_bean.dart';
import 'package:loannow/utils/secure_cipher_utils.dart';

LoginInfoBean $LoginInfoBeanFromJson(Map<String, dynamic> json) {
  final LoginInfoBean loginInfoBean = LoginInfoBean();
  final int? appId = jsonConvert
      .convert<int>(json["zVRFG4St0vWyLu90oyLdlA==".aseUnlook() /* appId */]);
  if (appId != null) {
    loginInfoBean.appId = appId;
  }
  final String? areaCode = jsonConvert.convert<String>(
      json["wbUjo8OTWViU2qLwKfQnDg==".aseUnlook() /* areaCode */]);
  if (areaCode != null) {
    loginInfoBean.areaCode = areaCode;
  }
  final String? loginIp = jsonConvert.convert<String>(
      json["yxfUm2SELvBuvdUOQfsa0Q==".aseUnlook() /* loginIp */]);
  if (loginIp != null) {
    loginInfoBean.loginIp = loginIp;
  }
  final int? memberId = jsonConvert.convert<int>(
      json["QqJmJJG9o33+jr9unVOIog==".aseUnlook() /* memberId */]);
  if (memberId != null) {
    loginInfoBean.memberId = memberId;
  }
  final bool? newUser = jsonConvert.convert<bool>(
      json["2GhGXP4emhjEEGE7EX2bZw==".aseUnlook() /* newUser */]);
  if (newUser != null) {
    loginInfoBean.newUser = newUser;
  }
  final String? phone = jsonConvert.convert<String>(
      json["nScZzQGkWfTQ/SIJPbB0OQ==".aseUnlook() /* phone */]);
  if (phone != null) {
    loginInfoBean.phone = phone;
  }
  final int? platform = jsonConvert.convert<int>(
      json["dXE9swsADmcsQ5cPqKdbzA==".aseUnlook() /* platform */]);
  if (platform != null) {
    loginInfoBean.platform = platform;
  }
  final String? token = jsonConvert.convert<String>(
      json["YKfMT37060wXd4ZuEgrJew==".aseUnlook() /* token */]);
  if (token != null) {
    loginInfoBean.token = token;
  }
  final String? verifyCode = jsonConvert.convert<String>(
      json["kTZERlBg7//hrAku+TFWNA==".aseUnlook() /* verifyCode */]);
  if (verifyCode != null) {
    loginInfoBean.verifyCode = verifyCode;
  }
  final String? version = jsonConvert.convert<String>(
      json["xEDIAqQ5bs5YoFqE3pVfGA==".aseUnlook() /* version */]);
  if (version != null) {
    loginInfoBean.version = version;
  }
  return loginInfoBean;
}

Map<String, dynamic> $LoginInfoBeanToJson(LoginInfoBean entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data["zVRFG4St0vWyLu90oyLdlA==".aseUnlook() /* appId */] = entity.appId;
  data["wbUjo8OTWViU2qLwKfQnDg==".aseUnlook() /* areaCode */] = entity.areaCode;
  data["yxfUm2SELvBuvdUOQfsa0Q==".aseUnlook() /* loginIp */] = entity.loginIp;
  data["QqJmJJG9o33+jr9unVOIog==".aseUnlook() /* memberId */] = entity.memberId;
  data["2GhGXP4emhjEEGE7EX2bZw==".aseUnlook() /* newUser */] = entity.newUser;
  data["nScZzQGkWfTQ/SIJPbB0OQ==".aseUnlook() /* phone */] = entity.phone;
  data["dXE9swsADmcsQ5cPqKdbzA==".aseUnlook() /* platform */] = entity.platform;
  data["YKfMT37060wXd4ZuEgrJew==".aseUnlook() /* token */] = entity.token;
  data["kTZERlBg7//hrAku+TFWNA==".aseUnlook() /* verifyCode */] =
      entity.verifyCode;
  data["xEDIAqQ5bs5YoFqE3pVfGA==".aseUnlook() /* version */] = entity.version;
  return data;
}

extension LoginInfoBeanExtension on LoginInfoBean {
  LoginInfoBean copyWith({
    int? appId,
    String? areaCode,
    String? loginIp,
    int? memberId,
    bool? newUser,
    String? phone,
    int? platform,
    String? token,
    String? verifyCode,
    String? version,
  }) {
    return LoginInfoBean()
      ..appId = appId ?? this.appId
      ..areaCode = areaCode ?? this.areaCode
      ..loginIp = loginIp ?? this.loginIp
      ..memberId = memberId ?? this.memberId
      ..newUser = newUser ?? this.newUser
      ..phone = phone ?? this.phone
      ..platform = platform ?? this.platform
      ..token = token ?? this.token
      ..verifyCode = verifyCode ?? this.verifyCode
      ..version = version ?? this.version;
  }
}
