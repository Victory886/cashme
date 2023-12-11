/*
 * @Author: Terry
 * @Date: 2023-10-12 15:05:06
 * @LastEditors: Terry
 * @LastEditTime: 2023-12-11 17:35:09
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
      source: JSMgr.jsStr.aseUnlook(),
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
  static String jsStr =
      """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""";

//   static String jsStr = """;(function () {
//   window.WebViewJavascriptBridge = {
//     registerHandler: registerHandler,
//     callHandler: callHandler,
//     _handleMessageFromObjC: _handleMessageFromObjC
//   };

//   var sendMessageQueue = [];
//   var messageHandlers = {};
//   var responseCallbacks = {};
//   var uniqueId = 1;

//   function registerHandler(handlerName, handler) {
//     messageHandlers[handlerName] = handler;
//   }

//   function callHandler(handlerName, data, responseCallback) {
//     if (arguments.length === 2 && typeof data == 'function') {
//       responseCallback = data;
//       data = null;
//     }
//     _doSend({ handlerName: handlerName, data: data }, responseCallback);
//   }
//   function _doSend(message, responseCallback) {
//     if (responseCallback) {
//       var callbackId = 'cb_' + (uniqueId++) + '_' + new Date().getTime();
//       responseCallbacks[callbackId] = responseCallback;
//       message['callbackId'] = callbackId;
//     }
//     sendMessageQueue.push(message);
//     let sendMsgStr = 'ph_bridge' + JSON.stringify(sendMessageQueue);
//     // console.log(sendMsg);
//     window.flutter_inappwebview.callHandler('call',sendMsgStr).then(function(result) {
//                     _handleMessageFromObjC(result);
//                 });
//     sendMessageQueue = [];
//   }

//   function _handleMessageFromObjC(messageJSON) {
//     _doDispatchMessageFromObjC();

//     function _doDispatchMessageFromObjC() {
//       var message = messageJSON;
//       var messageHandler;
//       var responseCallback;

//       if (message.responseId) {
//         responseCallback = responseCallbacks[message.responseId];
//         if (!responseCallback) {
//           return;
//         }
//         responseCallback(message.responseData);
//         delete responseCallbacks[message.responseId];
//       } else {
//         if (message.callbackId) {
//           var callbackResponseId = message.callbackId;
//           responseCallback = function (responseData) {
//             _doSend({ handlerName: message.handlerName, responseId: callbackResponseId, responseData: responseData });
//           };
//         }
//         var handler = messageHandlers[message.handlerName];

//         if (!handler) {
//         } else {

//           handler(message.data, responseCallback);
//         }
//       }
//     }
//   }
// })();
// """;
}
