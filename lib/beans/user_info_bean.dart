import 'dart:convert';

import 'package:loannow/generated/json/base/json_field.dart';
import 'package:loannow/generated/json/user_info_bean.g.dart';

export 'package:loannow/generated/json/user_info_bean.g.dart';

@JsonSerializable()
class UserInfoBean {
  UserInfoCreditInfo? creditInfo;
  String? deviceId = '';
  int? id = 0;
  String? ip = '';
  bool? isNew = false;
  int? lastLoginTime = 0;
  bool? localIp = false;
  int? membershipPromptLevel = 0;
  String? referrer = '';
  int? sourcePlatform = 0;
  String? sourceProductVersion = '';
  bool? stopMarketing = false;
  String? telephoneNo = '';
  int? userLevel = 0;
  String? userLevelName = '';
  int? userLevelScore = 0;

  UserInfoBean();

  factory UserInfoBean.fromJson(Map<String, dynamic> json) => $UserInfoBeanFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoBeanToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserInfoCreditInfo {
  UserInfoCreditInfoCurrentLevel? currentLevel;
  int? currentScore = 0;
  UserInfoCreditInfoNextLevel? nextLevel;

  UserInfoCreditInfo();

  factory UserInfoCreditInfo.fromJson(Map<String, dynamic> json) => $UserInfoCreditInfoFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoCreditInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserInfoCreditInfoCurrentLevel {
  int? creditScoreLower = 0;
  int? creditScoreUpper = 0;
  bool? deleted = false;
  String? description = '';
  String? iconUrl = '';
  int? id = 0;
  int? level = 0;
  String? name = '';

  UserInfoCreditInfoCurrentLevel();

  factory UserInfoCreditInfoCurrentLevel.fromJson(Map<String, dynamic> json) => $UserInfoCreditInfoCurrentLevelFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoCreditInfoCurrentLevelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserInfoCreditInfoNextLevel {
  int? creditScoreLower = 0;
  int? creditScoreUpper = 0;
  bool? deleted = false;
  String? description = '';
  String? iconUrl = '';
  int? id = 0;
  int? level = 0;
  String? name = '';

  UserInfoCreditInfoNextLevel();

  factory UserInfoCreditInfoNextLevel.fromJson(Map<String, dynamic> json) => $UserInfoCreditInfoNextLevelFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoCreditInfoNextLevelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
