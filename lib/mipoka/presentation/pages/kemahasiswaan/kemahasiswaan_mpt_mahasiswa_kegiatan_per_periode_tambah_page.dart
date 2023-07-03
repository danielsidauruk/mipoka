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

class KemahasiswaanMPTMahasiswaKegiatanPerPeriodeTambahPage extends StatefulWidget {
  const KemahasiswaanMPTMahasiswaKegiatanPerPeriodeTambahPage({super.key});

  @override
  State<KemahasiswaanMPTMahasiswaKegiatanPerPeriodeTambahPage> createState() => _KemahasiswaanMPTMahasiswaKegiatanPerPeriodeTambahPageState();
}

class _KemahasiswaanMPTMahasiswaKegiatanPerPeriodeTambahPageState extends State<KemahasiswaanMPTMahasiswaKegiatanPerPeriodeTambahPage> {
  late int idNamaKegiatanMpt;
  late int idPeriodeMpt;
  late int idJenisKegiatanMpt;
  final TextEditingController _poinKegiatanController = TextEditingController();
  final TextEditingController _tanggalMulaiController = TextEditingController();
  final TextEditingController _tanggalSelesaiController = TextEditingController();
  
  @override
  void initState() {
    context.read<NamaKegiatanMptBloc>().add(const ReadAllNamaKegiatanMptEvent());
    context.read<PeriodeMptBloc>().add(ReadAllPeriodeMptEvent());
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

                        idNamaKegiatanMpt = idKegiatanMptList[0];
                        idJenisKegiatanMpt = idJenisKegiatanMptList[0];

                        return MipokaCustomDropdown(
                          items: namaKegiatanList,
                          onValueChanged: (value) {
                            int index = namaKegiatanList.indexOf(value ?? "");
                            idNamaKegiatanMpt = idKegiatanMptList[index];
                            idJenisKegiatanMpt = idJenisKegiatanMptList[index];
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

                        tahunPeriodeMptList.insert(0, "semua");
                        
                        List<int> idTahunPeriodeList = state.periodeMptList.map(
                                (periodeMptList) => periodeMptList.idPeriodeMpt).toList();
                        idTahunPeriodeList.insert(0, 0);

                        idPeriodeMpt = idTahunPeriodeList[0];

                        return MipokaCustomDropdown(
                          items: tahunPeriodeMptList,
                          onValueChanged: (value) {
                            int index = tahunPeriodeMptList.indexOf(value!);
                            idPeriodeMpt = idTahunPeriodeList[index];
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
                            CreateKegiatanPerPeriodeMptEvent(
                              kegiatanPerPeriodeMpt: KegiatanPerPeriodeMpt(
                                idKegiatanPerPeriodeMpt: newId,
                                idNamaKegiatanMpt: idNamaKegiatanMpt ?? 0,
                                idPeriodeMpt: idPeriodeMpt ?? 0,
                                idJenisKegiatanMpt: idJenisKegiatanMpt,
                                tanggalMulaiKegiatanPerPeriodeMpt: _tanggalMulaiController.text,
                                tanggalSelesaiKegiatanPerPeriodeMpt: _tanggalSelesaiController.text,
                                pointMptDiperoleh: int.parse(_poinKegiatanController.text),
                                createdAt: currentDate,
                                createdBy: user?.email ?? "unknown",
                                updatedAt: currentDate,
                                updatedBy: user?.email ?? "unknown",
                              )
                            )
                          );
                          // Navigator.pop(context);
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
