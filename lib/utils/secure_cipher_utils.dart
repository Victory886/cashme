/*
 * @Author: Terry
 * @Date: 2023-11-23 13:55:50
 * @LastEditors: Terry
 * @LastEditTime: 2024-01-03 18:03:01
 * @FilePath: /loannow/lib/utils/secure_cipher_utils.dart
 */
import 'package:encrypt/encrypt.dart';
import 'package:loannow/utils/phone_utils.dart';

// /// TODO: 加密有问题
// final _key = Key.fromUtf8("flutterProject00"); // 16位,不能随意修改
// final _iv = IV.fromUtf8("ABCDEF9876543210"); // 16位,不能随意修改

// final _serverKey = Key.fromUtf8("aajiaozicashmeh5".aseUnlook());
// final _serverIV = IV.fromUtf8("hajiaozicashmeh5".aseUnlook());

final _key = Key.fromUtf8("Oeg68UHRQb1OIHSu+Ru1sUcMwuo9ZKucxwKxJOelp7c="
    .aseUnlook() /* flutterProject00 */); // 16位,不能随意修改
final _iv = IV.fromUtf8("BRResH6D1zKbd88fLO8PZSQYQF2o+RRcshwP2Hw5A+Y="
    .aseUnlook() /* ABCDEF9876543210 */); // 16位,不能随意修改

final _serverKey = Key.fromUtf8("3t+8TJAedelB6TJlHIXEKiwscItxjSWrkx3Zo7eXoEU="
    .aseUnlook() /* aajiaozicashmeh5 */);
final _serverIV = IV.fromUtf8("o9759GNmYokC/T+lANENXj1xuijn/pgwX7mJepGyR14="
    .aseUnlook() /* hajiaozicashmeh5 */);

enum PWD {
  normal,
  server,
}

extension StringExt on String {
  /// 加密类
  Encrypter _getEncrypter({PWD pwd = PWD.normal}) {
    if (pwd == PWD.normal) {
      /// 普通的字符串
      return Encrypter(AES(_key, mode: AESMode.cbc));
    } else {
      /// 服务端的字符串
      return Encrypter(AES(_serverKey, mode: AESMode.cbc));
    }
  }

  /// 加密
  String aseLook({PWD pwd = PWD.normal}) {
    Encrypter encrypter = _getEncrypter(pwd: pwd);

    if (pwd == PWD.normal) {
      try {
        final encrypted = encrypter.encrypt(this, iv: _iv);
        fLog("加密后 = [${encrypted.base64}]");
        return encrypted.base64;
      } catch (e) {
        return this;
      }
    } else {
      try {
        final encrypted = encrypter.encrypt(this, iv: _serverIV);
        fLog("加密后 = [${encrypted.base64}]");
        return encrypted.base64;
      } catch (e) {
        return this;
      }
    }
  }

  /// 解密
  String aseUnlook({PWD pwd = PWD.normal}) {
    try {
      String decrypted = "";
      Encrypter encrypter = _getEncrypter(pwd: pwd);

      if (pwd == PWD.normal) {
        decrypted = encrypter.decrypt64(this, iv: _iv);
      } else {
        decrypted = encrypter.decrypt64(this, iv: _serverIV);
      }

      fLog("解密后 = [$decrypted]");
      return decrypted;
    } catch (e) {
      fLog("解密失败，返回原文 = $this");
      return this;
    }
  }
}
