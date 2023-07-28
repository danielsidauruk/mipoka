import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:mipoka/domain/utils/download_file_with_dio.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MipokaMobileAppBar(),
      drawer: const MobileCustomKemahasiswaanDrawer(),
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
                  buildTitle('Status'),
                  MipokaCustomDropdown(
                    items: listStatus,
                    onValueChanged: (value) {
                      // filter = value ?? "semua";
                      context.read<UsulanKegiatanBloc>().add(
                          const ReadAllUsulanKegiatanEvent());
                    },
                  ),
                  const CustomFieldSpacer(),

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
                                        'Nama Kegiatan',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'File Proposal',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Validasi Pengguna',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Aksi',
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
                                            child: Text(
                                              usulanKegiatan.namaKegiatan,
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Center(
                                            child: InkWell(
                                              onTap: () => downloadFileWithDio(
                                                  url: usulanKegiatan.fileUsulanKegiatan,
                                                  fileName: "file"),
                                              child: Image.asset(
                                                'assets/icons/pdf.png',
                                                width: 24,
                                              ),
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Center(
                                            child: usulanKegiatan.validasiPembina == "true"
                                                ? Image.asset(
                                              'assets/icons/approve.png',
                                              width: 24,
                                            )
                                                : Image.asset(
                                              'assets/icons/close.png',
                                              width: 24,
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          usulanKegiatan.statusUsulan == tertunda ?
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: [
                                              InkWell(
                                                onTap: (){
                                                  UpdateUsulanKegiatanEvent(
                                                    usulanKegiatan: usulanKegiatan.copyWith(
                                                      statusUsulan: disetujui,
                                                    ),
                                                  );
                                                  mipokaCustomToast("Usulan Kegiatan telah diterima.");
                                                },
                                                child: Image.asset(
                                                  'assets/icons/approve.png',
                                                  width: 24,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 8.0,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  context.read<UsulanKegiatanBloc>().add(
                                                    UpdateUsulanKegiatanEvent(
                                                      usulanKegiatan: usulanKegiatan.copyWith(
                                                        statusUsulan: ditolak,
                                                      ),
                                                    ),
                                                  );

                                                  mipokaCustomToast("Usulan Kegiatan telah ditolak.");
                                                },
                                                child: Image.asset(
                                                  'assets/icons/close.png',
                                                  width: 24,
                                                ),
                                              ),
                                            ],
                                          ) :
                                          usulanKegiatan.statusUsulan == disetujui ?
                                          Image.asset(
                                            'assets/icons/approve.png',
                                            width: 24,
                                          ) :
                                          Image.asset(
                                            'assets/icons/close.png',
                                            width: 24,
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
