import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:loannow/main.dart';
import 'package:loannow/config/app_config.dart';
import 'package:loannow/config/constants.dart';
import 'package:loannow/config/router_names.dart';
import 'package:loannow/config/urls.dart';
import 'package:loannow/net/base_response.dart';
import 'package:loannow/utils/phone_utils.dart';
import 'package:loannow/utils/secure_cipher_utils.dart';
import 'package:loannow/utils/sp_utils.dart';

class DioManager {
  static DioManager? _instance;
  late Dio dio;
  late BaseOptions dioOptions;

  static DioManager getInstance() {
    if (_instance == null) {
      _instance = DioManager();
    }
    return _instance!;
  }

  DioManager() {
    dioOptions = BaseOptions();
    dioOptions.baseUrl = Urls.BASE_URL;
    dioOptions.connectTimeout = Constans.DIO_TIME_OUT;
    dioOptions.receiveTimeout = Constans.DIO_TIME_OUT;
    // var headers = {
    //   "Access-Control-Allow-Origin": "*",
    //   // "Content-Type": "application/json",
    //   "deviceId": deviceID,
    //   "appId": AppConfig.APP_ID,
    //   "version": AppConfig.APP_VERSION,
    //   "platform": AppConfig.APP_PLATFORM,
    //   "packet_name": AppConfig.APP_PACKAGE,
    //   "loginPlatform": AppConfig.APP_LOGIN_PLATFORM,
    // };
    // try {
    //   headers.addAll({"type": Platform.operatingSystem});
    // } catch (e) {
    //   headers.addAll({"type": "web"});
    // }
    var headers = {
      "B1l2PXKdDlMrEVXiGyMLW+czLeH9BzMv44rjeSr6YVc="
              .aseUnlook() /* Access-Control-Allow-Origin */ :
          "45FYxKN3PEbNzJxnVjscqw==".aseUnlook() /* * */,
      // "7uArSAnZzeLiUQsjoRZt6g==".aseUnlook() /* Content-Type */: "uqCS1lmKjwMNIF4pmZih+We4AHDB0EPjpg2JrA49VIc=".aseUnlook() /* application/json */,
      "rx421BNaZibTudvlICRO/Q==".aseUnlook() /* deviceId */ : deviceID,
      "zVRFG4St0vWyLu90oyLdlA==".aseUnlook() /* appId */ : AppConfig.APP_ID,
      "xEDIAqQ5bs5YoFqE3pVfGA==".aseUnlook() /* version */ :
          AppConfig.APP_VERSION,
      "dXE9swsADmcsQ5cPqKdbzA==".aseUnlook() /* platform */ :
          AppConfig.APP_PLATFORM,
      "dcqzkeUCeOjL76LRRiLApw==".aseUnlook() /* packet_name */ :
          AppConfig.APP_PACKAGE,
      "/7OszbHjYo1K8GIjK97thw==".aseUnlook() /* loginPlatform */ :
          AppConfig.APP_LOGIN_PLATFORM,
    };
    try {
      headers.addAll({
        "TB050ji6SdcEjfnkbULa3w==".aseUnlook() /* type */ :
            Platform.operatingSystem
      });
    } catch (e) {
      headers.addAll({
        "TB050ji6SdcEjfnkbULa3w==".aseUnlook() /* type */ :
            "kawb9khniP9DPn4GCbnMYQ==".aseUnlook() /* web */
      });
    }

    dioOptions.headers = headers;
    dio = Dio(dioOptions);
    dio.interceptors.add(
      InterceptorsWrapper(onRequest: (options, handler) async {
        String? token = await SpUtils.getToken();
        if (token != null && token.isNotEmpty) {
          options.headers.addAll(
              {"YKfMT37060wXd4ZuEgrJew==".aseUnlook() /* token */ : token});
        }
        return handler.next(options);
      }),
    );
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  doRequest<T>({
    required String path,
    required DioMethod method,
    required Function(T? result) successCallBack,
    Map<String, dynamic>? urlParams,
    Object? bodyParams,
    Function(BaseResponse baseResponse)? failCallBack,
    bool showLoading = true,
    bool showErrorMsg = true,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    Function? closeDialog;
    if (showLoading) closeDialog = BotToast.showLoading();

    path = path.aseLook(pwd: PWD.server);
    dioOptions.headers.addAll({"x_x_path": path});
    Options options = Options(method: method.name, headers: dioOptions.headers);
    options.responseType = ResponseType.plain;

    Uint8List uint8List = Uint8List(0);
    if (bodyParams != null) {
      String jsonString = "";
      if (bodyParams is Map) {
        jsonString = jsonEncode(bodyParams);
      }
      jsonString = jsonString.aseLook(pwd: PWD.server);

      List<int> utf8Bytes = utf8.encode(jsonString);
      uint8List = Uint8List.fromList(utf8Bytes);

      // fLog("header = params = ${jsonString.aseUnlook(pwd: PWD.server)}");
    }

    try {
      Response response = await dio.request(
        path,
        data: utf8.decode(uint8List),
        options: options,
        queryParameters: urlParams,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      if (closeDialog != null) {
        closeDialog();
      }

      if (response.statusCode == 200) {
        var result = response.data;
        if (response.data is String) {
          result = await json
              .decode(response.data.toString().aseUnlook(pwd: PWD.server));
        }
        BaseResponse<T> baseResponse = BaseResponse<T>.fromJson(result);

        if (baseResponse.code == 200) {
          successCallBack(baseResponse.result);
        } else if (baseResponse.code == 401) {
          if (!isOpenLoginPage) {
            navigatorKey.currentState?.pushNamedAndRemoveUntil(
                RouterNames.LOGIN.aseUnlook(), (route) => false);
          }

          return;
        } else {
          if (showErrorMsg &&
              baseResponse.msg != null &&
              baseResponse.msg!.isNotEmpty) {
            BotToast.showText(text: baseResponse.msg!);
          }
          if (failCallBack != null) failCallBack(baseResponse);
        }
      } else {
        if (response.statusMessage != null &&
            response.statusMessage!.isNotEmpty &&
            showErrorMsg) {
          BotToast.showText(text: response.statusMessage!);
        }
        if (failCallBack != null)
          failCallBack(BaseResponse(
              code: response.statusCode, msg: response.statusMessage));
      }
    } on DioException catch (e) {
      fLog("header = ------E =  ${e.error.toString()}");

      if (closeDialog != null) {
        closeDialog();
      }
      if (e.message != null && e.message!.isNotEmpty && showErrorMsg) {
        if (e.message!.contains("The request connection took longer than")) {
          BotToast.showText(text: "System upgrading, please retry later.");
          return;
        }
        if (e.message!.contains("502") || e.message!.contains("403")) {
          BotToast.showText(text: "System upgrading, please retry later.");
          return;
        }

        if (e.message!.contains("The connection errored")) {
          BotToast.showText(text: "Please check your network!");
          return;
        }

        BotToast.showText(text: e.message!);
      }
      if (failCallBack != null)
        failCallBack(BaseResponse(code: e.type.index, msg: e.message));
    }
  }
}

enum DioMethod {
  GET,
  POST,
}
