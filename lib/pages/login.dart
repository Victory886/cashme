import 'dart:async';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  bool checked = false,
      codeError = false,
      confirmButtonDisable = true,
      showVoice = false;
  FocusNode phoneFocus = FocusNode();
  TextEditingController phoneController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController countrycodeController = TextEditingController();
  int count = Constans.CODE_COUNT_TIME;

  /// 获取验证码的次数
  int _getCodeCount = 0;
  bool isFocus = false;

  final double tfBorderW = 1.5;
  late Timer? timer;
  late StateSetter countState,
      checkedState,
      codeErrorState,
      confirmButtonState,
      voiceCodeState,
      focusState;

  void _onFocusChange() {
    if (phoneFocus.hasFocus) {
      // TextField 获得焦点时的逻辑
      print('TextField 获得焦点');
      isFocus = true;
    } else {
      // TextField 失去焦点时的逻辑
      isFocus = false;
      print('TextField 失去焦点');
    }
    focusState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TitleBar(
            title: "Login / Register",
            leftClick: () {
              goHome(false);
            },
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 30, bottom: 60),
              children: [
                Container(
                  height: 50,
                  margin: const EdgeInsets.only(top: 30),
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      StatefulBuilder(
                        builder: (context, setState) {
                          focusState = setState;
                          return Container(
                            width: 70,
                            height: 60,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xffF4F4F4),
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                width: tfBorderW,
                                color: isFocus
                                    ? const Color(0xff7F74EF)
                                    : Colors.transparent,
                              ),
                            ),
                            child: const Text("+63"),
                          );
                        },
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 80),
                        color: const Color(0xffF4F4F4),
                        alignment: Alignment.center,
                        child: TextField(
                          maxLines: 1,
                          maxLength: 12,
                          focusNode: phoneFocus,
                          controller: phoneController,
                          keyboardType: TextInputType.number,
                          textAlignVertical: TextAlignVertical.bottom,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: tfBorderW,
                                color: const Color(0xff7F74EF),
                              ),
                            ),
                            prefixText: "* ",
                            prefixStyle: const TextStyle(
                              fontSize: 20,
                              color: Color(0xffFF5400),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0,
                                color: Colors.transparent,
                              ),
                            ),
                            counterText: '',
                            isDense: false,
                            hintText: "Enter your phone number",
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF333333),
                            ),
                          ),
                          onChanged: checkConfirmStatus,
                        ),
                      ),
                    ],
                  ),
                ),

                /// 验证码
                Container(
                  height: 50,
                  margin: const EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      TextField(
                        keyboardType: TextInputType.number,
                        maxLines: 1,
                        maxLength: 4,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        controller: codeController,
                        textAlignVertical: TextAlignVertical.bottom,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: tfBorderW,
                              color: const Color(0xff7F74EF),
                            ),
                          ),
                          prefixText: "* ",
                          prefixStyle: const TextStyle(
                            fontSize: 20,
                            color: Color(0xffFF5400),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 0,
                              color: AppColors.dividerColor,
                            ),
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          counterText: '',
                          hintStyle: const TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 14,
                          ),
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
                              onTap: getCode,
                              child: Container(
                                width: 77,
                                height: 56,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: const Color(0xff7F74EF),
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                    width: 0,
                                    color: Colors.transparent,
                                  ),
                                ),
                                child: Text(
                                  count == Constans.CODE_COUNT_TIME
                                      ? "Send"
                                      : "${count}s",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                StatefulBuilder(
                  builder: (context, setState) {
                    codeErrorState = setState;
                    if (codeError) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("images/ic_info_red.png", width: 15),
                            Container(
                              margin: const EdgeInsets.only(left: 5),
                              child: const Text(
                                "Verification code error",
                                style: TextStyle(color: Color(0xFFF94D3F)),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return const SizedBox(height: 20);
                    }
                  },
                ),
                StatefulBuilder(
                  builder: (context, setState) {
                    voiceCodeState = setState;
                    if (showVoice) {
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: const EdgeInsets.only(top: 40),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: showVoiceDialog,
                                child: Text(
                                  "Use voice verification code",
                                  style: TextStyle(
                                    color: _getCodeCount >= 2
                                        ? AppColors.mainColor
                                        : AppColors.textColorhint,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              InkWell(
                                onTap: showVoiceDialog,
                                child: Container(
                                  width: 50,
                                  height: 36,
                                  decoration: BoxDecoration(
                                    color: _getCodeCount >= 2
                                        ? AppColors.mainColor
                                        : const Color(0xffD5D5D5),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Image.asset(img(R.loginVoice)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(top: 60, bottom: 20),
                  child: StatefulBuilder(
                    builder: (context, setState) {
                      confirmButtonState = setState;
                      return Button(
                        text: "Confirm",
                        onClick: loginCheck,
                        disabled: confirmButtonDisable,
                      );
                    },
                  ),
                ),
                Container(
                  // color: Colors.red,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 10, bottom: 20),
                  child: InkWell(
                    onTap: changeChecked,
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: StatefulBuilder(
                            builder: (context, setState) {
                              checkedState = setState;
                              return Image.asset(
                                checked
                                    ? "images/ic_checked.png"
                                    : "images/ic_check.png",
                                width: 20,
                              );
                            },
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: "Read and agree",
                                style: TextStyle(
                                    color: Color(0xFF999999), fontSize: 12),
                              ),
                              TextSpan(
                                text: " Privacy Policy",
                                style:
                                    const TextStyle(color: AppColors.mainColor),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                      context,
                                      RouterNames.WEB,
                                      arguments: {
                                        'url': Urls.WEB_URL_PRIVACY,
                                        "showTitle": true
                                      },
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _getCodeCount = 0;
    SpUtils.clearUser();
    phoneFocus.addListener(_onFocusChange);
    OperationUtils.saveOperation('/login');
  }

  void changeChecked() {
    checked = !checked;
    checkedState(() {});
  }

  void startCount() {
    if (count == Constans.CODE_COUNT_TIME) {
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        count--;
        if (count <= 0) {
          timer.cancel();
          _getCodeCount = _getCodeCount + 1;
          count = Constans.CODE_COUNT_TIME;
          showVoice = true;
          voiceCodeState(() {});
        }
        countState(() {});
      });
    }
  }

  void checkConfirmStatus(text) {
    confirmButtonDisable =
        phoneController.text.length < 10 || codeController.text.length < 4;
    confirmButtonState(() {});
  }

  void showVoiceDialog() {
    if (count != Constans.CODE_COUNT_TIME) return;
    if (_getCodeCount < 2) return;
    OperationUtils.saveOperation(OperationCode.SHOW_VOICE_DIALOG);
    DialogUtils.showCustomerDialog(
      context: context,
      title: "Use voice verification code",
      content: "Pick up the call, then input the \nverification code you hear.",
      confirmClick: () {
        Navigator.pop(context);
        getCode(isVoice: true);
      },
    );
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
        },
      );
    } else {
      OperationUtils.saveOperation(OperationCode.LOGIN_SEND_CODE);
      DioManager.getInstance().doRequest<String>(
        path: Urls.LOGIN_VERFIFY_CODE,
        method: DioMethod.GET,
        urlParams: params,
        successCallBack: (result) {
          OperationUtils.saveOperation(OperationCode.LOGIN_CODE_SUCCESS);

          /// 测试环境才可以直接显示验证码
          if (Urls.BASE_URL.contains("phdev.bowenfin")) {
            codeController.value =
                codeController.value.copyWith(text: result.toString());
          }
          if (Constans.systemConfigBean != null) {
            if (Constans.systemConfigBean!.testPhones!.contains(phone)) {
              codeController.value =
                  codeController.value.copyWith(text: result.toString());
            }
          }

          checkConfirmStatus("");
          startCount();
        },
        failCallBack: (result) {
          OperationUtils.saveOperation(OperationCode.LOGIN_CODE_FAIL);
        },
      );
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
    if (Platform.isAndroid) {
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
        // ignore: empty_catches
      } catch (e) {}
    }

    OperationUtils.saveOperation(OperationCode.LOGON_CLICK);
    Future.wait([login(), getDeviceInfo()]).then(
      (results) => {
        if (results[0] == true)
          {
            DioManager.getInstance().doRequest<dynamic>(
              path: Urls.DEVICE_SAVE,
              method: DioMethod.POST,
              bodyParams: results[1],
              showLoading: false,
              successCallBack: (result) {},
            ),
          }
      },
    );
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
          SpUtils.saveToken(result.token!).then((value) => getUserInfo());
          SpUtils.saveLoginInfo(result);
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
      },
    );
    return success;
  }

  Future<String> getDeviceInfo() async {
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
      },
    );
  }

  void goHome(bool loginSuccess) {
    Navigator.pushNamedAndRemoveUntil(
        context, RouterNames.HOME, (route) => false,
        arguments: {"loginSuccess": loginSuccess});
  }

  void showPermissionDialog() {
    DialogUtils.showCustomerDialog(
        context: context, content: "Permission denied");
  }

  @override
  void dispose() {
    super.dispose();
    if (timer != null) {
      timer?.cancel();
    }
    phoneController.dispose();
    codeController.dispose();
  }
}
