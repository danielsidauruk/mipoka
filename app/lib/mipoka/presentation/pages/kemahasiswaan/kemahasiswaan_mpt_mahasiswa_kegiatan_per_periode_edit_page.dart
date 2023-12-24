import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/domain/entities/kegiatan_per_periode_mpt.dart';
import 'package:mipoka/mipoka/domain/entities/nama_kegiatan_mpt.dart';
import 'package:mipoka/mipoka/domain/entities/periode_mpt.dart';
import 'package:mipoka/mipoka/presentation/bloc/nama_kegaitan_mpt_bloc/nama_kegiatan_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/nama_kegiatan_drop_down_bloc/nama_kegiatan_drop_down_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/periode_mpt_bloc/periode_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/periode_mpt_dropdown_bloc/periode_mpt_drop_down_bloc.dart';
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

class KemahasiswaanMPTMahasiswaKegiatanPerPeriodeEditPage extends StatefulWidget {
  const KemahasiswaanMPTMahasiswaKegiatanPerPeriodeEditPage({
    super.key,
    required this.kegiatanPerPeriodeMpt
  });

  final KegiatanPerPeriodeMpt kegiatanPerPeriodeMpt;

  @override
  State<KemahasiswaanMPTMahasiswaKegiatanPerPeriodeEditPage> createState() => _KemahasiswaanMPTMahasiswaKegiatanPerPeriodeEditPageState();
}

class _KemahasiswaanMPTMahasiswaKegiatanPerPeriodeEditPageState extends State<KemahasiswaanMPTMahasiswaKegiatanPerPeriodeEditPage> {
  final TextEditingController _poinKegiatanController = TextEditingController();
  final TextEditingController _tanggalMulaiController = TextEditingController();
  final TextEditingController _tanggalSelesaiController = TextEditingController();
  NamaKegiatanMpt? _namaKegiatanMpt;
  PeriodeMpt? _periodeMpt;

  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    _tanggalMulaiController.text = widget.kegiatanPerPeriodeMpt.tanggalMulaiKegiatanPerPeriodeMpt;
    _tanggalSelesaiController.text = widget.kegiatanPerPeriodeMpt.tanggalSelesaiKegiatanPerPeriodeMpt;
    _poinKegiatanController.text = widget.kegiatanPerPeriodeMpt.pointMptDiperoleh.toString();
    _namaKegiatanMpt = widget.kegiatanPerPeriodeMpt.namaKegiatanMpt;
    _periodeMpt = widget.kegiatanPerPeriodeMpt.periodeMpt;

    context.read<NamaKegiatanMptBloc>().add(const ReadAllNamaKegiatanMptEvent());
    context.read<PeriodeMptBloc>().add(ReadAllPeriodeMptEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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

              const CustomMobileTitle(text: 'Kemahasiswaan - MPT Mahasiswa - Edit Kegiatan per Periode'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [

                  buildTitle('Nama Kegiatan'),
                  BlocBuilder<NamaKegiatanMptBloc, NamaKegiatanMptState>(
                    builder: (context, state) {
                      if (state is NamaKegiatanMptLoading) {
                        return const Text("Loading ...");
                      } else if (state is AllNamaKegiatanMptHasData) {
                        final namaKegiatanMptList = state.namaKegiatanMptList;

                        List<String> namaKegiatanDropDownList = namaKegiatanMptList.map(
                                (namaKegiatan) => namaKegiatan.namaKegiatan).toList();

                        // int indexOfNamaKegiatanMpt = namaKegiatanMptList.indexOf(_namaKegiatanMpt!);
                        // String namaKegiatanController = indexOfNamaKegiatanMpt < 0
                        //     ? namaKegiatanDropDownList[0]
                        //     : namaKegiatanDropDownList[indexOfNamaKegiatanMpt];

                        return MipokaCustomDropdown(
                          items: namaKegiatanDropDownList,
                          initialItem: _namaKegiatanMpt?.namaKegiatan,
                          onValueChanged: (value) {
                            int index = namaKegiatanDropDownList.indexOf(value ?? "");
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

                  buildTitle('Periode MPT'),
                  BlocBuilder<PeriodeMptBloc, PeriodeMptState>(
                    builder: (context, state) {
                      if (state is PeriodeMptLoading) {
                        return const Text("Loading ....");
                      } else if (state is AllPeriodeMptHasData) {
                        final periodeMptList = state.periodeMptList;

                        List<String> periodeMptDropDownList = periodeMptList.map(
                              (periodeMpt) => periodeMpt.periodeMengulangMpt == true
                              ? "${periodeMpt.tahunPeriodeMpt} (ulang)"
                              : periodeMpt.tahunPeriodeMpt,
                        ).toList();

                        String? initialItem = _periodeMpt?.periodeMengulangMpt == true
                            ? "${_periodeMpt?.tahunPeriodeMpt} (ulang)"
                            : _periodeMpt?.tahunPeriodeMpt;

                        return MipokaCustomDropdown(
                          items: periodeMptDropDownList,
                          initialItem: initialItem,
                          onValueChanged: (value) {
                            int index = periodeMptDropDownList.indexOf(value!);
                            _periodeMpt = periodeMptList[index];
                          },
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
                  CustomTextField(controller: _poinKegiatanController),

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
                            String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

                            Navigator.pop(
                              context,
                              widget.kegiatanPerPeriodeMpt.copyWith(
                                namaKegiatanMpt: _namaKegiatanMpt,
                                periodeMpt: _periodeMpt,
                                tanggalMulaiKegiatanPerPeriodeMpt: _tanggalMulaiController.text,
                                tanggalSelesaiKegiatanPerPeriodeMpt: _tanggalSelesaiController.text,
                                pointMptDiperoleh: poinKegiatan,
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
