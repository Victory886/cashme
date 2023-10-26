/*
 * @Author: Terry
 * @Date: 2023-10-25 15:29:35
 * @LastEditors: Terry
 * @LastEditTime: 2023-10-25 15:43:25
 * @FilePath: /loannow/lib/pages/cs.dart
 */
import 'dart:collection';
import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:loannow/pages/web.dart';

import '../config/urls.dart';
import '../utils/js_utils.dart';
import '../widget/titleBar.dart';

class OnlineCSPage extends StatefulWidget {
  const OnlineCSPage({super.key});

  @override
  State<OnlineCSPage> createState() => _OnlineCSPageState();
}

class _OnlineCSPageState extends State<OnlineCSPage> {
  String title = "Loading...";
  late StateSetter titleState;
  late InAppWebViewController webViewController;

  final userScripts = <UserScript>[
    UserScript(
      source: JSMgr.jsStr,
      injectionTime: UserScriptInjectionTime.AT_DOCUMENT_START,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          StatefulBuilder(
            builder: (context, setState) {
              titleState = setState;
              return TitleBar(title: title, isShowBackBtn: false);
            },
          ),
          Expanded(
            child: InAppWebView(
              initialUserScripts: UnmodifiableListView(userScripts),
              // initialUrlRequest: URLRequest(url: Uri.parse(arguments['url'])),
              onProgressChanged: (controller, progress) {
                if (progress > 80) {
                  BotToast.closeAllLoading();
                } else {
                  BotToast.showLoading();
                }
              },
              onTitleChanged: (controller, title) {
                this.title = title ?? "";
                titleState(() {});
              },
              onWebViewCreated: (controller) {
                webViewController = controller;
                Uri uri = Uri.parse(WebPageUrl.csUrl);
                webViewController.loadUrl(urlRequest: URLRequest(url: uri));

                webViewController.addJavaScriptHandler(
                  handlerName: "call",
                  callback: (args) async {
                    if (args.isEmpty) return {};

                    String msg = args.last;

                    if (msg.contains("ph_bridge") == false) return {};
                    msg = msg.replaceAll("ph_bridge", "");
                    List list = json.decode(msg);
                    for (var element in list) {
                      Map<String, dynamic> dict = element;
                      Map<String, dynamic> resMap = await H5ToFlutterMethodHandler.handleH5ToNativeMessage(controller, dict, "call", context);
                      return resMap;
                    }
                    // JSUtils.handleJSCall(webViewController, msg, context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
    ;
  }
}
