// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loannow/config/app_colors.dart';

import '../beans/coupon_alert_bean.dart';
import '../config/image_config.dart';

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
              margin: EdgeInsets.only(top: 52),
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
                  SizedBox(
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

  String formatDate(DateTime dateTime) {
    String formattedDate = DateFormat('MM/dd/yyyy').format(dateTime);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(model.endUsableTime!);

    return Container(
      width: 330,
      height: 318,
      decoration: const BoxDecoration(
        color: Color(0xffC0CBF4),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
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
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 245,
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
                            "₱${model.amount!.toStringAsFixed(0)}",
                            style: const TextStyle(
                              fontSize: 28,
                              color: Color(0xff333333),
                            ),
                          ),
                          Text(
                            "Expire on ${formatDate(dateTime)}",
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
                width: 25,
                padding: EdgeInsets.only(left: 5),
                child: Image.asset(img(R.coupenRank)),
              ),
            ],
          ),
          Container(
            height: 40,
            alignment: Alignment.center,
            child: const Text(
              "Get ₱1000-₱2000 extra on the next loan",
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
