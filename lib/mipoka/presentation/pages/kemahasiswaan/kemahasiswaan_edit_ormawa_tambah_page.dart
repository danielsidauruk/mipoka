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
import 'package:mipoka/mipoka/domain/entities/ormawa.dart';
import 'package:mipoka/mipoka/presentation/bloc/ormawa_bloc/ormawa_bloc.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_mpt_unggah_bukti_page.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_picker.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_filter_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_excel_uploader.dart';

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

  final StreamController<String?> _logoUrlStream = StreamController<String?>();
  final StreamController<String?> _fotoPembinaUrlStream = StreamController<String?>();
  final StreamController<String?> _fotoKetuaUrlStream = StreamController<String?>();
  final StreamController<String?> _fotoWakilKetuaUrlStream = StreamController<String?>();
  final StreamController<String?> _fotoSekretarisUrlStream = StreamController<String?>();
  final StreamController<String?> _fotoBendaharaUrlStream = StreamController<String?>();

  final StreamController<String?> _excelFileStream = StreamController<String?>();
  String? _excelFileController;

  FilePickerResult? result;

  @override
  void initState() {

    super.initState();
  }

  List<String> nimList = [];

  void _processUploadedFile(PlatformFile file) async {
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
                      return CustomFilePickerButton(
                        onTap: () async {
                          String? url = await selectAndUploadFile('logo_ormawa_${_namaOrmawaController.text}');
                          _logoUrlController = url;
                          _logoUrlStream.add(url);
                        },
                        onDelete: () {
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
                    stream: _fotoPembinaUrlStream.stream,
                    builder: (context, snapshot) {
                      String text = snapshot.data ?? "";
                      return CustomFilePickerButton(
                        onTap: () async {
                          String? url = await selectAndUploadFile('foto_pembina_${_namaOrmawaController.text}');
                          _fotoPembinaUrlController = url;
                          _fotoPembinaUrlStream.add(url);
                        },
                        onDelete: () {
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
                    stream: _fotoKetuaUrlStream.stream,
                    builder: (context, snapshot) {
                      String text = snapshot.data ?? "";
                      return CustomFilePickerButton(
                        onTap: () async {
                          String? url = await selectAndUploadFile('foto_ketua_${_namaOrmawaController.text}');
                          _fotoKetuaUrlController = url;
                          _fotoKetuaUrlStream.add(url);
                        },
                        onDelete: () {
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
                    stream: _fotoWakilKetuaUrlStream.stream,
                    builder: (context, snapshot) {
                      String text = snapshot.data ?? "";
                      return CustomFilePickerButton(
                        onTap: () async {
                          String? url = await selectAndUploadFile('foto_wakil_ketua_${_namaOrmawaController.text}');
                          _fotoWakilKetuaUrlController = url;
                          _fotoWakilKetuaUrlStream.add(url);
                        },
                        onDelete: () {
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
                    stream: _fotoSekretarisUrlStream.stream,
                    builder: (context, snapshot) {
                      String text = snapshot.data ?? "";
                      return CustomFilePickerButton(
                        onTap: () async {
                          String? url = await selectAndUploadFile('foto_sekretaris_${_namaOrmawaController.text}');
                          _fotoSekretarisUrlController = url;
                          _fotoSekretarisUrlStream.add(url);
                        },
                        onDelete: () {
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
                    stream: _fotoBendaharaUrlStream.stream,
                    builder: (context, snapshot) {
                      String text = snapshot.data ?? "";
                      return CustomFilePickerButton(
                        onTap: () async {
                          String? url = await selectAndUploadFile('foto_bendahara_${_namaOrmawaController.text}');
                          _fotoBendaharaUrlController = url;
                          _fotoBendaharaUrlStream.add(url);
                        },
                        onDelete: () {
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
                        onTap: () => (_namaOrmawaController.text.isNotEmpty && _namaSingkatanController.text.isNotEmpty
                            && _namaPembinaController.text.isNotEmpty && _namaKetuaController.text.isNotEmpty
                            && _namaWakilKetuaController.text.isNotEmpty && _namaSekretarisController.text.isNotEmpty
                            && _namaBendaharaController.text.isNotEmpty && _logoUrlController != ""
                            && _fotoPembinaUrlController != "" && _fotoKetuaUrlController != ""
                            && _fotoWakilKetuaUrlController != "" && _fotoSekretarisUrlController != ""
                            && _fotoBendaharaUrlController != "" && nimList.isNotEmpty
                        ) ?
                        Future.microtask(() {
                          context.read<OrmawaBloc>().add(
                            CreateOrmawaEvent(
                              ormawa: Ormawa(
                                idOrmawa: newId,
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
                              ),
                            ),
                          );
                          context.read<OrmawaBloc>().add(ReadAllOrmawaEvent());
                          mipokaCustomToast("ormawa sudah ditambahkan.");
                          Navigator.pop(context);
                        }) :
                        mipokaCustomToast(emptyFieldMessage),
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
