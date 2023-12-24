import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/download_file_with_dio.dart';
import 'package:mipoka/domain/utils/format_date_indonesia.dart';
import 'package:mipoka/domain/utils/uniqe_id_generator.dart';
import 'package:mipoka/domain/utils/url_utils.dart';
import 'package:mipoka/mipoka/domain/entities/laporan.dart';
import 'package:mipoka/mipoka/domain/entities/notifikasi.dart';
import 'package:mipoka/mipoka/presentation/bloc/laporan_bloc/laporan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/notifikasi_bloc/notifikasi_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_total_count.dart';

class KemahasiswaanCekLaporanKegiatanPage extends StatefulWidget {
  const KemahasiswaanCekLaporanKegiatanPage({super.key});

  @override
  State<KemahasiswaanCekLaporanKegiatanPage> createState() => _KemahasiswaanCekLaporanKegiatanPageState();
}

class _KemahasiswaanCekLaporanKegiatanPageState extends State<KemahasiswaanCekLaporanKegiatanPage> {

  @override
  void initState() {
    context.read<LaporanBloc>().add(const ReadAllLaporanEvent());
    super.initState();
  }

  @override
  void dispose() {
    context.read<LaporanBloc>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MipokaMobileAppBar(
        onRefresh: () {
          mipokaCustomToast(refreshMessage);
          context.read<LaporanBloc>().add(const ReadAllLaporanEvent());
        },
      ),

      drawer: const CustomKemahasiswaanDrawer(),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomMobileTitle(
                  text: 'Pengajuan - Cek Laporan Kegiatan'),
              const CustomFieldSpacer(),
              CustomContentBox(
                children: [
                  // buildTitle('Status'),
                  //
                  // MipokaCustomDropdown(
                  //   items: listStatus,
                  //   onValueChanged: (value) => context.read<LaporanBloc>()
                  //       .add(ReadAllLaporanEvent(filter: value ?? "semua")),
                  // ),
                  //
                  // const CustomFieldSpacer(),

                  BlocConsumer<LaporanBloc, LaporanState>(
                    listenWhen: (prev, current) =>
                    prev.runtimeType != current.runtimeType,
                    listener: (context, state) async {

                      if (state is UpdateLaporanFirstPageSuccess) {
                        context.read<LaporanBloc>().add(const ReadAllLaporanEvent());

                      } else if (state is LaporanError) {
                        mipokaCustomToast(state.message);
                      }
                    },
                    builder: (context, state) {
                      if (state is LaporanLoading) {
                        return const Text('Loading');
                      } else if (state is AllLaporanHasData) {
                        final laporanList = state.laporanList;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MipokaCountText(total: laporanList.length),

                            const CustomFieldSpacer(height: 4.0),

                            SingleChildScrollView(
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
                                        'Tanggal',
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
                                        'Aksi',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                  rows: List<DataRow>.generate(laporanList.length, (int index) {
                                    final laporan = laporanList[index];

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
                                            child: Text(formatDateIndonesia(laporan.createdAt)),
                                          ),
                                        ),
                                        DataCell(
                                            Align(
                                              alignment: Alignment.center,
                                              child: Text(laporan.usulanKegiatan?.namaKegiatan ?? ""),
                                            )
                                        ),

                                        // laporan.fileLaporanKegiatan != "" ?
                                        // DataCell(
                                        //   Align(
                                        //     alignment: Alignment.center,
                                        //     child: Image.asset(
                                        //       'assets/icons/pdf.png',
                                        //       width: 24,
                                        //     ),
                                        //   ),
                                        //   onTap: () => downloadFileWithDio(
                                        //     url: laporan.fileLaporanKegiatan,
                                        //     fileName: getFileNameFromUrl(laporan.fileLaporanKegiatan),
                                        //   ),
                                        // ) :
                                        // DataCell(
                                        //   Align(
                                        //     alignment: Alignment.center,
                                        //     child: Image.asset(
                                        //       'assets/icons/document.png',
                                        //       width: 24,
                                        //     ),
                                        //   ),
                                        // ),

                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Image.asset(
                                              'assets/icons/document.png',
                                              width: 24,
                                            ),
                                          ),
                                          onTap: laporan.validasiPembina == tertunda ||
                                              laporan.statusLaporan == tertunda ? () async {

                                            final result = await Navigator.pushNamed(
                                              context,
                                              kemahasiswaanLaporanKegiatanRoute,
                                              arguments: laporan,
                                            );

                                            if (result is Laporan && context.mounted) {
                                              context.read<LaporanBloc>().add(
                                                  UpdateLaporanFirstPageEvent(laporan: result));
                                            }
                                          } : null,
                                        ),

                                        DataCell(
                                          Center(
                                              child: laporan.validasiPembina == disetujui ?
                                              Image.asset(
                                                'assets/icons/approve.png',
                                                width: 24,
                                              ) :
                                              laporan.validasiPembina == ditolak ?
                                              Image.asset(
                                                'assets/icons/close.png',
                                                width: 24,
                                              ) :
                                              Image.asset(
                                                'assets/icons/time.png',
                                                width: 24,
                                              )
                                          ),
                                        ),

                                        DataCell(
                                          Center(
                                              child: laporan.statusLaporan == disetujui ?
                                              Image.asset(
                                                'assets/icons/approve.png',
                                                width: 24,
                                              ) :
                                              laporan.statusLaporan == ditolak ?
                                              Image.asset(
                                                'assets/icons/close.png',
                                                width: 24,
                                              ) :
                                              Image.asset(
                                                'assets/icons/time.png',
                                                width: 24,
                                              )
                                          ),
                                        ),
                                        // DataCell(
                                        //   laporan.validasiPembina == tertunda ?
                                        //   Center(
                                        //     child: Image.asset(
                                        //       'assets/icons/time.png',
                                        //       width: 24,
                                        //     ),
                                        //   ) :
                                        //   laporan.statusLaporan == tertunda ?
                                        //   Row(
                                        //     mainAxisAlignment:
                                        //     MainAxisAlignment.spaceEvenly,
                                        //     children: [
                                        //       InkWell(
                                        //         onTap: () async {
                                        //           String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
                                        //           User? user = FirebaseAuth.instance.currentUser;
                                        //           int uniqueId = UniqueIdGenerator.generateUniqueId();
                                        //
                                        //           context.read<NotifikasiBloc>().add(
                                        //             CreateNotifikasiEvent(
                                        //               notifikasi: Notifikasi(
                                        //                 idNotifikasi: uniqueId,
                                        //                 teksNotifikasi: "Kemahasiswaan telah menerima laporan kegiatan berjudul ${laporan.usulanKegiatan?.namaKegiatan}",
                                        //                 tglNotifikasi: DateTime.now().toString(),
                                        //                 createdAt: currentDate,
                                        //                 createdBy: user?.email ?? "unknown",
                                        //                 updatedAt: currentDate,
                                        //                 updatedBy: user?.email ?? "unknown",
                                        //               ),
                                        //             ),
                                        //           );
                                        //
                                        //           await Future.delayed(const Duration(milliseconds: 500));
                                        //           if (context.mounted) {
                                        //             context.read<LaporanBloc>().add(
                                        //               UpdateLaporanFirstPageEvent(
                                        //                 laporan: laporan.copyWith(
                                        //                   statusLaporan: disetujui,
                                        //                 ),
                                        //               ),
                                        //             );
                                        //           }
                                        //           mipokaCustomToast("Usulan Kegiatan telah diterima.");
                                        //         },
                                        //         child: Image.asset(
                                        //           'assets/icons/approve.png',
                                        //           width: 24,
                                        //         ),
                                        //       ),
                                        //       const SizedBox(
                                        //         width: 8.0,
                                        //       ),
                                        //       InkWell(
                                        //         onTap: () async {
                                        //           String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
                                        //           User? user = FirebaseAuth.instance.currentUser;
                                        //           int uniqueId = UniqueIdGenerator.generateUniqueId();
                                        //
                                        //           context.read<NotifikasiBloc>().add(
                                        //             CreateNotifikasiEvent(
                                        //               notifikasi: Notifikasi(
                                        //                 idNotifikasi: uniqueId,
                                        //                 teksNotifikasi: "Kemahasiswaan telah menolak laporan kegiatan berjudul ${laporan.usulanKegiatan?.namaKegiatan}",
                                        //                 tglNotifikasi: DateTime.now().toString(),
                                        //                 createdAt: currentDate,
                                        //                 createdBy: user?.email ?? "unknown",
                                        //                 updatedAt: currentDate,
                                        //                 updatedBy: user?.email ?? "unknown",
                                        //               ),
                                        //             ),
                                        //           );
                                        //
                                        //           await Future.delayed(const Duration(milliseconds: 500));
                                        //
                                        //           if(context.mounted) {
                                        //             context.read<LaporanBloc>().add(
                                        //               UpdateLaporanFirstPageEvent(
                                        //                 laporan: laporan.copyWith(
                                        //                   statusLaporan: ditolak,
                                        //                 ),
                                        //               ),
                                        //             );
                                        //           }
                                        //
                                        //           mipokaCustomToast("Usulan Kegiatan telah ditolak.");
                                        //         },
                                        //         child: Image.asset(
                                        //           'assets/icons/close.png',
                                        //           width: 24,
                                        //         ),
                                        //       ),
                                        //     ],
                                        //   ) :
                                        //   Center(
                                        //     child: laporan.statusLaporan == disetujui ?
                                        //     Image.asset(
                                        //       'assets/icons/approve.png',
                                        //       width: 24,
                                        //     ) :
                                        //     Image.asset(
                                        //       'assets/icons/close.png',
                                        //       width: 24,
                                        //     ),
                                        //   ),
                                        // ),
                                      ],
                                    );
                                  }),
                                ),
                              ),
                            ),
                          ],
                        );
                      } else if (state is LaporanError) {
                        return Text(state.message);
                      } else {
                        return const Text('IDK');
                      }
                    },
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
