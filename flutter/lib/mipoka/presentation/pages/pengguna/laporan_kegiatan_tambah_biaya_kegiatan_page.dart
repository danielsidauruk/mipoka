import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/uniqe_id_generator.dart';
import 'package:mipoka/mipoka/domain/entities/laporan.dart';
import 'package:mipoka/mipoka/domain/entities/rincian_biaya_kegiatan.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';

class LaporanKegiatanTambahBiayaKegiatanPage extends StatefulWidget {
  const LaporanKegiatanTambahBiayaKegiatanPage({
    required this.laporan,
    super.key,
  });
  
  final Laporan laporan;

  @override
  State<LaporanKegiatanTambahBiayaKegiatanPage> createState() => _LaporanKegiatanTambahBiayaKegiatanPageState();
}

class _LaporanKegiatanTambahBiayaKegiatanPageState extends State<LaporanKegiatanTambahBiayaKegiatanPage> {
  final TextEditingController _namaBiayaKegiatanController = TextEditingController();
  final TextEditingController _kuantitasController = TextEditingController();
  final TextEditingController _hargaSatuanController = TextEditingController();
  final TextEditingController _usulanAnggaranController = TextEditingController();
  final TextEditingController _realisasiAnggaranController = TextEditingController();
  final TextEditingController _keteranganController = TextEditingController();

  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: const MipokaMobileAppBar(),

      drawer: const MobileCustomPenggunaDrawerWidget(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              const CustomMobileTitle(text: 'Pengajuan - Kegiatan - Laporan Kegiatan'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [

                  customBoxTitle('Biaya Kegiatan'),

                  const CustomFieldSpacer(),

                  buildTitle('Nama Biaya Kegiatan'),
                  CustomTextField(controller: _namaBiayaKegiatanController),

                  const CustomFieldSpacer(),

                  buildTitle('Kuantitas'),
                  CustomTextField(
                    controller: _kuantitasController,
                    textInputType: TextInputType.number,
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Harga Satuan'),
                  CustomTextField(
                    controller: _hargaSatuanController,
                    textInputType: TextInputType.number,
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Usulan Anggaran'),
                  CustomTextField(
                    controller: _usulanAnggaranController,
                    textInputType: TextInputType.number,
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Realisasi Anggaran'),
                  CustomTextField(
                    controller: _realisasiAnggaranController,
                    textInputType: TextInputType.number,
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Keterangan'),

                  CustomTextField(controller: _keteranganController),

                  const CustomFieldSpacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomMipokaButton(
                        onTap: () => Navigator.pop(context),
                        text: "Kembali",
                      ),

                      const SizedBox(width: 8.0),

                      CustomMipokaButton(
                        onTap: () {
                          int? usulanAnggaran = int.tryParse(_usulanAnggaranController.text);
                          int? realisasiAnggaran = int.tryParse(_realisasiAnggaranController.text);
                          int? kuantitas = int.tryParse(_kuantitasController.text);
                          int? hargaSatuan = int.tryParse(_hargaSatuanController.text);
                          int? selisih;

                          if (_namaBiayaKegiatanController.text.isEmpty) {
                            mipokaCustomToast(emptyFieldPrompt("Nama Biaya Kegiatan"));
                          } else if (_kuantitasController.text.isEmpty) {
                            mipokaCustomToast(emptyFieldPrompt("Kuantitas"));
                          } else if (kuantitas == null) {
                            mipokaCustomToast(dataTypeFalsePrompt("Kuantitas"));
                          } else if (_hargaSatuanController.text.isEmpty) {
                            mipokaCustomToast(emptyFieldPrompt("Harga Satuan"));
                          } else if (hargaSatuan == null) {
                            mipokaCustomToast(dataTypeFalsePrompt("Harga Satuan"));
                          } else if (_usulanAnggaranController.text.isEmpty) {
                            mipokaCustomToast(emptyFieldPrompt("Usulan Anggaran"));
                          } else if (usulanAnggaran == null) {
                            mipokaCustomToast(dataTypeFalsePrompt("Usulan Anggaran"));
                          } else if (_realisasiAnggaranController.text.isEmpty) {
                            mipokaCustomToast(emptyFieldPrompt("Realisasi Anggaran"));
                          } else if (realisasiAnggaran == null) {
                            mipokaCustomToast(dataTypeFalsePrompt("Realisasi Anggaran"));
                          } else if (_keteranganController.text.isEmpty) {
                            mipokaCustomToast(emptyFieldPrompt("Keterangan"));
                          } else {

                            if (usulanAnggaran > realisasiAnggaran) {
                              selisih = usulanAnggaran - realisasiAnggaran;
                            } else {
                              selisih = realisasiAnggaran - usulanAnggaran;
                            }

                            String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
                            int uniqueId = UniqueIdGenerator.generateUniqueId();

                            Navigator.pop(
                              context,
                              widget.laporan.copyWith(
                                rincianBiayaKegiatan: [
                                  ...widget.laporan.rincianBiayaKegiatan,
                                  RincianBiayaKegiatan(
                                    idRincianBiayaKegiatan: uniqueId,
                                    namaBiaya: _namaBiayaKegiatanController.text,
                                    keterangan: _keteranganController.text,
                                    laporan: "-",
                                    kuantitas: kuantitas,
                                    hargaSatuan: hargaSatuan,
                                    usulanAnggaran: usulanAnggaran,
                                    realisasiAnggaran: realisasiAnggaran,
                                    selisih: selisih,
                                    createdAt: currentDate,
                                    createdBy: user?.email ?? "unknown",
                                    updatedAt: currentDate,
                                    updatedBy: user?.email ?? "unknown",
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                        text: 'Tambahkan Peserta',
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
