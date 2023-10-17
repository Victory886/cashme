import 'dart:convert';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class JSUtils {
  static void handleJSCall(InAppWebViewController controller, String args) {
    print('-------callFlutter------');
    print(args);
    Map map=jsonDecode(args);
    print(map);
  }
}
