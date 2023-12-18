/*
 * @Author: Terry
 * @Date: 2023-10-12 15:05:06
 * @LastEditors: Terry
 * @LastEditTime: 2023-12-12 15:37:22
 * @FilePath: /loannow/lib/main.dart
 */
import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:loannow/config/app_config.dart';
import 'package:loannow/config/router_names.dart';
import 'package:loannow/pages/modify_phone.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:loannow/pages/camera.dart';
import 'package:loannow/pages/history.dart';
import 'package:loannow/pages/login.dart';
import 'package:loannow/pages/main.dart';
import 'package:loannow/pages/setting.dart';
import 'package:loannow/pages/start.dart';
import 'package:loannow/pages/web.dart';
import 'package:loannow/utils/secure_cipher_utils.dart';

import 'utils/device_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  initFBSDK();
  deviceID = await getDeviceID();
  runApp(const MyApp());
}

Future<String> getDeviceID() async {
  String? deviceId = await DeviceUtils.getDeviceId();
  return deviceId;
}

Future<void> initFBSDK() async {
  // await Future.delayed(Duration(seconds: 3));
  final facebookAppEvents = FacebookAppEvents();
  await facebookAppEvents.setAutoLogAppEventsEnabled(true);
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
      theme:
          ThemeData(primarySwatch: Colors.blue, backgroundColor: Colors.white),
      routes: {
        RouterNames.START.aseUnlook(): (context) => const StartPage(),
        RouterNames.HOME.aseUnlook(): (context) => const MainPage(),
        RouterNames.LOGIN.aseUnlook(): (context) => const LoginPage(),
        RouterNames.SETTING.aseUnlook(): (context) => const SettingPage(),
        RouterNames.HISTORY.aseUnlook(): (context) => const HistoryPage(),
        RouterNames.MODIFY_PHONE.aseUnlook(): (context) =>
            const ModifyPhonePage(),
        RouterNames.WEB.aseUnlook(): (context) => const WebPage(),
        RouterNames.CAMERA.aseUnlook(): (context) => CameraPage(),
      },
      initialRoute: RouterNames.START.aseUnlook(),
    );
  }
}
