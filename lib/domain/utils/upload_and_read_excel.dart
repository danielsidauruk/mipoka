import 'dart:io';
import 'dart:math';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';

Future<void> uploadAndReadExcelFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();

  if (result != null) {
    PlatformFile file = result.files.first;

    List<int> bytes = await File(file.path!).readAsBytes();
    Excel excel = Excel.decodeBytes(bytes);

    final sheet = excel.tables[excel.tables.keys.first];

    var nimList = [];
    var peranList = [];

    for (var row in sheet!.rows) {
      var nim = row[0]?.value;
      var peran = row[1]?.value;

      if (nim != null && peran != null) {
        nimList.add(nim);
        peranList.add(peran);
      }
    }

    var random = Random();
    for (int i = 0; i < nimList.length; i++) {
      int randomId = random.nextInt(9999999) + i;
      print('idPeserta: $i, NIM: ${nimList[i]}, Peran: ${peranList[i]}');
    }

  }
}


// Future<void> uploadAndReadExcelFile() async {
//   var filePickerResult = await FilePicker.platform.pickFiles();
//
//   // Mengambil direktori aplikasi
//   var appDocumentsDirectory = await getApplicationDocumentsDirectory();
//
//   // Mengambil path file yang dipilih
//   var filePath = filePickerResult?.paths.first;
//
//   // Menentukan path absolut ke file
//   var absolutePath = '${appDocumentsDirectory.path}/$filePath';
//
//   var bytes = File(absolutePath).readAsBytesSync();
//
//   var excel = Excel.decodeBytes(bytes);
//   var sheet = excel.tables[excel.tables.keys.first];
//
//   var nimList = <String>[];
//   var peranList = <String>[];
//
//   for (var row in sheet!.rows) {
//     var nim = row[0]?.value;
//     var peran = row[1]?.value;
//
//     if (nim != null && peran != null) {
//       nimList.add(nim);
//       peranList.add(peran);
//     }
//   }
//
//   // // Print semua nilai nim dan peran
//   // for (var i = 0; i < nimList.length; i++) {
//   //   print('NIM: ${nimList[i]}, Peran: ${peranList[i]}');
//   // }
//   //
//   // if (filePickerResult != null && filePickerResult.files.isNotEmpty) {
//   //   var file = filePickerResult.files.first;
//   //
//   //   if (kIsWeb) {
//   //     // File yang dipilih pada web tidak perlu dimuat sebagai byte
//   //     // karena sudah tersedia dalam response body
//   //     var bytes = file.bytes;
//   //
//   //     var excel = Excel.decodeBytes(bytes!);
//   //     var sheet = excel.tables[excel.tables.keys.first];
//   //
//   //     var nimList = <String>[];
//   //     var peranList = <String>[];
//   //
//   //     for (var row in sheet!.rows) {
//   //       var nim = row[0]?.value;
//   //       var peran = row[1]?.value;
//   //
//   //       if (nim != null && peran != null) {
//   //         nimList.add(nim);
//   //         peranList.add(peran);
//   //       }
//   //     }
//   //
//   //     // Print semua nilai nim dan peran
//   //     for (var i = 0; i < nimList.length; i++) {
//   //       print('NIM: ${nimList[i]}, Peran: ${peranList[i]}');
//   //     }
//   //   } else {
//   //     // Mengambil direktori aplikasi
//   //     var appDocumentsDirectory = await getApplicationDocumentsDirectory();
//   //
//   //     // Mengambil path file yang dipilih
//   //     var filePath = filePickerResult.paths.first;
//   //
//   //     // Menentukan path absolut ke file
//   //     var absolutePath = '${appDocumentsDirectory.path}/$filePath';
//   //
//   //     var bytes = File(absolutePath).readAsBytesSync();
//   //
//   //     var excel = Excel.decodeBytes(bytes);
//   //     var sheet = excel.tables[excel.tables.keys.first];
//   //
//   //     var nimList = <String>[];
//   //     var peranList = <String>[];
//   //
//   //     for (var row in sheet!.rows) {
//   //       var nim = row[0]?.value;
//   //       var peran = row[1]?.value;
//   //
//   //       if (nim != null && peran != null) {
//   //         nimList.add(nim);
//   //         peranList.add(peran);
//   //       }
//   //     }
//   //
//   //     // Print semua nilai nim dan peran
//   //     for (var i = 0; i < nimList.length; i++) {
//   //       print('NIM: ${nimList[i]}, Peran: ${peranList[i]}');
//   //     }
//   //   }
//   // }
// }
