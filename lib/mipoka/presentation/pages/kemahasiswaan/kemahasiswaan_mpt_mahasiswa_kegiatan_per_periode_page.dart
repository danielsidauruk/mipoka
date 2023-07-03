import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/bloc/jenis_kegiatan_mpt/jenis_kegiatan_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/kegiatan_per_periode_mpt_bloc/kegiatan_per_periode_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/nama_kegaitan_mpt_bloc/nama_kegiatan_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/periode_mpt_bloc/periode_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_add_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_filter_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';

class KemahasiswaanMPTMahasiswaKegiatanPerPeriodePage extends StatefulWidget {
  const KemahasiswaanMPTMahasiswaKegiatanPerPeriodePage({super.key});

  @override
  State<KemahasiswaanMPTMahasiswaKegiatanPerPeriodePage> createState() => _KemahasiswaanMPTMahasiswaKegiatanPerPeriodePageState();
}

class _KemahasiswaanMPTMahasiswaKegiatanPerPeriodePageState extends State<KemahasiswaanMPTMahasiswaKegiatanPerPeriodePage> {
  
  @override
  void initState() {
    context.read<KegiatanPerPeriodeMptBloc>().add(const ReadAllKegiatanPerPeriodeMptEvent());
    super.initState();
  }
  
  @override
  void dispose() {
    context.read<KegiatanPerPeriodeMptBloc>().close();
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

              const CustomMobileTitle(text: 'Kemahasiswaan - MPT Mahasiswa - Kegiatan per Periode'),

              const CustomFieldSpacer(),

              BlocBuilder<KegiatanPerPeriodeMptBloc, KegiatanPerPeriodeMptState>(
                builder: (context, state) {
                  if (state is KegiatanPerPeriodeMptLoading) {
                    return const Text("Loading ....");
                  } else if (state is AllKegiatanPerPeriodeMptHasData) {
                    final kegiatanPerPeriodeMptList = state.kegiatanPerPeriodeMptList;

                    return CustomContentBox(
                      children: [

                        // buildTitle('Total Kegiatan per Jenis Kegiatan : 6'),
                        CustomAddButton(
                          buttonText: 'Tambah',
                          onPressed: () => Navigator.pushNamed(
                            context,
                            kemahasiswaanMPTMahasiswaKegiatanPerPeriodeTambahPageRoute,
                          ),
                        ),

                        const CustomFieldSpacer(),

                        buildTitle('Jenis'),
                        MipokaCustomDropdown(
                          items: listBentukKegiatan,
                          onValueChanged: (value) {},
                        ),

                        const CustomFieldSpacer(),

                        buildTitle('Kegiatan'),
                        MipokaCustomDropdown(
                          items: listNamaKegiatan,
                          onValueChanged: (value) {},
                        ),

                        const CustomFieldSpacer(),

                        CustomFilterButton(
                          text: 'Filter',
                          onPressed: () {},
                        ),

                        const CustomFieldSpacer(),

                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Total Kegiatan per Jenis Kegiatan : ${kegiatanPerPeriodeMptList.length}",
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
                                      'Periode',
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
                                      'Nama Kegiatan',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
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
                                      'Waktu Mulai',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Waktu Selesai',
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

                                rows: List<DataRow>.generate(kegiatanPerPeriodeMptList.length, (int index) {
                                  final kegiatanPerPeriodeMpt = kegiatanPerPeriodeMptList[index];
                                  
                                  context.read<PeriodeMptBloc>().add(
                                    ReadPeriodeMptEvent(idPeriodeMpt: kegiatanPerPeriodeMpt.idPeriodeMpt));
                                  context.read<NamaKegiatanMptBloc>().add(
                                    ReadNamaKegiatanMptEvent(idNamaKegiatanMpt: kegiatanPerPeriodeMpt.idNamaKegiatanMpt));
                                  context.read<JenisKegiatanMptBloc>().add(
                                    ReadJenisKegiatanMptEvent(idJenisKegiatanMpt: kegiatanPerPeriodeMpt.idJenisKegiatanMpt));

                                  return DataRow(
                                    cells: [
                                      DataCell(
                                        BlocBuilder<PeriodeMptBloc, PeriodeMptState>(
                                          builder: (context, state) {
                                            if (state is PeriodeMptLoading) {
                                              return const Text("Loading ....");
                                            } else if (state is PeriodeMptHasData) {
                                              return Align(
                                                alignment: Alignment.center,
                                                child: Text(state.periodeMpt.tahunPeriodeMpt),
                                              );
                                            } else if (state is PeriodeMptError) {
                                              return Text(state.message);
                                            } else {
                                              return const Text("PeriodeMptBloc hasn't been triggered yet.");
                                            }
                                          },
                                        ),
                                      ),
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
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text("${kegiatanPerPeriodeMpt.pointMptDiperoleh}"),
                                        ),
                                      ),
                                      DataCell(
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(kegiatanPerPeriodeMpt.tanggalMulaiKegiatanPerPeriodeMpt),
                                        ),
                                      ),
                                      DataCell(
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(kegiatanPerPeriodeMpt.tanggalSelesaiKegiatanPerPeriodeMpt),
                                        ),
                                      ),

                                      DataCell(
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: [
                                            InkWell(
                                              onTap: () => Navigator.pushNamed(
                                                context,
                                                kemahasiswaanMPTMahasiswaKegiatanPerPeriodeTambahPageRoute,
                                              ),
                                              child: Image.asset(
                                                'assets/icons/edit.png',
                                                width: 24,
                                              ),
                                            ),

                                            const SizedBox(width: 16.0,),

                                            InkWell(
                                              onTap: () {},
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
                    return const Text("KegiatanPeriodeMpt hasn't been triggered yet.");
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
