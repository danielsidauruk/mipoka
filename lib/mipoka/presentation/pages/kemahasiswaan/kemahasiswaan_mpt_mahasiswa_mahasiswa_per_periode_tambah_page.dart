import 'dart:io';
import 'dart:async';
import 'package:excel/excel.dart' hide Border;
import 'package:flutter/material.dart';
import 'package:mipoka/core/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/domain/utils/download_file_with_dio.dart';
import 'package:mipoka/mipoka/domain/entities/mhs_per_periode_mpt.dart';
import 'package:mipoka/mipoka/presentation/bloc/mhs_per_periode_mpt_use_cases/mhs_per_periode_mpt_use_cases_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/mipoka_user_by_nim_bloc/mipoka_user_by_nim_bloc.dart';
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
import 'package:mipoka/mipoka/presentation/bloc/periode_mpt_dropdown_bloc/periode_mpt_drop_down_bloc.dart';

class KemahasiswaanMPTMahasiswaMahasiswaPerPeriodeTambahPage extends StatefulWidget {
  const KemahasiswaanMPTMahasiswaMahasiswaPerPeriodeTambahPage({super.key});

  @override
  State<KemahasiswaanMPTMahasiswaMahasiswaPerPeriodeTambahPage> createState() => _KemahasiswaanMPTMahasiswaMahasiswaPerPeriodeTambahPageState();
}

class _KemahasiswaanMPTMahasiswaMahasiswaPerPeriodeTambahPageState
    extends State<KemahasiswaanMPTMahasiswaMahasiswaPerPeriodeTambahPage> {
  final TextEditingController _poinKegiatanController = TextEditingController();
  int? _idPeriodeKegiatanMpt;

  final StreamController<String?> _excelFileStream = StreamController<String?>();
  String? _excelFileController;
  FilePickerResult? result;

  @override
  void initState() {
    context.read<PeriodeMptDropDownBloc>().add(ReadPeriodeMptDropDownEvent());
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              const CustomMobileTitle(text: 'Kemahasiswaan - MPT Mahasiswa - Import Mahasiswa per Periode'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [

                  buildTitle('Periode Kegiatan'),
                  BlocBuilder<PeriodeMptDropDownBloc, PeriodeMptDropDownState>(
                    builder: (context, state) {
                      if (state is PeriodeMptDropDownLoading) {
                        return const Text("Loading ....");
                      } else if (state is PeriodeMptDropDownHasData) {

                        List<String> tahunPeriodeMptList = state.periodeMptList.map(
                                (periodeMptList) => periodeMptList.periodeMengulangMpt == true ?
                            "${periodeMptList.tahunPeriodeMpt} (ulang)" :
                            periodeMptList.tahunPeriodeMpt).toList();

                        List<int> idTahunPeriodeList = state.periodeMptList.map(
                                (periodeMptList) => periodeMptList.idPeriodeMpt).toList();

                        _idPeriodeKegiatanMpt = idTahunPeriodeList[0];

                        return MipokaCustomDropdown(
                            items: tahunPeriodeMptList,
                            initialItem: tahunPeriodeMptList[0],
                            onValueChanged: (value) {
                              int index = tahunPeriodeMptList.indexOf(value!);
                              int idPeriodeMpt = idTahunPeriodeList[index];

                              // print("$idPeriodeMpt, $value");

                              _idPeriodeKegiatanMpt = idPeriodeMpt;
                            }
                        );
                      } else if (state is PeriodeMptDropDownError) {
                        return Text(state.message);
                      } else {
                        return const Text("PeriodeMptBloc hasn't been triggered yet.");
                      }
                    },
                  ),

                  const CustomFieldSpacer(),

                  BlocBuilder<MipokaUserByNimBloc, MipokaUserByNimState>(
                    builder: (context, state) {
                      if (state is MipokaUserByNimByNimHasData) {


                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            state.mipokaUser.idUser,
                            style: const TextStyle(fontSize: 16),
                          ),
                        );
                      } else {
                        return const Text("MipokaUserBlocByNimEvent hasn't been triggered yet");
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
                      url: mhsPerPeriodeTemplate,
                      fileName: "mhs_per_periode_template.xlsx",
                    ),
                  ),

                  const CustomFieldSpacer(),

                  CustomFilterButton(
                    text: 'Proses',
                    onPressed: (){
                      // _processUploadedFile(file)
                      final result = this.result;
                      if (result != null) {
                        // try {
                        //   PlatformFile file = result.files.first;
                        //   _processUploadedFile(file);
                        //
                        //   mipokaCustomToast("Data telah di update.");
                        //   Navigator.pop(context);
                        // }
                      } else {
                        mipokaCustomToast("Harap unggah file yang diperlukan.");
                      }
                    },
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Keterangan Kolom di Excel'),

                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: SingleChildScrollView(
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
                                    child: Text('NIM',),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text('Integer',),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text('False',),
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
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
