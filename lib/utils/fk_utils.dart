/*
 * @Author: Terry
 * @Date: 2023-10-13 16:05:59
 * @LastEditors: Terry
 * @LastEditTime: 2023-11-03 14:49:43
 * @FilePath: /loannow/lib/utils/fk_utils.dart
 */
import 'package:loannow/beans/upload_sign_bean.dart';
import 'package:loannow/config/urls.dart';
import 'package:loannow/net/dio_manager.dart';
import 'package:loannow/utils/device_utils.dart';
import 'package:permission_handler/permission_handler.dart';

class FkUtils {
  // static Future<bool> uploadApp(UploadSignBean bean) async {
  //   var success = bean.appInstallStatus ?? false;
  //   if (success) return success;
  //   var str = await DeviceUtils.getInstallAppList();
  //   await DioManager.getInstance().doRequest(
  //     path: Urls.APPLIST_SAVE,
  //     method: DioMethod.POST,
  //     bodyParams: str,
  //     showLoading: false,
  //     successCallBack: (result) => {success = true},
  //   );
  //   return success;
  // }

  // static Future<bool> uploadSms(UploadSignBean bean) async {
  //   var success = bean.noteRecordStatus ?? false;
  //   if (success) return success;
  //   try {
  //     var status = await Permission.sms.request();
  //     if (status.isGranted) {
  //       var str = await DeviceUtils.getSmsList();
  //       await DioManager.getInstance().doRequest(
  //         path: Urls.SMS_LIST_SAVE,
  //         method: DioMethod.POST,
  //         bodyParams: str,
  //         showLoading: false,
  //         successCallBack: (result) => {success = true},
  //       );
  //     }
  //   } catch (e) {}
  //   return success;
  // }

  // static Future<bool> uploadContact(UploadSignBean bean) async {
  //   var success = bean.contactListStatus ?? false;
  //   if (success) return success;
  //   var str = await DeviceUtils.getContactList();
  //   await DioManager.getInstance().doRequest(
  //     path: Urls.CONTACT_LIST_SAVE,
  //     method: DioMethod.POST,
  //     bodyParams: str,
  //     showLoading: false,
  //     successCallBack: (result) => {success = true},
  //   );
  //   return success;
  // }
}
