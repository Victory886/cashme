/*
 * @Author: Terry
 * @Date: 2023-11-27 15:39:45
 * @LastEditors: Terry
 * @LastEditTime: 2023-12-11 17:26:59
 * @FilePath: /loannow/lib/generated/json/version_bean.g.dart
 */
import 'package:loannow/generated/json/base/json_convert_content.dart';
import 'package:loannow/beans/version_bean.dart';
import 'package:loannow/utils/secure_cipher_utils.dart';

VersionBean $VersionBeanFromJson(Map<String, dynamic> json) {
  final VersionBean versionBean = VersionBean();
  final int? appid = jsonConvert
      .convert<int>(json["MPCwbMMe333RC/cxDxf01w==".aseUnlook() /* appid */]);
  if (appid != null) {
    versionBean.appid = appid;
  }
  final int? createTime = jsonConvert.convert<int>(
      json["kPNJHoEooCfPEkVMHvISLg==".aseUnlook() /* createTime */]);
  if (createTime != null) {
    versionBean.createTime = createTime;
  }
  final String? downloadUrl = jsonConvert.convert<String>(
      json["LVvXR/bBavC2h0tjP57pfw==".aseUnlook() /* downloadUrl */]);
  if (downloadUrl != null) {
    versionBean.downloadUrl = downloadUrl;
  }
  final bool? foreupdate = jsonConvert.convert<bool>(
      json["4987kbUYgivv5CD8ctR9MQ==".aseUnlook() /* foreupdate */]);
  if (foreupdate != null) {
    versionBean.foreupdate = foreupdate;
  }
  final int? id = jsonConvert
      .convert<int>(json["enyd+2ERRQf7UaKB2w6Exw==".aseUnlook() /* id */]);
  if (id != null) {
    versionBean.id = id;
  }
  final int? onlineTime = jsonConvert.convert<int>(
      json["rv0BkTnS9hwUYOjoeoBMXg==".aseUnlook() /* onlineTime */]);
  if (onlineTime != null) {
    versionBean.onlineTime = onlineTime;
  }
  final String? packageName = jsonConvert.convert<String>(
      json["fg1cUkP9bk8x6nj0PYdTFA==".aseUnlook() /* packageName */]);
  if (packageName != null) {
    versionBean.packageName = packageName;
  }
  final int? platform = jsonConvert.convert<int>(
      json["dXE9swsADmcsQ5cPqKdbzA==".aseUnlook() /* platform */]);
  if (platform != null) {
    versionBean.platform = platform;
  }
  final String? version = jsonConvert.convert<String>(
      json["xEDIAqQ5bs5YoFqE3pVfGA==".aseUnlook() /* version */]);
  if (version != null) {
    versionBean.version = version;
  }
  return versionBean;
}

Map<String, dynamic> $VersionBeanToJson(VersionBean entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data["MPCwbMMe333RC/cxDxf01w==".aseUnlook() /* appid */] = entity.appid;
  data["kPNJHoEooCfPEkVMHvISLg==".aseUnlook() /* createTime */] =
      entity.createTime;
  data["LVvXR/bBavC2h0tjP57pfw==".aseUnlook() /* downloadUrl */] =
      entity.downloadUrl;
  data["4987kbUYgivv5CD8ctR9MQ==".aseUnlook() /* foreupdate */] =
      entity.foreupdate;
  data["enyd+2ERRQf7UaKB2w6Exw==".aseUnlook() /* id */] = entity.id;
  data["rv0BkTnS9hwUYOjoeoBMXg==".aseUnlook() /* onlineTime */] =
      entity.onlineTime;
  data["fg1cUkP9bk8x6nj0PYdTFA==".aseUnlook() /* packageName */] =
      entity.packageName;
  data["dXE9swsADmcsQ5cPqKdbzA==".aseUnlook() /* platform */] = entity.platform;
  data["xEDIAqQ5bs5YoFqE3pVfGA==".aseUnlook() /* version */] = entity.version;
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
