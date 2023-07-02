import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/mipoka/presentation/bloc/revisi_usulan_bloc/revisi_usulan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/usulan_kegiatan_bloc/usulan_kegiatan_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_comment_for_table.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/pemeriksa/pemeriksa_custom_drawer.dart';


class PemeriksaPengajuanUsulanKegiatan2DKPage extends StatefulWidget {
  const PemeriksaPengajuanUsulanKegiatan2DKPage({
    super.key, 
    required this.idRevisiUsulan,
  });
  
  final int idRevisiUsulan;

  @override
  State<PemeriksaPengajuanUsulanKegiatan2DKPage> createState() =>
      _PemeriksaPengajuanUsulanKegiatan2DKPageState();
}

class _PemeriksaPengajuanUsulanKegiatan2DKPageState
    extends State<PemeriksaPengajuanUsulanKegiatan2DKPage> {
  final TextEditingController _revisiPesertaKegiatanDalamKotaController =
      TextEditingController();
  final TextEditingController _revisiRincianBiayaKegiatanController =
      TextEditingController();
  
  @override
  void initState() {
    context.read<RevisiUsulanBloc>().add(
      ReadRevisiUsulanEvent(idRevisiUsulan: widget.idRevisiUsulan));
    super.initState();
  }

  @override
  void dispose() {
    context.read<RevisiUsulanBloc>().close();
    context.read<UsulanKegiatanBloc>().close();
    super.dispose();
  }

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
              child: BlocBuilder<RevisiUsulanBloc, RevisiUsulanState>(
                builder: (context, state) {
                  if (state is RevisiUsulanLoading) {
                    return const Text("Loading ....");
                  } else if (state is RevisiUsulanHasData) {
                    final revisiUsulan = state.revisiUsulan;

                    _revisiPesertaKegiatanDalamKotaController.text = revisiUsulan.revisiPartisipan;
                    _revisiRincianBiayaKegiatanController.text = revisiUsulan.revisiRincianBiayaKegiatan;

                    context.read<UsulanKegiatanBloc>().add(
                      ReadUsulanKegiatanEvent(idUsulanKegiatan: revisiUsulan.idUsulan));

                    return BlocBuilder<UsulanKegiatanBloc, UsulanKegiatanState>(
                      builder: (context, state) {
                        if (state is UsulanKegiatanLoading) {
                          return const Text("Loading ...");
                        } else if (state is UsulanKegiatanHasData) {
                          final usulanKegiatanList = state.usulanKegiatan;

                          return CustomContentBox(
                            children: [
                              CustomCommentForTable(
                                title: 'Data Peserta Kegiatan (Dalam Kota)',
                                controller: _revisiPesertaKegiatanDalamKotaController,
                              ),
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
                                      ],
                                      rows: List<DataRow>.generate(usulanKegiatanList.partisipan.length, (int index) {
                                        final partisipan = usulanKegiatanList.partisipan[index];

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
                                                child: Text(partisipan.noInduk),
                                              ),
                                            ),
                                            DataCell(
                                              Align(
                                                alignment: Alignment.center,
                                                child: Text(partisipan.namaPartisipan),
                                              ),
                                            ),
                                            DataCell(
                                              Align(
                                                alignment: Alignment.center,
                                                child: Text(partisipan.peranPartisipan),
                                              ),
                                            ),
                                            DataCell(
                                              Align(
                                                alignment: Alignment.center,
                                                child: Text(partisipan.dasarPengiriman),
                                              ),
                                            ),
                                          ],
                                        );
                                      }),
                                    ),
                                  ),
                                ),
                              ),
                              const CustomFieldSpacer(height: 16.0),
                              CustomCommentForTable(
                                title: 'Rincian Biaya Kegiatan',
                                controller: _revisiRincianBiayaKegiatanController,
                              ),
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
                                            ],
                                            rows: List.generate(usulanKegiatanList.biayaKegiatan.length, (int index) {
                                              final biayaKegiatan = usulanKegiatanList.biayaKegiatan[index];

                                              return DataRow(
                                                cells: [
                                                  DataCell(
                                                    Align(
                                                      alignment: Alignment.center,
                                                      child: Text("${index + 1}"),
                                                    ),
                                                  ),
                                                  DataCell(
                                                    Align(
                                                      alignment: Alignment.center,
                                                      child: Text(biayaKegiatan.namaBiayaKegiatan),
                                                    ),
                                                  ),
                                                  DataCell(
                                                    Align(
                                                      alignment: Alignment.center,
                                                      child: Text("${biayaKegiatan.kuantiti}"),
                                                    ),
                                                  ),
                                                  DataCell(
                                                    Align(
                                                      alignment: Alignment.center,
                                                      child: Text("${biayaKegiatan.hargaSatuan}"),
                                                    ),
                                                  ),
                                                  DataCell(
                                                    Align(
                                                      alignment: Alignment.center,
                                                      child: Text("${biayaKegiatan.total}"),
                                                    ),
                                                  ),
                                                  DataCell(
                                                    Align(
                                                      alignment: Alignment.center,
                                                      child: Text(biayaKegiatan.keterangan),
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
                                      pemeriksaPengajuanUsulanKegiatan3PageRoute,
                                      arguments: widget.idRevisiUsulan,
                                    ),
                                    text: 'Berikutnya',
                                  ),
                                ],
                              ),
                            ],
                          );
                        } else if (state is UsulanKegiatanError) {
                          return Text(state.message);
                        } else {
                          return const Text("UsulanKegiatanBloc hasn't been triggered yet.");
                        }
                      },
                    );
                  } else if (state is RevisiUsulanError) {
                    return Text(state.message);
                  } else {
                    return const Text("RevisiUsulanBloc hasn't been triggered yet.");
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
