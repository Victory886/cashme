/*
 * @Author: Terry
 * @Date: 2023-10-12 15:05:06
 * @LastEditors: Terry
 * @LastEditTime: 2023-12-05 16:13:18
 * @FilePath: /loannow/lib/pages/web.dart
 */
import 'dart:collection';
import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:loannow/utils/js_utils.dart';
import 'package:loannow/utils/secure_cipher_utils.dart';
import 'package:loannow/widget/titleBar.dart';

import '../utils/phone_utils.dart';

@immutable
class WebPage extends StatefulWidget {
  const WebPage({Key? key, this.urlStr}) : super(key: key);

  final String? urlStr;

  @override
  State<StatefulWidget> createState() {
    return WebPageState();
  }
}

class WebPageState extends State<WebPage> {
  String title = "4n9hzSJU0Lz7UlPu9YaaXg==".aseUnlook() /* Loading... */;
  late StateSetter titleState;
  late InAppWebViewController webViewController;

  final userScripts = <UserScript>[
    UserScript(
      source: JSMgr.jsStr,
      injectionTime: UserScriptInjectionTime.AT_DOCUMENT_START,
    )
  ];

  late bool showTitle;
  @override
  Widget build(BuildContext context) {
    dynamic arguments;
    if (widget.urlStr == null) {
      arguments = ModalRoute.of(context)?.settings.arguments as Map;
      if (arguments.containsKey(
          "0G1BpuJo1t01gRqp3BFWxA==".aseUnlook() /* showTitle */)) {
        showTitle =
            arguments["0G1BpuJo1t01gRqp3BFWxA==".aseUnlook() /* showTitle */]
                as bool;
      }
    } else {
      showTitle = false;
    }
    return Scaffold(
      body: Column(
        children: [
          StatefulBuilder(
            builder: (context, setState) {
              titleState = setState;
              if (showTitle) {
                return TitleBar(title: title);
              } else {
                return const SizedBox.shrink();
              }
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
                if (showTitle) {
                  this.title = title ?? "";
                  showTitle = title != null;
                  titleState(() {});
                }
              },
              onWebViewCreated: (controller) {
                webViewController = controller;
                int time = DateTime.now().millisecondsSinceEpoch;
                String url = widget.urlStr ??
                    arguments["vW9Mk2OPXFJFZeVsVxyxVg==".aseUnlook() /* url */];
                if (!url.contains(
                    "zYvrU7yRN7nZYqjA2aZRAQ==".aseUnlook() /* .html */)) {
                  if (url.contains(
                      "Yx5X8W4JbQW+k6UPrQpWAQ==".aseUnlook() /* ? */)) {
                    url = "$url&t=$time";
                  } else {
                    url = "$url?t=$time";
                  }
                }

                fLog("Terry-----web----调用了----$url");
                Uri uri = widget.urlStr != null
                    ? Uri.parse(widget.urlStr ?? "")
                    : Uri.parse(url);
                webViewController.loadUrl(urlRequest: URLRequest(url: uri));

                webViewController.addJavaScriptHandler(
                  handlerName:
                      "RsPp5dTOEB/m/aNsCxxDvQ==".aseUnlook() /* call */,
                  callback: (args) async {
                    if (args.isEmpty) return {};

                    String msg = args.last;

                    if (msg.contains("HsI+F+lcH4xjucfJvLBP8Q=="
                            .aseUnlook() /* ph_bridge */) ==
                        false) return {};
                    msg = msg.replaceAll(
                        "HsI+F+lcH4xjucfJvLBP8Q==".aseUnlook() /* ph_bridge */,
                        "");
                    List list = json.decode(msg);
                    for (var element in list) {
                      Map<String, dynamic> dict = element;
                      Map<String, dynamic> resMap =
                          await H5ToFlutterMethodHandler
                              .handleH5ToNativeMessage(
                                  controller,
                                  dict,
                                  "RsPp5dTOEB/m/aNsCxxDvQ=="
                                      .aseUnlook() /* call */,
                                  context);
                      return resMap;
                    }
                  },
                );
              },
              initialOptions: InAppWebViewGroupOptions(
                ios: IOSInAppWebViewOptions(),
                // crossPlatform: InAppWebViewOptions(cacheEnabled: false),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class JSMgr {
  static String jsStr = """;(function () {
  window.WebViewJavascriptBridge = {
    registerHandler: registerHandler,
    callHandler: callHandler,
    _handleMessageFromObjC: _handleMessageFromObjC
  };

  var sendMessageQueue = [];
  var messageHandlers = {};
  var responseCallbacks = {};
  var uniqueId = 1;

  function registerHandler(handlerName, handler) {
    messageHandlers[handlerName] = handler;
  }

  function callHandler(handlerName, data, responseCallback) {
    if (arguments.length === 2 && typeof data == 'function') {
      responseCallback = data;
      data = null;
    }
    _doSend({ handlerName: handlerName, data: data }, responseCallback);
  }
  function _doSend(message, responseCallback) {
    if (responseCallback) {
      var callbackId = 'cb_' + (uniqueId++) + '_' + new Date().getTime();
      responseCallbacks[callbackId] = responseCallback;
      message['callbackId'] = callbackId;
    }
    sendMessageQueue.push(message);
    let sendMsgStr = 'ph_bridge' + JSON.stringify(sendMessageQueue);
    // console.log(sendMsg);
    window.flutter_inappwebview.callHandler('call',sendMsgStr).then(function(result) {
                    _handleMessageFromObjC(result);
                });
    sendMessageQueue = [];
  }

  function _handleMessageFromObjC(messageJSON) {
    _doDispatchMessageFromObjC();

    function _doDispatchMessageFromObjC() {
      var message = messageJSON;
      var messageHandler;
      var responseCallback;

      if (message.responseId) {
        responseCallback = responseCallbacks[message.responseId];
        if (!responseCallback) {
          return;
        }
        responseCallback(message.responseData);
        delete responseCallbacks[message.responseId];
      } else {
        if (message.callbackId) {
          var callbackResponseId = message.callbackId;
          responseCallback = function (responseData) {
            _doSend({ handlerName: message.handlerName, responseId: callbackResponseId, responseData: responseData });
          };
        }
        var handler = messageHandlers[message.handlerName];

        if (!handler) {
        } else {

          handler(message.data, responseCallback);
        }
      }
    }
  }
})();
""";
}
