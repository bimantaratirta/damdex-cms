// import 'package:intl/intl.dart';

// String isoParser(
//   String? date, {
//   String? newPattern,
//   String? locale,
// }) {
//   final DateTime dateTime = DateTime.parse(date ?? "0000-00-00T00:00:00.000Z");
//   final DateFormat dateFormatter = DateFormat(
//     newPattern ?? 'dd MMM yyyy',
//     locale ?? "id_ID",
//   );
//   final DateFormat timeFormatter = DateFormat.Hm(locale ?? "id_ID");
//   final String formattedDate = dateFormatter.format(dateTime.toLocal());
//   final String formattedTime = timeFormatter.format(dateTime.toLocal());
//   final String formatted = "$formattedDate, $formattedTime";
//   return formatted;
// }
