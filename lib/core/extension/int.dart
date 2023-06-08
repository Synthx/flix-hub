import 'package:intl/intl.dart';

extension IntExtension on int {
  String toCurrency() {
    return NumberFormat.simpleCurrency(decimalDigits: 0).format(this);
  }

  String toDuration() {
    final Duration duration = Duration(minutes: this);
    final int hour = duration.inHours;
    final int minutes = duration.inMinutes.remainder(60);
    if (hour == 0) {
      return '${minutes}m';
    }

    return '${hour}h ${minutes}m';
  }
}
