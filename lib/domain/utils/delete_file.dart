import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

void deleteFile(String fileUrl) async {
  final response = await http.delete(Uri.parse(fileUrl));
  if (response.statusCode == 200) {
    if (kDebugMode) {
      print('File deleted successfully');
    }
  } else {
    if (kDebugMode) {
      print('Failed to delete file');
    }
  }
}
