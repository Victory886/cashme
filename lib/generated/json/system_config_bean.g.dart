import 'package:loannow/generated/json/base/json_convert_content.dart';
import 'package:loannow/beans/system_config_bean.dart';

SystemConfigBean $SystemConfigBeanFromJson(Map<String, dynamic> json) {
  final SystemConfigBean systemConfigBean = SystemConfigBean();
  final SystemConfigDictInfo? dictInfo = jsonConvert.convert<
      SystemConfigDictInfo>(json['dictInfo']);
  if (dictInfo != null) {
    systemConfigBean.dictInfo = dictInfo;
  }
  final List<String>? testPhones = (json['testPhones'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (testPhones != null) {
    systemConfigBean.testPhones = testPhones;
  }
  final List<
      String>? thirdPartBuriedPoints = (json['thirdPartBuriedPoints'] as List<
      dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (thirdPartBuriedPoints != null) {
    systemConfigBean.thirdPartBuriedPoints = thirdPartBuriedPoints;
  }
  return systemConfigBean;
}

Map<String, dynamic> $SystemConfigBeanToJson(SystemConfigBean entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['dictInfo'] = entity.dictInfo?.toJson();
  data['testPhones'] = entity.testPhones;
  data['thirdPartBuriedPoints'] = entity.thirdPartBuriedPoints;
  return data;
}

extension SystemConfigBeanExtension on SystemConfigBean {
  SystemConfigBean copyWith({
    SystemConfigDictInfo? dictInfo,
    List<String>? testPhones,
    List<String>? thirdPartBuriedPoints,
  }) {
    return SystemConfigBean()
      ..dictInfo = dictInfo ?? this.dictInfo
      ..testPhones = testPhones ?? this.testPhones
      ..thirdPartBuriedPoints = thirdPartBuriedPoints ??
          this.thirdPartBuriedPoints;
  }
}

SystemConfigDictInfo $SystemConfigDictInfoFromJson(Map<String, dynamic> json) {
  final SystemConfigDictInfo systemConfigDictInfo = SystemConfigDictInfo();
  final String? customerServicePhone = jsonConvert.convert<String>(
      json['customerServicePhone']);
  if (customerServicePhone != null) {
    systemConfigDictInfo.customerServicePhone = customerServicePhone;
  }
  final String? feedbackEmail = jsonConvert.convert<String>(
      json['feedbackEmail']);
  if (feedbackEmail != null) {
    systemConfigDictInfo.feedbackEmail = feedbackEmail;
  }
  final String? messagerAccount = jsonConvert.convert<String>(
      json['messagerAccount']);
  if (messagerAccount != null) {
    systemConfigDictInfo.messagerAccount = messagerAccount;
  }
  final int? riskWaitingTime = jsonConvert.convert<int>(
      json['riskWaitingTime']);
  if (riskWaitingTime != null) {
    systemConfigDictInfo.riskWaitingTime = riskWaitingTime;
  }
  final List<
      SystemConfigDictInfoServicePhones>? servicePhones = (json['servicePhones'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<SystemConfigDictInfoServicePhones>(
          e) as SystemConfigDictInfoServicePhones).toList();
  if (servicePhones != null) {
    systemConfigDictInfo.servicePhones = servicePhones;
  }
  return systemConfigDictInfo;
}

Map<String, dynamic> $SystemConfigDictInfoToJson(SystemConfigDictInfo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['customerServicePhone'] = entity.customerServicePhone;
  data['feedbackEmail'] = entity.feedbackEmail;
  data['messagerAccount'] = entity.messagerAccount;
  data['riskWaitingTime'] = entity.riskWaitingTime;
  data['servicePhones'] = entity.servicePhones?.map((v) => v.toJson()).toList();
  return data;
}

extension SystemConfigDictInfoExtension on SystemConfigDictInfo {
  SystemConfigDictInfo copyWith({
    String? customerServicePhone,
    String? feedbackEmail,
    String? messagerAccount,
    int? riskWaitingTime,
    List<SystemConfigDictInfoServicePhones>? servicePhones,
  }) {
    return SystemConfigDictInfo()
      ..customerServicePhone = customerServicePhone ?? this.customerServicePhone
      ..feedbackEmail = feedbackEmail ?? this.feedbackEmail
      ..messagerAccount = messagerAccount ?? this.messagerAccount
      ..riskWaitingTime = riskWaitingTime ?? this.riskWaitingTime
      ..servicePhones = servicePhones ?? this.servicePhones;
  }
}

SystemConfigDictInfoServicePhones $SystemConfigDictInfoServicePhonesFromJson(
    Map<String, dynamic> json) {
  final SystemConfigDictInfoServicePhones systemConfigDictInfoServicePhones = SystemConfigDictInfoServicePhones();
  final String? phone = jsonConvert.convert<String>(json['phone']);
  if (phone != null) {
    systemConfigDictInfoServicePhones.phone = phone;
  }
  final String? phoneChannel = jsonConvert.convert<String>(
      json['phoneChannel']);
  if (phoneChannel != null) {
    systemConfigDictInfoServicePhones.phoneChannel = phoneChannel;
  }
  return systemConfigDictInfoServicePhones;
}

Map<String, dynamic> $SystemConfigDictInfoServicePhonesToJson(
    SystemConfigDictInfoServicePhones entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['phone'] = entity.phone;
  data['phoneChannel'] = entity.phoneChannel;
  return data;
}

extension SystemConfigDictInfoServicePhonesExtension on SystemConfigDictInfoServicePhones {
  SystemConfigDictInfoServicePhones copyWith({
    String? phone,
    String? phoneChannel,
  }) {
    return SystemConfigDictInfoServicePhones()
      ..phone = phone ?? this.phone
      ..phoneChannel = phoneChannel ?? this.phoneChannel;
  }
}