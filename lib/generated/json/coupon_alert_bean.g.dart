/*
 * @Author: Terry
 * @Date: 2023-11-29 17:00:52
 * @LastEditors: Terry
 * @LastEditTime: 2023-12-11 17:08:11
 * @FilePath: /loannow/lib/generated/json/coupon_alert_bean.g.dart
 */
import 'package:loannow/generated/json/base/json_convert_content.dart';
import 'package:loannow/beans/coupon_alert_bean.dart';

CouponAlertBean $CouponAlertBeanFromJson(Map<String, dynamic> json) {
  final CouponAlertBean couponAlertBean = CouponAlertBean();
  final double? amount = jsonConvert.convert<double>(json["amount"]);
  if (amount != null) {
    couponAlertBean.amount = amount;
  }
  final int? amountType = jsonConvert.convert<int>(json["amountType"]);
  if (amountType != null) {
    couponAlertBean.amountType = amountType;
  }
  final int? createTime = jsonConvert.convert<int>(json["createTime"]);
  if (createTime != null) {
    couponAlertBean.createTime = createTime;
  }
  final int? endUsableTime = jsonConvert.convert<int>(json["endUsableTime"]);
  if (endUsableTime != null) {
    couponAlertBean.endUsableTime = endUsableTime;
  }
  final int? id = jsonConvert.convert<int>(json["id"]);
  if (id != null) {
    couponAlertBean.id = id;
  }
  final int? sourceType = jsonConvert.convert<int>(json["sourceType"]);
  if (sourceType != null) {
    couponAlertBean.sourceType = sourceType;
  }
  final int? startUsableTime =
      jsonConvert.convert<int>(json["startUsableTime"]);
  if (startUsableTime != null) {
    couponAlertBean.startUsableTime = startUsableTime;
  }
  final int? status = jsonConvert.convert<int>(json["status"]);
  if (status != null) {
    couponAlertBean.status = status;
  }
  return couponAlertBean;
}

Map<String, dynamic> $CouponAlertBeanToJson(CouponAlertBean entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data["amount"] = entity.amount;
  data["amountType"] = entity.amountType;
  data["createTime"] = entity.createTime;
  data["endUsableTime"] = entity.endUsableTime;
  data["id"] = entity.id;
  data["sourceType"] = entity.sourceType;
  data["startUsableTime"] = entity.startUsableTime;
  data["status"] = entity.status;
  return data;
}

extension CouponAlertBeanExtension on CouponAlertBean {
  CouponAlertBean copyWith({
    double? amount,
    int? amountType,
    int? createTime,
    int? endUsableTime,
    int? id,
    int? sourceType,
    int? startUsableTime,
    int? status,
  }) {
    return CouponAlertBean()
      ..amount = amount ?? this.amount
      ..amountType = amountType ?? this.amountType
      ..createTime = createTime ?? this.createTime
      ..endUsableTime = endUsableTime ?? this.endUsableTime
      ..id = id ?? this.id
      ..sourceType = sourceType ?? this.sourceType
      ..startUsableTime = startUsableTime ?? this.startUsableTime
      ..status = status ?? this.status;
  }
}
