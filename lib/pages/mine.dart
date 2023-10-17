import 'package:flutter/material.dart';
import 'package:loannow/beans/system_config_bean.dart';
import 'package:loannow/beans/user_info_bean.dart';
import 'package:loannow/config/app_colors.dart';
import 'package:loannow/config/constants.dart';
import 'package:loannow/config/router_names.dart';
import 'package:loannow/config/urls.dart';
import 'package:loannow/utils/operation_utils.dart';
import 'package:loannow/utils/phone_utils.dart';
import 'package:loannow/utils/sp_utils.dart';

class MinePage extends StatefulWidget {
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
            aspectRatio: 1080 / 600,
            child: Image.asset("images/img_mine_bg.png"),
          ),
          ListView(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 35),
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
                          const Text(
                            "LoanNow",
                            style: TextStyle(fontSize: 20, color: AppColors.textColor),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 2),
                            child: const Text(
                              "Personal line of credit",
                              style: TextStyle(fontSize: 12, color: AppColors.textColorLight),
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
                        Navigator.pushNamed(context, RouterNames.SETTING);
                      },
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 25, bottom: 5),
                child: StatefulBuilder(builder: (context, setState) {
                  phoneState = setState;
                  return Text("Hi.${phone}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: AppColors.textColor));
                }),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 25),
                child: const Text(
                  "Welcome to LoanNow",
                  style: TextStyle(fontSize: 14, color: AppColors.textColorLight),
                ),
              ),
              buildItem(
                "images/img_mine_history.png",
                "History",
                () {
                  Navigator.pushNamed(context, RouterNames.HISTORY);
                },
              ),
              buildItem("images/img_mine_coupon.png", "Coupon", () {}),
              buildItem("images/img_mine_enquire.png", "In-app Enquire", () {}),
              buildItem("images/img_mine_hotline.png", "Hotline", showHotlineDialog),
              buildItem("images/img_mine_messenger.png", "Messenger", () {}),
              buildItem(
                "images/img_mine_privacy.png",
                "Privacy Policy",
                () {
                  Navigator.pushNamed(
                    context,
                    RouterNames.WEB,
                    arguments: {'url': Urls.WEB_URL_LOAN},
                  );
                },
              ),
            ],
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
              Image.asset(
                image,
                width: 32,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Text(
                    text,
                    style: const TextStyle(color: AppColors.textColor, fontSize: 16),
                  ),
                ),
              ),
              Image.asset(
                "images/img_mine_more.png",
                width: 15,
              ),
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
      Navigator.pushNamed(context, RouterNames.LOGIN);
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
              PhoneUtils.callPhone(phones.phone);
            },
            child: Row(
              children: [
                Text(
                  phones.phoneChannel ?? '',
                  style: const TextStyle(fontSize: 16, color: AppColors.textColorhint),
                ),
                const Expanded(child: SizedBox.shrink()),
                Text(
                  phones.phone ?? '',
                  style: const TextStyle(fontSize: 16, color: Color(0XFF30C67F)),
                )
              ],
            ),
          ),
        ),
      );
    }
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        "images/ic_close.png",
                        width: 15,
                      ))),
              const Text(
                "Hotline",
                style: TextStyle(fontSize: 16, color: AppColors.textColor, fontWeight: FontWeight.bold),
              ),
              ...childs
            ],
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
