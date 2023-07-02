import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/bloc/jenis_kegiatan_mpt/jenis_kegiatan_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/kegiatan_mpt_bloc/kegiatan_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_add_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';

class MPTMahasiswaKegiatanPerJenisKegiatanPage extends StatefulWidget {
  const MPTMahasiswaKegiatanPerJenisKegiatanPage({super.key});

  @override
  State<MPTMahasiswaKegiatanPerJenisKegiatanPage> createState() => _MPTMahasiswaKegiatanPerJenisKegiatanPageState();
}

class _MPTMahasiswaKegiatanPerJenisKegiatanPageState extends State<MPTMahasiswaKegiatanPerJenisKegiatanPage> {
  
  @override
  void initState() {
    context.read<KegiatanMptBloc>().add(const ReadAllKegiatanMptEvent());
    super.initState();
  }

  @override
  void dispose() {
    context.read<KegiatanMptBloc>().close();
    context.read<JenisKegiatanMptBloc>().close();
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
              const CustomMobileTitle(
                  text:
                      'Kemahasiswaan - MPT Mahasiswa - Kegiatan per Jenis Kegiatan'),
              const CustomFieldSpacer(),
              BlocBuilder<KegiatanMptBloc, KegiatanMptState>(
                builder: (context, state) {
                  if (state is KegiatanMptLoading) {
                    return const Text('Loading ...');
                  } else if (state is AllKegiatanMptHasData) {
                    final kegiatanMptList = state.kegiatanList;

                    return CustomContentBox(
                      children: [
                        buildTitle('Total Kegiatan per Jenis Kegiatan : 6'),
                        CustomAddButton(
                          buttonText: 'Tambah',
                          onPressed: () => Navigator.pushNamed(
                              context,
                              MPTMahasiswaKegiatanPerJenisKegiatanTambahPageRoute),
                        ),
                        const CustomFieldSpacer(),
                        buildTitle('Jenis'),

                        MipokaCustomDropdown(
                          items: listBentukKegiatan,
                          onValueChanged: (value) {
                            context.read<KegiatanMptBloc>().add(
                              ReadAllKegiatanMptEvent(filter: value!)
                            );
                          },
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
                                rows: List<DataRow>.generate(kegiatanMptList.length, (int index) {
                                  final kegiatanMpt = kegiatanMptList[index];

                                  context.read<JenisKegiatanMptBloc>().add(
                                    ReadJenisKegiatanMptEvent(idJenisKegiatanMpt: kegiatanMpt.idNamaKegiatanMpt)
                                  );

                                  return DataRow(
                                    cells: [
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
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            kegiatanMpt.namaKegiatanMpt,
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: [
                                            InkWell(
                                              onTap: () {},
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
                  } else if (state is KegiatanMptError) {
                    return Text(state.message);
                  } else {
                    return const Text("KegiatanMptBloc hasn't triggered yet.");
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
