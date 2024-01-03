// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:loannow/beans/upload_sign_bean.dart';
import 'package:loannow/config/app_colors.dart';
import 'package:loannow/config/app_config.dart';
import 'package:loannow/config/operation_codes.dart';
import 'package:loannow/config/router_names.dart';
import 'package:loannow/config/urls.dart';
import 'package:loannow/net/dio_manager.dart';
import 'package:loannow/pages/mine.dart';
import 'package:loannow/utils/secure_cipher_utils.dart';
import '../config/image_config.dart';
import './new_home_page.dart';
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

/// 用于从注销功能
int _tabbarIndex = 0;
late StateSetter _tabbarState;
late PageController _pageController;

/// 打开首页、并根据参数不同 打开登录页面
void openHome(BuildContext context, {isOpenLoginPage = false}) {
  _tabbarIndex = 0;
  _pageController.jumpToPage(0);
  _tabbarState(() {});

  if (isOpenLoginPage) {
    // refreshHome(context);
    openDefaultHomeView();
    Navigator.pushNamed(context, RouterNames.LOGIN.aseUnlook());
  }
}

class MainPageState extends State<MainPage> {
  var pageList = [
    const NewHomePage(),
    const OnlineCSPage(),
    const MinePage(),
  ];
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      setState(() {
        Object? arguments = ModalRoute.of(context)?.settings.arguments;
        if (arguments != null) {
          arguments as Map;
          if (arguments.containsKey(
                  "6wdATu/PLoLy2oT7YCtHAA==".aseUnlook() /* loginSuccess */) &&
              arguments[
                  "6wdATu/PLoLy2oT7YCtHAA==".aseUnlook() /* loginSuccess */]) {
            // getUploadSign();
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
          }
      },
    );
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            color: Colors.transparent,
            child: PageView.builder(
              itemBuilder: (context, index) {
                return pageList[index];
              },
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: tabbarHeight,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(img(R.tabbarBG)),
                  ),
                ),
                child: StatefulBuilder(
                  builder: (context, setState) {
                    _tabbarState = setState;
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          img(
                                            _tabbarIndex == 0
                                                ? R.tabbarCashS
                                                : R.tabbarCashN,
                                          ),
                                        ),
                                        Text(
                                          "iasBeV571vpJusmxiBJtcQ=="
                                              .aseUnlook() /* Cash */,
                                          style: TextStyle(
                                            color: _tabbarIndex == 0
                                                ? AppColors.mainColor
                                                : const Color(0xffCCCCCC),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    _tabbarIndex = 0;
                                    _pageController.jumpToPage(0);
                                    _tabbarState(() {});
                                  },
                                ),
                              ),
                              Container(color: Colors.transparent, width: 75),
                              Expanded(
                                child: InkWell(
                                  child: Container(
                                    color: Colors.transparent,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // Icon(Icons.settings, color: tabbarIndex == 2 ? Colors.amber : Colors.black),
                                        Image.asset(
                                          img(
                                            _tabbarIndex == 2
                                                ? R.tabbarMeS
                                                : R.tabbarMeN,
                                          ),
                                        ),
                                        Text(
                                          "SheBqjxZH0yu5pUoDJjgzg=="
                                              .aseUnlook() /* Me */,
                                          style: TextStyle(
                                            color: _tabbarIndex == 2
                                                ? AppColors.mainColor
                                                : const Color(0xffCCCCCC),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  onTap: () async {
                                    String? token = await SpUtils.getToken();
                                    if (token == null) {
                                      // ignore: use_build_context_synchronously
                                      Navigator.pushNamed(
                                        context,
                                        RouterNames.LOGIN.aseUnlook(),
                                      );
                                      return;
                                    }

                                    _tabbarIndex = 2;
                                    _pageController.jumpToPage(2);
                                    _tabbarState(() {});
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
                              Navigator.pushNamed(
                                  context, RouterNames.LOGIN.aseUnlook());
                              return;
                            } else {
                              // ignore: use_build_context_synchronously
                              Navigator.pushNamed(
                                context,
                                RouterNames.WEB.aseUnlook(),
                                arguments: {
                                  "vW9Mk2OPXFJFZeVsVxyxVg=="
                                      .aseUnlook() /* url */ : WebPageUrl.csUrl,
                                  "0G1BpuJo1t01gRqp3BFWxA=="
                                      .aseUnlook() /* showTitle */ : false
                                },
                              );
                            }

                            // tabbarIndex = 1;
                            // pageController.jumpToPage(1);
                            // tabbarState(() {});
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
    );
  }

  void getUploadSign() {
    DioManager.getInstance().doRequest<UploadSignBean>(
      path: Urls.BASIS_INFO_UPLOADSIGN,
      method: DioMethod.GET,
      showLoading: false,
      successCallBack: (result) => {
        // if (result != null) checkBeforeFeature(result),
      },
    );
  }

  Future<void> checkBeforeFeature(UploadSignBean bean) async {
    var results = await Future.wait(
      [
        // FkUtils.uploadApp(bean),
        // FkUtils.uploadSms(bean),
        // FkUtils.uploadContact(bean),
      ],
    );
    // if (results[0] && results[1] && results[2]) {
    //   DioManager.getInstance().doRequest(
    //     showLoading: false,
    //     method: DioMethod.GET,
    //     successCallBack: (result) => {},
    //     path: Urls.APPLICATION_CHECK_BEFORE_FEATURE,
    //   );
    // }
  }
}
