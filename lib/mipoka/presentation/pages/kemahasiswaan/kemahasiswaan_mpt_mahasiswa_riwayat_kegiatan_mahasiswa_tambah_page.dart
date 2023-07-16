import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:excel/excel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mipoka/domain/utils/download_file_with_dio.dart';
import 'package:mipoka/mipoka/domain/entities/periode_mpt.dart';
import 'package:mipoka/mipoka/domain/entities/riwayat_kegiatan_mpt.dart';
import 'package:mipoka/mipoka/presentation/bloc/kegiatan_per_periode_mpt_bloc/kegiatan_per_periode_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/mipoka_user_by_nim_bloc/mipoka_user_by_nim_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/periode_mpt_bloc/periode_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/riwayat_kegiatan_mpt_bloc/riwayat_kegiatan_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_filter_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_excel_uploader.dart';

class KemahasiswaanMPTRiwayatKegiatanMahasiswaTambahPage extends StatefulWidget {
  const KemahasiswaanMPTRiwayatKegiatanMahasiswaTambahPage({
    super.key,
  });

  @override
  State<KemahasiswaanMPTRiwayatKegiatanMahasiswaTambahPage> createState() => _KemahasiswaanMPTRiwayatKegiatanMahasiswaTambahPageState();
}

class _KemahasiswaanMPTRiwayatKegiatanMahasiswaTambahPageState extends State<KemahasiswaanMPTRiwayatKegiatanMahasiswaTambahPage> {

  PeriodeMpt? _periodeMpt;
  final StreamController<String?> _excelFileStream = StreamController<String?>.broadcast();
  String? _excelFileController;
  FilePickerResult? result;
  int index = 0;

  List nimList = [];
  List idKegiatanPerPeriodeMptList = [];
  List poinList = [];
  List keteranganList = [];

  @override
  void initState() {
    context.read<PeriodeMptBloc>().add(ReadAllPeriodeMptEvent());
    super.initState();
  }

  @override
  void dispose() {
    Future.microtask(() {
      context.read<PeriodeMptBloc>().close();
      context.read<MipokaUserByNimBloc>().close();
    });
    super.dispose();
  }

  void _processRiwayatKegiatan(PlatformFile file) async {
    Uint8List? bytes;

    nimList = [];
    idKegiatanPerPeriodeMptList = [];
    poinList = [];
    keteranganList = [];
    index = 0;

    if (kIsWeb) {
      bytes = file.bytes;
    } else if (Platform.isAndroid) {
      bytes = await File(file.path!).readAsBytes();
    }

    if (bytes != null) {
      Excel excel = Excel.decodeBytes(bytes);
      Sheet? sheet = excel.tables[excel.tables.keys.first];

      for (var index = 1; index < sheet!.rows.length; index++) {
        var row = sheet.rows[index];
        var nim = row[0]?.value;
        var idKegiatan = row[1]?.value;
        var poin = row[2]?.value;
        var keteranganMahasiswa = row[3]?.value;

        if (nim != null) {
          nimList.add(nim.toString());
        }

        if (idKegiatan != null) {
          idKegiatanPerPeriodeMptList.add(int.parse(idKegiatan.toString()));
        }

        if (poin != null) {
          poinList.add(int.parse(poin.toString()));
        }

        if (keteranganMahasiswa != null) {
          keteranganList.add(keteranganMahasiswa.toString());
        }
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              const CustomMobileTitle(text: 'Kemahasiswaan - MPT Mahasiswa - Impor Riwayat Kegiatan Mahasiswa'),

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

                  buildTitle('Import File'),
                  StreamBuilder<String?>(
                    initialData: _excelFileController,
                    stream: _excelFileStream.stream,
                    builder: (context, snapshot) {
                      String filePath = snapshot.data ?? "";
                      return MipokaExcelUploader(
                        onTap: () async {
                          result = await FilePicker.platform.pickFiles();
                          if (result != null) {
                            PlatformFile file = result!.files.first;
                            _processRiwayatKegiatan(file);
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
                    onPressed: () => downloadFileWithDio(
                      url: riwayatKegiatanTemplate,
                      fileName: "riwatat_kegiatan_template.xlsx",
                    ),
                  ),

                  const CustomFieldSpacer(),

                  CustomFilterButton(
                    text: 'Proses',
                    onPressed: () async {
                      mipokaCustomToast(savingDataMessage);
                      if (result != null) {
                        for (int index = 0; index < nimList.length; index++) {
                          await Future.delayed(const Duration(milliseconds: 1000));
                          if (context.mounted) {
                            BlocProvider.of<MipokaUserByNimBloc>(context, listen: false).add(ReadMipokaUserByNimEvent(nim: nimList[index]));
                            // context.read<MipokaUserByNimBloc>().add(ReadMipokaUserByNimEvent(nim: nimList[index]));
                            context.read<KegiatanPerPeriodeMptBloc>().add(ReadKegiatanPerPeriodeMptEvent(
                                idKegiatanPerPeriodeMpt: idKegiatanPerPeriodeMptList[index]));
                          }
                        }
                      } else {
                        mipokaCustomToast("Harap unggah file yang diperlukan.");
                      }
                    },
                  ),

                  BlocBuilder<MipokaUserByNimBloc, MipokaUserByNimState>(
                    builder: (context, userState) {
                      if (userState is MipokaUserByNimLoading) {
                        print ("Loading ...");
                        return const SizedBox();
                      } else if (userState is MipokaUserByNimByNimHasData) {
                        return BlocBuilder<KegiatanPerPeriodeMptBloc, KegiatanPerPeriodeMptState>(
                          builder: (context, state) {
                            if (state is KegiatanPerPeriodeMptHasData) {
                              final mipokaUser = userState.mipokaUser;
                              final kegiatanPerPeriodeMpt = state.kegiatanPerPeriodeMpt;

                              int randomId = Random().nextInt(1000000);
                              context.read<RiwayatKegiatanMptBloc>().add(
                                CreateRiwayatKegiatanMptEvent(
                                  riwayatKegiatanMpt: RiwayatKegiatanMpt(
                                    idRiwayatKegiatanMpt: randomId,
                                    kegiatanPerPeriodeMpt: kegiatanPerPeriodeMpt.copyWith(
                                      pointMptDiperoleh: poinList[index],
                                    ),
                                    mipokaUser: mipokaUser,
                                    statusMpt: "",
                                    fileSertifikatMpt: "",
                                    hash: "",
                                    keteranganMhs: "",
                                    keteranganSa: keteranganList[index],
                                    createdAt: currentDate,
                                    createdBy: user?.email ?? "unknown",
                                    updatedAt: currentDate,
                                    updatedBy: user?.email ?? "unknown",
                                  ),
                                ),
                              );
                              index++;
                              return const SizedBox();
                            } else if (state is KegiatanPerPeriodeMptError) {
                              print (state.message);
                              return const SizedBox();
                            } else {
                              print ("KegiatanPerPeriodeMpt hasn't been triggered yet.");
                              return const SizedBox();
                            }
                          },
                        );

                      } else if (userState is MipokaUserByNimError) {
                        return Text(userState.message);
                      } else {
                        if (kDebugMode) {
                          print("MhsPerPeriode hasn't been triggered yet.");
                        }
                        return const SizedBox();
                      }
                    },
                  ),

                  const CustomFieldSpacer(),

                  Table(
                    border: TableBorder.all(color: Colors.white),
                    children: const [
                      TableRow(
                        children: [
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Nama Kolom',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Usia Tipe Data',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Null',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'NIM',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Integer',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'False',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'ID Kegiatan',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Integer',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'False',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Poin',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Integer',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'False',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Keterangan Kemahasiswaan',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'String',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'True',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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