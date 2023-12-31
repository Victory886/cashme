/*
 * @Author: Terry
 * @Date: 2023-10-20 10:34:25
 * @LastEditors: Terry
 * @LastEditTime: 2023-11-27 15:42:18
 * @FilePath: /loannow/lib/generated/js_model.dart
 */
import 'dart:convert';
import 'json/base/json_field.dart';
import 'json/js_model.g.dart';

@JsonSerializable()
class JsModel {
  String? handlerName;
  JsModelData? data;
  String? callbackId;

  JsModel();

  factory JsModel.fromJson(Map<String, dynamic> json) => $JsModelFromJson(json);

  Map<String, dynamic> toJson() => $JsModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class JsModelData {
  String? uid;
  Map<String, dynamic>? params;
  String? method;
  String? callback;

  JsModelData();

  factory JsModelData.fromJson(Map<String, dynamic> json) =>
      $JsModelDataFromJson(json);

  Map<String, dynamic> toJson() => $JsModelDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
