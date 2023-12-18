/*
 * @Author: Terry
 * @Date: 2023-11-29 17:00:52
 * @LastEditors: Terry
 * @LastEditTime: 2023-12-11 17:12:33
 * @FilePath: /loannow/lib/generated/json/coupon_alert_bean.g.dart
 */
import 'package:loannow/generated/json/base/json_convert_content.dart';
import 'package:loannow/beans/coupon_alert_bean.dart';
import 'package:loannow/utils/secure_cipher_utils.dart';

CouponAlertBean $CouponAlertBeanFromJson(Map<String, dynamic> json) {
  final CouponAlertBean couponAlertBean = CouponAlertBean();
  final double? amount = jsonConvert.convert<double>(
      json["Ft+/bbuke2FpBLrX5mKbFg==".aseUnlook() /* amount */]);
  if (amount != null) {
    couponAlertBean.amount = amount;
  }
  final int? amountType = jsonConvert.convert<int>(
      json["OrsW6jtPLeWwSl7agbZZug==".aseUnlook() /* amountType */]);
  if (amountType != null) {
    couponAlertBean.amountType = amountType;
  }
  final int? createTime = jsonConvert.convert<int>(
      json["kPNJHoEooCfPEkVMHvISLg==".aseUnlook() /* createTime */]);
  if (createTime != null) {
    couponAlertBean.createTime = createTime;
  }
  final int? endUsableTime = jsonConvert.convert<int>(
      json["SFKtqBH2/8AP1hdckx9m3Q==".aseUnlook() /* endUsableTime */]);
  if (endUsableTime != null) {
    couponAlertBean.endUsableTime = endUsableTime;
  }
  final int? id = jsonConvert
      .convert<int>(json["enyd+2ERRQf7UaKB2w6Exw==".aseUnlook() /* id */]);
  if (id != null) {
    couponAlertBean.id = id;
  }
  final int? sourceType = jsonConvert.convert<int>(
      json["X6mbOlkobdbLq5Qgy4yQ/Q==".aseUnlook() /* sourceType */]);
  if (sourceType != null) {
    couponAlertBean.sourceType = sourceType;
  }
  final int? startUsableTime = jsonConvert.convert<int>(
      json["6OpbOA7v65A3jPG4Rmt9gA==".aseUnlook() /* startUsableTime */]);
  if (startUsableTime != null) {
    couponAlertBean.startUsableTime = startUsableTime;
  }
  final int? status = jsonConvert
      .convert<int>(json["COWOhK2jr7OAN4w7Z7+iQg==".aseUnlook() /* status */]);
  if (status != null) {
    couponAlertBean.status = status;
  }
  return couponAlertBean;
}

Map<String, dynamic> $CouponAlertBeanToJson(CouponAlertBean entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data["Ft+/bbuke2FpBLrX5mKbFg==".aseUnlook() /* amount */] = entity.amount;
  data["OrsW6jtPLeWwSl7agbZZug==".aseUnlook() /* amountType */] =
      entity.amountType;
  data["kPNJHoEooCfPEkVMHvISLg==".aseUnlook() /* createTime */] =
      entity.createTime;
  data["SFKtqBH2/8AP1hdckx9m3Q==".aseUnlook() /* endUsableTime */] =
      entity.endUsableTime;
  data["enyd+2ERRQf7UaKB2w6Exw==".aseUnlook() /* id */] = entity.id;
  data["X6mbOlkobdbLq5Qgy4yQ/Q==".aseUnlook() /* sourceType */] =
      entity.sourceType;
  data["6OpbOA7v65A3jPG4Rmt9gA==".aseUnlook() /* startUsableTime */] =
      entity.startUsableTime;
  data["COWOhK2jr7OAN4w7Z7+iQg==".aseUnlook() /* status */] = entity.status;
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
