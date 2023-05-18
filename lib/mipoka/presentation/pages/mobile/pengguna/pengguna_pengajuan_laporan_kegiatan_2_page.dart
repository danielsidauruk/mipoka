import 'package:flutter/material.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_add_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';

// => Fixed ContentBox

class MobilePenggunaPengajuanLaporanKegiatan2 extends StatelessWidget {
  const MobilePenggunaPengajuanLaporanKegiatan2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MipokaMobileAppBar(),
      drawer: const MobileCustomPenggunaDrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const CustomMobileTitle(
                text: 'Pengajuan - Kegiatan - Usulan Kegiatan'),
            const SizedBox(height: 8.0),
            Expanded(
              child: CustomContentBox(
                children: [
                  buildTitle('Data Peserta Kegiatan'),
                  CustomAddButton(
                    buttonText: 'Import Peserta',
                    onPressed: () => Navigator.pushNamed(context,
                        penggunaPengajuanLaporanKegiatan2ImportKegiatanPageRoute),
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
                                        'NIM/NIP ${index + 1}',
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Nama Lengkap ${index + 1}',
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Peran ${index + 1}',
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Dasar Pengiriman ${index + 1}',
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
                  ),
                  const CustomFieldSpacer(),
                  buildTitle('Realisasi Biaya Kegiatan'),
                  CustomAddButton(
                    buttonText: 'Biaya Kegiatan',
                    onPressed: () => Navigator.pushNamed(context,
                        penggunaPengajuanLaporanKegiatan2BiayaKegiatanPageRoute),
                  ),
                  const CustomFieldSpacer(),
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
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Nama Biaya',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    DataColumn(
                                      label: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Qty',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Harga Satuan',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Usulan Anggaran',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Realisasi Anggaran',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Selisih',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                  rows: List.generate(12, (int index) {
                                    return DataRow(
                                      cells: [
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text('${index + 1}'),
                                          ),
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text('Biaya $index'),
                                          ),
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text('Qty $index'),
                                          ),
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text('Harga Satuan $index'),
                                          ),
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child:
                                                Text('Usulan Anggaran $index'),
                                          ),
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                                'Realisasi Anggaran $index'),
                                          ),
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text('Selisih $index'),
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
                  ),
                  const CustomFieldSpacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomButton(
                        onTap: () => Navigator.pop(context),
                        text: 'Sebelumnya',
                      ),
                      const SizedBox(width: 8.0),
                      CustomButton(
                        onTap: () => Navigator.pushNamed(context,
                            penggunaPengajuanLaporanKegiatan3PageRoute),
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


// => Non Fixed ContentBox

// class MobilePenggunaPengajuanUsulanKegiatan2DK extends StatelessWidget {
//   const MobilePenggunaPengajuanUsulanKegiatan2DK({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const MipokaAppBar(),
//
//       drawer: const MobilePenggunaDrawerWidget(),
//
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//
//               const MobileTitle(text: 'Pengajuan - Kegiatan - Usulan Kegiatan'),
//
//               const SizedBox(height: 8.0),
//
//               ContentBox(
//                 children: [
//                 buildTitle('Data Peserta Kegiatan (Dalam Kota)'),
//
//                 const FieldSpacer(),
//
//                 InkWell(
//                   onTap: () => Navigator.pushNamed(context, penggunaPengajuanUsulanKegiatan2DKDataPesertaPageRoute),
//                   child: Container(
//                     padding: const EdgeInsets.all(8.0),
//                     width: double.infinity,
//                     alignment: Alignment.center,
//                     constraints: const BoxConstraints(minHeight: 30.0),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(5.0),
//                     ),
//                     child: Row(
//                       children: const [
//                         Align(
//                           alignment: Alignment.centerLeft,
//                           child: Icon(
//                             Icons.add,
//                             size: 20,
//                             color: Colors.black,
//                           ),
//                         ),
//
//                         Expanded(
//                           child: Text(
//                             'Data Partisipan',
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//
//                 const FieldSpacer(),
//
//                 Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey),
//                   ),
//                   child: SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: DataTable(
//                       columnSpacing: 40,
//                       border: TableBorder.all(color: Colors.white),
//                       columns: const [
//                         DataColumn(
//                           label: Text(
//                             'No.',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                         DataColumn(
//                           label: Text(
//                             'NIM/NIP',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                         DataColumn(
//                           label: Text(
//                             'Nama Lengkap',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                         DataColumn(
//                           label: Text(
//                             'Peran',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                         DataColumn(
//                           label: Text(
//                             'Dasar Pengiriman',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                       ],
//
//                       rows: List<DataRow>.generate(12, (int index) {
//                         return DataRow(
//                           cells: [
//                             DataCell(
//                               Text(
//                                 '${index + 1}',
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                             DataCell(
//                               Text(
//                                 'Age $index',
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                             DataCell(Text('City $index')),
//                             DataCell(Text('Country $index')),
//                             DataCell(Text('Salary $index')),
//                           ],
//                         );
//                       }),
//                     ),
//                   ),
//                 ),
//
//                 const FieldSpacer(),
//
//                 buildTitle('Rincian Biaya Kegiatan'),
//
//                 const FieldSpacer(),
//
//                 InkWell(
//                   onTap: () => Navigator.pushNamed(context, penggunaPengajuanUsulanKegiatan2BiayaKegiatanPageRoute),
//                   child: Container(
//                     padding: const EdgeInsets.all(8.0),
//                     width: double.infinity,
//                     alignment: Alignment.center,
//                     constraints: const BoxConstraints(minHeight: 30.0),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(5.0),
//                     ),
//                     child: Row(
//                       children: const [
//                         Align(
//                           alignment: Alignment.centerLeft,
//                           child: Icon(
//                             Icons.add,
//                             size: 20,
//                             color: Colors.black,
//                           ),
//                         ),
//
//                         Expanded(
//                           child: Text(
//                             'Biaya Kegiatan',
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//
//                 const FieldSpacer(),
//
//                 Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey),
//                   ),
//                   child: Column(
//                     children: [
//                       SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: DataTable(
//                           columnSpacing: 40,
//                           border: TableBorder.all(color: Colors.white),
//                           columns: const [
//                             DataColumn(
//                               label: Text(
//                                 'No.',
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                             DataColumn(
//                               label: Text(
//                                 'Nama Biaya',
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                             DataColumn(
//                               label: Text(
//                                 'Qty',
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                             DataColumn(
//                               label: Text(
//                                 'Harga Satuan',
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                             DataColumn(
//                               label: Text(
//                                 'Total',
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                             DataColumn(
//                               label: Text(
//                                 'Keterangan',
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                           ],
//
//                           rows: List.generate(12, (int index) {
//                             return DataRow(
//                               cells: [
//                                 DataCell(
//                                   Text(
//                                     '${index + 1}',
//                                     textAlign: TextAlign.center,
//                                   ),
//                                 ),
//                                 DataCell(
//                                   Text(
//                                     'Age $index sahjksadfkjh ajdshkjahdf hdjkashjkhad ajkdshfkja fadfk ah',
//                                     textAlign: TextAlign.center,
//                                   ),
//                                 ),
//                                 DataCell(Text('City $index')),
//                                 DataCell(Text('Country $index')),
//                                 DataCell(Text('Salary $index')),
//                                 DataCell(Text('Position $index')),
//                               ],
//                             );
//                           }),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 const FieldSpacer(),
//
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     CustomButton(
//                       navigation: () => Navigator.pop(context),
//                       text: 'Sebelumnya',
//                     ),
//
//                     const SizedBox(width: 8.0),
//
//                     CustomButton(
//                       navigation: () => Navigator.pushNamed(context, penggunaPengajuanUsulanKegiatan3PageRoute),
//                       text: 'Berikutnya',
//                     ),
//                   ],
//                 ),
//
//               ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }