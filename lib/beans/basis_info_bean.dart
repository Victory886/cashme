import 'dart:convert';

import 'package:loannow/generated/json/base/json_field.dart';
import 'package:loannow/generated/json/basis_info_bean.g.dart';

export 'package:loannow/generated/json/basis_info_bean.g.dart';

@JsonSerializable()
class BasisInfoBean {
  String? accountNo = '';
  String? bank = '';
  String? bankCode = '';
  String? bankLogo = '';
  int? birthday = 0;
  int? certificateMaterial = 0;
  String? certificateNo = '';
  int? certificateType = 0;
  String? companyName = '';
  String? companyTelephone = '';
  List<BasisInfoContactPersons>? contactPersons = [];
  String? deviceId = '';
  int? education = 0;
  String? email = '';
  String? fbAccount = '';
  String? firstName = '';
  int? id = 0;
  int? incomeId = 0;
  int? industry = 0;
  String? insAccount = '';
  String? lastName = '';
  int? loanStep = 0;
  int? maritalStatus = 0;
  int? marketBasisId = 0;
  int? marketMemberId = 0;
  int? memberId = 0;
  String? memberPhone = '';
  String? middleName = '';
  String? name = '';
  String? nameFormat = '';
  int? paymentChannelType = 0;
  int? phPhoneVerify = 0;
  int? platform = 0;
  String? positivePhoto = '';
  String? positivePhotoUrl = '';
  int? resideAreaId = 0;
  String? resideBarangay = '';
  String? resideCity = '';
  String? resideProvince = '';
  int? resideTime = 0;
  int? sex = 0;

  BasisInfoBean();

  factory BasisInfoBean.fromJson(Map<String, dynamic> json) => $BasisInfoBeanFromJson(json);

  Map<String, dynamic> toJson() => $BasisInfoBeanToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BasisInfoContactPersons {
  int? basisInfoId = 0;
  int? createTime = 0;
  int? id = 0;
  String? name = '';
  String? relationship = '';
  String? telephoneNo = '';
  int? telephoneNoHash = 0;
  int? type = 0;
  int? userid = 0;

  BasisInfoContactPersons();

  factory BasisInfoContactPersons.fromJson(Map<String, dynamic> json) => $BasisInfoContactPersonsFromJson(json);

  Map<String, dynamic> toJson() => $BasisInfoContactPersonsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
