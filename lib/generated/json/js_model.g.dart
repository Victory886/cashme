/*
 * @Author: Terry
 * @Date: 2023-10-20 10:31:25
 * @LastEditors: Terry
 * @LastEditTime: 2023-10-20 16:09:03
 * @FilePath: /loannow/lib/generated/json/js_model.g.dart
 */
import '../js_model.dart';
import 'base/json_convert_content.dart';

JsModel $JsModelFromJson(Map<String, dynamic> json) {
  final JsModel jsModel = JsModel();
  final String? handlerName = jsonConvert.convert<String>(json['handlerName']);
  if (handlerName != null) {
    jsModel.handlerName = handlerName;
  }
  final JsModelData? data = jsonConvert.convert<JsModelData>(json['data']);
  if (data != null) {
    jsModel.data = data;
  }
  final String? callbackId = jsonConvert.convert<String>(json['callbackId']);
  if (callbackId != null) {
    jsModel.callbackId = callbackId;
  }
  return jsModel;
}

Map<String, dynamic> $JsModelToJson(JsModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['handlerName'] = entity.handlerName;
  data['data'] = entity.data?.toJson();
  data['callbackId'] = entity.callbackId;
  return data;
}

JsModelData $JsDataFromJson(Map<String, dynamic> json) {
  final JsModelData model = JsModelData();
  final String? uid = jsonConvert.convert<String>(json['uid']);
  if (uid != null) {
    model.uid = uid;
  }
  final Map<String, dynamic>? params =
      jsonConvert.convert<Map<String, dynamic>>(json['params']);
  if (params != null) {
    model.params = params;
  }
  final String? method = jsonConvert.convert<String>(json['method']);
  if (method != null) {
    model.method = method;
  }
  final String? callback = jsonConvert.convert<String>(json['callback']);
  if (callback != null) {
    model.callback = callback;
  }
  return model;
}

Map<String, dynamic> $JsDataToJson(JsModelData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['uid'] = entity.uid;
  data['params'] = entity.params;
  data['method'] = entity.method;
  data['callback'] = entity.callback;
  return data;
}
