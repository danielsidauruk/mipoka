import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/mipoka/domain/entities/ormawa.dart';
import 'package:mipoka/mipoka/presentation/bloc/ormawa_bloc/ormawa_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_add_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_total_count.dart';

class KemahasiswaanEditOrmawaPage extends StatefulWidget {
  const KemahasiswaanEditOrmawaPage({super.key});

  @override
  State<KemahasiswaanEditOrmawaPage> createState() =>
      _KemahasiswaanEditOrmawaPageState();
}

class _KemahasiswaanEditOrmawaPageState
    extends State<KemahasiswaanEditOrmawaPage> {
  
  @override
  void initState() {
    context.read<OrmawaBloc>().add(ReadAllOrmawaEvent());
    super.initState();
  }
  
  @override
  void dispose() {
    context.read<OrmawaBloc>().close();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MipokaMobileAppBar(
        onRefresh: () {
          mipokaCustomToast(refreshMessage);
          context.read<OrmawaBloc>().add(ReadAllOrmawaEvent());
        },
      ),

      drawer: const CustomKemahasiswaanDrawer(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomMobileTitle(
                  text: 'Kemahasiswaan - Edit Ormawa'),

              const CustomFieldSpacer(),

              CustomAddButton(
                buttonText: 'Tambah',
                onPressed: () async {
                  final result = await Navigator.pushNamed(
                    context,
                    kemahasiswaanEditOrmawaTambahPageRoute,
                  );

                  if (result is Ormawa && context.mounted) {
                    context.read<OrmawaBloc>().add(
                      UpdateOrmawaEvent(ormawa: result)
                    );
                    mipokaCustomToast("Ormawa telah ditambah.");
                  }
                  // then((_) => context.read<OrmawaBloc>().add(ReadAllOrmawaEvent()));
                },
              ),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [
                  BlocConsumer<OrmawaBloc, OrmawaState>(
                    listenWhen: (prev, current) =>
                    prev.runtimeType != current.runtimeType,
                    listener: (context, state) {
                      if (state is DeleteOrmawaSuccess) {

                        context.read<OrmawaBloc>().add(ReadAllOrmawaEvent());

                      } else if (state is UpdateOrmawaSuccess) {

                        context.read<OrmawaBloc>().add(ReadAllOrmawaEvent());

                      } else if (state is OrmawaError) {
                        mipokaCustomToast("Ormawa : ${state.message}");
                      }
                    },
                    builder: (context, state) {
                      if (state is OrmawaLoading) {
                        return const Text("Loading ....");
                      } else if (state is AllOrmawaHasData) {
                        final ormawaList = state.ormawaList;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MipokaCountText(total: ormawaList.length),

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
                                        'Nama Ormawa',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Pembina',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Ketua Ormawa',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Jumlah Anggota',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Status',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                  rows: List<DataRow>.generate(ormawaList.length, (int index) {
                                    final ormawa = ormawaList[index];

                                    return DataRow(
                                      cells: [
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              ormawa.namaOrmawa,
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              ormawa.pembina,
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              ormawa.ketua,
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "${ormawa.listAnggota.length}",
                                            ),
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
                                                    kemahasiswaanEditOrmawaEditPageRoute,
                                                    arguments: ormawa,
                                                  );

                                                  if (result is Ormawa && context.mounted) {
                                                    context.read<OrmawaBloc>().add(
                                                        UpdateOrmawaEvent(ormawa: result));
                                                    mipokaCustomToast("Ormawa telah diupdate.");
                                                  }
                                                },
                                                    // .then((_) => context.read<OrmawaBloc>().add(ReadAllOrmawaEvent())),
                                                child: Image.asset(
                                                  'assets/icons/edit.png',
                                                  width: 24,
                                                ),
                                              ),

                                              const SizedBox(width: 8.0,),

                                              InkWell(
                                                onTap: () {
                                                  context.read<OrmawaBloc>().add(DeleteOrmawaEvent(idOrmawa: ormawa.idOrmawa));
                                                  mipokaCustomToast("${ormawa.namaOrmawa} telah dihapus.");
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
                      } else if (state is OrmawaError) {
                        return Text(state.message);
                      } else {
                        print("OrmawaBloc hasn't been triggered yet.");
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
