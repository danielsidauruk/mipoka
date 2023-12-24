import 'package:intl/intl.dart';
import 'package:mipoka/domain/utils/format_date_indonesia.dart';

String formatNotificationDate(String inputDateTime) {
  DateTime dateTime = DateTime.parse(inputDateTime);

  String formattedTime = DateFormat.Hm().format(dateTime);
  String formattedDate = formatDateIndonesia(DateFormat('dd-MM-yyyy').format(dateTime));

  return "$formattedTime WIB · $formattedDate";
}
