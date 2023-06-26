import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

Future<dynamic> uploadFileToFirebase(File file, String nim, String fileName) async {
  try {
    // Buat referensi ke Firebase Storage
    final Reference storageRef = FirebaseStorage.instance.ref().child('$nim/uploadedFile');

    // Unggah file ke Firebase Storage
    final UploadTask uploadTask = storageRef.putFile(file);
    final TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

    // Dapatkan URL unduhan file dari Firebase Storage
    final String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  } catch (error) {
    print('Kesalahan saat mengunggah file: $error');
    return null;
  }
}