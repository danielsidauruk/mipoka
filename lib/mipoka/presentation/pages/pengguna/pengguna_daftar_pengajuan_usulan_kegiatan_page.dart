// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mipoka/core/constanst.dart';
// import 'package:mipoka/core/routes.dart';
// import 'package:mipoka/core/theme.dart';
// import 'package:mipoka/domain/utils/convertToLowerCase.dart';
// import 'package:mipoka/mipoka/presentation/bloc/usulan_kegiatan_bloc/usulan_kegiatan_bloc.dart';
// import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
// import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
// import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
// import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
// import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
// import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
// import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
//
// class PenggunaDaftarPengajuanKegiatan extends StatefulWidget {
//   const PenggunaDaftarPengajuanKegiatan({super.key});
//
//   @override
//   State<PenggunaDaftarPengajuanKegiatan> createState() => _PenggunaDaftarPengajuanKegiatanState();
// }
//
// class _PenggunaDaftarPengajuanKegiatanState extends State<PenggunaDaftarPengajuanKegiatan> {
//
//   @override
//   Widget build(BuildContext context) {
//
//     // final double screenWidth = MediaQuery
//     //     .of(context)
//     //     .size
//     //     .width;
//
//     //   if (screenWidth >= 1024) {
//     //     // return buildWebPage(context);
//     //     return buildMobilePage(context);
//     //   } else {
//     //     return buildMobilePage(context);
//     //   }
//     // }
//
//     // Scaffold buildMobilePage(BuildContext context) {
//     //   print('Project Reloaded');
//     //
//     // }
//     return Scaffold(
//       appBar: const MipokaMobileAppBar(),
//       drawer: const MobileCustomPenggunaDrawerWidget(),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             const CustomMobileTitle(
//                 text: 'Pengajuan - Kegiatan - Usulan Kegiatan'),
//             const CustomFieldSpacer(),
//             Expanded(
//               child: CustomContentBox(
//                 children: [
//                   customBoxTitle('Status'),
//                   const CustomFieldSpacer(height: 4.0),
//                   CustomDropdownButton(
//                     items: listStatus,
//                     onValueChanged: (value) {
//                       print('Call RESTAPI http://${convertToLowerCase(
//                           value)} from back-end Database');
//                     },
//                   ),
//
//                   const CustomFieldSpacer(),
//
//                   Expanded(
//                     child: SingleChildScrollView(
//                       scrollDirection: Axis.vertical,
//                       child: SingleChildScrollView(
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
//                                 'Tanggal Mengirim Usulan Kegiatan',
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                             DataColumn(
//                               label: Text(
//                                 'Nama Pengusul',
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                             DataColumn(
//                               label: Text(
//                                 'Nama Kegiatan',
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                             DataColumn(
//                               label: Text(
//                                 'Usulan Kegiatan',
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                             DataColumn(
//                               label: Text(
//                                 'Validasi Pembina',
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                             DataColumn(
//                               label: Text(
//                                 'Status',
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                           ],
//                           rows: List<DataRow>.generate(12, (int index) {
//                             return DataRow(
//                               cells: [
//                                 DataCell(
//                                   Align(
//                                     alignment: Alignment.center,
//                                     child: Text(
//                                       '${index + 1}',
//                                     ),
//                                   ),
//                                 ),
//                                 DataCell(
//                                   Align(
//                                     alignment: Alignment.center,
//                                     child: Text(
//                                       '2${index + 1} Mei 2023',
//                                     ),
//                                   ),
//                                 ),
//                                 DataCell(
//                                   Align(
//                                     alignment: Alignment.center,
//                                     child: Text(
//                                       'Mahasiswa ${index + 1}',
//                                     ),
//                                   ),
//                                 ),
//
//                                 DataCell(
//                                   Align(
//                                     alignment: Alignment.center,
//                                     child: Text(
//                                       'Kegiatan ${index + 1}',
//                                     ),
//                                   ),
//                                 ),
//                                 DataCell(
//                                   Align(
//                                     alignment: Alignment.center,
//                                     child: Image.asset(
//                                       'assets/icons/word.png',
//                                       width: 24,
//                                     ),
//                                   ),
//                                 ),
//                                 DataCell(
//                                   Align(
//                                     alignment: Alignment.center,
//                                     child: Text(
//                                       'Kegiatan ${index + 1}',
//                                     ),
//                                   ),
//                                 ),
//                                 DataCell(
//                                   Align(
//                                     alignment: Alignment.center,
//                                     child: Text(
//                                       'Kegiatan ${index + 1}',
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             );
//                           }),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const CustomFieldSpacer(),
//             CustomButton(
//               onTap: () =>
//                   Navigator.pushNamed(
//                     context,
//                     penggunaPengajuanUsulanKegiatanPage1Route,
//                   ),
//               text: 'Ajukan Kegiatan',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/convertToLowerCase.dart';
import 'package:mipoka/mipoka/presentation/bloc/usulan_kegiatan_bloc/usulan_kegiatan_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';

class PenggunaDaftarPengajuanKegiatan extends StatefulWidget {
  const PenggunaDaftarPengajuanKegiatan({super.key});

  @override
  State<PenggunaDaftarPengajuanKegiatan> createState() => _PenggunaDaftarPengajuanKegiatanState();
}

class _PenggunaDaftarPengajuanKegiatanState extends State<PenggunaDaftarPengajuanKegiatan> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<UsulanKegiatanBloc>(context, listen: false)
        .add(ReadUsulanKegiatanEvent());
  }

  @override
  Widget build(BuildContext context) {

    // final double screenWidth = MediaQuery
    //     .of(context)
    //     .size
    //     .width;

    //   if (screenWidth >= 1024) {
    //     // return buildWebPage(context);
    //     return buildMobilePage(context);
    //   } else {
    //     return buildMobilePage(context);
    //   }
    // }

    // Scaffold buildMobilePage(BuildContext context) {
    //   print('Project Reloaded');
    //
    // }
    return Scaffold(
      appBar: const MipokaMobileAppBar(),
      drawer: const MobileCustomPenggunaDrawerWidget(),
      body: BlocBuilder<UsulanKegiatanBloc, UsulanKegiatanState>(
        builder: (context, state) {
          if (state is UsulanKegiatanLoading) {
            return const Text('Loading');
          } else if (state is UsulanKegiatanHasData) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CustomMobileTitle(
                      text: 'Pengajuan - Kegiatan - Usulan Kegiatan'),

                  const CustomFieldSpacer(),

                  CustomContentBox(
                    children: [
                      customBoxTitle('Status'),

                      const CustomFieldSpacer(height: 4.0),

                      MipokaCustomDropdown(
                        items: listStatus,
                        onValueChanged: (value) {
                          print('Call RESTAPI http://${convertToLowerCase(
                              value!)} from back-end Database');
                        },
                      ),

                      const CustomFieldSpacer(),

                      SingleChildScrollView(
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
                                'Tanggal Mengirim Usulan Kegiatan',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Nama Pengusul',
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
                                'Usulan Kegiatan',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Validasi Pembina',
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
                          ],
                          rows: List<DataRow>.generate(state.usulanKegiatanList.length, (int index) {
                            final usulanKegiatan = state.usulanKegiatanList[index];
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
                                      DateFormat('dd-MM-yyyy').format(usulanKegiatan.createdAt),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      usulanKegiatan.user.namaLengkap,
                                    ),
                                  ),
                                ),

                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      usulanKegiatan.namaKegiatan,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      'assets/icons/word.png',
                                      width: 24,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      usulanKegiatan.validasiPembina,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      usulanKegiatan.status,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                      ),

                      const CustomFieldSpacer(),
                      CustomMipokaButton(
                        onTap: () =>
                            Navigator.pushNamed(
                              context,
                              penggunaPengajuanUsulanKegiatanPage1Route,
                            ),
                        text: 'Ajukan Kegiatan',
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else if (state is UsulanKegiatanError) {
            return Text(state.message);
          } else {
            return const Text('IDK');
          }
        },
      ),
    );
  }
}
