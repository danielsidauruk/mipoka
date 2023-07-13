import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/bloc/kegiatan_per_periode_mpt_bloc/kegiatan_per_periode_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/nama_kegaitan_mpt_bloc/nama_kegiatan_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/riwayat_kegiatan_mpt_bloc/riwayat_kegiatan_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';

// => Fixed ContentBox
class PenggunaMPTPage extends StatefulWidget {
  const PenggunaMPTPage({super.key});

  @override
  State<PenggunaMPTPage> createState() => _PenggunaMPTPageState();
}

class _PenggunaMPTPageState extends State<PenggunaMPTPage> {

  @override
  void initState() {
    context.read<KegiatanPerPeriodeMptBloc>().add(const ReadAllKegiatanPerPeriodeMptEvent());
    context.read<RiwayatKegiatanMptBloc>().add(const ReadAllRiwayatKegiatanMptEvent());
    super.initState();
  }

  @override
  void dispose() {
    context.read<RiwayatKegiatanMptBloc>().close();
    context.read<KegiatanPerPeriodeMptBloc>().close();
    context.read<NamaKegiatanMptBloc>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MipokaMobileAppBar(),
      drawer: const MobileCustomPenggunaDrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomMobileTitle(text: 'MPT'),
              const CustomFieldSpacer(),
              CustomContentBox(
                children: [
                  customBoxTitle('Kegiatan yang Sudah Diklaim'),
                  const CustomFieldSpacer(),
                  BlocBuilder<RiwayatKegiatanMptBloc, RiwayatKegiatanMptState>(
                    builder: (context, state) {
                      if (state is RiwayatKegiatanMptLoading) {
                        return const Text('Loading ....');
                      } else if (state is AllRiwayatKegiatanMptHasData) {
                        final riwayatKegiatanMptList = state.riwayatKegiatanMptList;

                        return SingleChildScrollView(
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
                                    'Nama Kegiatan',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Jenis Kegiatan',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Keterangan Mahasiswa',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Keterangan Kemahasiswaan',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                              rows: List<DataRow>.generate(riwayatKegiatanMptList.length, (int index) {
                                final riwayatMpt = riwayatKegiatanMptList[index];

                                // context.read<KegiatanPerPeriodeMptBloc>().add(
                                //     ReadKegiatanPerPeriodeMptEvent(idKegiatanPerPeriodeMpt: riwayatMpt.idKegiatanPerPeriodeMpt));
                                // context.read<NamaKegiatanMptBloc>().add(
                                //   ReadNamaKegiatanMptEvent(idNamaKegiatanMpt: riwayatMpt.idKegiatanPerPeriodeMpt));

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
                                            riwayatMpt.kegiatanPerPeriodeMpt.namaKegiatanMpt.namaKegiatan,
                                          ),
                                        )
                                    ),
                                    DataCell(
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                              riwayatMpt.kegiatanPerPeriodeMpt.namaKegiatanMpt.jenisKegiatanMpt.namaJenisKegiatanMpt
                                          ),
                                        )
                                    ),
                                    DataCell(
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          riwayatMpt.keteranganMhs,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          riwayatMpt.keteranganSa,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            ),
                          ),
                        );
                      } else if (state is RiwayatKegiatanMptError) {
                        return Text(state.message);
                      } else {
                        return const Text("RiwayatMptBloc hasn't been triggered");
                      }
                    },
                  ),


                  const CustomFieldSpacer(height: 12),


                  customBoxTitle('Kegiatan yang Belum Diklaim'),
                  const CustomFieldSpacer(),
                  BlocBuilder<KegiatanPerPeriodeMptBloc, KegiatanPerPeriodeMptState>(
                    builder: (context, state) {
                      if (state is KegiatanPerPeriodeMptLoading) {
                        return const Text('Loading ....');
                      } else if (state is AllKegiatanPerPeriodeMptHasData) {
                        final kegiatanPerPeriodeList = state.kegiatanPerPeriodeMptList;

                        return SingleChildScrollView(
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
                                    'Nama Kegiatan',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                DataColumn(
                                  label: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Jenis Kegiatan',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Poin',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Tanggal Mulai',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Tanggal Selesai',
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
                              rows: List.generate(kegiatanPerPeriodeList.length, (int index) {
                                final kegiatanPerPeriode = kegiatanPerPeriodeList[index];

                                // context.read<NamaKegiatanMptBloc>().add(
                                //     ReadNamaKegiatanMptEvent(idNamaKegiatanMpt: kegiatanPerPeriode.idNamaKegiatanMpt));

                                return DataRow(
                                  cells: [
                                    DataCell(
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text('${index + 1}'),
                                      ),
                                    ),
                                    DataCell(
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          kegiatanPerPeriode.namaKegiatanMpt.namaKegiatan,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          kegiatanPerPeriode.namaKegiatanMpt.jenisKegiatanMpt.namaJenisKegiatanMpt,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(kegiatanPerPeriode.pointMptDiperoleh.toString()),
                                      ),
                                    ),
                                    DataCell(
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(kegiatanPerPeriode.tanggalMulaiKegiatanPerPeriodeMpt),
                                      ),
                                    ),
                                    DataCell(
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(kegiatanPerPeriode.tanggalSelesaiKegiatanPerPeriodeMpt),
                                      ),
                                    ),
                                    DataCell(
                                      onTap: () => Navigator.pushNamed(
                                        context,
                                        penggunaMPTUnggahBuktiPageRoute,
                                        arguments: kegiatanPerPeriode,
                                      ).then((_) {
                                        context.read<KegiatanPerPeriodeMptBloc>().add(const ReadAllKegiatanPerPeriodeMptEvent());
                                        context.read<RiwayatKegiatanMptBloc>().add(const ReadAllRiwayatKegiatanMptEvent());
                                      }),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Image.asset(
                                          'assets/icons/upload.png',
                                          width: 24,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            ),
                          ),
                        );
                      } else if (state is KegiatanPerPeriodeMptError) {
                        return Text(state.message);
                      } else {
                        return const Text("ReadAllKegiatanPerPeriodeMptEvent hasn't been triggered");
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
