import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:mipoka/domain/utils/download_file_with_dio.dart';
import 'package:mipoka/domain/utils/format_date_indonesia.dart';
import 'package:mipoka/domain/utils/uniqe_id_generator.dart';
import 'package:mipoka/domain/utils/url_utils.dart';
import 'package:mipoka/mipoka/domain/entities/notifikasi.dart';
import 'package:mipoka/mipoka/domain/entities/usulan_kegiatan.dart';
import 'package:mipoka/mipoka/presentation/bloc/notifikasi_bloc/notifikasi_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/usulan_kegiatan_bloc/usulan_kegiatan_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_total_count.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class KemahasiswaanCekUsulanKegiatanPage extends StatefulWidget {
  const KemahasiswaanCekUsulanKegiatanPage({super.key});

  @override
  State<KemahasiswaanCekUsulanKegiatanPage> createState() =>
      _KemahasiswaanCekUsulanKegiatanPageState();
}

class _KemahasiswaanCekUsulanKegiatanPageState
    extends State<KemahasiswaanCekUsulanKegiatanPage> {


  @override
  void initState() {
    context.read<UsulanKegiatanBloc>().add(const ReadAllUsulanKegiatanEvent());
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
            context.read<UsulanKegiatanBloc>().add(const ReadAllUsulanKegiatanEvent());
          },
        ),

        drawer: const CustomKemahasiswaanDrawer(),

        body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomMobileTitle(
                  text: 'Pengajuan - Cek Usulan Kegiatan'),
              const CustomFieldSpacer(),
              CustomContentBox(
                children: [
                  BlocConsumer<UsulanKegiatanBloc, UsulanKegiatanState>(
                    listenWhen: (prev, current) =>
                    prev.runtimeType != current.runtimeType,
                    listener: (context, state) async {

                      if (state is UpdateUsulanKegiatanSuccess) {
                        context.read<UsulanKegiatanBloc>().add(const ReadAllUsulanKegiatanEvent());

                      } else if (state is UsulanKegiatanError) {
                        mipokaCustomToast(state.message);
                      }
                    },

                    builder: (context, state) {
                      if (state is UsulanKegiatanLoading) {
                        return const Text('Loading');
                      } else if (state is AllUsulanKegiatanHasData) {
                        final usulanKegiatanList = state.usulanKegiatanList;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MipokaCountText(total: usulanKegiatanList.length),

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
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
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
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Form Proposal',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Validasi Pembina',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Status Usulan',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                  rows: List<DataRow>.generate(usulanKegiatanList.length, (int index) {
                                    final usulanKegiatan = usulanKegiatanList[index];

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
                                            child: Text(formatDateIndonesia(usulanKegiatan.createdAt)),
                                          ),
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              usulanKegiatan.namaKegiatan,
                                            ),
                                          ),
                                        ),

                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Image.asset(
                                              'assets/icons/document.png',
                                              width: 24,
                                            ),
                                          ),
                                          onTap: usulanKegiatan.validasiPembina == tertunda ||
                                              usulanKegiatan.statusUsulan == tertunda ? () async {

                                            final result = await Navigator.pushNamed(
                                              context,
                                              kemahasiswaanUsulanKegiatanRoute,
                                              arguments: usulanKegiatan,
                                            );

                                            if (result is UsulanKegiatan && context.mounted) {
                                              context.read<UsulanKegiatanBloc>().add(
                                                  UpdateUsulanKegiatanEvent(usulanKegiatan: result));
                                            }
                                          } : null,
                                        ),


                                        DataCell(
                                          Center(
                                            child: usulanKegiatan.validasiPembina == disetujui ?
                                            Image.asset(
                                              'assets/icons/approve.png',
                                              width: 24,
                                            ) :
                                            usulanKegiatan.validasiPembina == ditolak ?
                                            Image.asset(
                                              'assets/icons/close.png',
                                              width: 24,
                                            ) :
                                            Image.asset(
                                              'assets/icons/time.png',
                                              width: 24,
                                            ),
                                          ),
                                        ),

                                        DataCell(
                                          Center(
                                            child: usulanKegiatan.statusUsulan == disetujui ?
                                            Image.asset(
                                              'assets/icons/approve.png',
                                              width: 24,
                                            ) :
                                            usulanKegiatan.statusUsulan == ditolak ?
                                            Image.asset(
                                              'assets/icons/close.png',
                                              width: 24,
                                            ) :
                                            Image.asset(
                                              'assets/icons/time.png',
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
                          ],
                        );
                      } else if (state is UsulanKegiatanError) {
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
      )
    );
  }
}
