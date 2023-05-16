import 'package:flutter/material.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_add_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_dropdown_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/mobile_kemahasiswaan_custom_drawer.dart';

class KemahasiswaanMPTMahasiswaKegiatanPerJenisKegiatanPage extends StatefulWidget {
  const KemahasiswaanMPTMahasiswaKegiatanPerJenisKegiatanPage({super.key});

  @override
  State<KemahasiswaanMPTMahasiswaKegiatanPerJenisKegiatanPage> createState() => _KemahasiswaanMPTMahasiswaKegiatanPerJenisKegiatanPageState();
}

class _KemahasiswaanMPTMahasiswaKegiatanPerJenisKegiatanPageState extends State<KemahasiswaanMPTMahasiswaKegiatanPerJenisKegiatanPage> {
  String jenisKegiatan = listBentukKegiatan[0];

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

              const CustomMobileTitle(text: 'Kemahasiswaan - MPT Mahasiswa - Kegiatan per Jenis Kegiatan'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [

                  buildTitle('Total Kegiatan per Jenis Kegiatan : 6'),
                  CustomAddButton(
                    buttonText: 'Tambah',
                    onPressed: () => Navigator.pushNamed(context, mobileKemahasiswaanMPTMahasiswaKegiatanPerJenisKegiatanTambahPageRoute),
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Jenis'),
                  CustomDropdownButton(
                    value: jenisKegiatan,
                    items: listBentukKegiatan,
                    onChanged: (String? value) {
                      setState(() => jenisKegiatan = value!);
                    },
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
                                'Keterangan',
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
                                    child: Text('Keterangan - ${index + 1}',),
                                  ),
                                ),
                                DataCell(
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      IconButton(
                                        onPressed: () => Navigator.pushNamed(context, mobileKemahasiswaanMPTMahasiswaJenisKegiatanTambahPageRoute),
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
