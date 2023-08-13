import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/multiple_args.dart';
import 'package:mipoka/mipoka/data/models/tertib_acara_model.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_time_picker_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';

class EditTertibAcaraPage extends StatefulWidget {
  const EditTertibAcaraPage({
    super.key,
    required this.tertibAcaraArgs,
  });

  final TertibAcaraArgs tertibAcaraArgs;

  @override
  State<EditTertibAcaraPage> createState() => _EditTertibAcaraPageState();
}

class _EditTertibAcaraPageState extends State<EditTertibAcaraPage> {

  final TextEditingController _waktuMulaiController = TextEditingController();
  final TextEditingController _waktuSelesaiController = TextEditingController();
  final TextEditingController _aktivitasController = TextEditingController();
  final TextEditingController _keteranganController = TextEditingController();
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    _waktuMulaiController.text = widget.tertibAcaraArgs.usulanKegiatan.tertibAcara[widget.tertibAcaraArgs.index].waktuMulai;
    _waktuSelesaiController.text =widget.tertibAcaraArgs.usulanKegiatan.tertibAcara[widget.tertibAcaraArgs.index].waktuSelesai;
    _aktivitasController.text  = widget.tertibAcaraArgs.usulanKegiatan.tertibAcara[widget.tertibAcaraArgs.index].aktivitas;
    _keteranganController.text = widget.tertibAcaraArgs.usulanKegiatan.tertibAcara[widget.tertibAcaraArgs.index].keterangan;
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

                  customBoxTitle('Tambah Tertib Acara'),

                  const CustomFieldSpacer(),

                  buildTitle('Waktu Mulai'),
                  CustomTimePickerField(controller: _waktuMulaiController),

                  const CustomFieldSpacer(),

                  buildTitle('Waktu Selesai'),
                  CustomTimePickerField(
                      controller: _waktuSelesaiController),

                  const CustomFieldSpacer(),

                  buildTitle('Aktivitas'),
                  CustomTextField(controller: _aktivitasController),

                  const CustomFieldSpacer(),

                  buildTitle('Keterangan'),
                  CustomTextField(controller: _keteranganController),

                  const CustomFieldSpacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomMipokaButton(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        text: 'Kembali',
                      ),

                      const SizedBox(width: 8.0),

                      CustomMipokaButton(
                        onTap: () {
                          if (_waktuMulaiController.text.isEmpty) {
                            mipokaCustomToast(emptyFieldPrompt("Waktu Mulai"));
                          } else if (_waktuSelesaiController.text.isEmpty) {
                            mipokaCustomToast(emptyFieldPrompt("Waktu Selesai"));
                          } else if (_aktivitasController.text.isEmpty) {
                            mipokaCustomToast(emptyFieldPrompt("Aktivitas"));
                          } else if (_keteranganController.text.isEmpty) {
                            mipokaCustomToast(emptyFieldPrompt("Keterangan"));
                          } else {

                            final usulanKegiatan = widget.tertibAcaraArgs.usulanKegiatan;
                            final tertibAcara = usulanKegiatan.tertibAcara[widget.tertibAcaraArgs.index];
                            String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

                            final newTertibAcara = tertibAcara.copyWith(
                              waktuMulai: _waktuMulaiController.text,
                              waktuSelesai: _waktuSelesaiController.text,
                              aktivitas: _aktivitasController.text,
                              keterangan: _keteranganController.text,
                              updatedAt: currentDate,
                              updatedBy: user?.email ?? "unknown",
                            );

                            usulanKegiatan.tertibAcara[widget.tertibAcaraArgs.index] = TertibAcaraModel.fromEntity(newTertibAcara);

                            Navigator.pop(
                              context,
                              usulanKegiatan.copyWith(
                                tertibAcara: usulanKegiatan.tertibAcara,
                              ),
                            );
                          }
                        },
                        text: 'Simpan',
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
