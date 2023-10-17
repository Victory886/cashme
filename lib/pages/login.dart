import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:loannow/beans/login_info_bean.dart';
import 'package:loannow/beans/user_info_bean.dart';
import 'package:loannow/config/app_colors.dart';
import 'package:loannow/config/constants.dart';
import 'package:loannow/config/operation_codes.dart';
import 'package:loannow/config/router_names.dart';
import 'package:loannow/config/urls.dart';
import 'package:loannow/net/dio_manager.dart';
import 'package:loannow/utils/device_utils.dart';
import 'package:loannow/utils/dialog_utils.dart';
import 'package:loannow/utils/operation_utils.dart';
import 'package:loannow/utils/phone_utils.dart';
import 'package:loannow/utils/sp_utils.dart';
import 'package:loannow/widget/button.dart';
import 'package:loannow/widget/titleBar.dart';
import 'package:permission_handler/permission_handler.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  bool checked = false, codeError = false, confirmButtonDisable = true, showVoice = false;
  TextEditingController phoneController = TextEditingController();
  FocusNode phoneFocus = FocusNode();
  TextEditingController codeController = TextEditingController();
  int count = Constans.CODE_COUNT_TIME;
  late Timer timer;
  late StateSetter countState, checkedState, codeErrorState, confirmButtonState, voiceCodeState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TitleBar(
            title: "",
            leftClick: () {
              goHome(false);
            },
          ),
          Expanded(
              child: ListView(
            padding: EdgeInsets.only(left: 15, right: 15, top: 30, bottom: 60),
            children: [
              Text(
                "Login / Register",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: AppColors.textColor),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    "This number is your Viber account by default.If necessary, we will contact you in viber",
                    style: TextStyle(fontSize: 12, color: AppColors.textColorLight),
                  )),
              Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Stack(alignment: Alignment.center, children: [
                    Row(children: [
                      Image.asset(
                        "images/ic_ph_flag.png",
                        width: 15,
                      ),
                      Container(width: 30, alignment: Alignment.center, child: Text("+63"))
                    ]),
                    TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      maxLength: 12,
                      focusNode: phoneFocus,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 50),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.primaryColor, width: 0.5),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.dividerColor, width: 0.5),
                        ),
                        counterText: '',
                        hintText: "Enter your phone number",
                        hintStyle: TextStyle(color: Color(0xFF999999), fontSize: 14),
                      ),
                      onChanged: checkConfirmStatus,
                    )
                  ])),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Stack(alignment: Alignment.center, children: [
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: codeController,
                      maxLines: 1,
                      maxLength: 4,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.primaryColor, width: 0.5),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.dividerColor, width: 0.5),
                        ),
                        counterText: '',
                        hintStyle: TextStyle(color: Color(0xFF999999), fontSize: 14),
                        hintText: "verification code",
                      ),
                      onChanged: checkConfirmStatus,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: StatefulBuilder(
                        builder: (context, setState) {
                          countState = setState;
                          return InkWell(
                              onTap: getCode, child: Text(count == Constans.CODE_COUNT_TIME ? "Send" : "${count}s", style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.w600)));
                        },
                      ),
                    )
                  ])),
              StatefulBuilder(builder: (context, setState) {
                codeErrorState = setState;
                if (codeError) {
                  return Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "images/ic_info_red.png",
                            width: 15,
                          ),
                          Container(margin: EdgeInsets.only(left: 5), child: Text("Verification code error", style: TextStyle(color: Color(0xFFF94D3F))))
                        ],
                      ));
                } else {
                  return SizedBox.shrink();
                }
              }),
              StatefulBuilder(builder: (context, setState) {
                voiceCodeState = setState;
                if (showVoice)
                  return Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                          onTap: showVoiceDialog,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Use voice verification code",
                              style: TextStyle(color: count == Constans.CODE_COUNT_TIME ? AppColors.primaryColor : AppColors.textColorhint, fontWeight: FontWeight.w600),
                            ),
                          )));
                else
                  return SizedBox.shrink();
              }),
              Container(
                  margin: EdgeInsets.only(top: 60, bottom: 20),
                  child: InkWell(
                      onTap: changeChecked,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              margin: EdgeInsets.only(right: 10),
                              child: StatefulBuilder(builder: (context, setState) {
                                checkedState = setState;
                                return Image.asset(
                                  checked ? "images/ic_checked.png" : "images/ic_check.png",
                                  width: 20,
                                );
                              })),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(text: "Read and agree", style: TextStyle(color: Color(0xFF7F8390))),
                            TextSpan(
                                text: " Privacy Policy",
                                style: TextStyle(color: Color(0xFF3E59A5)),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(context, RouterNames.WEB, arguments: {'url': Urls.WEB_URL_PRIVACY});
                                  }),
                          ]))
                        ],
                      ))),
              StatefulBuilder(builder: (context, setState) {
                confirmButtonState = setState;
                return Button(text: "Confirm", disabled: confirmButtonDisable, onClick: loginCheck);
              })
            ],
          )),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    SpUtils.clearUser();
    OperationUtils.saveOperation('/login');
  }

  void changeChecked() {
    checked = !checked;
    checkedState(() {});
  }

  void startCount() {
    if (count == Constans.CODE_COUNT_TIME)
      timer = Timer.periodic(Duration(seconds: 1), (timer) {
        count--;
        if (count <= 0) {
          timer.cancel();
          count = Constans.CODE_COUNT_TIME;
          showVoice = true;
          voiceCodeState(() {});
        }
        countState(() {});
      });
  }

  void checkConfirmStatus(text) {
    confirmButtonDisable = phoneController.text.length < 10 || codeController.text.length < 4;
    confirmButtonState(() {});
  }

  void showVoiceDialog() {
    if (count != Constans.CODE_COUNT_TIME) return;
    OperationUtils.saveOperation(OperationCode.SHOW_VOICE_DIALOG);
    DialogUtils.showCustomerDialog(
        context: context,
        title: "Receive voice verification code",
        content: "About to call you, \nplease input the 6-digit verification code you‘ve heard",
        confirmClick: () {
          Navigator.pop(context);
          getCode(isVoice: true);
        });
  }

  void getCode({bool? isVoice}) {
    String phone = PhoneUtils.formatPhone(phoneController.text);
    if (phone.isEmpty) {
      BotToast.showText(text: "Phone number error");
      phoneFocus.requestFocus();
      return;
    }
    var params = {
      "phone": phone,
      "codeLength": 4,
    };
    if (isVoice ?? false) {
      OperationUtils.saveOperation(OperationCode.SEND_VOICE_CODE);
      DioManager.getInstance().doRequest(
          path: Urls.LOGIN_VERFIFY_CODE_VOICE,
          method: DioMethod.POST,
          bodyParams: params,
          successCallBack: (result) {
            OperationUtils.saveOperation(OperationCode.SEND_VOICE_CODE_SUCCESS);
            startCount();
          });
    } else {
      OperationUtils.saveOperation(OperationCode.LOGIN_SEND_CODE);
      DioManager.getInstance().doRequest<String>(
          path: Urls.LOGIN_VERFIFY_CODE,
          method: DioMethod.GET,
          urlParams: params,
          successCallBack: (result) {
            OperationUtils.saveOperation(OperationCode.LOGIN_CODE_SUCCESS);
            codeController.value = codeController.value.copyWith(text: result.toString());
            checkConfirmStatus("");
            startCount();
          },
          failCallBack: (result) {
            OperationUtils.saveOperation(OperationCode.LOGIN_CODE_FAIL);
          });
    }
  }

  Future<void> loginCheck() async {
    if (!checked) {
      BotToast.showText(text: "please read and agree privacy policy");
      return;
    }
    String phone = PhoneUtils.formatPhone(phoneController.text);
    if (phone.isEmpty) {
      BotToast.showText(text: "Phone number error");
      phoneFocus.requestFocus();
      return;
    }
    try {
      var status = await Permission.phone.request();
      if (status.isPermanentlyDenied) {
        showPermissionDialog();
        return;
      }
      if (!status.isGranted) {
        BotToast.showText(text: "Permission Denied");
        return;
      }
    } catch (e) {}
    OperationUtils.saveOperation(OperationCode.LOGON_CLICK);
    Future.wait([login(), getDeviceInfo()]).then((results) => {
          if (results[0] == true)
            {
              DioManager.getInstance().doRequest<dynamic>(path: Urls.DEVICE_SAVE, method: DioMethod.POST, bodyParams: results[1], showLoading: false, successCallBack: (result) {}),
            }
        });
  }

  Future<bool> login() async {
    var params = {
      "phone": PhoneUtils.formatPhone(phoneController.text),
      "verifyCode": codeController.text,
    };
    bool success = false;
    await DioManager.getInstance().doRequest<LoginInfoBean>(
        path: Urls.SIGN_IN,
        method: DioMethod.GET,
        urlParams: params,
        showErrorMsg: false,
        successCallBack: (result) {
          if (result != null) {
            SpUtils.saveToken(result!.token!).then((value) => getUserInfo());
            if (result.newUser ?? false) {
              OperationUtils.saveOperation(OperationCode.REGIST);
            } else {
              OperationUtils.saveOperation(OperationCode.LOGIN);
            }
          }
          success = true;
        },
        failCallBack: (result) {
          codeError = true;
          codeErrorState(() {});
        });
    return success;
  }

  Future<String?> getDeviceInfo() async {
    var deviceInfo = await DeviceUtils.getDeviceInfo();
    return deviceInfo;
  }

  void getUserInfo() {
    DioManager.getInstance().doRequest<UserInfoBean>(
        path: Urls.USER_INFO,
        method: DioMethod.GET,
        successCallBack: (result) {
          SpUtils.saveUserInfo(result!);
          goHome(true);
        });
  }

  void goHome(bool loginSuccess) {
    Navigator.pushNamedAndRemoveUntil(context, RouterNames.HOME, (route) => false, arguments: {"loginSuccess": loginSuccess});
  }

  void showPermissionDialog() {
    DialogUtils.showCustomerDialog(context: context, content: "Permission denied");
  }

  @override
  void dispose() {
    super.dispose();
    if (timer != null) {
      timer.cancel();
    }
    phoneController.dispose();
    codeController.dispose();
  }
}
