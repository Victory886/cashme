import 'package:bot_toast/bot_toast.dart';
import 'package:url_launcher/url_launcher.dart';

class PhoneUtils {
  static String formatPhone(String? phone) {
    if (phone != null) {
      switch (phone.length) {
        case 12:
          if (!phone.startsWith("639")) phone = "";
          break;
        case 11:
          if (!phone.startsWith("09"))
            phone = "";
          else
            phone = "63" + phone.substring(1, phone.length);
          break;
        case 10:
          if (!phone.startsWith("9"))
            phone = "";
          else
            phone = "63" + phone;
          break;
        default:
          phone = "";
          break;
      }
      return phone;
    } else {
      return "";
    }
  }

  static void callPhone(String? phone) {
    try {
      launchUrl(Uri.parse("tel:${phone}"));
    } catch (e) {
      BotToast.showText(text: e.toString());
    }
  }
}
