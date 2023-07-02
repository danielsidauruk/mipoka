import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/domain/entities/revisi_usulan.dart';
import 'package:mipoka/mipoka/presentation/bloc/mipoka_user_bloc/mipoka_user_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/revisi_usulan_bloc/revisi_usulan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/usulan_kegiatan_bloc/usulan_kegiatan_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/pemeriksa/pemeriksa_custom_drawer.dart';

class PemeriksaDaftarPengajuanKegiatanPage extends StatefulWidget {
  const PemeriksaDaftarPengajuanKegiatanPage({super.key});

  @override
  State<PemeriksaDaftarPengajuanKegiatanPage> createState() => _PemeriksaDaftarPengajuanKegiatanPageState();
}

class _PemeriksaDaftarPengajuanKegiatanPageState extends State<PemeriksaDaftarPengajuanKegiatanPage> {
  
  @override
  void initState() {
    context.read<UsulanKegiatanBloc>().add(const ReadAllUsulanKegiatanEvent());
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

              BlocBuilder<UsulanKegiatanBloc, UsulanKegiatanState>(
                builder: (context, state) {
                  if (state is UsulanKegiatanLoading) {
                    return const Text("Loading ...");
                  } else if (state is AllUsulanKegiatanHasData) {
                    final usulanKegiatanList = state.usulanKegiatanList;

                    return CustomContentBox(
                      children: [
                        customBoxTitle('Status'),

                        const CustomFieldSpacer(height: 4.0),

                        MipokaCustomDropdown(
                          items: listStatus,
                          onValueChanged: (value) {
                            context.read<UsulanKegiatanBloc>().add(
                                ReadAllUsulanKegiatanEvent(filter: value!));
                          },
                        ),

                        const CustomFieldSpacer(),

                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Total Usulan Kegiatan : ${usulanKegiatanList.length}",
                            style: const TextStyle(fontSize: 15),
                          ),
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

                                context.read<MipokaUserBloc>().add(ReadMipokaUserEvent(idMipokaUser: usulanKegiatan.idUser));

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
                                      BlocBuilder<MipokaUserBloc, MipokaUserState>(
                                        builder: (context, state) {
                                         if (state is MipokaUserLoading) {
                                           return const Text("Loading ....");
                                         } else if (state is MipokaUserHasData) {
                                           return Align(
                                             alignment: Alignment.center,
                                             child: Text(
                                               state.mipokaUser.namaLengkap,
                                             ),
                                           );
                                         } else if (state is MipokaUserError) {
                                           return Text(state.message);
                                         } else {
                                           return const Text("MipokaUserBloc hasn't triggered yet.");
                                         }
                                        },
                                      ),
                                    ),
                                    DataCell(
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
                                      onTap: () {
                                        int idUsulanUsulan = int.parse(
                                            usulanKegiatan.idUsulan.toString() +
                                                newId.toString());

                                        context.read<RevisiUsulanBloc>().add(
                                          CreateRevisiUsulanEvent(
                                            revisiUsulan: RevisiUsulan(
                                              idRevisiUsulan: idUsulanUsulan,
                                              idAdmin: user?.uid ?? "unknown",
                                              idUsulan: usulanKegiatan.idUsulan,
                                              revisiPembiayaan: "",
                                              revisiNamaKegiatan: "",
                                              revisiBentukKegiatan: "",
                                              revisiKategoriBentukKegiatan: "",
                                              revisiDeskripsiKegiatan: "",
                                              revisiTempatKegiatan: "",
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
                                              createdBy: user?.email ?? "unknown",
                                              updatedAt: currentDate,
                                              updatedBy: user?.email ?? "unknown",
                                            ),
                                          ),
                                        );
                                        Navigator.pushNamed(
                                          context,
                                          pemeriksaPengajuanUsulanKegiatan1PageRoute,
                                          arguments: idUsulanUsulan,
                                        );

                                      },
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
                                        //       usulanKegiatan.fileUsulanKegiatan,
                                      },
                                    ),
                                    DataCell(
                                      Align(
                                        alignment: Alignment.center,
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: [
                                            InkWell(
                                              onTap: () {},
                                              child: Image.asset(
                                                'assets/icons/approve.png',
                                                width: 24,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {},
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
                    return const Text ("UsulanKegiatanBloc hasn't been triggered yet");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
