import 'dart:convert';

import 'package:loannow/generated/json/base/json_field.dart';
import 'package:loannow/generated/json/upload_sign_bean.g.dart';

export 'package:loannow/generated/json/upload_sign_bean.g.dart';

@JsonSerializable()
class UploadSignBean {
  bool? appInstallStatus = false;
  bool? contactListStatus = false;
  bool? noteRecordStatus = false;

  UploadSignBean();

  factory UploadSignBean.fromJson(Map<String, dynamic> json) => $UploadSignBeanFromJson(json);

  Map<String, dynamic> toJson() => $UploadSignBeanToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
