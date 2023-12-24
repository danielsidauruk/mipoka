import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/download_file_with_dio.dart';
import 'package:mipoka/domain/utils/to_snake_case.dart';
import 'package:mipoka/domain/utils/uniqe_id_generator.dart';
import 'package:mipoka/domain/utils/url_utils.dart';
import 'package:mipoka/mipoka/domain/entities/notifikasi.dart';
import 'package:mipoka/mipoka/domain/entities/revisi_laporan.dart';
import 'package:mipoka/mipoka/presentation/bloc/laporan_bloc/laporan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/mipoka_user_bloc/mipoka_user_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/notifikasi_bloc/notifikasi_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/usulan_kegiatan_bloc/usulan_kegiatan_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_total_count.dart';
import 'package:mipoka/mipoka/presentation/widgets/pemeriksa/pemeriksa_custom_drawer.dart';

class PemeriksaDaftarLaporanKegiatanPage extends StatefulWidget {
  const PemeriksaDaftarLaporanKegiatanPage({super.key});

  @override
  State<PemeriksaDaftarLaporanKegiatanPage> createState() => _PemeriksaDaftarLaporanKegiatanPageState();
}

class _PemeriksaDaftarLaporanKegiatanPageState extends State<PemeriksaDaftarLaporanKegiatanPage> {
  User? user = FirebaseAuth.instance.currentUser;
  String? filter;
  RevisiLaporan? revisiLaporan;
  int? idLaporan;

  @override
  void initState() {
    filter = "semua";
    context.read<LaporanBloc>().add(const ReadAllLaporanEvent());
    context.read<MipokaUserBloc>().add(ReadMipokaUserEvent(idMipokaUser: user?.uid ?? ""));
    super.initState();
  }

  @override
  void dispose() {
    context.read<LaporanBloc>().close();
    context.read<MipokaUserBloc>().close();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MipokaMobileAppBar(
        onRefresh: () {
          mipokaCustomToast(refreshMessage);
          context.read<LaporanBloc>().add(const ReadAllLaporanEvent());
          context.read<MipokaUserBloc>().add(ReadMipokaUserEvent(idMipokaUser: user?.uid ?? ""));
        },
      ),

      drawer: const MobileCustomPemeriksaDrawer(),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomMobileTitle(
                  text: 'Pemeriksa - Verifikasi Laporan Kegiatan '),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [
                  BlocConsumer<LaporanBloc, LaporanState>(
                    listenWhen: (prev, current) =>
                    prev.runtimeType != current.runtimeType,
                    listener: (context, state) async {
                      if (state is UpdateLaporanFirstPageSuccess) {
                        context.read<LaporanBloc>().add(const ReadAllLaporanEvent());
                      } else if (state is AddReviseToLaporanSuccess) {
                        Navigator.pushNamed(
                          context,
                          pemeriksaPengajuanLaporanKegiatan1PageRoute,
                          arguments: idLaporan,
                        ).then((_) => context.read<LaporanBloc>().add(const ReadAllLaporanEvent()));
                      } else if (state is LaporanError) {
                        mipokaCustomToast(state.message);
                      }
                    },

                    builder: (context, state) {
                      if (state is LaporanLoading) {
                        return const Text("Loading ...");
                      } else if (state is AllLaporanHasData) {
                        final laporanList = state.laporanList;

                        return BlocBuilder<MipokaUserBloc, MipokaUserState>(
                          builder: (context, state) {
                            if (state is MipokaUserLoading) {
                              return const Text("Loading ...");
                            } else if (state is MipokaUserHasData) {
                              final mipokaUser = state.mipokaUser;

                              String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
                              int uniqueId = UniqueIdGenerator.generateUniqueId();

                              revisiLaporan = RevisiLaporan(
                                idRevisiLaporan: uniqueId,
                                mipokaUser: mipokaUser,
                                revisiPencapaian: "",
                                revisiPesertaKegiatanLaporan: "",
                                revisiBiayaKegiatan: "",
                                revisiLatarBelakang: "",
                                revisiHasilKegiatan: "",
                                revisiPenutup: "",
                                revisiFotoPostinganKegiatan: "",
                                revisiFotoDokumentasiKegiatan: "",
                                revisiFotoTabulasiHasil: "",
                                revisiFotoFakturPembayaran: "",
                                createdAt: currentDate,
                                createdBy: user?.email ?? "unknown",
                                updatedAt: currentDate,
                                updatedBy: user?.email ?? "unknown",
                              );

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MipokaCountText(total: laporanList.length),

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
                                              'Tanggal Mengirim Laporan Kegiatan',
                                              style: TextStyle(fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          DataColumn(
                                            label: Text(
                                              'Nama Pelapor',
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
                                              'Laporan Kegiatan',
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
                                        rows: List<DataRow>.generate(laporanList.length, (int index) {
                                          final laporan = laporanList[index];

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
                                                    laporan.updatedAt,
                                                  ),
                                                ),
                                              ),
                                              DataCell(
                                                  Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      laporan.usulanKegiatan?.mipokaUser.namaLengkap ?? "",
                                                    ),
                                                  )
                                              ),
                                              DataCell(
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    laporan.usulanKegiatan?.namaKegiatan ?? "",
                                                  ),
                                                ),
                                              ),

                                              laporan.fileLaporanKegiatan == "" ?
                                              DataCell(
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: InkWell(
                                                    child: Image.asset(
                                                      'assets/icons/document.png',
                                                      width: 24,
                                                    ),
                                                    onTap: () {
                                                      idLaporan = laporan.idLaporan;

                                                      context.read<LaporanBloc>().add(
                                                        AddReviseToLaporanEvent(
                                                          laporan: laporan.copyWith(
                                                            revisiLaporan: revisiLaporan,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ) :
                                              DataCell(
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: InkWell(
                                                    child: Image.asset(
                                                      'assets/icons/pdf.png',
                                                      width: 24,
                                                    ),
                                                    onTap: () => downloadFileWithDio(
                                                      url: laporan.fileLaporanKegiatan,
                                                      fileName: getFileNameFromUrl(laporan.fileLaporanKegiatan),
                                                    ),
                                                  ),
                                                ),
                                              ),

                                              DataCell(
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: laporan.validasiPembina == tertunda ?
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      InkWell(
                                                        onTap: () async {
                                                          String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
                                                          User? user = FirebaseAuth.instance.currentUser;
                                                          int uniqueId = UniqueIdGenerator.generateUniqueId();

                                                          context.read<NotifikasiBloc>().add(
                                                            CreateNotifikasiEvent(
                                                              notifikasi: Notifikasi(
                                                                idNotifikasi: uniqueId,
                                                                teksNotifikasi: "${laporan.usulanKegiatan?.revisiUsulan?.mipokaUser.namaLengkap} (pembina) telah menerima laporan kegiatan berjudul ${laporan.usulanKegiatan?.namaKegiatan}",
                                                                tglNotifikasi: DateTime.now().toString(),
                                                                createdAt: currentDate,
                                                                createdBy: user?.email ?? "unknown",
                                                                updatedAt: currentDate,
                                                                updatedBy: user?.email ?? "unknown",
                                                              ),
                                                            ),
                                                          );

                                                          await Future.delayed(const Duration(milliseconds: 500));

                                                          if(context.mounted){
                                                            context.read<LaporanBloc>().add(
                                                              UpdateLaporanFirstPageEvent(
                                                                laporan: laporan.copyWith(
                                                                  validasiPembina: disetujui,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          mipokaCustomToast("Laporan Kegiatan telah diterima");
                                                        },
                                                        child: Image.asset(
                                                          'assets/icons/approve.png',
                                                          width: 24,
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () async {
                                                          String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
                                                          User? user = FirebaseAuth.instance.currentUser;
                                                          int uniqueId = UniqueIdGenerator.generateUniqueId();

                                                          context.read<NotifikasiBloc>().add(
                                                            CreateNotifikasiEvent(
                                                              notifikasi: Notifikasi(
                                                                idNotifikasi: uniqueId,
                                                                teksNotifikasi: "${laporan.usulanKegiatan?.revisiUsulan?.mipokaUser.namaLengkap} (pembina) telah menolak laporan kegiatan berjudul ${laporan.usulanKegiatan?.namaKegiatan}",
                                                                tglNotifikasi: DateTime.now().toString(),
                                                                createdAt: currentDate,
                                                                createdBy: user?.email ?? "unknown",
                                                                updatedAt: currentDate,
                                                                updatedBy: user?.email ?? "unknown",
                                                              ),
                                                            ),
                                                          );

                                                          await Future.delayed(const Duration(milliseconds: 500));

                                                          if (context.mounted) {
                                                            context.read<LaporanBloc>().add(
                                                              UpdateLaporanFirstPageEvent(
                                                                laporan: laporan.copyWith(
                                                                  validasiPembina: ditolak,
                                                                  statusLaporan: ditolak,
                                                                ),
                                                              ),
                                                            );
                                                          }

                                                          mipokaCustomToast("Laporan Kegiatan telah ditolak.");
                                                        },
                                                        child: Image.asset(
                                                          'assets/icons/close.png',
                                                          width: 24,
                                                        ),
                                                      ),
                                                    ],
                                                  ) :
                                                  laporan.validasiPembina == disetujui ?
                                                  Image.asset(
                                                    'assets/icons/approve.png',
                                                    width: 24,
                                                  ) :
                                                  Image.asset(
                                                    'assets/icons/close.png',
                                                    width: 24,
                                                  ),
                                                ),
                                              ),

                                              DataCell(
                                                laporan.statusLaporan == disetujui ?
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Image.asset(
                                                    'assets/icons/approve.png',
                                                    width: 24,
                                                  ),
                                                ):
                                                laporan.statusLaporan == ditolak ?
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
                            } else if (state is MipokaUserError) {
                              mipokaCustomToast(state.message);
                              return const SizedBox();
                            } else {
                              return const SizedBox();
                            }
                          },
                        );
                      } else if (state is LaporanError) {
                        return Text(state.message);
                      } else {
                        if (kDebugMode) {
                          print("UsulanKegiatanBloc hasn't been triggered yet.");
                        }
                        return const SizedBox();
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
