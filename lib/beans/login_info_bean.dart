import 'dart:convert';

import 'package:loannow/generated/json/base/json_field.dart';
import 'package:loannow/generated/json/login_info_bean.g.dart';

export 'package:loannow/generated/json/login_info_bean.g.dart';

@JsonSerializable()
class LoginInfoBean {
  int? appId = 0;
  String? areaCode = '';
  String? loginIp = '';
  int? memberId = 0;
  bool? newUser = false;
  String? phone = '';
  int? platform = 0;
  String? token = '';
  String? verifyCode = '';
  String? version = '';

  LoginInfoBean();

  factory LoginInfoBean.fromJson(Map<String, dynamic> json) => $LoginInfoBeanFromJson(json);

  Map<String, dynamic> toJson() => $LoginInfoBeanToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
