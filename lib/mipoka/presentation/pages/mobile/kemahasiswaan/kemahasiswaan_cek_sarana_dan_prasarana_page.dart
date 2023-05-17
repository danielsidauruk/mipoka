import 'package:flutter/material.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_dropdown_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';

class KemahasiswaanCekSaranaDanPrasaranaPage extends StatefulWidget {
  const KemahasiswaanCekSaranaDanPrasaranaPage({super.key});

  @override
  State<KemahasiswaanCekSaranaDanPrasaranaPage> createState() =>
      _KemahasiswaanCekSaranaDanPrasaranaPageState();
}

class _KemahasiswaanCekSaranaDanPrasaranaPageState
    extends State<KemahasiswaanCekSaranaDanPrasaranaPage> {
  @override
  Widget build(BuildContext context) {
    String dropDownValue = listStatus[0];

    return Scaffold(
      appBar: const MipokaAppBar(),
      drawer: const MobileCustomKemahasiswaanDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const CustomMobileTitle(
                text: 'Pengajuan - Cek Sarana dan Prasarana'),
            const CustomFieldSpacer(),
            Expanded(
              child: CustomContentBox(
                children: [
                  buildTitle('Status'),

                  CustomDropdownButton(
                    items: listStatus,
                    value: dropDownValue,
                    onChanged: (String? value) {
                      setState(() => dropDownValue = value!);
                    },
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Total Laporan Kegiatan : 2'),

                  const CustomFieldSpacer(height: 4.0),

                  Expanded(
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
                                'No.',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Tanggal',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Nama Pengajuan',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Nama Ormawa',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Hari/Tanggal',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Gedung/Ruang',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Lain-lain',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Pengajuan',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Status',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                          rows: List<DataRow>.generate(12, (int index) {
                            return DataRow(
                              cells: [
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text('${index + 1}',),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text('${index + 1}2 Mei 2023',),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text('Mahasiswa - ${index + 1}',),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text('Ormawa - ${index + 1}',),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text('${index + 1}2 Mei 2023',),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text('Gedung B Ruang - ${index + 1}',),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text('Lain - lain ${index + 1}',),
                                  ),
                                ),
                                const DataCell(
                                  Center(
                                    child: Icon(
                                      Icons.picture_as_pdf,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: const [
                                        Icon(Icons.check, color: Colors.green,),

                                        SizedBox(width: 8.0),

                                        Icon(Icons.cancel_outlined, color: Colors.red,),
                                      ],
                                    ),
                                  )
                                ),
                              ],
                            );
                          }),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
