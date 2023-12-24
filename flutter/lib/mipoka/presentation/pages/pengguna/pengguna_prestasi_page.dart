import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/bloc/mipoka_user_bloc/mipoka_user_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/ormawa_bloc/ormawa_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/prestasi_bloc/prestasi_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
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
      appBar: MipokaMobileAppBar(
        onRefresh: () {
          mipokaCustomToast(refreshMessage);
          context.read<PrestasiBloc>().add(ReadAllPrestasiEvent());
          context.read<OrmawaBloc>().add(ReadAllOrmawaEvent());
        },
      ),

      drawer: const MobileCustomPenggunaDrawerWidget(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              const CustomMobileTitle(text: 'Prestasi'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [

                  BlocBuilder<PrestasiBloc, PrestasiState>(
                    builder: (context, state) {
                      if (state is PrestasiLoading) {
                        return const Text('Loading');
                      } else if (state is AllPrestasiHasData) {
                        final prestasiList = state.prestasiList;

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
                                  ],

                                  rows: List<DataRow>.generate(prestasiList.length, (int index) {
                                    final prestasi = prestasiList[index];

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
                                            Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                prestasi.mipokaUser.nim,
                                              ),
                                            )
                                        ),
                                        DataCell(
                                            Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                prestasi.mipokaUser.namaLengkap,
                                              ),
                                            )
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
                        if (kDebugMode) {
                          print ("Prestasi Bloc hasn't been triggered yet.");
                        }
                        return const Center();
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