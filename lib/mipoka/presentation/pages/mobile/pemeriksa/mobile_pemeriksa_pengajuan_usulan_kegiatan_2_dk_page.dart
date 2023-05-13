import 'package:flutter/material.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_comment_for_table.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';

// => Fixed ContentBox

class MobilePemeriksaPengajuanUsulanKegiatan2DKPage extends StatefulWidget {
  const MobilePemeriksaPengajuanUsulanKegiatan2DKPage({super.key});

  @override
  State<MobilePemeriksaPengajuanUsulanKegiatan2DKPage> createState() => _MobilePemeriksaPengajuanUsulanKegiatan2DKPageState();
}

class _MobilePemeriksaPengajuanUsulanKegiatan2DKPageState extends State<MobilePemeriksaPengajuanUsulanKegiatan2DKPage> {
  final TextEditingController _dataPesertaKegiatanDalamKotaController = TextEditingController();
  final TextEditingController _rincianBiayaKegiatanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isEditing = false;
    return Scaffold(
      appBar: const MipokaAppBar(),

      drawer: const MobileCustomPenggunaDrawerWidget(),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            const CustomMobileTitle(text: 'Pemeriksa - Kegiatan - Usulan Kegiatan'),

            const CustomFieldSpacer(height: 8.0),

            Expanded(
              child: CustomContentBox(
                children: [

                  CustomCommentForTable(
                    title: 'Data Peserta Kegiatan (Dalam Kota)',
                    controller: _dataPesertaKegiatanDalamKotaController,
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
                                  'NIM/NIP',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Nama Lengkap',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Peran',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Dasar Pengiriman',
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

                  const CustomFieldSpacer(height: 16.0),

                  CustomCommentForTable(
                    title: 'Rincian Biaya Kegiatan',
                    controller: _rincianBiayaKegiatanController,
                  ),

                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Column(
                        children: [
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
                                        'Nama Biaya',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Qty',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Harga Satuan',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Total',
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

                                  rows: List.generate(12, (int index) {
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
                                            'Age $index sahjksadfkjh ajdshkjahdf hdjkashjkhad ajkdshfkja fadfk ah',
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        DataCell(Text('City $index')),
                                        DataCell(Text('Country $index')),
                                        DataCell(Text('Salary $index')),
                                        DataCell(Text('Position $index')),
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
                  ),

                  const CustomFieldSpacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomButton(
                        navigation: () => Navigator.pop(context),
                        text: 'Sebelumnya',
                      ),

                      const SizedBox(width: 8.0),

                      CustomButton(
                        navigation: () => Navigator.pushNamed(context, mobilePemeriksaPengajuanUsulanKegiatan3PageRoute),
                        text: 'Berikutnya',
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
}