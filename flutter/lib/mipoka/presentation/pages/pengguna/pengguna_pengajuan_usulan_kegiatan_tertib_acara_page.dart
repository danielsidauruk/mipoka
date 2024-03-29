import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
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

class PenggunaPengajuanUsulanKegiatanTertibAcara extends StatefulWidget {
  const PenggunaPengajuanUsulanKegiatanTertibAcara({
    super.key,
    required this.usulanArgs,
  });

  final UsulanArgs usulanArgs;

  @override
  State<PenggunaPengajuanUsulanKegiatanTertibAcara> createState() => _PenggunaPengajuanUsulanKegiatanTertibAcaraState();
}

class _PenggunaPengajuanUsulanKegiatanTertibAcaraState extends State<PenggunaPengajuanUsulanKegiatanTertibAcara> {

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
    return Scaffold(
      appBar: MipokaMobileAppBar(
        onRefresh: () {
          mipokaCustomToast(refreshMessage);
          context.read<UsulanKegiatanBloc>().add(
              ReadUsulanKegiatanEvent(idUsulanKegiatan: widget.usulanArgs.idUsulan));
        },
      ),

      drawer: const MobileCustomPenggunaDrawerWidget(),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CustomMobileTitle(
                text: 'Pengajuan - Kegiatan - Usulan Kegiatan'),
            const CustomFieldSpacer(),

            CustomContentBox(
              children: [
                buildTitle('Tertib Acara'),
                buildDescription(
                    'Rincikan alur dari kegiatan yang akan dilaksanakan'),

                BlocConsumer<UsulanKegiatanBloc, UsulanKegiatanState>(
                  listenWhen: (prev, current) =>
                  prev.runtimeType != current.runtimeType,
                  listener: (context, state) {
                    if (state is ManageTertibAcaraSuccess) {

                      context.read<UsulanKegiatanBloc>().add(
                          ReadUsulanKegiatanEvent(idUsulanKegiatan: widget.usulanArgs.idUsulan));

                    }
                    else if (state is UsulanKegiatanError) {
                      mipokaCustomToast(state.message);
                    }
                  },
                  builder: (context, state) {
                    if (state is UsulanKegiatanLoading) {
                      return const Text('Loading ...');
                    } else if (state is UsulanKegiatanHasData) {
                      final usulanKegiatan = state.usulanKegiatan;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (widget.usulanArgs.isRevisiUsulan == true
                              && state.usulanKegiatan.revisiUsulan?.revisiIdTertibAcara != "")
                            buildRevisiText(state.usulanKegiatan.revisiUsulan?.revisiIdTertibAcara ?? ""),

                          CustomAddButton(
                            buttonText: 'Tertib Acara',
                            onPressed: () async {
                              final result = await Navigator.pushNamed(
                                context,
                                tambahTertibAcaraPageRoute,
                                arguments: usulanKegiatan,
                              );

                              if (result != null && result is UsulanKegiatan) {
                                if (context.mounted) {
                                  context.read<UsulanKegiatanBloc>().add(
                                    ManageTertibAcaraEvent(
                                      usulanKegiatan: result,
                                    ),
                                  );
                                }
                              }
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
                                      'Aktivitas',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Waktu Mulai',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Waktu Selesai',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Keterangan',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      "",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                                rows: List<DataRow>.generate(usulanKegiatan.tertibAcara.length, (int index) {
                                  final tertibAcara = usulanKegiatan.tertibAcara[index];
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
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              tertibAcara.aktivitas,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            tertibAcara.waktuMulai,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            tertibAcara.waktuSelesai,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            tertibAcara.keterangan,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        InkWell(
                                          onTap: () {
                                            final tertibAcaraList = usulanKegiatan.tertibAcara;
                                            tertibAcaraList.removeAt(index);

                                            context.read<UsulanKegiatanBloc>().add(
                                              ManageTertibAcaraEvent(
                                                usulanKegiatan: usulanKegiatan.copyWith(
                                                  tertibAcara: tertibAcaraList,
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
                                      ),
                                    ],
                                  );
                                }),
                              ),
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
                                    penggunaPengajuanUsulanKegiatan3PageRoute,
                                    arguments: widget.usulanArgs,
                                  );

                                  if (result == true && context.mounted) {
                                    context.read<UsulanKegiatanBloc>()
                                        .add(ReadUsulanKegiatanEvent(idUsulanKegiatan: widget.usulanArgs.idUsulan));
                                  }
                                },
                                text: 'Berikutnya',
                              ),
                            ],
                          ),
                        ],
                      );
                    } else if (state is UsulanKegiatanError) {
                      return Text(state.message);
                    } else {

                      return IconButton(
                        onPressed: () => context.read<UsulanKegiatanBloc>()
                            .add(ReadUsulanKegiatanEvent(idUsulanKegiatan: widget.usulanArgs.idUsulan)),
                        icon: const Center(
                          child: Icon(
                            Icons.replay,
                            size: 34,
                          ),
                        ),
                      );
                    }
                  },
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
