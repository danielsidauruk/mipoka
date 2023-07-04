import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/bloc/mipoka_user_bloc/mipoka_user_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/prestasi_bloc/prestasi_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_total_count.dart';

class PenggunaPrestasiPage extends StatefulWidget {
  const PenggunaPrestasiPage({super.key});

  @override
  State<PenggunaPrestasiPage> createState() => _PenggunaPrestasiPageState();
}

class _PenggunaPrestasiPageState extends State<PenggunaPrestasiPage> {
  @override
  void initState() {
    context.read<PrestasiBloc>().add(ReadAllPrestasiEvent());
    super.initState();
  }

  @override
  void dispose() {
    context.read<PrestasiBloc>().close();
    context.read<MipokaUserBloc>().close();
    super.dispose();
  }

  String ormawa = "semua";
  String tahun = "semua";
  String tingkat = "semua";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const MipokaMobileAppBar(),

      drawer: const MobileCustomPenggunaDrawerWidget(),

      body: BlocBuilder<PrestasiBloc, PrestasiState>(
        builder: (context, state) {
          if (state is PrestasiLoading) {
            return const Text('Loading');
          } else if (state is AllPrestasiHasData) {
            final prestasiList = state.prestasiList;

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  Expanded(
                    child: CustomContentBox(
                      children: [

                        buildTitle('Nama Ormawa'),
                        MipokaCustomDropdown(
                          items: listNamaOrmawa2,
                          onValueChanged: (value) {
                            ormawa = value ?? ormawa;
                          },
                        ),

                        const CustomFieldSpacer(),

                        buildTitle('Tahun'),
                        MipokaCustomDropdown(
                          items: years2,
                          onValueChanged: (value) {
                            tahun = value ?? tahun;
                          },
                        ),

                        const CustomFieldSpacer(),

                        buildTitle('Tingkat'),
                        MipokaCustomDropdown(
                          items: listTingkat2,
                          onValueChanged: (value) {
                            tingkat = value ?? tingkat;
                          },
                        ),

                        const CustomFieldSpacer(),

                        InkWell(
                          onTap: () {
                            if (kDebugMode) {
                              print("$ormawa/$tahun/$tingkat");
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            constraints: const BoxConstraints(minHeight: 35.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: const Text(
                              'Saring',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),

                        const CustomFieldSpacer(),

                        MipokaCountText(total: prestasiList.length),

                        const CustomFieldSpacer(),

                        Expanded(
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
                                      'No.',
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
                                      'Nama Mahasiswa',
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
                                      'Waktu Penyelenggaraan',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Tingkat',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Prestasi yang Dicapai',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],

                                rows: List<DataRow>.generate(prestasiList.length, (int index) {
                                  final prestasi = prestasiList[index];

                                  context.read<MipokaUserBloc>().add(
                                    ReadMipokaUserEvent(idMipokaUser: prestasi.idUser),
                                  );

                                  return DataRow(
                                    cells: [
                                      DataCell(
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '${index + 1}',
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        BlocBuilder<MipokaUserBloc, MipokaUserState>(
                                          builder: (context, state) {
                                            if (state is MipokaUserLoading) {
                                              return const Text('Loading ...');
                                            } else if (state is MipokaUserHasData) {
                                              return Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  state.mipokaUser.nim,
                                                ),
                                              );
                                            } else if (state is MipokaUserError) {
                                              return Text(state.message);
                                            } else {
                                              return const Text("MipokaUserBloc hasn't been triggered");
                                            }
                                          },
                                        ),
                                      ),
                                      DataCell(
                                        BlocBuilder<MipokaUserBloc, MipokaUserState>(
                                          builder: (context, state) {
                                            if (state is MipokaUserLoading) {
                                              return const Text('Loading ...');
                                            } else if (state is MipokaUserHasData) {
                                              return Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  state.mipokaUser.namaLengkap,
                                                ),
                                              );
                                            } else if (state is MipokaUserError) {
                                              return Text(state.message);
                                            } else {
                                              return const Text("MipokaUserBloc hasn't been triggered");
                                            }
                                          },
                                        ),
                                      ),
                                      DataCell(
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            prestasi.namaKegiatan
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            prestasi.waktuPenyelenggaraan,
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            prestasi.tingkat,
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            prestasi.prestasiDicapai,
                                          ),
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
                    ),
                  ),
                ],
              ),
            );
          } else if (state is PrestasiError) {
            return Text(state.message);
          } else {
            return const Text('IDK');
          }
        },
      ),
    );
  }
}