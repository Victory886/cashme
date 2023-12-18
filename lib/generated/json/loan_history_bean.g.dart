/*
 * @Author: Terry
 * @Date: 2023-10-12 15:05:06
 * @LastEditors: Terry
 * @LastEditTime: 2023-12-11 16:01:51
 * @FilePath: /loannow/lib/generated/json/loan_history_bean.g.dart
 */
import 'package:loannow/generated/json/base/json_convert_content.dart';
import 'package:loannow/beans/loan_history_bean.dart';
import 'package:loannow/utils/secure_cipher_utils.dart';

LoanHistoryBean $LoanHistoryBeanFromJson(Map<String, dynamic> json) {
  final LoanHistoryBean loanHistoryBean = LoanHistoryBean();
  final int? applicationTime = jsonConvert.convert<int>(
      json["sHP0zLaJZ4KQhgkf6DsfhQ==".aseUnlook() /* applicationTime */]);
  if (applicationTime != null) {
    loanHistoryBean.applicationTime = applicationTime;
  }
  final int? id = jsonConvert
      .convert<int>(json["enyd+2ERRQf7UaKB2w6Exw==".aseUnlook() /* id */]);
  if (id != null) {
    loanHistoryBean.id = id;
  }
  final int? loanAmount = jsonConvert.convert<int>(
      json["hNMBwirsFXom4UGKJvWL1g==".aseUnlook() /* loanAmount */]);
  if (loanAmount != null) {
    loanHistoryBean.loanAmount = loanAmount;
  }
  final int? loanBasisInfoId = jsonConvert.convert<int>(
      json["z4scOFnHcLp3yijcqNDANg==".aseUnlook() /* loanBasisInfoId */]);
  if (loanBasisInfoId != null) {
    loanHistoryBean.loanBasisInfoId = loanBasisInfoId;
  }
  final int? loanTimeLimit = jsonConvert.convert<int>(
      json["N4S3SgojgndPCBWgdEsR/g==".aseUnlook() /* loanTimeLimit */]);
  if (loanTimeLimit != null) {
    loanHistoryBean.loanTimeLimit = loanTimeLimit;
  }
  final int? status = jsonConvert
      .convert<int>(json["COWOhK2jr7OAN4w7Z7+iQg==".aseUnlook() /* status */]);
  if (status != null) {
    loanHistoryBean.status = status;
  }
  final String? statusDesc = jsonConvert.convert<String>(
      json["7pDb0tyaBeBmyzK1nmRFIQ==".aseUnlook() /* statusDesc */]);
  if (statusDesc != null) {
    loanHistoryBean.statusDesc = statusDesc;
  }
  return loanHistoryBean;
}

Map<String, dynamic> $LoanHistoryBeanToJson(LoanHistoryBean entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data["sHP0zLaJZ4KQhgkf6DsfhQ==".aseUnlook() /* applicationTime */] =
      entity.applicationTime;
  data["enyd+2ERRQf7UaKB2w6Exw==".aseUnlook() /* id */] = entity.id;
  data["hNMBwirsFXom4UGKJvWL1g==".aseUnlook() /* loanAmount */] =
      entity.loanAmount;
  data["z4scOFnHcLp3yijcqNDANg==".aseUnlook() /* loanBasisInfoId */] =
      entity.loanBasisInfoId;
  data["N4S3SgojgndPCBWgdEsR/g==".aseUnlook() /* loanTimeLimit */] =
      entity.loanTimeLimit;
  data["COWOhK2jr7OAN4w7Z7+iQg==".aseUnlook() /* status */] = entity.status;
  data["7pDb0tyaBeBmyzK1nmRFIQ==".aseUnlook() /* statusDesc */] =
      entity.statusDesc;
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
