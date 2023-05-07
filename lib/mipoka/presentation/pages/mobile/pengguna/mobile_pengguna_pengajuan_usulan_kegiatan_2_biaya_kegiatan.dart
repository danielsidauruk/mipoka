import 'package:flutter/material.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/button.dart';
import 'package:mipoka/mipoka/presentation/widgets/content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_textfield.dart';
import 'package:mipoka/mipoka/presentation/widgets/drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/mobile_title.dart';

class MobilePenggunaPengajuanUsulanKegiatan2BiayaKegiatan extends StatefulWidget {
  const MobilePenggunaPengajuanUsulanKegiatan2BiayaKegiatan({super.key});

  @override
  State<MobilePenggunaPengajuanUsulanKegiatan2BiayaKegiatan> createState() => _MobilePenggunaPengajuanUsulanKegiatan2BiayaKegiatanState();
}

class _MobilePenggunaPengajuanUsulanKegiatan2BiayaKegiatanState extends State<MobilePenggunaPengajuanUsulanKegiatan2BiayaKegiatan> {
  final TextEditingController _namaBiayaKegiatanController = TextEditingController();
  final TextEditingController _qtyController = TextEditingController();
  final TextEditingController _hargaSatuanController = TextEditingController();
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

      appBar: const MipokaAppBar(),

      drawer: const MobilePenggunaDrawerWidget(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              const MobileTitle(text: 'Pengajuan - Kegiatan - Usulan Kegiatan'),

              const FieldSpacer(),

              ContentBox(
                children: [
                  Text(
                    'Biaya Kegiatan',
                    style: mobileSubTitle,
                  ),

                  const FieldSpacer(),

                  buildTitle('Nama Biaya Kegiatan'),
                  CustomTextField(controller: _namaBiayaKegiatanController),

                  const FieldSpacer(),

                  buildTitle('Qty'),
                  CustomTextField(
                    controller: _qtyController,
                    textInputType: TextInputType.number,
                  ),

                  const FieldSpacer(),

                  buildTitle('Harga Satuan'),
                  CustomTextField(
                    controller: _hargaSatuanController,
                    textInputType: TextInputType.number,
                  ),

                  const FieldSpacer(),

                  buildTitle('Total'),
                  CustomTextField(
                    controller: _totalController,
                    textInputType: TextInputType.number,
                  ),

                  const FieldSpacer(),

                  buildTitle('Keterangan'),

                  CustomTextField(controller: _keteranganController),

                  const FieldSpacer(),

                  CustomButton(
                    navigation: () {
                      Navigator.pop(context);
                    },
                    text: 'Tambahkan',
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
