import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/bloc/kegiatan_mpt_bloc/kegiatan_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/riwayat_mpt_bloc/riwayat_mpt_bloc.dart';
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
    // context.read<RiwayatMptBloc>().add(ReadAllRiwayatMptEvent());
    context.read<KegiatanMptBloc>().add(ReadAllKegiatanMptEvent());
    super.initState();
  }

  @override
  void dispose() {
    context.read<RiwayatMptBloc>().close();
    context.read<KegiatanMptBloc>().close();
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
                  BlocBuilder<RiwayatMptBloc, RiwayatMptState>(
                    builder: (context, state) {
                      if (state is RiwayatMptLoading) {
                        return const Text('Loading ....');
                      } else if (state is AllRiwayatMptHasData) {
                        final riwayatMptList = state.riwayatMptList;
                        
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
                              rows: List<DataRow>.generate(riwayatMptList.length, (int index) {
                                final riwayatMpt = riwayatMptList[index];
                                
                                context.read<KegiatanMptBloc>().add(
                                  ReadKegiatanMptEvent(idKegiatanMpt: riwayatMpt.idKegiatanMpt));
                                
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
                                      BlocBuilder<KegiatanMptBloc, KegiatanMptState>(
                                        builder: (context, state) {
                                          if (state is KegiatanMptLoading) {
                                            return const Text('Loading ....');
                                          } else if (state is KegiatanMptHasData) {
                                            return Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                state.kegiatan.namaKegiatanMpt,
                                              ),
                                            );
                                          } else if (state is KegiatanMptError) {
                                            return Text(state.message);
                                          } else {
                                            return const Text("ReadKegiatanMptEvent hasn't been triggered");
                                          }
                                        },
                                      ),
                                    ),
                                    DataCell(
                                      BlocBuilder<KegiatanMptBloc, KegiatanMptState>(
                                        builder: (context, state) {
                                          if (state is KegiatanMptLoading) {
                                            return const Text('Loading ....');
                                          } else if (state is KegiatanMptHasData) {
                                            return Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                state.kegiatan.idNamaKegiatanMpt.toString(),
                                              ),
                                            );
                                          } else if (state is KegiatanMptError) {
                                            return Text(state.message);
                                          } else {
                                            return const Text("ReadKegiatanMptEvent hasn't been triggered");
                                          }
                                        },
                                      ),
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
                      } else if (state is RiwayatMptError) {
                        return Text(state.message);
                      } else {
                        return const Text("RiwayatMptBloc hasn't been triggered");
                      }
                    },
                  ),


                  const CustomFieldSpacer(height: 12),


                  customBoxTitle('Kegiatan yang Belum Diklaim'),
                  const CustomFieldSpacer(),
                  BlocBuilder<KegiatanMptBloc, KegiatanMptState>(
                    builder: (context, state) {
                      if (state is KegiatanMptLoading) {
                        return const Text('Loading ....');
                      } else if (state is AllKegiatanMptHasData) {
                        final kegiatanMptList = state.kegiatanList;

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
                              rows: List.generate(kegiatanMptList.length, (int index) {
                                final kegiatanMpt = kegiatanMptList[index];

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
                                        child: Text(kegiatanMpt.namaKegiatanMpt),
                                      ),
                                    ),
                                    DataCell(
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(kegiatanMpt.idNamaKegiatanMpt.toString()),
                                      ),
                                    ),
                                    DataCell(
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(kegiatanMpt.pointMptDiperoleh.toString()),
                                      ),
                                    ),
                                    DataCell(
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(kegiatanMpt.tanggalMulaiKegiatanMpt),
                                      ),
                                    ),
                                    DataCell(
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(kegiatanMpt.tanggalSelesaiKegiatanMpt),
                                      ),
                                    ),
                                    DataCell(
                                      Align(
                                        alignment: Alignment.center,
                                        child: InkWell(
                                          onTap: () => Navigator.pushNamed(
                                            context,
                                            penggunaMPTUnggahBuktiPageRoute,
                                            arguments: kegiatanMpt.idKegiatanPerPeriodeMpt,
                                          ),
                                          child: Image.asset(
                                            'assets/icons/upload.png',
                                            width: 24,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            ),
                          ),
                        );
                      } else if (state is KegiatanMptError) {
                        return Text(state.message);
                      } else {
                        return const Text("ReadAllKegiatanMptEvent hasn't been triggered");
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
