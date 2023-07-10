import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/download_file_with_dio.dart';
import 'package:mipoka/domain/utils/to_snake_case.dart';
import 'package:mipoka/mipoka/domain/entities/laporan.dart';
import 'package:mipoka/mipoka/presentation/bloc/laporan_bloc/laporan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/usulan_kegiatan_bloc/usulan_kegiatan_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';

class PenggunaDaftarLaporanKegiatan extends StatefulWidget {
  const PenggunaDaftarLaporanKegiatan({super.key});

  @override
  State<PenggunaDaftarLaporanKegiatan> createState() => _PenggunaDaftarLaporanKegiatanState();
}

class _PenggunaDaftarLaporanKegiatanState extends State<PenggunaDaftarLaporanKegiatan> {

  @override
  void initState() {
    context.read<LaporanBloc>().add(const ReadAllLaporanEvent());
    super.initState();
  }

  @override
  void dispose() {
    context.read<LaporanBloc>().close();
    context.read<UsulanKegiatanBloc>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MipokaMobileAppBar(),
      drawer: const MobileCustomPenggunaDrawerWidget(),
      body: BlocBuilder<LaporanBloc, LaporanState>(
        builder: (context, laporanState) {
          if (laporanState is LaporanLoading) {
            return const Text('Loading');
          } else if (laporanState is AllLaporanHasData) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  const CustomMobileTitle(
                      text: 'Pengajuan - Kegiatan - Laporan Kegiatan'),

                  const CustomFieldSpacer(),

                  CustomContentBox(
                    children: [
                      customBoxTitle('Status'),

                      const CustomFieldSpacer(height: 4.0),

                      MipokaCustomDropdown(
                        items: listStatus,
                        onValueChanged: (value) {
                          context.read<LaporanBloc>().add(
                              ReadAllLaporanEvent(filter: value!));
                        },
                      ),
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

                              BlocProvider.of<UsulanKegiatanBloc>(context, listen: false)
                                  .add(ReadUsulanKegiatanEvent(idUsulanKegiatan: laporan.idUsulan));

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
                                        laporan.createdBy,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    BlocBuilder<UsulanKegiatanBloc, UsulanKegiatanState>(
                                      builder: (context, state) {
                                        if (state is UsulanKegiatanLoading) {
                                          return const Text('Loading ...');
                                        } else if (state is UsulanKegiatanHasData) {
                                          return Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              state.usulanKegiatan.namaKegiatan,
                                            ),
                                          );
                                        } else if (state is UsulanKegiatanError) {
                                          return Text(state.message);
                                        } else {
                                          return const Text("UsulanKegiatanBloc hasn't been triggered");
                                        }
                                      },
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
                                      child: laporan.validasiPembina == true ?
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
                          Navigator.pushNamed(
                            context,
                            penggunaPengajuanLaporanKegiatanPage1Route,
                            arguments: newId,
                          ).then((_) => context.read<LaporanBloc>().add(
                              const ReadAllLaporanEvent()));

                          context.read<LaporanBloc>().add(
                            CreateLaporanEvent(
                              laporan: Laporan(
                                idLaporan: newId,
                                idOrmawa: 0,
                                idUser: user?.uid ?? "unknown",
                                idUsulan: 0,
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
                                fotoDokumentasiKegiatan: const [],
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
                  ),
                ],
              ),
            );
          } else if (laporanState is LaporanError) {
            return Text(laporanState.message);
          } else {
            if (kDebugMode) {
              print("LaporanBloc hasn't been triggered yet.");
            }
            return const Center();
          }
        },
      ),
    );
  }
}
