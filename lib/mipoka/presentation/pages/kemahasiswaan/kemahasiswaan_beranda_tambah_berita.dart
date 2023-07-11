import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mipoka/core/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mipoka/mipoka/domain/entities/berita.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
import 'package:mipoka/mipoka/presentation/bloc/berita_bloc/berita_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_file_uploader.dart';

class KemahasiswaanBerandaBeritaPage extends StatefulWidget {
  const KemahasiswaanBerandaBeritaPage({super.key});

  @override
  State<KemahasiswaanBerandaBeritaPage> createState() => _KemahasiswaanBerandaBeritaPageState();
}

class _KemahasiswaanBerandaBeritaPageState extends State<KemahasiswaanBerandaBeritaPage> {
  final TextEditingController _judulBeritaController = TextEditingController();
  final TextEditingController _penulisController = TextEditingController();
  final TextEditingController _textBeritaController = TextEditingController();

  final StreamController<String?> _filePickerStream = StreamController<String?>.broadcast();
  String? _filePickerController;
  FilePickerResult? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MipokaMobileAppBar(),

      drawer: const MobileCustomKemahasiswaanDrawer(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomMobileTitle(text: 'Kemahasiswaan - Beranda - Tambah Berita'),

              const CustomFieldSpacer(),

              // Mobile UI
              CustomContentBox(
                children: [

                  buildTitle('Judul Berita'),

                  CustomTextField(controller: _judulBeritaController),

                  const CustomFieldSpacer(),

                  buildTitle('Penulis'),

                  CustomTextField(controller: _penulisController),

                  const CustomFieldSpacer(),

                  buildTitle('Tambah Gambar'),

                  StreamBuilder<String?>(
                    initialData: _filePickerController,
                    stream: _filePickerStream.stream,
                    builder: (context, snapshot) {
                      String text = snapshot.data ?? "";
                      return MipokaFileUploader(
                        asset: "assets/icons/attach.png",
                        onTap: () async {
                          result = await FilePicker.platform.pickFiles();
                          PlatformFile? file = result?.files.first;
                          if (result != null) {
                            if (file?.extension!.toLowerCase() == 'jpg' ||
                                file?.extension!.toLowerCase() == 'jpeg' ||
                                file?.extension!.toLowerCase() == 'png' ||
                                file?.extension!.toLowerCase() == 'gif'){
                              _filePickerStream.add(result?.files.first.name);
                            } else {
                              mipokaCustomToast("Tipe data file bukan gambar.");
                            }
                          }
                        },
                        text: text,
                      );
                    },
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Text Berita'),
                  CustomTextField(controller: _textBeritaController),

                  const CustomFieldSpacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomMipokaButton(
                        onTap: () => Navigator.pop(context),
                        text: 'Kembali',
                      ),

                      const SizedBox(width: 8.0),

                      CustomMipokaButton(
                        onTap: () async {
                          if (_judulBeritaController.text.isNotEmpty &&
                              _penulisController.text.isNotEmpty &&
                              _textBeritaController.text.isNotEmpty) {
                            final result = this.result;
                            if (result != null) {
                              PlatformFile file = result.files.first;
                              Uint8List? bytes;
                              String? gambarUrl;

                              if (kIsWeb) {
                                bytes = file.bytes;
                              } else if (Platform.isAndroid) {
                                bytes = await File(file.path!).readAsBytes();
                              }

                              if (bytes != null) {
                                gambarUrl = await uploadBytesToFirebase(bytes, "$newId${file.name}");
                              }

                              mipokaCustomToast("Berita berhasil ditambahkan.");
                              Future.microtask(() {
                                context.read<BeritaBloc>().add(
                                  CreateBeritaEvent(
                                    Berita(
                                      idBerita: newId,
                                      judul: _judulBeritaController.text,
                                      penulis: _penulisController.text,
                                      gambar: gambarUrl ?? "",
                                      teks: _textBeritaController.text,
                                      tglTerbit: currentDate,
                                      createdAt: currentDate,
                                      createdBy: user?.email ?? "unknown",
                                      updatedAt: currentDate,
                                      updatedBy: user?.email ?? "unknown",
                                    ),
                                  ),
                                );
                                Navigator.pop(context);
                              });
                            } else {
                              mipokaCustomToast("Harap unggah file yang diperlukan.");
                            }
                          } else {
                            mipokaCustomToast("Harap isi semua field.");
                          }
                        },
                        text: 'Simpan',
                      ),

                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<String?> uploadBytesToFirebase(Uint8List bytes, String fileName) async {
  try {
    final Reference storageRef = FirebaseStorage.instance.ref().child(fileName);

    final UploadTask uploadTask = storageRef.putData(bytes);
    final TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

    final String downloadUrl = await taskSnapshot.ref.getDownloadURL();

    return downloadUrl;
  } catch (error) {
    mipokaCustomToast("Failed while uploading file : $error");
    rethrow;
  }
}

