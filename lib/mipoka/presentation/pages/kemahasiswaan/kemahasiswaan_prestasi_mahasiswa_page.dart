import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/domain/entities/prestasi.dart';
import 'package:mipoka/mipoka/presentation/bloc/ormawa_bloc/ormawa_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/prestasi_bloc/prestasi_bloc.dart';
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

class KemahasiswaanPrestasiMahasiswaPage extends StatefulWidget {
  const KemahasiswaanPrestasiMahasiswaPage({super.key});

  @override
  State<KemahasiswaanPrestasiMahasiswaPage> createState() => _KemahasiswaanPrestasiMahasiswaPageState();
}

class _KemahasiswaanPrestasiMahasiswaPageState extends State<KemahasiswaanPrestasiMahasiswaPage> {

  int? _idOrmawaController;
  String? _tahun;
  String? _tingkat;

  @override
  void initState() {
    _idOrmawaController = 0;
    _tahun = years2[0];
    _tingkat = listTingkat2[0];

    context.read<PrestasiBloc>().add(ReadAllPrestasiEvent());
    super.initState();
  }

  @override
  void dispose() {
    context.read<PrestasiBloc>().close();
    context.read<OrmawaBloc>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MipokaMobileAppBar(
        onRefresh: () {
          mipokaCustomToast(refreshMessage);
          context.read<PrestasiBloc>().add(ReadAllPrestasiEvent());
        },
      ),
      drawer: const CustomKemahasiswaanDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              const CustomMobileTitle(text: 'Kemahasiswaan - Prestasi Mahasiswa'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [

                  CustomAddButton(
                    buttonText: 'Tambah',
                    onPressed: () async {
                      final result = await Navigator.pushNamed(
                        context,
                        kemahasiswaanPrestasiMahasiswaTambahPageRoute,
                      );

                      if (result is Prestasi && context.mounted) {
                        context.read<PrestasiBloc>().add(CreatePrestasiEvent(prestasi: result));
                      }
                    }

                  ),

                  const CustomFieldSpacer(),
                  //
                  // buildTitle('Nama Ormawa'),
                  // BlocBuilder<OrmawaBloc, OrmawaState>(
                  //   builder: (context, state) {
                  //     if (state is OrmawaLoading) {
                  //       return const Text("Loading ....");
                  //     } else if (state is AllOrmawaHasData) {
                  //
                  //       List<String> ormawaList = state.ormawaList.map(
                  //               (ormawa) => ormawa.namaOrmawa).toList();
                  //       ormawaList.insert(0, "Semua");
                  //
                  //       List<int> idOrmawaList = state.ormawaList.map(
                  //               (ormawa) => ormawa.idOrmawa).toList();
                  //       idOrmawaList.insert(0, 0);
                  //
                  //       return MipokaCustomDropdown(
                  //           items: ormawaList,
                  //           onValueChanged: (value) {
                  //             int index = ormawaList.indexOf(value!);
                  //             int idOrmawa = idOrmawaList[index];
                  //
                  //             _idOrmawaController = idOrmawa;
                  //           }
                  //       );
                  //     } else if (state is OrmawaError) {
                  //       return Text(state.message);
                  //     } else {
                  //       print("OrmawaBloc hasn't been triggered yet.");
                  //       return const SizedBox();
                  //
                  //     }
                  //   },
                  // ),
                  //
                  // const CustomFieldSpacer(),
                  //
                  // buildTitle('Tahun'),
                  // MipokaCustomDropdown(
                  //   items: years2,
                  //   onValueChanged: (value) => _tahun = value,
                  // ),
                  //
                  // const CustomFieldSpacer(),
                  //
                  // buildTitle('Tingkat'),
                  // MipokaCustomDropdown(
                  //   items: listTingkat2,
                  //   onValueChanged: (value) => _tingkat = value,
                  // ),
                  //
                  // const CustomFieldSpacer(),
                  //
                  // CustomFilterButton(
                  //   text: 'Filter',
                  //   onPressed: () => context.read<PrestasiBloc>().add(ReadAllPrestasiEvent()),
                  // ),
                  //
                  // const CustomFieldSpacer(),

                  BlocConsumer<PrestasiBloc, PrestasiState>(
                    listenWhen: (prev, current) =>
                    prev.runtimeType != current.runtimeType,
                    listener: (context, state) async {

                      if (state is PrestasiSuccess) {
                        context.read<PrestasiBloc>().add(ReadAllPrestasiEvent());

                      } else if (state is PrestasiError) {
                        mipokaCustomToast(state.message);
                      }
                    },

                    builder: (context, state) {
                      if (state is PrestasiLoading) {
                        return const Text('Loading');
                      } else if (state is AllPrestasiHasData) {
                        final prestasiList = state.prestasiList;

                        context.read<OrmawaBloc>().add(ReadAllOrmawaEvent());

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                    DataColumn(
                                      label: Text(
                                        'Aksi',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],

                                  rows: List<DataRow>.generate(prestasiList.length, (int index) {
                                    final prestasi = prestasiList[index];

                                    return DataRow(
                                      cells: [
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text('${index + 1}',),
                                          ),
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(prestasi.mipokaUser.nim),
                                          ),
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(prestasi.mipokaUser.namaLengkap),
                                          ),
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(prestasi.namaKegiatan),
                                          ),
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(prestasi.waktuPenyelenggaraan,),
                                          ),
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(prestasi.tingkat,),
                                          ),
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(prestasi.prestasiDicapai),
                                          ),
                                        ),
                                        DataCell(
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  final result = await Navigator.pushNamed(
                                                    context,
                                                    kemahasiswaanPrestasiMahasiswaEditPageRoute,
                                                    arguments: prestasi,
                                                  );
                                                  
                                                  if (result is Prestasi && context.mounted) {
                                                    context.read<PrestasiBloc>().add(UpdatePrestasiEvent(prestasi: result));
                                                  }
                                                  
                                                },
                                                child: Image.asset(
                                                  'assets/icons/edit.png',
                                                  width: 24,
                                                ),
                                              ),

                                              const SizedBox(width: 8.0,),

                                              InkWell(
                                                onTap: () {
                                                  context.read<PrestasiBloc>().add(
                                                      DeletePrestasiEvent(idPrestasi: prestasi.idPrestasi));
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

                      } else if (state is PrestasiError) {
                        return Text(state.message);
                      } else {
                        if (kDebugMode) {
                          print("Prestasi BLoC hasn't been triggered yet.");
                        }
                        return const SizedBox();
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
