/*
 * @Author: Terry
 * @Date: 2023-10-12 15:05:06
 * @LastEditors: Terry
 * @LastEditTime: 2023-10-26 15:18:35
 * @FilePath: /loannow/lib/main.dart
 */
import 'package:bot_toast/bot_toast.dart';
import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loannow/config/router_names.dart';
import 'package:loannow/pages/camera.dart';
import 'package:loannow/pages/history.dart';
import 'package:loannow/pages/login.dart';
import 'package:loannow/pages/main.dart';
import 'package:loannow/pages/modify_phone.dart';
import 'package:loannow/pages/setting.dart';
import 'package:loannow/pages/start.dart';
import 'package:loannow/pages/web.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark),
  );
  WidgetsFlutterBinding.ensureInitialized();

  initFBSDK();
  runApp(const MyApp());
}

Future<void> initFBSDK() async {
  // await Future.delayed(Duration(seconds: 3));

  final facebookAppEvents = FacebookAppEvents();
  await facebookAppEvents.setAutoLogAppEventsEnabled(true);
  await facebookAppEvents.setAdvertiserTracking(enabled: true);
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: BotToastInit(),
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      //1. call BotToastInit
      navigatorObservers: [BotToastNavigatorObserver()],
      //2. registered route observer
      theme: ThemeData(primarySwatch: Colors.blue, backgroundColor: Colors.white),
      routes: {
        RouterNames.START: (context) => const StartPage(),
        RouterNames.HOME: (context) => const MainPage(),
        RouterNames.LOGIN: (context) => LoginPage(),
        RouterNames.SETTING: (context) => SettingPage(),
        RouterNames.HISTORY: (context) => const HistoryPage(),
        RouterNames.MODIFY_PHONE: (context) => const ModifyPhonePage(),
        RouterNames.WEB: (context) => const WebPage(),
        RouterNames.CAMERA: (context) => CameraPage(),
      },
      initialRoute: RouterNames.START,
    );
  }
}
