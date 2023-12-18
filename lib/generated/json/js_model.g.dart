/*
 * @Author: Terry
 * @Date: 2023-11-27 15:23:03
 * @LastEditors: Terry
 * @LastEditTime: 2023-12-11 17:16:37
 * @FilePath: /loannow/lib/generated/json/js_model.g.dart
 */
import 'package:loannow/generated/json/base/json_convert_content.dart';
import 'package:loannow/generated/js_model.dart';
import 'package:loannow/utils/secure_cipher_utils.dart';

JsModel $JsModelFromJson(Map<String, dynamic> json) {
  final JsModel jsModel = JsModel();
  final String? handlerName = jsonConvert.convert<String>(
      json["MdfMepCrmMDzwgnYH1pJVQ==".aseUnlook() /* handlerName */]);
  if (handlerName != null) {
    jsModel.handlerName = handlerName;
  }
  final JsModelData? data = jsonConvert.convert<JsModelData>(
      json["acUN65Z/Ky44xbzQ5bOEQA==".aseUnlook() /* data */]);
  if (data != null) {
    jsModel.data = data;
  }
  final String? callbackId = jsonConvert.convert<String>(
      json["Zcakdx2QB6H+wL6ix2Z8PA==".aseUnlook() /* callbackId */]);
  if (callbackId != null) {
    jsModel.callbackId = callbackId;
  }
  return jsModel;
}

Map<String, dynamic> $JsModelToJson(JsModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data["MdfMepCrmMDzwgnYH1pJVQ==".aseUnlook() /* handlerName */] =
      entity.handlerName;
  data["acUN65Z/Ky44xbzQ5bOEQA==".aseUnlook() /* data */] =
      entity.data?.toJson();
  data["Zcakdx2QB6H+wL6ix2Z8PA==".aseUnlook() /* callbackId */] =
      entity.callbackId;
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
  final String? uid = jsonConvert
      .convert<String>(json["/NtBbr2h+fwV4fq78U79TA==".aseUnlook() /* uid */]);
  if (uid != null) {
    jsModelData.uid = uid;
  }
  final Map<String, dynamic>? params =
      (json["4+MjNE1b862g1wWqjpmA4w==".aseUnlook() /* params */]
              as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e == null ? null : e));
  if (params != null) {
    jsModelData.params = params;
  }
  final String? method = jsonConvert.convert<String>(
      json["RrotDt5SRgRVGxE40SOAfQ==".aseUnlook() /* method */]);
  if (method != null) {
    jsModelData.method = method;
  }
  final String? callback = jsonConvert.convert<String>(
      json["WduwOgLgAcXYqhaw1k/feQ==".aseUnlook() /* callback */]);
  if (callback != null) {
    jsModelData.callback = callback;
  }
  return jsModelData;
}

Map<String, dynamic> $JsModelDataToJson(JsModelData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data["/NtBbr2h+fwV4fq78U79TA==".aseUnlook() /* uid */] = entity.uid;
  data["4+MjNE1b862g1wWqjpmA4w==".aseUnlook() /* params */] = entity.params;
  data["RrotDt5SRgRVGxE40SOAfQ==".aseUnlook() /* method */] = entity.method;
  data["WduwOgLgAcXYqhaw1k/feQ==".aseUnlook() /* callback */] = entity.callback;
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
