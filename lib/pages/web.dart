import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:loannow/utils/js_utils.dart';
import 'package:loannow/widget/titleBar.dart';

class WebPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WebPageState();
  }
}

class WebPageState extends State<WebPage> {
  String title = "Loading...";
  late StateSetter titleState;
  late InAppWebViewController webViewController;

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)?.settings.arguments as Map;
    bool showTitle = true;
    if (arguments.containsKey("showTitle")) showTitle = arguments['showTitle'];
    return Scaffold(
      body: Column(
        children: [
          StatefulBuilder(builder: (context, setState) {
            titleState = setState;
            if (showTitle)
              return TitleBar(title: title);
            else
              return SizedBox.shrink();
          }),
          Expanded(
              child: InAppWebView(
            initialUrlRequest: URLRequest(url: Uri.parse(arguments['url'])),
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
              webViewController.addJavaScriptHandler(
                  handlerName: "callFlutter",
                  callback: (args) {
                    JSUtils.handleJSCall(webViewController, args[0]);
                  });
            },
          ))
        ],
      ),
    );
  }
}
