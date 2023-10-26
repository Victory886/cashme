/*
 * @Author: Terry
 * @Date: 2023-10-12 15:05:06
 * @LastEditors: Terry
 * @LastEditTime: 2023-10-25 23:42:01
 * @FilePath: /loannow/lib/config/app_colors.dart
 */

import 'dart:math';
import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF235DE4);
  static const Color textColor = Color(0xFF333333);
  static const Color textColorLight = Color(0xFF666666);
  static const Color textColorhint = Color(0xFF999999);
  static const Color dividerColor = Color(0xFFCCCCCC);

  /// 按钮的主色调
  static const Color mainColor = Color(0xffFF5400);

  /// 紫色
  static const Color purpleColor7F = Color(0xff7F74EF);
}

/// 随机颜色
Color randomColor() {
  final Random random = Random();
  final int red = random.nextInt(256);
  final int green = random.nextInt(256);
  final int blue = random.nextInt(256);

  return Color.fromARGB(255, red, green, blue);
}
