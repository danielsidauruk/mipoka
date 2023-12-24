import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/uniqe_id_generator.dart';
import 'package:mipoka/mipoka/domain/entities/partisipan.dart';
import 'package:mipoka/mipoka/domain/entities/usulan_kegiatan.dart';
import 'package:mipoka/mipoka/presentation/bloc/usulan_kegiatan_bloc/usulan_kegiatan_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_date_picker_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';

class TambahDataPesertaLuarKotaPage extends StatefulWidget {
  const TambahDataPesertaLuarKotaPage({
    super.key,
    required this.usulanKegiatan,
  });

  final UsulanKegiatan usulanKegiatan;

  @override
  State<TambahDataPesertaLuarKotaPage> createState() => _TambahDataPesertaLuarKotaPageState();
}

class _TambahDataPesertaLuarKotaPageState extends State<TambahDataPesertaLuarKotaPage> {

  final TextEditingController _noIndukController = TextEditingController();
  final TextEditingController _namaPartisipanController = TextEditingController();
  final TextEditingController _nikController = TextEditingController();
  final TextEditingController _tempatLahirController = TextEditingController();
  final TextEditingController _peranController = TextEditingController();
  final TextEditingController _dasarPengirimanController = TextEditingController();
  final TextEditingController _tglLahirController = TextEditingController();

  User? user = FirebaseAuth.instance.currentUser;

  @override
  void dispose() {
    context.read<UsulanKegiatanBloc>().close();
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

              const CustomMobileTitle(text: 'Pengajuan - Kegiatan - Usulan Kegiatan'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [

                  customBoxTitle('Data Partisipan'),

                  const CustomFieldSpacer(),

                  buildTitle('NIM/NIP'),
                  CustomTextField(
                    controller: _noIndukController,
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Nama Lengkap'),
                  CustomTextField(controller: _namaPartisipanController),

                  const CustomFieldSpacer(),

                  buildTitle('NIK'),
                  CustomTextField(controller: _nikController),

                  const CustomFieldSpacer(),

                  buildTitle('Tempat Lahir'),
                  CustomTextField(controller: _tempatLahirController),

                  const CustomFieldSpacer(),

                  buildTitle('Tanggal Lahir'),
                  CustomDatePickerField(
                    controller: _tglLahirController,
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Peran'),
                  CustomTextField(controller: _peranController),

                  const CustomFieldSpacer(),

                  buildTitle('Dasar Pengiriman'),
                  CustomTextField(controller: _dasarPengirimanController),

                  const CustomFieldSpacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomMipokaButton(
                        onTap: () => Navigator.pop(context),
                        text: 'Batal',
                      ),

                      const SizedBox(width: 8.0),

                      CustomMipokaButton(
                        onTap: () {
                          if (_noIndukController.text.isEmpty) {
                            mipokaCustomToast(emptyFieldPrompt("NIM/NIP"));
                          } else if (_namaPartisipanController.text.isEmpty) {
                            mipokaCustomToast(emptyFieldPrompt("Nama Partisipan"));
                          } else if (_nikController.text.isEmpty) {
                            mipokaCustomToast(emptyFieldPrompt("NIK"));
                          } else if (_tempatLahirController.text.isEmpty) {
                            mipokaCustomToast(emptyFieldPrompt("Tempat Lahir"));
                          } else if (_tglLahirController.text.isEmpty) {
                            mipokaCustomToast(emptyFieldPrompt("Tanggal Lahir"));
                          } else if (_peranController.text.isEmpty) {
                            mipokaCustomToast(emptyFieldPrompt("Peran"));
                          } else if (_dasarPengirimanController.text.isEmpty) {
                            mipokaCustomToast(emptyFieldPrompt("Dasar Pengiriman"));
                          } else {
                            int uniqueId = UniqueIdGenerator.generateUniqueId();
                            String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

                            Navigator.pop(
                              context,
                              widget.usulanKegiatan.copyWith(
                                  partisipan: [
                                    ...widget.usulanKegiatan.partisipan,
                                    Partisipan(
                                      idPartisipan: uniqueId,
                                      noInduk: _noIndukController.text,
                                      namaPartisipan: _namaPartisipanController.text,
                                      nik: _nikController.text,
                                      tempatLahir: _tempatLahirController.text,
                                      tglLahir: _tglLahirController.text,
                                      peranPartisipan: _peranController.text,
                                      dasarPengiriman: _dasarPengirimanController.text,
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
                        text: 'Tambahkan Partisipan',
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
