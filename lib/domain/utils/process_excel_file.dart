import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:excel/excel.dart';

void processUploadedFile<T>(BuildContext context, PlatformFile file, T additionalData) async {
  Uint8List? bytes;

  if (kIsWeb) {
    bytes = file.bytes;
  } else if (Platform.isAndroid) {
    bytes = await File(file.path!).readAsBytes();
  }

  if (bytes != null) {
    Excel excel = Excel.decodeBytes(bytes);
    Sheet? sheet = excel.tables[excel.tables.keys.first];

    List nimList = [];

    for (var row in sheet!.rows) {
      var nim = row[0]?.value;

      if (nim != null) {
        nimList.add(nim);
      }
    }
  }
}