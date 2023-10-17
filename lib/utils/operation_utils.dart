import 'package:loannow/config/urls.dart';
import 'package:loannow/net/dio_manager.dart';
import 'package:loannow/utils/device_utils.dart';

class OperationUtils {
  static Future<void> saveOperation(String code) async {
    String? deviceId = await DeviceUtils.getDeviceId();
    Map map = {"operationCode": code, "deviceId": deviceId};
    DioManager.getInstance()
        .doRequest(path: Urls.OPERATION_RECORD, showLoading: false, bodyParams: map, method: DioMethod.POST, successCallBack: (result) {});
  }
}
