import 'package:intl/intl.dart';

class DateUtil {
  static String year = "yyyy";
  static String month = "MMMM";
  static String day = "dd";
  static String monthAndYearPattern = "MMMM, yyyy";
  static String dateAndMonthPattern = "dd MMMM";
  static String dateMonthYear = "dd/MM/yyyy";
  static String dateMonthYearWithDot = "dd.MM.yyyy";
  static String yearMonthDateWithMinus = "yyyy-MM-dd";

  static String getFromUTC(String pattern, String utcTime) {
    if (utcTime == "") return "-";
    var formattedDateTime =
        '${utcTime.substring(0, 10)} ${utcTime.substring(11, 23)}';
    return DateFormat(pattern).format(DateTime.parse(formattedDateTime));
  }

  static String formatDate(String pattern, DateTime date) {
    String utcTime = DateTime(date.year, date.month, date.day).toString();

    if (utcTime == "") return "-";
    var formattedDateTime =
        '${utcTime.substring(0, 10)} ${utcTime.substring(11, 23)}';
    return DateFormat(pattern).format(DateTime.parse(formattedDateTime));
  }
}
