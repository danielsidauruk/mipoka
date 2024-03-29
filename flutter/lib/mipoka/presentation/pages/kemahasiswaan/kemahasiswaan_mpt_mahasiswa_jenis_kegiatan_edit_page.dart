import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/domain/entities/jenis_kegiatan_mpt.dart';
import 'package:mipoka/mipoka/presentation/bloc/jenis_kegiatan_mpt/jenis_kegiatan_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';

class KemahasiswaanMPTMahasiswaJenisKegiatanEditPage extends StatefulWidget {
  const KemahasiswaanMPTMahasiswaJenisKegiatanEditPage({
    required this.jenisKegiatanMpt,
    super.key,
  });

  final JenisKegiatanMpt jenisKegiatanMpt;

  @override
  State<KemahasiswaanMPTMahasiswaJenisKegiatanEditPage> createState() => _KemahasiswaanMPTMahasiswaJenisKegiatanEditPageState();
}

class _KemahasiswaanMPTMahasiswaJenisKegiatanEditPageState extends State<KemahasiswaanMPTMahasiswaJenisKegiatanEditPage> {

  final TextEditingController _namaJenisKegiatanController = TextEditingController();
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    _namaJenisKegiatanController.text = widget.jenisKegiatanMpt.namaJenisKegiatanMpt;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MipokaMobileAppBar(),

      drawer: const CustomKemahasiswaanDrawer(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              const CustomMobileTitle(text: 'Kemahasiswaan - MPT Mahasiswa - Tambah Jenis Kegiatan'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [
                  
                  buildTitle('Nama Jenis Kegiatan'),

                  CustomTextField(controller: _namaJenisKegiatanController),

                  const CustomFieldSpacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomMipokaButton(
                        onTap: () => Navigator.pop(context),
                        text: 'Kembali',
                      ),

                      const SizedBox(width: 8.0),

                      CustomMipokaButton(
                        onTap: () {
                          if (_namaJenisKegiatanController.text.isEmpty) {
                            mipokaCustomToast(
                                emptyFieldPrompt("Nama Jenis Kegiatan"));
                          } else {
                            mipokaCustomToast(savingDataMessage);

                            String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

                            Navigator.pop(
                              context,
                              widget.jenisKegiatanMpt.copyWith(
                                namaJenisKegiatanMpt: _namaJenisKegiatanController
                                    .text,
                                updatedAt: currentDate,
                                updatedBy: user?.email ?? "",
                              ),
                            );
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
