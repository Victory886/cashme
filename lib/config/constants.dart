/*
 * @Author: Terry
 * @Date: 2023-10-12 15:05:06
 * @LastEditors: Terry
 * @LastEditTime: 2023-11-13 16:58:23
 * @FilePath: /loannow/lib/config/constants.dart
 */
import 'package:loannow/beans/ip_check_bean.dart';
import 'package:loannow/beans/system_config_bean.dart';

class Constans {
  static const int CODE_COUNT_TIME = 60;
  static const Duration DIO_TIME_OUT = Duration(seconds: 30);

  static IpCheckBean? ipCheckBean = null;
  static SystemConfigBean? systemConfigBean = null;
}

// class SystemConfigObj {}
