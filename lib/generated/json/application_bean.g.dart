import 'package:loannow/generated/json/base/json_convert_content.dart';
import 'package:loannow/beans/application_bean.dart';

ApplicationBean $ApplicationBeanFromJson(Map<String, dynamic> json) {
  final ApplicationBean applicationBean = ApplicationBean();
  final int? accountAmount = jsonConvert.convert<int>(json["accountAmount"]);
  if (accountAmount != null) {
    applicationBean.accountAmount = accountAmount;
  }
  final int? accountManageExpense =
      jsonConvert.convert<int>(json["accountManageExpense"]);
  if (accountManageExpense != null) {
    applicationBean.accountManageExpense = accountManageExpense;
  }
  final int? appInfoId = jsonConvert.convert<int>(json["appInfoId"]);
  if (appInfoId != null) {
    applicationBean.appInfoId = appInfoId;
  }
  final int? applicationTime =
      jsonConvert.convert<int>(json["applicationTime"]);
  if (applicationTime != null) {
    applicationBean.applicationTime = applicationTime;
  }
  final int? auditServiceExpense =
      jsonConvert.convert<int>(json["auditServiceExpense"]);
  if (auditServiceExpense != null) {
    applicationBean.auditServiceExpense = auditServiceExpense;
  }
  final int? couponDeduction =
      jsonConvert.convert<int>(json["couponDeduction"]);
  if (couponDeduction != null) {
    applicationBean.couponDeduction = couponDeduction;
  }
  final String? deviceId = jsonConvert.convert<String>(json["deviceId"]);
  if (deviceId != null) {
    applicationBean.deviceId = deviceId;
  }
  final bool? facebookUpdate =
      jsonConvert.convert<bool>(json["facebookUpdate"]);
  if (facebookUpdate != null) {
    applicationBean.facebookUpdate = facebookUpdate;
  }
  final int? finishOptId = jsonConvert.convert<int>(json["finishOptId"]);
  if (finishOptId != null) {
    applicationBean.finishOptId = finishOptId;
  }
  final int? finishTime = jsonConvert.convert<int>(json["finishTime"]);
  if (finishTime != null) {
    applicationBean.finishTime = finishTime;
  }
  final bool? fkCalculated = jsonConvert.convert<bool>(json["fkCalculated"]);
  if (fkCalculated != null) {
    applicationBean.fkCalculated = fkCalculated;
  }
  final double? geoLatitude = jsonConvert.convert<double>(json["geoLatitude"]);
  if (geoLatitude != null) {
    applicationBean.geoLatitude = geoLatitude;
  }
  final double? geoLongitude =
      jsonConvert.convert<double>(json["geoLongitude"]);
  if (geoLongitude != null) {
    applicationBean.geoLongitude = geoLongitude;
  }
  final int? id = jsonConvert.convert<int>(json["id"]);
  if (id != null) {
    applicationBean.id = id;
  }
  final int? interest = jsonConvert.convert<int>(json["interest"]);
  if (interest != null) {
    applicationBean.interest = interest;
  }
  final String? ip = jsonConvert.convert<String>(json["ip"]);
  if (ip != null) {
    applicationBean.ip = ip;
  }
  final int? loanAmount = jsonConvert.convert<int>(json["loanAmount"]);
  if (loanAmount != null) {
    applicationBean.loanAmount = loanAmount;
  }
  final ApplicationLoanBasisInfo? loanBasisInfo =
      jsonConvert.convert<ApplicationLoanBasisInfo>(json["loanBasisInfo"]);
  if (loanBasisInfo != null) {
    applicationBean.loanBasisInfo = loanBasisInfo;
  }
  final int? loanBasisInfoId =
      jsonConvert.convert<int>(json["loanBasisInfoId"]);
  if (loanBasisInfoId != null) {
    applicationBean.loanBasisInfoId = loanBasisInfoId;
  }
  final int? loanRateId = jsonConvert.convert<int>(json["loanRateId"]);
  if (loanRateId != null) {
    applicationBean.loanRateId = loanRateId;
  }
  final int? loanTimeLimit = jsonConvert.convert<int>(json["loanTimeLimit"]);
  if (loanTimeLimit != null) {
    applicationBean.loanTimeLimit = loanTimeLimit;
  }
  final int? memberId = jsonConvert.convert<int>(json["memberId"]);
  if (memberId != null) {
    applicationBean.memberId = memberId;
  }
  final ApplicationOrderInfo? orderInfo =
      jsonConvert.convert<ApplicationOrderInfo>(json["orderInfo"]);
  if (orderInfo != null) {
    applicationBean.orderInfo = orderInfo;
  }
  final int? platform = jsonConvert.convert<int>(json["platform"]);
  if (platform != null) {
    applicationBean.platform = platform;
  }
  final bool? reloan = jsonConvert.convert<bool>(json["reloan"]);
  if (reloan != null) {
    applicationBean.reloan = reloan;
  }
  final int? sRepaymentAmount =
      jsonConvert.convert<int>(json["sRepaymentAmount"]);
  if (sRepaymentAmount != null) {
    applicationBean.sRepaymentAmount = sRepaymentAmount;
  }
  final int? status = jsonConvert.convert<int>(json["status"]);
  if (status != null) {
    applicationBean.status = status;
  }
  final String? statusDesc = jsonConvert.convert<String>(json["statusDesc"]);
  if (statusDesc != null) {
    applicationBean.statusDesc = statusDesc;
  }
  final bool? telephoneAudit =
      jsonConvert.convert<bool>(json["telephoneAudit"]);
  if (telephoneAudit != null) {
    applicationBean.telephoneAudit = telephoneAudit;
  }
  final int? totalCharge = jsonConvert.convert<int>(json["totalCharge"]);
  if (totalCharge != null) {
    applicationBean.totalCharge = totalCharge;
  }
  final int? transferFee = jsonConvert.convert<int>(json["transferFee"]);
  if (transferFee != null) {
    applicationBean.transferFee = transferFee;
  }
  final int? userLevel = jsonConvert.convert<int>(json["userLevel"]);
  if (userLevel != null) {
    applicationBean.userLevel = userLevel;
  }
  final int? userLevelScore = jsonConvert.convert<int>(json["userLevelScore"]);
  if (userLevelScore != null) {
    applicationBean.userLevelScore = userLevelScore;
  }
  return applicationBean;
}

Map<String, dynamic> $ApplicationBeanToJson(ApplicationBean entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data["accountAmount"] = entity.accountAmount;
  data["accountManageExpense"] = entity.accountManageExpense;
  data["appInfoId"] = entity.appInfoId;
  data["applicationTime"] = entity.applicationTime;
  data["auditServiceExpense"] = entity.auditServiceExpense;
  data["couponDeduction"] = entity.couponDeduction;
  data["deviceId"] = entity.deviceId;
  data["facebookUpdate"] = entity.facebookUpdate;
  data["finishOptId"] = entity.finishOptId;
  data["finishTime"] = entity.finishTime;
  data["fkCalculated"] = entity.fkCalculated;
  data["geoLatitude"] = entity.geoLatitude;
  data["geoLongitude"] = entity.geoLongitude;
  data["id"] = entity.id;
  data["interest"] = entity.interest;
  data["ip"] = entity.ip;
  data["loanAmount"] = entity.loanAmount;
  data["loanBasisInfo"] = entity.loanBasisInfo?.toJson();
  data["loanBasisInfoId"] = entity.loanBasisInfoId;
  data["loanRateId"] = entity.loanRateId;
  data["loanTimeLimit"] = entity.loanTimeLimit;
  data["memberId"] = entity.memberId;
  data["orderInfo"] = entity.orderInfo?.toJson();
  data["platform"] = entity.platform;
  data["reloan"] = entity.reloan;
  data["sRepaymentAmount"] = entity.sRepaymentAmount;
  data["status"] = entity.status;
  data["statusDesc"] = entity.statusDesc;
  data["telephoneAudit"] = entity.telephoneAudit;
  data["totalCharge"] = entity.totalCharge;
  data["transferFee"] = entity.transferFee;
  data["userLevel"] = entity.userLevel;
  data["userLevelScore"] = entity.userLevelScore;
  return data;
}

extension ApplicationBeanExtension on ApplicationBean {
  ApplicationBean copyWith({
    int? accountAmount,
    int? accountManageExpense,
    int? appInfoId,
    int? applicationTime,
    int? auditServiceExpense,
    int? couponDeduction,
    String? deviceId,
    bool? facebookUpdate,
    int? finishOptId,
    int? finishTime,
    bool? fkCalculated,
    double? geoLatitude,
    double? geoLongitude,
    int? id,
    int? interest,
    String? ip,
    int? loanAmount,
    ApplicationLoanBasisInfo? loanBasisInfo,
    int? loanBasisInfoId,
    int? loanRateId,
    int? loanTimeLimit,
    int? memberId,
    ApplicationOrderInfo? orderInfo,
    int? platform,
    bool? reloan,
    int? sRepaymentAmount,
    int? status,
    String? statusDesc,
    bool? telephoneAudit,
    int? totalCharge,
    int? transferFee,
    int? userLevel,
    int? userLevelScore,
  }) {
    return ApplicationBean()
      ..accountAmount = accountAmount ?? this.accountAmount
      ..accountManageExpense = accountManageExpense ?? this.accountManageExpense
      ..appInfoId = appInfoId ?? this.appInfoId
      ..applicationTime = applicationTime ?? this.applicationTime
      ..auditServiceExpense = auditServiceExpense ?? this.auditServiceExpense
      ..couponDeduction = couponDeduction ?? this.couponDeduction
      ..deviceId = deviceId ?? this.deviceId
      ..facebookUpdate = facebookUpdate ?? this.facebookUpdate
      ..finishOptId = finishOptId ?? this.finishOptId
      ..finishTime = finishTime ?? this.finishTime
      ..fkCalculated = fkCalculated ?? this.fkCalculated
      ..geoLatitude = geoLatitude ?? this.geoLatitude
      ..geoLongitude = geoLongitude ?? this.geoLongitude
      ..id = id ?? this.id
      ..interest = interest ?? this.interest
      ..ip = ip ?? this.ip
      ..loanAmount = loanAmount ?? this.loanAmount
      ..loanBasisInfo = loanBasisInfo ?? this.loanBasisInfo
      ..loanBasisInfoId = loanBasisInfoId ?? this.loanBasisInfoId
      ..loanRateId = loanRateId ?? this.loanRateId
      ..loanTimeLimit = loanTimeLimit ?? this.loanTimeLimit
      ..memberId = memberId ?? this.memberId
      ..orderInfo = orderInfo ?? this.orderInfo
      ..platform = platform ?? this.platform
      ..reloan = reloan ?? this.reloan
      ..sRepaymentAmount = sRepaymentAmount ?? this.sRepaymentAmount
      ..status = status ?? this.status
      ..statusDesc = statusDesc ?? this.statusDesc
      ..telephoneAudit = telephoneAudit ?? this.telephoneAudit
      ..totalCharge = totalCharge ?? this.totalCharge
      ..transferFee = transferFee ?? this.transferFee
      ..userLevel = userLevel ?? this.userLevel
      ..userLevelScore = userLevelScore ?? this.userLevelScore;
  }
}

ApplicationLoanBasisInfo $ApplicationLoanBasisInfoFromJson(
    Map<String, dynamic> json) {
  final ApplicationLoanBasisInfo applicationLoanBasisInfo =
      ApplicationLoanBasisInfo();
  final String? accountNo = jsonConvert.convert<String>(json["accountNo"]);
  if (accountNo != null) {
    applicationLoanBasisInfo.accountNo = accountNo;
  }
  final String? appVersion = jsonConvert.convert<String>(json["appVersion"]);
  if (appVersion != null) {
    applicationLoanBasisInfo.appVersion = appVersion;
  }
  final String? bank = jsonConvert.convert<String>(json["bank"]);
  if (bank != null) {
    applicationLoanBasisInfo.bank = bank;
  }
  final int? bankAreaId = jsonConvert.convert<int>(json["bankAreaId"]);
  if (bankAreaId != null) {
    applicationLoanBasisInfo.bankAreaId = bankAreaId;
  }
  final String? bankCode = jsonConvert.convert<String>(json["bankCode"]);
  if (bankCode != null) {
    applicationLoanBasisInfo.bankCode = bankCode;
  }
  final int? bankExpiryDate = jsonConvert.convert<int>(json["bankExpiryDate"]);
  if (bankExpiryDate != null) {
    applicationLoanBasisInfo.bankExpiryDate = bankExpiryDate;
  }
  final int? bankIssueDate = jsonConvert.convert<int>(json["bankIssueDate"]);
  if (bankIssueDate != null) {
    applicationLoanBasisInfo.bankIssueDate = bankIssueDate;
  }
  final String? bankLogo = jsonConvert.convert<String>(json["bankLogo"]);
  if (bankLogo != null) {
    applicationLoanBasisInfo.bankLogo = bankLogo;
  }
  final String? birthPlace = jsonConvert.convert<String>(json["birthPlace"]);
  if (birthPlace != null) {
    applicationLoanBasisInfo.birthPlace = birthPlace;
  }
  final int? birthday = jsonConvert.convert<int>(json["birthday"]);
  if (birthday != null) {
    applicationLoanBasisInfo.birthday = birthday;
  }
  final int? certificateMaterial =
      jsonConvert.convert<int>(json["certificateMaterial"]);
  if (certificateMaterial != null) {
    applicationLoanBasisInfo.certificateMaterial = certificateMaterial;
  }
  final String? certificateNo =
      jsonConvert.convert<String>(json["certificateNo"]);
  if (certificateNo != null) {
    applicationLoanBasisInfo.certificateNo = certificateNo;
  }
  final int? certificateType =
      jsonConvert.convert<int>(json["certificateType"]);
  if (certificateType != null) {
    applicationLoanBasisInfo.certificateType = certificateType;
  }
  final int? childrenNumber = jsonConvert.convert<int>(json["childrenNumber"]);
  if (childrenNumber != null) {
    applicationLoanBasisInfo.childrenNumber = childrenNumber;
  }
  final int? cityId = jsonConvert.convert<int>(json["cityId"]);
  if (cityId != null) {
    applicationLoanBasisInfo.cityId = cityId;
  }
  final String? cityName = jsonConvert.convert<String>(json["cityName"]);
  if (cityName != null) {
    applicationLoanBasisInfo.cityName = cityName;
  }
  final String? companyAddress =
      jsonConvert.convert<String>(json["companyAddress"]);
  if (companyAddress != null) {
    applicationLoanBasisInfo.companyAddress = companyAddress;
  }
  final int? companyAreaId = jsonConvert.convert<int>(json["companyAreaId"]);
  if (companyAreaId != null) {
    applicationLoanBasisInfo.companyAreaId = companyAreaId;
  }
  final String? companyBarangay =
      jsonConvert.convert<String>(json["companyBarangay"]);
  if (companyBarangay != null) {
    applicationLoanBasisInfo.companyBarangay = companyBarangay;
  }
  final String? companyCity = jsonConvert.convert<String>(json["companyCity"]);
  if (companyCity != null) {
    applicationLoanBasisInfo.companyCity = companyCity;
  }
  final String? companyName = jsonConvert.convert<String>(json["companyName"]);
  if (companyName != null) {
    applicationLoanBasisInfo.companyName = companyName;
  }
  final String? companyProvince =
      jsonConvert.convert<String>(json["companyProvince"]);
  if (companyProvince != null) {
    applicationLoanBasisInfo.companyProvince = companyProvince;
  }
  final String? companyTelephone =
      jsonConvert.convert<String>(json["companyTelephone"]);
  if (companyTelephone != null) {
    applicationLoanBasisInfo.companyTelephone = companyTelephone;
  }
  final List<dynamic>? contactPersons =
      (json["contactPersons"] as List<dynamic>?)?.map((e) => e).toList();
  if (contactPersons != null) {
    applicationLoanBasisInfo.contactPersons = contactPersons;
  }
  final String? deviceId = jsonConvert.convert<String>(json["deviceId"]);
  if (deviceId != null) {
    applicationLoanBasisInfo.deviceId = deviceId;
  }
  final int? education = jsonConvert.convert<int>(json["education"]);
  if (education != null) {
    applicationLoanBasisInfo.education = education;
  }
  final String? email = jsonConvert.convert<String>(json["email"]);
  if (email != null) {
    applicationLoanBasisInfo.email = email;
  }
  final String? fbAccount = jsonConvert.convert<String>(json["fbAccount"]);
  if (fbAccount != null) {
    applicationLoanBasisInfo.fbAccount = fbAccount;
  }
  final String? firstName = jsonConvert.convert<String>(json["firstName"]);
  if (firstName != null) {
    applicationLoanBasisInfo.firstName = firstName;
  }
  final String? handheldPhoto =
      jsonConvert.convert<String>(json["handheldPhoto"]);
  if (handheldPhoto != null) {
    applicationLoanBasisInfo.handheldPhoto = handheldPhoto;
  }
  final String? handheldPhotoUrl =
      jsonConvert.convert<String>(json["handheldPhotoUrl"]);
  if (handheldPhotoUrl != null) {
    applicationLoanBasisInfo.handheldPhotoUrl = handheldPhotoUrl;
  }
  final int? id = jsonConvert.convert<int>(json["id"]);
  if (id != null) {
    applicationLoanBasisInfo.id = id;
  }
  final int? income = jsonConvert.convert<int>(json["income"]);
  if (income != null) {
    applicationLoanBasisInfo.income = income;
  }
  final int? incomeId = jsonConvert.convert<int>(json["incomeId"]);
  if (incomeId != null) {
    applicationLoanBasisInfo.incomeId = incomeId;
  }
  final bool? individualVerified =
      jsonConvert.convert<bool>(json["individualVerified"]);
  if (individualVerified != null) {
    applicationLoanBasisInfo.individualVerified = individualVerified;
  }
  final int? industry = jsonConvert.convert<int>(json["industry"]);
  if (industry != null) {
    applicationLoanBasisInfo.industry = industry;
  }
  final int? isComplete = jsonConvert.convert<int>(json["isComplete"]);
  if (isComplete != null) {
    applicationLoanBasisInfo.isComplete = isComplete;
  }
  final String? lastName = jsonConvert.convert<String>(json["lastName"]);
  if (lastName != null) {
    applicationLoanBasisInfo.lastName = lastName;
  }
  final int? loanStep = jsonConvert.convert<int>(json["loanStep"]);
  if (loanStep != null) {
    applicationLoanBasisInfo.loanStep = loanStep;
  }
  final int? maritalStatus = jsonConvert.convert<int>(json["maritalStatus"]);
  if (maritalStatus != null) {
    applicationLoanBasisInfo.maritalStatus = maritalStatus;
  }
  final int? marketMemberId = jsonConvert.convert<int>(json["marketMemberId"]);
  if (marketMemberId != null) {
    applicationLoanBasisInfo.marketMemberId = marketMemberId;
  }
  final int? memberId = jsonConvert.convert<int>(json["memberId"]);
  if (memberId != null) {
    applicationLoanBasisInfo.memberId = memberId;
  }
  final String? memberPhone = jsonConvert.convert<String>(json["memberPhone"]);
  if (memberPhone != null) {
    applicationLoanBasisInfo.memberPhone = memberPhone;
  }
  final String? middleName = jsonConvert.convert<String>(json["middleName"]);
  if (middleName != null) {
    applicationLoanBasisInfo.middleName = middleName;
  }
  final String? motherMaidenName =
      jsonConvert.convert<String>(json["motherMaidenName"]);
  if (motherMaidenName != null) {
    applicationLoanBasisInfo.motherMaidenName = motherMaidenName;
  }
  final String? name = jsonConvert.convert<String>(json["name"]);
  if (name != null) {
    applicationLoanBasisInfo.name = name;
  }
  final String? nameFormat = jsonConvert.convert<String>(json["nameFormat"]);
  if (nameFormat != null) {
    applicationLoanBasisInfo.nameFormat = nameFormat;
  }
  final int? payDay1 = jsonConvert.convert<int>(json["payDay1"]);
  if (payDay1 != null) {
    applicationLoanBasisInfo.payDay1 = payDay1;
  }
  final int? payDay2 = jsonConvert.convert<int>(json["payDay2"]);
  if (payDay2 != null) {
    applicationLoanBasisInfo.payDay2 = payDay2;
  }
  final int? paymentChannelType =
      jsonConvert.convert<int>(json["paymentChannelType"]);
  if (paymentChannelType != null) {
    applicationLoanBasisInfo.paymentChannelType = paymentChannelType;
  }
  final int? phPhoneVerify = jsonConvert.convert<int>(json["phPhoneVerify"]);
  if (phPhoneVerify != null) {
    applicationLoanBasisInfo.phPhoneVerify = phPhoneVerify;
  }
  final int? platform = jsonConvert.convert<int>(json["platform"]);
  if (platform != null) {
    applicationLoanBasisInfo.platform = platform;
  }
  final int? provinceId = jsonConvert.convert<int>(json["provinceId"]);
  if (provinceId != null) {
    applicationLoanBasisInfo.provinceId = provinceId;
  }
  final String? provinceName =
      jsonConvert.convert<String>(json["provinceName"]);
  if (provinceName != null) {
    applicationLoanBasisInfo.provinceName = provinceName;
  }
  final String? resideAddress =
      jsonConvert.convert<String>(json["resideAddress"]);
  if (resideAddress != null) {
    applicationLoanBasisInfo.resideAddress = resideAddress;
  }
  final int? resideAreaId = jsonConvert.convert<int>(json["resideAreaId"]);
  if (resideAreaId != null) {
    applicationLoanBasisInfo.resideAreaId = resideAreaId;
  }
  final String? resideBarangay =
      jsonConvert.convert<String>(json["resideBarangay"]);
  if (resideBarangay != null) {
    applicationLoanBasisInfo.resideBarangay = resideBarangay;
  }
  final String? resideCity = jsonConvert.convert<String>(json["resideCity"]);
  if (resideCity != null) {
    applicationLoanBasisInfo.resideCity = resideCity;
  }
  final String? resideProvince =
      jsonConvert.convert<String>(json["resideProvince"]);
  if (resideProvince != null) {
    applicationLoanBasisInfo.resideProvince = resideProvince;
  }
  final int? resideTime = jsonConvert.convert<int>(json["resideTime"]);
  if (resideTime != null) {
    applicationLoanBasisInfo.resideTime = resideTime;
  }
  final String? salaryRecordPhoto =
      jsonConvert.convert<String>(json["salaryRecordPhoto"]);
  if (salaryRecordPhoto != null) {
    applicationLoanBasisInfo.salaryRecordPhoto = salaryRecordPhoto;
  }
  final String? salaryRecordPhotoUrl =
      jsonConvert.convert<String>(json["salaryRecordPhotoUrl"]);
  if (salaryRecordPhotoUrl != null) {
    applicationLoanBasisInfo.salaryRecordPhotoUrl = salaryRecordPhotoUrl;
  }
  final int? sex = jsonConvert.convert<int>(json["sex"]);
  if (sex != null) {
    applicationLoanBasisInfo.sex = sex;
  }
  final int? workingTime = jsonConvert.convert<int>(json["workingTime"]);
  if (workingTime != null) {
    applicationLoanBasisInfo.workingTime = workingTime;
  }
  return applicationLoanBasisInfo;
}

Map<String, dynamic> $ApplicationLoanBasisInfoToJson(
    ApplicationLoanBasisInfo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data["accountNo"] = entity.accountNo;
  data["appVersion"] = entity.appVersion;
  data["bank"] = entity.bank;
  data["bankAreaId"] = entity.bankAreaId;
  data["bankCode"] = entity.bankCode;
  data["bankExpiryDate"] = entity.bankExpiryDate;
  data["bankIssueDate"] = entity.bankIssueDate;
  data["bankLogo"] = entity.bankLogo;
  data["birthPlace"] = entity.birthPlace;
  data["birthday"] = entity.birthday;
  data["certificateMaterial"] = entity.certificateMaterial;
  data["certificateNo"] = entity.certificateNo;
  data["certificateType"] = entity.certificateType;
  data["childrenNumber"] = entity.childrenNumber;
  data["cityId"] = entity.cityId;
  data["cityName"] = entity.cityName;
  data["companyAddress"] = entity.companyAddress;
  data["companyAreaId"] = entity.companyAreaId;
  data["companyBarangay"] = entity.companyBarangay;
  data["companyCity"] = entity.companyCity;
  data["companyName"] = entity.companyName;
  data["companyProvince"] = entity.companyProvince;
  data["companyTelephone"] = entity.companyTelephone;
  data["contactPersons"] = entity.contactPersons;
  data["deviceId"] = entity.deviceId;
  data["education"] = entity.education;
  data["email"] = entity.email;
  data["fbAccount"] = entity.fbAccount;
  data["firstName"] = entity.firstName;
  data["handheldPhoto"] = entity.handheldPhoto;
  data["handheldPhotoUrl"] = entity.handheldPhotoUrl;
  data["id"] = entity.id;
  data["income"] = entity.income;
  data["incomeId"] = entity.incomeId;
  data["individualVerified"] = entity.individualVerified;
  data["industry"] = entity.industry;
  data["isComplete"] = entity.isComplete;
  data["lastName"] = entity.lastName;
  data["loanStep"] = entity.loanStep;
  data["maritalStatus"] = entity.maritalStatus;
  data["marketMemberId"] = entity.marketMemberId;
  data["memberId"] = entity.memberId;
  data["memberPhone"] = entity.memberPhone;
  data["middleName"] = entity.middleName;
  data["motherMaidenName"] = entity.motherMaidenName;
  data["name"] = entity.name;
  data["nameFormat"] = entity.nameFormat;
  data["payDay1"] = entity.payDay1;
  data["payDay2"] = entity.payDay2;
  data["paymentChannelType"] = entity.paymentChannelType;
  data["phPhoneVerify"] = entity.phPhoneVerify;
  data["platform"] = entity.platform;
  data["provinceId"] = entity.provinceId;
  data["provinceName"] = entity.provinceName;
  data["resideAddress"] = entity.resideAddress;
  data["resideAreaId"] = entity.resideAreaId;
  data["resideBarangay"] = entity.resideBarangay;
  data["resideCity"] = entity.resideCity;
  data["resideProvince"] = entity.resideProvince;
  data["resideTime"] = entity.resideTime;
  data["salaryRecordPhoto"] = entity.salaryRecordPhoto;
  data["salaryRecordPhotoUrl"] = entity.salaryRecordPhotoUrl;
  data["sex"] = entity.sex;
  data["workingTime"] = entity.workingTime;
  return data;
}

extension ApplicationLoanBasisInfoExtension on ApplicationLoanBasisInfo {
  ApplicationLoanBasisInfo copyWith({
    String? accountNo,
    String? appVersion,
    String? bank,
    int? bankAreaId,
    String? bankCode,
    int? bankExpiryDate,
    int? bankIssueDate,
    String? bankLogo,
    String? birthPlace,
    int? birthday,
    int? certificateMaterial,
    String? certificateNo,
    int? certificateType,
    int? childrenNumber,
    int? cityId,
    String? cityName,
    String? companyAddress,
    int? companyAreaId,
    String? companyBarangay,
    String? companyCity,
    String? companyName,
    String? companyProvince,
    String? companyTelephone,
    List<dynamic>? contactPersons,
    String? deviceId,
    int? education,
    String? email,
    String? fbAccount,
    String? firstName,
    String? handheldPhoto,
    String? handheldPhotoUrl,
    int? id,
    int? income,
    int? incomeId,
    bool? individualVerified,
    int? industry,
    int? isComplete,
    String? lastName,
    int? loanStep,
    int? maritalStatus,
    int? marketMemberId,
    int? memberId,
    String? memberPhone,
    String? middleName,
    String? motherMaidenName,
    String? name,
    String? nameFormat,
    int? payDay1,
    int? payDay2,
    int? paymentChannelType,
    int? phPhoneVerify,
    int? platform,
    int? provinceId,
    String? provinceName,
    String? resideAddress,
    int? resideAreaId,
    String? resideBarangay,
    String? resideCity,
    String? resideProvince,
    int? resideTime,
    String? salaryRecordPhoto,
    String? salaryRecordPhotoUrl,
    int? sex,
    int? workingTime,
  }) {
    return ApplicationLoanBasisInfo()
      ..accountNo = accountNo ?? this.accountNo
      ..appVersion = appVersion ?? this.appVersion
      ..bank = bank ?? this.bank
      ..bankAreaId = bankAreaId ?? this.bankAreaId
      ..bankCode = bankCode ?? this.bankCode
      ..bankExpiryDate = bankExpiryDate ?? this.bankExpiryDate
      ..bankIssueDate = bankIssueDate ?? this.bankIssueDate
      ..bankLogo = bankLogo ?? this.bankLogo
      ..birthPlace = birthPlace ?? this.birthPlace
      ..birthday = birthday ?? this.birthday
      ..certificateMaterial = certificateMaterial ?? this.certificateMaterial
      ..certificateNo = certificateNo ?? this.certificateNo
      ..certificateType = certificateType ?? this.certificateType
      ..childrenNumber = childrenNumber ?? this.childrenNumber
      ..cityId = cityId ?? this.cityId
      ..cityName = cityName ?? this.cityName
      ..companyAddress = companyAddress ?? this.companyAddress
      ..companyAreaId = companyAreaId ?? this.companyAreaId
      ..companyBarangay = companyBarangay ?? this.companyBarangay
      ..companyCity = companyCity ?? this.companyCity
      ..companyName = companyName ?? this.companyName
      ..companyProvince = companyProvince ?? this.companyProvince
      ..companyTelephone = companyTelephone ?? this.companyTelephone
      ..contactPersons = contactPersons ?? this.contactPersons
      ..deviceId = deviceId ?? this.deviceId
      ..education = education ?? this.education
      ..email = email ?? this.email
      ..fbAccount = fbAccount ?? this.fbAccount
      ..firstName = firstName ?? this.firstName
      ..handheldPhoto = handheldPhoto ?? this.handheldPhoto
      ..handheldPhotoUrl = handheldPhotoUrl ?? this.handheldPhotoUrl
      ..id = id ?? this.id
      ..income = income ?? this.income
      ..incomeId = incomeId ?? this.incomeId
      ..individualVerified = individualVerified ?? this.individualVerified
      ..industry = industry ?? this.industry
      ..isComplete = isComplete ?? this.isComplete
      ..lastName = lastName ?? this.lastName
      ..loanStep = loanStep ?? this.loanStep
      ..maritalStatus = maritalStatus ?? this.maritalStatus
      ..marketMemberId = marketMemberId ?? this.marketMemberId
      ..memberId = memberId ?? this.memberId
      ..memberPhone = memberPhone ?? this.memberPhone
      ..middleName = middleName ?? this.middleName
      ..motherMaidenName = motherMaidenName ?? this.motherMaidenName
      ..name = name ?? this.name
      ..nameFormat = nameFormat ?? this.nameFormat
      ..payDay1 = payDay1 ?? this.payDay1
      ..payDay2 = payDay2 ?? this.payDay2
      ..paymentChannelType = paymentChannelType ?? this.paymentChannelType
      ..phPhoneVerify = phPhoneVerify ?? this.phPhoneVerify
      ..platform = platform ?? this.platform
      ..provinceId = provinceId ?? this.provinceId
      ..provinceName = provinceName ?? this.provinceName
      ..resideAddress = resideAddress ?? this.resideAddress
      ..resideAreaId = resideAreaId ?? this.resideAreaId
      ..resideBarangay = resideBarangay ?? this.resideBarangay
      ..resideCity = resideCity ?? this.resideCity
      ..resideProvince = resideProvince ?? this.resideProvince
      ..resideTime = resideTime ?? this.resideTime
      ..salaryRecordPhoto = salaryRecordPhoto ?? this.salaryRecordPhoto
      ..salaryRecordPhotoUrl = salaryRecordPhotoUrl ?? this.salaryRecordPhotoUrl
      ..sex = sex ?? this.sex
      ..workingTime = workingTime ?? this.workingTime;
  }
}

ApplicationOrderInfo $ApplicationOrderInfoFromJson(Map<String, dynamic> json) {
  final ApplicationOrderInfo applicationOrderInfo = ApplicationOrderInfo();
  final int? alreadyRepaymentAmount =
      jsonConvert.convert<int>(json["alreadyRepaymentAmount"]);
  if (alreadyRepaymentAmount != null) {
    applicationOrderInfo.alreadyRepaymentAmount = alreadyRepaymentAmount;
  }
  final int? applicationId = jsonConvert.convert<int>(json["applicationId"]);
  if (applicationId != null) {
    applicationOrderInfo.applicationId = applicationId;
  }
  final int? arrivalDate = jsonConvert.convert<int>(json["arrivalDate"]);
  if (arrivalDate != null) {
    applicationOrderInfo.arrivalDate = arrivalDate;
  }
  final bool? coLoan = jsonConvert.convert<bool>(json["coLoan"]);
  if (coLoan != null) {
    applicationOrderInfo.coLoan = coLoan;
  }
  final int? collectionBackLevel =
      jsonConvert.convert<int>(json["collectionBackLevel"]);
  if (collectionBackLevel != null) {
    applicationOrderInfo.collectionBackLevel = collectionBackLevel;
  }
  final int? collectionStatus =
      jsonConvert.convert<int>(json["collectionStatus"]);
  if (collectionStatus != null) {
    applicationOrderInfo.collectionStatus = collectionStatus;
  }
  final int? createdTime = jsonConvert.convert<int>(json["createdTime"]);
  if (createdTime != null) {
    applicationOrderInfo.createdTime = createdTime;
  }
  final bool? delay = jsonConvert.convert<bool>(json["delay"]);
  if (delay != null) {
    applicationOrderInfo.delay = delay;
  }
  final double? delayTaxRate =
      jsonConvert.convert<double>(json["delayTaxRate"]);
  if (delayTaxRate != null) {
    applicationOrderInfo.delayTaxRate = delayTaxRate;
  }
  final int? exemptOverduePayment =
      jsonConvert.convert<int>(json["exemptOverduePayment"]);
  if (exemptOverduePayment != null) {
    applicationOrderInfo.exemptOverduePayment = exemptOverduePayment;
  }
  final int? fRepaymentTime = jsonConvert.convert<int>(json["fRepaymentTime"]);
  if (fRepaymentTime != null) {
    applicationOrderInfo.fRepaymentTime = fRepaymentTime;
  }
  final int? id = jsonConvert.convert<int>(json["id"]);
  if (id != null) {
    applicationOrderInfo.id = id;
  }
  final int? loanBasisInfoId =
      jsonConvert.convert<int>(json["loanBasisInfoId"]);
  if (loanBasisInfoId != null) {
    applicationOrderInfo.loanBasisInfoId = loanBasisInfoId;
  }
  final int? loanDays = jsonConvert.convert<int>(json["loanDays"]);
  if (loanDays != null) {
    applicationOrderInfo.loanDays = loanDays;
  }
  final int? memberId = jsonConvert.convert<int>(json["memberId"]);
  if (memberId != null) {
    applicationOrderInfo.memberId = memberId;
  }
  final int? originalDueDate =
      jsonConvert.convert<int>(json["originalDueDate"]);
  if (originalDueDate != null) {
    applicationOrderInfo.originalDueDate = originalDueDate;
  }
  final int? overdueAmount = jsonConvert.convert<int>(json["overdueAmount"]);
  if (overdueAmount != null) {
    applicationOrderInfo.overdueAmount = overdueAmount;
  }
  final int? overdueDays = jsonConvert.convert<int>(json["overdueDays"]);
  if (overdueDays != null) {
    applicationOrderInfo.overdueDays = overdueDays;
  }
  final int? overdueDelayTax =
      jsonConvert.convert<int>(json["overdueDelayTax"]);
  if (overdueDelayTax != null) {
    applicationOrderInfo.overdueDelayTax = overdueDelayTax;
  }
  final int? overdueDiscountAmount =
      jsonConvert.convert<int>(json["overdueDiscountAmount"]);
  if (overdueDiscountAmount != null) {
    applicationOrderInfo.overdueDiscountAmount = overdueDiscountAmount;
  }
  final int? overdueInterest =
      jsonConvert.convert<int>(json["overdueInterest"]);
  if (overdueInterest != null) {
    applicationOrderInfo.overdueInterest = overdueInterest;
  }
  final int? overdueLevelId = jsonConvert.convert<int>(json["overdueLevelId"]);
  if (overdueLevelId != null) {
    applicationOrderInfo.overdueLevelId = overdueLevelId;
  }
  final int? overduePayment = jsonConvert.convert<int>(json["overduePayment"]);
  if (overduePayment != null) {
    applicationOrderInfo.overduePayment = overduePayment;
  }
  final int? overduePrincipal =
      jsonConvert.convert<int>(json["overduePrincipal"]);
  if (overduePrincipal != null) {
    applicationOrderInfo.overduePrincipal = overduePrincipal;
  }
  final String? paymentCode = jsonConvert.convert<String>(json["paymentCode"]);
  if (paymentCode != null) {
    applicationOrderInfo.paymentCode = paymentCode;
  }
  final ApplicationOrderInfoPaymentInfo? paymentInfo =
      jsonConvert.convert<ApplicationOrderInfoPaymentInfo>(json["paymentInfo"]);
  if (paymentInfo != null) {
    applicationOrderInfo.paymentInfo = paymentInfo;
  }
  final double? paymentRate = jsonConvert.convert<double>(json["paymentRate"]);
  if (paymentRate != null) {
    applicationOrderInfo.paymentRate = paymentRate;
  }
  final double? penaltyCeiling =
      jsonConvert.convert<double>(json["penaltyCeiling"]);
  if (penaltyCeiling != null) {
    applicationOrderInfo.penaltyCeiling = penaltyCeiling;
  }
  final String? repaymentCode =
      jsonConvert.convert<String>(json["repaymentCode"]);
  if (repaymentCode != null) {
    applicationOrderInfo.repaymentCode = repaymentCode;
  }
  final ApplicationOrderInfoRepaymentInfo? repaymentInfo = jsonConvert
      .convert<ApplicationOrderInfoRepaymentInfo>(json["repaymentInfo"]);
  if (repaymentInfo != null) {
    applicationOrderInfo.repaymentInfo = repaymentInfo;
  }
  final int? repaymentRemainAmount =
      jsonConvert.convert<int>(json["repaymentRemainAmount"]);
  if (repaymentRemainAmount != null) {
    applicationOrderInfo.repaymentRemainAmount = repaymentRemainAmount;
  }
  final int? sRepaymentTime = jsonConvert.convert<int>(json["sRepaymentTime"]);
  if (sRepaymentTime != null) {
    applicationOrderInfo.sRepaymentTime = sRepaymentTime;
  }
  final int? status = jsonConvert.convert<int>(json["status"]);
  if (status != null) {
    applicationOrderInfo.status = status;
  }
  final int? unRepaymentAmount =
      jsonConvert.convert<int>(json["unRepaymentAmount"]);
  if (unRepaymentAmount != null) {
    applicationOrderInfo.unRepaymentAmount = unRepaymentAmount;
  }
  final int? withdrawalTime = jsonConvert.convert<int>(json["withdrawalTime"]);
  if (withdrawalTime != null) {
    applicationOrderInfo.withdrawalTime = withdrawalTime;
  }
  return applicationOrderInfo;
}

Map<String, dynamic> $ApplicationOrderInfoToJson(ApplicationOrderInfo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data["alreadyRepaymentAmount"] = entity.alreadyRepaymentAmount;
  data["applicationId"] = entity.applicationId;
  data["arrivalDate"] = entity.arrivalDate;
  data["coLoan"] = entity.coLoan;
  data["collectionBackLevel"] = entity.collectionBackLevel;
  data["collectionStatus"] = entity.collectionStatus;
  data["createdTime"] = entity.createdTime;
  data["delay"] = entity.delay;
  data["delayTaxRate"] = entity.delayTaxRate;
  data["exemptOverduePayment"] = entity.exemptOverduePayment;
  data["fRepaymentTime"] = entity.fRepaymentTime;
  data["id"] = entity.id;
  data["loanBasisInfoId"] = entity.loanBasisInfoId;
  data["loanDays"] = entity.loanDays;
  data["memberId"] = entity.memberId;
  data["originalDueDate"] = entity.originalDueDate;
  data["overdueAmount"] = entity.overdueAmount;
  data["overdueDays"] = entity.overdueDays;
  data["overdueDelayTax"] = entity.overdueDelayTax;
  data["overdueDiscountAmount"] = entity.overdueDiscountAmount;
  data["overdueInterest"] = entity.overdueInterest;
  data["overdueLevelId"] = entity.overdueLevelId;
  data["overduePayment"] = entity.overduePayment;
  data["overduePrincipal"] = entity.overduePrincipal;
  data["paymentCode"] = entity.paymentCode;
  data["paymentInfo"] = entity.paymentInfo?.toJson();
  data["paymentRate"] = entity.paymentRate;
  data["penaltyCeiling"] = entity.penaltyCeiling;
  data["repaymentCode"] = entity.repaymentCode;
  data["repaymentInfo"] = entity.repaymentInfo?.toJson();
  data["repaymentRemainAmount"] = entity.repaymentRemainAmount;
  data["sRepaymentTime"] = entity.sRepaymentTime;
  data["status"] = entity.status;
  data["unRepaymentAmount"] = entity.unRepaymentAmount;
  data["withdrawalTime"] = entity.withdrawalTime;
  return data;
}

extension ApplicationOrderInfoExtension on ApplicationOrderInfo {
  ApplicationOrderInfo copyWith({
    int? alreadyRepaymentAmount,
    int? applicationId,
    int? arrivalDate,
    bool? coLoan,
    int? collectionBackLevel,
    int? collectionStatus,
    int? createdTime,
    bool? delay,
    double? delayTaxRate,
    int? exemptOverduePayment,
    int? fRepaymentTime,
    int? id,
    int? loanBasisInfoId,
    int? loanDays,
    int? memberId,
    int? originalDueDate,
    int? overdueAmount,
    int? overdueDays,
    int? overdueDelayTax,
    int? overdueDiscountAmount,
    int? overdueInterest,
    int? overdueLevelId,
    int? overduePayment,
    int? overduePrincipal,
    String? paymentCode,
    ApplicationOrderInfoPaymentInfo? paymentInfo,
    double? paymentRate,
    double? penaltyCeiling,
    String? repaymentCode,
    ApplicationOrderInfoRepaymentInfo? repaymentInfo,
    int? repaymentRemainAmount,
    int? sRepaymentTime,
    int? status,
    int? unRepaymentAmount,
    int? withdrawalTime,
  }) {
    return ApplicationOrderInfo()
      ..alreadyRepaymentAmount =
          alreadyRepaymentAmount ?? this.alreadyRepaymentAmount
      ..applicationId = applicationId ?? this.applicationId
      ..arrivalDate = arrivalDate ?? this.arrivalDate
      ..coLoan = coLoan ?? this.coLoan
      ..collectionBackLevel = collectionBackLevel ?? this.collectionBackLevel
      ..collectionStatus = collectionStatus ?? this.collectionStatus
      ..createdTime = createdTime ?? this.createdTime
      ..delay = delay ?? this.delay
      ..delayTaxRate = delayTaxRate ?? this.delayTaxRate
      ..exemptOverduePayment = exemptOverduePayment ?? this.exemptOverduePayment
      ..fRepaymentTime = fRepaymentTime ?? this.fRepaymentTime
      ..id = id ?? this.id
      ..loanBasisInfoId = loanBasisInfoId ?? this.loanBasisInfoId
      ..loanDays = loanDays ?? this.loanDays
      ..memberId = memberId ?? this.memberId
      ..originalDueDate = originalDueDate ?? this.originalDueDate
      ..overdueAmount = overdueAmount ?? this.overdueAmount
      ..overdueDays = overdueDays ?? this.overdueDays
      ..overdueDelayTax = overdueDelayTax ?? this.overdueDelayTax
      ..overdueDiscountAmount =
          overdueDiscountAmount ?? this.overdueDiscountAmount
      ..overdueInterest = overdueInterest ?? this.overdueInterest
      ..overdueLevelId = overdueLevelId ?? this.overdueLevelId
      ..overduePayment = overduePayment ?? this.overduePayment
      ..overduePrincipal = overduePrincipal ?? this.overduePrincipal
      ..paymentCode = paymentCode ?? this.paymentCode
      ..paymentInfo = paymentInfo ?? this.paymentInfo
      ..paymentRate = paymentRate ?? this.paymentRate
      ..penaltyCeiling = penaltyCeiling ?? this.penaltyCeiling
      ..repaymentCode = repaymentCode ?? this.repaymentCode
      ..repaymentInfo = repaymentInfo ?? this.repaymentInfo
      ..repaymentRemainAmount =
          repaymentRemainAmount ?? this.repaymentRemainAmount
      ..sRepaymentTime = sRepaymentTime ?? this.sRepaymentTime
      ..status = status ?? this.status
      ..unRepaymentAmount = unRepaymentAmount ?? this.unRepaymentAmount
      ..withdrawalTime = withdrawalTime ?? this.withdrawalTime;
  }
}

ApplicationOrderInfoPaymentInfo $ApplicationOrderInfoPaymentInfoFromJson(
    Map<String, dynamic> json) {
  final ApplicationOrderInfoPaymentInfo applicationOrderInfoPaymentInfo =
      ApplicationOrderInfoPaymentInfo();
  final String? helpUrl = jsonConvert.convert<String>(json["helpUrl"]);
  if (helpUrl != null) {
    applicationOrderInfoPaymentInfo.helpUrl = helpUrl;
  }
  final String? paymentCode = jsonConvert.convert<String>(json["paymentCode"]);
  if (paymentCode != null) {
    applicationOrderInfoPaymentInfo.paymentCode = paymentCode;
  }
  final int? proxyId = jsonConvert.convert<int>(json["proxyId"]);
  if (proxyId != null) {
    applicationOrderInfoPaymentInfo.proxyId = proxyId;
  }
  final String? senderName = jsonConvert.convert<String>(json["senderName"]);
  if (senderName != null) {
    applicationOrderInfoPaymentInfo.senderName = senderName;
  }
  return applicationOrderInfoPaymentInfo;
}

Map<String, dynamic> $ApplicationOrderInfoPaymentInfoToJson(
    ApplicationOrderInfoPaymentInfo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data["helpUrl"] = entity.helpUrl;
  data["paymentCode"] = entity.paymentCode;
  data["proxyId"] = entity.proxyId;
  data["senderName"] = entity.senderName;
  return data;
}

extension ApplicationOrderInfoPaymentInfoExtension
    on ApplicationOrderInfoPaymentInfo {
  ApplicationOrderInfoPaymentInfo copyWith({
    String? helpUrl,
    String? paymentCode,
    int? proxyId,
    String? senderName,
  }) {
    return ApplicationOrderInfoPaymentInfo()
      ..helpUrl = helpUrl ?? this.helpUrl
      ..paymentCode = paymentCode ?? this.paymentCode
      ..proxyId = proxyId ?? this.proxyId
      ..senderName = senderName ?? this.senderName;
  }
}

ApplicationOrderInfoRepaymentInfo $ApplicationOrderInfoRepaymentInfoFromJson(
    Map<String, dynamic> json) {
  final ApplicationOrderInfoRepaymentInfo applicationOrderInfoRepaymentInfo =
      ApplicationOrderInfoRepaymentInfo();
  final String? helpUrl = jsonConvert.convert<String>(json["helpUrl"]);
  if (helpUrl != null) {
    applicationOrderInfoRepaymentInfo.helpUrl = helpUrl;
  }
  final int? proxyId = jsonConvert.convert<int>(json["proxyId"]);
  if (proxyId != null) {
    applicationOrderInfoRepaymentInfo.proxyId = proxyId;
  }
  final String? repaymentCode =
      jsonConvert.convert<String>(json["repaymentCode"]);
  if (repaymentCode != null) {
    applicationOrderInfoRepaymentInfo.repaymentCode = repaymentCode;
  }
  return applicationOrderInfoRepaymentInfo;
}

Map<String, dynamic> $ApplicationOrderInfoRepaymentInfoToJson(
    ApplicationOrderInfoRepaymentInfo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data["helpUrl"] = entity.helpUrl;
  data["proxyId"] = entity.proxyId;
  data["repaymentCode"] = entity.repaymentCode;
  return data;
}

extension ApplicationOrderInfoRepaymentInfoExtension
    on ApplicationOrderInfoRepaymentInfo {
  ApplicationOrderInfoRepaymentInfo copyWith({
    String? helpUrl,
    int? proxyId,
    String? repaymentCode,
  }) {
    return ApplicationOrderInfoRepaymentInfo()
      ..helpUrl = helpUrl ?? this.helpUrl
      ..proxyId = proxyId ?? this.proxyId
      ..repaymentCode = repaymentCode ?? this.repaymentCode;
  }
}
