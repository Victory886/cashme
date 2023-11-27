import 'package:flutter/material.dart';

class CouponAlertViewWidget extends StatelessWidget {
  const CouponAlertViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      // isDismissible: true,

      clipBehavior: Clip.none,
      child: Container(
        width: 330,
        height: 370,
        color: Colors.amber.withAlpha(100),
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Container(
              height: 318,
              margin: const EdgeInsets.only(top: 52),
              child: const MyWidget(),
            ),
            Container(
              height: 150,
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 80, bottom: 100),
                    child: Icon(Icons.ac_unit_sharp),
                  ),
                  Container(
                    width: 150,
                    color: Colors.red,
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
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: const Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Text(
                        "Bonus Coupon\nYou Own",
                        maxLines: 2,
                        style: TextStyle(
                            color: Color(0xff3C56E8),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.podcasts),
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
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("100",
                          style: TextStyle(
                              fontSize: 28, color: Color(0xff333333))),
                      Text("Expire on Jan. 31st,2023",
                          style: TextStyle(
                              fontSize: 10, color: Color(0xff999999))),
                    ],
                  ),
                ),
                Container(width: 90, color: Colors.blue),
              ],
            ),
          ),
          Container(
            height: 40,
            alignment: Alignment.center,
            child: const Text(
              "Get 000p-2000pextra on the next loan",
              style: TextStyle(color: Color(0xff666666), fontSize: 12),
            ),
          ),
          // const SizedBox(height: 15),
          Container(
            width: 281,
            height: 60,
            color: Colors.blueAccent,
          ),
        ],
      ),
    );
  }
}
