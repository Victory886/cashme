import 'package:loannow/generated/json/base/json_convert_content.dart';
import 'package:loannow/beans/basis_info_bean.dart';

BasisInfoBean $BasisInfoBeanFromJson(Map<String, dynamic> json) {
  final BasisInfoBean basisInfoBean = BasisInfoBean();
  final String? accountNo = jsonConvert.convert<String>(json["accountNo"]);
  if (accountNo != null) {
    basisInfoBean.accountNo = accountNo;
  }
  final String? bank = jsonConvert.convert<String>(json["bank"]);
  if (bank != null) {
    basisInfoBean.bank = bank;
  }
  final String? bankCode = jsonConvert.convert<String>(json["bankCode"]);
  if (bankCode != null) {
    basisInfoBean.bankCode = bankCode;
  }
  final String? bankLogo = jsonConvert.convert<String>(json["bankLogo"]);
  if (bankLogo != null) {
    basisInfoBean.bankLogo = bankLogo;
  }
  final int? birthday = jsonConvert.convert<int>(json["birthday"]);
  if (birthday != null) {
    basisInfoBean.birthday = birthday;
  }
  final int? certificateMaterial =
      jsonConvert.convert<int>(json["certificateMaterial"]);
  if (certificateMaterial != null) {
    basisInfoBean.certificateMaterial = certificateMaterial;
  }
  final String? certificateNo =
      jsonConvert.convert<String>(json["certificateNo"]);
  if (certificateNo != null) {
    basisInfoBean.certificateNo = certificateNo;
  }
  final int? certificateType =
      jsonConvert.convert<int>(json["certificateType"]);
  if (certificateType != null) {
    basisInfoBean.certificateType = certificateType;
  }
  final String? companyName = jsonConvert.convert<String>(json["companyName"]);
  if (companyName != null) {
    basisInfoBean.companyName = companyName;
  }
  final String? companyTelephone =
      jsonConvert.convert<String>(json["companyTelephone"]);
  if (companyTelephone != null) {
    basisInfoBean.companyTelephone = companyTelephone;
  }
  final List<BasisInfoContactPersons>? contactPersons =
      (json["contactPersons"] as List<dynamic>?)
          ?.map((e) => jsonConvert.convert<BasisInfoContactPersons>(e)
              as BasisInfoContactPersons)
          .toList();
  if (contactPersons != null) {
    basisInfoBean.contactPersons = contactPersons;
  }
  final String? deviceId = jsonConvert.convert<String>(json["deviceId"]);
  if (deviceId != null) {
    basisInfoBean.deviceId = deviceId;
  }
  final int? education = jsonConvert.convert<int>(json["education"]);
  if (education != null) {
    basisInfoBean.education = education;
  }
  final String? email = jsonConvert.convert<String>(json["email"]);
  if (email != null) {
    basisInfoBean.email = email;
  }
  final String? fbAccount = jsonConvert.convert<String>(json["fbAccount"]);
  if (fbAccount != null) {
    basisInfoBean.fbAccount = fbAccount;
  }
  final String? firstName = jsonConvert.convert<String>(json["firstName"]);
  if (firstName != null) {
    basisInfoBean.firstName = firstName;
  }
  final int? id = jsonConvert.convert<int>(json["id"]);
  if (id != null) {
    basisInfoBean.id = id;
  }
  final int? incomeId = jsonConvert.convert<int>(json["incomeId"]);
  if (incomeId != null) {
    basisInfoBean.incomeId = incomeId;
  }
  final int? industry = jsonConvert.convert<int>(json["industry"]);
  if (industry != null) {
    basisInfoBean.industry = industry;
  }
  final String? insAccount = jsonConvert.convert<String>(json["insAccount"]);
  if (insAccount != null) {
    basisInfoBean.insAccount = insAccount;
  }
  final String? lastName = jsonConvert.convert<String>(json["lastName"]);
  if (lastName != null) {
    basisInfoBean.lastName = lastName;
  }
  final int? loanStep = jsonConvert.convert<int>(json["loanStep"]);
  if (loanStep != null) {
    basisInfoBean.loanStep = loanStep;
  }
  final int? maritalStatus = jsonConvert.convert<int>(json["maritalStatus"]);
  if (maritalStatus != null) {
    basisInfoBean.maritalStatus = maritalStatus;
  }
  final int? marketBasisId = jsonConvert.convert<int>(json["marketBasisId"]);
  if (marketBasisId != null) {
    basisInfoBean.marketBasisId = marketBasisId;
  }
  final int? marketMemberId = jsonConvert.convert<int>(json["marketMemberId"]);
  if (marketMemberId != null) {
    basisInfoBean.marketMemberId = marketMemberId;
  }
  final int? memberId = jsonConvert.convert<int>(json["memberId"]);
  if (memberId != null) {
    basisInfoBean.memberId = memberId;
  }
  final String? memberPhone = jsonConvert.convert<String>(json["memberPhone"]);
  if (memberPhone != null) {
    basisInfoBean.memberPhone = memberPhone;
  }
  final String? middleName = jsonConvert.convert<String>(json["middleName"]);
  if (middleName != null) {
    basisInfoBean.middleName = middleName;
  }
  final String? name = jsonConvert.convert<String>(json["name"]);
  if (name != null) {
    basisInfoBean.name = name;
  }
  final String? nameFormat = jsonConvert.convert<String>(json["nameFormat"]);
  if (nameFormat != null) {
    basisInfoBean.nameFormat = nameFormat;
  }
  final int? paymentChannelType =
      jsonConvert.convert<int>(json["paymentChannelType"]);
  if (paymentChannelType != null) {
    basisInfoBean.paymentChannelType = paymentChannelType;
  }
  final int? phPhoneVerify = jsonConvert.convert<int>(json["phPhoneVerify"]);
  if (phPhoneVerify != null) {
    basisInfoBean.phPhoneVerify = phPhoneVerify;
  }
  final int? platform = jsonConvert.convert<int>(json["platform"]);
  if (platform != null) {
    basisInfoBean.platform = platform;
  }
  final String? positivePhoto =
      jsonConvert.convert<String>(json["positivePhoto"]);
  if (positivePhoto != null) {
    basisInfoBean.positivePhoto = positivePhoto;
  }
  final String? positivePhotoUrl =
      jsonConvert.convert<String>(json["positivePhotoUrl"]);
  if (positivePhotoUrl != null) {
    basisInfoBean.positivePhotoUrl = positivePhotoUrl;
  }
  final int? resideAreaId = jsonConvert.convert<int>(json["resideAreaId"]);
  if (resideAreaId != null) {
    basisInfoBean.resideAreaId = resideAreaId;
  }
  final String? resideBarangay =
      jsonConvert.convert<String>(json["resideBarangay"]);
  if (resideBarangay != null) {
    basisInfoBean.resideBarangay = resideBarangay;
  }
  final String? resideCity = jsonConvert.convert<String>(json["resideCity"]);
  if (resideCity != null) {
    basisInfoBean.resideCity = resideCity;
  }
  final String? resideProvince =
      jsonConvert.convert<String>(json["resideProvince"]);
  if (resideProvince != null) {
    basisInfoBean.resideProvince = resideProvince;
  }
  final int? resideTime = jsonConvert.convert<int>(json["resideTime"]);
  if (resideTime != null) {
    basisInfoBean.resideTime = resideTime;
  }
  final int? sex = jsonConvert.convert<int>(json["sex"]);
  if (sex != null) {
    basisInfoBean.sex = sex;
  }
  return basisInfoBean;
}

Map<String, dynamic> $BasisInfoBeanToJson(BasisInfoBean entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data["accountNo"] = entity.accountNo;
  data["bank"] = entity.bank;
  data["bankCode"] = entity.bankCode;
  data["bankLogo"] = entity.bankLogo;
  data["birthday"] = entity.birthday;
  data["certificateMaterial"] = entity.certificateMaterial;
  data["certificateNo"] = entity.certificateNo;
  data["certificateType"] = entity.certificateType;
  data["companyName"] = entity.companyName;
  data["companyTelephone"] = entity.companyTelephone;
  data["contactPersons"] =
      entity.contactPersons?.map((v) => v.toJson()).toList();
  data["deviceId"] = entity.deviceId;
  data["education"] = entity.education;
  data["email"] = entity.email;
  data["fbAccount"] = entity.fbAccount;
  data["firstName"] = entity.firstName;
  data["id"] = entity.id;
  data["incomeId"] = entity.incomeId;
  data["industry"] = entity.industry;
  data["insAccount"] = entity.insAccount;
  data["lastName"] = entity.lastName;
  data["loanStep"] = entity.loanStep;
  data["maritalStatus"] = entity.maritalStatus;
  data["marketBasisId"] = entity.marketBasisId;
  data["marketMemberId"] = entity.marketMemberId;
  data["memberId"] = entity.memberId;
  data["memberPhone"] = entity.memberPhone;
  data["middleName"] = entity.middleName;
  data["name"] = entity.name;
  data["nameFormat"] = entity.nameFormat;
  data["paymentChannelType"] = entity.paymentChannelType;
  data["phPhoneVerify"] = entity.phPhoneVerify;
  data["platform"] = entity.platform;
  data["positivePhoto"] = entity.positivePhoto;
  data["positivePhotoUrl"] = entity.positivePhotoUrl;
  data["resideAreaId"] = entity.resideAreaId;
  data["resideBarangay"] = entity.resideBarangay;
  data["resideCity"] = entity.resideCity;
  data["resideProvince"] = entity.resideProvince;
  data["resideTime"] = entity.resideTime;
  data["sex"] = entity.sex;
  return data;
}

extension BasisInfoBeanExtension on BasisInfoBean {
  BasisInfoBean copyWith({
    String? accountNo,
    String? bank,
    String? bankCode,
    String? bankLogo,
    int? birthday,
    int? certificateMaterial,
    String? certificateNo,
    int? certificateType,
    String? companyName,
    String? companyTelephone,
    List<BasisInfoContactPersons>? contactPersons,
    String? deviceId,
    int? education,
    String? email,
    String? fbAccount,
    String? firstName,
    int? id,
    int? incomeId,
    int? industry,
    String? insAccount,
    String? lastName,
    int? loanStep,
    int? maritalStatus,
    int? marketBasisId,
    int? marketMemberId,
    int? memberId,
    String? memberPhone,
    String? middleName,
    String? name,
    String? nameFormat,
    int? paymentChannelType,
    int? phPhoneVerify,
    int? platform,
    String? positivePhoto,
    String? positivePhotoUrl,
    int? resideAreaId,
    String? resideBarangay,
    String? resideCity,
    String? resideProvince,
    int? resideTime,
    int? sex,
  }) {
    return BasisInfoBean()
      ..accountNo = accountNo ?? this.accountNo
      ..bank = bank ?? this.bank
      ..bankCode = bankCode ?? this.bankCode
      ..bankLogo = bankLogo ?? this.bankLogo
      ..birthday = birthday ?? this.birthday
      ..certificateMaterial = certificateMaterial ?? this.certificateMaterial
      ..certificateNo = certificateNo ?? this.certificateNo
      ..certificateType = certificateType ?? this.certificateType
      ..companyName = companyName ?? this.companyName
      ..companyTelephone = companyTelephone ?? this.companyTelephone
      ..contactPersons = contactPersons ?? this.contactPersons
      ..deviceId = deviceId ?? this.deviceId
      ..education = education ?? this.education
      ..email = email ?? this.email
      ..fbAccount = fbAccount ?? this.fbAccount
      ..firstName = firstName ?? this.firstName
      ..id = id ?? this.id
      ..incomeId = incomeId ?? this.incomeId
      ..industry = industry ?? this.industry
      ..insAccount = insAccount ?? this.insAccount
      ..lastName = lastName ?? this.lastName
      ..loanStep = loanStep ?? this.loanStep
      ..maritalStatus = maritalStatus ?? this.maritalStatus
      ..marketBasisId = marketBasisId ?? this.marketBasisId
      ..marketMemberId = marketMemberId ?? this.marketMemberId
      ..memberId = memberId ?? this.memberId
      ..memberPhone = memberPhone ?? this.memberPhone
      ..middleName = middleName ?? this.middleName
      ..name = name ?? this.name
      ..nameFormat = nameFormat ?? this.nameFormat
      ..paymentChannelType = paymentChannelType ?? this.paymentChannelType
      ..phPhoneVerify = phPhoneVerify ?? this.phPhoneVerify
      ..platform = platform ?? this.platform
      ..positivePhoto = positivePhoto ?? this.positivePhoto
      ..positivePhotoUrl = positivePhotoUrl ?? this.positivePhotoUrl
      ..resideAreaId = resideAreaId ?? this.resideAreaId
      ..resideBarangay = resideBarangay ?? this.resideBarangay
      ..resideCity = resideCity ?? this.resideCity
      ..resideProvince = resideProvince ?? this.resideProvince
      ..resideTime = resideTime ?? this.resideTime
      ..sex = sex ?? this.sex;
  }
}

BasisInfoContactPersons $BasisInfoContactPersonsFromJson(
    Map<String, dynamic> json) {
  final BasisInfoContactPersons basisInfoContactPersons =
      BasisInfoContactPersons();
  final int? basisInfoId = jsonConvert.convert<int>(json["basisInfoId"]);
  if (basisInfoId != null) {
    basisInfoContactPersons.basisInfoId = basisInfoId;
  }
  final int? createTime = jsonConvert.convert<int>(json["createTime"]);
  if (createTime != null) {
    basisInfoContactPersons.createTime = createTime;
  }
  final int? id = jsonConvert.convert<int>(json["id"]);
  if (id != null) {
    basisInfoContactPersons.id = id;
  }
  final String? name = jsonConvert.convert<String>(json["name"]);
  if (name != null) {
    basisInfoContactPersons.name = name;
  }
  final String? relationship =
      jsonConvert.convert<String>(json["relationship"]);
  if (relationship != null) {
    basisInfoContactPersons.relationship = relationship;
  }
  final String? telephoneNo = jsonConvert.convert<String>(json["telephoneNo"]);
  if (telephoneNo != null) {
    basisInfoContactPersons.telephoneNo = telephoneNo;
  }
  final int? telephoneNoHash =
      jsonConvert.convert<int>(json["telephoneNoHash"]);
  if (telephoneNoHash != null) {
    basisInfoContactPersons.telephoneNoHash = telephoneNoHash;
  }
  final int? type = jsonConvert.convert<int>(json["type"]);
  if (type != null) {
    basisInfoContactPersons.type = type;
  }
  final int? userid = jsonConvert.convert<int>(json["userid"]);
  if (userid != null) {
    basisInfoContactPersons.userid = userid;
  }
  return basisInfoContactPersons;
}

Map<String, dynamic> $BasisInfoContactPersonsToJson(
    BasisInfoContactPersons entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data["basisInfoId"] = entity.basisInfoId;
  data["createTime"] = entity.createTime;
  data["id"] = entity.id;
  data["name"] = entity.name;
  data["relationship"] = entity.relationship;
  data["telephoneNo"] = entity.telephoneNo;
  data["telephoneNoHash"] = entity.telephoneNoHash;
  data["type"] = entity.type;
  data["userid"] = entity.userid;
  return data;
}

extension BasisInfoContactPersonsExtension on BasisInfoContactPersons {
  BasisInfoContactPersons copyWith({
    int? basisInfoId,
    int? createTime,
    int? id,
    String? name,
    String? relationship,
    String? telephoneNo,
    int? telephoneNoHash,
    int? type,
    int? userid,
  }) {
    return BasisInfoContactPersons()
      ..basisInfoId = basisInfoId ?? this.basisInfoId
      ..createTime = createTime ?? this.createTime
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..relationship = relationship ?? this.relationship
      ..telephoneNo = telephoneNo ?? this.telephoneNo
      ..telephoneNoHash = telephoneNoHash ?? this.telephoneNoHash
      ..type = type ?? this.type
      ..userid = userid ?? this.userid;
  }
}
