import 'package:loannow/beans/ip_check_bean.dart';
import 'package:loannow/beans/system_config_bean.dart';

class Constans {
  static const int CODE_COUNT_TIME = 60;
  static const Duration DIO_TIME_OUT = Duration(seconds: 30);

  static IpCheckBean? ipCheckBean = null;
  static SystemConfigBean? systemConfigBean = null;
}
