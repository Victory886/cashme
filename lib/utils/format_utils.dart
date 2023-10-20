/*
 * @Author: Terry
 * @Date: 2023-10-12 15:05:06
 * @LastEditors: Terry
 * @LastEditTime: 2023-10-18 15:15:28
 * @FilePath: /loannow/lib/utils/format_utils.dart
 */
import 'package:encrypt/encrypt.dart';
import 'package:intl/intl.dart';

class FormatUtils {
  static String formatAmount(dynamic? amount) {
    try {
      var numberFormat = NumberFormat('#,##0', 'en_US');
      return numberFormat.format(amount);
    } catch (e) {
      return amount.toString();
    }
  }

  static String formatDate(int microsecondsSinceEpoch) {
    try {
      var dateFormat = DateFormat('MM/dd/y', 'en_US');
      return dateFormat.format(DateTime.fromMillisecondsSinceEpoch(microsecondsSinceEpoch));
    } catch (e) {
      return "";
    }
  }
}

/// string 扩展
extension StringExtension on String {
  /// 涉及到服务器端的字符串解密
  String strUnlock() {
    const serverKey = "aajiaozicashmeh5";
    const serverIV = "hajiaozicashmeh5";

    IV iv = IV.fromUtf8(serverIV);
    Key key = Key.fromUtf8(serverKey);

    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));

    String unlockStr = encrypter.decrypt64(this, iv: iv);
    if (unlockStr.isNotEmpty) {
      // ignore: avoid_print
      print("$this 解密后 = $unlockStr");
      return unlockStr;
    } else {
      return this;
    }
  }
}
