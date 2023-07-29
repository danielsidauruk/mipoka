import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/uniqe_id_generator.dart';
import 'package:mipoka/mipoka/domain/entities/tertib_acara.dart';
import 'package:mipoka/mipoka/domain/entities/usulan_kegiatan.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_time_picker_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';

class TambahTertibAcaraPage extends StatefulWidget {
  const TambahTertibAcaraPage({
    super.key,
    required this.usulanKegiatan,
  });

  final UsulanKegiatan usulanKegiatan;

  @override
  State<TambahTertibAcaraPage> createState() => _TambahTertibAcaraPageState();
}

class _TambahTertibAcaraPageState extends State<TambahTertibAcaraPage> {

  final TextEditingController _waktuMulaiController = TextEditingController();
  final TextEditingController _waktuSelesaiController = TextEditingController();
  final TextEditingController _aktivitasController = TextEditingController();
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
                          if (_waktuMulaiController.text.isNotEmpty && _waktuSelesaiController.text.isNotEmpty
                              && _aktivitasController.text.isNotEmpty && _keteranganController.text.isNotEmpty)
                          {
                            int uniqueId = UniqueIdGenerator.generateUniqueId();

                            Navigator.pop(
                              context,
                              widget.usulanKegiatan.copyWith(
                                tertibAcara: [
                                  ...widget.usulanKegiatan.tertibAcara,
                                  TertibAcara(
                                    idTertibAcara: uniqueId,
                                    waktuMulai: _waktuMulaiController.text,
                                    waktuSelesai: _waktuSelesaiController.text,
                                    aktivitas: _aktivitasController.text,
                                    keterangan: _keteranganController.text,
                                    createdAt: currentDate,
                                    createdBy: user?.email ?? "unknown",
                                    updatedAt: currentDate,
                                    updatedBy: user?.email ?? "unknown",
                                  ),
                                ],
                              ),
                            );

                          } else {
                            mipokaCustomToast(emptyFieldMessage);
                          }
                        },
                        text: 'Tambahkan Tertib Acara',
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
