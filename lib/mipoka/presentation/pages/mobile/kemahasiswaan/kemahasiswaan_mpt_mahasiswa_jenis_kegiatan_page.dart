import 'package:flutter/material.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_add_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';

class MobileKemahasiswaanMPTMahasiswaJenisKegiatanPage extends StatefulWidget {
  const MobileKemahasiswaanMPTMahasiswaJenisKegiatanPage({super.key});

  @override
  State<MobileKemahasiswaanMPTMahasiswaJenisKegiatanPage> createState() =>
      _MobileKemahasiswaanMPTMahasiswaJenisKegiatanPageState();
}

class _MobileKemahasiswaanMPTMahasiswaJenisKegiatanPageState
    extends State<MobileKemahasiswaanMPTMahasiswaJenisKegiatanPage> {
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
              const CustomMobileTitle(
                  text: 'Kemahasiswaan - MPT Mahasiswa - Jenis Kegiatan'),
              const CustomFieldSpacer(),
              CustomContentBox(
                children: [
                  buildTitle('Total Jenis Kegiatan : 6'),
                  CustomAddButton(
                    buttonText: 'Tambah',
                    onPressed: () => Navigator.pushNamed(context,
                        kemahasiswaanMPTMahasiswaJenisKegiatanTambahPageRoute),
                  ),
                  const CustomFieldSpacer(height: 8.0),
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
                                'Nama Jenis Kegiatan',
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
                                    child: Text(
                                      'Jenis Kegiatan - ${index + 1}',
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      IconButton(
                                        onPressed: () => Navigator.pushNamed(
                                            context,
                                            kemahasiswaanMPTMahasiswaJenisKegiatanTambahPageRoute),
                                        icon: const Icon(Icons.edit,
                                            color: Colors.yellow),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.delete,
                                            color: Colors.red),
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
