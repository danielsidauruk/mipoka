import 'dart:async';
import 'dart:io';
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
import 'package:mipoka/mipoka/presentation/bloc/periode_mpt_dropdown_bloc/periode_mpt_drop_down_bloc.dart';
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

  List nimList = [];
  List idKegiatanList = [];
  List poinList = [];
  List keteranganList = [];

  @override
  void initState() {
    context.read<PeriodeMptDropDownBloc>().add(ReadPeriodeMptDropDownEvent());
    super.initState();
  }

  @override
  void dispose() {
    context.read<PeriodeMptDropDownBloc>().close();
    super.dispose();
  }

  void _processRiwayatKegiatan(PlatformFile file) async {
    Uint8List? bytes;

    if (kIsWeb) {
      bytes = file.bytes;
    } else if (Platform.isAndroid) {
      bytes = await File(file.path!).readAsBytes();
    }

    if (bytes != null) {
      Excel excel = Excel.decodeBytes(bytes);
      Sheet? sheet = excel.tables[excel.tables.keys.first];

      for (var row in sheet!.rows) {
        var nim = row[0]?.value;
        var idKegiatan = row[1]?.value;
        var poin = row[2]?.value;
        var keteranganMahasiswa = row[3]?.value;

        if (nim != null) {
          nimList.add(nim);
        }

        if (nim != null) {
          idKegiatanList.add(idKegiatan);
        }

        if (poin != null) {
          poinList.add(poin);
        }

        if (keteranganMahasiswa != null) {
          keteranganList.add(keteranganMahasiswa);
        }
      }

      // for (var i = 1; i < nimList.length; i++) {
      //   Future.microtask(() => context.read<RiwayatKegiatanMptBloc>().add(
      //     CreateRiwayatKegiatanMptEvent(riwayatKegiatanMpt: RiwayatKegiatanMpt(
      //       idRiwayatKegiatanMpt: newId + i,
      //       kegiatanPerPeriodeMpt: _periodeMpt,
      //       idUser: nimList[i].toString(),
      //       statusMpt: "",
      //       fileSertifikatMpt: "",
      //       hash: "",
      //       keteranganMhs: "",
      //       keteranganSa: "",
      //       createdAt: currentDate,
      //       createdBy: user?.email ?? "unknown",
      //       updatedAt: currentDate,
      //       updatedBy: user?.email ?? "unknown",
      //     ),
      //     ),
      //   ));
      // }
    }

    Future.microtask(() => context.read<RiwayatKegiatanMptBloc>()
        .add(const ReadAllRiwayatKegiatanMptEvent()));
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
                  // BlocBuilder<PeriodeMptDropDownBloc, PeriodeMptDropDownState>(
                  //   builder: (context, state) {
                  //     if (state is PeriodeMptDropDownLoading) {
                  //       return const Text("Loading ....");
                  //     } else if (state is PeriodeMptDropDownHasData) {
                  //
                  //       List<String> tahunPeriodeMptList = state.periodeMptList.map(
                  //               (periodeMptList) => periodeMptList.periodeMengulangMpt == true ?
                  //           "${periodeMptList.tahunPeriodeMpt} (ulang)" :
                  //           periodeMptList.tahunPeriodeMpt).toList();
                  //
                  //       List<int> idTahunPeriodeList = state.periodeMptList.map(
                  //               (periodeMptList) => periodeMptList.idPeriodeMpt).toList();
                  //
                  //       _periodeMpt = idTahunPeriodeList[0];
                  //
                  //       return MipokaCustomDropdown(
                  //           items: tahunPeriodeMptList,
                  //           onValueChanged: (value) {
                  //             int index = tahunPeriodeMptList.indexOf(value!);
                  //             int idPeriodeMpt = idTahunPeriodeList[index];
                  //
                  //             _periodeMpt = idPeriodeMpt;
                  //           }
                  //       );
                  //     } else if (state is PeriodeMptDropDownError) {
                  //       return Text(state.message);
                  //     } else {
                  //       return const Text("PeriodeMptBloc hasn't been triggered yet.");
                  //     }
                  //   },
                  // ),

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
                          if (result != null){
                            _excelFileStream.add(result?.files.first.name);
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
                      onPressed: () => Future.microtask(() {
                        final result = this.result;
                        if (result != null) {
                          PlatformFile file = result.files.first;
                          Future.microtask(() {
                            _processRiwayatKegiatan(file);
                            mipokaCustomToast("Data telah di update.");
                            // context.read<RiwayatKegiatanMptBloc>().add(const ReadAllRiwayatKegiatanMptEvent());
                            Navigator.pop(context);
                          });
                        } else {
                          mipokaCustomToast("Harap unggah file yang diperlukan.");
                        }
                      }),
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
                                'Keterangan Mahasiswa',
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