import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/domain/entities/nama_kegiatan_mpt.dart';
import 'package:mipoka/mipoka/presentation/bloc/jenis_kegiatan_drop_down_bloc/jenis_kegiatan_drop_down_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/nama_kegaitan_mpt_bloc/nama_kegiatan_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_add_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_total_count.dart';

class MPTMahasiswaKegiatanPerJenisKegiatanPage extends StatefulWidget {
  const MPTMahasiswaKegiatanPerJenisKegiatanPage({super.key});

  @override
  State<MPTMahasiswaKegiatanPerJenisKegiatanPage> createState() => _MPTMahasiswaKegiatanPerJenisKegiatanPageState();
}

class _MPTMahasiswaKegiatanPerJenisKegiatanPageState extends State<MPTMahasiswaKegiatanPerJenisKegiatanPage> {
  int? _idNamaKegiatanMpt;

  @override
  void initState() {
    context.read<NamaKegiatanMptBloc>().add(const ReadAllNamaKegiatanMptEvent());
    // context.read<JenisKegiatanDropDownBloc>().add(ReadJenisKegiatanDropDownEvent());
    super.initState();
  }

  @override
  void dispose() {
    context.read<NamaKegiatanMptBloc>().close();
    // context.read<JenisKegiatanDropDownBloc>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        appBar: MipokaMobileAppBar(
          onRefresh: () {
            mipokaCustomToast(refreshMessage);
            context.read<NamaKegiatanMptBloc>().add(const ReadAllNamaKegiatanMptEvent());
            // context.read<JenisKegiatanDropDownBloc>().add(ReadJenisKegiatanDropDownEvent());
          },
        ),

        drawer: const CustomKemahasiswaanDrawer(),

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomMobileTitle(
                    text:
                        'Kemahasiswaan - MPT Mahasiswa - Kegiatan per Jenis Kegiatan'),
                const CustomFieldSpacer(),

                CustomContentBox(
                  children: [
                    CustomAddButton(
                      buttonText: 'Tambah',
                      onPressed: () async {
                        final result = await Navigator.pushNamed(
                          context,
                          mptMahasiswaKegiatanPerJenisKegiatanTambahPageRoute,
                        );

                        if (result != null && result is NamaKegiatanMpt && context.mounted) {
                          context.read<NamaKegiatanMptBloc>().add(
                            CreateNamaKegiatanMptEvent(namaKegiatanMpt: result)
                          );
                        }
                      }
                    ),

                    // const CustomFieldSpacer(),
                    //
                    // buildTitle('Jenis Kegiatan'),
                    // BlocBuilder<JenisKegiatanDropDownBloc, JenisKegiatanDropDownState>(
                    //   builder: (context, state) {
                    //     if (state is JenisKegiatanDropDownLoading) {
                    //       return const Text("Loading ...");
                    //     } else if (state is JenisKegiatanDropDownHasData) {
                    //
                    //       List<String> jenisKegiatanList = state.jenisKegiatanMptList.map(
                    //               (jenisKegiatanList) => jenisKegiatanList.namaJenisKegiatanMpt).toList();
                    //       jenisKegiatanList.insert(0, "Semua");
                    //
                    //       List<int> idNamaKegiatanList = state.jenisKegiatanMptList.map(
                    //               (jenisKegiatanMptList) => jenisKegiatanMptList.idJenisKegiatanMpt).toList();
                    //       idNamaKegiatanList.insert(0, 0);
                    //
                    //       _idNamaKegiatanMpt ??= idNamaKegiatanList[0];
                    //
                    //       return MipokaCustomDropdown(
                    //         items: jenisKegiatanList,
                    //         onValueChanged: (value) {
                    //           int index = jenisKegiatanList.indexOf(value ?? "");
                    //           _idNamaKegiatanMpt = idNamaKegiatanList[index];
                    //
                    //           context.read<NamaKegiatanMptBloc>().add(
                    //               ReadAllNamaKegiatanMptEvent(id: _idNamaKegiatanMpt ?? 0));
                    //         },
                    //       );
                    //     } else if (state is JenisKegiatanDropDownError) {
                    //       return Text(state.message);
                    //     } else {
                    //       return const Text("NamaKegiatanBloc hasn't been triggered yet.");
                    //     }
                    //   },
                    // ),

                    const CustomFieldSpacer(),

                    BlocConsumer<NamaKegiatanMptBloc, NamaKegiatanMptState>(
                      listenWhen: (prev, current) =>
                      prev.runtimeType != current.runtimeType,
                      listener: (context, state) {
                        if (state is NamaKegiatanMptSuccess) {

                          context.read<NamaKegiatanMptBloc>().add(const ReadAllNamaKegiatanMptEvent());

                        } else if (state is NamaKegiatanMptError) {
                          mipokaCustomToast(state.message);
                        }
                      },

                      builder: (context, state) {
                        if (state is NamaKegiatanMptLoading) {
                          return const Text('Loading ...');
                        } else if (state is AllNamaKegiatanMptHasData) {
                          final namaKegiatanMptList = state.namaKegiatanMptList;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MipokaCountText(total: namaKegiatanMptList.length),

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
                                          'Id Kegiatan',
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
                                        tooltip: 'Aksi yang akan dilakukan',
                                        label: Text(
                                          'Aksi',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                    rows: List<DataRow>.generate(namaKegiatanMptList.length, (int index) {
                                      final namaKegiatanMpt = namaKegiatanMptList[index];

                                      return DataRow(
                                        cells: [
                                          DataCell(
                                            Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                // 1690021017016894
                                                "${namaKegiatanMpt.idNamaKegiatanMpt}",
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                namaKegiatanMpt.jenisKegiatanMpt.namaJenisKegiatanMpt,
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                              Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  namaKegiatanMpt.namaKegiatan,
                                                ),
                                              )
                                          ),
                                          DataCell(
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                              children: [
                                                InkWell(
                                                  onTap: () async {
                                                    final result = await Navigator.pushNamed(
                                                      context,
                                                      kemahasiswaanMPTMahasiswaKegiatanPerJenisKegiatanEditPageRoute,
                                                      arguments: namaKegiatanMpt,
                                                    );

                                                    if (result != null && result is NamaKegiatanMpt && context.mounted) {
                                                      context.read<NamaKegiatanMptBloc>().add(
                                                          UpdateNamaKegiatanMptEvent(namaKegiatanMpt: result)
                                                      );
                                                    }
                                                  },
                                                  child: Image.asset(
                                                    'assets/icons/edit.png',
                                                    width: 24,
                                                  ),
                                                ),

                                                const SizedBox(width: 16.0,),

                                                InkWell(
                                                  onTap: () {
                                                    context.read<NamaKegiatanMptBloc>().add(
                                                        DeleteNamaKegiatanMptEvent(idNamaKegiatanMpt: namaKegiatanMpt.idNamaKegiatanMpt));
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
                            ],
                          );
                        } else if (state is NamaKegiatanMptError) {
                          return Text(state.message);
                        } else {
                          return const Text("KegiatanMptBloc hasn't triggered yet.");
                        }
                      },
                    ),
                    const CustomFieldSpacer(),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
