import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/domain/entities/kegiatan_per_periode_mpt.dart';
import 'package:mipoka/mipoka/domain/entities/nama_kegiatan_mpt.dart';
import 'package:mipoka/mipoka/domain/entities/periode_mpt.dart';
import 'package:mipoka/mipoka/presentation/bloc/kegiatan_per_periode_mpt_bloc/kegiatan_per_periode_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/nama_kegiatan_drop_down_bloc/nama_kegiatan_drop_down_bloc.dart';
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

  @override
  void initState() {
    _tanggalMulaiController.text = widget.kegiatanPerPeriodeMpt.tanggalMulaiKegiatanPerPeriodeMpt;
    _tanggalSelesaiController.text = widget.kegiatanPerPeriodeMpt.tanggalSelesaiKegiatanPerPeriodeMpt;
    _poinKegiatanController.text = widget.kegiatanPerPeriodeMpt.pointMptDiperoleh.toString();
    _namaKegiatanMpt = widget.kegiatanPerPeriodeMpt.namaKegiatanMpt;
    _periodeMpt = widget.kegiatanPerPeriodeMpt.periodeMpt;

    context.read<PeriodeMptDropDownBloc>().add(ReadPeriodeMptDropDownEvent());
    context.read<NamaKegiatanDropDownBloc>().add(ReadNamaKegiatanDropDownEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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

                  buildTitle('Nama Kegiatan'),
                  BlocBuilder<NamaKegiatanDropDownBloc, NamaKegiatanDropDownState>(
                    builder: (context, state) {
                      if (state is NamaKegiatanDropDownLoading) {
                        return const Text("Loading ...");
                      } else if (state is NamaKegiatanDropDownHasData) {
                        final namaKegiatanMptList = state.namaKegiatanList;

                        List<String> namaKegiatanDropDownList = namaKegiatanMptList.map(
                                (namaKegiatan) => namaKegiatan.namaKegiatan).toList();

                        int indexOfNamaKegiatanMpt = namaKegiatanMptList.indexOf(_namaKegiatanMpt!);
                        String namaKegiatanController = indexOfNamaKegiatanMpt < 0
                            ? namaKegiatanDropDownList[0]
                            : namaKegiatanDropDownList[indexOfNamaKegiatanMpt];

                        return MipokaCustomDropdown(
                          items: namaKegiatanDropDownList,
                          initialItem: namaKegiatanController,
                          onValueChanged: (value) {
                            int index = namaKegiatanDropDownList.indexOf(value ?? "");
                            namaKegiatanController = namaKegiatanDropDownList[index];
                            _namaKegiatanMpt = namaKegiatanMptList[index];
                          },
                        );

                      } else if (state is NamaKegiatanDropDownError) {
                        return Text(state.message);
                      } else {
                        return const Text("NamaKegiatanBloc hasn't been triggered yet.");
                      }
                    },
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Periode MPT'),
                  BlocBuilder<PeriodeMptDropDownBloc, PeriodeMptDropDownState>(
                    builder: (context, state) {
                      if (state is PeriodeMptDropDownLoading) {
                        return const Text("Loading ....");
                      } else if (state is PeriodeMptDropDownHasData) {
                        final periodeMptList = state.periodeMptList;

                        List<String> periodeMptDropDownList = periodeMptList.map(
                              (periodeMpt) => periodeMpt.periodeMengulangMpt == true
                              ? "${periodeMpt.tahunPeriodeMpt} (ulang)"
                              : periodeMpt.tahunPeriodeMpt,
                        ).toList();

                        int? indexOfPeriodeMpt = periodeMptList.indexOf(_periodeMpt!);
                        String initialPeriodeMpt = indexOfPeriodeMpt < 0
                            ? periodeMptDropDownList[0]
                            : periodeMptDropDownList[indexOfPeriodeMpt];

                        return MipokaCustomDropdown(
                          items: periodeMptDropDownList,
                          initialItem: initialPeriodeMpt,
                          onValueChanged: (value) {
                            int index = periodeMptDropDownList.indexOf(value!);
                            initialPeriodeMpt = periodeMptDropDownList[index];
                            _periodeMpt = periodeMptList[index];
                          },
                        );
                      } else if (state is PeriodeMptDropDownError) {
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
                          if (_namaKegiatanMpt?.idNamaKegiatanMpt != 0 && _periodeMpt?.idPeriodeMpt != 0
                              && _tanggalMulaiController.text.isNotEmpty && _tanggalSelesaiController.text.isNotEmpty
                              && _poinKegiatanController.text.isNotEmpty) {
                            try {
                              final poinKegiatan = int.tryParse(_poinKegiatanController.text);
                              if (poinKegiatan != null) {
                                Future.microtask(() {
                                  mipokaCustomToast("Kegiatan Per Periode telah di update");
                                  context.read<KegiatanPerPeriodeMptBloc>().add(
                                    UpdateKegiatanPerPeriodeMptEvent(
                                      kegiatanPerPeriodeMpt: widget.kegiatanPerPeriodeMpt.copyWith(
                                        namaKegiatanMpt: _namaKegiatanMpt,
                                        periodeMpt: _periodeMpt,
                                        tanggalMulaiKegiatanPerPeriodeMpt: _tanggalMulaiController.text,
                                        tanggalSelesaiKegiatanPerPeriodeMpt: _tanggalSelesaiController.text,
                                        pointMptDiperoleh: poinKegiatan,
                                        updatedAt: currentDate,
                                        updatedBy: user?.email ?? "unknown",
                                      ),
                                    )
                                  );
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
