import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/bloc/laporan_bloc/laporan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/mipoka_user_bloc/mipoka_user_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/usulan_kegiatan_bloc/usulan_kegiatan_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/pemeriksa/pemeriksa_custom_drawer.dart';

class PemeriksaDaftarLaporanKegiatanPage extends StatefulWidget {
  const PemeriksaDaftarLaporanKegiatanPage({super.key});

  @override
  State<PemeriksaDaftarLaporanKegiatanPage> createState() => _PemeriksaDaftarLaporanKegiatanPageState();
}

class _PemeriksaDaftarLaporanKegiatanPageState extends State<PemeriksaDaftarLaporanKegiatanPage> {
  
  @override
  void initState() {
    context.read<LaporanBloc>().add(const ReadAllLaporanEvent());
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MipokaMobileAppBar(),
      drawer: const MobileCustomPemeriksaDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CustomMobileTitle(
                text: 'Pemeriksa - Verifikasi Laporan Kegiatan '),
            const CustomFieldSpacer(),
            BlocBuilder<LaporanBloc, LaporanState>(
              builder: (context, state) {
                if (state is LaporanLoading) {
                  return const Text("Loading ...");
                } else if (state is AllLaporanHasData) {
                  final laporanList = state.laporanList;
                  
                  return Expanded(
                    child: CustomContentBox(
                      children: [
                        buildTitle('Status'),
                        MipokaCustomDropdown(
                          items: listStatus,
                          onValueChanged: (value) {},
                        ),

                        const CustomFieldSpacer(),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Total Usulan Kegiatan : ${laporanList.length}",
                            style: const TextStyle(fontSize: 15),
                          ),
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
                                  final laporanKegiatan = laporanList[index];
                                  
                                  context.read<MipokaUserBloc>().add(
                                    ReadMipokaUserEvent(idMipokaUser: laporanKegiatan.idUser));
                                  context.read<UsulanKegiatanBloc>().add(
                                    ReadUsulanKegiatanEvent(idUsulanKegiatan: laporanKegiatan.idUsulan)
                                  );

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
                                            laporanKegiatan.updatedAt,
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        BlocBuilder<MipokaUserBloc, MipokaUserState>(
                                          builder: (context, state) {
                                            if (state is MipokaUserLoading) {
                                              return const Text("Loading ...");
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
                                          BlocBuilder<UsulanKegiatanBloc, UsulanKegiatanState>(
                                            builder: (context, state) {
                                              if (state is UsulanKegiatanLoading) {
                                                return const Text("Loading ...");
                                              } else if (state is UsulanKegiatanHasData) {
                                                return Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    state.usulanKegiatan.namaKegiatan,
                                                    style: const TextStyle(
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                );
                                              } else if (state is UsulanKegiatanError) {
                                                return Text(state.message);
                                              } else {
                                                return const Text("UsulanKegiatanBloc hasn't been triggered yet.");
                                              }
                                            },
                                          ),
                                          onTap: () => Navigator.pushNamed(
                                            context,
                                            pemeriksaPengajuanLaporanKegiatan1PageRoute,
                                            arguments: laporanKegiatan.idLaporan,
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
                                        onTap: () {},
                                      ),
                                      DataCell(
                                        Align(
                                          alignment: Alignment.center,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Image.asset(
                                                'assets/icons/approve.png',
                                                width: 24,
                                              ),
                                              Image.asset(
                                                'assets/icons/close.png',
                                                width: 24,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            laporanKegiatan.statusLaporan,
                                          ),
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
                  );
                } else if (state is LaporanError) {
                  return Text(state.message);
                } else {
                  return const Text("UsulanKegiatanBloc hasn't been triggered yet.");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
