import 'package:intl/intl.dart';

String dateFormatter(String date) {
  if (date.isEmpty) return "";

  try {
    // Parse the ISO 8601 string
    final DateTime parsedDate = DateTime.parse(date);
    // Format to yyyy-MM-dd
    final String formatted = DateFormat('yyyy-MM-dd').format(parsedDate);
    return formatted;
  } catch (err) {
    return "";
  }
}