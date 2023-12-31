// ignore_for_file: prefer_const_constructors

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:loannow/beans/system_config_bean.dart';
import 'package:loannow/beans/user_info_bean.dart';
import 'package:loannow/config/app_colors.dart';
import 'package:loannow/config/app_config.dart';
import 'package:loannow/config/constants.dart';
import 'package:loannow/config/router_names.dart';
import 'package:loannow/config/urls.dart';
import 'package:loannow/utils/operation_utils.dart';
import 'package:loannow/utils/phone_utils.dart';
import 'package:loannow/utils/secure_cipher_utils.dart';
import 'package:loannow/utils/sp_utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../config/image_config.dart';

class MinePage extends StatefulWidget {
  const MinePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return MinePageState();
  }
}

class MinePageState extends State<MinePage> with AutomaticKeepAliveClientMixin {
  String phone = '';
  late StateSetter phoneState;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Stack(
        children: [
          AspectRatio(
            aspectRatio: 1080 / 750,
            child: Image.asset(img(R.meTopBG), fit: BoxFit.fill),
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: tabbarHeight + Device.appBottomPadding(context),
            ),
            child: ListView(
              padding: const EdgeInsets.only(
                top: 5,
                left: 15,
                right: 15,
                bottom: 35,
              ),
              children: [
                SafeArea(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "CashPH",
                              style: TextStyle(
                                fontSize: 20,
                                color: AppColors.textColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 2),
                              child: Text(
                                "Reliable Helping Hand",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.textColorLight,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        child: Image.asset(
                          "images/img_mine_set.png",
                          width: 30,
                          height: 30,
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RouterNames.SETTING.aseUnlook(),
                          );
                        },
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  child: StatefulBuilder(
                    builder: (context, setState) {
                      phoneState = setState;
                      return Text(
                        "Hi，$phone",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: AppColors.textColor,
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 25),
                  child: Text(
                    "Welcome to CashPH",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textColorLight,
                    ),
                  ),
                ),
                buildItem(
                  img(R.meHistory),
                  "JAsONIbSTebvXgAwKLqwuw==".aseUnlook() /* History */,
                  () {
                    Navigator.pushNamed(
                      context,
                      RouterNames.HISTORY.aseUnlook(),
                    );
                  },
                ),
                buildItem(img(R.meCoupon),
                    "uwpr7AQuZH/32d71XJmDPQ==".aseUnlook() /* Coupon */, () {
                  Navigator.pushNamed(
                    context,
                    RouterNames.WEB.aseUnlook(),
                    arguments: {
                      "vW9Mk2OPXFJFZeVsVxyxVg==".aseUnlook() /* url */ :
                          WebPageUrl.couponUrl,
                      "0G1BpuJo1t01gRqp3BFWxA==".aseUnlook() /* showTitle */ :
                          false
                    },
                  );
                }),
                // buildItem(img(R.meInApp), "L6f6bd/tWQcROEzaBKn4IQ==".aseUnlook() /* In-app Enquire */, () {}),
                buildItem(
                  img(R.meHotline),
                  "fZ2YvRTjhQE9m21Un6ynEQ==".aseUnlook() /* Hotline */,
                  showHotlineDialog,
                ),
                buildItem(img(R.meMessenger),
                    "1/cl8p1KxabIeHLNqPbQwg==".aseUnlook() /* Messenger */,
                    () async {
                  if (Constans.systemConfigBean?.dictInfo?.messagerAccount !=
                      null) {
                    String? urlScheme =
                        Constans.systemConfigBean?.dictInfo?.messagerAccount;
                    debugPrint("Messenger = $urlScheme");
                    if (urlScheme != null && urlScheme.isNotEmpty) {
                      Uri url =
                          Uri.parse("fb-messenger://user-thread/$urlScheme");
                      bool canOpen = await canLaunchUrl(url);
                      if (canOpen) {
                        launchUrl(url);
                      }
                    } else {
                      BotToast.showText(
                          text: "Igm3t6vFmbED6NkFYIQH32ETmxqJDdIKazZpgSMC732rRuJwzMJdSU1YkOHv6kDp"
                              .aseUnlook() /* The messenger app is not installed */);
                    }
                  }
                }),
                buildItem(
                  img(R.mePrivacy),
                  "n9I4KxZfGaWlit+F3gQqkw==".aseUnlook() /* Privacy Policy */,
                  () {
                    Navigator.pushNamed(
                      context,
                      RouterNames.WEB.aseUnlook(),
                      arguments: {
                        "vW9Mk2OPXFJFZeVsVxyxVg==".aseUnlook() /* url */ :
                            Urls.WEB_URL_PRIVACY,
                        "0G1BpuJo1t01gRqp3BFWxA==".aseUnlook() /* showTitle */ :
                            true
                      },
                    );
                  },
                ),

                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 20),
                  child: Constans.systemConfigBean?.dictInfo == null
                      ? Container()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.email_outlined,
                              size: 20,
                              color: Color(0xff999999),
                            ),
                            SizedBox(width: 5),
                            Text(
                              "Email：",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff999999),
                              ),
                            ),
                            Text(
                              Constans.systemConfigBean?.dictInfo!
                                      .feedbackEmail ??
                                  "",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff999999),
                              ),
                            ),
                          ],
                        ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItem(String image, String text, Function onClick) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: InkWell(
        onTap: () {
          onClick();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            border: Border.all(color: AppColors.dividerColor, width: 0.5),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(image, width: 32),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Text(
                    text,
                    style: const TextStyle(
                        color: AppColors.textColor, fontSize: 16),
                  ),
                ),
              ),
              Image.asset("images/img_mine_more.png", width: 15),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getUser();
    OperationUtils.saveOperation('/mine');
  }

  Future<void> getUser() async {
    UserInfoBean? bean = await SpUtils.getUserInfo();
    if (bean != null) {
      phone = bean.telephoneNo!;
      phoneState(() {});
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, RouterNames.LOGIN.aseUnlook());
    }
  }

  void showHotlineDialog() {
    List<Widget> childs = [];
    for (var item in Constans.systemConfigBean?.dictInfo?.servicePhones ?? []) {
      SystemConfigDictInfoServicePhones phones = item;
      childs.add(
        Container(
          padding: const EdgeInsets.only(top: 10),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
              PhoneUtils.callPhone(phones.phone);
            },
            child: Container(
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              margin: const EdgeInsets.only(left: 15, right: 15),
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: [
                  Text(
                    phones.phoneChannel ?? '',
                    style: const TextStyle(
                      fontSize: 18,
                      color: AppColors.textColorhint,
                    ),
                  ),
                  const Expanded(child: SizedBox.shrink()),
                  Text(
                    phones.phone ?? '',
                    style:
                        const TextStyle(fontSize: 18, color: Color(0XFF30C67F)),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    showModalBottomSheet(
      context: context,
      barrierColor: Colors.black54,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      // 点击外部区域是否关闭弹窗，默认true
      clipBehavior: Clip.none,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ...childs,
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(15),
                  child: Text(
                    "+5L2yZluy99EaF9BFwnTEw==".aseUnlook() /* Cancel */,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
    // showDialog(
    //   context: context,
    //   builder: (context) {
    //     return AlertDialog(
    //       content: Column(
    //         mainAxisSize: MainAxisSize.min,
    //         children: [
    //           Align(
    //             alignment: Alignment.centerRight,
    //             child: InkWell(
    //               onTap: () {
    //                 Navigator.pop(context);
    //               },
    //               child: Image.asset(
    //                 "images/ic_close.png",
    //                 width: 15,
    //               ),
    //             ),
    //           ),
    //           const Text(
    //             "fZ2YvRTjhQE9m21Un6ynEQ==".aseUnlook() /* Hotline */,
    //             style: TextStyle(fontSize: 16, color: AppColors.textColor, fontWeight: FontWeight.bold),
    //           ),
    //           ...childs
    //         ],
    //       ),
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(15),
    //       ),
    //     );
    //   },
    // );
  }

  @override
  bool get wantKeepAlive => true;
}
