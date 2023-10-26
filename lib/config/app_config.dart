/*
 * @Author: Terry
 * @Date: 2023-10-12 15:05:06
 * @LastEditors: Terry
 * @LastEditTime: 2023-10-26 14:20:56
 * @FilePath: /loannow/lib/config/app_config.dart
 */

import 'package:flutter/material.dart';

class AppConfig {
  static const int APP_ID = 3;
  static const String APP_VERSION = "1.0";
  static const String APP_PACKAGE = "com.won.naol.loannow";
  static const int APP_PLATFORM = 2;
  static const String APP_LOGIN_PLATFORM = "APP";
}

/// 获取设备的大小
class Device {
  /// 底部
  static double appTopPadding(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  /// 顶部
  static double appBottomPadding(BuildContext context) {
    return MediaQuery.of(context).padding.bottom;
  }

  /// 获取宽高
  static Size deviceWH(BuildContext context) {
    return Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
  }
}

/// Tabbar的高度
const double tabbarHeight = 69.0;
