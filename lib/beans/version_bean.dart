import 'package:loannow/generated/json/base/json_field.dart';
import 'package:loannow/generated/json/version_bean.g.dart';
import 'dart:convert';
export 'package:loannow/generated/json/version_bean.g.dart';

@JsonSerializable()
class VersionBean {
	int? appid = 0;
	int? createTime = 0;
	String? downloadUrl = '';
	bool? foreupdate = false;
	int? id = 0;
	int? onlineTime = 0;
	String? packageName = '';
	int? platform = 0;
	String? version = '';

	VersionBean();

	factory VersionBean.fromJson(Map<String, dynamic> json) => $VersionBeanFromJson(json);

	Map<String, dynamic> toJson() => $VersionBeanToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}