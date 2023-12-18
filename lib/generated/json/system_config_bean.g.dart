import 'package:loannow/generated/json/base/json_convert_content.dart';
import 'package:loannow/beans/system_config_bean.dart';
import 'package:loannow/utils/secure_cipher_utils.dart';

SystemConfigBean $SystemConfigBeanFromJson(Map<String, dynamic> json) {
  final SystemConfigBean systemConfigBean = SystemConfigBean();
  final SystemConfigDictInfo? dictInfo =
      jsonConvert.convert<SystemConfigDictInfo>(
          json["ZGbVjMJKZPR48dJ95RWc3g==".aseUnlook() /* dictInfo */]);
  if (dictInfo != null) {
    systemConfigBean.dictInfo = dictInfo;
  }
  final List<String>? testPhones =
      (json["PdEjVU7yj3mtlA9eVqRLrg==".aseUnlook() /* testPhones */]
              as List<dynamic>?)
          ?.map((e) => jsonConvert.convert<String>(e) as String)
          .toList();
  if (testPhones != null) {
    systemConfigBean.testPhones = testPhones;
  }
  final List<String>? thirdPartBuriedPoints = (json[
          "FPQ14L+gtWXPUUt+CHUp3sbgheAX3LKG+uh2nd6ZeBI="
              .aseUnlook() /* thirdPartBuriedPoints */] as List<dynamic>?)
      ?.map((e) => jsonConvert.convert<String>(e) as String)
      .toList();
  if (thirdPartBuriedPoints != null) {
    systemConfigBean.thirdPartBuriedPoints = thirdPartBuriedPoints;
  }
  return systemConfigBean;
}

Map<String, dynamic> $SystemConfigBeanToJson(SystemConfigBean entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data["ZGbVjMJKZPR48dJ95RWc3g==".aseUnlook() /* dictInfo */] =
      entity.dictInfo?.toJson();
  data["PdEjVU7yj3mtlA9eVqRLrg==".aseUnlook() /* testPhones */] =
      entity.testPhones;
  data["FPQ14L+gtWXPUUt+CHUp3sbgheAX3LKG+uh2nd6ZeBI="
      .aseUnlook() /* thirdPartBuriedPoints */] = entity.thirdPartBuriedPoints;
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
      ..thirdPartBuriedPoints =
          thirdPartBuriedPoints ?? this.thirdPartBuriedPoints;
  }
}

SystemConfigDictInfo $SystemConfigDictInfoFromJson(Map<String, dynamic> json) {
  final SystemConfigDictInfo systemConfigDictInfo = SystemConfigDictInfo();
  final String? customerServicePhone = jsonConvert.convert<String>(json[
      "2JeZvqSikoO7a4suXF3G9a1bvE6x4opCOhMsDaftMvg="
          .aseUnlook() /* customerServicePhone */]);
  if (customerServicePhone != null) {
    systemConfigDictInfo.customerServicePhone = customerServicePhone;
  }
  final String? feedbackEmail = jsonConvert.convert<String>(
      json["mp5EbVJ543Excf5xnkNekg==".aseUnlook() /* feedbackEmail */]);
  if (feedbackEmail != null) {
    systemConfigDictInfo.feedbackEmail = feedbackEmail;
  }
  final String? messagerAccount = jsonConvert.convert<String>(
      json["uhQWUO46egEeYtwSAOu9lw==".aseUnlook() /* messagerAccount */]);
  if (messagerAccount != null) {
    systemConfigDictInfo.messagerAccount = messagerAccount;
  }
  final int? riskWaitingTime = jsonConvert.convert<int>(
      json["1sqzfZhhOpdKcfz23c92AA==".aseUnlook() /* riskWaitingTime */]);
  if (riskWaitingTime != null) {
    systemConfigDictInfo.riskWaitingTime = riskWaitingTime;
  }
  final List<SystemConfigDictInfoServicePhones>? servicePhones =
      (json["VwkhbIc9XmWv7ltvSmGs9A==".aseUnlook() /* servicePhones */]
              as List<dynamic>?)
          ?.map((e) => jsonConvert.convert<SystemConfigDictInfoServicePhones>(e)
              as SystemConfigDictInfoServicePhones)
          .toList();
  if (servicePhones != null) {
    systemConfigDictInfo.servicePhones = servicePhones;
  }
  return systemConfigDictInfo;
}

Map<String, dynamic> $SystemConfigDictInfoToJson(SystemConfigDictInfo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data["2JeZvqSikoO7a4suXF3G9a1bvE6x4opCOhMsDaftMvg="
      .aseUnlook() /* customerServicePhone */] = entity.customerServicePhone;
  data["mp5EbVJ543Excf5xnkNekg==".aseUnlook() /* feedbackEmail */] =
      entity.feedbackEmail;
  data["uhQWUO46egEeYtwSAOu9lw==".aseUnlook() /* messagerAccount */] =
      entity.messagerAccount;
  data["1sqzfZhhOpdKcfz23c92AA==".aseUnlook() /* riskWaitingTime */] =
      entity.riskWaitingTime;
  data["VwkhbIc9XmWv7ltvSmGs9A==".aseUnlook() /* servicePhones */] =
      entity.servicePhones?.map((v) => v.toJson()).toList();
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
  final SystemConfigDictInfoServicePhones systemConfigDictInfoServicePhones =
      SystemConfigDictInfoServicePhones();
  final String? phone = jsonConvert.convert<String>(
      json["nScZzQGkWfTQ/SIJPbB0OQ==".aseUnlook() /* phone */]);
  if (phone != null) {
    systemConfigDictInfoServicePhones.phone = phone;
  }
  final String? phoneChannel = jsonConvert.convert<String>(
      json["RFluCbZoqJe0bWm5od9lFA==".aseUnlook() /* phoneChannel */]);
  if (phoneChannel != null) {
    systemConfigDictInfoServicePhones.phoneChannel = phoneChannel;
  }
  return systemConfigDictInfoServicePhones;
}

Map<String, dynamic> $SystemConfigDictInfoServicePhonesToJson(
    SystemConfigDictInfoServicePhones entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data["nScZzQGkWfTQ/SIJPbB0OQ==".aseUnlook() /* phone */] = entity.phone;
  data["RFluCbZoqJe0bWm5od9lFA==".aseUnlook() /* phoneChannel */] =
      entity.phoneChannel;
  return data;
}

extension SystemConfigDictInfoServicePhonesExtension
    on SystemConfigDictInfoServicePhones {
  SystemConfigDictInfoServicePhones copyWith({
    String? phone,
    String? phoneChannel,
  }) {
    return SystemConfigDictInfoServicePhones()
      ..phone = phone ?? this.phone
      ..phoneChannel = phoneChannel ?? this.phoneChannel;
  }
}
