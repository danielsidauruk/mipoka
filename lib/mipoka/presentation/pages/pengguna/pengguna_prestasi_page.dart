import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/bloc/mipoka_user_bloc/mipoka_user_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/ormawa_bloc/ormawa_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/prestasi_bloc/prestasi_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_total_count.dart';

class PenggunaPrestasiPage extends StatefulWidget {
  const PenggunaPrestasiPage({super.key});

  @override
  State<PenggunaPrestasiPage> createState() => _PenggunaPrestasiPageState();
}

class _PenggunaPrestasiPageState extends State<PenggunaPrestasiPage> {

  int? _idOrmawa;
  String? _tahun;
  String? _tingkat;

  @override
  void initState() {
    _idOrmawa = 0;
    _tahun = "semua";
    _tingkat = "semua";

    context.read<PrestasiBloc>().add(ReadAllPrestasiEvent());
    context.read<OrmawaBloc>().add(ReadAllOrmawaEvent());
    super.initState();
  }

  @override
  void dispose() {
    context.read<PrestasiBloc>().close();
    context.read<MipokaUserBloc>().close();
    context.read<OrmawaBloc>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MipokaMobileAppBar(),

      drawer: const MobileCustomPenggunaDrawerWidget(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              CustomContentBox(
                children: [

                  buildTitle('Nama Ormawa'),
                  BlocBuilder<OrmawaBloc, OrmawaState>(
                    builder: (context, state) {
                      if (state is OrmawaLoading) {
                        return const Text("Loading ....");
                      } else if (state is AllOrmawaHasData) {

                        List<String> ormawaList = state.ormawaList.map(
                                (ormawa) => ormawa.namaOrmawa).toList();
                        ormawaList.insert(0, "Semua");

                        List<int> idOrmawaList = state.ormawaList.map(
                                (ormawa) => ormawa.idOrmawa).toList();
                        idOrmawaList.insert(0, 0);

                        return MipokaCustomDropdown(
                            items: ormawaList,
                            onValueChanged: (value) {
                              int index = ormawaList.indexOf(value!);
                              int idOrmawa = idOrmawaList[index];

                              _idOrmawa = idOrmawa;
                            }
                        );
                      } else if (state is OrmawaError) {
                        return Text(state.message);
                      } else {
                        return const Text("OrmawaBloc hasn't been triggered yet.");
                      }
                    },
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Tahun'),
                  MipokaCustomDropdown(
                    items: years2,
                    onValueChanged: (value) {
                      _tahun = value ?? _tahun;
                    },
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Tingkat'),
                  MipokaCustomDropdown(
                    items: listTingkat2,
                    onValueChanged: (value) {
                      _tingkat = value ?? _tingkat;
                    },
                  ),

                  const CustomFieldSpacer(),

                  InkWell(
                    onTap: () {
                      if (kDebugMode) {
                        print("$_idOrmawa/$_tahun/$_tingkat");
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

                  BlocBuilder<PrestasiBloc, PrestasiState>(
                    builder: (context, state) {
                      if (state is PrestasiLoading) {
                        return const Text('Loading');
                      } else if (state is AllPrestasiHasData) {
                        final prestasiList = state.prestasiList;

                        return Column(
                          children: [
                            MipokaCountText(total: prestasiList.length),

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
                          ],
                        );
                      } else if (state is PrestasiError) {
                        return Text(state.message);
                      } else {
                        return const Text('IDK');
                      }
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}