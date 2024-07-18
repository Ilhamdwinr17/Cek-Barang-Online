import 'package:intl/intl.dart';

class DateUtil {
  static todMMMy(DateTime date) {
    return DateFormat("d MMM y").format(date);
  }
}

extension DateExtension on DateTime {
  String get dMMMy {
    return DateFormat("d MMM y").format(this);
  }
}
