import 'package:flutter/material.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_dropdown_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/mobile_kemahasiswaan_custom_drawer.dart';

class KemahasiswaanMPTMahasiswaKegiatanPerJenisKegiatanTambahPage extends StatefulWidget {
  const KemahasiswaanMPTMahasiswaKegiatanPerJenisKegiatanTambahPage({super.key});

  @override
  State<KemahasiswaanMPTMahasiswaKegiatanPerJenisKegiatanTambahPage> createState() => _KemahasiswaanMPTMahasiswaKegiatanPerJenisKegiatanTambahPageState();
}

class _KemahasiswaanMPTMahasiswaKegiatanPerJenisKegiatanTambahPageState extends State<KemahasiswaanMPTMahasiswaKegiatanPerJenisKegiatanTambahPage> {

  final TextEditingController _namaJenisKegiatanController = TextEditingController();
  String jenisKegiatan = listBentukKegiatan[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MipokaAppBar(),

      drawer: const MobileCustomKemahasiswaanDrawer(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              const CustomMobileTitle(text: 'Kemahasiswaan - MPT Mahasiswa - Kegiatan per Jenis Kegiatan'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [
                  
                  buildTitle('Nama Jenis Kegiatan'),

                  CustomTextField(controller: _namaJenisKegiatanController),

                  const CustomFieldSpacer(),

                  buildTitle('Jenis Kegiatan'),
                  CustomDropdownButton(
                    value: jenisKegiatan,
                    items: listBentukKegiatan,
                    onChanged: (String? value) {
                      setState(() => jenisKegiatan = value!);
                    },
                  ),

                  const CustomFieldSpacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomButton(
                        onTap: () => Navigator.pop(context),
                        text: 'Kembali',
                      ),

                      const SizedBox(width: 8.0),

                      CustomButton(
                        onTap: () => Navigator.pop(context),
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
