// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';
import 'package:loannow/config/app_colors.dart';
import 'package:loannow/config/router_names.dart';
import 'package:loannow/config/urls.dart';
import 'package:loannow/utils/operation_utils.dart';
import 'package:loannow/utils/sp_utils.dart';
import 'package:loannow/widget/button.dart';

class LoanPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoanPageState();
  }
}

class LoanPageState extends State<LoanPage> {
  late StateSetter state;
  var _contactPicker = FlutterContactPicker();
  var imgae = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 1080 / 912,
                child: Image.asset("images/img_home_bg_1.png"),
              ),
              SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
                                  style: TextStyle(fontSize: 20, color: Colors.white),
                                ),
                                Container(
                                  child: const Text(
                                    "Personal line of credit",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xccffffff),
                                    ),
                                  ),
                                  margin: const EdgeInsets.only(top: 2),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            child: Image.asset(
                              "images/img_home_messenger.png",
                              width: 30,
                              height: 30,
                            ),
                            onTap: () {
                              // print(Platform.isw)
                            },
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                      decoration: const BoxDecoration(
                        color: Color(0xccffffff),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            const Text(
                              "Line of credit",
                              style: TextStyle(fontSize: 12, color: AppColors.textColorLight),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              child: const Text(
                                "20,000P",
                                style: TextStyle(fontSize: 32, color: AppColors.primaryColor, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 13),
                              decoration: const BoxDecoration(
                                color: Color(0xffCAD5EE),
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                              ),
                              child: const Text(
                                "Interest rate: 0.05%/Day",
                                style: TextStyle(fontSize: 10, color: AppColors.textColorLight),
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.symmetric(vertical: 15),
                                child: const Divider(
                                  height: 0.5,
                                  color: AppColors.dividerColor,
                                )),
                            const Text(
                              "Repeyment Term: 91 - 365 Days",
                              style: TextStyle(fontSize: 10, color: AppColors.textColorLight),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // StatefulBuilder(
                    //   builder: (context, setState) {
                    //     state = setState;

                    //     return Image.file(File(imgae));
                    //   },
                    // ),
                    Container(
                      margin: const EdgeInsets.only(top: 5, left: 15, right: 15),
                      child: Button(
                        text: "Confirm",
                        onClick: () async {
                          Contact? contact = await _contactPicker.selectContact();

                          print(contact);
                          return SpUtils.getToken().then(
                            (value) => {
                              if (value == null)
                                Navigator.pushNamed(context, RouterNames.LOGIN)
                              else
                                Navigator.pushNamed(context, RouterNames.WEB, arguments: {'url': Urls.WEB_URL_LOAN, 'showTitle': false})

                              // var aa = await Navigator.pushNamed(context, RouterNames.CAMERA);
                              // imgae = aa.toString();
                              // state(() {});

                              // print(aa);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 10),
            child: const Text(
              "Try how much you can borrow",
              style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textColor, fontSize: 16),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: AspectRatio(
              aspectRatio: 974 / 270,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("images/img_home_bg_2.png"),
                )),
                child: const Row(
                  children: [
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Basic Information",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          "Step 3/4",
                          style: TextStyle(color: Color(0xccffffff)),
                        )
                      ],
                    )),
                    Text(
                      "82%",
                      style: TextStyle(color: Color(0xFF3FE597), fontWeight: FontWeight.bold, fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, top: 25, right: 15),
            child: const Text(
              "How to borrow?",
              style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textColor, fontSize: 16),
            ),
          ),
          buildStep("images/img_home_step1.png", "Upload Documents", "High pass rate", "Step1"),
          buildStep("images/img_home_step2.png", "Choose your loan plan", "Low interest", "Step2"),
          buildStep("images/img_home_step3.png", "Amount Disbursed", "Loan fast", "Step3"),
        ],
      ),
    );
  }

  Widget buildStep(String image, String title, String desc, String right) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 40,
            ),
            Expanded(
                flex: 1,
                child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(fontSize: 14, color: AppColors.textColor, fontWeight: FontWeight.bold),
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 3),
                            child: Text(
                              desc,
                              style: const TextStyle(fontSize: 10, color: Color(0xFF697699)),
                            ))
                      ],
                    ))),
            Text(
              right,
              style: const TextStyle(fontSize: 14, color: Color(0xFF464F66), fontWeight: FontWeight.w600),
            )
          ],
        ));
  }

  @override
  void initState() {
    super.initState();
    OperationUtils.saveOperation('/home/loan');
  }
}
