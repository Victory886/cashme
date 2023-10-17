import 'package:loannow/beans/upload_sign_bean.dart';
import 'package:loannow/generated/json/base/json_convert_content.dart';

UploadSignBean $UploadSignBeanFromJson(Map<String, dynamic> json) {
  final UploadSignBean uploadSignBean = UploadSignBean();
  final bool? appInstallStatus = jsonConvert.convert<bool>(json['appInstallStatus']);
  if (appInstallStatus != null) {
    uploadSignBean.appInstallStatus = appInstallStatus;
  }
  final bool? contactListStatus = jsonConvert.convert<bool>(json['contactListStatus']);
  if (contactListStatus != null) {
    uploadSignBean.contactListStatus = contactListStatus;
  }
  final bool? noteRecordStatus = jsonConvert.convert<bool>(json['noteRecordStatus']);
  if (noteRecordStatus != null) {
    uploadSignBean.noteRecordStatus = noteRecordStatus;
  }
  return uploadSignBean;
}

Map<String, dynamic> $UploadSignBeanToJson(UploadSignBean entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['appInstallStatus'] = entity.appInstallStatus;
  data['contactListStatus'] = entity.contactListStatus;
  data['noteRecordStatus'] = entity.noteRecordStatus;
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
