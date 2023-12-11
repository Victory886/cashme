// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_device_core/flutter_device_core.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:loannow/beans/login_info_bean.dart';
import 'package:loannow/config/app_config.dart';
import 'package:loannow/config/constants.dart';
import 'package:loannow/utils/secure_cipher_utils.dart';
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
          await H5ToFlutterMethodHandler.handleH5ToNativeMessage(controller,
              dict, "RsPp5dTOEB/m/aNsCxxDvQ==".aseUnlook() /* call */, context);
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
    if (dict["MdfMepCrmMDzwgnYH1pJVQ==".aseUnlook() /* handlerName */] !=
        h5HandlerName) {
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
          "QGuEdl4ezpXnLaf1Jt+ioQ==".aseUnlook() /* responseId */ :
              jsInfoModel.callbackId,
          "qrcAAXzMYmxtWFJeBAqMPw==".aseUnlook() /* responseData */ : info,
          "Zcakdx2QB6H+wL6ix2Z8PA==".aseUnlook() /* callbackId */ :
              jsInfoModel.callbackId,
        };

        return messageDict;
      };
    }

    Map<String, dynamic> res = {};
    await _handleJSMethod(methodDataModel!, context,
        (uid, isSuccess, data, exception) {
      Map<String, dynamic> resDict = {
        "/NtBbr2h+fwV4fq78U79TA==".aseUnlook() /* uid */ : uid,
        "acUN65Z/Ky44xbzQ5bOEQA==".aseUnlook() /* data */ : data,
        "z9e8RfUuq5LGdpEUUQgT+w==".aseUnlook() /* success */ : isSuccess,
        "oEs/yZDZwjhOfC7YbUyf6w==".aseUnlook() /* exception */ : exception,
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

    if (methodName == "aDXqjT0pqip+m3UQHedkbw==".aseUnlook() /* getAppInfo */) {
      Map<String, dynamic> dict = {
        "dXE9swsADmcsQ5cPqKdbzA==".aseUnlook() /* platform */ :
            "b2q5lAVVTCd+m8n7qaeYbg==".aseUnlook() /* 2 */,
        "zVRFG4St0vWyLu90oyLdlA==".aseUnlook() /* appId */ : AppConfig.APP_ID,
        "oKopO1tJ8zzmwtKtOhlzCw==".aseUnlook() /* appName */ :
            "njNyrMRXX0FrxrH/YIwdAA==".aseUnlook() /* Cashme Pera PH */,
        "xEDIAqQ5bs5YoFqE3pVfGA==".aseUnlook() /* version */ :
            AppConfig.APP_VERSION,
      };
      completion(uid, true, dict, "");
    } else if (methodName ==
        "8GWK0RTuWshqjexWRz2xgw==".aseUnlook() /* getDeviceInfo */) {
      var deviceInfo = await DeviceUtils.getDeviceInfo();
      completion(uid, true, json.decode(deviceInfo), "");
    } else if (methodName ==
        "0T7HK7j8hStJdtc1HA+Yww==".aseUnlook() /* nativeGoback */) {
      Navigator.pop(context);
    } else if (methodName ==
        "db8Ne1teEbqRIEQbfuVUuA==".aseUnlook() /* sendEvent */) {
      if (paramDict.isEmpty) {
        completion(uid, true, "", "");
        return;
      }
      String eventName =
          paramDict["1d1B6qSmCRql9ejq72vQ5w==".aseUnlook() /* code */] ?? "";
      OperationUtils.saveOperation(eventName);
      OperationUtils.sendFBStandardEvent(eventName);
      completion(uid, true, "", "");
    } else if (methodName ==
        "AZ5FeD+0/9fo2k/oMorFnQ==".aseUnlook() /* getLoginInfo */) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? loginInfoData = prefs.getString(SpUtils.SP_KEY_LOGIN);
      if (loginInfoData != null) {
        completion(
            uid, true, LoginInfoBean.fromJson(json.decode(loginInfoData)), "");
      } else {
        completion(uid, false, "", "");
      }
    } else if (methodName ==
        "RtoqIIVTEYFXfUs6jvxEPg==".aseUnlook() /* goLogin */) {
      Navigator.pop(context);
      Navigator.pushNamed(context, RouterNames.LOGIN);
      completion(uid, true, "", "");
    } else if (methodName ==
        "CjQvEidGaa09EtGW1mujjQ==".aseUnlook() /* goHome */) {
      SpUtils.setOrderFinished(finished: false);
      debugPrint(
        "goHome pop = ${paramDict.toString()}",
      );
      Navigator.pop(context, {
        "vcY53FoOHHGxxzJi3mnJ4Q==".aseUnlook() /* arguments */ : {
          "ElDouoU8JsIWA95o1xjc4w==".aseUnlook() /* isReload */ :
              paramDict["ElDouoU8JsIWA95o1xjc4w==".aseUnlook() /* isReload */]
        }
      });
    } else if (methodName ==
        "pnWe98eqgQ1BxY0I8c7zRrh3mo4uRt2PN5hKPtSDPxo="
            .aseUnlook() /* checkIsAppInstalled */) {
      String? urlScheme =
          paramDict["WmYMPkmRoFFM6DKe6Phtuw==".aseUnlook() /* iosUrlScheme */];
      if (urlScheme != null && urlScheme.isNotEmpty) {
        Uri url = Uri.parse(urlScheme);
        bool canOpen = await canLaunchUrl(url);
        completion(uid, true, canOpen, "");
        return;
      }
      completion(uid, true, false, "");
    } else if (methodName ==
        "VLxk8EC4rrs6vjXwmB7WcA==".aseUnlook() /* openThirdApp */) {
      String? urlScheme =
          paramDict["WmYMPkmRoFFM6DKe6Phtuw==".aseUnlook() /* iosUrlScheme */];
      if (urlScheme != null && urlScheme.isNotEmpty) {
        Uri url = Uri.parse(urlScheme);
        bool canOpen = await canLaunchUrl(url);
        if (canOpen) {
          launchUrl(url);
        }
      }
      completion(uid, true, false, "");
    } else if (methodName ==
            "ZOycDi8Cb9CVPboOokKYvA==".aseUnlook() /* chooseContact */ ||
        methodName ==
            "Jl7p8F+YadUDcGsYnOhXDw==".aseUnlook() /* selectAContact */ ||
        methodName ==
            "iEbgGJ6JNhaaL9qxp5R4sWS6lSoyZilfGALMteMH5Z8="
                .aseUnlook() /* selectOneContact */) {
      String? map = await FlutterDeviceCore().selectContact();
      dynamic parsedJson = json.decode(map ?? "");
      Map<String, dynamic> dataMap = Map.from(parsedJson);
      completion(uid, true, dataMap, "");
    } else if (methodName ==
        "h0VI6N11041V2PbC7LAIDQ==".aseUnlook() /* openUrlInner */) {
      debugPrint("123454567 = $paramDict");
      String? url = paramDict["vW9Mk2OPXFJFZeVsVxyxVg==".aseUnlook() /* url */];
      if (url != null) {
        if (url.contains(
            "cTJPQSwGBxUmP2gnFtlzpQ==".aseUnlook() /* CreditAgreement */)) {
          Navigator.pushNamed(
            context,
            RouterNames.WEB,
            arguments: {'url': url, 'showTitle': true},
          );
          completion(uid, true, true, "");
          return;
        }
        String? isOK = await FlutterDeviceCore().openUrlInner(url);
        completion(uid, true, isOK, "");
      }
    } else if (methodName ==
        "s4/awDwp3USvoamAqVJCFA30v0KEDVBNMql9MlRg/eQ="
            .aseUnlook() /* gotoAppSystemSetting */) {
      await FlutterDeviceCore().gotoAppSystemSetting();
      completion(uid, true, "", "");
    } else if (methodName ==
        "B9ECQfUp4RumL4A6+5lqOQ==".aseUnlook() /* getTestPhoneArr */) {
      completion(uid, true, Constans.systemConfigBean?.testPhones ?? [], "");
    } else if (methodName ==
        "nVXAHV13Z8aKFI+G6+CzGQ==".aseUnlook() /* selectPhoto */) {
      String? isOK = await FlutterDeviceCore().selectImg();
      completion(uid, true, isOK, "");
    } else if (methodName ==
        "frb9XPufCvj5Z24mg82Vu8qSippVmJ4aXrEyqJzXNPo="
            .aseUnlook() /* takeCertificatePhoto */) {
      String? isOK = await FlutterDeviceCore().takeIDImage(false);
      completion(uid, true, isOK, "");
    } else if (methodName ==
        "7JtvsV7BT1VbJqVj0oh3mlXd+KLgGlFQqZiUeYlkFIY="
            .aseUnlook() /* takingPicturesOfFaces */) {
      String? isOK = await FlutterDeviceCore().takeIDImage(true);
      completion(uid, true, isOK, "");
    } else {
      completion(
          uid,
          false,
          "C9/fKQ5imIWTzfkQIFBa0E7XGAJ5L4f0IkL+OQR7jmw="
              .aseUnlook() /* Method does not exist */,
          "");
    }
  }
}
