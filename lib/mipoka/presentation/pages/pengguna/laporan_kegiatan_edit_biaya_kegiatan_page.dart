import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/core/constanst.dart';
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

class LaporanKegiatanEditBiayaKegiatanPage extends StatefulWidget {
  const LaporanKegiatanEditBiayaKegiatanPage({
    required this.rincianBiayaLaporan,
    super.key,
  });
  
  final RincianBiayaKegiatan rincianBiayaLaporan;

  @override
  State<LaporanKegiatanEditBiayaKegiatanPage> createState() => _LaporanKegiatanEditBiayaKegiatanPageState();
}

class _LaporanKegiatanEditBiayaKegiatanPageState extends State<LaporanKegiatanEditBiayaKegiatanPage> {
  int? selisih;

  final TextEditingController _namaBiayaKegiatanController = TextEditingController();
  final TextEditingController _kuantitasController = TextEditingController();
  final TextEditingController _hargaSatuanController = TextEditingController();
  final TextEditingController _usulanAnggaranController = TextEditingController();
  final TextEditingController _realisasiAnggaranController = TextEditingController();
  final TextEditingController _keteranganController = TextEditingController();

  @override
  void initState() {
    _namaBiayaKegiatanController.text = widget.rincianBiayaLaporan.namaBiaya;
    _kuantitasController.text = widget.rincianBiayaLaporan.kuantitas.toString();
    _hargaSatuanController.text = widget.rincianBiayaLaporan.hargaSatuan.toString();
    _usulanAnggaranController.text = widget.rincianBiayaLaporan.usulanAnggaran.toString();
    _realisasiAnggaranController.text = widget.rincianBiayaLaporan.realisasiAnggaran.toString();
    _keteranganController.text = widget.rincianBiayaLaporan.keterangan;
    super.initState();
  }
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
                            UpdateRincianBiayaKegiatanEvent(
                              rincianBiayaKegiatan: widget.rincianBiayaLaporan.copyWith(
                                namaBiaya: _namaBiayaKegiatanController.text,
                                keterangan: _keteranganController.text,
                                kuantitas: int.parse(_kuantitasController.text),
                                hargaSatuan: int.parse(_hargaSatuanController.text),
                                usulanAnggaran: int.parse(_usulanAnggaranController.text),
                                realisasiAnggaran: int.parse(_realisasiAnggaranController.text),
                                selisih: selisih ?? 0,
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
