import 'package:flutter/material.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/button.dart';
import 'package:mipoka/mipoka/presentation/widgets/content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_dropdown_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/mobile_title.dart';

class MobilePenggunaDaftarPengajuanKegiatan extends StatefulWidget {
  const MobilePenggunaDaftarPengajuanKegiatan({super.key});

  @override
  State<MobilePenggunaDaftarPengajuanKegiatan> createState() => _MobilePenggunaDaftarPengajuanKegiatanState();
}

class _MobilePenggunaDaftarPengajuanKegiatanState extends State<MobilePenggunaDaftarPengajuanKegiatan> {
  @override
  Widget build(BuildContext context) {
    String dropDownValue = dropdownItem[0];

    return Scaffold(
      appBar: const MipokaAppBar(),

      drawer: const MobilePenggunaDrawerWidget(),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            const MobileTitle(text: 'Pengajuan - Kegiatan - Usulan Kegiatan'),

            const FieldSpacer(),

            Expanded(
              child: ContentBox(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:[
                      Text(
                        'Status',
                        style: mobileSubTitle,
                      ),
                    ],
                  ),

                  const SizedBox(height: 4.0),

                  CustomDropdownButton(
                    items: dropdownItem,
                    value: dropDownValue,
                    onChanged: (String? value) {
                      setState(() => dropDownValue = value!);
                    },
                  ),

                  const FieldSpacer(),

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
                                'Tanggal Mengirim\nUsulan Kegiatan',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Nama Pengusul',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Nama Kegiatan',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Usulan Kegiatan',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Validasi Pembina',
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
                                  Text(
                                    '${index + 1}',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    'Age $index',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                DataCell(Text('City $index')),
                                DataCell(Text('Country $index')),
                                DataCell(Text('Salary $index')),
                                DataCell(Text('Position $index')),
                                DataCell(Text('Department $index')),
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

            const FieldSpacer(),

            CustomButton(
              navigation: () => Navigator.pushNamed(
                context,
                mobilePenggunaPengajuanUsulanKegiatan1Route,
              ),
              text: 'Ajukan Kegiatan',
            ),
          ],
        ),
      ),
    );
  }
}