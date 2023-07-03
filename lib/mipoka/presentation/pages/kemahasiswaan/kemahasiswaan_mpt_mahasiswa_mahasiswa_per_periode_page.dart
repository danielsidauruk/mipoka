import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/bloc/mhs_per_periode_mpt_use_cases/mhs_per_periode_mpt_use_cases_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/mipoka_user_bloc/mipoka_user_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/periode_mpt_bloc/periode_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/periode_mpt_dropdown_bloc/periode_mpt_drop_down_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_add_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_filter_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_total_count.dart';

class KemahasiswaanMPTMahasiswaMahasiswaPerPeriodePage extends StatefulWidget {
  const KemahasiswaanMPTMahasiswaMahasiswaPerPeriodePage({super.key});

  @override
  State<KemahasiswaanMPTMahasiswaMahasiswaPerPeriodePage> createState() => _KemahasiswaanMPTMahasiswaMahasiswaPerPeriodePageState();
}

class _KemahasiswaanMPTMahasiswaMahasiswaPerPeriodePageState extends State<KemahasiswaanMPTMahasiswaMahasiswaPerPeriodePage> {

  final TextEditingController _jumlahPoinController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  late int idPeriodeKegiatanMpt;

  @override
  void initState() {
    _jumlahPoinController.text = "semua";
    _nimController.text = "semua";
    idPeriodeKegiatanMpt = 0;

    context.read<MhsPerPeriodeMptBloc>().add(const ReadAllMhsPerPeriodeMptEvent());
    super.initState();
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

              const CustomMobileTitle(text: 'Kemahasiswaan - MPT Mahasiswa - Mahasiswa Per Periode'),

              const CustomFieldSpacer(),

              BlocBuilder<MhsPerPeriodeMptBloc, MhsPerPeriodeMptState>(
                builder: (context, state) {
                  if (state is MhsPerPeriodeMptEmpty) {
                    return const Text("Loading ....");
                  } else if (state is AllMhsPerPeriodeMptHasData) {
                    final mhsPerPeriodeMptList = state.mhsPerPeriodeMptList;

                    Future.microtask(() {
                      context.read<PeriodeMptDropDownBloc>().add(ReadPeriodeMptDropDownEvent());
                      // context.read<NamaKegiatanDropDownBloc>().add(ReadNamaKegiatanDropDownEvent());
                      // context.read<JenisKegiatanMptBloc>().add(const ReadAllJenisKegiatanMptEvent());
                    });

                    return CustomContentBox(
                      children: [

                        CustomAddButton(
                          buttonText: 'Tambah',
                          onPressed: () => Navigator.pushNamed(context, kemahasiswaanMPTMahasiswaMahasiswaPerPeriodeTambahPageRoute),
                        ),

                        const CustomFieldSpacer(),

                        CustomFilterButton(
                          text: 'Export',
                          onPressed: (){},
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
                              tahunPeriodeMptList.insert(0, "semua");

                              List<int> idTahunPeriodeList = state.periodeMptList.map(
                                      (periodeMptList) => periodeMptList.idPeriodeMpt).toList();
                              idTahunPeriodeList.insert(0, 0);

                              return MipokaCustomDropdown(
                                  items: tahunPeriodeMptList,
                                  onValueChanged: (value) {
                                    int index = tahunPeriodeMptList.indexOf(value!);
                                    int idPeriodeMpt = idTahunPeriodeList[index];

                                    // print("$idPeriodeMpt, $value");

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

                        buildTitle('Prodi'),
                        MipokaCustomDropdown(
                          items: listProdi,
                          onValueChanged: (value) {

                          },
                        ),

                        const CustomFieldSpacer(),

                        buildTitle('Jumlah Poin'),
                        CustomTextField(controller: _jumlahPoinController),

                        const CustomFieldSpacer(),

                        buildTitle('NIM'),
                        CustomTextField(controller: _nimController),

                        const CustomFieldSpacer(),

                        CustomFilterButton(
                          text: 'Filter',
                          onPressed: () {},
                        ),

                        const CustomFieldSpacer(),

                        MipokaCountText(total: mhsPerPeriodeMptList.length),

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
                                    'Periode',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Prodi',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'NIM',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Nama',
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
                                  tooltip: 'Aksi yang akan dilakukan',
                                  label: Text(
                                    'Aksi',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],

                              rows: List<DataRow>.generate(mhsPerPeriodeMptList.length, (int index) {
                                final mhsPerPeriodeMpt = mhsPerPeriodeMptList[index];

                                Future.microtask(() {
                                  context.read<PeriodeMptBloc>().add(
                                      ReadPeriodeMptEvent(idPeriodeMpt: mhsPerPeriodeMpt.idPeriodeMpt));
                                  context.read<MipokaUserBloc>().add(
                                      ReadMipokaUserEvent(idMipokaUser: mhsPerPeriodeMpt.idUser));
                                });

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
                                      BlocBuilder<MipokaUserBloc, MipokaUserState>(
                                        builder: (context, state) {
                                          if (state is MipokaUserLoading) {
                                            return const Text("Loading ....");
                                          } else if (state is MipokaUserHasData) {
                                            return Align(
                                              alignment: Alignment.center,
                                              child: Text(state.mipokaUser.prodi),
                                            );
                                          } else if (state is MipokaUserError) {
                                            return Text(state.message);
                                          } else {
                                            return const Text("MipokaUserBloc hasn't been triggered yet.");
                                          }
                                        },
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
                                              child: Text(state.mipokaUser.nim),
                                            );
                                          } else if (state is MipokaUserError) {
                                            return Text(state.message);
                                          } else {
                                            return const Text("MipokaUserBloc hasn't been triggered yet.");
                                          }
                                        },
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
                                              child: Text(state.mipokaUser.namaLengkap),
                                            );
                                          } else if (state is MipokaUserError) {
                                            return Text(state.message);
                                          } else {
                                            return const Text("MipokaUserBloc hasn't been triggered yet.");
                                          }
                                        },
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
                                              child: Text(state.mipokaUser.pointMpt.toString()),
                                            );
                                          } else if (state is MipokaUserError) {
                                            return Text(state.message);
                                          } else {
                                            return const Text("MipokaUserBloc hasn't been triggered yet.");
                                          }
                                        },
                                      ),
                                    ),
                                    DataCell(
                                      InkWell(
                                        onTap: () {
                                          context.read<MhsPerPeriodeMptBloc>().add(
                                            DeleteMhsPerPeriodeMptEvent(idMhsPerPeriodeMpt: mhsPerPeriodeMpt.idMhsPerPeriodeMpt));
                                          context.read<MhsPerPeriodeMptBloc>().add(const ReadAllMhsPerPeriodeMptEvent());

                                          mipokaCustomToast("Mahasiswa per periode telah dihapus");
                                        },
                                        child: Image.asset(
                                          'assets/icons/delete.png',
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
                  } else if (state is MhsPerPeriodeMptError) {
                    return Text(state.message);
                  } else {
                    return const Text("MhsPerPeriodeMptBloc hasn't been triggered yet.");
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
