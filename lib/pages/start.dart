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

/// 开始
class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return StartPageState();
  }
}

class StartPageState extends State<StartPage> {
  late Timer timer;
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FractionallySizedBox(
            widthFactor: 1,
            heightFactor: 1,
            child: Image.network(
              "https://img2.baidu.com/it/u=3771882326,1496998912&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=888",
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            right: 0,
            child: InkWell(
              onTap: goHome,
              child: SafeArea(
                child: Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0x55000000),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Text(
                    count.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    OperationUtils.saveOperation(OperationCode.APP_START);
    OperationUtils.sendFBNormalEvents(OperationCode.APP_START);

    Future.wait([ipCheck(), getConfig()]).then(
      (results) => {
        timer = Timer.periodic(
          const Duration(seconds: 1),
          (timer) {
            count--;
            if (count == -1) {
              goHome();
            } else {
              setState(() {});
            }
          },
        ),
      },
    );
  }

  /// 检测ip地址
  Future<bool> ipCheck() async {
    await DioManager.getInstance().doRequest<IpCheckBean>(
        path: Urls.CHECK_AREA,
        method: DioMethod.GET,
        successCallBack: (result) {
          Constans.ipCheckBean = result;
        });
    return true;
  }

  /// 获取配置信息
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

/// 当做启动页
class LaunchViewWidget extends StatelessWidget {
  const LaunchViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("启动页面"),
    );
  }
}
