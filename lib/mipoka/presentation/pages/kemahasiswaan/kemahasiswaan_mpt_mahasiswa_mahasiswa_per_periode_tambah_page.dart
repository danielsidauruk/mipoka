import 'package:flutter/material.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_dropdown_button.dart';
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

class _KemahasiswaanMPTMahasiswaMahasiswaPerPeriodeTambahPageState extends State<KemahasiswaanMPTMahasiswaMahasiswaPerPeriodeTambahPage> {
  String yearValue = DateTime.now().year.toString();
  DateTime? tanggalMulai;
  DateTime? tanggalSelesai;
  final TextEditingController _poinKegiatanController = TextEditingController();

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

                  buildTitle('Periode'),
                  CustomDropdownButton(
                    items: years,
                    onValueChanged: (value) {},
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Impor File'),
                  CustomFilePickerButton(onTap: () {}),


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
                      CustomButton(
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
