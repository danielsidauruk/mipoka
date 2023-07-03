import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/bloc/jenis_kegiatan_mpt/jenis_kegiatan_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/kegiatan_per_periode_mpt_bloc/kegiatan_per_periode_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/nama_kegaitan_mpt_bloc/nama_kegiatan_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_add_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';

class MPTMahasiswaKegiatanPerJenisKegiatanPage extends StatefulWidget {
  const MPTMahasiswaKegiatanPerJenisKegiatanPage({super.key});

  @override
  State<MPTMahasiswaKegiatanPerJenisKegiatanPage> createState() => _MPTMahasiswaKegiatanPerJenisKegiatanPageState();
}

class _MPTMahasiswaKegiatanPerJenisKegiatanPageState extends State<MPTMahasiswaKegiatanPerJenisKegiatanPage> {
  
  @override
  void initState() {
    context.read<KegiatanPerPeriodeMptBloc>().add(const ReadAllKegiatanPerPeriodeMptEvent());
    context.read<JenisKegiatanMptBloc>().add(const ReadAllJenisKegiatanMptEvent());
    super.initState();
  }

  @override
  void dispose() {
    context.read<KegiatanPerPeriodeMptBloc>().close();
    context.read<JenisKegiatanMptBloc>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MipokaMobileAppBar(),
      drawer: const MobileCustomKemahasiswaanDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomMobileTitle(
                  text:
                      'Kemahasiswaan - MPT Mahasiswa - Kegiatan per Jenis Kegiatan'),
              const CustomFieldSpacer(),
              BlocBuilder<KegiatanPerPeriodeMptBloc, KegiatanPerPeriodeMptState>(
                builder: (context, state) {
                  if (state is KegiatanPerPeriodeMptLoading) {
                    return const Text('Loading ...');
                  } else if (state is AllKegiatanPerPeriodeMptHasData) {
                    final kegiatanMptList = state.kegiatanPerPeriodeMptList;

                    return CustomContentBox(
                      children: [
                        // buildTitle('Total Kegiatan per Jenis Kegiatan : 6'),
                        CustomAddButton(
                          buttonText: 'Tambah',
                          onPressed: () => Navigator.pushNamed(
                              context,
                              mptMahasiswaKegiatanPerJenisKegiatanTambahPageRoute),
                        ),
                        const CustomFieldSpacer(),
                        buildTitle('Jenis'),

                        // BlocBuilder<JenisKegiatanMptBloc, JenisKegiatanMptState>(
                        //   builder: (context, state) {
                        //     if (state is JenisKegiatanMptLoading) {
                        //       return const Text("Loading ....");
                        //     } else if (state is AllJenisKegiatanMptHasData) {
                        //
                        //       List<String> namaJenisKegiatan = state.jenisKegiatanMptList.map(
                        //               (jenisKegiatanMpt) => jenisKegiatanMpt.namaJenisKegiatanMpt).toList();
                        //
                        //       return MipokaCustomDropdown(
                        //         items: namaJenisKegiatan,
                        //         onValueChanged: (value) {
                        //           context.read<KegiatanPerPeriodeMptBloc>().add(
                        //               ReadAllKegiatanPerPeriodeMptEvent(filter: value!)
                        //           );
                        //         },
                        //       );
                        //     } else if (state is JenisKegiatanMptError) {
                        //       return Text(state.message);
                        //     } else {
                        //       return const Text("JenisKegiatanMptBloc hasn't been triggered.");
                        //     }
                        //   },
                        // ),

                        MipokaCustomDropdown(
                          items: listBentukKegiatan,
                          onValueChanged: (value) {
                            context.read<KegiatanPerPeriodeMptBloc>().add(
                                ReadAllKegiatanPerPeriodeMptEvent(filter: value!)
                            );
                          },
                        ),

                        const CustomFieldSpacer(),

                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Total Kegiatan per Jenis Kegiatan : ${kegiatanMptList.length}",
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),

                        const CustomFieldSpacer(),

                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
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
                                      'Jenis Kegiatan',
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
                                    tooltip: 'Aksi yang akan dilakukan',
                                    label: Text(
                                      'Aksi',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                                rows: List<DataRow>.generate(kegiatanMptList.length, (int index) {
                                  final kegiatanMpt = kegiatanMptList[index];

                                  context.read<JenisKegiatanMptBloc>().add(
                                    ReadJenisKegiatanMptEvent(idJenisKegiatanMpt: kegiatanMpt.idNamaKegiatanMpt));
                                  context.read<NamaKegiatanMptBloc>().add(
                                      ReadNamaKegiatanMptEvent(idNamaKegiatanMpt: kegiatanMpt.idNamaKegiatanMpt));

                                  return DataRow(
                                    cells: [
                                      DataCell(
                                        BlocBuilder<JenisKegiatanMptBloc, JenisKegiatanMptState>(
                                          builder: (context, state) {
                                            if (state is JenisKegiatanMptLoading) {
                                              return const Text('Loading ....');
                                            } else if (state is JenisKegiatanMptHasData) {
                                              return Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  state.jenisKegiatanMpt.namaJenisKegiatanMpt,
                                                ),
                                              );
                                            } else if (state is JenisKegiatanMptError) {
                                              return Text(state.message);
                                            } else {
                                              return const Text("JenisKegiatanMptBloc hasn't triggered yet.");
                                            }
                                          },
                                        ),
                                      ),
                                      DataCell(
                                        BlocBuilder<NamaKegiatanMptBloc, NamaKegiatanMptState>(
                                          builder: (context, state) {
                                            if (state is NamaKegiatanMptLoading) {
                                              return const Text('Loading ....');
                                            } else if (state is NamaKegiatanMptHasData) {
                                              return Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  state.namaKegiatanMpt.namaKegiatan,
                                                ),
                                              );
                                            } else if (state is NamaKegiatanMptError) {
                                              return Text(state.message);
                                            } else {
                                              return const Text("JenisKegiatanMptBloc hasn't triggered yet.");
                                            }
                                          },
                                        ),
                                      ),
                                      DataCell(
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                              },
                                              child: Image.asset(
                                                'assets/icons/edit.png',
                                                width: 24,
                                              ),
                                            ),

                                            const SizedBox(width: 16.0,),

                                            InkWell(
                                              onTap: () {
                                              },
                                              child: Image.asset(
                                                'assets/icons/delete.png',
                                                width: 24,
                                              ),
                                            ),
                                          ],
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
                    );
                  } else if (state is KegiatanPerPeriodeMptError) {
                    return Text(state.message);
                  } else {
                    return const Text("KegiatanMptBloc hasn't triggered yet.");
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
