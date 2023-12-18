/*
 * @Author: Terry
 * @Date: 2023-10-12 15:05:06
 * @LastEditors: Terry
 * @LastEditTime: 2023-12-12 16:21:22
 * @FilePath: /loannow/lib/utils/phone_utils.dart
 */
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../config/constants.dart';

class PhoneUtils {
  static String formatPhone(String? phone) {
    if (phone != null) {
      if (Constans.systemConfigBean?.testPhones != null) {
        if (Constans.systemConfigBean?.testPhones?.contains(phone) ?? false) {
          return phone;
        }
      }

      switch (phone.length) {
        case 12:
          if (!phone.startsWith("639")) phone = "";
          break;
        case 11:
          if (!phone.startsWith("09")) {
            phone = "";
          } else {
            phone = "63${phone.substring(1, phone.length)}";
          }
          break;
        case 10:
          if (!phone.startsWith("9")) {
            phone = "";
          } else {
            phone = "63$phone";
          }
          break;
        default:
          phone = "";
          break;
      }
      return phone;
    } else {
      return "";
    }
  }

  static void callPhone(String? phone) {
    try {
      launchUrl(Uri.parse("tel:$phone"));
    } catch (e) {
      BotToast.showText(text: e.toString());
    }
  }
}

void fLog(String message) {
  StackTrace stackTrace = StackTrace.current;
  List<String> traceLines = stackTrace.toString().split('\n');

  if (traceLines.length > 1) {
    String targetLine = traceLines[1];
    RegExp regExp = RegExp(r'#(\d+)\s+'); // 匹配行号
    Match match = regExp.firstMatch(targetLine) as Match;

    // ignore: unnecessary_null_comparison
    if (match != null) {
      int lineNumber = int.parse(match.group(1)!);
      String fileName = targetLine.substring(targetLine.lastIndexOf(' ') + 1);
      String methodName = targetLine.substring(0, targetLine.indexOf(' '));

      debugPrint(' TTT [$fileName:  $lineNumber] $methodName: $message');
      return;
    }
  }

  // 如果无法解析堆栈信息，则简单打印消息
  debugPrint(message);
}
