import 'package:flutter/material.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';

class PenggunaPengajuanLaporanKegiatan2BiayaKegiatan extends StatefulWidget {
  const PenggunaPengajuanLaporanKegiatan2BiayaKegiatan({super.key});

  @override
  State<PenggunaPengajuanLaporanKegiatan2BiayaKegiatan> createState() => _PenggunaPengajuanLaporanKegiatan2BiayaKegiatanState();
}

class _PenggunaPengajuanLaporanKegiatan2BiayaKegiatanState extends State<PenggunaPengajuanLaporanKegiatan2BiayaKegiatan> {
  final TextEditingController _namaBiayaKegiatanController = TextEditingController();
  final TextEditingController _qtyController = TextEditingController();
  final TextEditingController _hargaSatuanController = TextEditingController();
  final TextEditingController _hargaUsulanAnggaranController = TextEditingController();
  final TextEditingController _totalController = TextEditingController();
  final TextEditingController _keteranganController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _qtyController.addListener(_updateTotal);
    _hargaSatuanController.addListener(_updateTotal);
  }

  void _updateTotal() {
    final qty = int.tryParse(_qtyController.text) ?? 0;
    final hargaSatuan = int.tryParse(_hargaSatuanController.text) ?? 0;
    final total = qty * hargaSatuan;

    _totalController.text = total.toString();
  }

  @override
  void dispose() {
    _qtyController.dispose();
    _hargaSatuanController.dispose();
    _totalController.dispose();
    super.dispose();
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

                  buildTitle('Qty'),
                  CustomTextField(
                    controller: _qtyController,
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
                    controller: _hargaUsulanAnggaranController,
                    textInputType: TextInputType.number,
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Realisasi Anggaran'),
                  CustomTextField(
                    controller: _hargaUsulanAnggaranController,
                    textInputType: TextInputType.number,
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Keterangan'),

                  CustomTextField(controller: _keteranganController),

                  const CustomFieldSpacer(),

                  CustomMipokaButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    text: 'Tambahkan Peserta',
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
