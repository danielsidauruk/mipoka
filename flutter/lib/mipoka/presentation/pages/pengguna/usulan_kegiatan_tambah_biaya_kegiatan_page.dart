import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/uniqe_id_generator.dart';
import 'package:mipoka/mipoka/domain/entities/biaya_kegiatan.dart';
import 'package:mipoka/mipoka/domain/entities/usulan_kegiatan.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';

class UsulanKegiatanTambahBiayaKegiatanPage extends StatefulWidget {
  const UsulanKegiatanTambahBiayaKegiatanPage({
    super.key,
    required this.usulanKegiatan,
  });

  final UsulanKegiatan usulanKegiatan;

  @override
  State<UsulanKegiatanTambahBiayaKegiatanPage> createState() => _UsulanKegiatanTambahBiayaKegiatanPageState();
}

class _UsulanKegiatanTambahBiayaKegiatanPageState extends State<UsulanKegiatanTambahBiayaKegiatanPage> {
  final TextEditingController _namaBiayaKegiatanController = TextEditingController();
  final TextEditingController _kuantitasController = TextEditingController();
  final TextEditingController _hargaSatuanController = TextEditingController();
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
                  buildTitle('Kuantitas'),
                  CustomTextField(
                    textInputType: TextInputType.number,
                    controller: _kuantitasController,
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
                          final kuantitas = int.tryParse(_kuantitasController.text);
                          final hargaSatuan = int.tryParse(_hargaSatuanController.text);

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
                          } else if (_keteranganController.text.isEmpty) {
                            mipokaCustomToast(emptyFieldPrompt("Keterangan"));
                          } else {
                            int uniqueId = UniqueIdGenerator.generateUniqueId();
                            String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

                            Navigator.pop(
                              context,
                              widget.usulanKegiatan.copyWith(
                                  biayaKegiatan: [
                                    ...widget.usulanKegiatan.biayaKegiatan,
                                    BiayaKegiatan(
                                      idBiayaKegiatan: uniqueId,
                                      namaBiayaKegiatan: _namaBiayaKegiatanController.text,
                                      kuantiti: kuantitas,
                                      hargaSatuan: hargaSatuan,
                                      total: kuantitas * hargaSatuan,
                                      keterangan: _keteranganController.text,
                                      createdAt: currentDate,
                                      createdBy: user?.email ?? "unknown",
                                      updatedAt: currentDate,
                                      updatedBy: user?.email ?? "unknown",
                                    ),
                                  ]
                              ),
                            );
                          }
                        },
                        text: 'Tambahkan',
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

