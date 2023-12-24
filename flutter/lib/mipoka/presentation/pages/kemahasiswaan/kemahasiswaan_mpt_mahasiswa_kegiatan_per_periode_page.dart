import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/domain/entities/kegiatan_per_periode_mpt.dart';
import 'package:mipoka/mipoka/presentation/bloc/kegiatan_per_periode_mpt_bloc/kegiatan_per_periode_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/nama_kegiatan_drop_down_bloc/nama_kegiatan_drop_down_bloc.dart';
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

  int? _idPeriodeKegiatanMpt;
  int? _idNamaKegiatanMpt;

  @override
  void initState() {
    Future.microtask(() {
      context.read<KegiatanPerPeriodeMptBloc>().add(const ReadAllKegiatanPerPeriodeMptEvent());
    });
    super.initState();
  }

  @override
  void dispose() {
    context.read<KegiatanPerPeriodeMptBloc>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    print(size.width);

    return Scaffold(
      appBar: MipokaMobileAppBar(
        onRefresh: () {
          mipokaCustomToast(refreshMessage);
          context.read<KegiatanPerPeriodeMptBloc>().close();
        },
      ),

      drawer: const CustomKemahasiswaanDrawer(),

      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                const CustomMobileTitle(text: 'Kemahasiswaan - MPT Mahasiswa - Kegiatan per Periode'),

                const CustomFieldSpacer(),

                CustomContentBox(
                  children: [

                    CustomAddButton(
                      buttonText: 'Tambah',
                      onPressed: () async {
                        final result = await Navigator.pushNamed(
                          context,
                          kemahasiswaanMPTMahasiswaKegiatanPerPeriodeTambahPageRoute,
                        );

                        if (result is KegiatanPerPeriodeMpt && context.mounted) {
                          context.read<KegiatanPerPeriodeMptBloc>().add(
                            CreateKegiatanPerPeriodeMptEvent(
                              kegiatanPerPeriodeMpt: result,
                            ),
                          );
                        }
                      }
                    ),

                    const CustomFieldSpacer(),

                    BlocConsumer<KegiatanPerPeriodeMptBloc, KegiatanPerPeriodeMptState>(
                      listenWhen: (prev, current) =>
                      prev.runtimeType != current.runtimeType,
                      listener: (context, state) async {

                        if (state is KegiatanPerPeriodeMptSuccess) {
                          context.read<KegiatanPerPeriodeMptBloc>().add(const ReadAllKegiatanPerPeriodeMptEvent());

                        } else if (state is KegiatanPerPeriodeMptError) {
                          mipokaCustomToast(state.message);
                        }
                      },

                      builder: (context, state) {
                        if (state is KegiatanPerPeriodeMptLoading) {
                          return const Text("Loading ....");
                        } else if (state is AllKegiatanPerPeriodeMptHasData) {
                          final kegiatanPerPeriodeMptList = state.kegiatanPerPeriodeMptList;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MipokaCountText(total: kegiatanPerPeriodeMptList.length),

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

                                      return DataRow(
                                        cells: [
                                          DataCell(
                                            Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "${kegiatanPerPeriodeMpt.periodeMpt.tahunPeriodeMpt} "
                                                    "${kegiatanPerPeriodeMpt.periodeMpt.periodeMengulangMpt ? "(ulang)" : ""}",
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                kegiatanPerPeriodeMpt.namaKegiatanMpt.jenisKegiatanMpt.namaJenisKegiatanMpt,
                                              ),
                                            ),
                                          ),

                                          DataCell(
                                            Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                kegiatanPerPeriodeMpt.namaKegiatanMpt.namaKegiatan,
                                              ),
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
                                                  onTap: () async {
                                                    final result = await Navigator.pushNamed(
                                                      context,
                                                      kemahasiswaanMPTMahasiswaKegiatanPerPeriodeEditPageRoute,
                                                      arguments: kegiatanPerPeriodeMpt,
                                                    );

                                                    if (result is KegiatanPerPeriodeMpt && context.mounted) {
                                                      context.read<KegiatanPerPeriodeMptBloc>().add(
                                                        UpdateKegiatanPerPeriodeMptEvent(
                                                          kegiatanPerPeriodeMpt: result,
                                                        ),
                                                      );
                                                    }
                                                  },
                                                  child: Image.asset(
                                                    'assets/icons/edit.png',
                                                    width: 24,
                                                  ),
                                                ),

                                                const SizedBox(width: 16.0),

                                                InkWell(
                                                  onTap: () {
                                                    context.read<KegiatanPerPeriodeMptBloc>().add(
                                                        DeleteKegiatanPerPeriodeMptEvent(
                                                            idKegiatanPerPeriodeMpt: kegiatanPerPeriodeMpt.idKegiatanPerPeriodeMpt));
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
                        } else if (state is KegiatanPerPeriodeMptError) {
                          return Text(state.message);
                        } else {
                          return const Text("KegiatanPeriodeMpt hasn't been triggered yet.");
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          )
      ),
    );
  }
}
