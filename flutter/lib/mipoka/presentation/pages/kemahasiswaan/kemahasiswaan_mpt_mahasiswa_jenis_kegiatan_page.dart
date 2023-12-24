import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/domain/entities/jenis_kegiatan_mpt.dart';
import 'package:mipoka/mipoka/presentation/bloc/jenis_kegiatan_mpt/jenis_kegiatan_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/riwayat_kegiatan_mpt_bloc/riwayat_kegiatan_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_add_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_total_count.dart';

class KemahasiswaanMPTMahasiswaJenisKegiatanPage extends StatefulWidget {
  const KemahasiswaanMPTMahasiswaJenisKegiatanPage({super.key});

  @override
  State<KemahasiswaanMPTMahasiswaJenisKegiatanPage> createState() =>
      _KemahasiswaanMPTMahasiswaJenisKegiatanPageState();
}

class _KemahasiswaanMPTMahasiswaJenisKegiatanPageState
    extends State<KemahasiswaanMPTMahasiswaJenisKegiatanPage> {

  @override
  void initState() {
    context.read<JenisKegiatanMptBloc>().add(const ReadAllJenisKegiatanMptEvent());
    super.initState();
  }

  @override
  void dispose() {
    context.read<JenisKegiatanMptBloc>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MipokaMobileAppBar(
        onRefresh: () {
          mipokaCustomToast(refreshMessage);
          context.read<JenisKegiatanMptBloc>().add(const ReadAllJenisKegiatanMptEvent());
        },
      ),

      drawer: const CustomKemahasiswaanDrawer(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomMobileTitle(
                  text: 'Kemahasiswaan - MPT Mahasiswa - Jenis Kegiatan'),
              const CustomFieldSpacer(),
              CustomContentBox(
                children: [
                  CustomAddButton(
                    buttonText: 'Tambah',
                    onPressed: () async {
                      final result = await Navigator.pushNamed(
                        context,
                        kemahasiswaanMPTMahasiswaJenisKegiatanTambahPageRoute,
                      );

                      if (result != null && result is JenisKegiatanMpt && context.mounted){
                        context.read<JenisKegiatanMptBloc>().add(
                          CreateJenisKegiatanMptEvent(jenisKegiatanMpt: result),
                        );
                      }
                    }
                  ),

                  const CustomFieldSpacer(),

                  BlocConsumer<JenisKegiatanMptBloc, JenisKegiatanMptState>(
                    listenWhen: (prev, current) =>
                    prev.runtimeType != current.runtimeType,
                    listener: (context, state) {

                      if (state is JenisKegiatanMptSuccess) {
                        context.read<JenisKegiatanMptBloc>().add(const ReadAllJenisKegiatanMptEvent());

                      } else if (state is JenisKegiatanMptError) {
                        mipokaCustomToast(state.message);
                      }
                    },

                    builder: (context, state) {
                      if (state is JenisKegiatanMptLoading) {
                        return const Text('Loading');
                      } else if (state is AllJenisKegiatanMptHasData) {
                        final jenisKegiatanMptList = state.jenisKegiatanMptList;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MipokaCountText(total: jenisKegiatanMptList.length),

                            const CustomFieldSpacer(),

                            SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: DataTable(
                                  border: TableBorder.all(color: Colors.white),
                                  columns: const [
                                    DataColumn(
                                      label: Text(
                                        'Nama Jenis Kegiatan',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    DataColumn(
                                      tooltip: 'Aksi yang akan dilakukan',
                                      label: Text(
                                        'Aksi',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                  rows: List<DataRow>.generate(jenisKegiatanMptList.length, (int index) {
                                    final jenisKegiatanMpt = jenisKegiatanMptList[index];

                                    return DataRow(
                                      cells: [
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              jenisKegiatanMpt.namaJenisKegiatanMpt,
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
                                                    kemahasiswaanMPTMahasiswaJenisKegiatanEditPageRoute,
                                                    arguments: jenisKegiatanMpt,
                                                  );

                                                  if (result is JenisKegiatanMpt && context.mounted) {
                                                    context.read<JenisKegiatanMptBloc>().add(
                                                        UpdateJenisKegiatanMptEvent(jenisKegiatanMpt: result));
                                                  }
                                                },

                                                child: Image.asset(
                                                  'assets/icons/edit.png',
                                                  width: 24,
                                                ),
                                              ),

                                              const SizedBox(width: 8.0),

                                              InkWell(
                                                onTap: () {
                                                  context.read<JenisKegiatanMptBloc>().add(
                                                      DeleteJenisKegiatanMptEvent(idJenisKegiatan: jenisKegiatanMpt.idJenisKegiatanMpt));
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
                      } else if (state is JenisKegiatanMptError) {
                        return Text(state.message);
                      } else {
                        return const Text('IDK');
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
