// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_device_core/flutter_device_core.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:loannow/beans/login_info_bean.dart';
import 'package:loannow/config/app_config.dart';
import 'package:loannow/config/constants.dart';
import 'package:loannow/utils/sp_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../config/router_names.dart';
import '../generated/js_model.dart';
import 'device_utils.dart';
import 'operation_utils.dart';

class JSUtils {
  static void handleJSCall(InAppWebViewController controller, String args,
      BuildContext context) async {
    print('-------callFlutter------');
    // print(args);
    // Map map = jsonDecode(args);

    List list = json.decode(args);
    for (var element in list) {
      Map<String, dynamic> dict = element;
      Map<String, dynamic> resMap =
          await H5ToFlutterMethodHandler.handleH5ToNativeMessage(
              controller, dict, "call", context);
      // return resMap;
    }

    // print(map);
  }
}

typedef QYValueSetter = Map<String, dynamic> Function(Map value);

typedef HandleJSMethodCompletion = void Function(
    String uid, bool isSuccess, dynamic data, String exception);

class H5ToFlutterMethodHandler {
  static InAppWebViewController? myWebViewcontroller;

  static Future<Map<String, dynamic>> handleH5ToNativeMessage(
    InAppWebViewController webViewcontroller,
    Map<String, dynamic> dict,
    String h5HandlerName,
    BuildContext context,
  ) async {
    myWebViewcontroller = webViewcontroller;
    if (dict["handlerName"] != h5HandlerName) {
      return {};
    }

    // 1. dict 转 model
    JsModel jsInfoModel = JsModel.fromJson(dict);

    JsModelData? methodDataModel = jsInfoModel.data;
    if (methodDataModel?.method?.isEmpty == true) {
      return {};
    }

    // 2.
    //定义 callBack

    QYValueSetter callBack = (info) {
      return {};
    };
    if (jsInfoModel.callbackId?.isNotEmpty == true) {
      callBack = (info) {
        Map<String, dynamic> messageDict = {
          "responseId": jsInfoModel.callbackId,
          "responseData": info,
          "callbackId": jsInfoModel.callbackId,
        };

        return messageDict;
      };
    }

    Map<String, dynamic> res = {};
    await _handleJSMethod(methodDataModel!, context,
        (uid, isSuccess, data, exception) {
      Map<String, dynamic> resDict = {
        "uid": uid,
        "data": data,
        "success": isSuccess,
        "exception": exception,
      };

      res = callBack(resDict);
    });
    return res;
  }

// -------------------------------------
  static Future<void> _handleJSMethod(JsModelData methodDataModel,
      BuildContext context, HandleJSMethodCompletion completion) async {
    String methodName = methodDataModel.method ?? "";
    String uid = methodDataModel.uid ?? "";
    Map<String, dynamic> paramDict = methodDataModel.params ?? {};

    debugPrint("Terry-----web----调用了----$methodName");
    switch (methodName) {
      // 获取app信息
      case "getAppInfo":
        {
          Map<String, dynamic> dict = {
            "platform": "2",
            "appId": AppConfig.APP_ID,
            "appName": "Cashme Pera PH",
            "version": AppConfig.APP_VERSION,
          };
          completion(uid, true, dict, "");
        }
        break;
      case "getDeviceInfo":
        {
          var deviceInfo = await DeviceUtils.getDeviceInfo();
          completion(uid, true, json.decode(deviceInfo), "");
        }
        break;
      case "nativeGoback":
        Navigator.pop(context);
        break;

      case "sendEvent":
        {
          if (paramDict.isEmpty) {
            completion(uid, true, "", "");
            return;
          }
          String eventName = paramDict["code"] ?? "";
          OperationUtils.saveOperation(eventName);
          OperationUtils.sendFBStandardEvent(eventName);
          completion(uid, true, "", "");
        }
        break;

      case "getLoginInfo":
        {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          String? loginInfoData = prefs.getString(SpUtils.SP_KEY_LOGIN);

          if (loginInfoData != null) {
            completion(uid, true,
                LoginInfoBean.fromJson(json.decode(loginInfoData)), "");
          } else {
            completion(uid, false, "", "");
          }
        }
        break;
      case "goLogin":
        Navigator.pop(context);
        Navigator.pushNamed(context, RouterNames.LOGIN);

        completion(uid, true, "", "");
        break;

      case "goHome":
        {
          Navigator.popAndPushNamed(context, RouterNames.HOME);
          break;
        }
      case "checkIsAppInstalled":
        {
          String? urlScheme = paramDict["iosUrlScheme"];
          if (urlScheme != null && urlScheme.isNotEmpty) {
            Uri url = Uri.parse(urlScheme);
            bool canOpen = await canLaunchUrl(url);
            completion(uid, true, canOpen, "");
            return;
          }
          completion(uid, true, false, "");
        }
        break;
      case "openThirdApp":
        {
          String? urlScheme = paramDict["iosUrlScheme"];
          if (urlScheme != null && urlScheme.isNotEmpty) {
            Uri url = Uri.parse(urlScheme);
            bool canOpen = await canLaunchUrl(url);
            if (canOpen) {
              launchUrl(url);
            }
          }
          completion(uid, true, false, "");
        }
        break;
      case "chooseContact":
      case "selectAContact":
      case "selectOneContact":
        {
          String? map = await FlutterDeviceCore().selectContact();
          dynamic parsedJson = json.decode(map ?? "");
          Map<String, dynamic> dataMap = Map.from(parsedJson);

          completion(uid, true, dataMap, "");
        }
        break;
      case "openUrlInner":
        {
          debugPrint("123454567 = $paramDict");
          String? url = paramDict["url"];
          String? isOK = await FlutterDeviceCore().openUrlInner(url);
          completion(uid, true, isOK, "");
        }
        break;
      case "gotoAppSystemSetting":
        {
          await FlutterDeviceCore().gotoAppSystemSetting();
          completion(uid, true, "", "");
        }
        break;

      case "getTestPhoneArr":
        {
          completion(
              uid, true, Constans.systemConfigBean?.testPhones ?? [], "");
        }
        break;
      case "selectPhoto":
        {
          String? isOK = await FlutterDeviceCore().selectImg();
          completion(uid, true, isOK, "");
        }
        break;
      case "takeCertificatePhoto":
        {
          String? isOK = await FlutterDeviceCore().takeIDImage(false);
          completion(uid, true, isOK, "");
        }
        break;

      case "takingPicturesOfFaces":
        {
          String? isOK = await FlutterDeviceCore().takeIDImage(true);
          completion(uid, true, isOK, "");
        }
        break;
      default:
        completion(uid, false, "Method does not exist", "");
        break;
    }
  }
}
