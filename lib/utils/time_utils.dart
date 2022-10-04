import 'package:intl/intl.dart';

String mmmmdyFromDateTime(String dateTime) {
  return DateFormat("MMMM d, y").format(DateTime.parse(dateTime));
}

String hmsDateTime(String dateTime) {
  return DateFormat("jms").format(DateTime.parse(dateTime));
}
