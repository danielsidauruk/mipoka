import 'package:flutter/material.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_add_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_filter_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';

class KemahasiswaanMPTMahasiswaRiwayatKegiatanMahasiswaPage extends StatefulWidget {
  const KemahasiswaanMPTMahasiswaRiwayatKegiatanMahasiswaPage({super.key});

  @override
  State<KemahasiswaanMPTMahasiswaRiwayatKegiatanMahasiswaPage> createState() => _KemahasiswaanMPTMahasiswaRiwayatKegiatanMahasiswaPageState();
}

class _KemahasiswaanMPTMahasiswaRiwayatKegiatanMahasiswaPageState extends State<KemahasiswaanMPTMahasiswaRiwayatKegiatanMahasiswaPage> {
  String yearValue = DateTime.now().year.toString();
  final TextEditingController _nimController = TextEditingController();
  String jenisKegiatanValue = listBentukKegiatan[0];
  String namaKegiatanValue = listNamaKegiatan[0];
  String statusValue = listStatus[0];
  bool isChecked = false;

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

              const CustomMobileTitle(text: 'Kemahasiswaan - MPT Mahasiswa - Riwayat Kegiatan Mahasiswa'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [

                  buildTitle('Total Kegiatan per Jenis Kegiatan : 6'),
                  CustomAddButton(
                    buttonText: 'Tambah',
                    onPressed: () => Navigator.pushNamed(context, kemahasiswaanMPTMahasiswaRiwayatKegiatanMahasiswaTambahPageRoute),
                  ),

                  const CustomFieldSpacer(),

                  CustomFilterButton(
                    text: 'Export',
                    onPressed: (){},
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Periode'),
                  MipokaCustomDropdown(
                    items: years,
                    onValueChanged: (value) {},
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Jenis'),
                  MipokaCustomDropdown(
                    items: listBentukKegiatan,
                    onValueChanged: (value) {},
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Kegiatan'),
                  MipokaCustomDropdown(
                    items: listNamaKegiatan,
                    onValueChanged: (value) {},
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Status'),
                  MipokaCustomDropdown(
                    items: listStatus,
                    onValueChanged: (value) {},
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('NIM'),
                  CustomTextField(controller: _nimController),

                  const CustomFieldSpacer(),

                  buildTitle('Kelompok Berdasarkan'),
                  Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.black,
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),

                      const Text('Jenis Kegiatan'),
                    ],
                  ),

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
                                'Nama Kegiatan',
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
                                'Poin',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Unggahan',
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
                                    child: InkWell(
                                      onTap: () => Navigator.pushNamed(context, kemahasiswaanMPTMahasiswaRiwayatKegiatanMahasiswaDetailPageRoute),
                                      child: Text(
                                        '21111${index + 1}342',
                                        style: const TextStyle(
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text('Mahasiswa ${index + 1}',),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text('Nama Kegiatan ${index + 1}',),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text('Jenis Kegiatan ${index + 1}',),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text('${index + 20}',),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      'assets/icons/pdf.png',
                                      width: 24,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      'assets/icons/approve.png',
                                      width: 24,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () => Navigator.pushNamed(context, kemahasiswaanMPTMahasiswaRiwayatKegiatanMahasiswaTambahPageRoute),
                                        child: Image.asset(
                                          'assets/icons/edit.png',
                                          width: 24,
                                        ),
                                      ),

                                      const SizedBox(width: 8.0,),

                                      InkWell(
                                        onTap: () => Navigator.pushNamed(context, kemahasiswaanMPTMahasiswaRiwayatKegiatanMahasiswaTambahPageRoute),
                                        child: Image.asset(
                                          'assets/icons/approve.png',
                                          width: 24,
                                        ),
                                      ),

                                      const SizedBox(width: 8.0,),

                                      InkWell(
                                        onTap: () => Navigator.pushNamed(context, kemahasiswaanMPTMahasiswaRiwayatKegiatanMahasiswaTambahPageRoute),
                                        child: Image.asset(
                                          'assets/icons/delete.png',
                                          width: 24,
                                        ),
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
