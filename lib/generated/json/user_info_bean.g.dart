import 'package:loannow/generated/json/base/json_convert_content.dart';
import 'package:loannow/beans/user_info_bean.dart';

UserInfoBean $UserInfoBeanFromJson(Map<String, dynamic> json) {
  final UserInfoBean userInfoBean = UserInfoBean();
  final UserInfoCreditInfo? creditInfo = jsonConvert.convert<
      UserInfoCreditInfo>(json['creditInfo']);
  if (creditInfo != null) {
    userInfoBean.creditInfo = creditInfo;
  }
  final String? deviceId = jsonConvert.convert<String>(json['deviceId']);
  if (deviceId != null) {
    userInfoBean.deviceId = deviceId;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    userInfoBean.id = id;
  }
  final String? ip = jsonConvert.convert<String>(json['ip']);
  if (ip != null) {
    userInfoBean.ip = ip;
  }
  final bool? isNew = jsonConvert.convert<bool>(json['isNew']);
  if (isNew != null) {
    userInfoBean.isNew = isNew;
  }
  final int? lastLoginTime = jsonConvert.convert<int>(json['lastLoginTime']);
  if (lastLoginTime != null) {
    userInfoBean.lastLoginTime = lastLoginTime;
  }
  final bool? localIp = jsonConvert.convert<bool>(json['localIp']);
  if (localIp != null) {
    userInfoBean.localIp = localIp;
  }
  final int? membershipPromptLevel = jsonConvert.convert<int>(
      json['membershipPromptLevel']);
  if (membershipPromptLevel != null) {
    userInfoBean.membershipPromptLevel = membershipPromptLevel;
  }
  final String? referrer = jsonConvert.convert<String>(json['referrer']);
  if (referrer != null) {
    userInfoBean.referrer = referrer;
  }
  final int? sourcePlatform = jsonConvert.convert<int>(json['sourcePlatform']);
  if (sourcePlatform != null) {
    userInfoBean.sourcePlatform = sourcePlatform;
  }
  final String? sourceProductVersion = jsonConvert.convert<String>(
      json['sourceProductVersion']);
  if (sourceProductVersion != null) {
    userInfoBean.sourceProductVersion = sourceProductVersion;
  }
  final bool? stopMarketing = jsonConvert.convert<bool>(json['stopMarketing']);
  if (stopMarketing != null) {
    userInfoBean.stopMarketing = stopMarketing;
  }
  final String? telephoneNo = jsonConvert.convert<String>(json['telephoneNo']);
  if (telephoneNo != null) {
    userInfoBean.telephoneNo = telephoneNo;
  }
  final int? userLevel = jsonConvert.convert<int>(json['userLevel']);
  if (userLevel != null) {
    userInfoBean.userLevel = userLevel;
  }
  final String? userLevelName = jsonConvert.convert<String>(
      json['userLevelName']);
  if (userLevelName != null) {
    userInfoBean.userLevelName = userLevelName;
  }
  final int? userLevelScore = jsonConvert.convert<int>(json['userLevelScore']);
  if (userLevelScore != null) {
    userInfoBean.userLevelScore = userLevelScore;
  }
  return userInfoBean;
}

Map<String, dynamic> $UserInfoBeanToJson(UserInfoBean entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['creditInfo'] = entity.creditInfo?.toJson();
  data['deviceId'] = entity.deviceId;
  data['id'] = entity.id;
  data['ip'] = entity.ip;
  data['isNew'] = entity.isNew;
  data['lastLoginTime'] = entity.lastLoginTime;
  data['localIp'] = entity.localIp;
  data['membershipPromptLevel'] = entity.membershipPromptLevel;
  data['referrer'] = entity.referrer;
  data['sourcePlatform'] = entity.sourcePlatform;
  data['sourceProductVersion'] = entity.sourceProductVersion;
  data['stopMarketing'] = entity.stopMarketing;
  data['telephoneNo'] = entity.telephoneNo;
  data['userLevel'] = entity.userLevel;
  data['userLevelName'] = entity.userLevelName;
  data['userLevelScore'] = entity.userLevelScore;
  return data;
}

extension UserInfoBeanExtension on UserInfoBean {
  UserInfoBean copyWith({
    UserInfoCreditInfo? creditInfo,
    String? deviceId,
    int? id,
    String? ip,
    bool? isNew,
    int? lastLoginTime,
    bool? localIp,
    int? membershipPromptLevel,
    String? referrer,
    int? sourcePlatform,
    String? sourceProductVersion,
    bool? stopMarketing,
    String? telephoneNo,
    int? userLevel,
    String? userLevelName,
    int? userLevelScore,
  }) {
    return UserInfoBean()
      ..creditInfo = creditInfo ?? this.creditInfo
      ..deviceId = deviceId ?? this.deviceId
      ..id = id ?? this.id
      ..ip = ip ?? this.ip
      ..isNew = isNew ?? this.isNew
      ..lastLoginTime = lastLoginTime ?? this.lastLoginTime
      ..localIp = localIp ?? this.localIp
      ..membershipPromptLevel = membershipPromptLevel ??
          this.membershipPromptLevel
      ..referrer = referrer ?? this.referrer
      ..sourcePlatform = sourcePlatform ?? this.sourcePlatform
      ..sourceProductVersion = sourceProductVersion ?? this.sourceProductVersion
      ..stopMarketing = stopMarketing ?? this.stopMarketing
      ..telephoneNo = telephoneNo ?? this.telephoneNo
      ..userLevel = userLevel ?? this.userLevel
      ..userLevelName = userLevelName ?? this.userLevelName
      ..userLevelScore = userLevelScore ?? this.userLevelScore;
  }
}

UserInfoCreditInfo $UserInfoCreditInfoFromJson(Map<String, dynamic> json) {
  final UserInfoCreditInfo userInfoCreditInfo = UserInfoCreditInfo();
  final UserInfoCreditInfoCurrentLevel? currentLevel = jsonConvert.convert<
      UserInfoCreditInfoCurrentLevel>(json['currentLevel']);
  if (currentLevel != null) {
    userInfoCreditInfo.currentLevel = currentLevel;
  }
  final int? currentScore = jsonConvert.convert<int>(json['currentScore']);
  if (currentScore != null) {
    userInfoCreditInfo.currentScore = currentScore;
  }
  final UserInfoCreditInfoNextLevel? nextLevel = jsonConvert.convert<
      UserInfoCreditInfoNextLevel>(json['nextLevel']);
  if (nextLevel != null) {
    userInfoCreditInfo.nextLevel = nextLevel;
  }
  return userInfoCreditInfo;
}

Map<String, dynamic> $UserInfoCreditInfoToJson(UserInfoCreditInfo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['currentLevel'] = entity.currentLevel?.toJson();
  data['currentScore'] = entity.currentScore;
  data['nextLevel'] = entity.nextLevel?.toJson();
  return data;
}

extension UserInfoCreditInfoExtension on UserInfoCreditInfo {
  UserInfoCreditInfo copyWith({
    UserInfoCreditInfoCurrentLevel? currentLevel,
    int? currentScore,
    UserInfoCreditInfoNextLevel? nextLevel,
  }) {
    return UserInfoCreditInfo()
      ..currentLevel = currentLevel ?? this.currentLevel
      ..currentScore = currentScore ?? this.currentScore
      ..nextLevel = nextLevel ?? this.nextLevel;
  }
}

UserInfoCreditInfoCurrentLevel $UserInfoCreditInfoCurrentLevelFromJson(
    Map<String, dynamic> json) {
  final UserInfoCreditInfoCurrentLevel userInfoCreditInfoCurrentLevel = UserInfoCreditInfoCurrentLevel();
  final int? creditScoreLower = jsonConvert.convert<int>(
      json['creditScoreLower']);
  if (creditScoreLower != null) {
    userInfoCreditInfoCurrentLevel.creditScoreLower = creditScoreLower;
  }
  final int? creditScoreUpper = jsonConvert.convert<int>(
      json['creditScoreUpper']);
  if (creditScoreUpper != null) {
    userInfoCreditInfoCurrentLevel.creditScoreUpper = creditScoreUpper;
  }
  final bool? deleted = jsonConvert.convert<bool>(json['deleted']);
  if (deleted != null) {
    userInfoCreditInfoCurrentLevel.deleted = deleted;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    userInfoCreditInfoCurrentLevel.description = description;
  }
  final String? iconUrl = jsonConvert.convert<String>(json['iconUrl']);
  if (iconUrl != null) {
    userInfoCreditInfoCurrentLevel.iconUrl = iconUrl;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    userInfoCreditInfoCurrentLevel.id = id;
  }
  final int? level = jsonConvert.convert<int>(json['level']);
  if (level != null) {
    userInfoCreditInfoCurrentLevel.level = level;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    userInfoCreditInfoCurrentLevel.name = name;
  }
  return userInfoCreditInfoCurrentLevel;
}

Map<String, dynamic> $UserInfoCreditInfoCurrentLevelToJson(
    UserInfoCreditInfoCurrentLevel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['creditScoreLower'] = entity.creditScoreLower;
  data['creditScoreUpper'] = entity.creditScoreUpper;
  data['deleted'] = entity.deleted;
  data['description'] = entity.description;
  data['iconUrl'] = entity.iconUrl;
  data['id'] = entity.id;
  data['level'] = entity.level;
  data['name'] = entity.name;
  return data;
}

extension UserInfoCreditInfoCurrentLevelExtension on UserInfoCreditInfoCurrentLevel {
  UserInfoCreditInfoCurrentLevel copyWith({
    int? creditScoreLower,
    int? creditScoreUpper,
    bool? deleted,
    String? description,
    String? iconUrl,
    int? id,
    int? level,
    String? name,
  }) {
    return UserInfoCreditInfoCurrentLevel()
      ..creditScoreLower = creditScoreLower ?? this.creditScoreLower
      ..creditScoreUpper = creditScoreUpper ?? this.creditScoreUpper
      ..deleted = deleted ?? this.deleted
      ..description = description ?? this.description
      ..iconUrl = iconUrl ?? this.iconUrl
      ..id = id ?? this.id
      ..level = level ?? this.level
      ..name = name ?? this.name;
  }
}

UserInfoCreditInfoNextLevel $UserInfoCreditInfoNextLevelFromJson(
    Map<String, dynamic> json) {
  final UserInfoCreditInfoNextLevel userInfoCreditInfoNextLevel = UserInfoCreditInfoNextLevel();
  final int? creditScoreLower = jsonConvert.convert<int>(
      json['creditScoreLower']);
  if (creditScoreLower != null) {
    userInfoCreditInfoNextLevel.creditScoreLower = creditScoreLower;
  }
  final int? creditScoreUpper = jsonConvert.convert<int>(
      json['creditScoreUpper']);
  if (creditScoreUpper != null) {
    userInfoCreditInfoNextLevel.creditScoreUpper = creditScoreUpper;
  }
  final bool? deleted = jsonConvert.convert<bool>(json['deleted']);
  if (deleted != null) {
    userInfoCreditInfoNextLevel.deleted = deleted;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    userInfoCreditInfoNextLevel.description = description;
  }
  final String? iconUrl = jsonConvert.convert<String>(json['iconUrl']);
  if (iconUrl != null) {
    userInfoCreditInfoNextLevel.iconUrl = iconUrl;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    userInfoCreditInfoNextLevel.id = id;
  }
  final int? level = jsonConvert.convert<int>(json['level']);
  if (level != null) {
    userInfoCreditInfoNextLevel.level = level;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    userInfoCreditInfoNextLevel.name = name;
  }
  return userInfoCreditInfoNextLevel;
}

Map<String, dynamic> $UserInfoCreditInfoNextLevelToJson(
    UserInfoCreditInfoNextLevel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['creditScoreLower'] = entity.creditScoreLower;
  data['creditScoreUpper'] = entity.creditScoreUpper;
  data['deleted'] = entity.deleted;
  data['description'] = entity.description;
  data['iconUrl'] = entity.iconUrl;
  data['id'] = entity.id;
  data['level'] = entity.level;
  data['name'] = entity.name;
  return data;
}

extension UserInfoCreditInfoNextLevelExtension on UserInfoCreditInfoNextLevel {
  UserInfoCreditInfoNextLevel copyWith({
    int? creditScoreLower,
    int? creditScoreUpper,
    bool? deleted,
    String? description,
    String? iconUrl,
    int? id,
    int? level,
    String? name,
  }) {
    return UserInfoCreditInfoNextLevel()
      ..creditScoreLower = creditScoreLower ?? this.creditScoreLower
      ..creditScoreUpper = creditScoreUpper ?? this.creditScoreUpper
      ..deleted = deleted ?? this.deleted
      ..description = description ?? this.description
      ..iconUrl = iconUrl ?? this.iconUrl
      ..id = id ?? this.id
      ..level = level ?? this.level
      ..name = name ?? this.name;
  }
}