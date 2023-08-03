import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/download_file_with_dio.dart';
import 'package:mipoka/domain/utils/multiple_args.dart';
import 'package:mipoka/domain/utils/to_snake_case.dart';
import 'package:mipoka/domain/utils/uniqe_id_generator.dart';
import 'package:mipoka/mipoka/domain/entities/laporan.dart';
import 'package:mipoka/mipoka/domain/entities/rincian_biaya_kegiatan.dart';
import 'package:mipoka/mipoka/presentation/bloc/laporan_bloc/laporan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/usulan_kegiatan_bloc/usulan_kegiatan_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_total_count.dart';

class PenggunaDaftarLaporanKegiatan extends StatefulWidget {
  const PenggunaDaftarLaporanKegiatan({super.key});

  @override
  State<PenggunaDaftarLaporanKegiatan> createState() => _PenggunaDaftarLaporanKegiatanState();
}

class _PenggunaDaftarLaporanKegiatanState extends State<PenggunaDaftarLaporanKegiatan> {

  String? _filter;
  User? user = FirebaseAuth.instance.currentUser;
  int uniqueId = UniqueIdGenerator.generateUniqueId();

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

      drawer: const MobileCustomPenggunaDrawerWidget(),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              const CustomMobileTitle(
                  text: 'Pengajuan - Kegiatan - Laporan Kegiatan'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [
                  BlocConsumer<LaporanBloc, LaporanState>(
                    listenWhen: (prev, current) =>
                    prev.runtimeType != current.runtimeType,
                    listener: (context, state) async {

                      if (state is CreateLaporanSuccess) {
                        print("these createLaporanSuccess Emmited.");
                        Navigator.pushNamed(
                          context,
                          penggunaPengajuanLaporanKegiatanPage1Route,
                          arguments: LaporanArgs(idLaporan: uniqueId),
                        ).then((_) => context.read<LaporanBloc>().add(const ReadAllLaporanEvent()));

                      }
                      // else if (state is DeleteLaporanSuccess) {
                      //   context.read<LaporanBloc>().add(const ReadAllLaporanEvent());
                      // }
                      else if (state is LaporanError) {
                        mipokaCustomToast(state.message);
                      }
                    },
                    builder: (context, laporanState) {
                      if (laporanState is LaporanLoading) {
                        return const Text('Loading');
                      } else if (laporanState is AllLaporanHasData) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // customBoxTitle('Status'),
                            //
                            // const CustomFieldSpacer(height: 4.0),
                            //
                            // MipokaCustomDropdown(
                            //   items: listStatus,
                            //   onValueChanged: (value) {
                            //     _filter = value;
                            //     context.read<LaporanBloc>().add(
                            //         ReadAllLaporanEvent(filter: _filter ?? "Semua"));
                            //   },
                            // ),
                            MipokaCountText(total: laporanState.laporanList.length),

                            const CustomFieldSpacer(),

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
                                        'Tanggal Mengirim Laporan Kegiatan',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Nama Pelapor',
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
                                        'Laporan Kegiatan',
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
                                  rows: List<DataRow>.generate(laporanState.laporanList.length, (int index) {
                                    final laporan = laporanState.laporanList[index];

                                    // BlocProvider.of<UsulanKegiatanBloc>(context, listen: false)
                                    //     .add(ReadUsulanKegiatanEvent(idUsulanKegiatan: laporan.usulanKegiatan));

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
                                            child: Text(
                                              laporan.createdAt,
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              laporan.usulanKegiatan?.mipokaUser.namaLengkap ?? "",
                                            ),
                                          ),
                                        ),
                                        laporan.statusLaporan != ditolak ?
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              laporan.usulanKegiatan?.namaKegiatan ?? "",
                                            ),
                                          ),
                                        ) :
                                        DataCell(
                                          onTap: () async {
                                            final result = await Navigator.pushNamed(
                                              context,
                                              penggunaPengajuanLaporanKegiatanPage1Route,
                                              arguments: LaporanArgs(
                                                idLaporan: laporan.idLaporan,
                                                isRevisiLaporan: true,
                                              ),
                                            );

                                            if (result != null && result == true && context.mounted) {
                                              context.read<LaporanBloc>().add(const ReadAllLaporanEvent());
                                            }
                                          },
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              laporan.usulanKegiatan?.namaKegiatan ?? "",
                                              style: TextStyle(color: Colors.yellow[200]),
                                            ),
                                          ),
                                        ),

                                        DataCell(
                                          onTap: () => downloadFileWithDio(
                                            url: laporan.fileLaporanKegiatan,
                                            fileName: "laporan_kegiatan_${toSnakeCase(laporan.idLaporan.toString())}.docx",
                                          ),
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
                                            child: laporan.validasiPembina == "true" ?
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
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              laporan.statusLaporan,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                                ),
                              ),
                            ),

                            const CustomFieldSpacer(),
                            CustomMipokaButton(
                              onTap: () {
                                String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

                                context.read<LaporanBloc>().add(
                                  CreateLaporanEvent(
                                    laporan: Laporan(
                                      idLaporan: uniqueId,
                                      revisiLaporan: null,
                                      usulanKegiatan: null,
                                      pencapaian: "",
                                      pesertaKegiatanLaporan: const [],
                                      rincianBiayaKegiatan: const [],
                                      totalUsulan: 0,
                                      totalRealisasi: 0,
                                      totalSelisih: 0,
                                      latarBelakang: "",
                                      hasilKegiatan: "",
                                      penutup: "",
                                      fotoPostinganKegiatan: "",
                                      fotoDokumentasiKegiatan: "",
                                      fotoTabulasiHasil: "",
                                      fotoFakturPembayaran: "",
                                      fileLaporanKegiatan: "",
                                      validasiPembina: "false",
                                      statusLaporan: "",
                                      createdAt: currentDate,
                                      createdBy: user?.email ?? "unknown",
                                      updatedAt: currentDate,
                                      updatedBy: user?.email ?? "unknown",
                                    ),
                                  ),
                                );
                              },
                              text: 'Laporkan Kegiatan',
                            ),
                          ],
                        );
                      } else if (laporanState is LaporanError) {
                        return Text(laporanState.message);
                      } else {
                        if (kDebugMode) {
                          print("LaporanBloc Page 1 hasn't been triggered yet.");
                        }
                        return const Center();
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
