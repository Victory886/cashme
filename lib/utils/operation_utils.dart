/*
 * @Author: Terry
 * @Date: 2023-10-12 15:05:06
 * @LastEditors: Terry
 * @LastEditTime: 2023-11-23 15:37:28
 * @FilePath: /loannow/lib/utils/operation_utils.dart
 */
import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:loannow/config/urls.dart';
import 'package:loannow/net/dio_manager.dart';
import 'package:loannow/utils/device_utils.dart';
import 'package:loannow/utils/secure_cipher_utils.dart';

import '../config/constants.dart';

class OperationUtils {
  /// 发送后端的操作埋点
  static Future<void> saveOperation(String code) async {
    String? deviceId = await DeviceUtils.getDeviceId();
    Map map = {"operationCode": code.aseUnlook(), "deviceId": deviceId};
    DioManager.getInstance().doRequest(
      path: Urls.OPERATION_RECORD,
      showLoading: false,
      bodyParams: map,
      method: DioMethod.POST,
      successCallBack: (result) {},
    );
  }

  /// 发送facebook 的标准事件
  static Future<void> sendFBStandardEvent(String code) async {
    if (Constans.systemConfigBean != null) {
      FacebookAppEvents().logEvent(name: code);
      if (Constans.systemConfigBean!.thirdPartBuriedPoints!.contains(code)) {
        if (code == "SubmitApplication") {
          FacebookAppEvents().logSubscribe(orderId: "");
        } else if (code == "registered") {
          FacebookAppEvents().logCompletedRegistration();
        }
      }
    }
  }

  /// 发送facebook 的普通事件
  static Future<void> sendFBNormalEvents(String eventName) async {
    FacebookAppEvents().logEvent(name: eventName);
  }
}
