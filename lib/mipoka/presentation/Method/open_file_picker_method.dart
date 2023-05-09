import 'package:file_picker/file_picker.dart';

class FileUploader {
  static Map<String, String?> filePaths = {};

  static Future<void> selectAndUploadFile(String buttonName) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;
      print('Path: ${file.path}');
      print('File name: ${file.name}');
      print('File size: ${file.size}');
      print('File extension: ${file.extension}');

      filePaths[buttonName] = file.path;

      // Panggil fungsi untuk mengunggah file ke database lokal atau database remote
      await uploadFileToDatabase(file);
    } else {
      print('Method error');
    }
  }

  static Future<void> uploadFileToDatabase(PlatformFile file) async {
    // Logika untuk mengunggah file ke database lokal atau database remote
    // ...
    // Misalnya, Anda dapat menggunakan package http untuk mengunggah ke database remote
    // atau menyimpan file ke storage lokal menggunakan package path_provider

    // Contoh penggunaan package http untuk mengunggah ke database remote
    // var url = 'http://example.com/upload';
    // var request = http.MultipartRequest('POST', Uri.parse(url));
    // request.files.add(http.MultipartFile.fromPath('file', file.path));
    //
    // var response = await request.send();
    // if (response.statusCode == 200) {
    //   print('File uploaded successfully');
    // } else {
    //   print('Failed to upload file');
    // }
  }
}
