/*
 * @Author: Terry
 * @Date: 2023-11-27 15:23:03
 * @LastEditors: Terry
 * @LastEditTime: 2023-12-11 17:16:37
 * @FilePath: /loannow/lib/generated/json/js_model.g.dart
 */
import 'package:loannow/generated/json/base/json_convert_content.dart';
import 'package:loannow/generated/js_model.dart';

JsModel $JsModelFromJson(Map<String, dynamic> json) {
  final JsModel jsModel = JsModel();
  final String? handlerName = jsonConvert.convert<String>(json["handlerName"]);
  if (handlerName != null) {
    jsModel.handlerName = handlerName;
  }
  final JsModelData? data = jsonConvert.convert<JsModelData>(json["data"]);
  if (data != null) {
    jsModel.data = data;
  }
  final String? callbackId = jsonConvert.convert<String>(json["callbackId"]);
  if (callbackId != null) {
    jsModel.callbackId = callbackId;
  }
  return jsModel;
}

Map<String, dynamic> $JsModelToJson(JsModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data["handlerName"] = entity.handlerName;
  data["data"] = entity.data?.toJson();
  data["callbackId"] = entity.callbackId;
  return data;
}

extension JsModelExtension on JsModel {
  JsModel copyWith({
    String? handlerName,
    JsModelData? data,
    String? callbackId,
  }) {
    return JsModel()
      ..handlerName = handlerName ?? this.handlerName
      ..data = data ?? this.data
      ..callbackId = callbackId ?? this.callbackId;
  }
}

JsModelData $JsModelDataFromJson(Map<String, dynamic> json) {
  final JsModelData jsModelData = JsModelData();
  final String? uid = jsonConvert.convert<String>(json["uid"]);
  if (uid != null) {
    jsModelData.uid = uid;
  }
  final Map<String, dynamic>? params = (json["params"] as Map<String, dynamic>?)
      ?.map((k, e) => MapEntry(k, e == null ? null : e));
  if (params != null) {
    jsModelData.params = params;
  }
  final String? method = jsonConvert.convert<String>(json["method"]);
  if (method != null) {
    jsModelData.method = method;
  }
  final String? callback = jsonConvert.convert<String>(json["callback"]);
  if (callback != null) {
    jsModelData.callback = callback;
  }
  return jsModelData;
}

Map<String, dynamic> $JsModelDataToJson(JsModelData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data["uid"] = entity.uid;
  data["params"] = entity.params;
  data["method"] = entity.method;
  data["callback"] = entity.callback;
  return data;
}

extension JsModelDataExtension on JsModelData {
  JsModelData copyWith({
    String? uid,
    Map<String, dynamic>? params,
    String? method,
    String? callback,
  }) {
    return JsModelData()
      ..uid = uid ?? this.uid
      ..params = params ?? this.params
      ..method = method ?? this.method
      ..callback = callback ?? this.callback;
  }
}
