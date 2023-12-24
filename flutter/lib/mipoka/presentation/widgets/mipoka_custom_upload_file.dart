import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';

class FileUploadPopup extends StatefulWidget {
  final String fileUrlController;

  const FileUploadPopup({
    super.key,
    required this.fileUrlController,
  });

  @override
  State<FileUploadPopup> createState() => _FileUploadPopupState();
}

class _FileUploadPopupState extends State<FileUploadPopup> {
  File? _file;
  bool _isUploading = false;
  String _uploadedFileURL = "";

  @override
  void initState() {
    super.initState();
    _uploadedFileURL = widget.fileUrlController;
  }

  Future<void> _uploadFile() async {
    setState(() {
      _isUploading = true;
    });

    try {
      if (_file != null) {
        Reference storageReference =
        FirebaseStorage.instance.ref().child('suratUndanganUploaded_file.jpg');

        UploadTask uploadTask = storageReference.putFile(_file!);

        uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
          print('Upload progress: ${snapshot.bytesTransferred}/${snapshot.totalBytes}');
        }, onError: (Object e) {
          setState(() {
            _isUploading = false;
          });
        }, onDone: () async {
          String downloadURL = await storageReference.getDownloadURL();

          setState(() {
            _uploadedFileURL = downloadURL;
            _isUploading = false;
          });
        });
      }
    } catch (e) {
      print('Error uploading file: $e');
      setState(() {
        _isUploading = false;
      });
    }
  }

  Future<void> _deleteFile() async {
    try {
      if (_uploadedFileURL.isNotEmpty) {
        Reference fileReference = FirebaseStorage.instance.refFromURL(_uploadedFileURL);

        await fileReference.delete();

        setState(() {
          _uploadedFileURL = '';
        });
      }
    } catch (e) {
      print('Error deleting file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Upload File'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_uploadedFileURL.isNotEmpty) ...[
            const Text('Existing File:'),
            Text(_uploadedFileURL),
            const SizedBox(height: 10),
          ],
          InkWell(
            child: Text(_uploadedFileURL.isNotEmpty ? 'Change File' : 'Upload File'),
            onTap: () async {
              if (_uploadedFileURL.isNotEmpty) {
                await _deleteFile();
              }
              FilePickerResult? result = await FilePicker.platform.pickFiles();
              if (result != null && result.files.isNotEmpty) {
                setState(() {
                  _file = File(result.files.single.path!);
                });
              }
            },
          ),
          if (_file != null) ...[
            const SizedBox(height: 10),
            const Text('Selected File:'),
            Text(_file!.path),
          ],
        ],
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        if (_isUploading)
          const CircularProgressIndicator()
        else
          TextButton(
            onPressed: _uploadFile,
            child: const Text('Upload'),
          ),
      ],
    );
  }
}

