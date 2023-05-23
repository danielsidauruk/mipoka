import 'package:flutter/material.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_dropdown_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';

class KemahasiswaanCekUsulanKegiatanPage extends StatelessWidget {
  const KemahasiswaanCekUsulanKegiatanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MipokaMobileAppBar(),
      drawer: const MobileCustomKemahasiswaanDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const CustomMobileTitle(
                text: 'Pengajuan - Cek Usulan Kegiatan'),
            const CustomFieldSpacer(),
            Expanded(
              child: CustomContentBox(
                children: [
                  buildTitle('Status'),

                  CustomDropdownButton(
                    items: listStatus,
                    onValueChanged: (value) {},
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Total Usulan Kegiatan : 2'),

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
                                'Nama Kegiatan',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'File Proposal',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Validasi Pengguna',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Status Pengguna',
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
                                    child: Text('Kegiatan - ${index + 1}',),
                                  ),
                                ),
                                DataCell(
                                  Center(
                                    child: InkWell(
                                      onTap: () {},
                                      child: Image.asset(
                                        'assets/icons/pdf.png',
                                        width: 24,
                                      ),
                                    ),
                                  ),
                                ),

                                DataCell(
                                  Center(
                                    child: index % 2 == 0 ?
                                    Image.asset(
                                      'assets/icons/approve.png',
                                      width: 24,
                                    ) :
                                    Image.asset(
                                      'assets/icons/close.png',
                                      width: 24,
                                    ),
                                  ),
                                ),

                                DataCell(
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Image.asset(
                                          'assets/icons/approve.png',
                                          width: 24,
                                        ),
                                      ),

                                      const SizedBox(width: 8.0,),

                                      InkWell(
                                        onTap: () {},
                                        child: Image.asset(
                                          'assets/icons/close.png',
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
            ),
          ],
        ),
      ),
    );
  }
}
