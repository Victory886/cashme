import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:loannow/beans/application_bean.dart';
import 'package:loannow/config/app_colors.dart';
import 'package:loannow/config/urls.dart';
import 'package:loannow/utils/js_utils.dart';
import 'package:loannow/utils/operation_utils.dart';

// ignore: must_be_immutable
class RepayingPage extends StatefulWidget {
  late VoidCallback refreshClick;
  late ApplicationBean application;

  @override
  State<StatefulWidget> createState() {
    return RepayingPageState();
  }

  RepayingPage(
      {Key? key, required this.refreshClick, required this.application})
      : super(key: key);
}

class RepayingPageState extends State<RepayingPage> {
  late InAppWebViewController webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: SafeArea(
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Color(0xFFE9E9E9),
                        width: 0.5,
                        style: BorderStyle.solid),
                  ),
                ),
                height: 45,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: () {
                          widget.refreshClick();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(13),
                          child: Image.asset(
                            "images/ic_refresh_black.png",
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        alignment: Alignment.center,
                        width: 200,
                        child: Text(
                          "No.${widget.application.id}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: AppColors.textColor),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(13),
                              child: Image.asset(
                                "images/ic_service_black.png",
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(13),
                              child: Image.asset(
                                "images/ic_messenger_black.png",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: InAppWebView(
              initialUrlRequest: URLRequest(url: Uri.parse(Urls.WEB_URL_REPAY)),
              onProgressChanged: (controller, progress) {
                if (progress > 80) {
                  BotToast.closeAllLoading();
                } else {
                  BotToast.showLoading();
                }
              },
              onWebViewCreated: (controller) {
                webViewController = controller;
                webViewController.addJavaScriptHandler(
                  handlerName: "callFlutter",
                  callback: (args) {
                    JSUtils.handleJSCall(webViewController, args[0], context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    OperationUtils.saveOperation('/home/repay');
  }
}
