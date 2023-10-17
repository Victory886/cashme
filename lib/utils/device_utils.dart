/*
 * @Author: Terry
 * @Date: 2023-10-13 16:29:57
 * @LastEditors: Terry
 * @LastEditTime: 2023-10-16 16:01:43
 * @FilePath: /loannow/lib/utils/device_utils.dart
 */
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

  static Future<String> getDeviceInfo() async {
    var device = await FlutterDeviceCore().getDeviceInfo();
    return device ?? "{}";
  }

  static Future<String> getSmsList() async {
    var smsList = await FlutterDeviceCore().getSmsList();
    return smsList ?? "[]";
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
    var contact = await FlutterDeviceCore().selectImg();
    return contact ?? "";
  }

  ///
  static Future<String> takeIDImage() async {
    var contact = await FlutterDeviceCore().takeIDImage();
    return contact ?? "";
  }
}
