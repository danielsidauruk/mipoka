import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/multiple_args.dart';
import 'package:mipoka/mipoka/domain/entities/usulan_kegiatan.dart';
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
    required this.usulanArgs,
    super.key,
  });

  final UsulanArgs usulanArgs;

  @override
  State<PenggunaPengajuanUsulanKegiatan2DK> createState() => _PenggunaPengajuanUsulanKegiatan2DKState();
}

class _PenggunaPengajuanUsulanKegiatan2DKState extends State<PenggunaPengajuanUsulanKegiatan2DK> {


  @override
  void initState() {
    context.read<UsulanKegiatanBloc>().add(
        ReadUsulanKegiatanEvent(idUsulanKegiatan: widget.usulanArgs.idUsulan));
    super.initState();
  }

  @override
  void dispose() {
    context.read<UsulanKegiatanBloc>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print ("page 2 dk reloaded");

    return Scaffold(
      appBar: const MipokaMobileAppBar(),
      drawer: const MobileCustomPenggunaDrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CustomMobileTitle(
                text: 'Pengajuan - Kegiatan - Usulan Kegiatan'),

            const CustomFieldSpacer(),

            Expanded(
              child: CustomContentBox(
                children: [

                  BlocConsumer<UsulanKegiatanBloc, UsulanKegiatanState>(
                    listenWhen: (prev, current) =>
                    prev.runtimeType != current.runtimeType,
                    listener: (context, state) {
                      if (state is ManagePartisipanSuccess || state is ManageBiayaKegiatanSuccess) {

                        context.read<UsulanKegiatanBloc>().add(
                            ReadUsulanKegiatanEvent(idUsulanKegiatan: widget.usulanArgs.idUsulan));

                      } else if (state is UsulanKegiatanError) {
                        mipokaCustomToast(state.message);
                      }
                    },

                    builder: (context, state) {
                      if (state is UsulanKegiatanLoading) {
                        return const Text('Loading ...');
                      } else if (state is UsulanKegiatanHasData) {
                        final usulanKegiatan = state.usulanKegiatan;

                        return Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              buildTitle('Data Partisipan Kegiatan (Dalam Kota)'),

                              if (widget.usulanArgs.isRevisiUsulan == true
                                  && state.usulanKegiatan.revisiUsulan?.revisiPartisipan != "")
                                buildRevisiText(state.usulanKegiatan.revisiUsulan?.revisiPartisipan ?? ""),

                              CustomAddButton(
                                buttonText: 'Data Partisipan',
                                onPressed: () async {
                                  final result = await Navigator.pushNamed(
                                    context,
                                    tambahDataPesertaDalamKotaPageRoute,
                                    arguments: usulanKegiatan,
                                  );

                                  if (result != null && result is UsulanKegiatan) {
                                    if (context.mounted) {
                                      context.read<UsulanKegiatanBloc>().add(
                                        ManagePartisipanEvent(
                                          usulanKegiatan: result,
                                        ),
                                      );
                                    }
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
                                              Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  partisipan.noInduk,
                                                  textAlign: TextAlign.center,
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
                                              Row(
                                                children: [
                                                  InkWell(
                                                    onTap: () async {
                                                      final result = await Navigator.pushNamed(
                                                        context,
                                                        editDataPesertaDalamKotaPageRoute,
                                                        arguments: PartisipanArgs(
                                                          index: index,
                                                          usulanKegiatan: usulanKegiatan,
                                                        ),
                                                      );

                                                      if (result != null && result is UsulanKegiatan) {
                                                        if (context.mounted) {
                                                          context.read<UsulanKegiatanBloc>().add(
                                                            ManagePartisipanEvent(
                                                              usulanKegiatan: result,
                                                            ),
                                                          );
                                                        }
                                                      }
                                                    },
                                                    child: Align(
                                                      alignment: Alignment.center,
                                                      child: Image.asset(
                                                        'assets/icons/edit.png',
                                                        width: 24,
                                                      ),
                                                    ),
                                                  ),

                                                  const SizedBox(width: 8.0),

                                                  InkWell(
                                                    onTap: () {
                                                      final partisipanList = usulanKegiatan.partisipan;

                                                      partisipanList.removeAt(index);

                                                      context.read<UsulanKegiatanBloc>().add(
                                                        ManagePartisipanEvent(
                                                          usulanKegiatan: usulanKegiatan.copyWith(
                                                            partisipan: partisipanList,
                                                          ),
                                                        ),
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
                                                ],
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
                              if (widget.usulanArgs.isRevisiUsulan == true
                                  && state.usulanKegiatan.revisiUsulan?.revisiRincianBiayaKegiatan != "")
                                buildRevisiText(state.usulanKegiatan.revisiUsulan?.revisiRincianBiayaKegiatan ?? ""),

                              CustomAddButton(
                                buttonText: 'Biaya Kegiatan',
                                onPressed: () async {
                                  final result = await Navigator.pushNamed(
                                    context,
                                    penggunaPengajuanUsulanKegiatan2BiayaKegiatanPageRoute,
                                    arguments: usulanKegiatan,
                                  );

                                  if (result != null && result is UsulanKegiatan) {
                                    if (context.mounted) {
                                      context.read<UsulanKegiatanBloc>().add(
                                        ManageBiayaKegiatanEvent(
                                          usulanKegiatan: result,
                                        ),
                                      );
                                    }
                                  }
                                },
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
                                                    Align(
                                                      alignment: Alignment.center,
                                                      child: Text(
                                                        biayaKegiatan.namaBiayaKegiatan,
                                                        textAlign: TextAlign.center,
                                                        style: const TextStyle(color: Colors.blue),
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
                                                    Row(
                                                      children: [
                                                        InkWell(
                                                          onTap: () async {
                                                            final result = await Navigator.pushNamed(
                                                              context,
                                                              usulanKegiatanEditBiayaKegiatanPageRoute,
                                                              arguments: BiayaKegiatanArgs(
                                                                index: index,
                                                                usulanKegiatan: usulanKegiatan,
                                                              ),
                                                            );

                                                            if (result != null && result is UsulanKegiatan) {
                                                              if (context.mounted) {
                                                                context.read<UsulanKegiatanBloc>().add(
                                                                  ManageBiayaKegiatanEvent(
                                                                    usulanKegiatan: result,
                                                                  ),
                                                                );
                                                              }
                                                            }
                                                          },
                                                          child: Image.asset(
                                                            'assets/icons/edit.png',
                                                            width: 24,
                                                          ),
                                                        ),

                                                        const SizedBox(width: 8),

                                                        InkWell(
                                                          onTap: () {
                                                            final biayaKegiatanList = usulanKegiatan.biayaKegiatan;

                                                            biayaKegiatanList.removeAt(index);

                                                            context.read<UsulanKegiatanBloc>().add(
                                                              ManageBiayaKegiatanEvent(
                                                                usulanKegiatan: usulanKegiatan.copyWith(
                                                                  biayaKegiatan: biayaKegiatanList,
                                                                ),
                                                              ),
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
                                                      ],
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
                                    onTap: () => Navigator.pop(context, true),
                                    text: 'Sebelumnya',
                                  ),

                                  const SizedBox(width: 8.0),

                                  CustomMipokaButton(
                                    onTap: () async {
                                      final result = await Navigator.pushNamed(
                                        context,
                                        penggunaPengajuanUsulanKegiatanTertibAcaraRoute,
                                        arguments: widget.usulanArgs,
                                      );

                                      if (result != null && result == true && context.mounted) {
                                        context.read<UsulanKegiatanBloc>()
                                            .add(ReadUsulanKegiatanEvent(idUsulanKegiatan: widget.usulanArgs.idUsulan));
                                      }
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
                        return const Text('UsulanKegiatanBloc has not been triggered');
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
