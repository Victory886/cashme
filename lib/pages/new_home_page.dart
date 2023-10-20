/*
 * @Author: Terry
 * @Date: 2023-10-18 17:28:58
 * @LastEditors: Terry
 * @LastEditTime: 2023-10-19 17:19:34
 * @FilePath: /loannow/lib/pages/new_home_page.dart
 */

import 'package:flutter/material.dart';

import 'loan.dart';
import '../config/urls.dart';
import '../utils/sp_utils.dart';
import '../net/dio_manager.dart';
import '../config/app_colors.dart';
import '../beans/basis_info_bean.dart';
import '../utils/operation_utils.dart';
import '../beans/application_bean.dart';
import 'package:loannow/pages/repaying.dart';
import '../utils/application_status_utils.dart';
import 'package:loannow/pages/order_status.dart';

import 'new_loan_page.dart';

/// 新的首页
class NewHomePage extends StatefulWidget {
  const NewHomePage({super.key});

  @override
  State<NewHomePage> createState() => NewHomePageState();
}

class NewHomePageState extends State<NewHomePage> with AutomaticKeepAliveClientMixin {
  bool showLoading = true;
  late StateSetter pageState;
  ApplicationBean? applicationBean;

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
              pageState = setState;
              if (showLoading) {
                return const SizedBox.shrink();
              } else {
                if (applicationBean != null) {
                  if (ApplicationStatusUtils.isRepay(applicationBean!.status!)) {
                    return RepayingPage(
                      refreshClick: getLatestApplication,
                      application: applicationBean!,
                    );
                  }
                  return OrderStatusPage(
                    finishClick: finishiOrder,
                    application: applicationBean!,
                    refreshClick: getLatestApplication,
                  );
                } else {
                  // return LoanPage();
                  return NewLoanPage();
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

  Future<void> getData() async {
    String? token = await SpUtils.getToken();
    bool isOrderFinished = await SpUtils.isOrderFinished();
    if (token == null || isOrderFinished) {
      showLoading = false;
      applicationBean = null;
      pageState(() {});
      return;
    }
    Future.wait([getLatestApplication(isInit: true), getBasisInfo()]).then((results) => {showLoading = false, pageState(() {})});
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
        if (!isInit) {
          showLoading = false;
          pageState(() {});
        }
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
