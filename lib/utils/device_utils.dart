/*
 * @Author: Terry
 * @Date: 2023-10-13 16:29:57
 * @LastEditors: Terry
 * @LastEditTime: 2023-11-03 10:42:03
 * @FilePath: /loannow/lib/utils/device_utils.dart
 */
import 'dart:io';

import 'package:flutter_device_core/flutter_device_core.dart';
import 'package:loannow/utils/sp_utils.dart';

class DeviceUtils {
  static Future<String> getDeviceId() async {
    String? deviceId = await SpUtils.getDeviceId();
    if (deviceId == null || deviceId.isEmpty) {
      deviceId = await FlutterDeviceCore().getDeviceId();
      if (deviceId != null && deviceId.isNotEmpty) {
        await SpUtils.saveDeviceId(deviceId);
      }
    }
    return deviceId ?? "";
  }

  static Future<String> getInstallReferrer() async {
    String? referrer = await SpUtils.getInstallReferrer();
    if (referrer == null || referrer.isEmpty) {
      referrer = await FlutterDeviceCore().getInstallReferrer();
      if (referrer != null && referrer.isNotEmpty) {
        await SpUtils.saveInstallReferrer(referrer);
      }
    }
    return referrer ?? "";
  }

  static Future<String> getAppVersion() async {
    return await FlutterDeviceCore().getPlatformVersion() ?? "1.0.0";
  }

  static Future<String> getDeviceInfo() async {
    var device = await FlutterDeviceCore().getDeviceInfo();
    return device ?? "{}";
  }

  static Future<String> getSmsList() async {
    if (Platform.isAndroid) {
      var smsList = await FlutterDeviceCore().getSmsList();
      return smsList ?? "[]";
    }
    return "[]";
  }

  static Future<String> getInstallAppList() async {
    var appList = await FlutterDeviceCore().getInstallAppList();
    return appList ?? "[]";
  }

  static Future<String> getContactList() async {
    var contactList = await FlutterDeviceCore().getContactList();
    return contactList ?? "[]";
  }

  /// 选择紧急联系人
  static Future<String> getSingleContact() async {
    var contact = await FlutterDeviceCore().selectContact();
    return contact ?? "[]";
  }

  /// 从相册选择照片
  static Future<String> takePhoto() async {
    var photo = await FlutterDeviceCore().selectImg();
    return photo ?? "";
  }

  ///
  static Future<String> takeIDImage(bool faceID) async {
    var image = await FlutterDeviceCore().takeIDImage(faceID);
    return image ?? "";
  }

  static Future<String> gotoAppSystemSetting() async {
    var image = await FlutterDeviceCore().gotoAppSystemSetting();
    return image ?? "";
  }

  static Future<String> openUrlInner(String? url) async {
    var image = await FlutterDeviceCore().openUrlInner(url);
    return image ?? "";
  }
}
