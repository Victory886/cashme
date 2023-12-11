// ignore_for_file: non_constant_identifier_names, constant_identifier_names

/*
 * @Author: Terry
 * @Date: 2023-10-12 15:05:06
 * @LastEditors: Terry
 * @LastEditTime: 2023-12-01 11:34:21
 * @FilePath: /loannow/lib/config/app_config.dart
 */

import 'package:flutter/material.dart';

class AppConfig {
  static const int APP_ID = 0;
  static const int APP_PLATFORM = 2;
  static const String APP_LOGIN_PLATFORM = "APP";
  static const String APP_PACKAGE = "com.won.naol.loannow";
  static String APP_VERSION = "1.0.0"; // DeviceUtils.getAppVersion() as String;
}

/// 全局设备ID
String deviceID = "";

String appVersion = "";

bool isOpenLoginPage = false;

/// 获取设备的大小
class Device {
  /// 顶部
  static double appTopPadding(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  /// 底部
  static double appBottomPadding(BuildContext context) {
    return MediaQuery.of(context).padding.bottom;
  }

  /// 获取宽高
  static Size deviceWH(BuildContext context) {
    return Size(
        MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
  }
}

/// Tabbar的高度
const double tabbarHeight = 69.0;

// void printLine(String message) {
//   var now = new DateTime.now();
//   var path = FileSystemEntity.currentDirectory.path;
//   var fileName = FileSystemEntity.current.toString();
//   var line = 0;
//   var parts = [];
//   parts.add('${now.year}');
//   parts.add('${now.month}');
//   parts.add('${now.day}');
//   parts.add('${now.hour}');
//   parts.add('${now.minute}');
//   parts.add('${now.second}');
//   parts.add(path);
//   parts.add(fileName);
//   parts.add(line.toString());
//   parts.add(message);
//   var formattedMessage = parts.join(',');
//   print(formattedMessage);
// }
