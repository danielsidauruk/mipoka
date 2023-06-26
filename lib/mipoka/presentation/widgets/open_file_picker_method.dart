import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class FileUploader {



  // static Future<void> uploadFileToDatabase(PlatformFile file) async {
  //   // Logika untuk mengunggah file ke database lokal atau database remote
  //   // ...
  //   // Misalnya, Anda dapat menggunakan package http untuk mengunggah ke database remote
  //   // atau menyimpan file ke storage lokal menggunakan package path_provider
  //
  //   // Contoh penggunaan package http untuk mengunggah ke database remote
  //   // var url = 'http://example.com/upload';
  //   // var request = http.MultipartRequest('POST', Uri.parse(url));
  //   // request.files.add(http.MultipartFile.fromPath('file', file.path));
  //   //
  //   // var response = await request.send();
  //   // if (response.statusCode == 200) {
  //   //   print('File uploaded successfully');
  //   // } else {
  //   //   print('Failed to upload file');
  //   // }
  // }
}

Future<String?> selectAndUploadFile(String fileName, int id) async {
  try {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;
      print('Path: ${file.path}');
      print('File name: ${file.name}');
      print('File size: ${file.size}');
      print('File extension: ${file.extension}');

      String downloadUrl = await uploadFileToFirebase(file, id, fileName);
      print(downloadUrl);

      return downloadUrl;
    } else {
      return null;
    }
  } catch (error) {
    if (kDebugMode) {
      print(error);
    }
    return null;
  }
}

Future<String> uploadFileToFirebase(PlatformFile file, int id, String fileName) async {
  try {
    final Reference storageRef = FirebaseStorage.instance.ref().child('$fileName-$id');

    final UploadTask uploadTask = storageRef.putFile(File(file.path!));
    final TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

    final String downloadUrl = await taskSnapshot.ref.getDownloadURL();

    return downloadUrl;
  } catch (error) {
    if (kDebugMode) {
      print('Failed while uploading file : $error');
    }
    rethrow;
  }
}

Future<String> uploadSignatureFileToFirebase(File file, int id, String fileName) async {
  try {
    final Reference storageRef = FirebaseStorage.instance.ref().child('$fileName-$id');

    final UploadTask uploadTask = storageRef.putFile(File(file.path));
    final TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

    final String downloadUrl = await taskSnapshot.ref.getDownloadURL();

    return downloadUrl;
  } catch (error) {
    if (kDebugMode) {
      print('Failed while uploading file : $error');
    }
    rethrow;
  }
}
