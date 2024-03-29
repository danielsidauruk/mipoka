import 'dart:io';
import 'dart:async';
import 'package:excel/excel.dart' hide Border;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/core/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/domain/utils/download_file_with_dio.dart';
import 'package:mipoka/domain/utils/uniqe_id_generator.dart';
import 'package:mipoka/domain/utils/url_utils.dart';
import 'package:mipoka/mipoka/domain/entities/mhs_per_periode_mpt.dart';
import 'package:mipoka/mipoka/domain/entities/periode_mpt.dart';
import 'package:mipoka/mipoka/presentation/bloc/mhs_per_periode_mpt_use_cases/mhs_per_periode_mpt_use_cases_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/mipoka_user_by_nim_bloc/mipoka_user_by_nim_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/periode_mpt_bloc/periode_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_filter_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_excel_uploader.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';

class KemahasiswaanMPTMahasiswaMahasiswaPerPeriodeTambahPage extends StatefulWidget {
  const KemahasiswaanMPTMahasiswaMahasiswaPerPeriodeTambahPage({super.key});

  @override
  State<KemahasiswaanMPTMahasiswaMahasiswaPerPeriodeTambahPage> createState() => _KemahasiswaanMPTMahasiswaMahasiswaPerPeriodeTambahPageState();
}

class _KemahasiswaanMPTMahasiswaMahasiswaPerPeriodeTambahPageState
    extends State<KemahasiswaanMPTMahasiswaMahasiswaPerPeriodeTambahPage> {

  PeriodeMpt? _periodeMpt;
  List nimList = [];
  String nim = "";
  User? user = FirebaseAuth.instance.currentUser;

  int? index;

  final StreamController<String?> _excelFileStream = StreamController<String?>();
  String? _excelFileController;
  FilePickerResult? result;

  @override
  void initState() {
    context.read<PeriodeMptBloc>().add(ReadAllPeriodeMptEvent());
    context.read<MhsPerPeriodeMptBloc>().add(const ReadAllMhsPerPeriodeMptEvent());
    super.initState();
  }

  @override
  void dispose() {
    context.read<PeriodeMptBloc>().close();
    context.read<MipokaUserByNimBloc>().close();
    context.read<MhsPerPeriodeMptBloc>().close();
    super.dispose();
  }

  void _processMahasiswaPerPeriode(PlatformFile file) async {
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

      for (int i = 1; i < sheet!.rows.length; i++) {
        var row = sheet.rows[i];
        var nim = row[0]?.value;

        if (nim != null) {
          nimList.add(nim.toString());
        }
      }
    }
    print ("NimList : $nimList");
  }

  @override
  Widget build(BuildContext context) {

    print ("Result : $result");
    return Scaffold(
      appBar: MipokaMobileAppBar(
        onRefresh: () {
          mipokaCustomToast(refreshMessage);
          context.read<PeriodeMptBloc>().add(ReadAllPeriodeMptEvent());
          context.read<MhsPerPeriodeMptBloc>().add(const ReadAllMhsPerPeriodeMptEvent());
        },
      ),

      drawer: const CustomKemahasiswaanDrawer(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              const CustomMobileTitle(text: 'Kemahasiswaan - MPT Mahasiswa - Import Mahasiswa per Periode'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [

                  buildTitle('Periode Kegiatan'),
                  BlocBuilder<PeriodeMptBloc, PeriodeMptState>(
                    builder: (context, state) {
                      if (state is PeriodeMptLoading) {
                        return const Text("Loading ....");
                      } else if (state is AllPeriodeMptHasData) {

                        final periodeMptList = state.periodeMptList;
                        final tahunPeriodeMptList = periodeMptList.map((periodeMpt) {
                          return periodeMpt.periodeMengulangMpt ? "${periodeMpt.tahunPeriodeMpt} (ulang)" : periodeMpt.tahunPeriodeMpt;
                        }).toList();

                        _periodeMpt ??= periodeMptList[0];

                        return MipokaCustomDropdown(
                          items: tahunPeriodeMptList,
                          onValueChanged: (value) {
                            int index = tahunPeriodeMptList.indexOf(value!);
                            _periodeMpt = periodeMptList[index];
                          },
                        );

                      } else if (state is PeriodeMptError) {
                        return Text(state.message);
                      } else {
                        return const Text("PeriodeMptBloc hasn't been triggered yet.");
                      }
                    },
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Impor File'),

                  StreamBuilder<String?>(
                    initialData: _excelFileController,
                    stream: _excelFileStream.stream,
                    builder: (context, snapshot) {
                      String filePath = snapshot.data ?? "";
                      return MipokaExcelUploader(
                        onTap: () async {
                          result = await FilePicker.platform.pickFiles(
                            type: FileType.custom,
                            allowedExtensions: ['xlsx'],
                          );
                          if (result != null){
                            PlatformFile file = result!.files.first;
                            _processMahasiswaPerPeriode(file);
                            _excelFileStream.add(file.name);
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
                        fileName: getFileNameFromUrl(nimTemplate),
                      );
                    }
                  ),

                  const CustomFieldSpacer(),

                  BlocBuilder<MhsPerPeriodeMptBloc, MhsPerPeriodeMptState>(
                    builder: (context, state) {
                      if (state is MhsPerPeriodeMptLoading) {
                        return const Text("Loading...");
                      } else if (state is AllMhsPerPeriodeMptHasData) {
                        final mhsPerPeriodeMptList = state.mhsPerPeriodeMptList;

                        final nimPerPeriodeMpt = mhsPerPeriodeMptList
                            .map((mhs) => mhs.mipokaUser.nim)
                            .toList();

                        return CustomFilterButton(
                          text: 'Proses',
                          onPressed: () async {
                            mipokaCustomToast(savingDataMessage);

                            if (result != null) {
                              for (var index = 0; index < nimList.length; index++) {

                                if(nimPerPeriodeMpt.contains(nimList[index]) == false) {
                                  context.read<MipokaUserByNimBloc>().add(ReadMipokaUserByNimEvent(nim: nimList[index]));
                                  await Future.delayed(const Duration(seconds: 2));
                                  this.index = index;
                                } else if (nimPerPeriodeMpt.contains(nimList[index])) {
                                  nimList.removeAt(index);
                                  mipokaCustomToast("${nimList[index]} sudah terdaftar sebelumnya.");
                                }
                              }
                            } else {
                              mipokaCustomToast("Harap unggah file yang diperlukan.");
                            }
                          },
                        );
                      } else if (state is MhsPerPeriodeMptError) {
                        mipokaCustomToast("$nim tidak terdaftar");
                        return const SizedBox();
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),

                  BlocListener<MipokaUserByNimBloc, MipokaUserByNimState>(
                    listenWhen: (prev, current) =>
                    prev.runtimeType != current.runtimeType,
                    listener: (context, state) {
                      if (result != null) {
                        if (state is MipokaUserByNimLoading) {
                          if (kDebugMode) {
                            print ("Loading ...");
                          }
                        } else if (state is MipokaUserByNimHasData) {
                          int uniqueId = UniqueIdGenerator.generateUniqueId();
                          String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

                          context.read<MhsPerPeriodeMptBloc>().add(
                            CreateMhsPerPeriodeMptEvent(
                              mhsPerPeriodeMpt: MhsPerPeriodeMpt(
                                idMhsPerPeriodeMpt: uniqueId,
                                mipokaUser: state.mipokaUser,
                                periodeMpt: _periodeMpt!,
                                createdAt: currentDate,
                                createdBy: user?.email ?? "unknown",
                                updatedAt: currentDate,
                                updatedBy: user?.email ?? "unknown",
                              ),
                            ),
                          );
                          print(nimList.length);

                          if (index == nimList.length - 1) {
                            mipokaCustomToast("Mahasiswa Per Periode telah ditambahkan.");
                          }
                        } else if (state is MipokaUserByNimError) {
                        } else {
                          if (kDebugMode) {
                            print("MhsPerPeriode hasn't been triggered yet.");
                          }
                        }
                      }
                    },
                    child: const SizedBox(),
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Keterangan Kolom di Excel'),

                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columnSpacing: 40,
                        border: TableBorder.all(color: Colors.white),
                        columns: const [
                          DataColumn(
                            label: Text(
                              'Nama Kolom',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Tipe Data',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Null',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],

                        rows: List<DataRow>.generate(1, (int index) {
                          return const DataRow(
                            cells: [
                              DataCell(
                                Align(
                                  alignment: Alignment.center,
                                  child: Text('NIM'),
                                ),
                              ),
                              DataCell(
                                Align(
                                  alignment: Alignment.center,
                                  child: Text('Integer'),
                                ),
                              ),
                              DataCell(
                                Align(
                                  alignment: Alignment.center,
                                  child: Text('False'),
                                ),
                              ),
                            ],
                          );
                        }),
                      ),
                    ),
                  ),

                  const CustomFieldSpacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomMipokaButton(
                        onTap: () => Navigator.pop(context),
                        text: 'Kembali',
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
