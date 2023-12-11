/*
 * @Author: Terry
 * @Date: 2023-11-27 15:39:45
 * @LastEditors: Terry
 * @LastEditTime: 2023-12-11 16:15:56
 * @FilePath: /loannow/lib/generated/json/version_bean.g.dart
 */
import 'package:loannow/generated/json/base/json_convert_content.dart';
import 'package:loannow/beans/version_bean.dart';

VersionBean $VersionBeanFromJson(Map<String, dynamic> json) {
  final VersionBean versionBean = VersionBean();
  final int? appid = jsonConvert.convert<int>(json["appid"]);
  if (appid != null) {
    versionBean.appid = appid;
  }
  final int? createTime = jsonConvert.convert<int>(json["createTime"]);
  if (createTime != null) {
    versionBean.createTime = createTime;
  }
  final String? downloadUrl = jsonConvert.convert<String>(json["downloadUrl"]);
  if (downloadUrl != null) {
    versionBean.downloadUrl = downloadUrl;
  }
  final bool? foreupdate = jsonConvert.convert<bool>(json["foreupdate"]);
  if (foreupdate != null) {
    versionBean.foreupdate = foreupdate;
  }
  final int? id = jsonConvert.convert<int>(json["id"]);
  if (id != null) {
    versionBean.id = id;
  }
  final int? onlineTime = jsonConvert.convert<int>(json["onlineTime"]);
  if (onlineTime != null) {
    versionBean.onlineTime = onlineTime;
  }
  final String? packageName = jsonConvert.convert<String>(json["packageName"]);
  if (packageName != null) {
    versionBean.packageName = packageName;
  }
  final int? platform = jsonConvert.convert<int>(json["platform"]);
  if (platform != null) {
    versionBean.platform = platform;
  }
  final String? version = jsonConvert.convert<String>(json["version"]);
  if (version != null) {
    versionBean.version = version;
  }
  return versionBean;
}

Map<String, dynamic> $VersionBeanToJson(VersionBean entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data["appid"] = entity.appid;
  data["createTime"] = entity.createTime;
  data["downloadUrl"] = entity.downloadUrl;
  data["foreupdate"] = entity.foreupdate;
  data["id"] = entity.id;
  data["onlineTime"] = entity.onlineTime;
  data["packageName"] = entity.packageName;
  data["platform"] = entity.platform;
  data["version"] = entity.version;
  return data;
}

extension VersionBeanExtension on VersionBean {
  VersionBean copyWith({
    int? appid,
    int? createTime,
    String? downloadUrl,
    bool? foreupdate,
    int? id,
    int? onlineTime,
    String? packageName,
    int? platform,
    String? version,
  }) {
    return VersionBean()
      ..appid = appid ?? this.appid
      ..createTime = createTime ?? this.createTime
      ..downloadUrl = downloadUrl ?? this.downloadUrl
      ..foreupdate = foreupdate ?? this.foreupdate
      ..id = id ?? this.id
      ..onlineTime = onlineTime ?? this.onlineTime
      ..packageName = packageName ?? this.packageName
      ..platform = platform ?? this.platform
      ..version = version ?? this.version;
  }
}
