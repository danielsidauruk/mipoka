import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/download_file_with_dio.dart';
import 'package:mipoka/domain/utils/format_date_indonesia.dart';
import 'package:mipoka/domain/utils/signature_dialog_utils.dart';
import 'package:mipoka/domain/utils/to_snake_case.dart';
import 'package:mipoka/domain/utils/uniqe_id_generator.dart';
import 'package:mipoka/domain/utils/url_utils.dart';
import 'package:mipoka/mipoka/domain/entities/notifikasi.dart';
import 'package:mipoka/mipoka/domain/entities/revisi_usulan.dart';
import 'package:mipoka/mipoka/presentation/bloc/mipoka_user_bloc/mipoka_user_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/notifikasi_bloc/notifikasi_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/revisi_usulan_bloc/revisi_usulan_bloc.dart';
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
  User? user = FirebaseAuth.instance.currentUser;
  RevisiUsulan? revisiUsulan;

  int? idUsulan;

  @override
  void initState() {
    context.read<UsulanKegiatanBloc>().add(const ReadAllUsulanKegiatanEvent());
    context.read<MipokaUserBloc>().add(ReadMipokaUserEvent(idMipokaUser: user?.uid ?? ""));
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
          context.read<MipokaUserBloc>().add(ReadMipokaUserEvent(idMipokaUser: user?.uid ?? ""));
        },
      ),

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
                  // customBoxTitle('Status'),
                  //
                  // const CustomFieldSpacer(height: 4.0),
                  //
                  // MipokaCustomDropdown(
                  //   items: listStatus,
                  //   onValueChanged: (value) {
                  //     filter = value;
                  //
                  //     // context.read<UsulanKegiatanBloc>().add(
                  //     //     ReadAllUsulanKegiatanEvent(filter: value ?? "semua"));
                  //   },
                  // ),
                  //
                  // const CustomFieldSpacer(),

                  BlocConsumer<UsulanKegiatanBloc, UsulanKegiatanState>(
                    listenWhen: (prev, current) =>
                    prev.runtimeType != current.runtimeType,
                    listener: (context, state) async {
                      if (state is UpdateUsulanKegiatanSuccess) {
                      context.read<UsulanKegiatanBloc>().add(const ReadAllUsulanKegiatanEvent());
                      } else if (state is AddReviseToUsulanSuccess) {
                        Navigator.pushNamed(
                          context,
                          pemeriksaPengajuanUsulanKegiatan1PageRoute,
                          arguments: idUsulan,
                        ).then((_) => context.read<UsulanKegiatanBloc>().add(
                            const ReadAllUsulanKegiatanEvent()));
                      } else if (state is UsulanKegiatanError) {
                        mipokaCustomToast(state.message);
                      }
                    },

                    builder: (context, state) {
                      if (state is UsulanKegiatanLoading) {
                        return const Text("Loading ...");
                      } else if (state is AllUsulanKegiatanHasData) {
                        final usulanKegiatanList = state.usulanKegiatanList;

                        return BlocBuilder<MipokaUserBloc, MipokaUserState>(
                          builder: (context, state) {
                            if (state is MipokaUserHasData) {
                              final mipokaUser = state.mipokaUser;

                              String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
                              int uniqueId = UniqueIdGenerator.generateUniqueId();

                              revisiUsulan = RevisiUsulan(
                                idRevisiUsulan: uniqueId,
                                mipokaUser: mipokaUser,
                                revisiPembiayaan: "",
                                revisiNamaKegiatan: "",
                                revisiBentukKegiatan: "",
                                revisiKategoriBentukKegiatan: "",
                                revisiTempatKegiatan: "",
                                revisiDeskripsiKegiatan: "",
                                revisiTanggalMulaiKegiatan: "",
                                revisiTanggalSelesaiKegiatan: "",
                                revisiWaktuMulaiKegiatan: "",
                                revisiWaktuSelesaiKegiatan: "",
                                revisiTanggalKeberangkatan: "",
                                revisiTanggalKepulangan: "",
                                revisiJumlahPartisipan: "",
                                revisiKategoriJumlahPartisipan: "",
                                revisiTargetKegiatan: "",
                                revisiTotalPendanaan: "",
                                revisiKategoriTotalPendanaan: "",
                                revisiKeterangan: "",
                                revisiTandaTanganOrmawa: "",
                                revisiPartisipan: "",
                                revisiRincianBiayaKegiatan: "",
                                revisiLatarBelakang: "",
                                revisiTujuanKegiatan: "",
                                revisiManfaatKegiatan: "",
                                revisiBentukPelaksanaanKegiatan: "",
                                revisiTargetPencapaianKegiatan: "",
                                revisiWaktuDanTempatPelaksanaan: "",
                                revisiRencanaAnggaranKegiatan: "",
                                revisiIdTertibAcara: "",
                                revisiPerlengkapanDanPeralatan: "",
                                revisiPenutup: "",
                                revisiFotoPostinganKegiatan: "",
                                revisiFotoSuratUndanganKegiatan: "",
                                revisiFotoLinimasaKegiatan: "",
                                revisiFotoTempatKegiatan: "",
                                createdAt: currentDate,
                                createdBy: user?.email ?? "",
                                updatedAt: currentDate,
                                updatedBy: user?.email ?? "",
                              );

                              print(revisiUsulan);

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
                                                  child: Text(
                                                    usulanKegiatan.namaKegiatan,
                                                  ),
                                                ),
                                              ),

                                              usulanKegiatan.fileUsulanKegiatan == "" ?
                                              DataCell(
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: InkWell(
                                                    child: Image.asset(
                                                      'assets/icons/document.png',
                                                      width: 24,
                                                    ),
                                                    onTap: () {
                                                      idUsulan = usulanKegiatan.idUsulan;

                                                      context.read<UsulanKegiatanBloc>().add(
                                                        AddReviseToUsulanEvent(
                                                          usulanKegiatan: usulanKegiatan.copyWith(
                                                            revisiUsulan: revisiUsulan,
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
                                                    onTap: () {
                                                      downloadFileWithDio(
                                                        url: usulanKegiatan.fileUsulanKegiatan,
                                                        fileName: getFileNameFromUrl(usulanKegiatan.fileUsulanKegiatan),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),

                                              DataCell(
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: usulanKegiatan.validasiPembina == tertunda ?
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          SignatureDialogUtils.showPopup(
                                                            context,
                                                            usulanKegiatan.copyWith(
                                                              revisiUsulan: revisiUsulan,
                                                            ),
                                                          );
                                                        },
                                                        child: Image.asset(
                                                          'assets/icons/approve.png',
                                                          width: 24,
                                                        ),
                                                      ),

                                                      InkWell(
                                                        onTap: () async {
                                                          if(context.mounted) {
                                                            int uniqueId = UniqueIdGenerator.generateUniqueId();
                                                            context.read<NotifikasiBloc>().add(
                                                              CreateNotifikasiEvent(
                                                                notifikasi: Notifikasi(
                                                                  idNotifikasi: uniqueId,
                                                                  teksNotifikasi: "${state.mipokaUser.namaLengkap} telah menolak usulan kegiatan berjudul ${usulanKegiatan.namaKegiatan}",
                                                                  tglNotifikasi: DateTime.now().toString(),
                                                                  createdAt: currentDate,
                                                                  createdBy: user?.email ?? "unknown",
                                                                  updatedAt: currentDate,
                                                                  updatedBy: user?.email ?? "unknown",
                                                                ),
                                                              ),
                                                            );
                                                          }

                                                          await Future.delayed(const Duration(milliseconds: 500));

                                                          if (context.mounted) {
                                                            context.read<UsulanKegiatanBloc>().add(
                                                              UpdateUsulanKegiatanEvent(
                                                                usulanKegiatan: usulanKegiatan.copyWith(
                                                                  // revisiUsulan: revisiUsulan,
                                                                  validasiPembina: ditolak,
                                                                  statusUsulan: ditolak,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          mipokaCustomToast("Usulan Kegiatan telah ditolak");
                                                        },
                                                        child: Image.asset(
                                                          'assets/icons/close.png',
                                                          width: 24,
                                                        ),
                                                      ),
                                                    ],
                                                  ) :
                                                  usulanKegiatan.validasiPembina == disetujui ?
                                                  Center(
                                                    child: Image.asset(
                                                      'assets/icons/approve.png',
                                                      width: 24,
                                                    ),
                                                  ) :
                                                  Center(
                                                    child: Image.asset(
                                                      'assets/icons/close.png',
                                                      width: 24,
                                                    ),
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
                                                ):
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
                            } else if (state is MipokaUserError) {
                              mipokaCustomToast(state.message);

                              return const SizedBox();
                            } else {
                              print("MipokaUser hasn't been triggered yet.");
                              return const SizedBox();
                            }
                          },
                        );
                      } else if (state is UsulanKegiatanError) {
                        return Text(state.message);
                      } else {
                        print ("AllUsulanKegiatanBloc hasn't been triggered yet");
                        return const SizedBox();
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
