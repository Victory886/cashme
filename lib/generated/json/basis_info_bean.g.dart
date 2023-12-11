import 'package:loannow/generated/json/base/json_convert_content.dart';
import 'package:loannow/beans/basis_info_bean.dart';
import 'package:loannow/utils/secure_cipher_utils.dart';

BasisInfoBean $BasisInfoBeanFromJson(Map<String, dynamic> json) {
  final BasisInfoBean basisInfoBean = BasisInfoBean();
  final String? accountNo = jsonConvert.convert<String>(
      json["7XhhEj0/8FyhSXVEULPJjA==".aseUnlook() /* accountNo */]);
  if (accountNo != null) {
    basisInfoBean.accountNo = accountNo;
  }
  final String? bank = jsonConvert
      .convert<String>(json["LD6rmmLlA3O6EsWS3Y/OXg==".aseUnlook() /* bank */]);
  if (bank != null) {
    basisInfoBean.bank = bank;
  }
  final String? bankCode = jsonConvert.convert<String>(
      json["RXwuZmMuEsoBmY3tmDBaHw==".aseUnlook() /* bankCode */]);
  if (bankCode != null) {
    basisInfoBean.bankCode = bankCode;
  }
  final String? bankLogo = jsonConvert.convert<String>(
      json["BKQCPVWCCjLNGe5uf0ZtzA==".aseUnlook() /* bankLogo */]);
  if (bankLogo != null) {
    basisInfoBean.bankLogo = bankLogo;
  }
  final int? birthday = jsonConvert.convert<int>(
      json["bdhosT9J+o+xofBdX8zCdg==".aseUnlook() /* birthday */]);
  if (birthday != null) {
    basisInfoBean.birthday = birthday;
  }
  final int? certificateMaterial = jsonConvert.convert<int>(json[
      "07gPwmr0FSmEwhtGxacqnqZJVL1IIAEXQx1ByWcJhqg="
          .aseUnlook() /* certificateMaterial */]);
  if (certificateMaterial != null) {
    basisInfoBean.certificateMaterial = certificateMaterial;
  }
  final String? certificateNo = jsonConvert.convert<String>(
      json["jKSzUzxcnFoD79OZTSosgg==".aseUnlook() /* certificateNo */]);
  if (certificateNo != null) {
    basisInfoBean.certificateNo = certificateNo;
  }
  final int? certificateType = jsonConvert.convert<int>(
      json["//lnABi2vEOtRnze8hAyuw==".aseUnlook() /* certificateType */]);
  if (certificateType != null) {
    basisInfoBean.certificateType = certificateType;
  }
  final String? companyName = jsonConvert.convert<String>(
      json["Fq5qWlQDNvc+drtA8MgF6Q==".aseUnlook() /* companyName */]);
  if (companyName != null) {
    basisInfoBean.companyName = companyName;
  }
  final String? companyTelephone = jsonConvert.convert<String>(json[
      "L0MVl4vE2d+Eedj0XapRSBjIuy5xOezkao/LkRW5raM="
          .aseUnlook() /* companyTelephone */]);
  if (companyTelephone != null) {
    basisInfoBean.companyTelephone = companyTelephone;
  }
  final List<BasisInfoContactPersons>? contactPersons =
      (json["JOySwcBFNewIkkNdrqecyQ==".aseUnlook() /* contactPersons */]
              as List<dynamic>?)
          ?.map((e) => jsonConvert.convert<BasisInfoContactPersons>(e)
              as BasisInfoContactPersons)
          .toList();
  if (contactPersons != null) {
    basisInfoBean.contactPersons = contactPersons;
  }
  final String? deviceId = jsonConvert.convert<String>(
      json["rx421BNaZibTudvlICRO/Q==".aseUnlook() /* deviceId */]);
  if (deviceId != null) {
    basisInfoBean.deviceId = deviceId;
  }
  final int? education = jsonConvert.convert<int>(
      json["5AkLQ9M6ZdKZrm/UEZm+Vg==".aseUnlook() /* education */]);
  if (education != null) {
    basisInfoBean.education = education;
  }
  final String? email = jsonConvert.convert<String>(
      json["RTKZ/Rwa3/+Wg0N1Z4HIJw==".aseUnlook() /* email */]);
  if (email != null) {
    basisInfoBean.email = email;
  }
  final String? fbAccount = jsonConvert.convert<String>(
      json["YJG+yb2gZIRoUKWhlJCn7A==".aseUnlook() /* fbAccount */]);
  if (fbAccount != null) {
    basisInfoBean.fbAccount = fbAccount;
  }
  final String? firstName = jsonConvert.convert<String>(
      json["QUZqx8YbgcIiDeRmcwgxAA==".aseUnlook() /* firstName */]);
  if (firstName != null) {
    basisInfoBean.firstName = firstName;
  }
  final int? id = jsonConvert
      .convert<int>(json["enyd+2ERRQf7UaKB2w6Exw==".aseUnlook() /* id */]);
  if (id != null) {
    basisInfoBean.id = id;
  }
  final int? incomeId = jsonConvert.convert<int>(
      json["SDeyivI6ZrHoI9AZnCaDwQ==".aseUnlook() /* incomeId */]);
  if (incomeId != null) {
    basisInfoBean.incomeId = incomeId;
  }
  final int? industry = jsonConvert.convert<int>(
      json["iDDb1Vg+Aise3+RmJEv/Hw==".aseUnlook() /* industry */]);
  if (industry != null) {
    basisInfoBean.industry = industry;
  }
  final String? insAccount = jsonConvert.convert<String>(
      json["Acl7FP5T9gZPBLgonytweQ==".aseUnlook() /* insAccount */]);
  if (insAccount != null) {
    basisInfoBean.insAccount = insAccount;
  }
  final String? lastName = jsonConvert.convert<String>(
      json["+Wp2MZyfFCaa8kfau49QaA==".aseUnlook() /* lastName */]);
  if (lastName != null) {
    basisInfoBean.lastName = lastName;
  }
  final int? loanStep = jsonConvert.convert<int>(
      json["vTl3/ZBQ/fDR0AGtshfeHg==".aseUnlook() /* loanStep */]);
  if (loanStep != null) {
    basisInfoBean.loanStep = loanStep;
  }
  final int? maritalStatus = jsonConvert.convert<int>(
      json["+PfZUjbGQ/jM1nXQ0efKig==".aseUnlook() /* maritalStatus */]);
  if (maritalStatus != null) {
    basisInfoBean.maritalStatus = maritalStatus;
  }
  final int? marketBasisId = jsonConvert.convert<int>(
      json["vEg7fq+Q2Nn8P9IGWrCnbQ==".aseUnlook() /* marketBasisId */]);
  if (marketBasisId != null) {
    basisInfoBean.marketBasisId = marketBasisId;
  }
  final int? marketMemberId = jsonConvert.convert<int>(
      json["BgbmTJEsH7/y2k3JO4YUwQ==".aseUnlook() /* marketMemberId */]);
  if (marketMemberId != null) {
    basisInfoBean.marketMemberId = marketMemberId;
  }
  final int? memberId = jsonConvert.convert<int>(
      json["QqJmJJG9o33+jr9unVOIog==".aseUnlook() /* memberId */]);
  if (memberId != null) {
    basisInfoBean.memberId = memberId;
  }
  final String? memberPhone = jsonConvert.convert<String>(
      json["jrfny6ucLBVzYsG5fvuE0Q==".aseUnlook() /* memberPhone */]);
  if (memberPhone != null) {
    basisInfoBean.memberPhone = memberPhone;
  }
  final String? middleName = jsonConvert.convert<String>(
      json["HvGNXSpY0M0BjMjTgI7u3g==".aseUnlook() /* middleName */]);
  if (middleName != null) {
    basisInfoBean.middleName = middleName;
  }
  final String? name = jsonConvert
      .convert<String>(json["Ju3XkDFhqSVpWy/Sth2XKw==".aseUnlook() /* name */]);
  if (name != null) {
    basisInfoBean.name = name;
  }
  final String? nameFormat = jsonConvert.convert<String>(
      json["jeJz+kepycv2Vp8M7ES5KQ==".aseUnlook() /* nameFormat */]);
  if (nameFormat != null) {
    basisInfoBean.nameFormat = nameFormat;
  }
  final int? paymentChannelType = jsonConvert.convert<int>(json[
      "KGpkDNgqHaM5VF6MdcLbvlOhZ59zkY0awx0iRtoeUuI="
          .aseUnlook() /* paymentChannelType */]);
  if (paymentChannelType != null) {
    basisInfoBean.paymentChannelType = paymentChannelType;
  }
  final int? phPhoneVerify = jsonConvert.convert<int>(
      json["k/B6g7lZXSdsVrl4FAseOw==".aseUnlook() /* phPhoneVerify */]);
  if (phPhoneVerify != null) {
    basisInfoBean.phPhoneVerify = phPhoneVerify;
  }
  final int? platform = jsonConvert.convert<int>(
      json["dXE9swsADmcsQ5cPqKdbzA==".aseUnlook() /* platform */]);
  if (platform != null) {
    basisInfoBean.platform = platform;
  }
  final String? positivePhoto = jsonConvert.convert<String>(
      json["JMjhiFmO+ku7cSpdiMzpbg==".aseUnlook() /* positivePhoto */]);
  if (positivePhoto != null) {
    basisInfoBean.positivePhoto = positivePhoto;
  }
  final String? positivePhotoUrl = jsonConvert.convert<String>(json[
      "OYETZTR9eThIa5Ywi/44s+KndmdRVD4pZOTE8N1F9zw="
          .aseUnlook() /* positivePhotoUrl */]);
  if (positivePhotoUrl != null) {
    basisInfoBean.positivePhotoUrl = positivePhotoUrl;
  }
  final int? resideAreaId = jsonConvert.convert<int>(
      json["SRtQ0XJxMVnoqHs6wuzxdA==".aseUnlook() /* resideAreaId */]);
  if (resideAreaId != null) {
    basisInfoBean.resideAreaId = resideAreaId;
  }
  final String? resideBarangay = jsonConvert.convert<String>(
      json["O1bRX+UiCVsj38JeiDA3Lg==".aseUnlook() /* resideBarangay */]);
  if (resideBarangay != null) {
    basisInfoBean.resideBarangay = resideBarangay;
  }
  final String? resideCity = jsonConvert.convert<String>(
      json["aZdHBTPcvJzcoEe/EZ9kRQ==".aseUnlook() /* resideCity */]);
  if (resideCity != null) {
    basisInfoBean.resideCity = resideCity;
  }
  final String? resideProvince = jsonConvert.convert<String>(
      json["8CmDM2SGchdpZklPBZl83Q==".aseUnlook() /* resideProvince */]);
  if (resideProvince != null) {
    basisInfoBean.resideProvince = resideProvince;
  }
  final int? resideTime = jsonConvert.convert<int>(
      json["AATrTV+lLT9DcLS+gS8+7g==".aseUnlook() /* resideTime */]);
  if (resideTime != null) {
    basisInfoBean.resideTime = resideTime;
  }
  final int? sex = jsonConvert
      .convert<int>(json["3l3Uq7ri2YGytjxvhGXj6g==".aseUnlook() /* sex */]);
  if (sex != null) {
    basisInfoBean.sex = sex;
  }
  return basisInfoBean;
}

Map<String, dynamic> $BasisInfoBeanToJson(BasisInfoBean entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data["7XhhEj0/8FyhSXVEULPJjA==".aseUnlook() /* accountNo */] =
      entity.accountNo;
  data["LD6rmmLlA3O6EsWS3Y/OXg==".aseUnlook() /* bank */] = entity.bank;
  data["RXwuZmMuEsoBmY3tmDBaHw==".aseUnlook() /* bankCode */] = entity.bankCode;
  data["BKQCPVWCCjLNGe5uf0ZtzA==".aseUnlook() /* bankLogo */] = entity.bankLogo;
  data["bdhosT9J+o+xofBdX8zCdg==".aseUnlook() /* birthday */] = entity.birthday;
  data["07gPwmr0FSmEwhtGxacqnqZJVL1IIAEXQx1ByWcJhqg="
      .aseUnlook() /* certificateMaterial */] = entity.certificateMaterial;
  data["jKSzUzxcnFoD79OZTSosgg==".aseUnlook() /* certificateNo */] =
      entity.certificateNo;
  data["//lnABi2vEOtRnze8hAyuw==".aseUnlook() /* certificateType */] =
      entity.certificateType;
  data["Fq5qWlQDNvc+drtA8MgF6Q==".aseUnlook() /* companyName */] =
      entity.companyName;
  data["L0MVl4vE2d+Eedj0XapRSBjIuy5xOezkao/LkRW5raM="
      .aseUnlook() /* companyTelephone */] = entity.companyTelephone;
  data["JOySwcBFNewIkkNdrqecyQ==".aseUnlook() /* contactPersons */] =
      entity.contactPersons?.map((v) => v.toJson()).toList();
  data["rx421BNaZibTudvlICRO/Q==".aseUnlook() /* deviceId */] = entity.deviceId;
  data["5AkLQ9M6ZdKZrm/UEZm+Vg==".aseUnlook() /* education */] =
      entity.education;
  data["RTKZ/Rwa3/+Wg0N1Z4HIJw==".aseUnlook() /* email */] = entity.email;
  data["YJG+yb2gZIRoUKWhlJCn7A==".aseUnlook() /* fbAccount */] =
      entity.fbAccount;
  data["QUZqx8YbgcIiDeRmcwgxAA==".aseUnlook() /* firstName */] =
      entity.firstName;
  data["enyd+2ERRQf7UaKB2w6Exw==".aseUnlook() /* id */] = entity.id;
  data["SDeyivI6ZrHoI9AZnCaDwQ==".aseUnlook() /* incomeId */] = entity.incomeId;
  data["iDDb1Vg+Aise3+RmJEv/Hw==".aseUnlook() /* industry */] = entity.industry;
  data["Acl7FP5T9gZPBLgonytweQ==".aseUnlook() /* insAccount */] =
      entity.insAccount;
  data["+Wp2MZyfFCaa8kfau49QaA==".aseUnlook() /* lastName */] = entity.lastName;
  data["vTl3/ZBQ/fDR0AGtshfeHg==".aseUnlook() /* loanStep */] = entity.loanStep;
  data["+PfZUjbGQ/jM1nXQ0efKig==".aseUnlook() /* maritalStatus */] =
      entity.maritalStatus;
  data["vEg7fq+Q2Nn8P9IGWrCnbQ==".aseUnlook() /* marketBasisId */] =
      entity.marketBasisId;
  data["BgbmTJEsH7/y2k3JO4YUwQ==".aseUnlook() /* marketMemberId */] =
      entity.marketMemberId;
  data["QqJmJJG9o33+jr9unVOIog==".aseUnlook() /* memberId */] = entity.memberId;
  data["jrfny6ucLBVzYsG5fvuE0Q==".aseUnlook() /* memberPhone */] =
      entity.memberPhone;
  data["HvGNXSpY0M0BjMjTgI7u3g==".aseUnlook() /* middleName */] =
      entity.middleName;
  data["Ju3XkDFhqSVpWy/Sth2XKw==".aseUnlook() /* name */] = entity.name;
  data["jeJz+kepycv2Vp8M7ES5KQ==".aseUnlook() /* nameFormat */] =
      entity.nameFormat;
  data["KGpkDNgqHaM5VF6MdcLbvlOhZ59zkY0awx0iRtoeUuI="
      .aseUnlook() /* paymentChannelType */] = entity.paymentChannelType;
  data["k/B6g7lZXSdsVrl4FAseOw==".aseUnlook() /* phPhoneVerify */] =
      entity.phPhoneVerify;
  data["dXE9swsADmcsQ5cPqKdbzA==".aseUnlook() /* platform */] = entity.platform;
  data["JMjhiFmO+ku7cSpdiMzpbg==".aseUnlook() /* positivePhoto */] =
      entity.positivePhoto;
  data["OYETZTR9eThIa5Ywi/44s+KndmdRVD4pZOTE8N1F9zw="
      .aseUnlook() /* positivePhotoUrl */] = entity.positivePhotoUrl;
  data["SRtQ0XJxMVnoqHs6wuzxdA==".aseUnlook() /* resideAreaId */] =
      entity.resideAreaId;
  data["O1bRX+UiCVsj38JeiDA3Lg==".aseUnlook() /* resideBarangay */] =
      entity.resideBarangay;
  data["aZdHBTPcvJzcoEe/EZ9kRQ==".aseUnlook() /* resideCity */] =
      entity.resideCity;
  data["8CmDM2SGchdpZklPBZl83Q==".aseUnlook() /* resideProvince */] =
      entity.resideProvince;
  data["AATrTV+lLT9DcLS+gS8+7g==".aseUnlook() /* resideTime */] =
      entity.resideTime;
  data["3l3Uq7ri2YGytjxvhGXj6g==".aseUnlook() /* sex */] = entity.sex;
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
  final int? basisInfoId = jsonConvert.convert<int>(
      json["OxY4XLUq3IXn9FGxVprTNA==".aseUnlook() /* basisInfoId */]);
  if (basisInfoId != null) {
    basisInfoContactPersons.basisInfoId = basisInfoId;
  }
  final int? createTime = jsonConvert.convert<int>(
      json["kPNJHoEooCfPEkVMHvISLg==".aseUnlook() /* createTime */]);
  if (createTime != null) {
    basisInfoContactPersons.createTime = createTime;
  }
  final int? id = jsonConvert
      .convert<int>(json["enyd+2ERRQf7UaKB2w6Exw==".aseUnlook() /* id */]);
  if (id != null) {
    basisInfoContactPersons.id = id;
  }
  final String? name = jsonConvert
      .convert<String>(json["Ju3XkDFhqSVpWy/Sth2XKw==".aseUnlook() /* name */]);
  if (name != null) {
    basisInfoContactPersons.name = name;
  }
  final String? relationship = jsonConvert.convert<String>(
      json["5qyjGss5pc3DZGFgQN5m2Q==".aseUnlook() /* relationship */]);
  if (relationship != null) {
    basisInfoContactPersons.relationship = relationship;
  }
  final String? telephoneNo = jsonConvert.convert<String>(
      json["QZkkEotg0ccVXSRRchK2SQ==".aseUnlook() /* telephoneNo */]);
  if (telephoneNo != null) {
    basisInfoContactPersons.telephoneNo = telephoneNo;
  }
  final int? telephoneNoHash = jsonConvert.convert<int>(
      json["aTTUhD6hirX7PqGtF4kJvA==".aseUnlook() /* telephoneNoHash */]);
  if (telephoneNoHash != null) {
    basisInfoContactPersons.telephoneNoHash = telephoneNoHash;
  }
  final int? type = jsonConvert
      .convert<int>(json["TB050ji6SdcEjfnkbULa3w==".aseUnlook() /* type */]);
  if (type != null) {
    basisInfoContactPersons.type = type;
  }
  final int? userid = jsonConvert
      .convert<int>(json["pG57Ogyz90GyvjFgzMNAIA==".aseUnlook() /* userid */]);
  if (userid != null) {
    basisInfoContactPersons.userid = userid;
  }
  return basisInfoContactPersons;
}

Map<String, dynamic> $BasisInfoContactPersonsToJson(
    BasisInfoContactPersons entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data["OxY4XLUq3IXn9FGxVprTNA==".aseUnlook() /* basisInfoId */] =
      entity.basisInfoId;
  data["kPNJHoEooCfPEkVMHvISLg==".aseUnlook() /* createTime */] =
      entity.createTime;
  data["enyd+2ERRQf7UaKB2w6Exw==".aseUnlook() /* id */] = entity.id;
  data["Ju3XkDFhqSVpWy/Sth2XKw==".aseUnlook() /* name */] = entity.name;
  data["5qyjGss5pc3DZGFgQN5m2Q==".aseUnlook() /* relationship */] =
      entity.relationship;
  data["QZkkEotg0ccVXSRRchK2SQ==".aseUnlook() /* telephoneNo */] =
      entity.telephoneNo;
  data["aTTUhD6hirX7PqGtF4kJvA==".aseUnlook() /* telephoneNoHash */] =
      entity.telephoneNoHash;
  data["TB050ji6SdcEjfnkbULa3w==".aseUnlook() /* type */] = entity.type;
  data["pG57Ogyz90GyvjFgzMNAIA==".aseUnlook() /* userid */] = entity.userid;
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
