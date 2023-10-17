/*
 * @Author: Terry
 * @Date: 2023-10-12 15:05:06
 * @LastEditors: Terry
 * @LastEditTime: 2023-10-12 15:15:37
 * @FilePath: /loannow/lib/main.dart
 */
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loannow/config/router_names.dart';
import 'package:loannow/pages/about.dart';
import 'package:loannow/pages/camera.dart';
import 'package:loannow/pages/history.dart';
import 'package:loannow/pages/login.dart';
import 'package:loannow/pages/main.dart';
import 'package:loannow/pages/modify_phone.dart';
import 'package:loannow/pages/setting.dart';
import 'package:loannow/pages/start.dart';
import 'package:loannow/pages/web.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loan Now',
      builder: BotToastInit(),
      navigatorKey: navigatorKey,
      //1. call BotToastInit
      navigatorObservers: [BotToastNavigatorObserver()],
      //2. registered route observer
      theme:
          ThemeData(primarySwatch: Colors.blue, backgroundColor: Colors.white),
      routes: {
        RouterNames.START: (context) => StartPage(),
        RouterNames.HOME: (context) => MainPage(),
        RouterNames.LOGIN: (context) => LoginPage(),
        RouterNames.ABOUT_US: (context) => AboutUsPage(),
        RouterNames.SETTING: (context) => SettingPage(),
        RouterNames.HISTORY: (context) => HistoryPage(),
        RouterNames.MODIFY_PHONE: (context) => ModifyPhonePage(),
        RouterNames.WEB: (context) => WebPage(),
        RouterNames.CAMERA: (context) => CameraPage(),
      },
      initialRoute: RouterNames.START,
    );
  }
}
