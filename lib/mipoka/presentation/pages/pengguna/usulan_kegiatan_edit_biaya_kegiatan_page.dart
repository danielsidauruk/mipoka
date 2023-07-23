import 'package:flutter/material.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/multiple_args.dart';
import 'package:mipoka/mipoka/data/models/biaya_kegiatan_model.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';

class UsulanKegiatanEditBiayaKegiatanPage extends StatefulWidget {
  const UsulanKegiatanEditBiayaKegiatanPage({
    super.key,
    required this.biayaKegiatanArgs,
  });

  final BiayaKegiatanArgs biayaKegiatanArgs;

  @override
  State<UsulanKegiatanEditBiayaKegiatanPage> createState() => _UsulanKegiatanEditBiayaKegiatanPageState();
}

class _UsulanKegiatanEditBiayaKegiatanPageState extends State<UsulanKegiatanEditBiayaKegiatanPage> {
  final TextEditingController _namaBiayaKegiatanController = TextEditingController();
  final TextEditingController _kuantitiController = TextEditingController();
  final TextEditingController _hargaSatuanController = TextEditingController();
  final TextEditingController _keteranganController = TextEditingController();

  @override
  void initState() {
    _namaBiayaKegiatanController.text = widget.biayaKegiatanArgs.usulanKegiatan.biayaKegiatan[widget.biayaKegiatanArgs.index].namaBiayaKegiatan;
    _kuantitiController.text = widget.biayaKegiatanArgs.usulanKegiatan.biayaKegiatan[widget.biayaKegiatanArgs.index].kuantiti.toString();
    _hargaSatuanController.text = widget.biayaKegiatanArgs.usulanKegiatan.biayaKegiatan[widget.biayaKegiatanArgs.index].hargaSatuan.toString();
    _keteranganController.text = widget.biayaKegiatanArgs.usulanKegiatan.biayaKegiatan[widget.biayaKegiatanArgs.index].keterangan.toString();
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
              const CustomMobileTitle(
                  text: 'Pengajuan - Kegiatan - Usulan Kegiatan'),
              const CustomFieldSpacer(),
              CustomContentBox(
                children: [
                  customBoxTitle('Biaya Kegiatan'),
                  const CustomFieldSpacer(),
                  buildTitle('Nama Biaya Kegiatan'),
                  CustomTextField(
                    controller: _namaBiayaKegiatanController,
                  ),
                  const CustomFieldSpacer(),
                  buildTitle('Qty'),
                  CustomTextField(
                    textInputType: TextInputType.number,
                    controller: _kuantitiController,
                  ),
                  const CustomFieldSpacer(),
                  buildTitle('Harga Satuan'),
                  CustomTextField(
                    textInputType: TextInputType.number,
                    controller: _hargaSatuanController,
                  ),

                  const CustomFieldSpacer(),
                  buildTitle('Keterangan'),
                  CustomTextField(
                    controller: _keteranganController,
                  ),
                  const CustomFieldSpacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomMipokaButton(
                        onTap: () => Navigator.pop(context),
                        text: 'Sebelumnya',
                      ),
                      const SizedBox(width: 8.0),
                      CustomMipokaButton(
                        onTap: () {
                          if (_namaBiayaKegiatanController.text.isNotEmpty &&
                              _kuantitiController.text.isNotEmpty &&
                              _hargaSatuanController.text.isNotEmpty &&
                              _keteranganController.text.isNotEmpty) {
                            try {
                              final kuantiti = int.tryParse(_kuantitiController.text);
                              final hargaSatuan = int.tryParse(_hargaSatuanController.text);

                              if (kuantiti != null && hargaSatuan != null) {

                                final usulanKegiatan = widget.biayaKegiatanArgs.usulanKegiatan;
                                final biayaKegiatan = usulanKegiatan.biayaKegiatan[widget.biayaKegiatanArgs.index];

                                final newBiayaKegiatan = biayaKegiatan.copyWith(
                                  namaBiayaKegiatan: _namaBiayaKegiatanController.text,
                                  kuantiti: kuantiti,
                                  hargaSatuan: hargaSatuan,
                                  total: kuantiti * hargaSatuan,
                                  keterangan: _keteranganController.text,
                                );

                                usulanKegiatan.biayaKegiatan[widget.biayaKegiatanArgs.index] = BiayaKegiatanModel.fromEntity(newBiayaKegiatan);

                                Navigator.pop(
                                  context,
                                  usulanKegiatan.copyWith(
                                    biayaKegiatan: usulanKegiatan.biayaKegiatan,
                                  ),
                                );

                              } else {
                                mipokaCustomToast(dataTypeErrorMessage);
                              }
                            } catch (e) {
                              mipokaCustomToast(dataTypeErrorMessage);
                            }
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

