import 'package:intl/intl.dart';

class FormatUtils {
  static String formatAmount(dynamic? amount) {
    try {
      var numberFormat = NumberFormat('#,##0', 'en_US');
      return numberFormat.format(amount);
    } catch (e) {
      print(e.toString());
      return "";
    }
  }

  static String formatDate(int microsecondsSinceEpoch) {
    try {
      var dateFormat = DateFormat('MM/dd/y', 'en_US');
      return dateFormat.format(DateTime.fromMillisecondsSinceEpoch(microsecondsSinceEpoch));
    } catch (e) {
      return "";
    }
  }
}
