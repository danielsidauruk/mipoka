import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/domain/entities/kegiatan_per_periode_mpt.dart';
import 'package:mipoka/mipoka/presentation/bloc/jenis_kegiatan_mpt/jenis_kegiatan_mpt_bloc.dart';
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
  int? _idNamaKegiatanController;
  int? _idPeriodeKegiatanController;
  int? _idJenisKegiatanController;

  @override
  void initState() {
    _tanggalMulaiController.text = widget.kegiatanPerPeriodeMpt.tanggalMulaiKegiatanPerPeriodeMpt;
    _tanggalSelesaiController.text = widget.kegiatanPerPeriodeMpt.tanggalSelesaiKegiatanPerPeriodeMpt;
    _poinKegiatanController.text = widget.kegiatanPerPeriodeMpt.pointMptDiperoleh.toString();
    _idNamaKegiatanController = widget.kegiatanPerPeriodeMpt.idNamaKegiatanMpt;
    _idPeriodeKegiatanController = widget.kegiatanPerPeriodeMpt.idPeriodeMpt;
    _idJenisKegiatanController = widget.kegiatanPerPeriodeMpt.idJenisKegiatanMpt;

    context.read<PeriodeMptDropDownBloc>().add(ReadPeriodeMptDropDownEvent());
    context.read<NamaKegiatanDropDownBloc>().add(ReadNamaKegiatanDropDownEvent());
    context.read<JenisKegiatanMptBloc>().add(const ReadAllJenisKegiatanMptEvent());
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

                        List<String> namaKegiatanList = state.namaKegiatanList.map(
                                (namaKegiatanList) => namaKegiatanList.namaKegiatan).toList();

                        List<int> idNamaKegiatanList = state.namaKegiatanList.map(
                                (namaKegiatanMptList) => namaKegiatanMptList.idNamaKegiatanMpt).toList();

                        List<int> idJenisKegiatanList = state.namaKegiatanList.map(
                                (jenisKegiatanMpt) => jenisKegiatanMpt.idJenisKegiatanMpt).toList();


                        int indexOfNamaKegiatan = idNamaKegiatanList.indexOf(_idNamaKegiatanController ?? 0);
                        String namaKegiatanController = namaKegiatanList[indexOfNamaKegiatan];

                        return MipokaCustomDropdown(
                          items: namaKegiatanList,
                          initialItem: namaKegiatanController,
                          onValueChanged: (value) {
                            int index = namaKegiatanList.indexOf(value ?? "");
                            _idNamaKegiatanController = idNamaKegiatanList[index];
                            _idJenisKegiatanController = idJenisKegiatanList[index];
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

                  buildTitle('Tahun'),

                  BlocBuilder<PeriodeMptDropDownBloc, PeriodeMptDropDownState>(
                    builder: (context, state) {
                      if (state is PeriodeMptDropDownLoading) {
                        return const Text("Loading ....");
                      } else if (state is PeriodeMptDropDownHasData) {
                        List<String> tahunPeriodeMptList = state.periodeMptList.map(
                                (periodeMptList) => periodeMptList.periodeMengulangMpt == true ?
                                "${periodeMptList.tahunPeriodeMpt} (ulang)" :
                                periodeMptList.tahunPeriodeMpt).toList();

                        List<int> idTahunPeriodeList = state.periodeMptList.map(
                                (periodeMptList) => periodeMptList.idPeriodeMpt).toList();

                        // idPeriodeMpt = idTahunPeriodeList[0];
                        int indexOfPeriode = idTahunPeriodeList.indexOf(_idPeriodeKegiatanController ?? 0);
                        String tahunPeriodeController = tahunPeriodeMptList[indexOfPeriode];

                        return MipokaCustomDropdown(
                          items: tahunPeriodeMptList,
                          initialItem: tahunPeriodeController,
                          onValueChanged: (value) {
                            int index = tahunPeriodeMptList.indexOf(value!);
                            // idPeriodeMpt = idTahunPeriodeList[index];

                            _idPeriodeKegiatanController = idTahunPeriodeList[index];
                          }
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
                          context.read<KegiatanPerPeriodeMptBloc>().add(

                            UpdateKegiatanPerPeriodeMptEvent(
                              kegiatanPerPeriodeMpt: widget.kegiatanPerPeriodeMpt.copyWith(
                                idNamaKegiatanMpt: _idNamaKegiatanController,
                                idPeriodeMpt: _idPeriodeKegiatanController,
                                idJenisKegiatanMpt: _idJenisKegiatanController,
                                tanggalMulaiKegiatanPerPeriodeMpt: _tanggalMulaiController.text,
                                tanggalSelesaiKegiatanPerPeriodeMpt: _tanggalSelesaiController.text,
                                pointMptDiperoleh: int.parse(_poinKegiatanController.text),
                                updatedAt: currentDate,
                                updatedBy: user?.email ?? "unknown",
                              ),
                            ),
                          );
                          Navigator.pop(context);
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
