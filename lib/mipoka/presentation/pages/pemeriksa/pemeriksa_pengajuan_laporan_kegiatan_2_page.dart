import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/mipoka/presentation/bloc/laporan_bloc/laporan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/revisi_laporan_bloc/revisi_laporan_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_comment_for_table.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/pemeriksa/pemeriksa_custom_drawer.dart';

// => Fixed ContentBox

class PemeriksaPengajuanLaporanKegiatan2Page extends StatefulWidget {
  const PemeriksaPengajuanLaporanKegiatan2Page({
    required this.idRevisiLaporan,
    super.key,
  });

  final int idRevisiLaporan;

  @override
  State<PemeriksaPengajuanLaporanKegiatan2Page> createState() =>
      _PemeriksaPengajuanLaporanKegiatan2PageState();
}

class _PemeriksaPengajuanLaporanKegiatan2PageState
    extends State<PemeriksaPengajuanLaporanKegiatan2Page> {
  
  @override
  void initState() {
    context.read<RevisiLaporanBloc>().add(
        ReadRevisiLaporanEvent(idRevisiLaporan: widget.idRevisiLaporan));
    super.initState();
  }

  @override
  void dispose() {
    context.read<RevisiLaporanBloc>().close();
    context.read<LaporanBloc>().close();
    super.dispose();
  }
  
  final TextEditingController _dataPesertaKegiatanController =
  TextEditingController();
  final TextEditingController _realisasiBiayaKegiatanController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MipokaMobileAppBar(),
      drawer: const MobileCustomPemeriksaDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const CustomMobileTitle(
                text: 'Pemeriksa - Kegiatan - Usulan Kegiatan'),
            const CustomFieldSpacer(),
            Expanded(
              child: BlocBuilder<RevisiLaporanBloc, RevisiLaporanState>(
                builder: (context, state) {
                  if (state is RevisiLaporanLoading) {
                    return const Text("Loading ....");
                  } else if (state is RevisiLaporanHasData) {
                    final revisiLaporan = state.revisiLaporan;
                    
                    _dataPesertaKegiatanController.text = state.revisiLaporan.revisiPesertaKegiatanLaporan;
                    _realisasiBiayaKegiatanController.text = state.revisiLaporan.revisiBiayaKegiatan;
                    
                    context.read<LaporanBloc>().add(ReadLaporanEvent(idLaporan: revisiLaporan.idLaporan));

                    return BlocBuilder<LaporanBloc, LaporanState>(
                      builder: (context, state) {
                        if (state is LaporanLoading) {
                          return const Text("Loading ...");
                        } else if (state is LaporanHasData) {
                          final laporan = state.laporan;

                          return CustomContentBox(
                            children: [
                              CustomCommentForTable(
                                title: 'Data Peserta Kegiatan',
                                controller: _dataPesertaKegiatanController,
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
                                        ],
                                        rows: List<DataRow>.generate(laporan.pesertaKegiatanLaporan.length, (int index) {
                                          final peserta = laporan.pesertaKegiatanLaporan[index];

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
                                                    peserta.nim,
                                                  ),
                                                ),
                                              ),
                                              DataCell(
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    peserta.namaLengkap,
                                                  ),
                                                ),
                                              ),
                                              DataCell(
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                   peserta.peran,
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
                              CustomCommentForTable(
                                title: 'Realisasi Biaya Kegiatan',
                                controller: _realisasiBiayaKegiatanController,
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
                                                      'Kuantitas',
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
                                              rows: List.generate(laporan.rincianBiayaKegiatan.length, (int index) {
                                                final rincianBiaya = laporan.rincianBiayaKegiatan[index];

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
                                                        child: Text(rincianBiaya.namaBiaya),
                                                      ),
                                                    ),
                                                    DataCell(
                                                      Align(
                                                        alignment: Alignment.center,
                                                        child: Text("${rincianBiaya.kuantitas}"),
                                                      ),
                                                    ),
                                                    DataCell(
                                                      Align(
                                                        alignment: Alignment.center,
                                                        child: Text("${rincianBiaya.hargaSatuan}"),
                                                      ),
                                                    ),
                                                    DataCell(
                                                      Align(
                                                        alignment: Alignment.center,
                                                        child:
                                                        Text("${rincianBiaya.usulanAnggaran}"),
                                                      ),
                                                    ),
                                                    DataCell(
                                                      Align(
                                                        alignment: Alignment.center,
                                                        child: Text("${rincianBiaya.realisasiAnggaran}")
                                                      ),
                                                    ),
                                                    DataCell(
                                                      Align(
                                                        alignment: Alignment.center,
                                                        child: Text("${rincianBiaya.selisih}"),
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
                                  CustomMipokaButton(
                                    onTap: () => Navigator.pop(context),
                                    text: 'Sebelumnya',
                                  ),
                                  const SizedBox(width: 8.0),
                                  CustomMipokaButton(
                                    onTap: () => Navigator.pushNamed(
                                      context,
                                      pemeriksaPengajuanLaporanKegiatan3PageRoute,
                                      arguments: widget.idRevisiLaporan,
                                    ),
                                    text: 'Berikutnya',
                                  ),
                                ],
                              ),
                            ],
                          );
                        } else if (state is LaporanError) {
                          return Text(state.message);
                        } else {
                          return const Text("LaporanBloc hasn't triggered yet.");
                        }
                      },
                    );
                  } else if (state is RevisiLaporanError) {
                    return Text(state.message);
                  } else {
                    return const Text("RevisiLaporanBloc hasn't been triggered yet.");
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}