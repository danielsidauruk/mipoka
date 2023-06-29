import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/domain/entities/rincian_biaya_kegiatan.dart';
import 'package:mipoka/mipoka/presentation/bloc/rincian_biaya_kegiatan_bloc/rincian_biaya_kegiatan_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';

class LaporanKegiatanTambahBiayaKegiatanPage extends StatefulWidget {
  const LaporanKegiatanTambahBiayaKegiatanPage({
    required this.idLaporan,
    super.key,
  });
  
  final int idLaporan;

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
  int? selisih;
  
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
                          int newId = DateTime.now().microsecondsSinceEpoch;
                          User? user = FirebaseAuth.instance.currentUser;
                          String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

                          if (_usulanAnggaranController.text.isNotEmpty && _realisasiAnggaranController.text.isNotEmpty) {
                            int? usulanAnggaran = int.tryParse(_usulanAnggaranController.text);
                            int? realisasiAnggaran = int.tryParse(_realisasiAnggaranController.text);

                            if (usulanAnggaran != null && realisasiAnggaran != null) {
                              selisih = usulanAnggaran > realisasiAnggaran
                                  ? usulanAnggaran - realisasiAnggaran
                                  : realisasiAnggaran - usulanAnggaran;
                            }
                          }

                          context.read<RincianBiayaKegiatanBloc>().add(
                            CreateRincianBiayaKegiatanEvent(
                              idLaporan: widget.idLaporan,
                              rincianBiayaKegiatan: RincianBiayaKegiatan(
                                idRincianBiayaKegiatan: newId,
                                namaBiaya: _namaBiayaKegiatanController.text,
                                keterangan: _keteranganController.text,
                                kuantitas: int.parse(_kuantitasController.text),
                                hargaSatuan: int.parse(_hargaSatuanController.text),
                                usulanAnggaran: int.parse(_usulanAnggaranController.text),
                                realisasiAnggaran: int.parse(_realisasiAnggaranController.text),
                                selisih: selisih ?? 0,
                                createdAt: currentDate,
                                createdBy: user?.email ?? "unknown",
                                updatedAt: currentDate,
                                updatedBy: user?.email ?? "unknown",
                              ),
                            ),
                          );
                          Navigator.pop(context);
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
