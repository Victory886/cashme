import 'dart:convert';

import 'package:loannow/generated/json/account_delete_bean.g.dart';
import 'package:loannow/generated/json/base/json_field.dart';

export 'package:loannow/generated/json/account_delete_bean.g.dart';

@JsonSerializable()
class AccountDeleteBean {
  int? id = 0;
  String? accountNo = '';

  AccountDeleteBean();

  factory AccountDeleteBean.fromJson(Map<String, dynamic> json) => $AccountDeleteBeanFromJson(json);

  Map<String, dynamic> toJson() => $AccountDeleteBeanToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
