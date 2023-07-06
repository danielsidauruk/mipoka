import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/bloc/jenis_kegiatan_drop_down_bloc/jenis_kegiatan_drop_down_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/jenis_kegiatan_mpt/jenis_kegiatan_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/mipoka_user_bloc/mipoka_user_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/nama_kegaitan_mpt_bloc/nama_kegiatan_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/nama_kegiatan_drop_down_bloc/nama_kegiatan_drop_down_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/periode_mpt_dropdown_bloc/periode_mpt_drop_down_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/riwayat_kegiatan_mpt_bloc/riwayat_kegiatan_mpt_bloc.dart';
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

class KemahasiswaanMPTMahasiswaRiwayatKegiatanMahasiswaPage extends StatefulWidget {
  const KemahasiswaanMPTMahasiswaRiwayatKegiatanMahasiswaPage({super.key});

  @override
  State<KemahasiswaanMPTMahasiswaRiwayatKegiatanMahasiswaPage> createState() => _KemahasiswaanMPTMahasiswaRiwayatKegiatanMahasiswaPageState();
}

class _KemahasiswaanMPTMahasiswaRiwayatKegiatanMahasiswaPageState extends State<KemahasiswaanMPTMahasiswaRiwayatKegiatanMahasiswaPage> {
  String yearValue = DateTime.now().year.toString();
  final TextEditingController _nimController = TextEditingController();
  String jenisKegiatanValue = listBentukKegiatan[0];
  String namaKegiatanValue = listNamaKegiatan[0];
  String statusValue = listStatus[0];
  bool isChecked = false;


  int? idPeriodeKegiatanMpt;
  int? idJenisKegiatan;
  int? idNamaKegiatan;

  @override
  void initState() {
    idPeriodeKegiatanMpt = 0;
    idJenisKegiatan = 0;
    idNamaKegiatan = 0;
    
    context.read<RiwayatKegiatanMptBloc>().add(ReadAllRiwayatKegiatanMptEvent());
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

              const CustomMobileTitle(text: 'Kemahasiswaan - MPT Mahasiswa - Riwayat Kegiatan Mahasiswa'),

              const CustomFieldSpacer(),

              BlocBuilder<RiwayatKegiatanMptBloc, RiwayatKegiatanMptState>(
                builder: (context, state) {
                  if (state is RiwayatKegiatanMptLoading) {
                    return const Text("Loading ....");
                  } else if (state is AllRiwayatKegiatanMptHasData) {
                    final riwayatKegiatanMptList = state.riwayatKegiatanMptList;

                    Future.microtask(() {
                      context.read<PeriodeMptDropDownBloc>().add(ReadPeriodeMptDropDownEvent());
                      context.read<JenisKegiatanDropDownBloc>().add(ReadJenisKegiatanDropDownEvent());
                      context.read<NamaKegiatanDropDownBloc>().add(ReadNamaKegiatanDropDownEvent());
                    });

                    return CustomContentBox(
                      children: [
                        CustomAddButton(
                          buttonText: 'Tambah',
                          onPressed: () => Navigator.pushNamed(context, kemahasiswaanMPTMahasiswaRiwayatKegiatanMahasiswaTambahPageRoute),
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
                              tahunPeriodeMptList.insert(0, "Semua");

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

                        buildTitle('Jenis Kegiatan'),
                        BlocBuilder<JenisKegiatanDropDownBloc, JenisKegiatanDropDownState>(
                          builder: (context, state) {
                            if (state is JenisKegiatanDropDownLoading) {
                              return const Text("Loading ...");
                            } else if (state is JenisKegiatanDropDownHasData) {

                              List<String> jenisKegiatanList = state.jenisKegiatanMptList.map(
                                      (jenisKegiatanList) => jenisKegiatanList.namaJenisKegiatanMpt).toList();
                              jenisKegiatanList.insert(0, "Semua");

                              List<int> idJenisKegiatanList = state.jenisKegiatanMptList.map(
                                      (jenisKegiatanMptList) => jenisKegiatanMptList.idJenisKegiatanMpt).toList();
                              idJenisKegiatanList.insert(0, 0);

                              return MipokaCustomDropdown(
                                items: jenisKegiatanList,
                                onValueChanged: (value) {
                                  int index = jenisKegiatanList.indexOf(value ?? "");
                                  idJenisKegiatan = idJenisKegiatanList[index];
                                },
                              );

                            } else if (state is JenisKegiatanDropDownError) {
                              return Text(state.message);
                            } else {
                              return const Text("NamaKegiatanBloc hasn't been triggered yet.");
                            }
                          },
                        ),

                        const CustomFieldSpacer(),

                        buildTitle('Nama Kegiatan'),
                        BlocBuilder<NamaKegiatanDropDownBloc, NamaKegiatanDropDownState>(
                          builder: (context, state) {
                            if (state is NamaKegiatanDropDownLoading) {
                              return const Text("Loading ...");
                            } else if (state is NamaKegiatanDropDownHasData) {
                              List<String> namaKegiatanList = state.namaKegiatanList.map(
                                      (namaKegiatanList) => namaKegiatanList.namaKegiatan).toList();
                              namaKegiatanList.insert(0, "Semua");

                              List<int> idKegiatanList = state.namaKegiatanList.map(
                                      (namaKegiatanMptList) => namaKegiatanMptList.idNamaKegiatanMpt).toList();
                              idKegiatanList.insert(0, 0);

                              idNamaKegiatan = idKegiatanList[0];

                              return MipokaCustomDropdown(
                                items: namaKegiatanList,
                                onValueChanged: (value) {
                                  int index = namaKegiatanList.indexOf(value ?? "");
                                  idNamaKegiatan = idKegiatanList[index];

                                },
                              );
                            } else if (state is NamaKegiatanDropDownError) {
                              return Text(state.message);
                            } else {
                              return const Text("NamaKegiatanBloc hasn't been triggered yet.");
                            }
                          },
                        ),

                        const CustomFieldSpacer(),

                        buildTitle('Status'),
                        MipokaCustomDropdown(
                          items: listStatus,
                          onValueChanged: (value) {},
                        ),

                        const CustomFieldSpacer(),

                        buildTitle('NIM'),
                        CustomTextField(controller: _nimController),

                        const CustomFieldSpacer(),

                        buildTitle('Kelompok Berdasarkan'),
                        Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.black,
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),

                            const Text('Jenis Kegiatan'),
                          ],
                        ),

                        CustomFilterButton(
                          text: 'Filter',
                          onPressed: () {},
                        ),

                        const CustomFieldSpacer(),

                        MipokaCountText(total: riwayatKegiatanMptList.length),

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
                                      'Poin',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Unggahan',
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
                                  DataColumn(
                                    tooltip: 'Aksi yang akan dilakukan',
                                    label: Text(
                                      'Aksi',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],

                                rows: List<DataRow>.generate(riwayatKegiatanMptList.length, (int index) {
                                  final riwayatKegiatanMpt = riwayatKegiatanMptList[index];
                                  
                                  Future.microtask(() {
                                    context.read<MipokaUserBloc>().add(
                                        ReadMipokaUserEvent(idMipokaUser: riwayatKegiatanMpt.idUser));
                                    context.read<NamaKegiatanMptBloc>().add(
                                        ReadNamaKegiatanMptEvent(idNamaKegiatanMpt: riwayatKegiatanMpt.idKegiatanPerPeriodeMpt));
                                  });
                                  
                                  return DataRow(
                                    cells: [
                                      DataCell(
                                        Align(
                                          alignment: Alignment.center,
                                          child: BlocBuilder<MipokaUserBloc, MipokaUserState>(
                                            builder: (context, state) {
                                              if (state is MipokaUserLoading) {
                                                return const Text("Loading ....");
                                              } else if (state is MipokaUserHasData) {
                                                return Text(
                                                  state.mipokaUser.nim,
                                                );
                                              } else if (state is MipokaUserError) {
                                                return Text(state.message);
                                              } else {
                                                return const Text("MipokaUserBloc hasn't been triggered yet.");
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Align(
                                          alignment: Alignment.center,
                                          child: BlocBuilder<MipokaUserBloc, MipokaUserState>(
                                            builder: (context, state) {
                                              if (state is MipokaUserLoading) {
                                                return const Text("Loading ....");
                                              } else if (state is MipokaUserHasData) {
                                                return Text(
                                                  state.mipokaUser.namaLengkap,
                                                );
                                              } else if (state is MipokaUserError) {
                                                return Text(state.message);
                                              } else {
                                                return const Text("MipokaUserBloc hasn't been triggered yet.");
                                              }
                                            },
                                          ),
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
                                        BlocBuilder<NamaKegiatanMptBloc, NamaKegiatanMptState>(
                                          builder: (context, state) {
                                            if (state is NamaKegiatanMptLoading) {
                                              return const Text('Loading ....');
                                            } else if (state is NamaKegiatanMptHasData) {

                                              context.read<JenisKegiatanMptBloc>().add(
                                                ReadJenisKegiatanMptEvent(idJenisKegiatanMpt: state.namaKegiatanMpt.idJenisKegiatanMpt));
                                              
                                              return BlocBuilder<JenisKegiatanMptBloc, JenisKegiatanMptState>(
                                                builder: (context, state) {
                                                  if (state is JenisKegiatanMptLoading) {
                                                    return const Text("Loading ....");
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
                                                    return const Text("JenisKegiatanMptBloc hasn't been triggered yet.");
                                                  }
                                                },
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
                                          child: BlocBuilder<MipokaUserBloc, MipokaUserState>(
                                            builder: (context, state) {
                                              if (state is MipokaUserLoading) {
                                                return const Text("Loading ....");
                                              } else if (state is MipokaUserHasData) {
                                                return Text(
                                                  "${state.mipokaUser.pointMpt}",
                                                );
                                              } else if (state is MipokaUserError) {
                                                return Text(state.message);
                                              } else {
                                                return const Text("MipokaUserBloc hasn't been triggered yet.");
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Align(
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            'assets/icons/pdf.png',
                                            width: 24,
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Align(
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            'assets/icons/approve.png',
                                            width: 24,
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            InkWell(
                                              onTap: () => Navigator.pushNamed(
                                                context,
                                                mptMahasiswaRiwayatKegiatanMahasiswaEditPageRoute,
                                                arguments: riwayatKegiatanMpt,
                                              ),
                                              child: Image.asset(
                                                'assets/icons/edit.png',
                                                width: 24,
                                              ),
                                            ),

                                            const SizedBox(width: 8.0,),

                                            InkWell(
                                              onTap: () {
                                                context.read<RiwayatKegiatanMptBloc>().add(
                                                  UpdateRiwayatKegiatanMptEvent(
                                                    riwayatKegiatanMpt: riwayatKegiatanMpt.copyWith(
                                                      statusMpt: "approve",
                                                    ),
                                                  ),
                                                );

                                                context.read<RiwayatKegiatanMptBloc>().add(ReadAllRiwayatKegiatanMptEvent());

                                                mipokaCustomToast("Riwayat kegiatan MPT telah di approve");
                                              },
                                              child: Image.asset(
                                                'assets/icons/approve.png',
                                                width: 24,
                                              ),
                                            ),

                                            const SizedBox(width: 8.0,),

                                            InkWell(
                                              onTap: () {
                                                context.read<RiwayatKegiatanMptBloc>().add(
                                                    DeleteRiwayatMptEvent(idRiwayatKegiatanMpt: riwayatKegiatanMpt.idRiwayatKegiatanMpt));

                                                mipokaCustomToast("Riwayat Kegiatan telah dihapus");
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
                  } else if (state is RiwayatKegiatanMptError) {
                    return Text(state.message);
                  } else {
                    return const Text("RiwayatKegiatanMpt hasn't been triggered yet.");
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
