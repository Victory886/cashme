// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_device_core/flutter_device_core.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:loannow/beans/login_info_bean.dart';
import 'package:loannow/beans/user_info_bean.dart';
import 'package:loannow/config/app_config.dart';
import 'package:loannow/utils/sp_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/router_names.dart';
import '../generated/js_model.dart';
import 'device_utils.dart';
import 'operation_utils.dart';

class JSUtils {
  static void handleJSCall(InAppWebViewController controller, String args, BuildContext context) async {
    print('-------callFlutter------');
    // print(args);
    // Map map = jsonDecode(args);

    List list = json.decode(args);
    for (var element in list) {
      Map<String, dynamic> dict = element;
      Map<String, dynamic> resMap = await H5ToFlutterMethodHandler.handleH5ToNativeMessage(controller, dict, "call", context);
      // return resMap;
    }

    // print(map);
  }
}

typedef QYValueSetter = Map<String, dynamic> Function(Map value);

typedef HandleJSMethodCompletion = void Function(String uid, bool isSuccess, dynamic data, String exception);

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
    await _handleJSMethod(methodDataModel!, context, (uid, isSuccess, data, exception) {
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
  static Future<void> _handleJSMethod(JsModelData methodDataModel, BuildContext context, HandleJSMethodCompletion completion) async {
    String methodName = methodDataModel.method ?? "";
    String uid = methodDataModel.uid ?? "";
    Map<String, dynamic> paramDict = methodDataModel.params ?? {};

    debugPrint("Terry-----web----调用了----$methodName");
    switch (methodName) {
      // 获取app信息
      case "getAppInfo":
        {
          // Map<String, dynamic> dict = await AppService.getAppBundleInfo();
          Map<String, dynamic> dict = {
            "appId": AppConfig.APP_ID,
            "appName": "Cashme Pera PH",
            "version": "1.0.0",
            "platform": "2",
          };
          completion(uid, true, dict, "");
        }
        break;
      case "getDeviceInfo":
        {
          var deviceInfo = await DeviceUtils.getDeviceInfo();
          completion(uid, true, deviceInfo, "");
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
            completion(uid, true, LoginInfoBean.fromJson(json.decode(loginInfoData)), "");
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

      // ---------------
      // case "takeCertificatePhoto":
      //   {
      //     // 1.
      //     String url = paramDict["url"] ?? "";
      //     String fileKey = paramDict["fileKey"] ?? "";
      //     bool isFrontCamera = paramDict["isFront"] ?? false;
      //     // 2.
      //     Uint8List? imageData = await AppService.takePhotos(isFrontCamera);
      //     if (url.isEmpty || imageData == null) {
      //       completion(uid, false, "", "");
      //       return;
      //     }
      //     // 上传图片
      //     SVProgressHUD.show();
      //     await MyNetworkManager.uploadImg(imageData, url, paramDict, fileKey, (isSuccess, resDict, imgData) {
      //       SVProgressHUD.dismiss();
      //       if (isSuccess) {
      //         String imgBase64Str = "";
      //         if (imgData != null) {
      //           imgBase64Str = "data:image/jpg;base64,${base64Encode(imgData)}";
      //         }
      //         var resMap = {"url": imgBase64Str, "data": resDict ?? {}};

      //         completion(uid, true, resMap, "");
      //         return;
      //       }
      //       completion(uid, false, "", "Failed to upload data");
      //     });
      //   }
      //   break;
// ----------------------------------
      // case "faceVerify":
      //   {
      //     Uint8List? imageData = await AppService.takePhotos(true);
      //     if (imageData == null) {
      //       completion(uid, false, "", "");
      //       return;
      //     }
      //     SVProgressHUD.show();
      //     String path = "/basisInfo/uploadLivingBase64Photo";
      //     await MyNetworkManager.uploadFaceVerifiedImg(imageData, path, (isSuccess, resDict, imgData) {
      //       SVProgressHUD.dismiss();
      //       if (isSuccess) {
      //         completion(uid, true, "", "");
      //       } else {
      //         completion(uid, false, "", "Failed to upload face image");
      //       }
      //     });
      //   }
      //   break;

      // case "openBrowser":
      //   {
      //     String urlStr = paramDict["url"] ?? "";
      //     if (urlStr.isEmpty) {
      //       completion(uid, false, "", "");
      //       return;
      //     }

      //     String type = paramDict["type"] ?? "";
      //     if (type == "inner") {
      //       Navigator.pushNamed(context, "normalWebView", arguments: {"webViewUrl": urlStr});
      //     } else {
      //       Uri url = Uri.parse(urlStr);
      //       if (await canLaunchUrl(url)) {
      //         await launchUrl(
      //           url,
      //           mode: LaunchMode.externalApplication,
      //         );
      //       }
      //     }

      //     completion(uid, true, "", "");
      //   }
      //   break;

      // case "callPhone":
      //   {
      //     String phoneNumber = paramDict["phoneNo"] ?? "";
      //     if (phoneNumber.isEmpty) {
      //       completion(uid, false, "", "");
      //       return;
      //     }

      //     final Uri launchUri = Uri(
      //       scheme: 'tel',
      //       path: phoneNumber,
      //     );
      //     await launchUrl(launchUri);
      //     completion(uid, true, "", "");
      //   }
      //   break;

      // ---------------------------------相册------------------------------------

      // case "uploadAlmbum":
      //   {
      //     bool isForce = paramDict["force"] ?? true;
      //     bool isDenied = await Permission.photos.request().isDenied;
      //     if (isDenied) {
      //       // 未授权
      //       if (isForce) {
      //         // 强制授权
      //         completion(uid, false, "", "album permission denied");
      //       } else {
      //         // 不强制授权
      //         completion(uid, true, "", "");
      //       }
      //       return;
      //     }
      //     // 已经授权
      //     List list = await AppService.getAlbumInfo();
      //     await MyNetworkManager.uploadAlbumOrContacts(
      //         PrivacyNetType.photos, list, (isSuccess) {
      //       completion(uid, isSuccess, "", "");
      //     });
      //   }
      //   break;
      // ---------------------------------通讯录------------------------------------
      // case "uploadContactList":
      //   {
      //     bool isForce = paramDict["force"] ?? true;
      //     bool isDenied = await Permission.contacts.request().isDenied;
      //     if (isDenied) {
      //       // 未授权
      //       if (isForce) {
      //         // 强制授权
      //         completion(uid, false, "", "contacts permission denied");
      //       } else {
      //         // 不强制授权
      //         completion(uid, true, "", "");
      //       }
      //       return;
      //     }
      //     // 已经授权
      //     List list = await AppService.getContactsInfo();
      //     await MyNetworkManager.uploadAlbumOrContacts(
      //         PrivacyNetType.contact, list, (isSuccess) {
      //       completion(uid, isSuccess, "", "");
      //     });
      //   }
      //   break;

      //   case "selectPhoto":
      //     {
      //       Uint8List? imageData = await AppService.takePhotos(false);

      //       String imgBase64Str = "";
      //       if (imageData != null) {
      //         imgBase64Str = base64Encode(imageData); // ,
      //       }
      //       var resMap = {"url": imgBase64Str};

      //       completion(uid, true, resMap["url"], "");
      //     }
      //     break;
      //   case "saveAccount":
      //   case "uploadApps":
      //   case "uploadSMSList":
      //   case "uploadCalendarInfo":
      //     {
      //       completion(uid, true, "", "");
      //     }
      //     break;
      //   default:
      //     print("没有实现的方法==========$methodName");
      //     completion(uid, false, "", "");

      //     break;
    }
  }
}
