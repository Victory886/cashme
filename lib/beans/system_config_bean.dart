import 'dart:convert';

import 'package:loannow/generated/json/base/json_field.dart';
import 'package:loannow/generated/json/system_config_bean.g.dart';

export 'package:loannow/generated/json/system_config_bean.g.dart';

@JsonSerializable()
class SystemConfigBean {
  SystemConfigDictInfo? dictInfo;
  List<String>? testPhones = [];
  List<String>? thirdPartBuriedPoints = [];

  SystemConfigBean();

  factory SystemConfigBean.fromJson(Map<String, dynamic> json) => $SystemConfigBeanFromJson(json);

  Map<String, dynamic> toJson() => $SystemConfigBeanToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class SystemConfigDictInfo {
  String? customerServicePhone = '';
  String? feedbackEmail = '';
  String? messagerAccount = '';
  int? riskWaitingTime = 0;
  List<SystemConfigDictInfoServicePhones>? servicePhones = [];

  SystemConfigDictInfo();

  factory SystemConfigDictInfo.fromJson(Map<String, dynamic> json) => $SystemConfigDictInfoFromJson(json);

  Map<String, dynamic> toJson() => $SystemConfigDictInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class SystemConfigDictInfoServicePhones {
  String? phone = '';
  String? phoneChannel = '';

  SystemConfigDictInfoServicePhones();

  factory SystemConfigDictInfoServicePhones.fromJson(Map<String, dynamic> json) => $SystemConfigDictInfoServicePhonesFromJson(json);

  Map<String, dynamic> toJson() => $SystemConfigDictInfoServicePhonesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
