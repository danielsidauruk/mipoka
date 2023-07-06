import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/bloc/mipoka_user_bloc/mipoka_user_bloc.dart';
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

  int? idOrmawaController;
  String? tahun;
  String? tingkat;

  @override
  void initState() {
    idOrmawaController = 0;
    tahun = years2[0];
    tingkat = listTingkat2[0];

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
      appBar: const MipokaMobileAppBar(),
      drawer: const MobileCustomKemahasiswaanDrawer(),
      body: BlocBuilder<PrestasiBloc, PrestasiState>(
        builder: (context, state) {
          if (state is PrestasiLoading) {
            return const Text('Loading');
          } else if (state is AllPrestasiHasData) {
            final prestasiList = state.prestasiList;

            context.read<OrmawaBloc>().add(ReadAllOrmawaEvent());

            return SingleChildScrollView(
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
                          onPressed: () => Navigator.pushNamed(
                            context,
                            kemahasiswaanPrestasiMahasiswaTambahPageRoute,
                          ),
                        ),

                        const CustomFieldSpacer(),

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

                                    // print("$idPeriodeMpt, $value");

                                    idOrmawaController = idOrmawa;
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

                          },
                        ),

                        const CustomFieldSpacer(),

                        buildTitle('Tingkat'),
                        MipokaCustomDropdown(
                          items: listTingkat2,
                          onValueChanged: (value) {},
                        ),

                        const CustomFieldSpacer(),

                        CustomFilterButton(
                          text: 'Filter',
                          onPressed: () {},
                        ),

                        const CustomFieldSpacer(),

                        MipokaCountText(total: prestasiList.length),

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

                                  context.read<MipokaUserBloc>().add(
                                    ReadMipokaUserEvent(idMipokaUser: prestasi.idUser));

                                  return DataRow(
                                    cells: [
                                      DataCell(
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text('${index + 1}',),
                                        ),
                                      ),
                                      DataCell(
                                        BlocBuilder<MipokaUserBloc, MipokaUserState>(
                                          builder: (context, state) {
                                            if (state is MipokaUserLoading) {
                                              return const Text("Loading ....");
                                            } else if (state is MipokaUserHasData) {
                                              return Align(
                                                alignment: Alignment.center,
                                                child: Text(state.mipokaUser.nim),
                                              );
                                            } else if (state is MipokaUserError) {
                                              return Text(state.message);
                                            } else {
                                              return const Text("MipokaUserBloc hasn't been triggered yet.");
                                            }
                                          },
                                        ),
                                      ),
                                      DataCell(
                                        BlocBuilder<MipokaUserBloc, MipokaUserState>(
                                          builder: (context, state) {
                                            if (state is MipokaUserLoading) {
                                              return const Text("Loading ....");
                                            } else if (state is MipokaUserHasData) {
                                              return Align(
                                                alignment: Alignment.center,
                                                child: Text(state.mipokaUser.namaLengkap),
                                              );
                                            } else if (state is MipokaUserError) {
                                              return Text(state.message);
                                            } else {
                                              return const Text("MipokaUserBloc hasn't been triggered yet.");
                                            }
                                          },
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
                                              onTap: () => Navigator.pushNamed(
                                                context,
                                                kemahasiswaanPrestasiMahasiswaEditPageRoute,
                                                arguments: prestasi,
                                              ),
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
                                                context.read<PrestasiBloc>().add(ReadAllPrestasiEvent());

                                                mipokaCustomToast("Prestasi telah dihapus");
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
                        ),
                      ],
                    ),
                  ],
                ),
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
