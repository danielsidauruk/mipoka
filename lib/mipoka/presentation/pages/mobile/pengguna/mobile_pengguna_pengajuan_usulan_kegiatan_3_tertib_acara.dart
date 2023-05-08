import 'package:flutter/material.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_add_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';

class MobilePenggunaPengajuanUsulanKegiatan3TertibAcara extends StatelessWidget {
  const MobilePenggunaPengajuanUsulanKegiatan3TertibAcara({super.key});

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

            const CustomMobileTitle(text: 'Pengajuan - Kegiatan - Usulan Kegiatan'),

            const CustomFieldSpacer(),

            Expanded(
              child: CustomContentBox(
                children: [
                  buildTitle('Tertib Acara'),

                  buildDescription('Rincikan alur dari kegiatan yang akan dilaksanakan'),

                  CustomAddButton(
                    buttonText: 'Tertib Acara',
                    onPressed: () => Navigator.pushNamed(context, mobilePenggunaPengajuanUsulanKegiatan3TertibAcaraTambahRoute),
                  ),

                  const CustomFieldSpacer(),

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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomButton(
                        navigation: () => Navigator.pop(context),
                        text: 'Kembali',
                      ),

                      const SizedBox(width: 8.0),

                      CustomButton(
                        navigation: () => Navigator.pop(context),
                        text: 'Tambahkan',
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column buildDescription(String text) {
    return Column(
      children: [
        Text(
          text,
          style: const TextStyle(color: Colors.grey),
        ),

        const SizedBox(height: 4.0),
      ],
    );
  }
}
