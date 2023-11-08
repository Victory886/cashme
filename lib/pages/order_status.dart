// ignore_for_file: prefer_single_quotes, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loannow/beans/application_bean.dart';
import 'package:loannow/beans/basis_info_bean.dart';
import 'package:loannow/config/app_colors.dart';
import 'package:loannow/config/app_config.dart';
import 'package:loannow/config/urls.dart';
import 'package:loannow/net/dio_manager.dart';
import 'package:loannow/utils/application_status_utils.dart';
import 'package:loannow/utils/operation_utils.dart';
import 'package:loannow/utils/sp_utils.dart';
import 'package:loannow/widget/titleBar.dart';

import '../config/router_names.dart';

class OrderStatusPage extends StatefulWidget {
  late VoidCallback refreshClick;
  late VoidCallback finishClick;
  late ApplicationBean application;

  @override
  State<StatefulWidget> createState() {
    return OrderStatusPageState();
  }

  OrderStatusPage(
      {Key? key,
      required this.refreshClick,
      required this.finishClick,
      required this.application})
      : super(key: key);
}

class OrderStatusPageState extends State<OrderStatusPage> {
  bool showAccountInfo = false;
  bool showInstagram = false;
  bool showConfirm = false;
  bool showPassView = false;
  bool showModifyView = false;
  bool showModifyApprovedView = false;

  late String modifyID = "";
  late StateSetter modifyState;
  late StateSetter modifyApprovedState;

  String statusImage = "images/img_evaluating.png";
  TextEditingController insAccountController = TextEditingController();
  late BasisInfoBean basisInfo;

  late String account = "";
  late String paymentCode = "";
  late String helpUrl = "";

  late String titleStr = "";

  late String content;

  final MyInputFormatter _inputFormatter = MyInputFormatter();

  Widget orderView() {
    return Column(
      children: [
        TitleBar(
          leftImage: "images/ic_refresh.png",
          title: "No.${widget.application.applicationTime! ~/ 1000}",
          bgColor: AppColors.purpleColor7F,
          textColor: Colors.white,
          leftClick: () {
            widget.refreshClick();
            isModifyWithdrawal();
          },
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(15),
            children: [
              Container(
                margin: const EdgeInsets.only(top: 15),
                alignment: Alignment.center,
                child: Text(
                  titleStr ?? widget.application.statusDesc.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.mainColor,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 12),
                alignment: Alignment.center,
                child: Text(
                  content ??
                      "Please keep phone active to expect a verification call or approval SMS",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.textColorLight,
                    fontSize: 12,
                    height: 1.5,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15),
                child: Image.asset(statusImage, height: 194, width: 240),
              ),
              InkWell(
                onTap: () async {
                  Navigator.pushNamed(
                    context,
                    RouterNames.WEB,
                    arguments: {
                      'url':
                          "${WebPageUrl.baseUrl}/history/${widget.application.id}/process",
                      "showTitle": false
                    },
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 50, bottom: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Charge details",
                        style: TextStyle(color: AppColors.textColorLight),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 5),
                        child: Image.asset(width: 10, "images/ic_more.png"),
                      ),
                    ],
                  ),
                ),
              ),
              if (showInstagram)
                Container(
                  margin: const EdgeInsets.only(
                      top: 15, left: 20, right: 20, bottom: 30),
                  child: Column(
                    children: [
                      StatefulBuilder(
                        builder: (context, setState) {
                          modifyState = setState;
                          if (showModifyView) {
                            return InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  RouterNames.WEB,
                                  arguments: {
                                    'url':
                                        "${WebPageUrl.withdrawalUrl}/?logId=$modifyID",
                                    "showTitle": false
                                  },
                                );
                              },
                              child: Container(
                                height: 50,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.only(left: 30),
                                margin: const EdgeInsets.only(bottom: 15),
                                decoration: const BoxDecoration(
                                  color: Color(0xffFFFBF7),
                                  // color: Colors.red,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Click here for detailed instruction",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff666666),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Image.asset(
                                        width: 13,
                                        "images/ic_more.png",
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                      InkWell(
                        onTap: showInstagramDialog,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          decoration: const BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Row(
                            children: [
                              Image.asset(width: 15, "images/ic_camera.png"),
                              Expanded(
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: const Text(
                                    "Add instagram account",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              Image.asset(
                                  width: 12, "images/ic_more_white.png"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              if (showConfirm)
                Container(
                  margin: const EdgeInsets.only(
                      top: 15, left: 20, right: 20, bottom: 30),
                  // color: randomColor(),
                  child: InkWell(
                    onTap: () {
                      SpUtils.setOrderFinished()
                          .then((value) => widget.finishClick());
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      decoration: const BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: const Text(
                        "Confirm",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              if (showAccountInfo || showPassView)

                /// 待取款、通过
                Container(
                  margin: const EdgeInsets.only(top: 15, bottom: 30),
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 15,
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xffEFF4FF),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              showAccountInfo
                                  ? "Contract Number"
                                  : "Withdrawal method",
                              style: const TextStyle(
                                  color: AppColors.textColorLight,
                                  fontSize: 12),
                            ),
                          ),
                          Text(
                            paymentCode,
                            style: const TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                showAccountInfo
                                    ? "Withdrawal method"
                                    : "Withdrawal Account",
                                style: const TextStyle(
                                    color: AppColors.textColorLight,
                                    fontSize: 12),
                              ),
                            ),
                            Text(
                              account,
                              style: const TextStyle(
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                showAccountInfo
                                    ? "Click here for detailed instruction"
                                    : "Change withdrawal method",
                                style: const TextStyle(
                                    color: AppColors.textColorLight,
                                    fontSize: 12),
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Color(0xff666666),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RouterNames.WEB,
                            arguments: {'url': helpUrl, "showTitle": true},
                          );
                        },
                      ),
                    ],
                  ),
                ),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          bottom: tabbarHeight + Device.appBottomPadding(context),
        ),
        child: orderView(),
        // child: titleStr != "Under Review" ? repayWidget() : orderView(),
        // child: Container(color: randomColor()),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    initStatus();
    getBasisInfo();
  }

  /// 检查是否可以修改渠道
  void isModifyWithdrawal({int type = 0}) {
    /*
    TODO: 是否显示修改渠道入口,需要调用接口,加密处理
    */
    var path =
        "${Urls.PAYMENTCHANNELCHG}/${widget.application.loanBasisInfoId}";
    DioManager.getInstance().doRequest<Map>(
      path: path,
      method: DioMethod.GET,
      successCallBack: (result) {
        if (result != null) {
          modifyID = result["id"].toString();
          if (type == 0) {
            showModifyView = true;
            modifyState(() {});
          } else {
            showModifyApprovedView = true;
            modifyApprovedState(() {});
          }
        }
      },
    );
  }

  void initStatus() {
    var status = widget.application.status!;
    var page = '';
    if (ApplicationStatusUtils.isExamine(status)) {
      statusImage = "images/img_evaluating.png";
      showInstagram = true;
      page = titleStr = 'Under Review';

      content =
          "Please pay attention to incoming calls or SMS, \nyour loan will be reviewed shortly.";
      isModifyWithdrawal();
    } else if (ApplicationStatusUtils.isRollback(status) ||
        ApplicationStatusUtils.isRefuse(status)) {
      statusImage = "images/img_disapproved.png";
      showConfirm = true;
      page = titleStr = 'Rejected';
      content = "Sorry that we can’t issue you loan this time.";
      if (ApplicationStatusUtils.isRefuse(status)) page = 'refuse';
    } else if (ApplicationStatusUtils.isPass(status)) {
      statusImage = "images/img_approved.png";
      showPassView = true;
      showAccountInfo = false;
      page = titleStr = 'Approved';
      content =
          "Congrats! Your loan was approved already, \nplease repay in time.";

      if (widget.application.loanBasisInfo != null) {
        paymentCode = widget.application.loanBasisInfo!.bank ?? "";
        account = widget.application.loanBasisInfo!.accountNo ?? "";
      }
    } else if (ApplicationStatusUtils.isWithdrawal(status)) {
      statusImage = "images/img_withdraw.png";
      showAccountInfo = true;
      page = titleStr = 'Withdraw Cash Now';
      content =
          "Please refer to below instruction and \nwithdraw your cash now";

      if (widget.application.orderInfo != null) {
        paymentCode = widget.application.orderInfo!.paymentCode ?? "";
        if (widget.application.orderInfo!.paymentInfo != null) {
          helpUrl = widget.application.orderInfo!.paymentInfo!.helpUrl ?? "";
        }
      }

      if (widget.application.loanBasisInfo != null) {
        account = widget.application.loanBasisInfo!.bank ?? "";
      }
    } else if (ApplicationStatusUtils.isAbandon(status)) {
      statusImage = "images/img_giveup.png";
      showConfirm = true;
      page = titleStr = 'Given up withdrawal';
      content = widget.application.statusDesc!;
    } else if (ApplicationStatusUtils.isFinish(status) ||
        ApplicationStatusUtils.isClose(status)) {
      statusImage = "images/img_finish.png";
      showConfirm = true;
      page = titleStr = 'Fully Settled!';
      content =
          "Your loanable amount might be increased, \nwelcome to apply for a reloan.";
      if (ApplicationStatusUtils.isRefuse(status)) page = 'close';
    } else if (ApplicationStatusUtils.isRepay(status)) {
      page = titleStr = 'Repaid';
      content = "";
    }
    // titleState(() {});

    debugPrint("99999999999 $page");
    OperationUtils.saveOperation('/home/' + page);
  }

  Future<void> getBasisInfo() async {
    BasisInfoBean? bean = await SpUtils.getBasisInfo();
    if (bean != null) {
      basisInfo = bean;
      insAccountController.value =
          insAccountController.value.copyWith(text: basisInfo.insAccount);
    }
  }

  /// edit instagram
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
                    padding:
                        const EdgeInsets.only(top: 15, left: 15, right: 15),
                    child: Image.asset("images/ic_close.png", width: 15),
                  ),
                ),
              ),
              const Text(
                "Add instagram account",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: TextField(
                  controller: insAccountController,
                  // inputFormatters: [],
                  inputFormatters: [_inputFormatter],
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    hintText: "Please enter",
                    filled: true,
                    fillColor: Color(0xFFF5F5FA),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const Divider(
                color: AppColors.dividerColor,
              ),
              InkWell(
                onTap: saveInstagram,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  alignment: Alignment.center,
                  child: const Text(
                    "Confirm",
                    style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        );
      },
    );
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
      },
    );
  }
}

class MyInputFormatter extends FilteringTextInputFormatter {
  MyInputFormatter() : super.allow(RegExp(r'^[a-zA-Z0-9_.]+$'));

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // 过滤不允许的字符
    final filteredText =
        newValue.text.replaceAll(RegExp(r'[^a-zA-Z0-9_.]+'), '');

    // 如果新值与旧值不同，将其更新
    if (filteredText != newValue.text) {
      return TextEditingValue(
        text: filteredText,
        selection: TextSelection.collapsed(offset: filteredText.length),
      );
    }

    return newValue; // 保持原样
  }
}
