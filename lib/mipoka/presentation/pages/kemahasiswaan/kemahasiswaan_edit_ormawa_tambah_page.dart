import 'dart:async';
import 'dart:math';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'dart:io';
import 'package:excel/excel.dart';
import 'package:flutter/foundation.dart';
import 'package:mipoka/domain/utils/download_file_with_dio.dart';
import 'package:mipoka/domain/utils/uniqe_id_generator.dart';
import 'package:mipoka/mipoka/domain/entities/ormawa.dart';
import 'package:mipoka/mipoka/presentation/bloc/mipoka_user_bloc/mipoka_user_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/mipoka_user_by_nim_bloc/mipoka_user_by_nim_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/ormawa_bloc/ormawa_bloc.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_beranda_tambah_berita.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_filter_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_excel_uploader.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_file_uploader.dart';

class KemahasiswaanEditOrmawaTambahPage extends StatefulWidget {
  const KemahasiswaanEditOrmawaTambahPage({super.key});

  @override
  State<KemahasiswaanEditOrmawaTambahPage> createState() =>
      _KemahasiswaanEditOrmawaTambahPageState();
}

class _KemahasiswaanEditOrmawaTambahPageState
    extends State<KemahasiswaanEditOrmawaTambahPage> {

  final TextEditingController _namaOrmawaController = TextEditingController();
  final TextEditingController _namaSingkatanController = TextEditingController();
  String? _logoUrlController;
  final TextEditingController _namaPembinaController = TextEditingController();
  String? _fotoPembinaUrlController;
  final TextEditingController _namaKetuaController = TextEditingController();
  String? _fotoKetuaUrlController;
  final TextEditingController _namaWakilKetuaController = TextEditingController();
  String? _fotoWakilKetuaUrlController;
  final TextEditingController _namaSekretarisController = TextEditingController();
  String? _fotoSekretarisUrlController;
  final TextEditingController _namaBendaharaController = TextEditingController();
  String? _fotoBendaharaUrlController;
  List<String> nimList = [];
  List<String> newNimList = [];

  final StreamController<String?> _logoUrlStream = StreamController<String?>.broadcast();
  final StreamController<String?> _fotoPembinaUrlStream = StreamController<String?>.broadcast();
  final StreamController<String?> _fotoKetuaUrlStream = StreamController<String?>.broadcast();
  final StreamController<String?> _fotoWakilKetuaUrlStream = StreamController<String?>.broadcast();
  final StreamController<String?> _fotoSekretarisUrlStream = StreamController<String?>.broadcast();
  final StreamController<String?> _fotoBendaharaUrlStream = StreamController<String?>.broadcast();

  final StreamController<String?> _excelFileStream = StreamController<String?>();

  FilePickerResult? excelResult;
  FilePickerResult? logoOrmawaResult;
  FilePickerResult? fotoPembinaResult;
  FilePickerResult? fotoKetuaResult;
  FilePickerResult? fotoWakilKetuaResult;
  FilePickerResult? fotoSekretarisResult;
  FilePickerResult? fotoBendaharaResult;

  int uniqueId = Random().nextInt(899999999) + 100000000;
  Ormawa? _ormawa;

  @override
  void initState() {
    excelResult = null;
    _excelFileStream.add("");
    super.initState();
  }

  void _processUploadedFile(PlatformFile file) async {
    Uint8List? bytes;

    nimList = [];

    if (kIsWeb) {
      bytes = file.bytes;
    } else if (Platform.isAndroid) {
      bytes = await File(file.path!).readAsBytes();
    }

    if (bytes != null) {
      Excel excel = Excel.decodeBytes(bytes);
      Sheet? sheet = excel.tables[excel.tables.keys.first];

      int rowIndex = 0;

      for (var row in sheet!.rows) {
        if (rowIndex > 0) {
          var nim = row[0]?.value;

          if (nim != null) {
            nimList.add(nim.toString());
          }
        }
        rowIndex++;
      }
    }

    print (nimList);
    newNimList = nimList;
  }


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
              const CustomMobileTitle(
                  text: 'Kemahasiswaan - Edit Ormawa - Tambah'),
              const CustomFieldSpacer(),
              CustomContentBox(
                children: [
                  buildTitle('Nama Ormawa'),
                  CustomTextField(controller: _namaOrmawaController),

                  const CustomFieldSpacer(),

                  buildTitle('Nama Singkatan'),
                  CustomTextField(controller: _namaSingkatanController),

                  const CustomFieldSpacer(),

                  buildTitle('Logo Ormawa'),

                  StreamBuilder<String?>(
                    stream: _logoUrlStream.stream,
                    builder: (context, snapshot) {
                      String text = snapshot.data ?? "";
                      return MipokaFileUploader(
                        asset: "assets/icons/attach.png",
                        onTap: () async {
                          logoOrmawaResult = await FilePicker.platform.pickFiles(type: FileType.image);
                          PlatformFile? file = logoOrmawaResult?.files.first;
                          if (logoOrmawaResult != null) {
                            _logoUrlStream.add(file?.name);
                          }
                        },
                        text: text,
                      );
                    },
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Nama Pembina'),
                  CustomTextField(controller: _namaPembinaController),

                  const CustomFieldSpacer(),

                  buildTitle('Foto Pembina'),
                  StreamBuilder<String?>(
                    stream: _fotoPembinaUrlStream.stream,
                    builder: (context, snapshot) {
                      String text = snapshot.data ?? "";
                      return MipokaFileUploader(
                        asset: "assets/icons/attach.png",
                        onTap: () async {
                          fotoPembinaResult = await FilePicker.platform.pickFiles(type: FileType.image);
                          PlatformFile? file = fotoPembinaResult?.files.first;
                          if (fotoPembinaResult != null) {
                            _fotoPembinaUrlStream.add(file?.name);
                          }
                        },
                        text: text,
                      );
                    },
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Nama Ketua'),
                  CustomTextField(controller: _namaKetuaController),

                  const CustomFieldSpacer(),

                  buildTitle('Foto Ketua'),
                  StreamBuilder<String?>(
                    stream: _fotoKetuaUrlStream.stream,
                    builder: (context, snapshot) {
                      String text = snapshot.data ?? "";
                      return MipokaFileUploader(
                        asset: "assets/icons/attach.png",
                        onTap: () async {
                          fotoKetuaResult = await FilePicker.platform.pickFiles(type: FileType.image);
                          PlatformFile? file = fotoKetuaResult?.files.first;
                          if (fotoKetuaResult != null) {
                            _fotoKetuaUrlStream.add(file?.name);
                          }
                        },
                        text: text,
                      );
                    },
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Nama Wakil Ketua'),
                  CustomTextField(controller: _namaWakilKetuaController),

                  const CustomFieldSpacer(),

                  buildTitle('Foto Wakil Ketua'),
                  StreamBuilder<String?>(
                    stream: _fotoWakilKetuaUrlStream.stream,
                    builder: (context, snapshot) {
                      String text = snapshot.data ?? "";
                      return MipokaFileUploader(
                        asset: "assets/icons/attach.png",
                        onTap: () async {
                          fotoWakilKetuaResult = await FilePicker.platform.pickFiles(type: FileType.image);
                          PlatformFile? file = fotoWakilKetuaResult?.files.first;
                          if (fotoWakilKetuaResult != null) {
                            _fotoWakilKetuaUrlStream.add(file?.name);
                          }
                        },
                        text: text,
                      );
                    },
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Nama Sekretaris'),
                  CustomTextField(controller: _namaSekretarisController),

                  const CustomFieldSpacer(),

                  buildTitle('Foto Sekretaris'),
                  StreamBuilder<String?>(
                    stream: _fotoSekretarisUrlStream.stream,
                    builder: (context, snapshot) {
                      String text = snapshot.data ?? "";
                      return MipokaFileUploader(
                        asset: "assets/icons/attach.png",
                        onTap: () async {
                          fotoSekretarisResult = await FilePicker.platform.pickFiles(type: FileType.image);
                          PlatformFile? file = fotoSekretarisResult?.files.first;
                          if (fotoSekretarisResult != null) {
                            _fotoSekretarisUrlStream.add(file?.name);
                          }
                        },
                        text: text,
                      );
                    },
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Nama Bendahara'),
                  CustomTextField(controller: _namaBendaharaController),

                  const CustomFieldSpacer(),

                  buildTitle('Foto Bendahara'),
                  StreamBuilder<String?>(
                    stream: _fotoBendaharaUrlStream.stream,
                    builder: (context, snapshot) {
                      String text = snapshot.data ?? "";
                      return MipokaFileUploader(
                        asset: "assets/icons/attach.png",
                        onTap: () async {
                          fotoBendaharaResult = await FilePicker.platform.pickFiles(type: FileType.image);
                          PlatformFile? file = fotoBendaharaResult?.files.first;
                          if (fotoBendaharaResult != null) {
                            _fotoBendaharaUrlStream.add(file?.name);
                          }
                        },
                        text: text,
                      );
                    },
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Impor Anggota'),
                  StreamBuilder<String?>(
                    stream: _excelFileStream.stream,
                    builder: (context, snapshot) {
                      String filePath = snapshot.data ?? "";
                      return MipokaExcelUploader(
                        onTap: () async {
                          excelResult = await FilePicker.platform.pickFiles();
                          if (excelResult != null){
                            _excelFileStream.add(excelResult?.files.first.name);
                            PlatformFile? file = excelResult?.files.first;
                            _processUploadedFile(file!);
                          }
                        },
                        text: filePath,
                      );
                    },
                  ),

                  const CustomFieldSpacer(),

                  // CustomFilterButton(
                  //   text: "Proses File Excel",
                  //   onPressed: () async {
                  //     if (
                  //     _namaOrmawaController.text.isNotEmpty && _namaSingkatanController.text.isNotEmpty
                  //         && _namaPembinaController.text.isNotEmpty && _namaKetuaController.text.isNotEmpty
                  //         && _namaWakilKetuaController.text.isNotEmpty && _namaSekretarisController.text.isNotEmpty
                  //         && _namaBendaharaController.text.isNotEmpty && nimList.isNotEmpty
                  //         && excelResult != null && logoOrmawaResult != null && fotoPembinaResult != null
                  //         && fotoKetuaResult != null && fotoWakilKetuaResult != null && fotoSekretarisResult != null
                  //         && fotoBendaharaResult != null
                  //     )
                  //     {
                  //       Uint8List? logoOrmawaBytes;
                  //       Uint8List? fotoPembinaBytes;
                  //       Uint8List? fotoKetuaBytes;
                  //       Uint8List? fotoWakilKetuaBytes;
                  //       Uint8List? fotoSekretarisBytes;
                  //       Uint8List? fotoBendaharaBytes;
                  //
                  //       if (kIsWeb) {
                  //         logoOrmawaBytes = logoOrmawaResult?.files.first.bytes;
                  //         fotoPembinaBytes = fotoPembinaResult?.files.first.bytes;
                  //         fotoKetuaBytes = fotoKetuaResult?.files.first.bytes;
                  //         fotoWakilKetuaBytes = fotoWakilKetuaResult?.files.first.bytes;
                  //         fotoSekretarisBytes = fotoSekretarisResult?.files.first.bytes;
                  //         fotoBendaharaBytes = fotoBendaharaResult?.files.first.bytes;
                  //       } else if (Platform.isAndroid) {
                  //         logoOrmawaBytes = await File(logoOrmawaResult!.files.first.path!).readAsBytes();
                  //         fotoPembinaBytes = await File(fotoPembinaResult!.files.first.path!).readAsBytes();
                  //         fotoKetuaBytes = await File(fotoKetuaResult!.files.first.path!).readAsBytes();
                  //         fotoWakilKetuaBytes = await File(fotoWakilKetuaResult!.files.first.path!).readAsBytes();
                  //         fotoSekretarisBytes = await File(fotoSekretarisResult!.files.first.path!).readAsBytes();
                  //         fotoBendaharaBytes = await File(fotoBendaharaResult!.files.first.path!).readAsBytes();
                  //       }
                  //
                  //       // mipokaCustomToast(savingDataMessage);
                  //
                  //       if (logoOrmawaBytes != null) {
                  //         int uniqueId = UniqueIdGenerator.generateUniqueId();
                  //         _logoUrlController = await uploadBytesToFirebase(logoOrmawaBytes, "$uniqueId${logoOrmawaResult!.files.first.name}");
                  //       }
                  //       if (fotoPembinaBytes != null) {
                  //         int uniqueId = UniqueIdGenerator.generateUniqueId();
                  //         _fotoPembinaUrlController = await uploadBytesToFirebase(fotoPembinaBytes, "$uniqueId${fotoPembinaResult!.files.first.name}");
                  //       }
                  //       if (fotoKetuaBytes != null) {
                  //         int uniqueId = UniqueIdGenerator.generateUniqueId();
                  //         _fotoKetuaUrlController = await uploadBytesToFirebase(fotoKetuaBytes, "$uniqueId${fotoKetuaResult!.files.first.name}");
                  //       }
                  //       if (fotoWakilKetuaBytes != null) {
                  //         int uniqueId = UniqueIdGenerator.generateUniqueId();
                  //         _fotoWakilKetuaUrlController = await uploadBytesToFirebase(fotoWakilKetuaBytes, "$uniqueId${fotoWakilKetuaResult!.files.first.name}");
                  //       }
                  //       if (fotoSekretarisBytes != null) {
                  //         int uniqueId = UniqueIdGenerator.generateUniqueId();
                  //         _fotoSekretarisUrlController = await uploadBytesToFirebase(fotoSekretarisBytes, "$uniqueId${fotoSekretarisResult!.files.first.name}");
                  //       }
                  //       if (fotoBendaharaBytes != null) {
                  //         int uniqueId = UniqueIdGenerator.generateUniqueId();
                  //         _fotoBendaharaUrlController = await uploadBytesToFirebase(fotoBendaharaBytes, "$uniqueId${fotoBendaharaResult!.files.first.name}");
                  //       }
                  //
                  //       _ormawa = Ormawa(
                  //         idOrmawa: uniqueId,
                  //         namaOrmawa: '_namaOrmawaController.text',
                  //         namaSingkatanOrmawa: '_namaSingkatanController.text',
                  //         logoOrmawa: '_logoUrlController ?? ""',
                  //         listAnggota: nimList,
                  //         pembina: '_namaPembinaController.text',
                  //         ketua:' _namaKetuaController.text',
                  //         wakil: '_namaWakilKetuaController.text',
                  //         sekretaris: '_namaSekretarisController.text',
                  //         bendahara: '_namaBendaharaController.text',
                  //         jumlahAnggota: nimList.length,
                  //         fotoPembina: '_fotoPembinaUrlController ?? ""',
                  //         fotoKetua: '_fotoKetuaUrlController ?? ""',
                  //         fotoWakil: '_fotoWakilKetuaUrlController ?? ""',
                  //         fotoSekretaris: '_fotoSekretarisUrlController ?? ""',
                  //         fotoBendahara: '_fotoBendaharaUrlController ?? ""',
                  //         createdAt: currentDate,
                  //         createdBy: user?.email ?? "unknown",
                  //         updatedBy: currentDate,
                  //         updatedAt: user?.email ?? "unknown",
                  //       );
                  //
                  //       if (context.mounted) {
                  //         context.read<OrmawaBloc>().add(
                  //           CreateOrmawaEvent(
                  //             ormawa: _ormawa!,
                  //           ),
                  //         );
                  //       }
                  //     } else {
                  //       mipokaCustomToast(emptyFieldMessage);
                  //     }
                  //   },
                  // ),

                  const CustomFieldSpacer(),

                  CustomFilterButton(
                      text: 'Export Template',
                      onPressed: () {
                        downloadFileWithDio(
                          url: nimTemplate,
                          fileName: "anggota_ormawa_template.xlsx",
                        );
                      }
                  ),
                  
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
                          // if(nimList != newNimList) {
                          //   List<String> combinedList = [..._ormawa!.listAnggota, ...newNimList];
                          //   List<String> finalNimList = combinedList.toSet().toList();
                          //
                          //   context.read<OrmawaBloc>().add(
                          //     UpdateOrmawaEvent(
                          //       ormawa: _ormawa!.copyWith(
                          //         listAnggota: finalNimList,
                          //         jumlahAnggota: finalNimList.length,
                          //       ),
                          //     ),
                          //   );
                          //
                          //   print("$finalNimList : ${finalNimList.length}");
                          // }

                          if (
                          // _namaOrmawaController.text.isNotEmpty &&
                          //     _namaSingkatanController.text.isNotEmpty
                          //     && _namaPembinaController.text.isNotEmpty &&
                          //     _namaKetuaController.text.isNotEmpty
                          //     && _namaWakilKetuaController.text.isNotEmpty &&
                          //     _namaSekretarisController.text.isNotEmpty
                          //     && _namaBendaharaController.text.isNotEmpty &&
                          //     nimList.isNotEmpty
                          //     &&
                          excelResult != null
                          // &&
                              // logoOrmawaResult != null &&
                              // fotoPembinaResult != null
                              // && fotoKetuaResult != null &&
                              // fotoWakilKetuaResult != null &&
                              // fotoSekretarisResult != null
                              // && fotoBendaharaResult != null
                          ) {
                            Uint8List? logoOrmawaBytes;
                            Uint8List? fotoPembinaBytes;
                            Uint8List? fotoKetuaBytes;
                            Uint8List? fotoWakilKetuaBytes;
                            Uint8List? fotoSekretarisBytes;
                            Uint8List? fotoBendaharaBytes;

                            if (kIsWeb) {
                              logoOrmawaBytes =
                                  logoOrmawaResult?.files.first.bytes;
                              fotoPembinaBytes =
                                  fotoPembinaResult?.files.first.bytes;
                              fotoKetuaBytes =
                                  fotoKetuaResult?.files.first.bytes;
                              fotoWakilKetuaBytes =
                                  fotoWakilKetuaResult?.files.first.bytes;
                              fotoSekretarisBytes =
                                  fotoSekretarisResult?.files.first.bytes;
                              fotoBendaharaBytes =
                                  fotoBendaharaResult?.files.first.bytes;
                            } else if (Platform.isAndroid) {
                              logoOrmawaBytes = await File(
                                  logoOrmawaResult!.files.first.path!)
                                  .readAsBytes();
                              fotoPembinaBytes = await File(
                                  fotoPembinaResult!.files.first.path!)
                                  .readAsBytes();
                              fotoKetuaBytes = await File(
                                  fotoKetuaResult!.files.first.path!)
                                  .readAsBytes();
                              fotoWakilKetuaBytes = await File(
                                  fotoWakilKetuaResult!.files.first.path!)
                                  .readAsBytes();
                              fotoSekretarisBytes = await File(
                                  fotoSekretarisResult!.files.first.path!)
                                  .readAsBytes();
                              fotoBendaharaBytes = await File(
                                  fotoBendaharaResult!.files.first.path!)
                                  .readAsBytes();
                            }

                            // mipokaCustomToast(savingDataMessage);

                            if (logoOrmawaBytes != null) {
                              int uniqueId = UniqueIdGenerator
                                  .generateUniqueId();
                              _logoUrlController =
                                  await uploadBytesToFirebase(logoOrmawaBytes,
                                  "$uniqueId${logoOrmawaResult!.files.first
                                      .name}");
                            }
                            if (fotoPembinaBytes != null) {
                              int uniqueId = UniqueIdGenerator
                                  .generateUniqueId();
                              _fotoPembinaUrlController =
                                  await uploadBytesToFirebase(
                                  fotoPembinaBytes,
                                  "$uniqueId${fotoPembinaResult!.files.first
                                      .name}");
                            }
                            if (fotoKetuaBytes != null) {
                              int uniqueId = UniqueIdGenerator
                                  .generateUniqueId();
                              _fotoKetuaUrlController =
                                  await uploadBytesToFirebase(fotoKetuaBytes,
                                  "$uniqueId${fotoKetuaResult!.files.first
                                      .name}");
                            }
                            if (fotoWakilKetuaBytes != null) {
                              int uniqueId = UniqueIdGenerator
                                  .generateUniqueId();
                              _fotoWakilKetuaUrlController =
                                  await uploadBytesToFirebase(
                                  fotoWakilKetuaBytes,
                                  "$uniqueId${fotoWakilKetuaResult!.files
                                      .first.name}");
                            }
                            if (fotoSekretarisBytes != null) {
                              int uniqueId = UniqueIdGenerator
                                  .generateUniqueId();
                              _fotoSekretarisUrlController =
                                  await uploadBytesToFirebase(
                                  fotoSekretarisBytes,
                                  "$uniqueId${fotoSekretarisResult!.files
                                      .first.name}");
                            }
                            if (fotoBendaharaBytes != null) {
                              int uniqueId = UniqueIdGenerator
                                  .generateUniqueId();
                              _fotoBendaharaUrlController =
                                  await uploadBytesToFirebase(
                                  fotoBendaharaBytes,
                                  "$uniqueId${fotoBendaharaResult!.files.first
                                      .name}");
                            }

                            _ormawa = Ormawa(
                              idOrmawa: uniqueId,
                              namaOrmawa: '_namaOrmawaController.text',
                              namaSingkatanOrmawa: '_namaSingkatanController.text',
                              logoOrmawa: '_logoUrlController ?? ""',
                              listAnggota: nimList,
                              pembina: '_namaPembinaController.text',
                              ketua: ' _namaKetuaController.text',
                              wakil: '_namaWakilKetuaController.text',
                              sekretaris: '_namaSekretarisController.text',
                              bendahara: '_namaBendaharaController.text',
                              jumlahAnggota: nimList.length,
                              fotoPembina: '_fotoPembinaUrlController ?? ""',
                              fotoKetua: '_fotoKetuaUrlController ?? ""',
                              fotoWakil: '_fotoWakilKetuaUrlController ?? ""',
                              fotoSekretaris: '_fotoSekretarisUrlController ?? ""',
                              fotoBendahara: '_fotoBendaharaUrlController ?? ""',
                              createdAt: currentDate,
                              createdBy: user?.email ?? "unknown",
                              updatedBy: currentDate,
                              updatedAt: user?.email ?? "unknown",
                            );

                            if (context.mounted) {
                              context.read<OrmawaBloc>().add(
                                CreateOrmawaEvent(
                                  ormawa: _ormawa!,
                                ),
                              );

                            }

                          } else {
                            mipokaCustomToast(emptyFieldMessage);
                          }
                        },
                        text: 'Simpan',
                      ),

                      BlocListener<OrmawaBloc, OrmawaState>(
                        listenWhen: (prev, current) =>
                        prev.runtimeType != current.runtimeType,
                        listener: (context, state) {
                          if (excelResult != null) {
                            if (state is CreateOrmawaSuccess) {

                              // print ("MipokaUserByNiM Listener Has Data.");

                              if (excelResult != null) {
                                for (var index = 0; index < nimList.length; index++) {

                                  // if (index == nimList.length - 1) {
                                  //   mipokaCustomToast("Anggota Ormawa Berhasil di proses.");
                                  // } else {
                                  //   print("Memproses ${nimList[index]}");
                                  // }

                                  if (context.mounted) {
                                    context.read<MipokaUserByNimBloc>().add(
                                      ReadMipokaUserByNimEvent(
                                          nim: nimList[index]),
                                    );
                                    Future.delayed(const Duration(seconds: 10));
                                  }
                                }

                              } else {
                                mipokaCustomToast("Harap unggah file yang diperlukan.");
                              }

                            } else if (state is UpdateOrmawaSuccess) {
                              mipokaCustomToast("Ormawa Telah ditambah.");
                            } else if (state is OrmawaError) {
                              mipokaCustomToast("Ormawa : ${state.message}");
                            }
                          } else {
                            const SizedBox();
                          }
                        },

                        child: const SizedBox(),
                      ),

                      BlocBuilder<MipokaUserByNimBloc, MipokaUserByNimState>(
                          builder: (context, state) {
                            if (excelResult != null ) {
                              if (state is MipokaUserByNimLoading) {
                                if (kDebugMode) {
                                  print ("Loading ...");
                                }
                                return const SizedBox();
                              } else if (state is MipokaUserByNimByNimHasData) {

                                final mipokaUser = state.mipokaUser;

                                context.read<MipokaUserBloc>().add(
                                  UpdateMipokaUserEvent(
                                    mipokaUser: mipokaUser.copyWith(
                                      ormawa: [
                                        ...mipokaUser.ormawa,
                                        _ormawa!,
                                      ],
                                    ),
                                  ),
                                );

                                // List<int> ormawaIdList = mipokaUser.ormawa
                                //     .map((ormawa) => ormawa.idOrmawa)
                                //     .toList();
                                //
                                // print("NIM by MipokaUserByNimBloc : ${mipokaUser.nim}");

                                // if(mipokaUser.ormawa.length <= 2 && ormawaIdList.contains(_ormawa?.idOrmawa) == false) {
                                //   print("MIPOKA user before PUT : $mipokaUser");
                                //
                                //   context.read<MipokaUserBloc>().add(
                                //     UpdateMipokaUserEvent(
                                //       mipokaUser: mipokaUser.copyWith(
                                //         ormawa: [
                                //           ...mipokaUser.ormawa,
                                //           _ormawa!,
                                //         ],
                                //       ),
                                //     ),
                                //   );
                                // } else {
                                //   newNimList.removeWhere((element) => element == mipokaUser.nim);
                                // }
                                return const SizedBox();
                              } else if (state is MipokaUserByNimError){
                                mipokaCustomToast("MipokaUserByNim ${state.message}");
                                return const SizedBox();
                              } else {
                                return const SizedBox();
                              }
                            } else {
                              return const SizedBox();
                            }
                          }
                      ),


                      // BlocListener<MipokaUserByNimBloc, MipokaUserByNimState>(
                      //   listenWhen: (prev, current) =>
                      //   prev.runtimeType != current.runtimeType,
                      //   listener: (context, state) {
                      //     if (excelResult != null) {
                      //       if (state is MipokaUserByNimLoading) {
                      //         if (kDebugMode) {
                      //           print ("Loading ...");
                      //         }
                      //       } else if (state is MipokaUserByNimByNimHasData) {
                      //         final mipokaUser = state.mipokaUser;
                      //         print("Nim : ${mipokaUser.nim}");
                      //
                      //         context.read<MipokaUserBloc>().add(
                      //           UpdateMipokaUserEvent(
                      //             mipokaUser: mipokaUser.copyWith(
                      //               ormawa: [
                      //                 ...state.mipokaUser.ormawa,
                      //                 _ormawa!,
                      //               ],
                      //             ),
                      //           ),
                      //         );
                      //         // if(mipokaUser.ormawa.length <= 2
                      //         //     && mipokaUser.ormawa.contains(_ormawa) == false) {
                      //         //
                      //         //   context.read<MipokaUserBloc>().add(
                      //         //     UpdateMipokaUserEvent(
                      //         //       mipokaUser: mipokaUser.copyWith(
                      //         //         ormawa: [
                      //         //           ...state.mipokaUser.ormawa,
                      //         //           _ormawa!,
                      //         //         ],
                      //         //       ),
                      //         //     ),
                      //         //   );
                      //         // } else {
                      //         //   // nimList.removeWhere((element) => element == mipokaUser.nim);
                      //         //   // print(nimList);
                      //         // }
                      //       } else if (state is MipokaUserByNimError){
                      //         mipokaCustomToast("MipokaUserByNim ${state.message}");
                      //       }
                      //     }
                      //   },
                      //   child: const SizedBox(),
                      // ),
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
