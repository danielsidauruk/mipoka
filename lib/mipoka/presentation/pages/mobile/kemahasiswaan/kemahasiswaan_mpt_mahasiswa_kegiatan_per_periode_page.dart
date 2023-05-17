import 'package:flutter/material.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_add_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_dropdown_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_filter_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';

class KemahasiswaanMPTMahasiswaKegiatanPerPeriodePage extends StatefulWidget {
  const KemahasiswaanMPTMahasiswaKegiatanPerPeriodePage({super.key});

  @override
  State<KemahasiswaanMPTMahasiswaKegiatanPerPeriodePage> createState() => _KemahasiswaanMPTMahasiswaKegiatanPerPeriodePageState();
}

class _KemahasiswaanMPTMahasiswaKegiatanPerPeriodePageState extends State<KemahasiswaanMPTMahasiswaKegiatanPerPeriodePage> {
  String jenis = listBentukKegiatan[0];
  String kegiatan = listNamaKegiatan[0];

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

              const CustomMobileTitle(text: 'Kemahasiswaan - MPT Mahasiswa - Kegiatan per Periode'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [

                  buildTitle('Total Kegiatan per Jenis Kegiatan : 6'),
                  CustomAddButton(
                    buttonText: 'Tambah',
                    onPressed: () => Navigator.pushNamed(context, kemahasiswaanMPTMahasiswaKegiatanPerPeriodeTambahPageRoute),
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Jenis'),
                  CustomDropdownButton(
                    value: jenis,
                    items: listBentukKegiatan,
                    onChanged: (String? value) {
                      setState(() => jenis = value!);
                    },
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Kegiatan'),
                  CustomDropdownButton(
                    value: kegiatan,
                    items: listNamaKegiatan,
                    onChanged: (String? value) {
                      setState(() => kegiatan = value!);
                    },
                  ),

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
                                'Jenis Kegiatan',
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
                                'Poin',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Waktu Mulai',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Waktu Selesai',
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
                                    child: Text('Jenis Kegiatan - ${index + 1}',),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text('Nama Kegiatan - ${index + 1}',),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text('${(index + 1) * 2}',),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text('${index + 1} Mei 2023',),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text('${index + 3} Mei 2023',),
                                  ),
                                ),
                                DataCell(
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      IconButton(
                                        onPressed: () => Navigator.pushNamed(context, kemahasiswaanMPTMahasiswaKegiatanPerPeriodeTambahPageRoute),
                                        icon: const Icon(Icons.edit, color: Colors.yellow),
                                      ),

                                      IconButton(
                                        onPressed: (){},
                                        icon: const Icon(Icons.delete, color: Colors.red),
                                      ),
                                    ],
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
