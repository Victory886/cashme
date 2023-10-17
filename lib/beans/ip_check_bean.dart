import 'dart:convert';

import 'package:loannow/generated/json/base/json_field.dart';
import 'package:loannow/generated/json/ip_check_bean.g.dart';

export 'package:loannow/generated/json/ip_check_bean.g.dart';

@JsonSerializable()
class IpCheckBean {
  bool? auditor = false;
  String? ipAreaCode = '';
  String? orderAreaCode = '';

  IpCheckBean();

  factory IpCheckBean.fromJson(Map<String, dynamic> json) => $IpCheckBeanFromJson(json);

  Map<String, dynamic> toJson() => $IpCheckBeanToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
