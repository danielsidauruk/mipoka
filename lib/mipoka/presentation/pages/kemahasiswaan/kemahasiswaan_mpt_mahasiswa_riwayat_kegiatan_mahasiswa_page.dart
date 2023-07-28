import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/bloc/jenis_kegiatan_mpt/jenis_kegiatan_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/nama_kegaitan_mpt_bloc/nama_kegiatan_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/periode_mpt_bloc/periode_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/riwayat_kegiatan_mpt_bloc/riwayat_kegiatan_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_add_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_filter_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_total_count.dart';

class KemahasiswaanMPTMahasiswaRiwayatKegiatanMahasiswaPage extends StatefulWidget {
  const KemahasiswaanMPTMahasiswaRiwayatKegiatanMahasiswaPage({super.key});

  @override
  State<KemahasiswaanMPTMahasiswaRiwayatKegiatanMahasiswaPage> createState() => _KemahasiswaanMPTMahasiswaRiwayatKegiatanMahasiswaPageState();
}

class _KemahasiswaanMPTMahasiswaRiwayatKegiatanMahasiswaPageState extends State<KemahasiswaanMPTMahasiswaRiwayatKegiatanMahasiswaPage> {

  final StreamController<bool?> _jenisKegiatanStream = StreamController<bool?>.broadcast();

  final TextEditingController _nimController = TextEditingController();

  bool? _isCheckedJenisKegiatan;
  int? _idPeriodeKegiatanMpt;
  int? _idJenisKegiatan;
  int? _idNamaKegiatan;
  String? _status;

  @override
  void initState() {
    _idPeriodeKegiatanMpt ??= 0;
    _idJenisKegiatan ??= 0;
    _idNamaKegiatan ??= 0;
    _status ??= listStatus[0];
    _nimController.text = _nimController.text == "" ? "" : _nimController.text;

    _isCheckedJenisKegiatan ??= false;

    Future.microtask(() {
      context.read<RiwayatKegiatanMptBloc>().add(const ReadAllRiwayatKegiatanMptEvent());
      context.read<PeriodeMptBloc>().add(ReadAllPeriodeMptEvent());
      context.read<JenisKegiatanMptBloc>().add(const ReadAllJenisKegiatanMptEvent());
      context.read<NamaKegiatanMptBloc>().add(const ReadAllNamaKegiatanMptEvent());
    });
    super.initState();
  }

  @override
  void dispose() {
    context.read<RiwayatKegiatanMptBloc>().close();
    context.read<PeriodeMptBloc>().close();
    context.read<JenisKegiatanMptBloc>().close();
    context.read<NamaKegiatanMptBloc>().close();
    _jenisKegiatanStream.close();
    super.dispose();
  }

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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              const CustomMobileTitle(text: 'Kemahasiswaan - MPT Mahasiswa - Riwayat Kegiatan Mahasiswa'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomAddButton(
                        buttonText: 'Tambah',
                        onPressed: () async {
                          final result = await Navigator.pushNamed(
                            context,
                            kemahasiswaanMPTMahasiswaRiwayatKegiatanMahasiswaTambahPageRoute,
                          );

                          if (result == true && context.mounted) {
                            context.read<RiwayatKegiatanMptBloc>().add(const ReadAllRiwayatKegiatanMptEvent());
                          }
                        }
                      ),

                      const CustomFieldSpacer(),

                      buildTitle('Periode Kegiatan'),
                      BlocBuilder<PeriodeMptBloc, PeriodeMptState>(
                        builder: (context, state) {
                          if (state is PeriodeMptLoading) {
                            return const Text("Loading ....");
                          } else if (state is AllPeriodeMptHasData) {

                            List<String> tahunPeriodeMptList = state.periodeMptList.map(
                                    (periodeMptList) => periodeMptList.periodeMengulangMpt == true ?
                                "${periodeMptList.tahunPeriodeMpt} (ulang)" :
                                periodeMptList.tahunPeriodeMpt).toList();
                            tahunPeriodeMptList.insert(0, "Semua");

                            List<int> idTahunPeriodeList = state.periodeMptList.map(
                                    (periodeMptList) => periodeMptList.idPeriodeMpt).toList();
                            idTahunPeriodeList.insert(0, 0);

                            return MipokaCustomDropdown(
                                items: tahunPeriodeMptList,
                                onValueChanged: (value) {
                                  int index = tahunPeriodeMptList.indexOf(value!);
                                  int idPeriodeMpt = idTahunPeriodeList[index];

                                  _idPeriodeKegiatanMpt = idPeriodeMpt;
                                }
                            );
                          } else if (state is PeriodeMptError) {
                            return Text(state.message);
                          } else {
                            return const Text("PeriodeMptBloc hasn't been triggered yet.");
                          }
                        },
                      ),

                      const CustomFieldSpacer(),

                      buildTitle('Jenis Kegiatan'),
                      BlocBuilder<JenisKegiatanMptBloc, JenisKegiatanMptState>(
                        builder: (context, state) {
                          if (state is JenisKegiatanMptLoading) {
                            return const Text("Loading ...");
                          } else if (state is AllJenisKegiatanMptHasData) {

                            List<String> jenisKegiatanList = state.jenisKegiatanMptList.map(
                                    (jenisKegiatanList) => jenisKegiatanList.namaJenisKegiatanMpt).toList();
                            jenisKegiatanList.insert(0, "Semua");

                            List<int> idJenisKegiatanList = state.jenisKegiatanMptList.map(
                                    (jenisKegiatanMptList) => jenisKegiatanMptList.idJenisKegiatanMpt).toList();
                            idJenisKegiatanList.insert(0, 0);

                            return MipokaCustomDropdown(
                              items: jenisKegiatanList,
                              onValueChanged: (value) {
                                int index = jenisKegiatanList.indexOf(value ?? "");
                                _idJenisKegiatan = idJenisKegiatanList[index];
                              },
                            );

                          } else if (state is JenisKegiatanMptError) {
                            return Text(state.message);
                          } else {
                            return const Text("NamaKegiatanBloc hasn't been triggered yet.");
                          }
                        },
                      ),

                      const CustomFieldSpacer(),

                      buildTitle('Nama Kegiatan'),
                      BlocBuilder<NamaKegiatanMptBloc, NamaKegiatanMptState>(
                        builder: (context, state) {
                          if (state is NamaKegiatanMptLoading) {
                            return const Text("Loading ...");
                          } else if (state is AllNamaKegiatanMptHasData) {
                            List<String> namaKegiatanList = state.namaKegiatanMptList.map(
                                    (namaKegiatanList) => namaKegiatanList.namaKegiatan).toList();
                            namaKegiatanList.insert(0, "Semua");

                            List<int> idKegiatanList = state.namaKegiatanMptList.map(
                                    (namaKegiatanMptList) => namaKegiatanMptList.idNamaKegiatanMpt).toList();
                            idKegiatanList.insert(0, 0);

                            _idNamaKegiatan = idKegiatanList[0];

                            return MipokaCustomDropdown(
                              items: namaKegiatanList,
                              onValueChanged: (value) {
                                int index = namaKegiatanList.indexOf(value ?? "");
                                _idNamaKegiatan = idKegiatanList[index];

                              },
                            );
                          } else if (state is NamaKegiatanMptError) {
                            return Text(state.message);
                          } else {
                            return const Text("NamaKegiatanBloc hasn't been triggered yet.");
                          }
                        },
                      ),

                      const CustomFieldSpacer(),

                      buildTitle('Status'),
                      MipokaCustomDropdown(
                        items: listStatus,
                        onValueChanged: (value) => _status = value,
                      ),
                    ],
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('NIM'),
                  CustomTextField(
                    textFieldWidth: 300,
                    controller: _nimController,
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Kelompok Berdasarkan'),
                  Row(
                    children: [
                      StreamBuilder<bool?>(
                        initialData: false,
                        stream: _jenisKegiatanStream.stream,
                        builder: (context, snapshot) {
                          bool isChecked = snapshot.data ?? false;
                          return Checkbox(
                            checkColor: Colors.black,
                            value: isChecked,
                            onChanged: (value) {
                              _jenisKegiatanStream.add(value);
                              _isCheckedJenisKegiatan = value;
                            },
                          );
                        },
                      ),

                      const Text('Jenis Kegiatan'),
                    ],
                  ),

                  CustomFilterButton(
                    text: 'Filter',
                    onPressed: () => context.read<RiwayatKegiatanMptBloc>().add(
                      ReadAllRiwayatKegiatanMptEvent(filter: "$_idPeriodeKegiatanMpt/$_idJenisKegiatan/$_idNamaKegiatan/$_status/${_nimController.text}/$_isCheckedJenisKegiatan")),
                  ),

                  const CustomFieldSpacer(),

                  BlocConsumer<RiwayatKegiatanMptBloc, RiwayatKegiatanMptState>(
                      // RiwayatKegiatanMptSuccess
                    listenWhen: (prev, current) =>
                    prev.runtimeType != current.runtimeType,
                    listener: (context, state) async {

                      if (state is RiwayatKegiatanMptSuccess) {
                        context.read<RiwayatKegiatanMptBloc>().add(const ReadAllRiwayatKegiatanMptEvent());

                      } else if (state is RiwayatKegiatanMptError) {
                        mipokaCustomToast(state.message);
                      }
                    },

                    builder: (context, state) {
                      if (state is RiwayatKegiatanMptLoading) {
                        return const Text("Loading ....");
                      } else if (state is AllRiwayatKegiatanMptHasData) {
                        final riwayatKegiatanMptList = state.riwayatKegiatanMptList;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MipokaCountText(total: riwayatKegiatanMptList.length),

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
                                        'NIM',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Nama',
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
                                        'Jenis Kegiatan',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Poin',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Unggahan',
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
                                    DataColumn(
                                      tooltip: 'Aksi yang akan dilakukan',
                                      label: Text(
                                        'Aksi',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],

                                  rows: List<DataRow>.generate(riwayatKegiatanMptList.length, (int index) {
                                    final riwayatKegiatanMpt = riwayatKegiatanMptList[index];

                                    return DataRow(
                                      cells: [
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              riwayatKegiatanMpt.mipokaUser.nim,
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              riwayatKegiatanMpt.mipokaUser.namaLengkap,
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              riwayatKegiatanMpt.kegiatanPerPeriodeMpt.namaKegiatanMpt.namaKegiatan,
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              riwayatKegiatanMpt.kegiatanPerPeriodeMpt.namaKegiatanMpt.jenisKegiatanMpt.namaJenisKegiatanMpt,
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "${riwayatKegiatanMpt.mipokaUser.pointMpt}",
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: Image.asset(
                                              'assets/icons/pdf.png',
                                              width: 24,
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Align(
                                            alignment: Alignment.center,
                                            child: riwayatKegiatanMpt.statusMpt == disetujui?
                                            Image.asset(
                                              'assets/icons/approve.png',
                                              width: 24,
                                            )
                                                :
                                            Image.asset(
                                              'assets/icons/close.png',
                                              width: 24,
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              InkWell(
                                                onTap: () => Navigator.pushNamed(
                                                  context,
                                                  mptMahasiswaRiwayatKegiatanMahasiswaEditPageRoute,
                                                  arguments: riwayatKegiatanMpt,
                                                ).then((_) => context.read<RiwayatKegiatanMptBloc>().add(
                                                    ReadAllRiwayatKegiatanMptEvent(filter: "$_idPeriodeKegiatanMpt/$_idJenisKegiatan/$_idNamaKegiatan/$_status/${_nimController.text}/$_isCheckedJenisKegiatan"))),
                                                child: Image.asset(
                                                  'assets/icons/edit.png',
                                                  width: 24,
                                                ),
                                              ),

                                              const SizedBox(width: 8.0,),

                                              InkWell(
                                                onTap: () {
                                                  context.read<RiwayatKegiatanMptBloc>().add(
                                                      UpdateRiwayatKegiatanMptEvent(
                                                          riwayatKegiatanMpt: riwayatKegiatanMpt.copyWith(statusMpt: disetujui)));
                                                  mipokaCustomToast("Riwayat kegiatan MPT telah di approve");
                                                },
                                                child: Image.asset(
                                                  'assets/icons/approve.png',
                                                  width: 24,
                                                ),
                                              ),

                                              const SizedBox(width: 8.0,),

                                              InkWell(
                                                onTap: () {
                                                  mipokaCustomToast("Riwayat Kegiatan telah dihapus");
                                                  context.read<RiwayatKegiatanMptBloc>().add(
                                                      DeleteRiwayatMptEvent(idRiwayatKegiatanMpt: riwayatKegiatanMpt.idRiwayatKegiatanMpt));
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
                      } else if (state is RiwayatKegiatanMptSuccess) {
                        context.read<RiwayatKegiatanMptBloc>().add(
                            ReadAllRiwayatKegiatanMptEvent(filter: "$_idPeriodeKegiatanMpt/$_idJenisKegiatan/$_idNamaKegiatan/$_status/${_nimController.text}/$_isCheckedJenisKegiatan"));

                        return const SizedBox();
                      }
                      else if (state is RiwayatKegiatanMptError) {
                        return Text(state.message);
                      } else {
                        return const Text("RiwayatKegiatanMpt hasn't been triggered yet.");
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
