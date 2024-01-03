// ignore_for_file: constant_identifier_names

/*
 * @Author: Terry
 * @Date: 2023-10-12 15:05:06
 * @LastEditors: Terry
 * @LastEditTime: 2023-12-18 17:17:16
 * @FilePath: /loannow/lib/config/router_names.dart
 */

/// 路由名字
class RouterNames {
  static const String START = "18Fo01mfg2qviSNzHIlfnQ==" /* /start */;
  static const String HOME = "OKxTW7o3wjYGBAQEGMvqcQ==" /* /home */;
  static const String LOGIN = "nMCVwuVpicWBpkdi/1pJqA==" /* /login */;
  static const String SETTING = "N9Ok43xPS+MkCEFT6XWqTg==" /* /setting */;
  static const String HISTORY = "ryVTwPKooEIs/7cV2ixKaw==" /* /history */;
  static const String MODIFY_PHONE =
      "dXFoolnXGzgax8qTw3pGhA==" /* /modifyPhone */;

  static const String WEB = "O+7YHS9dNVjjFBOAzZ0qAw==" /* /web */;
  static const String CAMERA = "CepfrCfb7lKF/PdM+9S8BA==" /* /camera */;
}

enum ConnectivityResult {
  /// 蓝牙连接网络

  /// wifi 连接网络
  wifi,

  /// 以太网
  ethernet,

  /// 移动网络
  mobile,

  /// 没有连接到网络
  none
}
