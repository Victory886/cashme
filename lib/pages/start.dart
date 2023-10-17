import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loannow/beans/ip_check_bean.dart';
import 'package:loannow/beans/system_config_bean.dart';
import 'package:loannow/config/constants.dart';
import 'package:loannow/config/operation_codes.dart';
import 'package:loannow/config/router_names.dart';
import 'package:loannow/config/urls.dart';
import 'package:loannow/net/dio_manager.dart';
import 'package:loannow/utils/operation_utils.dart';

class StartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StartPageState();
  }
}

class StartPageState extends State<StartPage> {
  late Timer timer;
  int count = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      FractionallySizedBox(
          widthFactor: 1,
          heightFactor: 1,
          child: Image.network(
            "https://img2.baidu.com/it/u=3771882326,1496998912&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=888",
            fit: BoxFit.fill,
          )),
      Positioned(
          right: 0,
          child: InkWell(
            child: SafeArea(
              child: Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(color: Color(0x55000000), borderRadius: BorderRadius.circular(40)),
                  child: Text(count.toString(), style: TextStyle(color: Colors.white))),
            ),
            onTap: goHome,
          ))
    ]));
  }

  @override
  void initState() {
    super.initState();
    OperationUtils.saveOperation(OperationCode.APP_START);
    Future.wait([ipCheck(), getConfig()]).then((results) => {
          timer = Timer.periodic(Duration(seconds: 1), (timer) {
            count--;
            if (count == -1) {
              goHome();
            } else {
              setState(() {});
            }
          })
        });
  }

  Future<bool> ipCheck() async {
    await DioManager.getInstance().doRequest<IpCheckBean>(
        path: Urls.CHECK_AREA,
        method: DioMethod.GET,
        successCallBack: (result) {
          Constans.ipCheckBean = result;
        });
    return true;
  }

  Future<bool> getConfig() async {
    await DioManager.getInstance().doRequest<SystemConfigBean>(
        path: Urls.SYSTEM_CONFIG,
        method: DioMethod.GET,
        successCallBack: (result) {
          Constans.systemConfigBean = result;
        });
    return true;
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  void goHome() {
    timer.cancel();
    Navigator.pushReplacementNamed(context, RouterNames.HOME);
  }
}
