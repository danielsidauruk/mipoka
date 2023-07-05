import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

Future<void> downloadFile(String url) async {
  try {
    final appDocumentsDirectory = await getExternalStorageDirectory();
    final downloadsDirectory = '${appDocumentsDirectory?.path}/Download';

    // Membuat folder download jika belum ada
    await Directory(downloadsDirectory).create(recursive: true);

    // Menentukan nama file berdasarkan URL
    final fileName = url.split('/').last;
    final savePath = '$downloadsDirectory/$fileName';

    // Membuka HTTP connection
    final response = await http.get(Uri.parse(url));

    // Menulis file yang diunduh ke dalam folder download
    File file = File(savePath);
    await file.writeAsBytes(response.bodyBytes);

    print('File berhasil diunduh ke: $savePath');
  } catch (e) {
    print('Error saat mengunduh file: $e');
  }
}
