import 'package:flutter/material.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_comment_for_table.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/pemeriksa/pemeriksa_custom_drawer.dart';

class MobilePemeriksaPengajuanUsulanKegiatan3TertibAcara extends StatefulWidget {
  const MobilePemeriksaPengajuanUsulanKegiatan3TertibAcara({super.key});

  @override
  State<MobilePemeriksaPengajuanUsulanKegiatan3TertibAcara> createState() => _MobilePemeriksaPengajuanUsulanKegiatan3TertibAcaraState();
}

class _MobilePemeriksaPengajuanUsulanKegiatan3TertibAcaraState extends State<MobilePemeriksaPengajuanUsulanKegiatan3TertibAcara> {
  final TextEditingController _tertibAcaraController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MipokaAppBar(),

      drawer: const MobileCustomPemeriksaDrawer(),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            const CustomMobileTitle(text: 'Pemeriksa - Kegiatan - Usulan Kegiatan'),

            const CustomFieldSpacer(),

            Expanded(
              child: CustomContentBox(
                children: [

                  CustomCommentForTable(
                    title: 'Tertib Acara',
                    controller: _tertibAcaraController,
                  ),

                  Expanded(
                    child: Container(
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
                                  'No.',
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
                                label: Text(
                                  'Aktivitas',
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
                                ],
                              );
                            }),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const CustomFieldSpacer(),

                  CustomButton(
                    onTap: () => Navigator.pop(context),
                    text: 'Kembali',
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
