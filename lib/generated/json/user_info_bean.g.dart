import 'package:loannow/generated/json/base/json_convert_content.dart';
import 'package:loannow/beans/user_info_bean.dart';
import 'package:loannow/utils/secure_cipher_utils.dart';

UserInfoBean $UserInfoBeanFromJson(Map<String, dynamic> json) {
  final UserInfoBean userInfoBean = UserInfoBean();
  final UserInfoCreditInfo? creditInfo =
      jsonConvert.convert<UserInfoCreditInfo>(
          json["mXzulZjD1tVdttYB+e0gLQ==".aseUnlook() /* creditInfo */]);
  if (creditInfo != null) {
    userInfoBean.creditInfo = creditInfo;
  }
  final String? deviceId = jsonConvert.convert<String>(
      json["rx421BNaZibTudvlICRO/Q==".aseUnlook() /* deviceId */]);
  if (deviceId != null) {
    userInfoBean.deviceId = deviceId;
  }
  final int? id = jsonConvert
      .convert<int>(json["enyd+2ERRQf7UaKB2w6Exw==".aseUnlook() /* id */]);
  if (id != null) {
    userInfoBean.id = id;
  }
  final String? ip = jsonConvert
      .convert<String>(json["AGc4nrKXrDGl2p3bUcFZGw==".aseUnlook() /* ip */]);
  if (ip != null) {
    userInfoBean.ip = ip;
  }
  final bool? isNew = jsonConvert
      .convert<bool>(json["iVykR+4tS6eqVvk6R1w2aw==".aseUnlook() /* isNew */]);
  if (isNew != null) {
    userInfoBean.isNew = isNew;
  }
  final int? lastLoginTime = jsonConvert.convert<int>(
      json["WssTbKNy6dC23uTQvxQWVA==".aseUnlook() /* lastLoginTime */]);
  if (lastLoginTime != null) {
    userInfoBean.lastLoginTime = lastLoginTime;
  }
  final bool? localIp = jsonConvert.convert<bool>(
      json["Dac+DJ6/cPOxW9GPU00bEw==".aseUnlook() /* localIp */]);
  if (localIp != null) {
    userInfoBean.localIp = localIp;
  }
  final int? membershipPromptLevel = jsonConvert.convert<int>(json[
      "pIbCQ9jQ0+y2HfPiLw5tR0HGZQvFQe5hfWAOWextM+k="
          .aseUnlook() /* membershipPromptLevel */]);
  if (membershipPromptLevel != null) {
    userInfoBean.membershipPromptLevel = membershipPromptLevel;
  }
  final String? referrer = jsonConvert.convert<String>(
      json["8DHJyHCEtsa4zJ2LN3qMoA==".aseUnlook() /* referrer */]);
  if (referrer != null) {
    userInfoBean.referrer = referrer;
  }
  final int? sourcePlatform = jsonConvert.convert<int>(
      json["Tlh7IzqbDAWMOKFXi8wBWw==".aseUnlook() /* sourcePlatform */]);
  if (sourcePlatform != null) {
    userInfoBean.sourcePlatform = sourcePlatform;
  }
  final String? sourceProductVersion = jsonConvert.convert<String>(json[
      "+bFLm1sZzHn4qpnRh5/NNcEtUkZyjInAGyXBewo+oyc="
          .aseUnlook() /* sourceProductVersion */]);
  if (sourceProductVersion != null) {
    userInfoBean.sourceProductVersion = sourceProductVersion;
  }
  final bool? stopMarketing = jsonConvert.convert<bool>(
      json["6qqSQEkHDZliFK+DFqEaMg==".aseUnlook() /* stopMarketing */]);
  if (stopMarketing != null) {
    userInfoBean.stopMarketing = stopMarketing;
  }
  final String? telephoneNo = jsonConvert.convert<String>(
      json["QZkkEotg0ccVXSRRchK2SQ==".aseUnlook() /* telephoneNo */]);
  if (telephoneNo != null) {
    userInfoBean.telephoneNo = telephoneNo;
  }
  final int? userLevel = jsonConvert.convert<int>(
      json["cdQM0UCmE/ebx8QpWgm39Q==".aseUnlook() /* userLevel */]);
  if (userLevel != null) {
    userInfoBean.userLevel = userLevel;
  }
  final String? userLevelName = jsonConvert.convert<String>(
      json["sx2OIVYFm//0heCHI/J0rQ==".aseUnlook() /* userLevelName */]);
  if (userLevelName != null) {
    userInfoBean.userLevelName = userLevelName;
  }
  final int? userLevelScore = jsonConvert.convert<int>(
      json["FqPm6S6fWWWfdg5OFa9OOw==".aseUnlook() /* userLevelScore */]);
  if (userLevelScore != null) {
    userInfoBean.userLevelScore = userLevelScore;
  }
  return userInfoBean;
}

Map<String, dynamic> $UserInfoBeanToJson(UserInfoBean entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data["mXzulZjD1tVdttYB+e0gLQ==".aseUnlook() /* creditInfo */] =
      entity.creditInfo?.toJson();
  data["rx421BNaZibTudvlICRO/Q==".aseUnlook() /* deviceId */] = entity.deviceId;
  data["enyd+2ERRQf7UaKB2w6Exw==".aseUnlook() /* id */] = entity.id;
  data["AGc4nrKXrDGl2p3bUcFZGw==".aseUnlook() /* ip */] = entity.ip;
  data["iVykR+4tS6eqVvk6R1w2aw==".aseUnlook() /* isNew */] = entity.isNew;
  data["WssTbKNy6dC23uTQvxQWVA==".aseUnlook() /* lastLoginTime */] =
      entity.lastLoginTime;
  data["Dac+DJ6/cPOxW9GPU00bEw==".aseUnlook() /* localIp */] = entity.localIp;
  data["pIbCQ9jQ0+y2HfPiLw5tR0HGZQvFQe5hfWAOWextM+k="
      .aseUnlook() /* membershipPromptLevel */] = entity.membershipPromptLevel;
  data["8DHJyHCEtsa4zJ2LN3qMoA==".aseUnlook() /* referrer */] = entity.referrer;
  data["Tlh7IzqbDAWMOKFXi8wBWw==".aseUnlook() /* sourcePlatform */] =
      entity.sourcePlatform;
  data["+bFLm1sZzHn4qpnRh5/NNcEtUkZyjInAGyXBewo+oyc="
      .aseUnlook() /* sourceProductVersion */] = entity.sourceProductVersion;
  data["6qqSQEkHDZliFK+DFqEaMg==".aseUnlook() /* stopMarketing */] =
      entity.stopMarketing;
  data["QZkkEotg0ccVXSRRchK2SQ==".aseUnlook() /* telephoneNo */] =
      entity.telephoneNo;
  data["cdQM0UCmE/ebx8QpWgm39Q==".aseUnlook() /* userLevel */] =
      entity.userLevel;
  data["sx2OIVYFm//0heCHI/J0rQ==".aseUnlook() /* userLevelName */] =
      entity.userLevelName;
  data["FqPm6S6fWWWfdg5OFa9OOw==".aseUnlook() /* userLevelScore */] =
      entity.userLevelScore;
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
      ..membershipPromptLevel =
          membershipPromptLevel ?? this.membershipPromptLevel
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
  final UserInfoCreditInfoCurrentLevel? currentLevel =
      jsonConvert.convert<UserInfoCreditInfoCurrentLevel>(
          json["rZGw2LxAZ0bI1v/vANemUg==".aseUnlook() /* currentLevel */]);
  if (currentLevel != null) {
    userInfoCreditInfo.currentLevel = currentLevel;
  }
  final int? currentScore = jsonConvert.convert<int>(
      json["hSbj0nYV9Y6/SR+Xd3owTg==".aseUnlook() /* currentScore */]);
  if (currentScore != null) {
    userInfoCreditInfo.currentScore = currentScore;
  }
  final UserInfoCreditInfoNextLevel? nextLevel =
      jsonConvert.convert<UserInfoCreditInfoNextLevel>(
          json["COnVpnFQC27YukkRuw5SbA==".aseUnlook() /* nextLevel */]);
  if (nextLevel != null) {
    userInfoCreditInfo.nextLevel = nextLevel;
  }
  return userInfoCreditInfo;
}

Map<String, dynamic> $UserInfoCreditInfoToJson(UserInfoCreditInfo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data["rZGw2LxAZ0bI1v/vANemUg==".aseUnlook() /* currentLevel */] =
      entity.currentLevel?.toJson();
  data["hSbj0nYV9Y6/SR+Xd3owTg==".aseUnlook() /* currentScore */] =
      entity.currentScore;
  data["COnVpnFQC27YukkRuw5SbA==".aseUnlook() /* nextLevel */] =
      entity.nextLevel?.toJson();
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
  final UserInfoCreditInfoCurrentLevel userInfoCreditInfoCurrentLevel =
      UserInfoCreditInfoCurrentLevel();
  final int? creditScoreLower = jsonConvert.convert<int>(json[
      "5JTBSt4jha+FkYyTTnERFk6rsa7aEy1AeARMwznaHXE="
          .aseUnlook() /* creditScoreLower */]);
  if (creditScoreLower != null) {
    userInfoCreditInfoCurrentLevel.creditScoreLower = creditScoreLower;
  }
  final int? creditScoreUpper = jsonConvert.convert<int>(json[
      "+ZTJWutgDpcr5/+CrR/Yh6H072d4SW67u8vU+xFDVU4="
          .aseUnlook() /* creditScoreUpper */]);
  if (creditScoreUpper != null) {
    userInfoCreditInfoCurrentLevel.creditScoreUpper = creditScoreUpper;
  }
  final bool? deleted = jsonConvert.convert<bool>(
      json["ingLnv3OFToeroW6S6GqNQ==".aseUnlook() /* deleted */]);
  if (deleted != null) {
    userInfoCreditInfoCurrentLevel.deleted = deleted;
  }
  final String? description = jsonConvert.convert<String>(
      json["uGN/qsvvQc8T9X5hXZuJ3g==".aseUnlook() /* description */]);
  if (description != null) {
    userInfoCreditInfoCurrentLevel.description = description;
  }
  final String? iconUrl = jsonConvert.convert<String>(
      json["B3TL4/YVBjI49VQHItLY3w==".aseUnlook() /* iconUrl */]);
  if (iconUrl != null) {
    userInfoCreditInfoCurrentLevel.iconUrl = iconUrl;
  }
  final int? id = jsonConvert
      .convert<int>(json["enyd+2ERRQf7UaKB2w6Exw==".aseUnlook() /* id */]);
  if (id != null) {
    userInfoCreditInfoCurrentLevel.id = id;
  }
  final int? level = jsonConvert
      .convert<int>(json["OsnaQaZYr7tJODVzKzPjlg==".aseUnlook() /* level */]);
  if (level != null) {
    userInfoCreditInfoCurrentLevel.level = level;
  }
  final String? name = jsonConvert
      .convert<String>(json["Ju3XkDFhqSVpWy/Sth2XKw==".aseUnlook() /* name */]);
  if (name != null) {
    userInfoCreditInfoCurrentLevel.name = name;
  }
  return userInfoCreditInfoCurrentLevel;
}

Map<String, dynamic> $UserInfoCreditInfoCurrentLevelToJson(
    UserInfoCreditInfoCurrentLevel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data["5JTBSt4jha+FkYyTTnERFk6rsa7aEy1AeARMwznaHXE="
      .aseUnlook() /* creditScoreLower */] = entity.creditScoreLower;
  data["+ZTJWutgDpcr5/+CrR/Yh6H072d4SW67u8vU+xFDVU4="
      .aseUnlook() /* creditScoreUpper */] = entity.creditScoreUpper;
  data["ingLnv3OFToeroW6S6GqNQ==".aseUnlook() /* deleted */] = entity.deleted;
  data["uGN/qsvvQc8T9X5hXZuJ3g==".aseUnlook() /* description */] =
      entity.description;
  data["B3TL4/YVBjI49VQHItLY3w==".aseUnlook() /* iconUrl */] = entity.iconUrl;
  data["enyd+2ERRQf7UaKB2w6Exw==".aseUnlook() /* id */] = entity.id;
  data["OsnaQaZYr7tJODVzKzPjlg==".aseUnlook() /* level */] = entity.level;
  data["Ju3XkDFhqSVpWy/Sth2XKw==".aseUnlook() /* name */] = entity.name;
  return data;
}

extension UserInfoCreditInfoCurrentLevelExtension
    on UserInfoCreditInfoCurrentLevel {
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
  final UserInfoCreditInfoNextLevel userInfoCreditInfoNextLevel =
      UserInfoCreditInfoNextLevel();
  final int? creditScoreLower = jsonConvert.convert<int>(json[
      "5JTBSt4jha+FkYyTTnERFk6rsa7aEy1AeARMwznaHXE="
          .aseUnlook() /* creditScoreLower */]);
  if (creditScoreLower != null) {
    userInfoCreditInfoNextLevel.creditScoreLower = creditScoreLower;
  }
  final int? creditScoreUpper = jsonConvert.convert<int>(json[
      "+ZTJWutgDpcr5/+CrR/Yh6H072d4SW67u8vU+xFDVU4="
          .aseUnlook() /* creditScoreUpper */]);
  if (creditScoreUpper != null) {
    userInfoCreditInfoNextLevel.creditScoreUpper = creditScoreUpper;
  }
  final bool? deleted = jsonConvert.convert<bool>(
      json["ingLnv3OFToeroW6S6GqNQ==".aseUnlook() /* deleted */]);
  if (deleted != null) {
    userInfoCreditInfoNextLevel.deleted = deleted;
  }
  final String? description = jsonConvert.convert<String>(
      json["uGN/qsvvQc8T9X5hXZuJ3g==".aseUnlook() /* description */]);
  if (description != null) {
    userInfoCreditInfoNextLevel.description = description;
  }
  final String? iconUrl = jsonConvert.convert<String>(
      json["B3TL4/YVBjI49VQHItLY3w==".aseUnlook() /* iconUrl */]);
  if (iconUrl != null) {
    userInfoCreditInfoNextLevel.iconUrl = iconUrl;
  }
  final int? id = jsonConvert
      .convert<int>(json["enyd+2ERRQf7UaKB2w6Exw==".aseUnlook() /* id */]);
  if (id != null) {
    userInfoCreditInfoNextLevel.id = id;
  }
  final int? level = jsonConvert
      .convert<int>(json["OsnaQaZYr7tJODVzKzPjlg==".aseUnlook() /* level */]);
  if (level != null) {
    userInfoCreditInfoNextLevel.level = level;
  }
  final String? name = jsonConvert
      .convert<String>(json["Ju3XkDFhqSVpWy/Sth2XKw==".aseUnlook() /* name */]);
  if (name != null) {
    userInfoCreditInfoNextLevel.name = name;
  }
  return userInfoCreditInfoNextLevel;
}

Map<String, dynamic> $UserInfoCreditInfoNextLevelToJson(
    UserInfoCreditInfoNextLevel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data["5JTBSt4jha+FkYyTTnERFk6rsa7aEy1AeARMwznaHXE="
      .aseUnlook() /* creditScoreLower */] = entity.creditScoreLower;
  data["+ZTJWutgDpcr5/+CrR/Yh6H072d4SW67u8vU+xFDVU4="
      .aseUnlook() /* creditScoreUpper */] = entity.creditScoreUpper;
  data["ingLnv3OFToeroW6S6GqNQ==".aseUnlook() /* deleted */] = entity.deleted;
  data["uGN/qsvvQc8T9X5hXZuJ3g==".aseUnlook() /* description */] =
      entity.description;
  data["B3TL4/YVBjI49VQHItLY3w==".aseUnlook() /* iconUrl */] = entity.iconUrl;
  data["enyd+2ERRQf7UaKB2w6Exw==".aseUnlook() /* id */] = entity.id;
  data["OsnaQaZYr7tJODVzKzPjlg==".aseUnlook() /* level */] = entity.level;
  data["Ju3XkDFhqSVpWy/Sth2XKw==".aseUnlook() /* name */] = entity.name;
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
