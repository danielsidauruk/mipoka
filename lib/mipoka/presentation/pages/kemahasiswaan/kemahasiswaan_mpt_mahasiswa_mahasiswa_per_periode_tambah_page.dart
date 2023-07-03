import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/bloc/periode_mpt_dropdown_bloc/periode_mpt_drop_down_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_picker.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_filter_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_icon_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';

class KemahasiswaanMPTMahasiswaMahasiswaPerPeriodeTambahPage extends StatefulWidget {
  const KemahasiswaanMPTMahasiswaMahasiswaPerPeriodeTambahPage({super.key});

  @override
  State<KemahasiswaanMPTMahasiswaMahasiswaPerPeriodeTambahPage> createState() => _KemahasiswaanMPTMahasiswaMahasiswaPerPeriodeTambahPageState();
}

class _KemahasiswaanMPTMahasiswaMahasiswaPerPeriodeTambahPageState
    extends State<KemahasiswaanMPTMahasiswaMahasiswaPerPeriodeTambahPage> {
  final TextEditingController _poinKegiatanController = TextEditingController();
  late int idPeriodeKegiatanMpt;

  @override
  void initState() {
    idPeriodeKegiatanMpt = 0;
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

              const CustomMobileTitle(text: 'Kemahasiswaan - MPT Mahasiswa - Impor Mahasiswa per Periode'),

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
                        tahunPeriodeMptList.insert(0, "semua");

                        List<int> idTahunPeriodeList = state.periodeMptList.map(
                                (periodeMptList) => periodeMptList.idPeriodeMpt).toList();
                        idTahunPeriodeList.insert(0, 0);

                        return MipokaCustomDropdown(
                            items: tahunPeriodeMptList,
                            onValueChanged: (value) {
                              int index = tahunPeriodeMptList.indexOf(value!);
                              int idPeriodeMpt = idTahunPeriodeList[index];

                              // print("$idPeriodeMpt, $value");

                              idPeriodeKegiatanMpt = idPeriodeMpt;
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

                  buildTitle('Impor File'),
                  // CustomFilePickerButton(onTap: () {}),


                  const CustomFieldSpacer(),
                  
                  CustomFilterButton(text: 'Export Template', onPressed: (){}),

                  const CustomFieldSpacer(),

                  CustomFilterButton(text: 'Proses', onPressed: (){}),

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
                            return DataRow(
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
