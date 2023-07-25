import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/domain/utils/format_date_indonesia.dart';
import 'package:mipoka/mipoka/domain/entities/periode_mpt.dart';
import 'package:mipoka/mipoka/presentation/bloc/periode_mpt_bloc/periode_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_add_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_total_count.dart';

class KemahasiswaanMPTMahasiswaPeriodePage extends StatefulWidget {
  const KemahasiswaanMPTMahasiswaPeriodePage({super.key});

  @override
  State<KemahasiswaanMPTMahasiswaPeriodePage> createState() =>
      _KemahasiswaanMPTMahasiswaPeriodePageState();
}

class _KemahasiswaanMPTMahasiswaPeriodePageState
    extends State<KemahasiswaanMPTMahasiswaPeriodePage> {

  @override
  void initState() {
    context.read<PeriodeMptBloc>().add(ReadAllPeriodeMptEvent());
    super.initState();
  }

  @override
  void dispose() {
    context.read<PeriodeMptBloc>().close();
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomMobileTitle(
                  text: 'Kemahasiswaan - MPT Mahasiswa - Periode'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [
                  CustomAddButton(
                    buttonText: 'Tambah',
                    onPressed: () async {
                      final result = await Navigator.pushNamed(
                        context,
                        kemahasiswaanMPTMahasiswaTambahPeriodePageRoute,
                      );

                      if (result != null && result is PeriodeMpt && context.mounted) {
                        context.read<PeriodeMptBloc>().add(
                          CreatePeriodeMptEvent(periodeMpt: result),
                        );
                      }
                    }
                  ),

                  const CustomFieldSpacer(),

                  BlocConsumer<PeriodeMptBloc, PeriodeMptState>(
                    listenWhen: (prev, current) =>
                    prev.runtimeType != current.runtimeType,
                    listener: (context, state) {
                      if (state is PeriodeMptSuccess) {

                        context.read<PeriodeMptBloc>().add(
                            ReadAllPeriodeMptEvent());

                      } else if (state is PeriodeMptError) {
                        mipokaCustomToast(state.message);
                      }
                    },

                    builder: (context, state) {
                      if(state is PeriodeMptLoading) {
                        return const Text('Loading ...');
                      } else if (state is AllPeriodeMptHasData) {
                        final periodeMptList = state.periodeMptList;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MipokaCountText(total: periodeMptList.length),

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
                                        'Tahun',
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
                                  rows: List<DataRow>.generate(periodeMptList.length, (int index) {
                                    final periodeMpt = periodeMptList[index];

                                    return DataRow(
                                      cells: [
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "${periodeMpt.tahunPeriodeMpt} "
                                                  "${periodeMpt.periodeMengulangMpt == true ? "(Ulang)" : ""}",
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              formatDateIndonesia(periodeMpt.tanggalMulaiPeriodeMpt),
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              formatDateIndonesia(periodeMpt.tanggalBerakhirPeriodeMpt),
                                            ),
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
                                                    kemahasiswaanMPTMahasiswaPeriodeEditPageRoute,
                                                    arguments: periodeMpt,
                                                  );

                                                  if (result != null && result is PeriodeMpt && context.mounted) {
                                                    context.read<PeriodeMptBloc>().add(
                                                      UpdatePeriodeMptEvent(periodeMpt: result),
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
                                                  context.read<PeriodeMptBloc>().add(DeletePeriodeMptEvent(periodeMpt.idPeriodeMpt));
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

                      } else if (state is PeriodeMptError) {
                        return Text(state.message);
                      } else {
                        return const Text("PeriodeMpt hasn't Triggered yet awoawok.");
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
