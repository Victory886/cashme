// ignore_for_file: prefer_const_constructors

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:loannow/beans/account_delete_bean.dart';
import 'package:loannow/beans/version_bean.dart';
import 'package:loannow/config/app_colors.dart';
import 'package:loannow/config/constants.dart';
import 'package:loannow/config/router_names.dart';
import 'package:loannow/config/urls.dart';
import 'package:loannow/net/dio_manager.dart';
import 'package:loannow/pages/main.dart';
import 'package:loannow/utils/dialog_utils.dart';
import 'package:loannow/utils/operation_utils.dart';
import 'package:loannow/utils/phone_utils.dart';
import 'package:loannow/utils/secure_cipher_utils.dart';
import 'package:loannow/utils/sp_utils.dart';
import 'package:loannow/widget/titleBar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../beans/user_info_bean.dart';
import '../utils/device_utils.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return SettingPageState();
  }
}

class SettingPageState extends State<SettingPage> {
  String phone = '';
  late StateSetter phoneState;

  String version = "3fGLoL45lm19CYq1m5Tz/w==".aseUnlook() /* 1.0.0 */;
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
          TitleBar(title: "PN9iAlna6aQ8VHqdjqnhNw==".aseUnlook() /* Setting */),
          buildItem(
            text: "negYki4q78saZthdG2os3VZXpJVi67HWeF7dLVs5w7I="
                .aseUnlook() /* Change my phone number */,
            onClick: () {
              Navigator.pushNamed(
                context,
                RouterNames.WEB.aseUnlook(),
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
                text:
                    "MvfNXegify3MqASXmsWIxg==".aseUnlook() /* Version Update */,
                onClick: () {
                  /// 调用版本更新接口

                  DioManager.getInstance().doRequest<VersionBean>(
                    path: Urls.APPVERSION_NEEDUPDATE,
                    method: DioMethod.GET,
                    successCallBack: (result) {
                      if (result != null) {
                        fLog(" vvvvv ${result.version}");

                        if (result.version != version) {
                          newVersion(result);
                        }
                      }
                    },
                    failCallBack: (result) {},
                  );
                },
                rightText: "V$version",
              );
            },
          ),
          // if (Constans.systemConfigBean?.testPhones != null)
          StatefulBuilder(
            builder: (context, state) {
              phoneState = state;
              return buildItem(
                text: "agXpaevp7DVJOx2aX521BoR8U7T7qRXv/K8fZmKxtfI="
                    .aseUnlook() /* Account Deletion */,
                onClick: () {
                  Navigator.pushNamed(
                    context,
                    RouterNames.WEB.aseUnlook(),
                    arguments: {
                      "vW9Mk2OPXFJFZeVsVxyxVg==".aseUnlook() /* url */ :
                          WebPageUrl.accountDeletion,
                      "0G1BpuJo1t01gRqp3BFWxA==".aseUnlook() /* showTitle */ :
                          false
                    },
                  ).then((value) {
                    if (value != null) {}
                  });
                },
              );
            },
          ),
          Expanded(child: Container()),
          Container(
            margin: const EdgeInsets.only(bottom: 50, left: 20, right: 20),
            child: InkWell(
              onTap: () {
                out();
                SpUtils.clearUser();
                SpUtils.clearCouponAlert();
                openHome(context, isOpenLoginPage: true);
              },
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  border: Border.all(
                    width: 0.5,
                    style: BorderStyle.solid,
                    color: AppColors.dividerColor,
                  ),
                ),
                child: Text(
                  "rPs4qwgXds/6fFegKvfhPw==".aseUnlook() /* Logout */,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
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
                    color: AppColors.mainColor,
                    fontSize: 12,
                  ),
                ),
              ),
            Image.asset(
              "iPtP4TLZXUvoRIjmI8jSpziEx2hupzi8ukYEtFQbGd4="
                  .aseUnlook() /* images/ic_setting_more.png */,
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
      title: "3o3FCmMRIATxPitJTYfJmdpvMPUSOw8OCMqGQ4aC2Syb2kB8aazLPTGD0CNPJWBcjD5ViNQRaZRXBWzWsOYUPq5kCxUOZKjajdqpo4g5sz3/e0B+e2ShcpFqKitqsxUR+dtP0QOs02b3JtWS4ri7P9LzHTv1NdVB7H1iaEPPpxjtr4Nr0H6qjg+PzUeKP36p"
          .aseUnlook() /* To ensure the security of your account, the following conditions must be met before your application for cancellation takes effect: */,
      content:
          "h9yMC16MOlF+r3PXa/IAIoSA2WJKvEPtExMh6SQTimNS+/8N59RULPlTrJGl0DXb3RMFm68R/blRga/Nbcz1V1DvUDBcp4BVdJy5CbUiIx4+iZhjeRPkYwzMOWiKfB7X+TsAgUGnle8orx7C5aIE6ZoKadlvzQadN6mZgDJtWnVs/oyV7N7d9mvHm356kvbgmaoxmWzo7gGxCtSYssVGyQ=="
              .aseUnlook() /* All transactions under the account have been settled, and the accumulated user rights and interests have been voluntarily waived (account credits) */,
      confirmClick: () {
        Navigator.pop(context);
        deleteAccount();
      },
    );
  }

  void newVersion(VersionBean model) {
    // CupertinoAlertDialog(
    //   content: SingleChildScrollView(
    //     child: ListBody(
    //       // ignore: prefer_const_literals_to_create_immutables
    //       children: <Widget>[
    //         Text("IOS风格"),
    //         Text("是否要删除？"),
    //         Text("一旦删除数据不可恢复!")
    //       ],
    //     ),
    //   ),
    //   actions: <Widget>[
    //     CupertinoDialogAction(
    //       child: Text("确定"),
    //       onPressed: () {},
    //     ),
    //     CupertinoDialogAction(
    //       child: Text("取消"),
    //       onPressed: () {},
    //     ),
    //   ],
    // );

    DialogUtils.showCustomerDialog(
      context: context,
      title: "Update Available",
      content: "A new version is available. Please update version now.",
      confirmClick: () {
        final Uri url = Uri.parse(model.downloadUrl ?? "");
        launchUrl(url);
        Navigator.pop(context);
      },
      cancelClick: () {
        if (model.foreupdate ?? false) {
          final Uri url = Uri.parse(model.downloadUrl ?? "");
          launchUrl(url);
          Navigator.pop(context);
        } else {
          Navigator.pop(context);
        }
      },
    );
  }

  //

  void out() {
    DioManager.getInstance().doRequest<Map<String, dynamic>>(
      path: Urls.SIGN_OUT,
      method: DioMethod.GET,
      successCallBack: (result) {},
    );
  }

  void deleteAccount() {
    DioManager.getInstance().doRequest<AccountDeleteBean>(
      path: Urls.MODIFY_PHONE,
      method: DioMethod.POST,
      successCallBack: (result) {
        if (result == null) {
          Navigator.pushNamedAndRemoveUntil(
              context, RouterNames.LOGIN.aseUnlook(), (route) => false);
        } else {
          BotToast.showText(
              text: "5y2JPzT8/MfKWfy5tvhmBpAFvmWTn178R7OwFFXYERWYlbHqJ3Xd4vO2y176ALWGMQSR+Gw8uAoaGAcipdEszfIVnEb6ZBwn3e2Ty/yul6M="
                  .aseUnlook() /* You have an unfinished order, please complete the order before proceeding. */);
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getUser();
    getVersion();
    OperationUtils.saveOperation('/setting');
  }
}
