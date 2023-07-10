import 'dart:async';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mipoka/core/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:mipoka/core/constanst.dart';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/domain/entities/berita.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_picker.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_filter_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_excel_uploader.dart';
import 'package:mipoka/mipoka/presentation/widgets/open_file_picker_method.dart';
import 'package:mipoka/mipoka/presentation/bloc/berita_bloc/berita_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';

class KemahasiswaanBerandaBeritaPage extends StatefulWidget {
  const KemahasiswaanBerandaBeritaPage({super.key});

  @override
  State<KemahasiswaanBerandaBeritaPage> createState() => _KemahasiswaanBerandaBeritaPageState();
}

class _KemahasiswaanBerandaBeritaPageState extends State<KemahasiswaanBerandaBeritaPage> {
  final TextEditingController _judulBeritaController = TextEditingController();
  final TextEditingController _penulisController = TextEditingController();
  final TextEditingController _textBeritaController = TextEditingController();
  final StreamController<String?> _fotoBeritaStream = StreamController<String?>();
  String? _fotoBerita;

  final StreamController<String?> _excelFileStream = StreamController<String?>();
  String? _excelFileController;
  FilePickerResult? result;

  Future<Object> _processMahasiswaPerPeriode(PlatformFile file, String fileName) async {
    Uint8List? bytes;

    if (kIsWeb) {
      bytes = file.bytes;
    } else if (Platform.isAndroid) {
      bytes = await File(file.path!).readAsBytes();
    }

    if (bytes != null) {
      return uploadFileToFirebase(bytes, fileName);
      // for (var row in sheet!.rows) {
      //   var nim = row[0]?.value;
      //
      //   if (nim != null) {
      //     nimList.add(nim);
      //   }
      // }
      //
      // for (var i = 1; i < nimList.length; i++) {
      //   Future.microtask(() {
      //     context.read<MhsPerPeriodeMptBloc>().add(
      //       CreateMhsPerPeriodeMptEvent(
      //         mhsPerPeriodeMpt: MhsPerPeriodeMpt(
      //           idMhsPerPeriodeMpt: newId + i,
      //           idUser: nimList[i].toString(),
      //           idPeriodeMpt: _idPeriodeKegiatanMpt ?? 0,
      //           idKegiatanPerPeriodeMpt: 0,
      //           createdAt: currentDate,
      //           createdBy: user?.email ?? "unknown",
      //           updatedAt: currentDate,
      //           updatedBy: user?.email ?? "unknown",
      //         ),
      //       ),
      //     );
      //   });
      // }
    } else {
      return "";
    }
  }


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

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

              CustomContentBox(
                children: [

                  buildTitle('Judul Berita'),

                  CustomTextField(controller: _judulBeritaController),

                  const CustomFieldSpacer(),

                  buildTitle('Penulis'),

                  CustomTextField(controller: _penulisController),


                  const CustomFieldSpacer(),
                  
                  buildTitle('Tambah Gambar'),
                  // StreamBuilder<String?>(
                  //   stream: _fotoBeritaStream.stream,
                  //   builder: (context, snapshot) {
                  //     String text = snapshot.data ?? "";
                  //     return CustomFilePickerButton(
                  //       onTap: () async {
                  //         String? url = await selectAndUploadFile('foto$newId');
                  //         _fotoBerita = url;
                  //         _fotoBeritaStream.add(url);
                  //       },
                  //       onDelete: () {
                  //         _fotoBerita = "";
                  //         _fotoBeritaStream.add("");
                  //       },
                  //       text: text,
                  //     );
                  //   },
                  // ),

                  // onTap: () async {
                  //   result = await FilePicker.platform.pickFiles();
                  //   if (result != null){
                  //     _excelFileStream.add(result?.files.first.name);
                  //   }
                  // },
                  StreamBuilder<String?>(
                    initialData: _excelFileController,
                    stream: _excelFileStream.stream,
                    builder: (context, snapshot) {
                      String text = snapshot.data ?? "";
                      return MipokaExcelUploader(
                        onTap: () async {
                          result = await FilePicker.platform.pickFiles();
                          if (result != null) {
                            _excelFileStream.add(result?.files.first.name);
                          }
                        },
                        text: text,
                      );
                    },
                  ),

                  // CustomFilterButton(
                  //   text: 'Proses',
                  //   onPressed: (){
                  //     final result = this.result;
                  //     if (result != null) {
                  //       PlatformFile file = result.files.first;
                  //       Future.microtask(() {
                  //         _processMahasiswaPerPeriode(file, "berita_$newId");
                  //
                  //         mipokaCustomToast("Data telah di update.");
                  //         Navigator.pop(context);
                  //       });
                  //     } else {
                  //       mipokaCustomToast("Harap unggah file yang diperlukan.");
                  //     }
                  //   },
                  // ),

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
                        onTap: () => (_judulBeritaController.text.isNotEmpty && _penulisController.text.isNotEmpty &&
                            _textBeritaController.text.isNotEmpty) ?
                        Future.microtask(() {
                          final result = this.result;
                          if (result != null) {
                            PlatformFile file = result.files.first;
                            Future.microtask(() {
                              final gambarUrl = _processMahasiswaPerPeriode(file, "berita_$newId");

                              mipokaCustomToast("Berita berhasil ditambahkan.");
                              context.read<BeritaBloc>().add(
                                CreateBeritaEvent(
                                  Berita(
                                    idBerita: newId,
                                    judul: _judulBeritaController.text,
                                    penulis: _judulBeritaController.text,
                                    gambar: gambarUrl.toString(),
                                    teks: _textBeritaController.text,
                                    tglTerbit: currentDate,
                                    createdAt: currentDate,
                                    createdBy: user?.email ?? "unknown",
                                    updatedAt: currentDate,
                                    updatedBy: user?.email ?? "unknown",
                                  ),
                                ),
                              );

                              mipokaCustomToast("Data telah di update.");
                              Navigator.pop(context);
                            });
                          } else {
                            mipokaCustomToast("Harap unggah file yang diperlukan.");
                          }
                          context.read<BeritaBloc>().add(const ReadAllBeritaEvent());
                          Navigator.pop(context);
                        }) :
                        mipokaCustomToast("Harap isi semua field."),
                        text: 'Simpan',
                      ),
                    ],
                  ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<String?> selectAndUploadFile(String fileName, Uint8List bytes) async {
  try {
    String? downloadUrl = await uploadFileToFirebase(bytes, fileName);

    mipokaCustomToast('File uploaded Successfully');
    return downloadUrl;
  } catch (error) {
    mipokaCustomToast(error.toString());
    return null;
  }
}

Future<String?> uploadFileToFirebase(Uint8List bytes, String fileName) async {
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
