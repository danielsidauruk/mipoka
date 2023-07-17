import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/download_file_with_dio.dart';
import 'package:mipoka/mipoka/domain/entities/kegiatan_per_periode_mpt.dart';
import 'package:mipoka/mipoka/domain/entities/mipoka_user.dart';
import 'package:mipoka/mipoka/domain/entities/riwayat_kegiatan_mpt.dart';
import 'package:mipoka/mipoka/presentation/bloc/riwayat_kegiatan_mpt_bloc/riwayat_kegiatan_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_icon_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_file_uploader.dart';

class MahasiswaRiwayatKegiatanMahasiswaEditPage extends StatefulWidget {
  const MahasiswaRiwayatKegiatanMahasiswaEditPage({
    super.key,
    required this.riwayatKegiatanMpt,
  });

  final RiwayatKegiatanMpt riwayatKegiatanMpt;

  @override
  State<MahasiswaRiwayatKegiatanMahasiswaEditPage> createState() => _MahasiswaRiwayatKegiatanMahasiswaEditPageState();
}

class _MahasiswaRiwayatKegiatanMahasiswaEditPageState extends State<MahasiswaRiwayatKegiatanMahasiswaEditPage> {
  late KegiatanPerPeriodeMpt _kegiatanPeriodeMpt;
  late MipokaUser _mipokaUser;
  late String _keteranganMahasiswa;
  final TextEditingController _poinController = TextEditingController();
  final TextEditingController _keteranganKemahasiswaan = TextEditingController();
  late String _statusVerifikasi;
  late String _fileSertifikatMpt;

  final StreamController<String> _selectedOptionController = StreamController<String>.broadcast();

  @override
  void initState() {
    _kegiatanPeriodeMpt = widget.riwayatKegiatanMpt.kegiatanPerPeriodeMpt;
    _mipokaUser = widget.riwayatKegiatanMpt.mipokaUser;
    _keteranganMahasiswa = widget.riwayatKegiatanMpt.keteranganMhs;
    _keteranganKemahasiswaan.text = widget.riwayatKegiatanMpt.keteranganSa;
    _poinController.text = widget.riwayatKegiatanMpt.kegiatanPerPeriodeMpt.pointMptDiperoleh.toString();
    _statusVerifikasi = widget.riwayatKegiatanMpt.statusMpt;
    _fileSertifikatMpt = widget.riwayatKegiatanMpt.fileSertifikatMpt;
    super.initState();
  }

  @override
  void dispose() {
    _selectedOptionController.close();
    super.dispose();
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

              const CustomMobileTitle(text: 'Kemahasiswaan - MPT Mahasiswa - Edit Riwayat Kegiatan Mahasiswa'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [
                  buildTitle('Periode'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _kegiatanPeriodeMpt.periodeMpt.periodeMengulangMpt ?
                      "${_kegiatanPeriodeMpt.periodeMpt.tahunPeriodeMpt} (Ulang)" :
                      _kegiatanPeriodeMpt.periodeMpt.tahunPeriodeMpt,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('NIM'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _mipokaUser.nim,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Nama Mahasiswa'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _mipokaUser.namaLengkap,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Jenis Kegiatan'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _kegiatanPeriodeMpt.namaKegiatanMpt.namaKegiatan,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Keterangan Mahasiswa'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _keteranganMahasiswa,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('File Unggahan'),
                  // CustomIconButton(
                  //   text: 'loremipsum.pdf',
                  //   onTap: () {},
                  //   icon: Icons.picture_as_pdf,
                  // ),

                  MipokaFileUploader(
                    onTap: () => downloadFileWithDio(
                      url: _fileSertifikatMpt,
                      fileName: "",
                    ),
                    text: _fileSertifikatMpt,
                    asset: "assets/icons/pdf.png",
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Keterangan Kemahasiswaan'),
                  CustomTextField(controller: _keteranganKemahasiswaan),

                  const CustomFieldSpacer(),

                  buildTitle('Poin'),
                  CustomTextField(
                    controller: _poinController,
                    textInputType: TextInputType.number,
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Status Verifikasi'),
                  StreamBuilder<String>(
                    stream: _selectedOptionController.stream,
                    initialData: '',
                    builder: (context, snapshot) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Radio(
                                    value: disetujui,
                                    groupValue: _statusVerifikasi,
                                    onChanged: (value) {
                                      _selectedOptionController.add(value.toString());
                                      _statusVerifikasi = value!;
                                    },
                                  ),
                                  const Text(disetujui),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Radio(
                                    value: ditolak,
                                    groupValue: _statusVerifikasi,
                                    onChanged: (value) {
                                      _selectedOptionController.add(value.toString());
                                      _statusVerifikasi = value!;
                                    },
                                  ),
                                  const Text(ditolak),
                                ],
                              ),
                            ],
                          ),
                        ],
                      );
                    },
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
                          if (_keteranganKemahasiswaan.text.isNotEmpty && _poinController.text.isNotEmpty) {
                            try {
                              int? point = int.tryParse(_poinController.text);
                              if (point != null) {
                                context.read<RiwayatKegiatanMptBloc>().add(
                                  UpdateRiwayatKegiatanMptEvent(
                                    riwayatKegiatanMpt: widget.riwayatKegiatanMpt.copyWith(
                                      keteranganSa: _keteranganKemahasiswaan.text,
                                      kegiatanPerPeriodeMpt: widget.riwayatKegiatanMpt.kegiatanPerPeriodeMpt.copyWith(
                                        pointMptDiperoleh: point,
                                      ),
                                      statusMpt: _statusVerifikasi,
                                    ),
                                  ),
                                );
                                mipokaCustomToast("Riwayat Kegiatan Mpt telah di update.");
                                Navigator.pop(context);
                              } else {
                                mipokaCustomToast(dataTypeErrorMessage);
                              }
                            } catch (e) {
                              mipokaCustomToast(dataTypeErrorMessage);
                            }
                          } else {
                            mipokaCustomToast(emptyFieldMessage);
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