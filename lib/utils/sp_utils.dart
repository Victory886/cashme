import 'dart:convert';

import 'package:loannow/beans/basis_info_bean.dart';
import 'package:loannow/beans/user_info_bean.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../beans/login_info_bean.dart';

class SpUtils {
  static const String SP_KEY_LOGIN = "SP_KEY_LOGIN";
  static const String SP_KEY_TOKEN = "SP_KEY_TOKEN";
  static const String SP_KEY_USER = "SP_KEY_USER";
  static const String SP_KEY_DEVICE_ID = "SP_KEY_DEVICE_ID";
  static const String SP_KEY_ORDER_FINISHED = "SP_KEY_ORDER_FINISHED";
  static const String SP_KEY_FIRST_OPEN = "SP_KEY_FIRST_OPEN";
  static const String SP_KEY_INSTALL_REFERRER = "SP_KEY_INSTALL_REFERRER";
  static const String SP_KEY_BASIS_INFO = "SP_KEY_BASIS_INFO";

  static Future<bool> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool success = await prefs.setString(SP_KEY_TOKEN, token);
    return success;
  }

  static Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = await prefs.getString(SP_KEY_TOKEN);
    return token;
  }

  static Future<bool> saveLoginInfo(LoginInfoBean userinfo) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool success = await prefs.setString(SP_KEY_LOGIN, userinfo.toString());
    return success;
  }

  static Future<LoginInfoBean?> getLoginInfoData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? loginInfoData = await prefs.getString(SP_KEY_LOGIN);
    if (loginInfoData != null) {
      return LoginInfoBean.fromJson(json.decode(loginInfoData));
    }
    return null;
  }

  static Future<bool> saveUserInfo(UserInfoBean user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool success = await prefs.setString(SP_KEY_USER, user.toString());
    return success;
  }

  static Future<UserInfoBean?> getUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userStr = await prefs.getString(SP_KEY_USER);
    if (userStr != null) {
      return UserInfoBean.fromJson(json.decode(userStr));
    }
    return null;
  }

  static Future<bool> saveDeviceId(String deviceId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool success = await prefs.setString(SP_KEY_DEVICE_ID, deviceId);
    return success;
  }

  static Future<String?> getDeviceId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? deviceId = await prefs.getString(SP_KEY_DEVICE_ID);
    return deviceId;
  }

  static Future<bool> saveInstallReferrer(String referrer) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool success = await prefs.setString(SP_KEY_INSTALL_REFERRER, referrer);
    return success;
  }

  static Future<String?> getInstallReferrer() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? referrer = await prefs.getString(SP_KEY_INSTALL_REFERRER);
    return referrer;
  }

  static Future<bool> isFirstOpen() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isFirst = await prefs.getBool(SP_KEY_FIRST_OPEN);
    return isFirst ?? true;
  }

  static Future<bool> setFirstOpen() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool success = await prefs.setBool(SP_KEY_FIRST_OPEN, false);
    return success;
  }

  static Future<bool> isOrderFinished() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isFirst = await prefs.getBool(SP_KEY_ORDER_FINISHED);
    return isFirst ?? false;
  }

  static Future<bool> setOrderFinished() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool success = await prefs.setBool(SP_KEY_ORDER_FINISHED, true);
    return success;
  }

  static Future<bool> saveBasisInfo(BasisInfoBean basis) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool success = await prefs.setString(SP_KEY_BASIS_INFO, basis.toString());
    return success;
  }

  static Future<BasisInfoBean?> getBasisInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? basisStr = await prefs.getString(SP_KEY_BASIS_INFO);
    if (basisStr != null) {
      return BasisInfoBean.fromJson(json.decode(basisStr));
    }
    return null;
  }

  static Future<bool?> clearUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(SP_KEY_USER);
    await prefs.remove(SP_KEY_TOKEN);
    await prefs.remove(SP_KEY_ORDER_FINISHED);
    await prefs.remove(SP_KEY_BASIS_INFO);
    return true;
  }
}