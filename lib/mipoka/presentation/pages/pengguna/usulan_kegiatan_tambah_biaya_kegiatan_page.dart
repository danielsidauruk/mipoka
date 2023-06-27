import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/domain/entities/biaya_kegiatan.dart';
import 'package:mipoka/mipoka/presentation/bloc/biaya_kegiatan_bloc/biaya_kegiatan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/cubit/pengajuan_kegiatan_cubit.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsulanKegiatanTambahBiayaKegiatanPage extends StatefulWidget {
  const UsulanKegiatanTambahBiayaKegiatanPage({
    super.key,
    required this.idUsulanKegiatan,
  });

  final int idUsulanKegiatan;

  @override
  State<UsulanKegiatanTambahBiayaKegiatanPage> createState() => _UsulanKegiatanTambahBiayaKegiatanPageState();
}

class _UsulanKegiatanTambahBiayaKegiatanPageState extends State<UsulanKegiatanTambahBiayaKegiatanPage> {
  final TextEditingController _namaBiayaKegiatanController = TextEditingController();
  final TextEditingController _kuantitiController = TextEditingController();
  final TextEditingController _hargaSatuanController = TextEditingController();
  final TextEditingController _keteranganController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PengajuanKegiatanCubit(),
      child: Scaffold(
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
                BlocBuilder<PengajuanKegiatanCubit, PengajuanKegiatanState>(
                  builder: (context, state) {
                    return CustomContentBox(
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
                                if (
                                _namaBiayaKegiatanController.text.isNotEmpty && _kuantitiController.text.isNotEmpty &&
                                    _hargaSatuanController.text.isNotEmpty && _keteranganController.text.isNotEmpty) {
                                  BlocProvider.of<BiayaKegiatanBloc>(context).add(
                                    CreateBiayaKegiatanEvent(
                                      BiayaKegiatan(
                                        idBiayaKegiatan: 1,
                                        namaBiayaKegiatan: _namaBiayaKegiatanController.text,
                                        kuantiti: int.parse(_kuantitiController.text),
                                        hargaSatuan: int.parse(_hargaSatuanController.text),
                                        total: int.parse(_kuantitiController.text) * int.parse(_hargaSatuanController.text),
                                        keterangan: _keteranganController.text,
                                        createdAt: '',
                                        createdBy: '',
                                        updatedAt: '',
                                        updatedBy: '',
                                      ),
                                    ),
                                  );
                                  Navigator.pop(context);
                                } else {
                                  if (kDebugMode) {
                                    print('Text field cannot be empty');
                                  }
                                }
                              },
                              text: 'Tambahkan',
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

