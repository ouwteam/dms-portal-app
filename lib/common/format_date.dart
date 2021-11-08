import 'package:intl/intl.dart';

String formatDate(String formatedDate, String? format) {
  if (format == null) {
    format = "Y-m-d H:m:s";
  }

  var formater = DateFormat(format);
  DateTime? dt;

  try {
    dt = DateTime.tryParse(formatedDate);
  } catch (e) {
    return "";
  }

  return formater.format(dt!);
}
