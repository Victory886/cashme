import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:loannow/config/app_colors.dart';
import 'package:loannow/utils/operation_utils.dart';
import 'package:loannow/widget/titleBar.dart';

class AboutUsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AboutUsPageState();
  }
}

class AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TitleBar(title: "About us"),
          Expanded(
              child: ListView(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
            children: [
              Image.asset(
                "images/ic_close.png",
                width: 80,
                height: 80,
              ),
              Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 5, right: 10),
                        width: 7,
                        height: 7,
                        decoration: BoxDecoration(color: AppColors.dividerColor, borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                      Expanded(
                          child: Text(
                        "Fun Lending Corporation is a mature online finance company in conformity with Philippine laws. Located in Makati city, "
                        "we provide financial service to filipinos who has financial needs. We have a well-experienced team,Managers are from banks like BDO, BPI and METRO BANK, as well as talented individuals from other top finance companies.",
                        style: TextStyle(color: AppColors.textColorLight),
                      ))
                    ],
                  )),
              Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 5, right: 10),
                        width: 7,
                        height: 7,
                        decoration: BoxDecoration(color: AppColors.dividerColor, borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                      Expanded(
                          child: Text(
                        "The company adheres to the core values of Professional, Efficient, Honest, Pursue Excellent Gratitude Helping more "
                        "Filipinos not be bothered by lack of funds,to have the opportunity to change their fates.",
                        style: TextStyle(color: AppColors.textColorLight),
                      ))
                    ],
                  )),
              Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 5, right: 10),
                        width: 7,
                        height: 7,
                        decoration: BoxDecoration(color: AppColors.dividerColor, borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                      Expanded(
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(text: "Mada loan's Only official Facebook account:\n", style: TextStyle(color: AppColors.textColorLight)),
                          TextSpan(
                              text: "https://www.facebook.com/profile.php? id=100073166196671&_rdc=1&_rdr",
                              style: TextStyle(color: AppColors.primaryColor),
                              recognizer: TapGestureRecognizer()..onTap = () {}),
                        ])),
                      )
                    ],
                  )),
              Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 5, right: 10),
                        width: 7,
                        height: 7,
                        decoration: BoxDecoration(color: AppColors.dividerColor, borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                      Expanded(
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(text: "Mada loan's Official website:\n", style: TextStyle(color: AppColors.textColorLight)),
                          TextSpan(
                              text: "http://madaloan.com/",
                              style: TextStyle(color: AppColors.primaryColor),
                              recognizer: TapGestureRecognizer()..onTap = () {}),
                        ])),
                      )
                    ],
                  )),
            ],
          ))
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    OperationUtils.saveOperation('/about');
  }
}
