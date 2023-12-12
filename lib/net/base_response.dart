import 'package:loannow/generated/json/base/json_convert_content.dart';

class BaseResponse<T> {
  T? result;
  int? code = 0;
  String? msg = "";

  BaseResponse({this.result, this.code, this.msg});

  BaseResponse.fromJson(Map<String, dynamic> json) {
    if (json["result"] != null && json["result"] != 'null') {
      result = JsonConvert.fromJsonAsT<T>(json["result"]);
    }
    code = json["code"];
    msg = json["msg"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.result != null) {
      data["result"] = this.result;
    }
    data["code"] = this.code;
    data["msg"] = this.msg;
    return data;
  }
}
