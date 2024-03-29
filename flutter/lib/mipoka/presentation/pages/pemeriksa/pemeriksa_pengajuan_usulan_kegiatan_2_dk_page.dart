import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/mipoka/presentation/bloc/usulan_kegiatan_bloc/usulan_kegiatan_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_comment_for_table.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
import 'package:mipoka/mipoka/presentation/widgets/pemeriksa/pemeriksa_custom_drawer.dart';


class PemeriksaPengajuanUsulanKegiatan2DKPage extends StatefulWidget {
  const PemeriksaPengajuanUsulanKegiatan2DKPage({
    super.key, 
    required this.idUsulan,
  });
  
  final int idUsulan;

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
    context.read<UsulanKegiatanBloc>().add(
      ReadUsulanKegiatanEvent(idUsulanKegiatan: widget.idUsulan));
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
      appBar: MipokaMobileAppBar(
        onRefresh: () {
          mipokaCustomToast(refreshMessage);
          context.read<UsulanKegiatanBloc>().add(
              ReadUsulanKegiatanEvent(idUsulanKegiatan: widget.idUsulan));
        },
      ),

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
              child: CustomContentBox(
                children: [
                  BlocConsumer<UsulanKegiatanBloc, UsulanKegiatanState>(
                    listenWhen: (prev, current) =>
                    prev.runtimeType != current.runtimeType,
                    listener: (context, state) async {
                      if (state is SaveReviseSecondPageSuccess) {

                        Navigator.pushNamed(
                          context,
                          pemeriksaPengajuanUsulanKegiatan3PageRoute,
                          arguments: widget.idUsulan,
                        ).then((_) => context.read<UsulanKegiatanBloc>().add(
                            ReadUsulanKegiatanEvent(idUsulanKegiatan: widget.idUsulan)));

                      } else if (state is UsulanKegiatanError) {
                        mipokaCustomToast(state.message);
                      }
                    },
                    builder: (context, state) {
                      if (state is UsulanKegiatanLoading) {
                        return const Text("Loading ...");
                      } else if (state is UsulanKegiatanHasData) {
                        final usulanKegiatan = state.usulanKegiatan;

                        _revisiPesertaKegiatanDalamKotaController.text = usulanKegiatan.revisiUsulan?.revisiPartisipan ?? "";
                        _revisiRincianBiayaKegiatanController.text = usulanKegiatan.revisiUsulan?.revisiRincianBiayaKegiatan ?? "";

                        return Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                      rows: List<DataRow>.generate(usulanKegiatan.partisipan.length, (int index) {
                                        final partisipan = usulanKegiatan.partisipan[index];

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
                                title: 'Biaya Kegiatan',
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
                                            rows: List.generate(usulanKegiatan.biayaKegiatan.length, (int index) {
                                              final biayaKegiatan = usulanKegiatan.biayaKegiatan[index];

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
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    text: 'Sebelumnya',
                                  ),
                                  const SizedBox(width: 8.0),
                                  CustomMipokaButton(
                                    onTap: () {
                                      context.read<UsulanKegiatanBloc>().add(
                                        SaveReviseSecondPageEvent(
                                          usulanKegiatan: usulanKegiatan.copyWith(
                                            revisiUsulan: usulanKegiatan.revisiUsulan?.copyWith(
                                              revisiPartisipan: _revisiPesertaKegiatanDalamKotaController.text,
                                              revisiRincianBiayaKegiatan: _revisiRincianBiayaKegiatanController.text,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
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
                        print ("Pemeriksa Usulan 2 DK hasn't been triggered yet.");
                        return const SizedBox();
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
