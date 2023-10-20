import 'package:loannow/generated/json/base/json_convert_content.dart';
import 'package:loannow/beans/account_delete_bean.dart';

AccountDeleteBean $AccountDeleteBeanFromJson(Map<String, dynamic> json) {
  final AccountDeleteBean accountDeleteBean = AccountDeleteBean();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    accountDeleteBean.id = id;
  }
  final String? accountNo = jsonConvert.convert<String>(json['accountNo']);
  if (accountNo != null) {
    accountDeleteBean.accountNo = accountNo;
  }
  return accountDeleteBean;
}

Map<String, dynamic> $AccountDeleteBeanToJson(AccountDeleteBean entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['accountNo'] = entity.accountNo;
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