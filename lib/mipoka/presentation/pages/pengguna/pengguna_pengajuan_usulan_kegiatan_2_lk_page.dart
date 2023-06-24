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
class PenggunaPengajuanUsulanKegiatan2LK extends StatelessWidget {
  const PenggunaPengajuanUsulanKegiatan2LK({super.key});

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
            const CustomFieldSpacer(),
            Expanded(
              child: CustomContentBox(
                children: [
                  buildTitle('Data Peserta Kegiatan (Luar Kota)'),
                  CustomAddButton(
                    buttonText: 'Data Partisipan',
                    onPressed: () => Navigator.pushNamed(
                      context,
                      penggunaPengajuanUsulanKegiatan2LKDataPesertaPageRoute,
                    ),
                  ),
                  const CustomFieldSpacer(),
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
                  const CustomFieldSpacer(),
                  buildTitle('Rincian Biaya Kegiatan'),
                  CustomAddButton(
                    buttonText: 'Biaya Kegiatan',
                    onPressed: () => Navigator.pushNamed(
                      context,
                      penggunaPengajuanUsulanKegiatan2BiayaKegiatanPageRoute,
                    ),
                  ),
                  const CustomFieldSpacer(),
                  Expanded(
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
                                    label: Text(
                                      'Qty',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
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
                                      'Total',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Keterangan',
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
                  const CustomFieldSpacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomMipokaButton(
                        onTap: () => Navigator.pop(context),
                        text: 'Sebelumnya',
                      ),
                      const SizedBox(width: 8.0),
                      CustomMipokaButton(
                        onTap: () => Navigator.pushNamed(
                            context, penggunaPengajuanUsulanKegiatan3PageRoute),
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
//                       penggunaPengajuanUsulanKegiatan2LKDataPesertaPageRoute,
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
//                       penggunaPengajuanUsulanKegiatan2BiayaKegiatanPageRoute,
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
//                         navigation: () => Navigator.pushNamed(context, penggunaPengajuanUsulanKegiatan3PageRoute),
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