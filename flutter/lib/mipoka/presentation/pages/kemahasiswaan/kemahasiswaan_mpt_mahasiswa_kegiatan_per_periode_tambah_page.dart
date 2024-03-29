import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/uniqe_id_generator.dart';
import 'package:mipoka/mipoka/domain/entities/kegiatan_per_periode_mpt.dart';
import 'package:mipoka/mipoka/domain/entities/nama_kegiatan_mpt.dart';
import 'package:mipoka/mipoka/domain/entities/periode_mpt.dart';
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
  NamaKegiatanMpt? _namaKegiatanMpt;
  PeriodeMpt? _periodeMpt;
  final TextEditingController _poinKegiatanController = TextEditingController();
  final TextEditingController _tanggalMulaiController = TextEditingController();
  final TextEditingController _tanggalSelesaiController = TextEditingController();

  User? user = FirebaseAuth.instance.currentUser;
  
  @override
  void initState() {
    context.read<NamaKegiatanMptBloc>().add(const ReadAllNamaKegiatanMptEvent());
    context.read<PeriodeMptBloc>().add(ReadAllPeriodeMptEvent());
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
      appBar: MipokaMobileAppBar(
        onRefresh: () {
          mipokaCustomToast(refreshMessage);
          context.read<NamaKegiatanMptBloc>().add(const ReadAllNamaKegiatanMptEvent());
          context.read<PeriodeMptBloc>().add(ReadAllPeriodeMptEvent());
        },
      ),

      drawer: const CustomKemahasiswaanDrawer(),

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

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTitle('Nama Kegiatan'),
                      BlocBuilder<NamaKegiatanMptBloc, NamaKegiatanMptState>(
                        builder: (context, state) {
                          if (state is NamaKegiatanMptLoading) {
                            return const Text("Loading ...");
                          } else if (state is AllNamaKegiatanMptHasData) {
                            final namaKegiatanMptList = state.namaKegiatanMptList;

                            List<String> namaKegiatanList = namaKegiatanMptList.map(
                                    (namaKegiatanList) => namaKegiatanList.namaKegiatan).toList();

                            _namaKegiatanMpt = namaKegiatanMptList[0];

                            String initialItem = namaKegiatanList[0];
                            return MipokaCustomDropdown(
                              items: namaKegiatanList,
                              initialItem: initialItem,
                              onValueChanged: (value) {
                                int index = namaKegiatanList.indexOf(value ?? "");
                                initialItem = namaKegiatanList[index];
                                _namaKegiatanMpt = namaKegiatanMptList[index];

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
                            final periodeMptList = state.periodeMptList;

                            List<String> periodeMptDropDownList = periodeMptList.map(
                                    (periodeMpt) => periodeMpt.periodeMengulangMpt == true ?
                                "${periodeMpt.tahunPeriodeMpt} (ulang)" :
                                periodeMpt.tahunPeriodeMpt).toList();

                            _periodeMpt = periodeMptList[0];

                            return MipokaCustomDropdown(
                                items: periodeMptDropDownList,
                                onValueChanged: (value) {
                                  int index = periodeMptDropDownList.indexOf(value!);
                                  _periodeMpt = periodeMptList[index];
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
                        textInputType: TextInputType.number,
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
                          final poinKegiatan = int.tryParse(_poinKegiatanController.text);

                          if (_namaKegiatanMpt == null) {
                            mipokaCustomToast(emptyFieldPrompt("Nama Kegiatan MPT"));
                          } else if (_periodeMpt == null) {
                            mipokaCustomToast(emptyFieldPrompt("Periode MPT"));
                          } else if (_tanggalMulaiController.text.isEmpty) {
                            mipokaCustomToast(emptyFieldPrompt("Tanggal Mulai"));
                          } else if (_tanggalSelesaiController.text.isEmpty) {
                            mipokaCustomToast(emptyFieldPrompt("Tanggal Selesai"));
                          } else if (_poinKegiatanController.text.isEmpty) {
                            mipokaCustomToast(emptyFieldPrompt("Poin Kegiatan"));
                          } else if (poinKegiatan == null) {
                            mipokaCustomToast(dataTypeFalsePrompt("Poin Kegiatan"));
                          } else {
                            mipokaCustomToast(savingDataMessage);

                            int uniqueId = UniqueIdGenerator.generateUniqueId();
                            String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

                            Navigator.pop(
                              context,
                              KegiatanPerPeriodeMpt(
                                idKegiatanPerPeriodeMpt: uniqueId,
                                namaKegiatanMpt: _namaKegiatanMpt!,
                                periodeMpt: _periodeMpt!,
                                tanggalMulaiKegiatanPerPeriodeMpt: _tanggalMulaiController.text,
                                tanggalSelesaiKegiatanPerPeriodeMpt: _tanggalSelesaiController.text,
                                pointMptDiperoleh: poinKegiatan,
                                createdAt: currentDate,
                                createdBy: user?.email ?? "unknown",
                                updatedAt: currentDate,
                                updatedBy: user?.email ?? "unknown",
                              ),
                            );
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
