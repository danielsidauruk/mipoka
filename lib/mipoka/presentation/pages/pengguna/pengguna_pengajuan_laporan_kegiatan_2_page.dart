import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/multiple_args.dart';
import 'package:mipoka/mipoka/domain/entities/laporan.dart';
import 'package:mipoka/mipoka/presentation/bloc/laporan_bloc/laporan_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_add_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_switch.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';

class PenggunaPengajuanLaporanKegiatan2 extends StatefulWidget {
  const PenggunaPengajuanLaporanKegiatan2({
    required this.laporanArgs,
    super.key,
  });

  final LaporanArgs laporanArgs;

  @override
  State<PenggunaPengajuanLaporanKegiatan2> createState() => _PenggunaPengajuanLaporanKegiatan2State();
}

class _PenggunaPengajuanLaporanKegiatan2State extends State<PenggunaPengajuanLaporanKegiatan2> {

  @override
  void initState() {
    context.read<LaporanBloc>().add(
        ReadLaporanEvent(idLaporan: widget.laporanArgs.idLaporan)
    );
    super.initState();
  }

  @override
  void dispose() {
    context.read<LaporanBloc>().close();
    super.dispose();
  }

  final StreamController<bool> _dataPesertaStream = StreamController<bool>.broadcast();
  bool _isShowTable = false;

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
                text: 'Pengajuan - Kegiatan - Laporan Kegiatan'),

            const SizedBox(height: 8.0),

            Expanded(
              child: CustomContentBox(
                children: [

                  BlocConsumer<LaporanBloc, LaporanState>(
                    listenWhen: (prev, current) =>
                    prev.runtimeType != current.runtimeType,
                    listener: (context, state) async {
                      if (state is UpdateLaporanSecondPageSuccess) {

                        context.read<LaporanBloc>().add(
                            ReadLaporanEvent(idLaporan: widget.laporanArgs.idLaporan));

                      } else if (state is LaporanError) {
                        mipokaCustomToast(state.message);
                      }
                    },

                    builder: (context, state) {
                      if (state is LaporanLoading) {
                        return const Text('Loading ...');
                      } else if (state is LaporanHasData) {
                        final laporan = state.laporan;

                        _isShowTable = laporan.pesertaKegiatanLaporan.isNotEmpty;

                        return Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              MipokaCustomSwitchButton(
                                title: 'Data Peserta Kegiatan',
                                option1: '',
                                option2: '',
                                value: _isShowTable,
                                onChanged: (value) {
                                  _isShowTable = value;
                                  _dataPesertaStream.add(value);
                                },
                              ),

                              StreamBuilder<bool?>(
                                initialData: _isShowTable,
                                stream: _dataPesertaStream.stream,
                                builder: (context, snapshot) {
                                  return _isShowTable == true ?

                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        if (widget.laporanArgs.isRevisiLaporan == true
                                            && laporan.revisiLaporan?.revisiPesertaKegiatanLaporan != "")
                                          buildRevisiText(laporan.revisiLaporan?.revisiPesertaKegiatanLaporan ?? ""),

                                        CustomAddButton(
                                          buttonText: 'Import Peserta',
                                          onPressed: () async {
                                            final result = await Navigator.pushNamed(
                                              context,
                                              importPesertaLaporanPageRoute,
                                              arguments: laporan,
                                            );

                                            if (result != null && result is Laporan && context.mounted) {
                                              context.read<LaporanBloc>().add(
                                                  UpdateLaporanSecondPageEvent(laporan: result));
                                            }

                                          },
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
                                                ],
                                                rows: List<DataRow>.generate(laporan.pesertaKegiatanLaporan.length, (int index) {
                                                  final pesertaKegiatanLaporan = laporan.pesertaKegiatanLaporan[index];
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
                                                            pesertaKegiatanLaporan.nim,
                                                          ),
                                                        ),
                                                      ),
                                                      DataCell(
                                                        Align(
                                                          alignment: Alignment.center,
                                                          child: Text(
                                                            pesertaKegiatanLaporan.namaLengkap,
                                                          ),
                                                        ),
                                                      ),
                                                      DataCell(
                                                        Align(
                                                          alignment: Alignment.center,
                                                          child: Text(
                                                            pesertaKegiatanLaporan.peran,
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
                                  ) :

                                  const SizedBox();
                                }
                              ),

                              const CustomFieldSpacer(),

                              buildTitle('Realisasi Biaya Kegiatan'),
                              if (widget.laporanArgs.isRevisiLaporan == true
                                  && laporan.revisiLaporan?.revisiPencapaian != "")
                                buildRevisiText(laporan.revisiLaporan?.revisiPencapaian ?? ""),

                              CustomAddButton(
                                buttonText: 'Biaya Kegiatan',
                                onPressed: () async {
                                  final result = await Navigator.pushNamed(
                                    context,
                                    laporanKegiatanTambahBiayaKegiatanPageRoute,
                                    arguments: laporan,
                                  );

                                  if (result != null && result is Laporan && context.mounted) {
                                    context.read<LaporanBloc>().add(
                                        UpdateLaporanSecondPageEvent(laporan: result));
                                  }
                                },
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
                                        final rincianBiayaKegiatan = laporan.rincianBiayaKegiatan[index];

                                        return DataRow(
                                          cells: [
                                            DataCell(
                                              Align(
                                                alignment: Alignment.center,
                                                child: Text('${index + 1}'),
                                              ),
                                            ),
                                            DataCell(
                                              onTap: () async {
                                                final result = await Navigator.pushNamed(
                                                  context,
                                                  laporanKegiatanEditBiayaKegiatanPageRoute,
                                                  arguments: rincianBiayaKegiatan,
                                                );

                                                if(result != null && result is Laporan && context.mounted) {
                                                  context.read<LaporanBloc>().add(
                                                    UpdateLaporanSecondPageEvent(laporan: result),
                                                  );
                                                }

                                              },
                                              Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  rincianBiayaKegiatan.namaBiaya,
                                                  style: const TextStyle(
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  '${rincianBiayaKegiatan.kuantitas}',
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  '${rincianBiayaKegiatan.hargaSatuan}',
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Align(
                                                alignment: Alignment.center,
                                                child:
                                                Text('${rincianBiayaKegiatan.usulanAnggaran}'),
                                              ),
                                            ),
                                            DataCell(
                                              Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                    '${rincianBiayaKegiatan.realisasiAnggaran}'),
                                              ),
                                            ),
                                            DataCell(
                                              Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "${rincianBiayaKegiatan.selisih}",
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
                                    onTap: () async {
                                      final result = await Navigator.pushNamed(
                                        context,
                                        penggunaPengajuanLaporanKegiatan3PageRoute,
                                        arguments: widget.laporanArgs,
                                      );

                                      if(result != null && result == true && context.mounted) {
                                        context.read<LaporanBloc>().add(
                                            ReadLaporanEvent(idLaporan: widget.laporanArgs.idLaporan)
                                        );
                                      }
                                    },
                                    text: 'Berikutnya',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      } else if (state is LaporanError) {
                        return Text(state.message);
                      } else {
                        if (kDebugMode) {
                          print('LaporanBloc has not been triggered.');
                        }
                        return const Center();
                      }
                    },
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
