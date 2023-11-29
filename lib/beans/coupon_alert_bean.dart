import 'package:loannow/generated/json/base/json_field.dart';
import 'package:loannow/generated/json/coupon_alert_bean.g.dart';
import 'dart:convert';
export 'package:loannow/generated/json/coupon_alert_bean.g.dart';

@JsonSerializable()
class CouponAlertBean {
	double? amount;
	int? amountType = 0;
	int? createTime = 0;
	int? endUsableTime = 0;
	int? id = 0;
	int? sourceType = 0;
	int? startUsableTime = 0;
	int? status = 0;

	CouponAlertBean();

	factory CouponAlertBean.fromJson(Map<String, dynamic> json) => $CouponAlertBeanFromJson(json);

	Map<String, dynamic> toJson() => $CouponAlertBeanToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}