import 'package:flutter/material.dart';
import 'package:loannow/beans/application_bean.dart';
import 'package:loannow/beans/basis_info_bean.dart';
import 'package:loannow/config/app_colors.dart';
import 'package:loannow/config/urls.dart';
import 'package:loannow/net/dio_manager.dart';
import 'package:loannow/pages/loan.dart';
import 'package:loannow/pages/order_status.dart';
import 'package:loannow/pages/repaying.dart';
import 'package:loannow/utils/application_status_utils.dart';
import 'package:loannow/utils/operation_utils.dart';
import 'package:loannow/utils/sp_utils.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  bool showLoading = true;
  ApplicationBean? applicationBean;
  late StateSetter pageState;

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
          StatefulBuilder(builder: (context, setState) {
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
                  refreshClick: getLatestApplication,
                  finishClick: finishiOrder,
                  application: applicationBean!,
                );
              } else {
                return LoanPage();
              }
            }
          })
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
        });
    return true;
  }

  @override
  bool get wantKeepAlive => true;
}
