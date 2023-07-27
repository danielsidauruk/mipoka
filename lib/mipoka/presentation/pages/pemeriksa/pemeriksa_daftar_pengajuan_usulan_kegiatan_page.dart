import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/download_file_with_dio.dart';
import 'package:mipoka/domain/utils/signature_dialog_utils.dart';
import 'package:mipoka/domain/utils/to_snake_case.dart';
import 'package:mipoka/mipoka/presentation/bloc/mipoka_user_bloc/mipoka_user_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/usulan_kegiatan_bloc/usulan_kegiatan_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_total_count.dart';
import 'package:mipoka/mipoka/presentation/widgets/pemeriksa/pemeriksa_custom_drawer.dart';

class PemeriksaDaftarPengajuanKegiatanPage extends StatefulWidget {
  const PemeriksaDaftarPengajuanKegiatanPage({super.key});

  @override
  State<PemeriksaDaftarPengajuanKegiatanPage> createState() => _PemeriksaDaftarPengajuanKegiatanPageState();
}

class _PemeriksaDaftarPengajuanKegiatanPageState extends State<PemeriksaDaftarPengajuanKegiatanPage> {
  String? filter;

  @override
  void initState() {
    Future.microtask(() {
      context.read<UsulanKegiatanBloc>().add(const ReadAllUsulanKegiatanEvent());
      context.read<MipokaUserBloc>().add(ReadMipokaUserEvent(idMipokaUser: user?.uid ?? ""));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const MipokaMobileAppBar(),
      drawer: const MobileCustomPemeriksaDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomMobileTitle(
                  text: 'Pemeriksa - Verifikasi Usulan Kegiatan'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [
                  customBoxTitle('Status'),

                  const CustomFieldSpacer(height: 4.0),

                  MipokaCustomDropdown(
                    items: listStatus,
                    onValueChanged: (value) {
                      filter = value;

                      context.read<UsulanKegiatanBloc>().add(
                          ReadAllUsulanKegiatanEvent(filter: value ?? "semua"));
                    },
                  ),

                  const CustomFieldSpacer(),

                  BlocConsumer<UsulanKegiatanBloc, UsulanKegiatanState>(
                    listenWhen: (prev, current) =>
                    prev.runtimeType != current.runtimeType,
                    listener: (context, state) async {

                      if (state is UsulanKegiatanSuccess || state is UpdateUsulanKegiatanSuccess) {
                        context.read<UsulanKegiatanBloc>().add(const ReadAllUsulanKegiatanEvent());

                      } else if (state is UsulanKegiatanError) {
                        mipokaCustomToast(state.message);
                      }
                    },

                    builder: (context, state) {
                      if (state is UsulanKegiatanLoading) {
                        return const Text("Loading ...");
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
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Tanggal Mengirim\nUsulan Kegiatan',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Nama Pengusul',
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
                                        'File Usulan Kegiatan',
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
                                  rows: List<DataRow>.generate(usulanKegiatanList.length, (int index) {
                                    final usulanKegiatan = usulanKegiatanList[index];

                                    // context.read<MipokaUserBloc>().add(ReadMipokaUserEvent(idMipokaUser: usulanKegiatan.idUser));

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
                                              usulanKegiatan.createdAt,
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              usulanKegiatan.mipokaUser.namaLengkap ?? "",
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          onTap: () async {
                                            final result = await Navigator.pushNamed(
                                              context,
                                              pemeriksaPengajuanUsulanKegiatan1PageRoute,
                                              arguments: usulanKegiatan.idUsulan,
                                            );

                                            if (result == true && context.mounted) {
                                              context.read<UsulanKegiatanBloc>().add(const ReadAllUsulanKegiatanEvent());
                                            }
                                          },
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              usulanKegiatan.namaKegiatan,
                                              style: const TextStyle(
                                                color: Colors.blue,
                                                decoration: TextDecoration.underline,
                                              ),
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Image.asset(
                                              'assets/icons/word.png',
                                              width: 24,
                                            ),
                                          ),
                                          onTap: () {
                                            downloadFileWithDio(
                                              url: usulanKegiatan.fileUsulanKegiatan,
                                              fileName: "usulan_kegiatan_${toSnakeCase(usulanKegiatan.namaKegiatan)}.docx",
                                            );
                                          },
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    // SignatureDialogUtils.showPopup(context, usulanKegiatan);
                                                  },
                                                  child: Image.asset(
                                                    'assets/icons/approve.png',
                                                    width: 24,
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    context.read<UsulanKegiatanBloc>().add(
                                                      UpdateUsulanKegiatanEvent(
                                                        usulanKegiatan: usulanKegiatan.copyWith(
                                                          validasiPembina: ditolak,
                                                          statusUsulan: ditolak,
                                                        ),
                                                      ),
                                                    );
                                                    mipokaCustomToast("Usulan Kegiatan telah ditolak");
                                                  },
                                                  child: Image.asset(
                                                    'assets/icons/close.png',
                                                    width: 24,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(usulanKegiatan.statusUsulan),
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
                        return const Text ("AllUsulanKegiatanBloc hasn't been triggered yet");
                      }
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
