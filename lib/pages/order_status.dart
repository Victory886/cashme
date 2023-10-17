import 'package:flutter/material.dart';
import 'package:loannow/beans/application_bean.dart';
import 'package:loannow/beans/basis_info_bean.dart';
import 'package:loannow/config/app_colors.dart';
import 'package:loannow/config/urls.dart';
import 'package:loannow/net/dio_manager.dart';
import 'package:loannow/utils/application_status_utils.dart';
import 'package:loannow/utils/operation_utils.dart';
import 'package:loannow/utils/sp_utils.dart';
import 'package:loannow/widget/titleBar.dart';

class OrderStatusPage extends StatefulWidget {
  late VoidCallback refreshClick;
  late VoidCallback finishClick;
  late ApplicationBean application;

  @override
  State<StatefulWidget> createState() {
    return OrderStatusPageState();
  }

  OrderStatusPage({Key? key, required this.refreshClick, required this.finishClick, required this.application}) : super(key: key);
}

class OrderStatusPageState extends State<OrderStatusPage> {
  bool showAccountInfo = false;
  bool showInstagram = false;
  bool showConfirm = false;
  String statusImage = "images/img_evaluating.png";
  TextEditingController insAccountController = TextEditingController();
  late BasisInfoBean basisInfo;

  @override
  Widget build(context) {
    return Scaffold(
      body: Column(
        children: [
          TitleBar(
            leftImage: "images/ic_refresh.png",
            leftClick: this.widget.refreshClick,
            title: "No.${this.widget.application.id}",
            bgColor: AppColors.primaryColor,
            textColor: Colors.white,
            rightImage: "images/ic_service.png",
          ),
          Expanded(
              child: ListView(padding: EdgeInsets.all(15), children: [
            Container(
              margin: EdgeInsets.only(top: 15),
              alignment: Alignment.center,
              child: Text(
                widget.application.statusDesc.toString(),
                style: TextStyle(color: AppColors.primaryColor, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              alignment: Alignment.center,
              child: Text(
                "Please keep phone active to expect a verification call or approval SMS",
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.textColorLight, fontSize: 12, height: 1.5),
              ),
            ),
            FractionallySizedBox(
                widthFactor: 0.6,
                child: Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Image.asset(
                    statusImage,
                    fit: BoxFit.fill,
                  ),
                )),
            InkWell(
                onTap: () async {},
                child: Container(
                    padding: EdgeInsets.only(top: 50, bottom: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Charge details",
                          style: TextStyle(color: AppColors.textColorLight),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Image.asset(width: 10, "images/ic_more.png"),
                        )
                      ],
                    ))),
            if (showInstagram)
              Container(
                  margin: EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 30),
                  child: InkWell(
                      onTap: showInstagramDialog,
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                          decoration: BoxDecoration(color: Color(0xff30C67F), borderRadius: BorderRadius.all(Radius.circular(15))),
                          child: Row(
                            children: [
                              Image.asset(width: 15, "images/ic_camera.png"),
                              Expanded(
                                  child: Container(
                                      margin: EdgeInsets.symmetric(horizontal: 8),
                                      child: Text(
                                        "Add instagram account",
                                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                                      ))),
                              Image.asset(width: 12, "images/ic_more_white.png"),
                            ],
                          )))),
            if (showConfirm)
              Container(
                  margin: EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 30),
                  child: InkWell(
                      onTap: () {
                        SpUtils.setOrderFinished().then((value) => widget.finishClick());
                      },
                      child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                          decoration: BoxDecoration(color: Color(0xff30C67F), borderRadius: BorderRadius.all(Radius.circular(15))),
                          child: Text(
                            "Confirm",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                          )))),
            if (showAccountInfo)
              Container(
                margin: EdgeInsets.only(top: 15, bottom: 30),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                decoration: BoxDecoration(color: Color(0xffEFF4FF), borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          "Withdrawal method",
                          style: TextStyle(color: AppColors.textColorLight, fontSize: 12),
                        )),
                        Text(
                          "Gcash account",
                          style: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              "Withdrawal method",
                              style: TextStyle(color: AppColors.textColorLight, fontSize: 12),
                            )),
                            Text(
                              "Gcash account",
                              style: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.bold),
                            )
                          ],
                        )),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          "Withdrawal method",
                          style: TextStyle(color: AppColors.textColorLight, fontSize: 12),
                        )),
                        Text(
                          "Gcash account",
                          style: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
              )
          ]))
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    initStatus();
    getBasisInfo();
  }

  void initStatus() {
    var status = widget.application.status!;
    var page = '';
    if (ApplicationStatusUtils.isExamine(status)) {
      statusImage = "images/img_evaluating.png";
      showInstagram = true;
      page = 'examine';
    } else if (ApplicationStatusUtils.isRollback(status) || ApplicationStatusUtils.isRefuse(status)) {
      statusImage = "images/img_disapproved.png";
      showConfirm = true;
      page = 'rollback';
      if (ApplicationStatusUtils.isRefuse(status)) page = 'refuse';
    } else if (ApplicationStatusUtils.isPass(status)) {
      statusImage = "images/img_approved.png";
      showAccountInfo = true;
      page = 'pass';
    } else if (ApplicationStatusUtils.isWithdrawal(status)) {
      statusImage = "images/img_withdraw.png";
      showAccountInfo = true;
      page = 'withdraw';
    } else if (ApplicationStatusUtils.isAbandon(status)) {
      statusImage = "images/img_giveup.png";
      showConfirm = true;
      page = 'abandon';
    } else if (ApplicationStatusUtils.isFinish(status) || ApplicationStatusUtils.isClose(status)) {
      statusImage = "images/img_finish.png";
      showConfirm = true;
      page = 'finish';
      if (ApplicationStatusUtils.isRefuse(status)) page = 'close';
    }
    OperationUtils.saveOperation('/home/' + page);
  }

  Future<void> getBasisInfo() async {
    BasisInfoBean? bean = await SpUtils.getBasisInfo();
    if (bean != null) {
      basisInfo = bean;
      insAccountController.value = insAccountController.value.copyWith(text: basisInfo.insAccount);
    }
  }

  void showInstagramDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                            padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                            child: Image.asset(
                              "images/ic_close.png",
                              width: 15,
                            )))),
                Text(
                  "Add instagram account",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: AppColors.textColor, fontWeight: FontWeight.bold),
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: TextField(
                      controller: insAccountController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        hintText: "Please enter",
                        filled: true,
                        fillColor: Color(0xFFF5F5FA),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)), borderSide: BorderSide.none),
                      ),
                    )),
                Divider(
                  color: AppColors.dividerColor,
                ),
                InkWell(
                    onTap: saveInstagram,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      alignment: Alignment.center,
                      child: Text(
                        "Confirm",
                        style: TextStyle(color: AppColors.primaryColor, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ))
              ],
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          );
        });
  }

  void saveInstagram() {
    Navigator.pop(context);
    DioManager.getInstance().doRequest(
        path: Urls.BASIS_INFO_SAVE,
        method: DioMethod.POST,
        bodyParams: {'insAccount': insAccountController.text},
        successCallBack: (result) {
          basisInfo.insAccount = insAccountController.text;
          SpUtils.saveBasisInfo(basisInfo);
        });
  }
}
