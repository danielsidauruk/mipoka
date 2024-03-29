import 'dart:io';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/core/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mipoka/domain/utils/uniqe_id_generator.dart';
import 'package:mipoka/mipoka/domain/entities/berita.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
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
  User? user = FirebaseAuth.instance.currentUser;
  String? _filePickerController;
  FilePickerResult? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MipokaMobileAppBar(),

      drawer: const CustomKemahasiswaanDrawer(),

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
                          result = await FilePicker.platform.pickFiles(type: FileType.image);
                          PlatformFile? file = result?.files.first;
                          if (result != null) {
                            _filePickerStream.add(file?.name);
                          }
                        },
                        text: text,
                      );
                    },
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Text Berita'),

                  MultiLineTextField(controller: _textBeritaController),

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
                          if (_judulBeritaController.text.isEmpty) {
                            mipokaCustomToast(emptyFieldPrompt("Judul Berita"));
                          } else if (_penulisController.text.isEmpty) {
                            mipokaCustomToast(emptyFieldPrompt("Penulis"));
                          } else if (_textBeritaController.text.isEmpty) {
                            mipokaCustomToast(emptyFieldPrompt("Text Berita"));
                          } else if (result == null) {
                            mipokaCustomToast(emptyFieldPrompt("Gambar"));
                          } else {

                            mipokaCustomToast(savingDataMessage);

                            PlatformFile file = result!.files.first;
                            Uint8List? bytes;
                            String? imageUrl;

                            if (kIsWeb) {
                              bytes = file.bytes;
                            } else if (Platform.isAndroid) {
                              bytes = await File(file.path!).readAsBytes();
                            }

                            if (bytes != null) {
                              int uniqueId = UniqueIdGenerator.generateUniqueId();
                              imageUrl = await uploadBytesToFirebase(bytes, "$uniqueId${file.name}");
                            }

                            if(context.mounted) {

                              int uniqueId = UniqueIdGenerator.generateUniqueId();
                              String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

                              Navigator.pop(
                                context,
                                Berita(
                                  idBerita: uniqueId,
                                  judul: _judulBeritaController.text,
                                  penulis: _penulisController.text,
                                  gambar: imageUrl ?? "",
                                  teks: _textBeritaController.text,
                                  tglTerbit: currentDate,
                                  createdAt: currentDate,
                                  createdBy: user?.email ?? "unknown",
                                  updatedAt: currentDate,
                                  updatedBy: user?.email ?? "unknown",
                                ),
                              );
                            }
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
    mipokaCustomToast("Failed while uploading file");
    if (kDebugMode) {
      print(error);
    }
    rethrow;
  }
}
