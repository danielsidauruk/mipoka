import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/bloc/mhs_per_periode_mpt_use_cases/mhs_per_periode_mpt_use_cases_bloc.dart';
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

  final TextEditingController _nimController = TextEditingController();
  int? _idPeriodeKegiatanMpt;
  String? _prodi;
  String? _jumlahPoint;

  @override
  void initState() {
    _nimController.text = _nimController.text.isEmpty ? "" : _nimController.text;
    _prodi ??= listProdi[0];
    _jumlahPoint ??= listJumlahPoint[0];

    context.read<MhsPerPeriodeMptBloc>().add(const ReadAllMhsPerPeriodeMptEvent());
    context.read<PeriodeMptDropDownBloc>().add(ReadPeriodeMptDropDownEvent());
    super.initState();
  }

  @override
  void dispose() {
    context.read<MhsPerPeriodeMptBloc>().close();
    context.read<PeriodeMptDropDownBloc>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: MipokaMobileAppBar(
        onRefresh: () {
          mipokaCustomToast(refreshMessage);
          context.read<MhsPerPeriodeMptBloc>().add(const ReadAllMhsPerPeriodeMptEvent());
          context.read<PeriodeMptDropDownBloc>().add(ReadPeriodeMptDropDownEvent());
        },
      ),

      drawer: const CustomKemahasiswaanDrawer(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              const CustomMobileTitle(text: 'Kemahasiswaan - MPT Mahasiswa - Mahasiswa Per Periode'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomAddButton(
                        buttonText: 'Tambah',
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            kemahasiswaanMPTMahasiswaMahasiswaPerPeriodeTambahPageRoute,
                          ).then((_) =>
                              context.read<MhsPerPeriodeMptBloc>().add(const ReadAllMhsPerPeriodeMptEvent()));
                        }
                      ),

                      const CustomFieldSpacer(),
                    ],
                  ),

                  const CustomFieldSpacer(),

                  BlocConsumer<MhsPerPeriodeMptBloc, MhsPerPeriodeMptState>(
                    listenWhen: (prev, current) =>
                    prev.runtimeType != current.runtimeType,
                    listener: (context, state) async {
                      if (state is DeleteMhsPerPeriodeMptSuccess) {
                        context.read<MhsPerPeriodeMptBloc>().add(const ReadAllMhsPerPeriodeMptEvent());
                      } else if (state is MhsPerPeriodeMptError) {
                        mipokaCustomToast(state.message);
                      }
                    },

                    builder: (context, state) {
                      if (state is MhsPerPeriodeMptLoading) {
                        return const Text("Loading ....");
                      } else if (state is AllMhsPerPeriodeMptHasData) {
                        final mhsPerPeriodeMptList = state.mhsPerPeriodeMptList;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

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

                                    return DataRow(
                                      cells: [
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(mhsPerPeriodeMpt.periodeMpt.tahunPeriodeMpt),
                                          ),
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(mhsPerPeriodeMpt.mipokaUser.prodi),
                                          ),
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(mhsPerPeriodeMpt.mipokaUser.nim),
                                          ),
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(mhsPerPeriodeMpt.mipokaUser.namaLengkap),
                                          ),
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(mhsPerPeriodeMpt.mipokaUser.pointMpt.toString()),
                                          ),
                                        ),
                                        DataCell(
                                          InkWell(
                                            onTap: () => context.read<MhsPerPeriodeMptBloc>().add(
                                                DeleteMhsPerPeriodeMptEvent(idMhsPerPeriodeMpt: mhsPerPeriodeMpt.idMhsPerPeriodeMpt)),

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
              )
            ],
          ),
        ),
      ),
    );
  }
}
