import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

Future<void> uploadFile({required File file, required String customUrl}) async {
  final uploadResponse = await http.put(Uri.parse(customUrl), body: await file.readAsBytes());
  if (uploadResponse.statusCode == 200) {
    if (kDebugMode) {
      print('File uploaded successfully');
    }
  } else {
    if (kDebugMode) {
      print('File upload failed');
    }
  }
}