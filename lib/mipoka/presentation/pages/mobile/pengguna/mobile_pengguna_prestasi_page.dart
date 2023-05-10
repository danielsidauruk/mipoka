import 'package:flutter/material.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_dropdown_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';

class MobilePenggunaPrestasiPage extends StatefulWidget {
  const MobilePenggunaPrestasiPage({super.key});

  @override
  State<MobilePenggunaPrestasiPage> createState() => _MobilePenggunaPrestasiPageState();
}

class _MobilePenggunaPrestasiPageState extends State<MobilePenggunaPrestasiPage> {

  final List<String> years = List.generate(10, (index) =>
      (DateTime.now().year - index).toString(),
  );

  String namaOrmawaValue = listNamaOrmawa[0];
  String yearValue = DateTime.now().year.toString();
  String tingkatValue = tingkatList[0];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const MipokaAppBar(),

      drawer: const MobileCustomPenggunaDrawerWidget(),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            const CustomMobileTitle(text: 'Prestasi'),

            const CustomFieldSpacer(),

            Expanded(
              child: CustomContentBox(
                children: [

                  buildTitle('Nama Ormawa'),
                  CustomDropdownButton(
                    items: listNamaOrmawa,
                    value: namaOrmawaValue,
                    onChanged: (String? value) {
                      setState(() => namaOrmawaValue = value!);
                    },
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Tahun'),
                  CustomDropdownButton(
                    items: years,
                    value: yearValue,
                    onChanged: (String? value) {
                      setState(() => yearValue = value!);
                    },
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Tingkat'),
                  CustomDropdownButton(
                    items: tingkatList,
                    value: tingkatValue,
                    onChanged: (String? value) {
                      setState(() => tingkatValue = value!);
                    },
                  ),

                  const CustomFieldSpacer(),

                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      constraints: const BoxConstraints(minHeight: 35.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: const Text(
                        'Saring',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                  const CustomFieldSpacer(),

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
                                'NIM',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Nama Mahasiswa',
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
                                'Waktu Penyelenggaraan',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Tingkat',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Prestasi yang Dicapai',
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
                                    child: Text(
                                      '${index + 1}',
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '19111000${index + 1}',
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Mahasiswa ${index + 1}',
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Kegiatan ${index + 1}',
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '${index + 1} Mei 2023',
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Tingkat - ${index + 1}',
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Level ${index + 1}',
                                    ),
                                  ),
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