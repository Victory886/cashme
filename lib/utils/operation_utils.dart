/*
 * @Author: Terry
 * @Date: 2023-10-12 15:05:06
 * @LastEditors: Terry
 * @LastEditTime: 2023-10-17 18:10:42
 * @FilePath: /loannow/lib/utils/operation_utils.dart
 */
import 'package:loannow/config/urls.dart';
import 'package:loannow/net/dio_manager.dart';
import 'package:loannow/utils/device_utils.dart';

class OperationUtils {
  static Future<void> saveOperation(String code) async {
    String? deviceId = await DeviceUtils.getDeviceId();
    Map map = {"operationCode": code, "deviceId": deviceId};
    DioManager.getInstance().doRequest(
      path: Urls.OPERATION_RECORD,
      showLoading: false,
      bodyParams: map,
      method: DioMethod.POST,
      successCallBack: (result) {},
    );
  }
}
