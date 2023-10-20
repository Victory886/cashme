import 'package:loannow/generated/json/base/json_convert_content.dart';
import 'package:loannow/beans/loan_history_bean.dart';

LoanHistoryBean $LoanHistoryBeanFromJson(Map<String, dynamic> json) {
  final LoanHistoryBean loanHistoryBean = LoanHistoryBean();
  final int? applicationTime = jsonConvert.convert<int>(
      json['applicationTime']);
  if (applicationTime != null) {
    loanHistoryBean.applicationTime = applicationTime;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    loanHistoryBean.id = id;
  }
  final int? loanAmount = jsonConvert.convert<int>(json['loanAmount']);
  if (loanAmount != null) {
    loanHistoryBean.loanAmount = loanAmount;
  }
  final int? loanBasisInfoId = jsonConvert.convert<int>(
      json['loanBasisInfoId']);
  if (loanBasisInfoId != null) {
    loanHistoryBean.loanBasisInfoId = loanBasisInfoId;
  }
  final int? loanTimeLimit = jsonConvert.convert<int>(json['loanTimeLimit']);
  if (loanTimeLimit != null) {
    loanHistoryBean.loanTimeLimit = loanTimeLimit;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    loanHistoryBean.status = status;
  }
  final String? statusDesc = jsonConvert.convert<String>(json['statusDesc']);
  if (statusDesc != null) {
    loanHistoryBean.statusDesc = statusDesc;
  }
  return loanHistoryBean;
}

Map<String, dynamic> $LoanHistoryBeanToJson(LoanHistoryBean entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['applicationTime'] = entity.applicationTime;
  data['id'] = entity.id;
  data['loanAmount'] = entity.loanAmount;
  data['loanBasisInfoId'] = entity.loanBasisInfoId;
  data['loanTimeLimit'] = entity.loanTimeLimit;
  data['status'] = entity.status;
  data['statusDesc'] = entity.statusDesc;
  return data;
}

extension LoanHistoryBeanExtension on LoanHistoryBean {
  LoanHistoryBean copyWith({
    int? applicationTime,
    int? id,
    int? loanAmount,
    int? loanBasisInfoId,
    int? loanTimeLimit,
    int? status,
    String? statusDesc,
  }) {
    return LoanHistoryBean()
      ..applicationTime = applicationTime ?? this.applicationTime
      ..id = id ?? this.id
      ..loanAmount = loanAmount ?? this.loanAmount
      ..loanBasisInfoId = loanBasisInfoId ?? this.loanBasisInfoId
      ..loanTimeLimit = loanTimeLimit ?? this.loanTimeLimit
      ..status = status ?? this.status
      ..statusDesc = statusDesc ?? this.statusDesc;
  }
}