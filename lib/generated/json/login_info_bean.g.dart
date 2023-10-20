import 'package:loannow/generated/json/base/json_convert_content.dart';
import 'package:loannow/beans/login_info_bean.dart';

LoginInfoBean $LoginInfoBeanFromJson(Map<String, dynamic> json) {
  final LoginInfoBean loginInfoBean = LoginInfoBean();
  final int? appId = jsonConvert.convert<int>(json['appId']);
  if (appId != null) {
    loginInfoBean.appId = appId;
  }
  final String? areaCode = jsonConvert.convert<String>(json['areaCode']);
  if (areaCode != null) {
    loginInfoBean.areaCode = areaCode;
  }
  final String? loginIp = jsonConvert.convert<String>(json['loginIp']);
  if (loginIp != null) {
    loginInfoBean.loginIp = loginIp;
  }
  final int? memberId = jsonConvert.convert<int>(json['memberId']);
  if (memberId != null) {
    loginInfoBean.memberId = memberId;
  }
  final bool? newUser = jsonConvert.convert<bool>(json['newUser']);
  if (newUser != null) {
    loginInfoBean.newUser = newUser;
  }
  final String? phone = jsonConvert.convert<String>(json['phone']);
  if (phone != null) {
    loginInfoBean.phone = phone;
  }
  final int? platform = jsonConvert.convert<int>(json['platform']);
  if (platform != null) {
    loginInfoBean.platform = platform;
  }
  final String? token = jsonConvert.convert<String>(json['token']);
  if (token != null) {
    loginInfoBean.token = token;
  }
  final String? verifyCode = jsonConvert.convert<String>(json['verifyCode']);
  if (verifyCode != null) {
    loginInfoBean.verifyCode = verifyCode;
  }
  final String? version = jsonConvert.convert<String>(json['version']);
  if (version != null) {
    loginInfoBean.version = version;
  }
  return loginInfoBean;
}

Map<String, dynamic> $LoginInfoBeanToJson(LoginInfoBean entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['appId'] = entity.appId;
  data['areaCode'] = entity.areaCode;
  data['loginIp'] = entity.loginIp;
  data['memberId'] = entity.memberId;
  data['newUser'] = entity.newUser;
  data['phone'] = entity.phone;
  data['platform'] = entity.platform;
  data['token'] = entity.token;
  data['verifyCode'] = entity.verifyCode;
  data['version'] = entity.version;
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