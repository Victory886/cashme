import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loannow/config/urls.dart';
import 'package:loannow/utils/phone_utils.dart';

import '../beans/coupon_alert_bean.dart';

class CouponAlertViewWidget extends StatelessWidget {
  const CouponAlertViewWidget({super.key, required this.model});

  final CouponAlertBean model;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      // isDismissible: true,
      backgroundColor: Colors.transparent,
      clipBehavior: Clip.none,
      child: Container(
        width: 330,
        height: 370,
        // color: Colors.amber.withAlpha(100),
        color: Colors.transparent,
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Container(
              height: 318,
              margin: const EdgeInsets.only(top: 52),
              child: MyWidget(model: model),
            ),
            Container(
              height: 150,
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 60, bottom: 40, left: 0),
                    // child: Icon(Icons.ac_unit_sharp),
                    child: Image.asset(
                      img(R.coupenTopPoint),
                      width: 30,
                      height: 30,
                    ),
                  ),
                  Container(
                    width: 150,
                    child: Image.asset(img(R.coupenBox)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key, required this.model});
  final CouponAlertBean model;

  String getDaySuffix(int day) {
    // 获取日期的后缀，例如 "st", "nd", "rd", "th"
    if (day >= 11 && day <= 13) {
      return 'th';
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  String formatDate(DateTime dateTime) {
    // 使用 intl 包的 DateFormat 类来格式化日期
    String day = getDaySuffix(dateTime.day);
    String formattedDate = DateFormat("d'$day', yyyy").format(dateTime);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    // 将时间戳转换为 DateTime 对象
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(model.createTime! ~/ 1000);

    // 使用 intl 包来格式化日期
    // String formattedDate = formatDate(dateTime);

    return Container(
      width: 330,
      height: 318,
      decoration: const BoxDecoration(
          color: Color(0xffC0CBF4),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      const Text(
                        "Bonus Coupon\nYou Own",
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff3C56E8),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Image.asset(img(R.coupenTopLine))
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 150, height: 112)
            ],
          ),
          const SizedBox(height: 20),

          // 显示金额的地方
          Container(
            width: 265,
            height: 75,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(img(R.coupenInfo)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${model.amount!.toStringAsFixed(0)}P",
                        style: const TextStyle(
                          fontSize: 28,
                          color: Color(0xff333333),
                        ),
                      ),
                      Text(
                        "Expire on Jan. ${formatDate(dateTime)}",
                        style: const TextStyle(
                          fontSize: 10,
                          color: Color(0xff999999),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 70,
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  child: const Text(
                    "Coupon",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 40,
            alignment: Alignment.center,
            child: const Text(
              "Get 1000p-2000pextra on the next loan",
              style: TextStyle(color: Color(0xff666666), fontSize: 12),
            ),
          ),
          // const SizedBox(height: 15),
          InkWell(
            child: SizedBox(
              width: 281,
              height: 60,
              // color: Colors.blueAccent,
              child: Image.asset(img(R.coupenTakeIt)),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
