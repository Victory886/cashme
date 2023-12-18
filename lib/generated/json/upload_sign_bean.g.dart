/*
 * @Author: Terry
 * @Date: 2023-10-13 16:05:59
 * @LastEditors: Terry
 * @LastEditTime: 2023-12-11 17:25:25
 * @FilePath: /loannow/lib/generated/json/upload_sign_bean.g.dart
 */
import 'package:loannow/generated/json/base/json_convert_content.dart';
import 'package:loannow/beans/upload_sign_bean.dart';
import 'package:loannow/utils/secure_cipher_utils.dart';

UploadSignBean $UploadSignBeanFromJson(Map<String, dynamic> json) {
  final UploadSignBean uploadSignBean = UploadSignBean();
  final bool? appInstallStatus = jsonConvert.convert<bool>(json[
      "wPiSMx62+6R4DLSzM/4feS8Y81szJKqG68O66OVGyjs="
          .aseUnlook() /* appInstallStatus */]);
  if (appInstallStatus != null) {
    uploadSignBean.appInstallStatus = appInstallStatus;
  }
  final bool? contactListStatus = jsonConvert.convert<bool>(json[
      "j2B7Vfgq7nWMwJU1wl0boyYAzUD3s2ZczU1BB52x17A="
          .aseUnlook() /* contactListStatus */]);
  if (contactListStatus != null) {
    uploadSignBean.contactListStatus = contactListStatus;
  }
  final bool? noteRecordStatus = jsonConvert.convert<bool>(json[
      "PVriM9g5jwGs7AN900I1HcEzemGMjUfW21Hp/nwIsws="
          .aseUnlook() /* noteRecordStatus */]);
  if (noteRecordStatus != null) {
    uploadSignBean.noteRecordStatus = noteRecordStatus;
  }
  return uploadSignBean;
}

Map<String, dynamic> $UploadSignBeanToJson(UploadSignBean entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data["wPiSMx62+6R4DLSzM/4feS8Y81szJKqG68O66OVGyjs="
      .aseUnlook() /* appInstallStatus */] = entity.appInstallStatus;
  data["j2B7Vfgq7nWMwJU1wl0boyYAzUD3s2ZczU1BB52x17A="
      .aseUnlook() /* contactListStatus */] = entity.contactListStatus;
  data["PVriM9g5jwGs7AN900I1HcEzemGMjUfW21Hp/nwIsws="
      .aseUnlook() /* noteRecordStatus */] = entity.noteRecordStatus;
  return data;
}

extension UploadSignBeanExtension on UploadSignBean {
  UploadSignBean copyWith({
    bool? appInstallStatus,
    bool? contactListStatus,
    bool? noteRecordStatus,
  }) {
    return UploadSignBean()
      ..appInstallStatus = appInstallStatus ?? this.appInstallStatus
      ..contactListStatus = contactListStatus ?? this.contactListStatus
      ..noteRecordStatus = noteRecordStatus ?? this.noteRecordStatus;
  }
}
