import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/bloc/tertib_acara/tertib_acara_bloc.dart';
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
    required this.idUsulanKegiatan,
  });

  final int idUsulanKegiatan;

  @override
  State<PenggunaPengajuanUsulanKegiatanTertibAcara> createState() => _PenggunaPengajuanUsulanKegiatanTertibAcaraState();
}

class _PenggunaPengajuanUsulanKegiatanTertibAcaraState extends State<PenggunaPengajuanUsulanKegiatanTertibAcara> {

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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CustomMobileTitle(
                text: 'Pengajuan - Kegiatan - Usulan Kegiatan'),
            const CustomFieldSpacer(),
            BlocBuilder<UsulanKegiatanBloc, UsulanKegiatanState>(
              builder: (context, state) {
                if (state is UsulanKegiatanLoading) {
                  return const Text('Loading ...');
                } else if (state is UsulanKegiatanHasData) {
                  final usulanKegiatan = state.usulanKegiatan;

                  return CustomContentBox(
                    children: [
                      buildTitle('Tertib Acara'),
                      buildDescription(
                          'Rincikan alur dari kegiatan yang akan dilaksanakan'),
                      CustomAddButton(
                        buttonText: 'Tertib Acara',
                        onPressed: () => Future.microtask(() {
                          Navigator.pushNamed(
                            context,
                            tambahTertibAcaraPageRoute,
                            arguments: widget.idUsulanKegiatan,
                          ).then((_) => context.read<UsulanKegiatanBloc>()
                              .add(ReadUsulanKegiatanEvent(idUsulanKegiatan: widget.idUsulanKegiatan)));
                        }),
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
                                  'Aksi',
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
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          editTertibAcaraPageRoute,
                                          arguments: tertibAcara,
                                        );
                                      },
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          tertibAcara.aktivitas,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            color: Colors.blue,
                                          ),
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
                                    onTap: () {
                                      context.read<TertibAcaraBloc>().add(
                                          DeleteTertibAcaraEvent(idTertibAcara: tertibAcara.idTertibAcara));
                                      mipokaCustomToast("Tertib Acara telah dihapus");
                                    },
                                    Align(
                                      alignment: Alignment.center,
                                      child: Image.asset(
                                        'assets/icons/delete.png',
                                        width: 24,
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
                            onTap: () => Navigator.pop(context),
                            text: 'Sebelumnya',
                          ),
                          const SizedBox(width: 8.0),
                          CustomMipokaButton(
                            onTap: () => Navigator.pushNamed(
                              context,
                              penggunaPengajuanUsulanKegiatan3PageRoute,
                              arguments: widget.idUsulanKegiatan,
                            ).then((_) => context.read<UsulanKegiatanBloc>()
                                .add(ReadUsulanKegiatanEvent(idUsulanKegiatan: widget.idUsulanKegiatan))),
                            text: 'Berikutnya',
                          ),
                        ],
                      ),
                    ],
                  );
                } else if (state is UsulanKegiatanError) {
                  return Text(state.message);
                } else {
                  return const Text("UsulanKegiatan hasn't been triggered");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
