import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/domain/entities/kegiatan_per_periode_mpt.dart';
import 'package:mipoka/mipoka/presentation/bloc/jenis_kegiatan_mpt/jenis_kegiatan_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/kegiatan_per_periode_mpt_bloc/kegiatan_per_periode_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/nama_kegaitan_mpt_bloc/nama_kegiatan_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/periode_mpt_bloc/periode_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/periode_mpt_dropdown_bloc/periode_mpt_drop_down_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_add_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_filter_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_total_count.dart';

class KemahasiswaanMPTMahasiswaKegiatanPerPeriodePage extends StatefulWidget {
  const KemahasiswaanMPTMahasiswaKegiatanPerPeriodePage({super.key});

  @override
  State<KemahasiswaanMPTMahasiswaKegiatanPerPeriodePage> createState() => _KemahasiswaanMPTMahasiswaKegiatanPerPeriodePageState();
}

class _KemahasiswaanMPTMahasiswaKegiatanPerPeriodePageState
    extends State<KemahasiswaanMPTMahasiswaKegiatanPerPeriodePage> {

  @override
  void initState() {
    Future.microtask(() {
      context.read<KegiatanPerPeriodeMptBloc>().add(const ReadAllKegiatanPerPeriodeMptEvent());
      // context.read<PeriodeMptBloc>().add(ReadAllPeriodeMptEvent());
      context.read<JenisKegiatanMptBloc>().add(const ReadAllJenisKegiatanMptEvent());

      context.read<NamaKegiatanMptBloc>().add(const ReadAllNamaKegiatanMptEvent());
    });
    super.initState();
  }

  @override
  void dispose() {
    context.read<KegiatanPerPeriodeMptBloc>().close();
    context.read<PeriodeMptBloc>().close();
    context.read<JenisKegiatanMptBloc>().close();
    context.read<NamaKegiatanMptBloc>().close();
    context.read<PeriodeMptDropDownBloc>().close();
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

                    context.read<PeriodeMptDropDownBloc>().add(ReadPeriodeMptDropDownEvent());

                    final kegiatanPerPeriodeMptList = state.kegiatanPerPeriodeMptList;

                    int idPeriodeKegiatanMpt = 0;
                    int idNamaKegiatanMpt = 0;

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

                        buildTitle('Periode Kegiatan'),
                        BlocBuilder<PeriodeMptDropDownBloc, PeriodeMptDropDownState>(
                          builder: (context, state) {
                            if (state is PeriodeMptDropDownLoading) {
                              return const Text("Loading ....");
                            } else if (state is PeriodeMptDropDownHasData) {
                              List<String> tahunPeriodeMptList = state.periodeMptList.map(
                                      (periodeMptList) => periodeMptList.periodeMengulangMpt == true ?
                                  "${periodeMptList.tahunPeriodeMpt} (ulang)" :
                                  periodeMptList.tahunPeriodeMpt).toList();

                              List<int> idTahunPeriodeList = state.periodeMptList.map(
                                      (periodeMptList) => periodeMptList.idPeriodeMpt).toList();

                              return MipokaCustomDropdown(
                                  items: tahunPeriodeMptList,
                                  onValueChanged: (value) {
                                    int index = tahunPeriodeMptList.indexOf(value!);
                                    int idPeriodeMpt = idTahunPeriodeList[index];

                                    idPeriodeKegiatanMpt = idPeriodeMpt;
                                  }
                              );
                            } else if (state is PeriodeMptDropDownError) {
                              return Text(state.message);
                            } else {
                              return const Text("PeriodeMptBloc hasn't been triggered yet.");
                            }
                          },
                        ),

                        const CustomFieldSpacer(),

                        buildTitle('Nama Kegiatan'),
                        BlocBuilder<NamaKegiatanMptBloc, NamaKegiatanMptState>(
                          builder: (context, state) {
                            if (state is NamaKegiatanMptLoading) {
                              return const Text("Loading ...");
                            } else if (state is AllNamaKegiatanMptHasData) {
                              List<String> namaKegiatanList = state.namaKegiatanMptList.map(
                                      (namaKegiatanList) => namaKegiatanList.namaKegiatan).toList();

                              List<int> idKegiatanMptList = state.namaKegiatanMptList.map(
                                      (namaKegiatanMptList) => namaKegiatanMptList.idNamaKegiatanMpt).toList();

                              idNamaKegiatanMpt = idKegiatanMptList[0];

                              return MipokaCustomDropdown(
                                items: namaKegiatanList,
                                onValueChanged: (value) {
                                  int index = namaKegiatanList.indexOf(value ?? "");
                                  idNamaKegiatanMpt = idKegiatanMptList[index];

                                },
                              );
                            } else if (state is NamaKegiatanMptError) {
                              return Text(state.message);
                            } else {
                              return const Text("NamaKegiatanBloc hasn't been triggered yet.");
                            }
                          },
                        ),

                        const CustomFieldSpacer(),

                        CustomFilterButton(
                          text: 'Filter',
                          onPressed: () {
                            context.read<KegiatanPerPeriodeMptBloc>().add(
                              ReadAllKegiatanPerPeriodeMptEvent(filter: "$idPeriodeKegiatanMpt/$idNamaKegiatanMpt")
                            );
                          },
                        ),

                        const CustomFieldSpacer(),

                        MipokaCountText(total: kegiatanPerPeriodeMptList.length),

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
                                              onTap: () {
                                                Navigator.pushNamed(
                                                  context,
                                                  kemahasiswaanMPTMahasiswaKegiatanPerPeriodeEditPageRoute,
                                                  arguments: kegiatanPerPeriodeMpt,
                                                );

                                                print(kegiatanPerPeriodeMpt);
                                              },
                                              child: Image.asset(
                                                'assets/icons/edit.png',
                                                width: 24,
                                              ),
                                            ),

                                            const SizedBox(width: 16.0,),

                                            InkWell(
                                              onTap: () {
                                                context.read<KegiatanPerPeriodeMptBloc>().add(
                                                    DeleteKegiatanPerPeriodeMptEvent(
                                                        idKegiatanPerPeriodeMpt: kegiatanPerPeriodeMpt.idKegiatanPerPeriodeMpt));

                                                mipokaCustomToast("Kegiatan per Periode has been deleted.");
                                                context.read<KegiatanPerPeriodeMptBloc>().add(const ReadAllKegiatanPerPeriodeMptEvent());
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
