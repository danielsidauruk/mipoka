import 'dart:async';
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

  final StreamController<String?> _logoUrlStream = StreamController<String?>();
  final StreamController<String?> _fotoPembinaUrlStream = StreamController<String?>();
  final StreamController<String?> _fotoKetuaUrlStream = StreamController<String?>();
  final StreamController<String?> _fotoWakilKetuaUrlStream = StreamController<String?>();
  final StreamController<String?> _fotoSekretarisUrlStream = StreamController<String?>();
  final StreamController<String?> _fotoBendaharaUrlStream = StreamController<String?>();

  final StreamController<String?> _excelFileStream = StreamController<String?>();
  String? _excelFileController;

  FilePickerResult? excelResult;
  FilePickerResult? logoOrmawaResult;
  FilePickerResult? fotoPembinaResult;
  FilePickerResult? fotoKetuaResult;
  FilePickerResult? fotoWakilKetuaResult;
  FilePickerResult? fotoSekretarisResult;
  FilePickerResult? fotoBendaharaResult;

  int newOrmawaId = UniqueIdGenerator.generateUniqueId();

  Ormawa? ormawa;

  void _processUploadedFile(PlatformFile file) async {

    nimList = [];

    Uint8List? bytes;

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
                    initialData: _excelFileController,
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
                          if (_namaOrmawaController.text.isNotEmpty && _namaSingkatanController.text.isNotEmpty
                              && _namaPembinaController.text.isNotEmpty && _namaKetuaController.text.isNotEmpty
                              && _namaWakilKetuaController.text.isNotEmpty && _namaSekretarisController.text.isNotEmpty
                              && _namaBendaharaController.text.isNotEmpty
                              // && nimList.isNotEmpty && excelResult != null
                              // && logoOrmawaResult != null && fotoPembinaResult != null && fotoKetuaResult != null
                              // && fotoWakilKetuaResult != null && fotoSekretarisResult != null && fotoBendaharaResult != null
                          )

                          {

                            Uint8List? logoOrmawaBytes;
                            Uint8List? fotoPembinaBytes;
                            Uint8List? fotoKetuaBytes;
                            Uint8List? fotoWakilKetuaBytes;
                            Uint8List? fotoSekretarisBytes;
                            Uint8List? fotoBendaharaBytes;

                            // if (kIsWeb) {
                            //   logoOrmawaBytes = logoOrmawaResult?.files.first.bytes;
                            //   fotoPembinaBytes = fotoPembinaResult?.files.first.bytes;
                            //   fotoKetuaBytes = fotoKetuaResult?.files.first.bytes;
                            //   fotoWakilKetuaBytes = fotoWakilKetuaResult?.files.first.bytes;
                            //   fotoSekretarisBytes = fotoSekretarisResult?.files.first.bytes;
                            //   fotoBendaharaBytes = fotoBendaharaResult?.files.first.bytes;
                            // } else if (Platform.isAndroid) {
                            //   logoOrmawaBytes = await File(logoOrmawaResult!.files.first.path!).readAsBytes();
                            //   fotoPembinaBytes = await File(fotoPembinaResult!.files.first.path!).readAsBytes();
                            //   fotoKetuaBytes = await File(fotoKetuaResult!.files.first.path!).readAsBytes();
                            //   fotoWakilKetuaBytes = await File(fotoWakilKetuaResult!.files.first.path!).readAsBytes();
                            //   fotoSekretarisBytes = await File(fotoSekretarisResult!.files.first.path!).readAsBytes();
                            //   fotoBendaharaBytes = await File(fotoBendaharaResult!.files.first.path!).readAsBytes();
                            // }

                            mipokaCustomToast(savingDataMessage);

                            if (logoOrmawaBytes != null) {
                              int uniqueId = UniqueIdGenerator.generateUniqueId();
                              _logoUrlController = await uploadBytesToFirebase(logoOrmawaBytes, "$uniqueId${logoOrmawaResult!.files.first.name}");
                            }
                            if (fotoPembinaBytes != null) {
                              int uniqueId = UniqueIdGenerator.generateUniqueId();
                              _fotoPembinaUrlController = await uploadBytesToFirebase(fotoPembinaBytes, "$uniqueId${fotoPembinaResult!.files.first.name}");
                            }
                            if (fotoKetuaBytes != null) {
                              int uniqueId = UniqueIdGenerator.generateUniqueId();
                              _fotoKetuaUrlController = await uploadBytesToFirebase(fotoKetuaBytes, "$uniqueId${fotoKetuaResult!.files.first.name}");
                            }
                            if (fotoWakilKetuaBytes != null) {
                              int uniqueId = UniqueIdGenerator.generateUniqueId();
                              _fotoWakilKetuaUrlController = await uploadBytesToFirebase(fotoWakilKetuaBytes, "$uniqueId${fotoWakilKetuaResult!.files.first.name}");
                            }
                            if (fotoSekretarisBytes != null) {
                              int uniqueId = UniqueIdGenerator.generateUniqueId();
                              _fotoSekretarisUrlController = await uploadBytesToFirebase(fotoSekretarisBytes, "$uniqueId${fotoSekretarisResult!.files.first.name}");
                            }
                            if (fotoBendaharaBytes != null) {
                              int uniqueId = UniqueIdGenerator.generateUniqueId();
                              _fotoBendaharaUrlController = await uploadBytesToFirebase(fotoBendaharaBytes, "$uniqueId${fotoBendaharaResult!.files.first.name}");
                            }

                            ormawa = Ormawa(
                              idOrmawa: newOrmawaId,
                              namaOrmawa: _namaOrmawaController.text,
                              namaSingkatanOrmawa: _namaSingkatanController.text,
                              logoOrmawa: _logoUrlController ?? "",
                              listAnggota: nimList,
                              pembina: _namaPembinaController.text,
                              ketua: _namaKetuaController.text,
                              wakil: _namaWakilKetuaController.text,
                              sekretaris: _namaSekretarisController.text,
                              bendahara: _namaBendaharaController.text,
                              jumlahAnggota: nimList.length,
                              fotoPembina: _fotoPembinaUrlController ?? "",
                              fotoKetua: _fotoKetuaUrlController ?? "",
                              fotoWakil: _fotoWakilKetuaUrlController ?? "",
                              fotoSekretaris: _fotoSekretarisUrlController ?? "",
                              fotoBendahara: _fotoBendaharaUrlController ?? "",
                              createdAt: currentDate,
                              createdBy: user?.email ?? "unknown",
                              updatedBy: currentDate,
                              updatedAt: user?.email ?? "unknown",
                            );

                            for (int index = 0; index < nimList.length; index++) {
                              await Future.delayed(const Duration(milliseconds: 1000));
                              if (context.mounted) {
                                context.read<MipokaUserByNimBloc>().add(
                                  ReadMipokaUserByNimEvent(nim: nimList[index]),
                                );
                              }
                            }

                            if (context.mounted) {
                              context.read<OrmawaBloc>().add(
                                CreateOrmawaEvent(ormawa: ormawa!),
                              );
                            }
                          } else {
                            mipokaCustomToast(emptyFieldMessage);
                          }
                        },
                        text: 'Simpan',
                      ),



                      BlocBuilder<MipokaUserByNimBloc, MipokaUserByNimState>(
                        builder: (context, state) {
                          if (excelResult != null) {
                            if (state is MipokaUserByNimLoading) {
                              print ("Loading ...");
                              return const SizedBox();
                            } else if (state is MipokaUserByNimByNimHasData) {
                              final mipokaUser = state.mipokaUser;

                              if(mipokaUser.ormawa.length <= 2) {
                                context.read<MipokaUserBloc>().add(
                                  UpdateMipokaUserEvent(
                                    mipokaUser: mipokaUser.copyWith(
                                      ormawa: [...mipokaUser.ormawa, ormawa!],
                                    ),
                                  ),
                                );
                              }

                              return const SizedBox();

                            } else if (state is MipokaUserByNimError) {
                              return Text(state.message);
                            } else {
                              if (kDebugMode) {
                                print("MhsPerPeriode hasn't been triggered yet.");
                              }
                              return const SizedBox();
                            }
                          } else {
                            return const SizedBox();
                          }
                        },
                      ),

                      // BlocListener<OrmawaBloc, OrmawaState>(
                      //   listenWhen: (prev, current) =>
                      //   prev.runtimeType != current.runtimeType,
                      //   listener: (context, state) {
                      //     if (state is OrmawaSuccessMessage) {
                      //       mipokaCustomToast("Ormawa berhasil ditambah.");
                      //       Navigator.pop(context);
                      //     } else if (state is OrmawaError) {
                      //       mipokaCustomToast(state.message);
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
