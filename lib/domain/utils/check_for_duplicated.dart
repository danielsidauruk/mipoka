import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:file_picker/file_picker.dart';

class FileUploaderAndCheckDuplicated {
  static Map<String, String?> filePaths = {};


  static Future<void> selectAndUploadFileForChecker(String buttonName) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;
      print('Path: ${file.path}');
      print('File name: ${file.name}');
      print('File size: ${file.size}');
      print('File extension: ${file.extension}');

      String? duplicateFilePath = await checkForDuplicateFile(file);
      if (duplicateFilePath != null) {
        // File is a duplicate, show popup or take appropriate action
        print('Duplicate file found: $duplicateFilePath');
      } else {
        // File is not a duplicate, store in temporary local storage
        filePaths[buttonName] = file.path;
        print('File added to temporary storage');
      }
    } else {
      print('Method error');
    }
  }

  static Future<String?> checkForDuplicateFile(PlatformFile file) async {
    List<int> bytes = await File(file.path!).readAsBytes();
    String hash = sha256.convert(bytes).toString();
    for (String? filePath in filePaths.values) {
      if (filePath != null) {
        List<int> existingBytes = await File(filePath).readAsBytes();
        String existingHash = sha256.convert(existingBytes).toString();
        if (hash == existingHash) {
          return filePath;
        }
      }
    }
    return null;
  }

  static List<String?> getStoredFiles() {
    return filePaths.values.where((path) => path != null).toList();
  }

  static void clearStoredFiles() {
    filePaths.clear();
  }

  String getFileNameAndSize(String filePath) {
    File file = File(filePath);
    String fileName = file.path.split('/').last;
    String fileSize = '${(file.lengthSync() / 1024).toStringAsFixed(2)} KB';
    return '$fileName ($fileSize)';
  }
}
