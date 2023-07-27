import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/format_date_indonesia.dart';
import 'package:mipoka/mipoka/data/models/berita_model.dart';
import 'package:mipoka/mipoka/domain/entities/berita.dart';
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
import 'package:mipoka/mipoka/presentation/widgets/open_file_picker_method.dart';

class KemahasiswaanBerandaPage extends StatefulWidget {
  const KemahasiswaanBerandaPage({super.key});

  @override
  State<KemahasiswaanBerandaPage> createState() =>
      _KemahasiswaanBerandaPageState();
}

class _KemahasiswaanBerandaPageState extends State<KemahasiswaanBerandaPage> {
  @override
  void initState() {
    _filter = _filter ?? "";
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
      body: SingleChildScrollView(
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
                    onPressed: () async {
                      final result = await Navigator.pushNamed(
                        context,
                        kemahasiswaanBerandaTambahBeritaPageRoute,
                      );

                      if (result != null && result is Berita && context.mounted) {
                        context.read<BeritaBloc>().add(
                          CreateBeritaEvent(berita: result),
                        );
                      }
                    }
                  ),

                  const CustomFieldSpacer(),

                  BlocConsumer<BeritaBloc, BeritaState>(
                    listenWhen: (prev, current) =>
                    prev.runtimeType != current.runtimeType,
                    listener: (context, state) {
                      if (state is BeritaSuccess) {
                        context.read<BeritaBloc>().add(ReadAllBeritaEvent(filter: _filter ?? ""));

                      } else if (state is BeritaError) {
                        mipokaCustomToast(state.message);
                      }
                    },

                    builder: (context, state) {
                      if (state is BeritaLoading) {
                        return const Text('Loading');
                      } else if (state is AllBeritaHasData) {
                        final beritaList = state.allBerita;

                        List<String> penulisList = beritaList.map((berita) => berita.penulis).toSet().toList();
                        penulisList.insert(0, "Semua");

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildTitle('Penulis'),

                            MipokaCustomDropdown(
                              initialItem: _filter,
                              items: penulisList,
                              onValueChanged: (value) {
                                _filter = value;
                                context.read<BeritaBloc>().add(
                                    ReadAllBeritaEvent(filter: _filter ?? "")
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
                                              formatDateIndonesia(berita.tglTerbit),
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
                                                onTap: () async {
                                                  final result = await Navigator.pushNamed(
                                                    context,
                                                    kemahasiswaanBerandaUpdateBeritaPageRoute,
                                                    arguments: berita,
                                                  );

                                                  if (result != null && result is Berita && context.mounted) {
                                                    context.read<BeritaBloc>().add(
                                                      UpdateBeritaEvent(berita: result),
                                                    );
                                                  }
                                                },

                                                //     .then((_) {
                                                //   context.read<BeritaBloc>().add(
                                                //       ReadAllBeritaEvent(filter: _filter ?? ""));
                                                //   if (_filter == berita.penulis) {
                                                //     _filter = "";
                                                //   }
                                                // }),
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
                                                  deleteFileFromFirebase(berita.gambar);
                                                  if (_filter == berita.penulis) {
                                                    _filter = "";
                                                  }
                                                  mipokaCustomToast("Berita berhasil dihapus.");
                                                },
                                                child: Image.asset(
                                                  'assets/icons/delete.png',
                                                  width: 24,
                                                ),
                                              ),

                                              // InkWell(
                                              //   onTap: () {
                                              //     context.read<BeritaBloc>().add(DeleteBeritaEvent(berita.idBerita));
                                              //     if (_filter == berita.penulis) {
                                              //       _filter = "";
                                              //     }
                                              //     Future.delayed(
                                              //       const Duration(milliseconds: 500), () =>
                                              //         context.read<BeritaBloc>().add(ReadAllBeritaEvent(filter: _filter ?? "")),
                                              //     );
                                              //   },
                                              //   child: Image.asset(
                                              //     'assets/icons/delete.png',
                                              //     width: 24,
                                              //   ),
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
                        );
                      }
                      else if (state is BeritaError) {
                        return Text(state.message);
                      } else {
                        if (kDebugMode) {
                          print("Berita Bloc hasn't been triggered yet");
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
