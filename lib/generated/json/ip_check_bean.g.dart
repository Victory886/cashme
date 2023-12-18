/*
 * @Author: Terry
 * @Date: 2023-10-12 15:05:06
 * @LastEditors: Terry
 * @LastEditTime: 2023-12-11 17:23:20
 * @FilePath: /loannow/lib/generated/json/ip_check_bean.g.dart
 */
import 'package:loannow/generated/json/base/json_convert_content.dart';
import 'package:loannow/beans/ip_check_bean.dart';
import 'package:loannow/utils/secure_cipher_utils.dart';

IpCheckBean $IpCheckBeanFromJson(Map<String, dynamic> json) {
  final IpCheckBean ipCheckBean = IpCheckBean();
  final bool? auditor = jsonConvert.convert<bool>(
      json["rcf74ezu/CxU0q1fIWoCFA==".aseUnlook() /* auditor */]);
  if (auditor != null) {
    ipCheckBean.auditor = auditor;
  }
  final String? ipAreaCode = jsonConvert.convert<String>(
      json["vEGQt0hNLKV+2OVZllFrdg==".aseUnlook() /* ipAreaCode */]);
  if (ipAreaCode != null) {
    ipCheckBean.ipAreaCode = ipAreaCode;
  }
  final String? orderAreaCode = jsonConvert.convert<String>(
      json["VM/omqBnJNQ0JpgcQC6SHQ==".aseUnlook() /* orderAreaCode */]);
  if (orderAreaCode != null) {
    ipCheckBean.orderAreaCode = orderAreaCode;
  }
  return ipCheckBean;
}

Map<String, dynamic> $IpCheckBeanToJson(IpCheckBean entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data["rcf74ezu/CxU0q1fIWoCFA==".aseUnlook() /* auditor */] = entity.auditor;
  data["vEGQt0hNLKV+2OVZllFrdg==".aseUnlook() /* ipAreaCode */] =
      entity.ipAreaCode;
  data["VM/omqBnJNQ0JpgcQC6SHQ==".aseUnlook() /* orderAreaCode */] =
      entity.orderAreaCode;
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
