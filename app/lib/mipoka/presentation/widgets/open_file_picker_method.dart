import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';

Future<String?> uploadFileToFirebase(PlatformFile file, String fileName) async {
  try {
    final Reference storageRef = FirebaseStorage.instance.ref().child(fileName);

    final UploadTask uploadTask = storageRef.putFile(File(file.path!));
    final TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

    final String downloadUrl = await taskSnapshot.ref.getDownloadURL();

    return downloadUrl;
  } catch (error) {
    mipokaCustomToast("Failed while uploading file : $error");
    rethrow;
  }
}

Future<void> deleteFileFromFirebase(String fileUrl) async {
  try {
    final Reference storageRef = FirebaseStorage.instance.refFromURL(fileUrl);
    await storageRef.delete();
    if (kDebugMode) {
      print("File Deleted Successfully.");
    }
    // mipokaCustomToast("File deleted successfully.");
  } catch (error) {
    // mipokaCustomToast("Failed to delete file.");
    if (kDebugMode) {
      print(error);
    }
  }
}



