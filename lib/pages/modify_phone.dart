import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:loannow/beans/login_info_bean.dart';
import 'package:loannow/beans/user_info_bean.dart';
import 'package:loannow/config/app_colors.dart';
import 'package:loannow/config/constants.dart';
import 'package:loannow/config/router_names.dart';
import 'package:loannow/config/urls.dart';
import 'package:loannow/net/dio_manager.dart';
import 'package:loannow/utils/operation_utils.dart';
import 'package:loannow/utils/phone_utils.dart';
import 'package:loannow/utils/sp_utils.dart';
import 'package:loannow/widget/button.dart';
import 'package:loannow/widget/titleBar.dart';

class ModifyPhonePage extends StatefulWidget {
  const ModifyPhonePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return ModifyPhonePageState();
  }
}

class ModifyPhonePageState extends State<ModifyPhonePage> {
  bool codeError = false, confirmButtonDisable = true;
  TextEditingController phoneController = TextEditingController();
  FocusNode phoneFocus = FocusNode();
  TextEditingController codeController = TextEditingController();
  int count = Constans.CODE_COUNT_TIME;
  late Timer? timer;
  late StateSetter countState, codeErrorState, confirmButtonState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          TitleBar(
            title: "Change my phone number",
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 60),
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "images/ic_ph_flag.png",
                            width: 15,
                          ),
                          Container(
                            width: 30,
                            alignment: Alignment.center,
                            child: const Text("+63"),
                          )
                        ],
                      ),
                      TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.number,
                        maxLines: 1,
                        maxLength: 12,
                        focusNode: phoneFocus,
                        decoration: const InputDecoration(
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
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: codeController,
                        maxLines: 1,
                        maxLength: 4,
                        decoration: const InputDecoration(
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
                              onTap: getCode,
                              child: Text(
                                count == Constans.CODE_COUNT_TIME ? "Send" : "${count}s",
                                style: const TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.w600),
                              ),
                            );
                          },
                        ),
                      )
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
                            Image.asset(
                              "images/ic_info_red.png",
                              width: 15,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 5),
                              child: const Text(
                                "Verification code error",
                                style: TextStyle(
                                  color: Color(0xFFF94D3F),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
                StatefulBuilder(
                  builder: (context, setState) {
                    confirmButtonState = setState;
                    return Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: Button(text: "Confirm", disabled: confirmButtonDisable, onClick: modify),
                    );
                  },
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
    OperationUtils.saveOperation('/modifyPhone');
  }

  void startCount() {
    if (count == Constans.CODE_COUNT_TIME) {
      timer = Timer.periodic(
        const Duration(seconds: 1),
        (timer) {
          count--;
          if (count <= 0) {
            timer.cancel();
            count = Constans.CODE_COUNT_TIME;
          }
          countState(() {});
        },
      );
    }
  }

  void checkConfirmStatus(text) {
    confirmButtonDisable = phoneController.text.length < 10 || codeController.text.length < 4;
    confirmButtonState(() {});
  }

  void getCode() {
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
    DioManager.getInstance().doRequest<String>(
      path: Urls.MODIFY_PHONE_VERIFY_CODE,
      method: DioMethod.GET,
      urlParams: params,
      successCallBack: (result) {
        codeController.value = codeController.value.copyWith(
          text: result.toString(),
        );
        checkConfirmStatus("");
        startCount();
      },
    );
  }

  Future<void> modify() async {
    String phone = PhoneUtils.formatPhone(phoneController.text);
    if (phone.isEmpty) {
      BotToast.showText(text: "Phone number error");
      phoneFocus.requestFocus();
      return;
    }
    var params = {
      "newPhone": phone,
      "verifyCode": codeController.text,
    };
    DioManager.getInstance().doRequest<LoginInfoBean>(
      path: Urls.MODIFY_PHONE,
      method: DioMethod.GET,
      urlParams: params,
      showErrorMsg: true,
      successCallBack: (result) {
        if (result != null) {
          SpUtils.saveToken(result!.token!).then(
            (value) => getUserInfo(),
          );
        }
      },
      failCallBack: (result) {
        codeError = true;
        codeErrorState(() {});
      },
    );
  }

  void getUserInfo() {
    DioManager.getInstance().doRequest<UserInfoBean>(
      path: Urls.USER_INFO,
      method: DioMethod.GET,
      successCallBack: (result) {
        SpUtils.saveUserInfo(result!);
        Navigator.pushNamedAndRemoveUntil(context, RouterNames.HOME, (route) => false);
      },
    );
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
