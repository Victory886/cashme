import 'package:loannow/generated/json/base/json_convert_content.dart';
import 'package:loannow/utils/secure_cipher_utils.dart';

class BaseResponse<T> {
  T? result;
  int? code = 0;
  String? msg = "";

  BaseResponse({this.result, this.code, this.msg});

  BaseResponse.fromJson(Map<String, dynamic> json) {
    if (json["pjhWyt+kFTldtmPWWSvLCw==".aseUnlook() /* result */] != null &&
        json["pjhWyt+kFTldtmPWWSvLCw==".aseUnlook() /* result */] != 'null') {
      result = JsonConvert.fromJsonAsT<T>(
          json["pjhWyt+kFTldtmPWWSvLCw==".aseUnlook() /* result */]);
    }
    code = json["1d1B6qSmCRql9ejq72vQ5w==".aseUnlook() /* code */];
    msg = json["70TEX6/e0Xd5c/n1zFms/A==".aseUnlook() /* msg */];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.result != null) {
      data["pjhWyt+kFTldtmPWWSvLCw==".aseUnlook() /* result */] = this.result;
    }
    data["1d1B6qSmCRql9ejq72vQ5w==".aseUnlook() /* code */] = this.code;
    data["70TEX6/e0Xd5c/n1zFms/A==".aseUnlook() /* msg */] = this.msg;
    return data;
  }
}
