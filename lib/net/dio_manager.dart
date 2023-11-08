import 'dart:convert';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:loannow/main.dart';
import 'package:loannow/config/app_config.dart';
import 'package:loannow/config/constants.dart';
import 'package:loannow/config/router_names.dart';
import 'package:loannow/config/urls.dart';
import 'package:loannow/net/base_response.dart';
import 'package:loannow/utils/device_utils.dart';
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
    var headers = {
      "Access-Control-Allow-Origin": "*",
      "version": AppConfig.APP_VERSION,
      // "version": DeviceUtils.getAppVersion() as String,
      "packet_name": AppConfig.APP_PACKAGE,
      "appId": AppConfig.APP_ID,
      "loginPlatform": AppConfig.APP_LOGIN_PLATFORM,
      "platform": AppConfig.APP_PLATFORM
    };
    try {
      headers.addAll({"type": Platform.operatingSystem});
    } catch (e) {
      headers.addAll({"type": "web"});
    }
    dioOptions.headers = headers;
    dio = Dio(dioOptions);
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      String? token = await SpUtils.getToken();
      if (token != null && token.isNotEmpty)
        options.headers.addAll({"token": token});
      // String? deviceId = await DeviceUtils.getDeviceId();
      // if (deviceId != null && deviceId.isNotEmpty)
      // options.headers.addAll({"deviceId": deviceId});
      // String? referrer = await DeviceUtils.getInstallReferrer();
      // if (referrer != null && referrer.isNotEmpty)
      //   options.headers.addAll({"google_referer": referrer});
      return handler.next(options);
    }));
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  doRequest<T>(
      {required String path,
      required DioMethod method,
      required Function(T? result) successCallBack,
      Map<String, dynamic>? urlParams,
      Object? bodyParams,
      Function(BaseResponse baseResponse)? failCallBack,
      bool showLoading = true,
      bool showErrorMsg = true,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    Function? closeDialog;
    if (showLoading) closeDialog = BotToast.showLoading();
    Options options = Options(method: method.name);
    try {
      Response response = await dio.request(path,
          options: options,
          queryParameters: urlParams,
          data: bodyParams,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);
      if (closeDialog != null) {
        closeDialog();
      }
      if (response.statusCode == 200) {
        var result = response.data;
        if (response.data is String) {
          result = json.decode(response.data);
        }
        BaseResponse<T> baseResponse = BaseResponse<T>.fromJson(result);
        if (baseResponse.code == 200) {
          successCallBack(baseResponse.result);
        } else if (baseResponse.code == 401) {
          navigatorKey.currentState
              ?.pushNamedAndRemoveUntil(RouterNames.LOGIN, (route) => false);
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
      if (closeDialog != null) {
        closeDialog();
      }
      if (e.message != null && e.message!.isNotEmpty && showErrorMsg) {
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
