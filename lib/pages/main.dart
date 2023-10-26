import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:loannow/beans/upload_sign_bean.dart';
import 'package:loannow/config/app_colors.dart';
import 'package:loannow/config/app_config.dart';
import 'package:loannow/config/operation_codes.dart';
import 'package:loannow/config/router_names.dart';
import 'package:loannow/config/urls.dart';
import 'package:loannow/net/dio_manager.dart';
import 'package:loannow/pages/mine.dart';
import './new_home_page.dart';
import 'package:loannow/utils/fk_utils.dart';
import 'package:loannow/utils/operation_utils.dart';
import 'package:loannow/utils/sp_utils.dart';

import 'cs.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  int tabbarIndex = 0;
  var pageList = [
    const NewHomePage(),
    const OnlineCSPage(),
    MinePage(),
  ];
  late StateSetter tabbarState;
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
    SpUtils.isFirstOpen().then(
      (value) => {
        if (value)
          {
            OperationUtils.saveOperation(OperationCode.FIRST_OPEN),
            OperationUtils.sendFBNormalEvents(OperationCode.FIRST_OPEN),
            SpUtils.setFirstOpen(),
          }
      },
    );
    pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            // margin: const EdgeInsets.only(bottom: 49),
            color: Colors.transparent,
            child: PageView.builder(
              itemBuilder: (context, index) {
                return pageList[index];
              },
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: tabbarHeight,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(img(R.tabbarBG)), fit: BoxFit.fill),
                ),
                child: StatefulBuilder(
                  builder: (context, setState) {
                    tabbarState = setState;
                    return Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: 49,
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: InkWell(
                                  child: Container(
                                    height: 50,
                                    color: Colors.transparent,
                                    alignment: Alignment.center,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        // Icon(Icons.home, color: tabbarIndex == 0 ? Colors.amber : Colors.black),
                                        Image.asset(img(tabbarIndex == 0 ? R.tabbarCashS : R.tabbarCashN)),
                                        Text("Cash", style: TextStyle(color: tabbarIndex == 0 ? AppColors.mainColor : const Color(0xffCCCCCC))),
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    tabbarIndex = 0;
                                    pageController.jumpToPage(0);
                                    tabbarState(() {});
                                  },
                                ),
                              ),
                              Container(color: Colors.transparent, width: 75),
                              Expanded(
                                child: InkWell(
                                  child: Container(
                                    color: Colors.transparent,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        // Icon(Icons.settings, color: tabbarIndex == 2 ? Colors.amber : Colors.black),
                                        Image.asset(img(tabbarIndex == 2 ? R.tabbarMeS : R.tabbarMeN)),
                                        Text("Me", style: TextStyle(color: tabbarIndex == 2 ? AppColors.mainColor : const Color(0xffCCCCCC))),
                                      ],
                                    ),
                                  ),
                                  onTap: () async {
                                    String? token = await SpUtils.getToken();
                                    if (token == null) {
                                      // ignore: use_build_context_synchronously
                                      Navigator.pushNamed(context, RouterNames.LOGIN);
                                      return;
                                    }

                                    tabbarIndex = 2;
                                    pageController.jumpToPage(2);
                                    tabbarState(() {});
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          child: Container(
                            width: 70,
                            height: 70,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(bottom: 5),
                            child: Image.asset(img(R.tabbarCS)),
                          ),
                          onTap: () async {
                            String? token = await SpUtils.getToken();
                            if (token == null) {
                              // ignore: use_build_context_synchronously
                              Navigator.pushNamed(context, RouterNames.LOGIN);
                              return;
                            }

                            tabbarIndex = 1;
                            pageController.jumpToPage(1);
                            tabbarState(() {});
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
              Container(
                color: Colors.white,
                height: Device.appBottomPadding(context),
              )
            ],
          ),
        ],
      ),
      // PageView.builder(
      //   itemBuilder: (context, index) {
      //     return pageList[index];
      //   },
      //   controller: pageController,
      //   physics: const NeverScrollableScrollPhysics(),
      // ),
      // bottomNavigationBar: BottomNavigationBar(
      //   selectedItemColor: AppColors.mainColor,
      //   unselectedItemColor: AppColors.textColor,
      //   elevation: 3,
      //   selectedFontSize: 12,
      //   unselectedFontSize: 12,
      //   currentIndex: currentIndex,
      //   onTap: (tabIndex) async {
      // if (tabIndex == 1 || tabIndex == 2) {
      //   String? token = await SpUtils.getToken();
      //   if (token == null) {
      //     // ignore: use_build_context_synchronously
      //     Navigator.pushNamed(context, RouterNames.LOGIN);
      //     return;
      //   }
      // }
      //     pageController.jumpToPage(tabIndex);
      //     setState(() {
      //       currentIndex = tabIndex;
      //     });
      //   },
      //   items: [
      //     BottomNavigationBarItem(
      //       label: 'Home',
      //       icon: Image.asset("images/ic_home_n.png", width: 20),
      //       activeIcon: Image.asset("images/ic_home_c.png", width: 20),
      //     ),
      //     const BottomNavigationBarItem(
      //       label: '',
      //       icon: Stack(
      //         children: [],
      //       ),
      //       // activeIcon: Image.asset("images/ic_mine_c.png", width: 20),
      //     ),
      //     BottomNavigationBarItem(
      //       label: 'Me',
      //       icon: Image.asset("images/ic_mine_n.png", width: 20),
      //       activeIcon: Image.asset("images/ic_mine_c.png", width: 20),
      //     ),
      //   ],
      // ),

      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.white,
      //   onPressed: () {
      //     pageController.jumpToPage(1);
      //     setState(() {
      //       currentIndex = 1;
      //     });
      //   },
      //   child: Image.asset(img(R.tabbarCS)),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, //要实现中间的按钮凸起效果，这行起作用
    );
  }

  void getUploadSign() {
    DioManager.getInstance().doRequest<UploadSignBean>(
      path: Urls.BASIS_INFO_UPLOADSIGN,
      method: DioMethod.GET,
      showLoading: false,
      successCallBack: (result) => {
        if (result != null) checkBeforeFeature(result),
      },
    );
  }

  Future<void> checkBeforeFeature(UploadSignBean bean) async {
    var results = await Future.wait(
      [
        // FkUtils.uploadApp(bean),
        // FkUtils.uploadSms(bean),
        FkUtils.uploadContact(bean),
      ],
    );
    if (results[0] && results[1] && results[2]) {
      DioManager.getInstance().doRequest(
        showLoading: false,
        method: DioMethod.GET,
        successCallBack: (result) => {},
        path: Urls.APPLICATION_CHECK_BEFORE_FEATURE,
      );
    }
  }
}