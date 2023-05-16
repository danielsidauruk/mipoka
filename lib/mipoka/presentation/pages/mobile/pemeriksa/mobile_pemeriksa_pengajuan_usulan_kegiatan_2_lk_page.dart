import 'package:flutter/material.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_add_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_comment_for_table.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/pemeriksa/mobile_pemeriksa_custom_drawer.dart';


// => Fixed ContentBox
class MobilePemeriksaPengajuanUsulanKegiatan2LK extends StatefulWidget {
  const MobilePemeriksaPengajuanUsulanKegiatan2LK({super.key});

  @override
  State<MobilePemeriksaPengajuanUsulanKegiatan2LK> createState() => _MobilePemeriksaPengajuanUsulanKegiatan2LKState();
}

class _MobilePemeriksaPengajuanUsulanKegiatan2LKState extends State<MobilePemeriksaPengajuanUsulanKegiatan2LK> {
  final TextEditingController _dataPesertaKegiatanDalamKotaController = TextEditingController();
  final TextEditingController _rincianBiayaKegiatanController = TextEditingController();

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
                                    'NIK',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Tempat/Tanggal Lahir',
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
                                    DataCell(Text('Position $index')),
                                    DataCell(Text('Department $index')),
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

                    const CustomFieldSpacer(height: 4.0),

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
                          onTap: () => Navigator.pop(context),
                          text: 'Sebelumnya',
                        ),

                        const SizedBox(width: 8.0),

                        CustomButton(
                          onTap: () => Navigator.pushNamed(context, mobilePemeriksaPengajuanUsulanKegiatan3PageRoute),
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

// => Non Fixed Content Box

// class MobilePenggunaPengajuanUsulanKegiatan2LK extends StatelessWidget {
//   const MobilePenggunaPengajuanUsulanKegiatan2LK({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const MipokaAppBar(),
//
//       drawer: const MobileCustomPenggunaDrawerWidget(),
//
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//
//               const CustomMobileTitle(text: 'Pengajuan - Kegiatan - Usulan Kegiatan'),
//
//               const CustomFieldSpacer(),
//
//               CustomContentBox(
//                 children: [
//
//                   buildTitle('Data Peserta Kegiatan (Luar Kota)'),
//
//                   InkWell(
//                     onTap: () => Navigator.pushNamed(
//                       context,
//                       mobilePenggunaPengajuanUsulanKegiatan2LKDataPesertaRoute,
//                     ),
//                     child: Container(
//                       padding: const EdgeInsets.all(8.0),
//                       width: double.infinity,
//                       alignment: Alignment.center,
//                       constraints: const BoxConstraints(minHeight: 30.0),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(5.0),
//                       ),
//                       child: Row(
//                         children: const [
//                           Align(
//                             alignment: Alignment.centerLeft,
//                             child: Icon(
//                               Icons.add,
//                               size: 20,
//                               color: Colors.black,
//                             ),
//                           ),
//
//                           Expanded(
//                             child: Text(
//                               'Data Partisipan',
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//
//                   const CustomFieldSpacer(),
//
//                   Container(
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey),
//                     ),
//                     child: SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: DataTable(
//                         columnSpacing: 40,
//                         border: TableBorder.all(color: Colors.white),
//                         columns: const [
//                           DataColumn(
//                             label: Text(
//                               'No.',
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                           DataColumn(
//                             label: Text(
//                               'NIM/NIP',
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                           DataColumn(
//                             label: Text(
//                               'Nama Lengkap',
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                           DataColumn(
//                             label: Text(
//                               'NIK',
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                           DataColumn(
//                             label: Text(
//                               'Tempat/Tanggal Lahir',
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                           DataColumn(
//                             label: Text(
//                               'Peran',
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                           DataColumn(
//                             label: Text(
//                               'Dasar Pengiriman',
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                         ],
//
//                         rows: List<DataRow>.generate(12, (int index) {
//                           return DataRow(
//                             cells: [
//                               DataCell(
//                                 Text(
//                                   '${index + 1}',
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ),
//                               DataCell(
//                                 Text(
//                                   'Age $index',
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ),
//                               DataCell(Text('City $index')),
//                               DataCell(Text('Country $index')),
//                               DataCell(Text('Salary $index')),
//                               DataCell(Text('Position $index')),
//                               DataCell(Text('Department $index')),
//                             ],
//                           );
//                         }),
//                       ),
//                     ),
//                   ),
//
//                   const CustomFieldSpacer(),
//
//                   buildTitle('Rincian Biaya Kegiatan'),
//
//                   InkWell(
//                     onTap: () => Navigator.pushNamed(
//                       context,
//                       mobilePenggunaPengajuanUsulanKegiatan2BiayaKegiatanRoute,
//                     ),
//                     child: Container(
//                       padding: const EdgeInsets.all(8.0),
//                       width: double.infinity,
//                       alignment: Alignment.center,
//                       constraints: const BoxConstraints(minHeight: 30.0),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(5.0),
//                       ),
//                       child: Row(
//                         children: const [
//                           Align(
//                             alignment: Alignment.centerLeft,
//                             child: Icon(
//                               Icons.add,
//                               size: 20,
//                               color: Colors.black,
//                             ),
//                           ),
//
//                           Expanded(
//                             child: Text(
//                               'Biaya Kegiatan',
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//
//                   const CustomFieldSpacer(),
//
//                   Container(
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey),
//                     ),
//                     child: Column(
//                       children: [
//                         SingleChildScrollView(
//                           scrollDirection: Axis.horizontal,
//                           child: DataTable(
//                             columnSpacing: 40,
//                             border: TableBorder.all(color: Colors.white),
//                             columns: const [
//                               DataColumn(
//                                 label: Text(
//                                   'No.',
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ),
//                               DataColumn(
//                                 label: Text(
//                                   'Nama Biaya',
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ),
//                               DataColumn(
//                                 label: Text(
//                                   'Qty',
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ),
//                               DataColumn(
//                                 label: Text(
//                                   'Harga Satuan',
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ),
//                               DataColumn(
//                                 label: Text(
//                                   'Total',
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ),
//                               DataColumn(
//                                 label: Text(
//                                   'Keterangan',
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ),
//                             ],
//
//                             rows: List.generate(12, (int index) {
//                               return DataRow(
//                                 cells: [
//                                   DataCell(
//                                     Text(
//                                       '${index + 1}',
//                                       textAlign: TextAlign.center,
//                                     ),
//                                   ),
//                                   DataCell(
//                                     Text(
//                                       'Age $index sahjksadfkjh ajdshkjahdf hdjkashjkhad ajkdshfkja fadfk ah',
//                                       textAlign: TextAlign.center,
//                                     ),
//                                   ),
//                                   DataCell(Text('City $index')),
//                                   DataCell(Text('Country $index')),
//                                   DataCell(Text('Salary $index')),
//                                   DataCell(Text('Position $index')),
//                                 ],
//                               );
//                             }),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//
//                   const CustomFieldSpacer(),
//
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       CustomButton(
//                         navigation: () => Navigator.pop(context),
//                         text: 'Sebelumnya',
//                       ),
//
//                       const SizedBox(width: 8.0),
//
//                       CustomButton(
//                         navigation: () => Navigator.pushNamed(context, mobilePenggunaPengajuanUsulanKegiatan3Route),
//                         text: 'Berikutnya',
//                       ),
//                     ],
//                   ),
//
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }