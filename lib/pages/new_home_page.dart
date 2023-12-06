/*
 * @Author: Terry
 * @Date: 2023-10-18 17:28:58
 * @LastEditors: Terry
 * @LastEditTime: 2023-12-05 11:15:37
 * @FilePath: /loannow/lib/pages/new_home_page.dart
 */

import 'package:flutter/material.dart';
import 'package:loannow/beans/coupon_alert_bean.dart';
import 'package:loannow/pages/web.dart';
import 'package:loannow/utils/phone_utils.dart';
import 'package:loannow/config/app_config.dart';

import '../config/urls.dart';
import '../utils/sp_utils.dart';
import '../net/dio_manager.dart';
import '../config/app_colors.dart';
import '../beans/basis_info_bean.dart';
import '../utils/operation_utils.dart';
import '../beans/application_bean.dart';

import '../utils/application_status_utils.dart';
import 'order_status.dart';

import 'coupon_alert_view.dart';
import 'new_loan_page.dart';

/// 是否重新刷新订单状态
bool isRolaodOrder = false;

/// 通过NewLoanPage页面的交互结果刷新这个状态
late StateSetter pageState;

/// 新的首页
class NewHomePage extends StatefulWidget {
  const NewHomePage({super.key});

  @override
  State<NewHomePage> createState() => NewHomePageState();
}

class NewHomePageState extends State<NewHomePage>
    with AutomaticKeepAliveClientMixin {
  bool showLoading = true;

  ApplicationBean? applicationBean;

// String? token = await SpUtils.getToken();

  void showCouponAlert() async {
    String? token = await SpUtils.getToken();
    if (token != null) {
      alertCoupon();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: Stack(
        children: [
          const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          ),
          StatefulBuilder(
            builder: (context, setState) {
              fLog("000000000000 = StatefulBuilder");
              pageState = setState;
              if (showLoading) {
                return const SizedBox.shrink();
              } else {
                if (applicationBean != null) {
                  if (ApplicationStatusUtils.isRepay(
                      applicationBean!.status!)) {
                    // return RepayingPage(
                    //   refreshClick: getLatestApplication,
                    //   application: applicationBean!,
                    // );

                    OperationUtils.saveOperation('/home/repay');
                    return Container(
                      margin: const EdgeInsets.only(bottom: tabbarHeight),
                      child: WebPage(urlStr: WebPageUrl.repayUrl),
                    );
                  }
                  return OrderStatusPage(
                    finishClick: finishiOrder,
                    application: applicationBean!,
                    refreshClick: getLatestApplication,
                  );
                } else {
                  fLog("000000000 = ........");

                  if (isRolaodOrder) {
                    getLatestApplication(isInit: false);
                    return const SizedBox.shrink();
                  }

                  showCouponAlert();

                  return const NewLoanPage();
                }
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getData();
    OperationUtils.saveOperation('/home');
  }

  /// TODO: 1、(取消、回退、拒绝到期)；或者 2、订单接口没有数据的时候
  /// 优惠卷弹框
  void alertCoupon() async {
    DioManager.getInstance().doRequest<CouponAlertBean>(
      path: Urls.COUPON_PROMPT,
      method: DioMethod.GET,
      successCallBack: (result) async {
        if (result != null) {
          String? cid = await SpUtils.getCouponAlert();

          if (result.id.toString() != cid) {
            // ignore: use_build_context_synchronously
            showDialogFunction(result);
          }
        }
      },
    );
  }

  void showDialogFunction(CouponAlertBean model) {
    SpUtils.saveCouponAlert(model.id.toString());
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CouponAlertViewWidget(model: model);
      },
    );
  }

  Future<void> getData() async {
    String? token = await SpUtils.getToken();
    bool isOrderFinished = await SpUtils.isOrderFinished();
    if (token == null || isOrderFinished) {
      showLoading = false;
      pageState(() {});
      return;
    }
    Future.wait([getLatestApplication(), getBasisInfo()]).then(
      (results) => {
        showLoading = false,
        pageState(() {}),
      },
    );
  }

  Future<void> finishiOrder() async {
    showLoading = false;
    applicationBean = null;
    pageState(() {});
  }

  Future<bool> getLatestApplication({bool isInit = false}) async {
    await DioManager.getInstance().doRequest<ApplicationBean>(
      path: Urls.APPLICATION_LATEST,
      method: DioMethod.GET,
      showLoading: !showLoading,
      successCallBack: (result) {
        applicationBean = result;
        isRolaodOrder = false;
        if (!isInit) {
          showLoading = false;
        }
        pageState(() {});

        fLog("000000000000000000000000002222 home$result");
      },
    );
    return true;
  }

  Future<bool> getBasisInfo() async {
    await DioManager.getInstance().doRequest<BasisInfoBean>(
      path: Urls.BASIS_INFO_LOAD,
      method: DioMethod.GET,
      showLoading: !showLoading,
      successCallBack: (result) {
        if (result != null) SpUtils.saveBasisInfo(result);
      },
    );
    return true;
  }

  @override
  bool get wantKeepAlive => true;
}
