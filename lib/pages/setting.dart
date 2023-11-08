import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:loannow/beans/account_delete_bean.dart';
import 'package:loannow/beans/login_info_bean.dart';
import 'package:loannow/config/app_colors.dart';
import 'package:loannow/config/app_config.dart';
import 'package:loannow/config/constants.dart';
import 'package:loannow/config/router_names.dart';
import 'package:loannow/config/urls.dart';
import 'package:loannow/net/dio_manager.dart';
import 'package:loannow/utils/dialog_utils.dart';
import 'package:loannow/utils/operation_utils.dart';
import 'package:loannow/utils/sp_utils.dart';
import 'package:loannow/widget/titleBar.dart';

import '../beans/user_info_bean.dart';
import '../utils/device_utils.dart';

class SettingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SettingPageState();
  }
}

class SettingPageState extends State<SettingPage> {
  String phone = '';
  late StateSetter phoneState;

  String version = "1.0.0";
  late StateSetter verSionState;

  Future<void> getUser() async {
    UserInfoBean? bean = await SpUtils.getUserInfo();
    if (bean != null) {
      phone = bean.telephoneNo!;
      phoneState(() {});
    }
  }

  Future<void> getVersion() async {
    version = await DeviceUtils.getAppVersion();
    verSionState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TitleBar(title: "Setting"),
          buildItem(
            text: "Change my phone number",
            onClick: () {
              Navigator.pushNamed(
                context,
                RouterNames.WEB,
                arguments: {
                  'url': WebPageUrl.changePhoneUrl,
                  'showTitle': false
                },
              );
            },
          ),
          StatefulBuilder(
            builder: (context, state) {
              verSionState = setState;
              return buildItem(
                text: "Version Update",
                onClick: () {
                  /// 调用版本更新接口
                },
                rightText: "V$version",
              );
            },
          ),
          if (Constans.systemConfigBean?.testPhones != null)
            StatefulBuilder(
              builder: (context, state) {
                phoneState = state;
                if (Constans.systemConfigBean!.testPhones!.contains(phone)) {
                  return buildItem(
                    text: "Account Deletion",
                    onClick: () {
                      showDeleteDialog();
                    },
                  );
                } else {
                  return const Expanded(child: SizedBox.shrink());
                }
              },
            ),
          Container(
            margin: const EdgeInsets.only(bottom: 50, left: 20, right: 20),
            child: InkWell(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, RouterNames.LOGIN, (route) => false);
              },
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  border: Border.all(
                    color: AppColors.dividerColor,
                    width: 0.5,
                    style: BorderStyle.solid,
                  ),
                ),
                child: const Text(
                  "Logout",
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItem(
      {required String text, required Function onClick, String? rightText}) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: const Color(0xFFE9E9E9),
            width: 0.5,
            style: BorderStyle.solid,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                child: Text(
                  text,
                  style: const TextStyle(color: AppColors.textColor),
                ),
              ),
            ),
            if (rightText != null)
              Container(
                margin: const EdgeInsets.only(right: 5),
                child: Text(
                  rightText.toString(),
                  style: const TextStyle(
                      color: AppColors.primaryColor, fontSize: 12),
                ),
              ),
            Image.asset(
              "images/ic_setting_more.png",
              width: 15,
            ),
          ],
        ),
      ),
    );
  }

  void showDeleteDialog() {
    DialogUtils.showCustomerDialog(
      context: context,
      title:
          "To ensure the security of your account, the following conditions must be met before your application for cancellation takes effect:",
      content:
          "All transactions under the account have been settled, and the accumulated user rights and interests have been voluntarily waived "
          "(account credits)",
      confirmClick: () {
        Navigator.pop(context);
        deleteAccount();
      },
    );
  }

  void deleteAccount() {
    DioManager.getInstance().doRequest<AccountDeleteBean>(
        path: Urls.MODIFY_PHONE,
        method: DioMethod.POST,
        successCallBack: (result) {
          if (result == null) {
            Navigator.pushNamedAndRemoveUntil(
                context, RouterNames.LOGIN, (route) => false);
          } else {
            BotToast.showText(
                text:
                    "You have an unfinished order, please complete the order before proceeding.");
          }
        });
  }

  @override
  void initState() {
    super.initState();
    getUser();
    getVersion();
    OperationUtils.saveOperation('/setting');
  }
}
