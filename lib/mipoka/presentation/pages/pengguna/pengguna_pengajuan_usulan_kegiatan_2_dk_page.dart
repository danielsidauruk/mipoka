import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/multiple_args.dart';
import 'package:mipoka/mipoka/presentation/bloc/biaya_kegiatan_bloc/biaya_kegiatan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/usulan_kegiatan_bloc/usulan_kegiatan_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_add_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';

class PenggunaPengajuanUsulanKegiatan2DK extends StatefulWidget {
  const PenggunaPengajuanUsulanKegiatan2DK({
    required this.idUsulanKegiatan,
    super.key,
  });

  final int idUsulanKegiatan;

  @override
  State<PenggunaPengajuanUsulanKegiatan2DK> createState() => _PenggunaPengajuanUsulanKegiatan2DKState();
}

class _PenggunaPengajuanUsulanKegiatan2DKState extends State<PenggunaPengajuanUsulanKegiatan2DK> {

  @override
  void initState() {
    context.read<UsulanKegiatanBloc>().add(
        ReadUsulanKegiatanEvent(idUsulanKegiatan: widget.idUsulanKegiatan));
    super.initState();
  }

  @override
  void dispose() {
    context.read<UsulanKegiatanBloc>().close();
    super.dispose();
  }

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
            BlocBuilder<UsulanKegiatanBloc, UsulanKegiatanState>(
              builder: (context, state) {
                if (state is UsulanKegiatanLoading) {
                  return const Text('Loading ...');
                } else if (state is UsulanKegiatanHasData) {
                  return Expanded(
                    child: CustomContentBox(
                      children: [
                        buildTitle('Data Partisipan Kegiatan (Dalam Kota)'),
                        CustomAddButton(
                          buttonText: 'Data Partisipan',
                          onPressed: () => Navigator.pushNamed(
                            context,
                            tambahDataPesertaDalamKotaPageRoute,
                            arguments: widget.idUsulanKegiatan,
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
                                    DataColumn(
                                      label: Text(
                                        '',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                  rows: List<DataRow>
                                      .generate(state.usulanKegiatan.partisipan.length, (int index) {
                                    final partisipan = state.usulanKegiatan.partisipan[index];
                                    return DataRow(
                                      cells: [
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              '${index + 1}',
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          onTap: () {
                                            Navigator.pushNamed(
                                              context,
                                              editDataPesertaDalamKotaPageRoute,
                                              arguments: PartisipanArgs(
                                                partisipan: partisipan,
                                                id: widget.idUsulanKegiatan,
                                              ),
                                            );
                                          },
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              partisipan.noInduk,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(color: Colors.blue),
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              partisipan.namaPartisipan,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              partisipan.peranPartisipan,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              partisipan.dasarPengiriman,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          InkWell(
                                            onTap: (){
                                              context.read<UsulanKegiatanBloc>().add(
                                                DeleteUsulanPartisipanEvent(
                                                  idUsulanKegiatan: state.usulanKegiatan.idUsulan,
                                                  idPartisipan: partisipan.idPartisipan,
                                                ),
                                              );
                                              mipokaCustomToast('${partisipan.namaPartisipan} has been deleted.');
                                              context.read<UsulanKegiatanBloc>().add(
                                                ReadUsulanKegiatanEvent(idUsulanKegiatan: state.usulanKegiatan.idUsulan),
                                              );
                                            },
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Image.asset(
                                                'assets/icons/delete.png',
                                                width: 24,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                  ),
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
                            arguments: widget.idUsulanKegiatan,
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
                                            'Kuantitas',
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
                                        DataColumn(
                                          label: Text(
                                            '',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                      rows: List.generate(state.usulanKegiatan.biayaKegiatan.length, (int index) {
                                        final biayaKegiatan = state.usulanKegiatan.biayaKegiatan[index];
                                        return DataRow(
                                          cells: [
                                            DataCell(
                                              Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  '${index + 1}',
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),

                                            DataCell(
                                              InkWell(
                                                onTap: () => Navigator.pushNamed(
                                                  context,
                                                  usulanKegiatanEditBiayaKegiatanPageRoute,
                                                  arguments: BiayaKegiatanArgs(
                                                    biayaKegiatan: biayaKegiatan,
                                                    id: widget.idUsulanKegiatan,
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    biayaKegiatan.namaBiayaKegiatan,
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(color: Colors.blue),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  biayaKegiatan.kuantiti.toString(),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  biayaKegiatan.hargaSatuan.toString(),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  biayaKegiatan.total.toString(),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  biayaKegiatan.keterangan,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              InkWell(
                                                onTap: (){
                                                  context.read<BiayaKegiatanBloc>().add(
                                                    DeleteBiayaKegiatanEvent(biayaKegiatan.idBiayaKegiatan),
                                                  );
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Image.asset(
                                                    'assets/icons/delete.png',
                                                    width: 24,
                                                  ),
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
                                context,
                                penggunaPengajuanUsulanKegiatan3PageRoute,
                                arguments: widget.idUsulanKegiatan,
                              ),
                              text: 'Berikutnya',
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                } else if (state is UsulanKegiatanError) {
                  return Text(state.message);
                } else {
                  return const Text('UsulanKegiatanBloc has not been triggered');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

// => Non Fixed ContentBox

// class PenggunaPengajuanUsulanKegiatan2DK extends StatefulWidget {
//   const PenggunaPengajuanUsulanKegiatan2DK({super.key});
//
//   @override
//   State<PenggunaPengajuanUsulanKegiatan2DK> createState() => _PenggunaPengajuanUsulanKegiatan2DKState();
// }
//
// class _PenggunaPengajuanUsulanKegiatan2DKState extends State<PenggunaPengajuanUsulanKegiatan2DK> {
//
//   @override
//   void initState() {
//     Future.microtask(() {
//       BlocProvider.of<PesertaBloc>(context, listen: false)
//           .add(ReadPesertaEvent());
//       BlocProvider.of<RincianBiayaKegiatanBloc>(context, listen: false)
//           .add(ReadRincianBiayaKegiatanEvent());
//       },
//     );
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const MipokaMobileAppBar(),
//       drawer: const MobileCustomPenggunaDrawerWidget(),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               const CustomMobileTitle(
//                   text: 'Pengajuan - Kegiatan - Usulan Kegiatan'),
//               const SizedBox(height: 8.0),
//               CustomContentBox(
//                 children: [
//                   buildTitle('Data Peserta Kegiatan (Dalam Kota)'),
//                   CustomAddButton(
//                     buttonText: 'Data Partisipan',
//                     onPressed: () => Navigator.pushNamed(context,
//                         penggunaPengajuanUsulanKegiatan2DKDataPesertaPageRoute),
//                   ),
//                   const CustomFieldSpacer(),
//                   BlocBuilder<PesertaBloc, PesertaState>(
//                     builder: (context, state) {
//                       if (state is PesertaLoading) {
//                         return const Text('Loading');
//                       } else if (state is PesertaHasData) {
//                         return SingleChildScrollView(
//                           scrollDirection: Axis.vertical,
//                           child: SingleChildScrollView(
//                             scrollDirection: Axis.horizontal,
//                             child: DataTable(
//                               columnSpacing: 40,
//                               border: TableBorder.all(color: Colors.white),
//                               columns: const [
//                                 DataColumn(
//                                   label: Text(
//                                     'No.',
//                                     style: TextStyle(fontWeight: FontWeight.bold),
//                                     textAlign: TextAlign.center,
//                                   ),
//                                 ),
//                                 DataColumn(
//                                   label: Text(
//                                     'NIM/NIP',
//                                     style: TextStyle(fontWeight: FontWeight.bold),
//                                     textAlign: TextAlign.center,
//                                   ),
//                                 ),
//                                 DataColumn(
//                                   label: Text(
//                                     'Nama Lengkap',
//                                     style: TextStyle(fontWeight: FontWeight.bold),
//                                     textAlign: TextAlign.center,
//                                   ),
//                                 ),
//                                 DataColumn(
//                                   label: Text(
//                                     'Peran',
//                                     style: TextStyle(fontWeight: FontWeight.bold),
//                                     textAlign: TextAlign.center,
//                                   ),
//                                 ),
//                                 DataColumn(
//                                   label: Text(
//                                     'Dasar Pengiriman',
//                                     style: TextStyle(fontWeight: FontWeight.bold),
//                                     textAlign: TextAlign.center,
//                                   ),
//                                 ),
//                               ],
//                               rows: List<DataRow>
//                                   .generate(state.pesertaList.length, (int index) {
//                                 final dataPartisipan = state.pesertaList[index];
//                                 return DataRow(
//                                   cells: [
//                                     DataCell(
//                                       Align(
//                                         alignment: Alignment.center,
//                                         child: Text(
//                                           '${index + 1}',
//                                           textAlign: TextAlign.center,
//                                         ),
//                                       ),
//                                     ),
//                                     DataCell(
//                                       Align(
//                                         alignment: Alignment.center,
//                                         child: Text(
//                                           dataPartisipan.nim,
//                                           textAlign: TextAlign.center,
//                                         ),
//                                       ),
//                                     ),
//                                     DataCell(
//                                       Align(
//                                         alignment: Alignment.center,
//                                         child: Text(
//                                           dataPartisipan.namaLengkap,
//                                           textAlign: TextAlign.center,
//                                         ),
//                                       ),
//                                     ),
//                                     DataCell(
//                                       Align(
//                                         alignment: Alignment.center,
//                                         child: Text(
//                                           dataPartisipan.peran,
//                                           textAlign: TextAlign.center,
//                                         ),
//                                       ),
//                                     ),
//                                     DataCell(
//                                       Align(
//                                         alignment: Alignment.center,
//                                         child: Text(
//                                           dataPartisipan.dasarKirim,
//                                           textAlign: TextAlign.center,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 );
//                               },
//                               ),
//                             ),
//                           ),
//                         );
//                       } else if (state is PesertaError) {
//                         return Text(state.message);
//                       } else {
//                         return const Text("yntkts");
//                       }
//                     },
//                   ),
//                   const CustomFieldSpacer(),
//                   buildTitle('Rincian Biaya Kegiatan'),
//                   CustomAddButton(
//                     buttonText: 'Biaya Kegiatan',
//                     onPressed: () => Navigator.pushNamed(context,
//                         penggunaPengajuanUsulanKegiatan2BiayaKegiatanPageRoute),
//                   ),
//                   const CustomFieldSpacer(),
//                   Column(
//                     children: [
//                       BlocBuilder<RincianBiayaKegiatanBloc, RincianBiayaKegiatanState>(
//                         builder: (context, state) {
//                           if (state is RincianBiayaKegiatanLoading) {
//                             return const Text('Loading');
//                           } else if (state is RincianBiayaKegiatanHasData) {
//                             return SingleChildScrollView(
//                               scrollDirection: Axis.vertical,
//                               child: SingleChildScrollView(
//                                 scrollDirection: Axis.horizontal,
//                                 child: DataTable(
//                                   columnSpacing: 40,
//                                   border: TableBorder.all(color: Colors.white),
//                                   columns: const [
//                                     DataColumn(
//                                       label: Text(
//                                         'No.',
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold),
//                                         textAlign: TextAlign.center,
//                                       ),
//                                     ),
//                                     DataColumn(
//                                       label: Text(
//                                         'Nama Biaya',
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold),
//                                         textAlign: TextAlign.center,
//                                       ),
//                                     ),
//                                     DataColumn(
//                                       label: Text(
//                                         'Qty',
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold),
//                                         textAlign: TextAlign.center,
//                                       ),
//                                     ),
//                                     DataColumn(
//                                       label: Text(
//                                         'Harga Satuan',
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold),
//                                         textAlign: TextAlign.center,
//                                       ),
//                                     ),
//                                     DataColumn(
//                                       label: Text(
//                                         'Total',
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold),
//                                         textAlign: TextAlign.center,
//                                       ),
//                                     ),
//                                     DataColumn(
//                                       label: Text(
//                                         'Keterangan',
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold),
//                                         textAlign: TextAlign.center,
//                                       ),
//                                     ),
//                                   ],
//                                   rows: List.generate(state.rincianBiayaKegiatanList.length, (int index) {
//                                     final rincianBiayaKegiatan = state.rincianBiayaKegiatanList[index];
//                                     return DataRow(
//                                       cells: [
//                                         DataCell(
//                                           Align(
//                                             alignment: Alignment.center,
//                                             child: Text(
//                                               '${index + 1}',
//                                               textAlign: TextAlign.center,
//                                             ),
//                                           ),
//                                         ),
//
//                                         DataCell(
//                                           Align(
//                                             alignment: Alignment.center,
//                                             child: Text(
//                                               rincianBiayaKegiatan.namaBiayaKegiatan,
//                                               textAlign: TextAlign.center,
//                                             ),
//                                           ),
//                                         ),
//                                         DataCell(
//                                           Align(
//                                             alignment: Alignment.center,
//                                             child: Text(
//                                               rincianBiayaKegiatan.kuantiti.toString(),
//                                               textAlign: TextAlign.center,
//                                             ),
//                                           ),
//                                         ),
//                                         DataCell(
//                                           Align(
//                                             alignment: Alignment.center,
//                                             child: Text(
//                                               rincianBiayaKegiatan.hargaSatuan.toString(),
//                                               textAlign: TextAlign.center,
//                                             ),
//                                           ),
//                                         ),
//                                         DataCell(
//                                           Align(
//                                             alignment: Alignment.center,
//                                             child: Text(
//                                               rincianBiayaKegiatan.total.toString(),
//                                               textAlign: TextAlign.center,
//                                             ),
//                                           ),
//                                         ),
//                                         DataCell(
//                                           Align(
//                                             alignment: Alignment.center,
//                                             child: Text(
//                                               rincianBiayaKegiatan.keterangan,
//                                               textAlign: TextAlign.center,
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     );
//                                   }),
//                                 ),
//                               ),
//                             );
//                           } else if (state is RincianBiayaKegiatanError) {
//                             return Text(state.message);
//                           } else {
//                             return const Text('YNTKTS');
//                           }
//                         },
//                       ),
//                     ],
//                   ),
//                   const CustomFieldSpacer(),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       CustomMipokaButton(
//                         onTap: () => Navigator.pop(context),
//                         text: 'Sebelumnya',
//                       ),
//                       const SizedBox(width: 8.0),
//                       CustomMipokaButton(
//                         onTap: () => Navigator.pushNamed(
//                             context, penggunaPengajuanUsulanKegiatan3PageRoute),
//                         text: 'Berikutnya',
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
