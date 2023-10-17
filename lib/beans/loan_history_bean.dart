import 'dart:convert';

import 'package:loannow/generated/json/base/json_field.dart';
import 'package:loannow/generated/json/loan_history_bean.g.dart';

export 'package:loannow/generated/json/loan_history_bean.g.dart';

@JsonSerializable()
class LoanHistoryBean {
  int? applicationTime = 0;
  int? id = 0;
  int? loanAmount = 0;
  int? loanBasisInfoId = 0;
  int? loanTimeLimit = 0;
  int? status = 0;
  String? statusDesc = '';

  LoanHistoryBean();

  factory LoanHistoryBean.fromJson(Map<String, dynamic> json) => $LoanHistoryBeanFromJson(json);

  Map<String, dynamic> toJson() => $LoanHistoryBeanToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
