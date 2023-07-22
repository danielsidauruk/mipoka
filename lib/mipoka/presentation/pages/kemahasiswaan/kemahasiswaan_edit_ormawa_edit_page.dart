import 'dart:async';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/download_file_with_dio.dart';
import 'package:mipoka/domain/utils/uniqe_id_generator.dart';
import 'package:mipoka/mipoka/domain/entities/ormawa.dart';
import 'package:mipoka/mipoka/presentation/bloc/ormawa_bloc/ormawa_bloc.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_beranda_tambah_berita.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_filter_button.dart';
import 'package:excel/excel.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_excel_uploader.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_file_uploader.dart';
import 'package:mipoka/mipoka/presentation/widgets/open_file_picker_method.dart';

class KemahasiswaanEditOrmawaEditPage extends StatefulWidget {
  const KemahasiswaanEditOrmawaEditPage({
    super.key,
    required this.ormawa,
  });

  final Ormawa ormawa;

  @override
  State<KemahasiswaanEditOrmawaEditPage> createState() =>
      _KemahasiswaanEditOrmawaEditPageState();
}

class _KemahasiswaanEditOrmawaEditPageState
    extends State<KemahasiswaanEditOrmawaEditPage> {

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
  List<String> _nimList = [];

  final StreamController<String?> _logoUrlStream = StreamController<String?>();
  final StreamController<String?> _fotoPembinaUrlStream = StreamController<String?>();
  final StreamController<String?> _fotoKetuaUrlStream = StreamController<String?>();
  final StreamController<String?> _fotoWakilKetuaUrlStream = StreamController<String?>();
  final StreamController<String?> _fotoSekretarisUrlStream = StreamController<String?>();
  final StreamController<String?> _fotoBendaharaUrlStream = StreamController<String?>();

  final StreamController<String?> _excelFileStream = StreamController<String?>();
  String? _excelFileController;

  FilePickerResult? result;
  FilePickerResult? logoOrmawaResult;
  FilePickerResult? fotoPembinaResult;
  FilePickerResult? fotoKetuaResult;
  FilePickerResult? fotoWakilKetuaResult;
  FilePickerResult? fotoSekretarisResult;
  FilePickerResult? fotoBendaharaResult;

  void _processUploadedFile(PlatformFile file) async {
    Uint8List? bytes;

    if (kIsWeb) {
      bytes = file.bytes;
    } else if (Platform.isAndroid) {
      bytes = await File(file.path!).readAsBytes();
    }

    _nimList = [];

    if (bytes != null) {
      Excel excel = Excel.decodeBytes(bytes);
      Sheet? sheet = excel.tables[excel.tables.keys.first];

      int rowIndex = 0;

      for (var row in sheet!.rows) {
        if (rowIndex > 0) {
          var nim = row[0]?.value;

          if (nim != null && !_nimList.contains(nim.toString())) {
            _nimList.add(nim.toString());
          }
        }
        rowIndex++;
      }
    }
  }

  @override
  void initState() {
    _namaOrmawaController.text = widget.ormawa.namaOrmawa;
    _namaSingkatanController.text = widget.ormawa.namaSingkatanOrmawa;
    _logoUrlController = widget.ormawa.logoOrmawa;
    _namaPembinaController.text = widget.ormawa.pembina;
    _fotoPembinaUrlController = widget.ormawa.fotoPembina;
    _namaKetuaController.text = widget.ormawa.ketua;
    _fotoKetuaUrlController = widget.ormawa.fotoKetua;
    _namaWakilKetuaController.text = widget.ormawa.wakil;
    _fotoWakilKetuaUrlController = widget.ormawa.fotoWakil;
    _namaSekretarisController.text = widget.ormawa.sekretaris;
    _fotoSekretarisUrlController = widget.ormawa.fotoSekretaris;
    _namaBendaharaController.text = widget.ormawa.bendahara;
    _fotoBendaharaUrlController = widget.ormawa.fotoBendahara;
    _nimList = widget.ormawa.listAnggota;
    super.initState();
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
                    initialData: _logoUrlController,
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
                        onDelete: () {
                          deleteFileFromFirebase(_logoUrlController!);
                          _logoUrlStream.add("");
                          _logoUrlController = "";
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
                    initialData: _fotoPembinaUrlController,
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
                        onDelete: () {
                          deleteFileFromFirebase(_fotoPembinaUrlController!);
                          _fotoPembinaUrlStream.add("");
                          _fotoPembinaUrlController = "";
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
                    initialData: _fotoKetuaUrlController,
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
                        onDelete: () {
                          deleteFileFromFirebase(_fotoKetuaUrlController!);
                          _fotoKetuaUrlStream.add("");
                          _fotoKetuaUrlController = "";
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
                    initialData: _fotoWakilKetuaUrlController,
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
                        onDelete: () {
                          deleteFileFromFirebase(_fotoWakilKetuaUrlController!);
                          _fotoWakilKetuaUrlStream.add("");
                          _fotoWakilKetuaUrlController = "";
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
                    initialData: _fotoSekretarisUrlController,
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
                        onDelete: () {
                          deleteFileFromFirebase(_fotoSekretarisUrlController!);
                          _fotoSekretarisUrlStream.add("");
                          _fotoSekretarisUrlController = "";
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
                    initialData: _fotoBendaharaUrlController,
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
                        onDelete: () {
                          deleteFileFromFirebase(_fotoBendaharaUrlController!);
                          _fotoBendaharaUrlStream.add("");
                          _fotoBendaharaUrlController = "";
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
                          result = await FilePicker.platform.pickFiles();
                          if (result != null){
                            _excelFileStream.add(result?.files.first.name);
                            PlatformFile? file = result?.files.first;
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
                          if (_namaOrmawaController.text.isNotEmpty && _namaSingkatanController.text.isNotEmpty &&
                              _namaPembinaController.text.isNotEmpty && _namaKetuaController.text.isNotEmpty &&
                              _namaWakilKetuaController.text.isNotEmpty && _namaSekretarisController.text.isNotEmpty &&
                              _namaBendaharaController.text.isNotEmpty && _nimList.isNotEmpty &&
                              ((_logoUrlController != "" || logoOrmawaResult != null) &&
                                  (_fotoPembinaUrlController != "" || fotoPembinaResult != null) &&
                                  (_fotoKetuaUrlController != "" || fotoKetuaResult != null) &&
                                  (_fotoWakilKetuaUrlController != "" || fotoWakilKetuaResult != null) &&
                                  (_fotoSekretarisUrlController != "" || fotoSekretarisResult != null) &&
                                  (_fotoBendaharaUrlController != "" || fotoBendaharaResult != null))
                          ) {

                            Uint8List? logoOrmawaBytes;
                            Uint8List? fotoPembinaBytes;
                            Uint8List? fotoKetuaBytes;
                            Uint8List? fotoWakilKetuaBytes;
                            Uint8List? fotoSekretarisBytes;
                            Uint8List? fotoBendaharaBytes;


                            if (kIsWeb) {
                              if (logoOrmawaResult != null) {
                                logoOrmawaBytes = logoOrmawaResult?.files.first.bytes;
                              } else if (fotoPembinaResult != null) {
                                fotoPembinaBytes = fotoPembinaResult?.files.first.bytes;
                              } else if (fotoKetuaResult != null) {
                                fotoKetuaBytes = fotoKetuaResult?.files.first.bytes;
                              } else if (fotoWakilKetuaResult != null) {
                                fotoWakilKetuaBytes = fotoWakilKetuaResult?.files.first.bytes;
                              } else if (fotoSekretarisResult != null) {
                                fotoSekretarisBytes = fotoSekretarisResult?.files.first.bytes;
                              } else if (fotoBendaharaResult != null) {
                                fotoBendaharaBytes = fotoBendaharaResult?.files.first.bytes;
                              }
                            } else if (Platform.isAndroid) {
                              if (logoOrmawaResult != null) {
                                logoOrmawaBytes = await File(logoOrmawaResult!.files.first.path!).readAsBytes();
                              } else if (fotoPembinaResult != null) {
                                fotoPembinaBytes = await File(fotoPembinaResult!.files.first.path!).readAsBytes();
                              } else if (fotoKetuaResult != null) {
                                fotoKetuaBytes = await File(fotoKetuaResult!.files.first.path!).readAsBytes();
                              } else if (fotoWakilKetuaResult != null) {
                                fotoWakilKetuaBytes = await File(fotoWakilKetuaResult!.files.first.path!).readAsBytes();
                              } else if (fotoSekretarisResult != null) {
                                fotoSekretarisBytes = await File(fotoSekretarisResult!.files.first.path!).readAsBytes();
                              } else if (fotoBendaharaResult != null) {
                                fotoBendaharaBytes = await File(fotoBendaharaResult!.files.first.path!).readAsBytes();
                              }
                            }

                            mipokaCustomToast(savingDataMessage);

                            if (logoOrmawaBytes != null) {
                              int uniqueId = UniqueIdGenerator.generateUniqueId();
                              String? logoUrlController = await uploadBytesToFirebase(logoOrmawaBytes, "$uniqueId${logoOrmawaResult!.files.first.name}");
                              _logoUrlController = logoUrlController;
                            } else if (fotoPembinaBytes != null) {
                              int uniqueId = UniqueIdGenerator.generateUniqueId();
                              String? fotoPembinaUrlController = await uploadBytesToFirebase(fotoPembinaBytes, "$uniqueId${fotoPembinaResult!.files.first.name}");
                              _fotoPembinaUrlController = fotoPembinaUrlController;
                            } else if (fotoKetuaBytes != null) {
                              int uniqueId = UniqueIdGenerator.generateUniqueId();
                              String? fotoKetuaUrlController = await uploadBytesToFirebase(fotoKetuaBytes, "$uniqueId${fotoKetuaResult!.files.first.name}");
                              _fotoKetuaUrlController = fotoKetuaUrlController;
                            } else if (fotoWakilKetuaBytes != null) {
                              int uniqueId = UniqueIdGenerator.generateUniqueId();
                              String? fotoWakilKetuaUrlController = await uploadBytesToFirebase(fotoWakilKetuaBytes, "$uniqueId${fotoWakilKetuaResult!.files.first.name}");
                              _fotoWakilKetuaUrlController = fotoWakilKetuaUrlController;
                            } else if (fotoSekretarisBytes != null) {
                              int uniqueId = UniqueIdGenerator.generateUniqueId();
                              String? fotoSekretarisUrlController = await uploadBytesToFirebase(fotoSekretarisBytes, "$uniqueId${fotoSekretarisResult!.files.first.name}");
                              _fotoSekretarisUrlController = fotoSekretarisUrlController;
                            } else if (fotoBendaharaBytes != null) {
                              int uniqueId = UniqueIdGenerator.generateUniqueId();
                              String? fotoBendaharaUrlController = await uploadBytesToFirebase(fotoBendaharaBytes, "$uniqueId${fotoBendaharaResult!.files.first.name}");
                              _fotoBendaharaUrlController = fotoBendaharaUrlController;
                            }
                            print("Logo Url : $_logoUrlController");

                            context.read<OrmawaBloc>().add(
                              UpdateOrmawaEvent(
                                widget.ormawa.copyWith(
                                  namaOrmawa: _namaOrmawaController.text,
                                  namaSingkatanOrmawa: _namaSingkatanController.text,
                                  logoOrmawa: _logoUrlController!,
                                  listAnggota: _nimList,
                                  pembina: _namaPembinaController.text,
                                  ketua: _namaKetuaController.text,
                                  wakil: _namaWakilKetuaController.text,
                                  sekretaris: _namaSekretarisController.text,
                                  bendahara: _namaBendaharaController.text,
                                  jumlahAnggota: _nimList.length,
                                  fotoPembina: _fotoPembinaUrlController ?? "",
                                  fotoKetua: _fotoKetuaUrlController ?? "",
                                  fotoWakil: _fotoWakilKetuaUrlController ?? "",
                                  fotoSekretaris: _fotoSekretarisUrlController ?? "",
                                  fotoBendahara: _fotoBendaharaUrlController ?? "",
                                  updatedBy: currentDate,
                                  updatedAt: user?.email ?? "unknown",
                                ),
                              ),
                            );
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
                          if (state is OrmawaSuccessMessage) {
                            mipokaCustomToast("Ormawa berhasil diupdate.");
                            Navigator.pop(context);
                          } else if (state is OrmawaError) {
                            mipokaCustomToast(state.message);
                          }
                        },
                        child: const SizedBox(),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
