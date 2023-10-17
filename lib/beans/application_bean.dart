import 'dart:convert';

import 'package:loannow/generated/json/application_bean.g.dart';
import 'package:loannow/generated/json/base/json_field.dart';

export 'package:loannow/generated/json/application_bean.g.dart';

@JsonSerializable()
class ApplicationBean {
  int? accountAmount = 0;
  int? accountManageExpense = 0;
  int? appInfoId = 0;
  int? applicationTime = 0;
  int? auditServiceExpense = 0;
  int? couponDeduction = 0;
  String? deviceId = '';
  bool? facebookUpdate = false;
  int? finishOptId = 0;
  int? finishTime = 0;
  bool? fkCalculated = false;
  double? geoLatitude;
  double? geoLongitude;
  int? id = 0;
  int? interest = 0;
  String? ip = '';
  int? loanAmount = 0;
  ApplicationLoanBasisInfo? loanBasisInfo;
  int? loanBasisInfoId = 0;
  int? loanRateId = 0;
  int? loanTimeLimit = 0;
  int? memberId = 0;
  ApplicationOrderInfo? orderInfo;
  int? platform = 0;
  bool? reloan = false;
  int? sRepaymentAmount = 0;
  int? status = 0;
  String? statusDesc = '';
  bool? telephoneAudit = false;
  int? totalCharge = 0;
  int? transferFee = 0;
  int? userLevel = 0;
  int? userLevelScore = 0;

  ApplicationBean();

  factory ApplicationBean.fromJson(Map<String, dynamic> json) => $ApplicationBeanFromJson(json);

  Map<String, dynamic> toJson() => $ApplicationBeanToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ApplicationLoanBasisInfo {
  String? accountNo = '';
  String? appVersion = '';
  String? bank = '';
  int? bankAreaId = 0;
  String? bankCode = '';
  int? bankExpiryDate = 0;
  int? bankIssueDate = 0;
  String? bankLogo = '';
  String? birthPlace = '';
  int? birthday = 0;
  int? certificateMaterial = 0;
  String? certificateNo = '';
  int? certificateType = 0;
  int? childrenNumber = 0;
  int? cityId = 0;
  String? cityName = '';
  String? companyAddress = '';
  int? companyAreaId = 0;
  String? companyBarangay = '';
  String? companyCity = '';
  String? companyName = '';
  String? companyProvince = '';
  String? companyTelephone = '';
  List<dynamic>? contactPersons = [];
  String? deviceId = '';
  int? education = 0;
  String? email = '';
  String? fbAccount = '';
  String? firstName = '';
  String? handheldPhoto = '';
  String? handheldPhotoUrl = '';
  int? id = 0;
  int? income = 0;
  int? incomeId = 0;
  bool? individualVerified = false;
  int? industry = 0;
  int? isComplete = 0;
  String? lastName = '';
  int? loanStep = 0;
  int? maritalStatus = 0;
  int? marketMemberId = 0;
  int? memberId = 0;
  String? memberPhone = '';
  String? middleName = '';
  String? motherMaidenName = '';
  String? name = '';
  String? nameFormat = '';
  int? payDay1 = 0;
  int? payDay2 = 0;
  int? paymentChannelType = 0;
  int? phPhoneVerify = 0;
  int? platform = 0;
  int? provinceId = 0;
  String? provinceName = '';
  String? resideAddress = '';
  int? resideAreaId = 0;
  String? resideBarangay = '';
  String? resideCity = '';
  String? resideProvince = '';
  int? resideTime = 0;
  String? salaryRecordPhoto = '';
  String? salaryRecordPhotoUrl = '';
  int? sex = 0;
  int? workingTime = 0;

  ApplicationLoanBasisInfo();

  factory ApplicationLoanBasisInfo.fromJson(Map<String, dynamic> json) => $ApplicationLoanBasisInfoFromJson(json);

  Map<String, dynamic> toJson() => $ApplicationLoanBasisInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ApplicationOrderInfo {
  int? alreadyRepaymentAmount = 0;
  int? applicationId = 0;
  int? arrivalDate = 0;
  bool? coLoan = false;
  int? collectionBackLevel = 0;
  int? collectionStatus = 0;
  int? createdTime = 0;
  bool? delay = false;
  double? delayTaxRate;
  int? exemptOverduePayment = 0;
  int? fRepaymentTime = 0;
  int? id = 0;
  int? loanBasisInfoId = 0;
  int? loanDays = 0;
  int? memberId = 0;
  int? originalDueDate = 0;
  int? overdueAmount = 0;
  int? overdueDays = 0;
  int? overdueDelayTax = 0;
  int? overdueDiscountAmount = 0;
  int? overdueInterest = 0;
  int? overdueLevelId = 0;
  int? overduePayment = 0;
  int? overduePrincipal = 0;
  String? paymentCode = '';
  ApplicationOrderInfoPaymentInfo? paymentInfo;
  double? paymentRate;
  double? penaltyCeiling;
  String? repaymentCode = '';
  ApplicationOrderInfoRepaymentInfo? repaymentInfo;
  int? repaymentRemainAmount = 0;
  int? sRepaymentTime = 0;
  int? status = 0;
  int? unRepaymentAmount = 0;
  int? withdrawalTime = 0;

  ApplicationOrderInfo();

  factory ApplicationOrderInfo.fromJson(Map<String, dynamic> json) => $ApplicationOrderInfoFromJson(json);

  Map<String, dynamic> toJson() => $ApplicationOrderInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ApplicationOrderInfoPaymentInfo {
  String? helpUrl = '';
  String? paymentCode = '';
  int? proxyId = 0;
  String? senderName = '';

  ApplicationOrderInfoPaymentInfo();

  factory ApplicationOrderInfoPaymentInfo.fromJson(Map<String, dynamic> json) => $ApplicationOrderInfoPaymentInfoFromJson(json);

  Map<String, dynamic> toJson() => $ApplicationOrderInfoPaymentInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ApplicationOrderInfoRepaymentInfo {
  String? helpUrl = '';
  int? proxyId = 0;
  String? repaymentCode = '';

  ApplicationOrderInfoRepaymentInfo();

  factory ApplicationOrderInfoRepaymentInfo.fromJson(Map<String, dynamic> json) => $ApplicationOrderInfoRepaymentInfoFromJson(json);

  Map<String, dynamic> toJson() => $ApplicationOrderInfoRepaymentInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
