import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/domain/entities/kegiatan_per_periode_mpt.dart';
import 'package:mipoka/mipoka/presentation/bloc/jenis_kegiatan_mpt/jenis_kegiatan_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/kegiatan_per_periode_mpt_bloc/kegiatan_per_periode_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/nama_kegaitan_mpt_bloc/nama_kegiatan_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/periode_mpt_bloc/periode_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_date_picker_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';

class KemahasiswaanMPTMahasiswaKegiatanPerPeriodeTambahPage extends StatefulWidget {
  const KemahasiswaanMPTMahasiswaKegiatanPerPeriodeTambahPage({super.key});

  @override
  State<KemahasiswaanMPTMahasiswaKegiatanPerPeriodeTambahPage> createState() => _KemahasiswaanMPTMahasiswaKegiatanPerPeriodeTambahPageState();
}

class _KemahasiswaanMPTMahasiswaKegiatanPerPeriodeTambahPageState extends State<KemahasiswaanMPTMahasiswaKegiatanPerPeriodeTambahPage> {
  int? _idNamaKegiatanMpt;
  int? _idPeriodeMpt;
  int? _idJenisKegiatanMpt;
  final TextEditingController _poinKegiatanController = TextEditingController();
  final TextEditingController _tanggalMulaiController = TextEditingController();
  final TextEditingController _tanggalSelesaiController = TextEditingController();
  
  @override
  void initState() {
    Future.microtask(() {
      context.read<NamaKegiatanMptBloc>().add(const ReadAllNamaKegiatanMptEvent());
      context.read<PeriodeMptBloc>().add(ReadAllPeriodeMptEvent());
    });
    super.initState();
  }

  @override
  void dispose() {
    context.read<NamaKegiatanMptBloc>().close();
    context.read<PeriodeMptBloc>().close();
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

              const CustomMobileTitle(text: 'Kemahasiswaan - MPT Mahasiswa - Tambah Kegiatan per Periode'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [

                  // size.width > 700 ?
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     buildTitle('Nama Kegiatan'),
                  //     BlocBuilder<NamaKegiatanMptBloc, NamaKegiatanMptState>(
                  //       builder: (context, state) {
                  //         if (state is NamaKegiatanMptLoading) {
                  //           return const Text("Loading ...");
                  //         } else if (state is AllNamaKegiatanMptHasData) {
                  //           List<String> namaKegiatanList = state.namaKegiatanMptList.map(
                  //                   (namaKegiatanList) => namaKegiatanList.namaKegiatan).toList();
                  //
                  //           List<int> idKegiatanMptList = state.namaKegiatanMptList.map(
                  //                   (namaKegiatanMptList) => namaKegiatanMptList.idNamaKegiatanMpt).toList();
                  //
                  //           List<int> idJenisKegiatanMptList = state.namaKegiatanMptList.map(
                  //                   (jenisKegiatanMpt) => jenisKegiatanMpt.idJenisKegiatanMpt).toList();
                  //
                  //           _idNamaKegiatanMpt = idKegiatanMptList[0];
                  //           _idJenisKegiatanMpt = idJenisKegiatanMptList[0];
                  //
                  //           return MipokaCustomDropdown(
                  //             items: namaKegiatanList,
                  //             onValueChanged: (value) {
                  //               int index = namaKegiatanList.indexOf(value ?? "");
                  //               _idNamaKegiatanMpt = idKegiatanMptList[index];
                  //               _idJenisKegiatanMpt = idJenisKegiatanMptList[index];
                  //             },
                  //           );
                  //         } else if (state is NamaKegiatanMptError) {
                  //           return Text(state.message);
                  //         } else {
                  //           return const Text("NamaKegiatanBloc hasn't been triggered yet.");
                  //         }
                  //       },
                  //     ),
                  //
                  //     const CustomFieldSpacer(),
                  //
                  //     buildTitle('Tahun'),
                  //     BlocBuilder<PeriodeMptBloc, PeriodeMptState>(
                  //       builder: (context, state) {
                  //         if (state is PeriodeMptLoading) {
                  //           return const Text("Loading ....");
                  //         } else if (state is AllPeriodeMptHasData) {
                  //           List<String> tahunPeriodeMptList = state.periodeMptList.map(
                  //                   (periodeMptList) => periodeMptList.periodeMengulangMpt == true ?
                  //               "${periodeMptList.tahunPeriodeMpt} (ulang)" :
                  //               periodeMptList.tahunPeriodeMpt).toList();
                  //
                  //           List<int> idTahunPeriodeList = state.periodeMptList.map(
                  //                   (periodeMptList) => periodeMptList.idPeriodeMpt).toList();
                  //
                  //           _idPeriodeMpt = idTahunPeriodeList[0];
                  //
                  //           return MipokaCustomDropdown(
                  //               items: tahunPeriodeMptList,
                  //               onValueChanged: (value) {
                  //                 int index = tahunPeriodeMptList.indexOf(value!);
                  //                 _idPeriodeMpt = idTahunPeriodeList[index];
                  //               }
                  //           );
                  //         } else if (state is PeriodeMptError) {
                  //           return Text(state.message);
                  //         } else {
                  //           return const Text("PeriodeMptBloc hasn't been triggered yet.");
                  //         }
                  //       },
                  //     ),
                  //
                  //     const CustomFieldSpacer(),
                  //
                  //     buildTitle('Tanggal mulai'),
                  //     CustomDatePickerField(
                  //       controller: _tanggalMulaiController,
                  //     ),
                  //
                  //     const CustomFieldSpacer(),
                  //
                  //     buildTitle('Tanggal selesai'),
                  //     CustomDatePickerField(
                  //       controller: _tanggalSelesaiController,
                  //     ),
                  //
                  //     const CustomFieldSpacer(),
                  //
                  //     buildTitle('Poin Kegiatan'),
                  //     CustomTextField(
                  //       textFieldWidth: 300,
                  //       controller: _poinKegiatanController,
                  //     ),
                  //   ],
                  // ) :
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTitle('Nama Kegiatan'),
                      BlocBuilder<NamaKegiatanMptBloc, NamaKegiatanMptState>(
                        builder: (context, state) {
                          if (state is NamaKegiatanMptLoading) {
                            return const Text("Loading ...");
                          } else if (state is AllNamaKegiatanMptHasData) {
                            List<String> namaKegiatanList = state.namaKegiatanMptList.map(
                                    (namaKegiatanList) => namaKegiatanList.namaKegiatan).toList();

                            List<int> idKegiatanMptList = state.namaKegiatanMptList.map(
                                    (namaKegiatanMptList) => namaKegiatanMptList.idNamaKegiatanMpt).toList();

                            List<int> idJenisKegiatanMptList = state.namaKegiatanMptList.map(
                                    (jenisKegiatanMpt) => jenisKegiatanMpt.idJenisKegiatanMpt).toList();

                            _idNamaKegiatanMpt = idKegiatanMptList[0];
                            _idJenisKegiatanMpt = idJenisKegiatanMptList[0];

                            return MipokaCustomDropdown(
                              items: namaKegiatanList,
                              onValueChanged: (value) {
                                int index = namaKegiatanList.indexOf(value ?? "");
                                _idNamaKegiatanMpt = idKegiatanMptList[index];
                                _idJenisKegiatanMpt = idJenisKegiatanMptList[index];
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

                      buildTitle('Tahun'),

                      BlocBuilder<PeriodeMptBloc, PeriodeMptState>(
                        builder: (context, state) {
                          if (state is PeriodeMptLoading) {
                            return const Text("Loading ....");
                          } else if (state is AllPeriodeMptHasData) {
                            List<String> tahunPeriodeMptList = state.periodeMptList.map(
                                    (periodeMptList) => periodeMptList.periodeMengulangMpt == true ?
                                "${periodeMptList.tahunPeriodeMpt} (ulang)" :
                                periodeMptList.tahunPeriodeMpt).toList();

                            List<int> idTahunPeriodeList = state.periodeMptList.map(
                                    (periodeMptList) => periodeMptList.idPeriodeMpt).toList();

                            _idPeriodeMpt = idTahunPeriodeList[0];

                            return MipokaCustomDropdown(
                                items: tahunPeriodeMptList,
                                onValueChanged: (value) {
                                  int index = tahunPeriodeMptList.indexOf(value!);
                                  _idPeriodeMpt = idTahunPeriodeList[index];
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

                      buildTitle('Tanggal mulai'),
                      CustomDatePickerField(
                        controller: _tanggalMulaiController,
                      ),

                      const CustomFieldSpacer(),

                      buildTitle('Tanggal selesai'),
                      CustomDatePickerField(
                        controller: _tanggalSelesaiController,
                      ),

                      const CustomFieldSpacer(),

                      buildTitle('Poin Kegiatan'),
                      CustomTextField(
                        textFieldWidth: 400,
                        controller: _poinKegiatanController,
                      ),
                    ],
                  ),


                  const CustomFieldSpacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomMipokaButton(
                        onTap: () => Navigator.pop(context),
                        text: 'Kembali',
                      ),

                      const SizedBox(width: 8.0),

                      CustomMipokaButton(
                        onTap: () {
                          if (_idNamaKegiatanMpt != 0 && _idPeriodeMpt != 0
                              && _tanggalMulaiController.text.isNotEmpty && _tanggalSelesaiController.text.isNotEmpty
                              && _poinKegiatanController.text.isNotEmpty) {
                            try {
                              final poinKegiatan = int.tryParse(_poinKegiatanController.text);
                              if (poinKegiatan != null) {
                                Future.microtask(() {
                                  mipokaCustomToast("Kegiatan Per Periode telah ditambah");
                                  context.read<KegiatanPerPeriodeMptBloc>().add(
                                    CreateKegiatanPerPeriodeMptEvent(
                                      kegiatanPerPeriodeMpt: KegiatanPerPeriodeMpt(
                                        idKegiatanPerPeriodeMpt: newId,
                                        idNamaKegiatanMpt: _idNamaKegiatanMpt ?? 0,
                                        idPeriodeMpt: _idPeriodeMpt ?? 0,
                                        idJenisKegiatanMpt: _idJenisKegiatanMpt ?? 0,
                                        tanggalMulaiKegiatanPerPeriodeMpt: _tanggalMulaiController.text,
                                        tanggalSelesaiKegiatanPerPeriodeMpt: _tanggalSelesaiController.text,
                                        pointMptDiperoleh: poinKegiatan,
                                        createdAt: currentDate,
                                        createdBy: user?.email ?? "unknown",
                                        updatedAt: currentDate,
                                        updatedBy: user?.email ?? "unknown",
                                      ),
                                    ),
                                  );
                                  context.read<KegiatanPerPeriodeMptBloc>().add(const ReadAllKegiatanPerPeriodeMptEvent());
                                  Navigator.pop(context);
                                });
                              } else {
                                mipokaCustomToast("Input poin kegiatan tidak valid.");
                              }
                            } catch (e) {
                              mipokaCustomToast("Input poin kegiatan tidak valid.");
                            }
                          } else {
                            mipokaCustomToast("Harap lengkapi semua field.");
                          }

                        },
                        text: 'Simpan',
                      ),
                    ],
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
