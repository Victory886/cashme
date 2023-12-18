/*
 * @Author: Terry
 * @Date: 2023-10-12 15:05:06
 * @LastEditors: Terry
 * @LastEditTime: 2023-12-11 17:04:10
 * @FilePath: /loannow/lib/generated/json/account_delete_bean.g.dart
 */
import 'package:loannow/generated/json/base/json_convert_content.dart';
import 'package:loannow/beans/account_delete_bean.dart';
import 'package:loannow/utils/secure_cipher_utils.dart';

AccountDeleteBean $AccountDeleteBeanFromJson(Map<String, dynamic> json) {
  final AccountDeleteBean accountDeleteBean = AccountDeleteBean();
  final int? id = jsonConvert
      .convert<int>(json["enyd+2ERRQf7UaKB2w6Exw==".aseUnlook() /* id */]);
  if (id != null) {
    accountDeleteBean.id = id;
  }
  final String? accountNo = jsonConvert.convert<String>(
      json["7XhhEj0/8FyhSXVEULPJjA==".aseUnlook() /* accountNo */]);
  if (accountNo != null) {
    accountDeleteBean.accountNo = accountNo;
  }
  return accountDeleteBean;
}

Map<String, dynamic> $AccountDeleteBeanToJson(AccountDeleteBean entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data["enyd+2ERRQf7UaKB2w6Exw==".aseUnlook() /* id */] = entity.id;
  data["7XhhEj0/8FyhSXVEULPJjA==".aseUnlook() /* accountNo */] =
      entity.accountNo;
  return data;
}

extension AccountDeleteBeanExtension on AccountDeleteBean {
  AccountDeleteBean copyWith({
    int? id,
    String? accountNo,
  }) {
    return AccountDeleteBean()
      ..id = id ?? this.id
      ..accountNo = accountNo ?? this.accountNo;
  }
}
