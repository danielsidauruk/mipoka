import 'package:flutter/material.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_add_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_dropdown_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_filter_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_icon_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';

class KemahasiswaanMPTMahasiswaMahasiswaPerPeriodePage extends StatefulWidget {
  const KemahasiswaanMPTMahasiswaMahasiswaPerPeriodePage({super.key});

  @override
  State<KemahasiswaanMPTMahasiswaMahasiswaPerPeriodePage> createState() => _KemahasiswaanMPTMahasiswaMahasiswaPerPeriodePageState();
}

class _KemahasiswaanMPTMahasiswaMahasiswaPerPeriodePageState extends State<KemahasiswaanMPTMahasiswaMahasiswaPerPeriodePage> {
  String yearValue = DateTime.now().year.toString();
  String bentukKegiatanValue = listBentukKegiatan[0];
  String namaKegiatanValue = listNamaKegiatan[0];
  String prodiValue = listProdi[0];
  final TextEditingController _jumlahPoinController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MipokaAppBar(),

      drawer: const MobileCustomKemahasiswaanDrawer(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              const CustomMobileTitle(text: 'Kemahasiswaan - MPT Mahasiswa - Mahasiswa Per Periode'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [

                  buildTitle('Total Kegiatan per Jenis Kegiatan : 6'),
                  CustomAddButton(
                    buttonText: 'Tambah',
                    onPressed: () => Navigator.pushNamed(context, kemahasiswaanMPTMahasiswaMahasiswaPerPeriodeTambahPageRoute),
                  ),

                  const CustomFieldSpacer(),

                  CustomFilterButton(
                    text: 'Export',
                    onPressed: (){},
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Periode'),
                  CustomDropdownButton(
                    value: yearValue,
                    items: years,
                    onChanged: (String? value) {
                      setState(() => yearValue = value!);
                    },
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Prodi'),
                  CustomDropdownButton(
                    value: prodiValue,
                    items: listProdi,
                    onChanged: (String? value) {
                      setState(() => prodiValue = value!);
                    },
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Jumlah Poin'),
                  CustomTextField(controller: _jumlahPoinController),

                  const CustomFieldSpacer(),

                  buildTitle('NIM'),
                  CustomTextField(controller: _nimController),

                  const CustomFieldSpacer(),

                  CustomFilterButton(
                    text: 'Filter',
                    onPressed: () {},
                  ),

                  const CustomFieldSpacer(),

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
                                'Periode',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Periode',
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
                                'Nama',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Poin',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DataColumn(
                              tooltip: 'Aksi yang akan dilakukan',
                              label: Text(
                                'Aksi',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],

                          rows: List<DataRow>.generate(6, (int index) {
                            return DataRow(
                              cells: [
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text('2023 (ulang)',),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text('Manajemen',),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text('21111${index + 1}342',),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text('Mahasiswa ${(index + 1) * 2}',),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text('${index + 7}',),
                                  ),
                                ),
                                DataCell(
                                  IconButton(
                                    onPressed: (){},
                                    icon: const Icon(Icons.delete, color: Colors.red),
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
            ],
          ),
        ),
      ),
    );
  }
}
