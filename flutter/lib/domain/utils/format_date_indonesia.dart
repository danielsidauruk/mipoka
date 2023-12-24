String formatDateIndonesia(String inputDate) {
  List<String> dateParts = inputDate.split('-');

  int day = int.parse(dateParts[0]);
  int month = int.parse(dateParts[1]);
  int year = int.parse(dateParts[2]);

  List<String> monthsInIndonesian = [
    "",
    "Januari",
    "Februari",
    "Maret",
    "April",
    "Mei",
    "Juni",
    "Juli",
    "Agustus",
    "September",
    "Oktober",
    "November",
    "Desember"
  ];

  String formattedDate = "$day ${monthsInIndonesian[month]} $year";
  return formattedDate;
}