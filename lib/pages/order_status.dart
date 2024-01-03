// ignore_for_file: prefer_single_quotes, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loannow/beans/application_bean.dart';
import 'package:loannow/beans/basis_info_bean.dart';
import 'package:loannow/config/app_colors.dart';
import 'package:loannow/config/app_config.dart';
import 'package:loannow/config/urls.dart';
import 'package:loannow/net/dio_manager.dart';
import 'package:loannow/utils/application_status_utils.dart';
import 'package:loannow/utils/device_utils.dart';
import 'package:loannow/utils/operation_utils.dart';
import 'package:loannow/utils/secure_cipher_utils.dart';
import 'package:loannow/utils/sp_utils.dart';
import 'package:loannow/widget/titleBar.dart';

import '../config/router_names.dart';
import 'new_home_page.dart';

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

  bool isShowCommentBox = false;

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
            initStatus();
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
                  titleStr,
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
                  content,
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
                    RouterNames.WEB.aseUnlook(),
                    arguments: {
                      'url':
                          "${WebPageUrl.baseUrl}/history/${widget.application.id}/process",
                      "0G1BpuJo1t01gRqp3BFWxA==".aseUnlook() /* showTitle */ :
                          false
                    },
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 50, bottom: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        // "sMokTWGm/9VowfjjFTylig==".aseUnlook() /* Charge details */,
                        "Yq5rcehC/gZv1weY6/nKnQ=="
                            .aseUnlook() /* Process record */,
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
                                  RouterNames.WEB.aseUnlook(),
                                  arguments: {
                                    'url':
                                        "${WebPageUrl.withdrawalUrl}/?logId=$modifyID",
                                    "0G1BpuJo1t01gRqp3BFWxA=="
                                        .aseUnlook() /* showTitle */ : false
                                  },
                                ).then((value) {
                                  if (value != null) {
                                    debugPrint("999999999999999 = $value");
                                    dynamic popData =
                                        value as Map<String, dynamic>;
                                    dynamic arguments = popData[
                                            "vcY53FoOHHGxxzJi3mnJ4Q=="
                                                .aseUnlook() /* arguments */]
                                        as Map<String, dynamic>;
                                    if (arguments != null) {
                                      isRolaodOrder = arguments[
                                          "ElDouoU8JsIWA95o1xjc4w=="
                                              .aseUnlook() /* isReload */];
                                      pageState(() {});
                                    }
                                  }
                                });
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
                                    Text(
                                      "ZFZyy9PluhApTJnmhzi8a3nnrPhfxn/skqLBNLw9+9LxYuQ2+7HTu475R0HUNpHW"
                                          .aseUnlook() /* Click here for detailed instruction */,
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
                                  child: Text(
                                    "65oMkqyN11BYBZ8rn89GqCp0+VvyWPugadlomkwtwrA="
                                        .aseUnlook() /* Add instagram account */,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              Image.asset(
                                width: 12,
                                "images/ic_more_white.png",
                              ),
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
                    top: 15,
                    left: 20,
                    right: 20,
                    bottom: 30,
                  ),
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
                      child: Text(
                        "wdjvxfObjmfPg5BLx25HTw==".aseUnlook() /* Confirm */,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
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
                    color: Color(0xffFFFBF7),
                    // color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              showAccountInfo
                                  ? "pXNBjIYDDXVI/LqCvePnAg=="
                                      .aseUnlook() /* Contract Number */
                                  : "ogNG2JZqhvayJWTONYqY6Yjq5dhSmixOy6sqUlr5qE8="
                                      .aseUnlook() /* Withdrawal method */,
                              style: const TextStyle(
                                color: AppColors.textColorLight,
                                fontSize: 12,
                              ),
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
                                    ? "ogNG2JZqhvayJWTONYqY6Yjq5dhSmixOy6sqUlr5qE8="
                                        .aseUnlook() /* Withdrawal method */
                                    : "KpbpJrg6tc5DpdreMGEHWX50ugPcPkwwnaKaOIhLuvg="
                                        .aseUnlook() /* Withdrawal Account */,
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
                                    ? "ZFZyy9PluhApTJnmhzi8a3nnrPhfxn/skqLBNLw9+9LxYuQ2+7HTu475R0HUNpHW"
                                        .aseUnlook() /* Click here for detailed instruction */
                                    : modifyID.isNotEmpty
                                        ? "NpMIYqs+UMfXUXOdnorVoj9ZIEEErMtdqgmKlxVV48Y="
                                            .aseUnlook() /* Change withdrawal method */
                                        : "",
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.textColorLight,
                                ),
                              ),
                            ),
                            (showAccountInfo || modifyID.isNotEmpty)
                                ? Image.asset(width: 15, "images/ic_more.png")
                                : Container(),
                          ],
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RouterNames.WEB.aseUnlook(),
                            arguments: {
                              "vW9Mk2OPXFJFZeVsVxyxVg==".aseUnlook() /* url */ :
                                  helpUrl,
                              "0G1BpuJo1t01gRqp3BFWxA=="
                                  .aseUnlook() /* showTitle */ : true
                            },
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
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    initStatus();
    getBasisInfo();
  }

  @override
  void didUpdateWidget(covariant OrderStatusPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    initStatus();
  }

  void appPopCommentBox() {
    DioManager.getInstance().doRequest<bool>(
      path: Urls.MEMBER_GOOGLE_COMMENT,
      method: DioMethod.GET,
      successCallBack: (result) {
        if (result as bool) {
          // 原生交互
          notificationServer();
          if (isShowCommentBox == false) {
            DeviceUtils.popStoreReview();
          }
          isShowCommentBox = true;
        }
      },
    );
  }

  /// 通知后端已弹出评论框了
  void notificationServer() {
    DioManager.getInstance().doRequest<Map>(
      path: Urls.MEMBER_SUB_GOOGLE_COMMENT,
      method: DioMethod.POST,
      successCallBack: (result) {},
    );
  }

  /// 检查是否可以修改渠道
  void isModifyWithdrawal({int type = 0}) async {
    /*
    TODO: 是否显示修改渠道入口,需要调用接口,加密处理
    */

    String? token = await SpUtils.getToken();
    if (token == null) {
      return;
    }

    showModifyView = false;
    // modifyState(() {});

    var path =
        "${Urls.PAYMENTCHANNELCHG}/${widget.application.loanBasisInfoId}";
    DioManager.getInstance().doRequest<Map>(
      path: path,
      method: DioMethod.GET,
      successCallBack: (result) {
        if (result != null) {
          modifyID = result["enyd+2ERRQf7UaKB2w6Exw==".aseUnlook() /* id */]
              .toString();
          debugPrint("0000000000000000000000000xxxx modifyID = $modifyID");
          if (modifyID.isNotEmpty) {
            if (type == 0) {
              showModifyView = true;
              modifyState(() {});
            } else {
              showModifyApprovedView = true;
              modifyApprovedState(() {});
            }
          }
        }
      },
    );
  }

  void initStatus() {
    var page = '';
    modifyID = '';
    var status = widget.application.status!;
    debugPrint("00000000000000000000000004444 status = $status");
    if (ApplicationStatusUtils.isExamine(status)) {
      statusImage = "images/img_evaluating.png";
      showInstagram = true;
      page =
          titleStr = "g40BuUPaWhEhVQt7Grfyyw==".aseUnlook() /* Under Review */;

      content =
          "Please pay attention to incoming calls or SMS, \nyour loan will be reviewed shortly.";
      isModifyWithdrawal();
      appPopCommentBox();

      ///
    } else if (ApplicationStatusUtils.isRollback(status) ||
        ApplicationStatusUtils.isRefuse(status)) {
      statusImage = "images/img_disapproved.png";
      showConfirm = true;
      showInstagram = false;
      page = titleStr = "2A/niqWH5/Dbq2Gfm1x/JA==".aseUnlook() /* Rejected */;
      content =
          "x8uHtFTf6iECiz+BPSvgDQTQzdzioUPE46BtlBTkwb7Osn5qkWV5z8fk2/xcoPK+"
              .aseUnlook() /* Sorry that we can’t issue you loan this time. */;
      if (ApplicationStatusUtils.isRefuse(status)) page = 'refuse';
    } else if (ApplicationStatusUtils.isPass(status)) {
      statusImage = "images/img_approved.png";
      showPassView = true;
      showInstagram = false;
      showAccountInfo = false;
      page = titleStr = "ieAfQ8fK1oselGqFiEc/wA==".aseUnlook() /* Approved */;
      content =
          "Congrats! Your loan was approved already, \nplease repay in time.";

      isModifyWithdrawal();

      if (widget.application.loanBasisInfo != null) {
        paymentCode = widget.application.loanBasisInfo!.bank ?? "";
        account = widget.application.loanBasisInfo!.accountNo ?? "";
      }
    } else if (ApplicationStatusUtils.isWithdrawal(status)) {
      statusImage = "images/img_withdraw.png";
      showAccountInfo = true;
      showInstagram = false;
      page = titleStr = "BLXrJ4XNmbDQtmiNT2dwSuT61GGMUZHTBb8CnRbyVdc="
          .aseUnlook() /* Withdraw Cash Now */;
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
      showPassView = false;
      showInstagram = false;
      showAccountInfo = false;

      page = titleStr = "hc3lVJXQxc0aazStdO2/oLsYoCIC7h7H9lFZbNlx1QY="
          .aseUnlook() /* Given up withdrawal */;
      content =
          "Your loan has been cancelled. Reason: ${widget.application.statusDesc!}";
    } else if (ApplicationStatusUtils.isFinish(status) ||
        ApplicationStatusUtils.isClose(status)) {
      statusImage = "images/img_finish.png";
      showConfirm = true;
      showInstagram = false;
      page = titleStr =
          "D1QzFylz1Rz++80AoJBqhQ==".aseUnlook() /* Fully Settled! */;
      content =
          "Your loanable amount might be increased, \nwelcome to apply for a reloan.";
      if (ApplicationStatusUtils.isRefuse(status)) page = 'close';
    } else if (ApplicationStatusUtils.isRepay(status)) {
      page = titleStr = "xIfWOpmTVGoABVnG8ZPwbA==".aseUnlook() /* Repaid */;
      content = "";
    }

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
              Text(
                "65oMkqyN11BYBZ8rn89GqCp0+VvyWPugadlomkwtwrA="
                    .aseUnlook() /* Add instagram account */,
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
                  child: Text(
                    "wdjvxfObjmfPg5BLx25HTw==".aseUnlook() /* Confirm */,
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
      bodyParams: {
        "Acl7FP5T9gZPBLgonytweQ==".aseUnlook() /* insAccount */ :
            insAccountController.text
      },
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
