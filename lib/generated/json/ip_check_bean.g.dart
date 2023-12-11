/*
 * @Author: Terry
 * @Date: 2023-10-12 15:05:06
 * @LastEditors: Terry
 * @LastEditTime: 2023-12-11 17:20:25
 * @FilePath: /loannow/lib/generated/json/ip_check_bean.g.dart
 */
import 'package:loannow/generated/json/base/json_convert_content.dart';
import 'package:loannow/beans/ip_check_bean.dart';

IpCheckBean $IpCheckBeanFromJson(Map<String, dynamic> json) {
  final IpCheckBean ipCheckBean = IpCheckBean();
  final bool? auditor = jsonConvert.convert<bool>(json["auditor"]);
  if (auditor != null) {
    ipCheckBean.auditor = auditor;
  }
  final String? ipAreaCode = jsonConvert.convert<String>(json["ipAreaCode"]);
  if (ipAreaCode != null) {
    ipCheckBean.ipAreaCode = ipAreaCode;
  }
  final String? orderAreaCode =
      jsonConvert.convert<String>(json["orderAreaCode"]);
  if (orderAreaCode != null) {
    ipCheckBean.orderAreaCode = orderAreaCode;
  }
  return ipCheckBean;
}

Map<String, dynamic> $IpCheckBeanToJson(IpCheckBean entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data["auditor"] = entity.auditor;
  data["ipAreaCode"] = entity.ipAreaCode;
  data["orderAreaCode"] = entity.orderAreaCode;
  return data;
}

extension IpCheckBeanExtension on IpCheckBean {
  IpCheckBean copyWith({
    bool? auditor,
    String? ipAreaCode,
    String? orderAreaCode,
  }) {
    return IpCheckBean()
      ..auditor = auditor ?? this.auditor
      ..ipAreaCode = ipAreaCode ?? this.ipAreaCode
      ..orderAreaCode = orderAreaCode ?? this.orderAreaCode;
  }
}
