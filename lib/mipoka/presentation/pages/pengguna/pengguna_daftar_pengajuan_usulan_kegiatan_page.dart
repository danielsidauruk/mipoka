import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/download_file_with_dio.dart';
import 'package:mipoka/domain/utils/format_date_indonesia.dart';
import 'package:mipoka/domain/utils/multiple_args.dart';
import 'package:mipoka/domain/utils/to_snake_case.dart';
import 'package:mipoka/domain/utils/uniqe_id_generator.dart';
import 'package:mipoka/domain/utils/url_utils.dart';
import 'package:mipoka/mipoka/domain/entities/usulan_kegiatan.dart';
import 'package:mipoka/mipoka/presentation/bloc/mipoka_user_bloc/mipoka_user_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/usulan_kegiatan_bloc/usulan_kegiatan_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_total_count.dart';

class PenggunaDaftarPengajuanKegiatan extends StatefulWidget {
  const PenggunaDaftarPengajuanKegiatan({
    super.key,
  });

  @override
  State<PenggunaDaftarPengajuanKegiatan> createState() =>
      _PenggunaDaftarPengajuanKegiatanState();
}

class _PenggunaDaftarPengajuanKegiatanState
    extends State<PenggunaDaftarPengajuanKegiatan> {
  String? _filter;
  User? currentUser = FirebaseAuth.instance.currentUser;
  int uniqueId = UniqueIdGenerator.generateUniqueId();

  @override
  void initState() {
    context.read<UsulanKegiatanBloc>().add(const ReadAllUsulanKegiatanEvent());
    context.read<MipokaUserBloc>().add(ReadMipokaUserEvent(idMipokaUser: currentUser!.uid));
    super.initState();
  }

  @override
  void dispose() {
    context.read<UsulanKegiatanBloc>().close();
    context.read<MipokaUserBloc>().close();
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

      drawer: const MobileCustomPenggunaDrawerWidget(),

        body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomMobileTitle(
                  text: 'Pengajuan - Kegiatan - Usulan Kegiatan'),
              const CustomFieldSpacer(),
              CustomContentBox(
                children: [
                  // customBoxTitle('Status'),
                  // const CustomFieldSpacer(height: 4.0),
                  // MipokaCustomDropdown(
                  //   items: listStatus,
                  //   onValueChanged: (value) {
                  //     _filter = value;
                  //   },
                  // ),
                  // const CustomFieldSpacer(),

                  BlocConsumer<UsulanKegiatanBloc, UsulanKegiatanState>(
                    listenWhen: (prev, current) =>
                    prev.runtimeType != current.runtimeType,
                    listener: (context, state) async {

                      if (state is UsulanKegiatanSuccess) {
                        Navigator.pushNamed(
                          context,
                          penggunaPengajuanUsulanKegiatanPage1Route,
                          arguments: UsulanArgs(idUsulan: uniqueId),
                        ).then((_) => context.read<UsulanKegiatanBloc>().add(
                            const ReadAllUsulanKegiatanEvent()));
                      }
                      else if (state is UsulanKegiatanError) {
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
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Tanggal Mengirim Usulan Kegiatan',
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
                                        'Usulan Kegiatan',
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
                                  rows: List<DataRow>.generate(
                                      state.usulanKegiatanList.length, (int index) {
                                    final usulanKegiatan =
                                    state.usulanKegiatanList[index];
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
                                              formatDateIndonesia(usulanKegiatan.createdAt),
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              usulanKegiatan.mipokaUser.namaLengkap,
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: usulanKegiatan.statusUsulan == ditolak ?
                                            InkWell(
                                              onTap: () {
                                                Navigator.pushNamed(
                                                  context,
                                                  penggunaPengajuanUsulanKegiatanPage1Route,
                                                  arguments: UsulanArgs(
                                                    idUsulan: usulanKegiatan.idUsulan,
                                                    isRevisiUsulan: true,
                                                  ),
                                                ).then((_) => context.read<UsulanKegiatanBloc>().add(
                                                  const ReadAllUsulanKegiatanEvent()));
                                              },
                                              child: Text(
                                                usulanKegiatan.namaKegiatan,
                                                style: const TextStyle(color: Colors.red),
                                              ),
                                            ) : usulanKegiatan.fileUsulanKegiatan == "" ?
                                            InkWell(
                                              onTap: () {
                                                Navigator.pushNamed(
                                                  context,
                                                  penggunaPengajuanUsulanKegiatanPage1Route,
                                                  arguments: UsulanArgs(
                                                    idUsulan: usulanKegiatan.idUsulan,
                                                  ),
                                                ).then((_) => context.read<UsulanKegiatanBloc>().add(
                                                    const ReadAllUsulanKegiatanEvent()));
                                              },
                                              child: Text(
                                                "${usulanKegiatan.namaKegiatan} (lanjut mengedit)",
                                                style: const TextStyle(color: Colors.orange),
                                              ),
                                            ) :
                                            Text(
                                              usulanKegiatan.namaKegiatan,
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          onTap: () {
                                            Navigator.pushNamed(
                                              context,
                                              penggunaPengajuanUsulanKegiatanPage1Route,
                                              arguments: UsulanArgs(
                                                idUsulan: usulanKegiatan.idUsulan,
                                              ),
                                            ).then((_) => context.read<UsulanKegiatanBloc>().add(
                                                const ReadAllUsulanKegiatanEvent()));
                                          },
                                          Align(
                                            alignment: Alignment.center,
                                            child: Image.asset(
                                              'assets/icons/document.png',
                                              width: 24,
                                            ),
                                          ),
                                        ),

                                        DataCell(
                                          usulanKegiatan.validasiPembina == disetujui ?
                                          Align(
                                            alignment: Alignment.center,
                                            child: Image.asset(
                                              'assets/icons/approve.png',
                                              width: 24,
                                            ),
                                          )
                                              :
                                          usulanKegiatan.validasiPembina == ditolak ?
                                          Align(
                                            alignment: Alignment.center,
                                            child: Image.asset(
                                              'assets/icons/close.png',
                                              width: 24,
                                            ),
                                          ) :
                                          Align(
                                            alignment: Alignment.center,
                                            child: Image.asset(
                                              'assets/icons/time.png',
                                              width: 24,
                                            ),
                                          ),
                                        ),

                                        DataCell(
                                          usulanKegiatan.statusUsulan == disetujui ?
                                          Align(
                                            alignment: Alignment.center,
                                            child: Image.asset(
                                              'assets/icons/approve.png',
                                              width: 24,
                                            ),
                                          )
                                              :
                                          usulanKegiatan.statusUsulan == ditolak ?
                                          Align(
                                            alignment: Alignment.center,
                                            child: Image.asset(
                                              'assets/icons/close.png',
                                              width: 24,
                                            ),
                                          ) :
                                          Align(
                                            alignment: Alignment.center,
                                            child: Image.asset(
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
                        print("Usulan Kegiatan bloc hasn't been triggered yet.");
                        return const Center();
                      }
                    },
                  ),

                  const CustomFieldSpacer(),

                  BlocBuilder<MipokaUserBloc, MipokaUserState>(
                    builder: (context, mipokaUserState) {
                      if (mipokaUserState is MipokaUserLoading) {
                        return const Text('Loading ...');
                      } else if (mipokaUserState is MipokaUserHasData) {
                        final mipokaUser = mipokaUserState.mipokaUser;

                        return mipokaUser.ormawa.isNotEmpty ?
                        CustomMipokaButton(
                          onTap: () {
                            String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

                            context.read<UsulanKegiatanBloc>().add(
                              CreateUsulanKegiatanEvent(
                                usulanKegiatan: UsulanKegiatan(
                                  idUsulan: uniqueId,
                                  revisiUsulan: null,
                                  ormawa: mipokaUser.ormawa[0],
                                  mipokaUser: mipokaUser,
                                  pembiayaan: "",
                                  namaKegiatan: "",
                                  bentukKegiatan: "",
                                  kategoriBentukKegiatan: "",
                                  deskripsiKegiatan: "",
                                  tanggalMulaiKegiatan: "",
                                  tanggalSelesaiKegiatan: "",
                                  waktuMulaiKegiatan: "",
                                  waktuSelesaiKegiatan: "",
                                  tempatKegiatan: "",
                                  tanggalKeberangkatan: "",
                                  tanggalKepulangan: "",
                                  jumlahPartisipan: "",
                                  kategoriJumlahPartisipan: "",
                                  targetKegiatan: "",
                                  totalPendanaan: "",
                                  kategoriTotalPendanaan: "",
                                  keterangan: "",
                                  tandaTanganOrmawa: "",
                                  partisipan: const [],
                                  biayaKegiatan: const [],
                                  totalBiaya: 0,
                                  latarBelakang: "",
                                  tujuanKegiatan: "",
                                  manfaatKegiatan: "",
                                  bentukPelaksanaanKegiatan: "",
                                  targetPencapaianKegiatan: "",
                                  waktuDanTempatPelaksanaan: "",
                                  rencanaAnggaranKegiatan: "",
                                  tertibAcara: const [],
                                  perlengkapanDanPeralatan: "",
                                  penutup: "",
                                  fotoPostinganKegiatan: "",
                                  fotoSuratUndanganKegiatan: "",
                                  fotoLinimasaKegiatan: "",
                                  fotoTempatKegiatan: "",
                                  fileUsulanKegiatan: "",
                                  validasiPembina: tertunda,
                                  tandaTanganPembina: "",
                                  statusUsulan: tertunda,
                                  roles: "",
                                  createdAt: currentDate,
                                  updatedAt: currentDate,
                                  createdBy: currentUser?.email ?? "unknown",
                                  updatedBy: currentUser?.email ?? "unknown",
                                ),
                              ),
                            );
                          },
                          text: 'Ajukan Kegiatan',
                        ) :
                        const SizedBox();

                      } else if (mipokaUserState is MipokaUserError) {
                        return Text(mipokaUserState.message);
                      } else {
                        print("MipokaUserBloc hasn't been triggered.");
                        return const Center();
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
