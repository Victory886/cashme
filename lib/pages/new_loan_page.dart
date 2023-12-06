// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

/*
 * @Author: Terry
 * @Date: 2023-10-19 09:48:06
 * @LastEditors: Terry
 * @LastEditTime: 2023-12-04 11:44:07
 * @FilePath: /loannow/lib/pages/new_loan_page.dart
 */

import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:loannow/config/app_colors.dart';
import 'package:loannow/config/app_config.dart';
import 'package:loannow/pages/new_home_page.dart';
import 'package:marquee/marquee.dart';

// import 'package:marquee/marquee.dart';

import '../config/image_config.dart';
import '../config/operation_codes.dart';
import '../config/router_names.dart';
import '../config/urls.dart';
import '../net/dio_manager.dart';
import '../utils/operation_utils.dart';
import '../utils/sp_utils.dart';

/// 首页、页面
class NewLoanPage extends StatefulWidget {
  const NewLoanPage({super.key});

  @override
  State<NewLoanPage> createState() => _NewLoanPageState();
}

class _NewLoanPageState extends State<NewLoanPage> {
  /// 状态标记
  late StateSetter marqueeListState;
  List marqueeList = [];
  String marqueeStr = "";

  @override
  void initState() {
    super.initState();

    getMarqueesData();
  }

  void getMarqueesData() {
    DioManager.getInstance().doRequest<List>(
      path: Urls.MARQUEES,
      method: DioMethod.GET,
      successCallBack: (result) {
        marqueeList.addAll(result ?? []);
        for (var item in marqueeList) {
          marqueeStr = "${marqueeStr + item["text"]}  ";
        }
        marqueeListState(() {});
      },
    );
  }

  void loanBtnClick() async {
    // print(contact);
    return SpUtils.getToken().then(
      (value) => {
        if (value == null)
          Navigator.pushNamed(context, RouterNames.LOGIN)
        else
          Navigator.pushNamed(
            context,
            RouterNames.WEB,
            arguments: {'url': WebPageUrl.middleUrl, 'showTitle': false},
          ).then((value) {
            if (value != null) {
              debugPrint("999999999999999 = $value");
              dynamic popData = value as Map<String, dynamic>;
              dynamic arguments = popData["arguments"] as Map<String, dynamic>;
              if (arguments != null) {
                isRolaodOrder = arguments["isReload"];
                pageState(() {});
              }
            }
          }),
        OperationUtils.saveOperation(OperationCode.APPLY_NOW)
      },
    );
  }

  /// 下面的View
  Widget _bottomView() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          LoanPageBottomWidgets(),
          LoanPageApplyLoanWidget(onClick: loanBtnClick),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // BotToast.showLoading();
    // BotToast.showText(text: "正在加载中...");
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(img(R.homeBg)),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          margin: EdgeInsets.only(
            bottom: tabbarHeight + Device.appBottomPadding(context),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Device.appTopPadding(context)),
                      Image.asset(img(R.homeLogo)),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "Hello!",
                            style: TextStyle(
                              color: Color(0xff232732),
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(width: 15),
                          Text(
                            "Cashme Pera PH",
                            style: TextStyle(
                              color: Color(0xff232732),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(height: 10),
                      SizedBox(
                        height: 30,
                        child: StatefulBuilder(
                          builder: (context, setState) {
                            marqueeListState = setState;
                            if (marqueeList.isEmpty) {
                              return Container();
                            } else {
                              return Marquee(
                                text: marqueeStr,
                                velocity: 10.0,
                                blankSpace: 20.0,
                                startPadding: 15.0,
                                scrollAxis: Axis.horizontal,
                                accelerationCurve: Curves.linear,
                                decelerationCurve: Curves.easeOut,
                                // pauseAfterRound: Duration(seconds: 1),
                                // accelerationDuration: Duration(seconds: 1),
                                decelerationDuration:
                                    Duration(milliseconds: 500),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      child: Image.asset(
                        img(R.homeProgress),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              bottom: Device.appBottomPadding(context) == 0
                                  ? 3
                                  : 5),
                          child: Text(
                            "₱",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.mainColor,
                              fontSize: Device.appBottomPadding(context) == 0
                                  ? 16
                                  : 22,
                            ),
                          ),
                        ),
                        Text(
                          "20,000",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainColor,
                            fontSize:
                                Device.appBottomPadding(context) == 0 ? 28 : 34,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              _bottomView()
            ],
          ),
        ),
      ),
    );
  }
}

/// loan按钮
class LoanPageApplyLoanWidget extends StatelessWidget {
  const LoanPageApplyLoanWidget({super.key, this.onClick});

  /// loan按钮被点击的时候
  final Function? onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        DioManager.getInstance().doRequest<bool>(
          path: Urls.APPLICATION_CANAPPLY,
          method: DioMethod.GET,
          showLoading: true,
          successCallBack: (result) {
            if (result == true) {
              if (onClick != null) onClick!();
            }
          },
        );
      },
      child: Container(
        height: 54,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Text(
              "Apply Loan",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: EdgeInsets.only(right: 20),
                child:
                    Image.asset(img(R.homeApplyArrow), width: 20, height: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoanPageBottomWidgets extends StatelessWidget {
  const LoanPageBottomWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 54,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RateItemWidget(title: "Loan Term", contact: "120  - 360 Days"),
              SizedBox(width: 20),
              RateItemWidget(title: "APR", contact: "36%"),
            ],
          ),
        ),
        Image.asset(img(R.homeLoan), fit: BoxFit.cover),
      ],
    );
  }
}

class RateItemWidget extends StatelessWidget {
  const RateItemWidget({
    super.key,
    required this.title,
    required this.contact,
  });

  final String title;
  final String contact;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
        decoration: BoxDecoration(
            color: Color(0xff000000).withAlpha(30),
            borderRadius: BorderRadius.all(Radius.circular(27))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: TextStyle(color: Colors.white70, fontSize: 12)),
            Text(
              contact,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MarqueeView extends StatefulWidget {
  final Duration pauseDuration, forwardDuration;
  final double scrollSpeed; //滚动速度(时间单位是秒)。
  final Widget child; //子视图。

  /// 注: 构造函数入参的默认值必须是常量。
  const MarqueeView({
    Key? key,
    this.scrollSpeed = 40.0,
    this.pauseDuration = const Duration(milliseconds: 100),
    this.forwardDuration = const Duration(milliseconds: 3000),
    required this.child,
  }) : super(key: key);

  @override
  _MarqueeViewState createState() => _MarqueeViewState();
}

class _MarqueeViewState extends State<MarqueeView>
    with SingleTickerProviderStateMixin {
  bool _validFlag = true;
  double _boxWidth = 0;
  final ScrollController _controller = ScrollController();

  @override
  void dispose() {
    debugPrint('Track_MarqueeView_dispose');
    _validFlag = false;
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    scroll();
  }

  @override
  Widget build(BuildContext context) {
    /// 使用LayoutBuilder获取组件的大小。
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        _boxWidth = constraints.maxWidth;
        return SingleChildScrollView(
          // 禁止手动滑动。
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller,
          scrollDirection: Axis.horizontal,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: _boxWidth),
            child: widget.child,
          ),
        );
      },
    );
  }

  void scroll() async {
    while (_validFlag) {
      debugPrint('Track_MarqueeView_scroll');
      await Future.delayed(widget.pauseDuration);
      if (_boxWidth <= 0) {
        continue;
      }
      _controller.jumpTo(0);
      // 两个方向: Curves.easeIn 和 Curves.easeOut 。
      await _controller.animateTo(
        _controller.position.maxScrollExtent,
        duration: Duration(
            seconds: (_controller.position.maxScrollExtent / widget.scrollSpeed)
                .floor()),
        curve: Curves.easeIn,
      );
    }
  }
}
