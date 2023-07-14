import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
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
      context.read<NamaKegiatanDropDownBloc>().add(ReadNamaKegiatanDropDownEvent());
      context.read<PeriodeMptDropDownBloc>().add(ReadPeriodeMptDropDownEvent());
    });
    super.initState();
  }

  @override
  void dispose() {
    context.read<KegiatanPerPeriodeMptBloc>().close();
    context.read<PeriodeMptDropDownBloc>().close();
    context.read<NamaKegiatanDropDownBloc>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    print(size.width);

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

                CustomContentBox(
                  children: [

                    CustomAddButton(
                      buttonText: 'Tambah',
                      onPressed: () => Navigator.pushNamed(
                        context,
                        kemahasiswaanMPTMahasiswaKegiatanPerPeriodeTambahPageRoute,
                      ).then((_) => context.read<KegiatanPerPeriodeMptBloc>().add(
                          ReadAllKegiatanPerPeriodeMptEvent(filter: "$_idPeriodeKegiatanMpt/$_idNamaKegiatanMpt"))),
                    ),

                    const CustomFieldSpacer(),

                    buildTitle('Periode Kegiatan'),
                    BlocBuilder<PeriodeMptDropDownBloc, PeriodeMptDropDownState>(
                      builder: (context, state) {
                        if (state is PeriodeMptDropDownLoading) {
                          return const Text("Loading ....");
                        } else if (state is PeriodeMptDropDownHasData) {
                          final periodeMptList = state.periodeMptList;

                          List<String> periodeMptDropDownList = periodeMptList.map(
                                  (periodeMptList) => periodeMptList.periodeMengulangMpt == true ?
                              "${periodeMptList.tahunPeriodeMpt} (ulang)" :
                              periodeMptList.tahunPeriodeMpt).toList();
                          periodeMptDropDownList.insert(0, "Semua");

                          List<int> idTahunPeriodeList = periodeMptList.map(
                                  (periodeMptList) => periodeMptList.idPeriodeMpt).toList();
                          idTahunPeriodeList.insert(0, 0);

                          _idPeriodeKegiatanMpt ??= idTahunPeriodeList[0];

                          return MipokaCustomDropdown(
                              items: periodeMptDropDownList,
                              onValueChanged: (value) {
                                int index = periodeMptDropDownList.indexOf(value!);
                                _idPeriodeKegiatanMpt = idTahunPeriodeList[index];
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

                          _idNamaKegiatanMpt ??= idKegiatanList[0];

                          return MipokaCustomDropdown(
                            items: namaKegiatanList,
                            onValueChanged: (value) {
                              int index = namaKegiatanList.indexOf(value ?? "");
                              _idNamaKegiatanMpt = idKegiatanList[index];

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

                    CustomFilterButton(
                      text: 'Filter',
                      onPressed: () => context.read<KegiatanPerPeriodeMptBloc>().add(
                          ReadAllKegiatanPerPeriodeMptEvent(filter: "$_idPeriodeKegiatanMpt/$_idNamaKegiatanMpt")),
                    ),

                    const CustomFieldSpacer(),

                    BlocBuilder<KegiatanPerPeriodeMptBloc, KegiatanPerPeriodeMptState>(
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

                                      // Future.microtask(() {
                                      //   context.read<PeriodeMptBloc>().add(
                                      //       ReadPeriodeMptEvent(idPeriodeMpt: kegiatanPerPeriodeMpt.idPeriodeMpt));
                                      //   context.read<NamaKegiatanMptBloc>().add(
                                      //       ReadNamaKegiatanMptEvent(idNamaKegiatanMpt: kegiatanPerPeriodeMpt.idNamaKegiatanMpt));
                                      //   context.read<JenisKegiatanMptBloc>().add(
                                      //       ReadJenisKegiatanMptEvent(idJenisKegiatanMpt: kegiatanPerPeriodeMpt.idJenisKegiatanMpt));
                                      // });

                                      return DataRow(
                                        cells: [
                                          DataCell(
                                            Align(
                                              alignment: Alignment.center,
                                              child: Text(kegiatanPerPeriodeMpt.periodeMpt.tahunPeriodeMpt),
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
                                                  onTap: () {
                                                    Navigator.pushNamed(
                                                      context,
                                                      kemahasiswaanMPTMahasiswaKegiatanPerPeriodeEditPageRoute,
                                                      arguments: kegiatanPerPeriodeMpt,
                                                    ).then((_) => context.read<KegiatanPerPeriodeMptBloc>().add(
                                                        ReadAllKegiatanPerPeriodeMptEvent(filter: "$_idPeriodeKegiatanMpt/$_idNamaKegiatanMpt")));
                                                  },
                                                  child: Image.asset(
                                                    'assets/icons/edit.png',
                                                    width: 24,
                                                  ),
                                                ),

                                                const SizedBox(width: 16.0),

                                                InkWell(
                                                  onTap: () => Future.microtask(() {
                                                    mipokaCustomToast("Kegiatan per Periode has been deleted.");
                                                    context.read<KegiatanPerPeriodeMptBloc>().add(
                                                        DeleteKegiatanPerPeriodeMptEvent(
                                                            idKegiatanPerPeriodeMpt: kegiatanPerPeriodeMpt.idKegiatanPerPeriodeMpt));
                                                    context.read<KegiatanPerPeriodeMptBloc>().add(
                                                        ReadAllKegiatanPerPeriodeMptEvent(filter: "$_idPeriodeKegiatanMpt/$_idNamaKegiatanMpt"));
                                                  }),
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
                ),],
            ),
          )
      ),
    );
  }
}
