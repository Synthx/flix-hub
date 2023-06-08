import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String toLocale({
    required String format,
  }) {
    return DateFormat(format).format(this);
  }
}
