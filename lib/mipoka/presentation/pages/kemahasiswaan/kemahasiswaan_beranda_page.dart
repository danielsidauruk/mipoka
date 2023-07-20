import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/bloc/berita_bloc/berita_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_add_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_total_count.dart';

class KemahasiswaanBerandaPage extends StatefulWidget {
  const KemahasiswaanBerandaPage({super.key});

  @override
  State<KemahasiswaanBerandaPage> createState() =>
      _KemahasiswaanBerandaPageState();
}

class _KemahasiswaanBerandaPageState extends State<KemahasiswaanBerandaPage> {
  @override
  void initState() {
    _filter = _filter!.isEmpty ? "" : _filter;
    context.read<BeritaBloc>().add(const ReadAllBeritaEvent());
    super.initState();
  }

  @override
  void dispose() {
    context.read<BeritaBloc>().close();
    super.dispose();
  }

  String? _filter;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const MipokaMobileAppBar(),
      drawer: const MobileCustomKemahasiswaanDrawer(),
      body: BlocBuilder<BeritaBloc, BeritaState>(
        builder: (context, state) {
          if (state is BeritaLoading) {
            return const Text('Loading');
          } else if (state is AllBeritaHasData) {
            final beritaList = state.allBerita;

            List<String> penulisList = beritaList.map((berita) => berita.penulis).toSet().toList();
            penulisList.insert(0, "Semua");

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const CustomMobileTitle(
                        text: 'Kemahasiswaan - Edit Beranda'),
                    const CustomFieldSpacer(),

                    CustomContentBox(
                      children: [
                        CustomAddButton(
                          buttonText: 'Tambah',
                          onPressed: () => Navigator.pushNamed(
                            context,
                            kemahasiswaanBerandaTambahBeritaPageRoute,
                          ).then((_) => context.read<BeritaBloc>().add(const ReadAllBeritaEvent())),
                        ),

                        const CustomFieldSpacer(),

                        buildTitle('Penulis'),
                        MipokaCustomDropdown(
                          initialItem: _filter,
                          items: penulisList,
                          onValueChanged: (value) {
                            _filter = value;
                            context.read<BeritaBloc>().add(
                                ReadAllBeritaEvent(filter: _filter!)
                            );
                          },
                        ),

                        const CustomFieldSpacer(),

                        MipokaCountText(total: beritaList.length),

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
                                    'Tanggal Diterbitkan',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Judul Berita',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Penulis',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Aksi',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                              rows: List<DataRow>.generate(
                                  beritaList.length, (int index) {
                                final berita = beritaList[index];

                                return DataRow(
                                  cells: [
                                    DataCell(
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          berita.tglTerbit,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      onTap: () => Navigator.pushNamed(
                                        context,
                                        penggunaBerandaDetailPageRoute,
                                        arguments: berita,
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          berita.judul,
                                          style: const TextStyle(color: Colors.blue),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          berita.penulis,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          InkWell(
                                            onTap: () => Navigator.pushNamed(
                                              context,
                                              kemahasiswaanBerandaUpdateBeritaPageRoute,
                                              arguments: berita,
                                            ).then((_) => context.read<BeritaBloc>().add(
                                                ReadAllBeritaEvent(filter: _filter!))),
                                            child: Image.asset(
                                              'assets/icons/edit.png',
                                              width: 24,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 8.0,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Future.microtask(() {
                                                context.read<BeritaBloc>().add(DeleteBeritaEvent(berita.idBerita),);
                                                context.read<BeritaBloc>().add(ReadAllBeritaEvent(filter: _filter!)
                                                );
                                                mipokaCustomToast("Berita telah dihapus");
                                              });
                                            },
                                            child: Image.asset(
                                              'assets/icons/delete.png',
                                              width: 24,
                                            ),
                                          )
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
                    ),
                  ],
                ),
              ),
            );
          } else if (state is BeritaError) {
            return Text(state.message);
          } else {
            return const Text('IDK');
          }
        },
      ),
    );
  }

  Scaffold buildWeb(context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const MipokaMobileAppBar(),
      drawer: const MobileCustomKemahasiswaanDrawer(),
      body: BlocBuilder<BeritaBloc, BeritaState>(
        builder: (context, state) {
          if (state is BeritaLoading) {
            return const Text('Loading');
          } else if (state is AllBeritaHasData) {
            final beritaList = state.allBerita;

            List<String> penulisList = beritaList.map((berita) => berita.penulis).toSet().toList();
            penulisList.insert(0, "Semua");

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const CustomMobileTitle(
                        text: 'Kemahasiswaan - Edit Beranda'),
                    const CustomFieldSpacer(),
                    SizedBox(
                      width: size.width,
                      child: CustomContentBox(
                        children: [
                          Row(
                            children: [
                              WebCustomAddButton(
                                buttonText: 'Tambah',
                                onPressed: () => Navigator.pushNamed(context,
                                    kemahasiswaanBerandaTambahBeritaPageRoute),
                              ),
                            ],
                          ),
                          const CustomFieldSpacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              buildTitle('Penulis'),

                              const SizedBox(width: 8.0),

                              MipokaCustomDropdown(
                                items: penulisList,
                                onValueChanged: (value) {
                                  _filter = value;
                                  context.read<BeritaBloc>().add(
                                      ReadAllBeritaEvent(filter: _filter!)
                                  );
                                },
                              ),
                            ],
                          ),

                          const CustomFieldSpacer(),

                          MipokaCountText(total: beritaList.length),

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
                                      'Tanggal Diterbitkan',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Judul Berita',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Penulis',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Aksi',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                                rows: List<DataRow>.generate(
                                    beritaList.length, (int index) {
                                  final berita = beritaList[index];

                                  return DataRow(
                                    cells: [
                                      DataCell(
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            berita.tglTerbit,
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        onTap: () => Navigator.pushNamed(
                                          context,
                                          penggunaBerandaDetailPageRoute,
                                          arguments: berita,
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            berita.judul,
                                            style: const TextStyle(color: Colors.blue),
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            berita.penulis,
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: [
                                            InkWell(
                                              onTap: () => Navigator.pushNamed(
                                                context,
                                                kemahasiswaanBerandaUpdateBeritaPageRoute,
                                                arguments: berita,
                                              ).then((_) => context.read<BeritaBloc>().add(ReadAllBeritaEvent(filter: _filter!))),
                                              // onTap:() =>
                                              child: Image.asset(
                                                'assets/icons/edit.png',
                                                width: 24,
                                              ),
                                            ),

                                            const SizedBox(
                                              width: 8.0,
                                            ),

                                            InkWell(
                                              onTap: () {
                                                context.read<BeritaBloc>().add(DeleteBeritaEvent(berita.idBerita));
                                                mipokaCustomToast("Berita telah dihapus");
                                              },
                                              child: Image.asset(
                                                'assets/icons/delete.png',
                                                width: 24,
                                              ),
                                            ),

                                            // BlocListener<BeritaBloc, BeritaState>(
                                            //   listenWhen: (prev, current) =>
                                            //   prev.runtimeType != current.runtimeType,
                                            //   listener: (context, state) {
                                            //     if (state is BeritaSuccessMessage) {
                                            //
                                            //     }
                                            //   },
                                            //   child: const SizedBox(),
                                            // ),
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
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is BeritaError) {
            return Text(state.message);
          } else {
            if (kDebugMode) {
              print("Berita hasn't been triggered yet.");
            }
            return const Center();
          }
        },
      ),
    );
  }
}
