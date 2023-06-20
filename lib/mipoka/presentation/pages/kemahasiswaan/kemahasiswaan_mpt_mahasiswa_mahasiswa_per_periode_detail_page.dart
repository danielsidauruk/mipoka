import 'package:flutter/material.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_add_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_date_picker_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_filter_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_icon_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';

class KemahasiswaanMPTMahasiswaRiwayatKegiatanMahasiswaDetailPage extends StatefulWidget {
  const KemahasiswaanMPTMahasiswaRiwayatKegiatanMahasiswaDetailPage({super.key});

  @override
  State<KemahasiswaanMPTMahasiswaRiwayatKegiatanMahasiswaDetailPage> createState() => _KemahasiswaanMPTMahasiswaRiwayatKegiatanMahasiswaDetailPageState();
}

class _KemahasiswaanMPTMahasiswaRiwayatKegiatanMahasiswaDetailPageState extends State<KemahasiswaanMPTMahasiswaRiwayatKegiatanMahasiswaDetailPage> {
  final TextEditingController _periodeController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _namaMahasiswaController = TextEditingController();
  final TextEditingController _jenisKegiatanController = TextEditingController();
  final TextEditingController _keteranganMahasiswaController = TextEditingController();
  final TextEditingController _poinController = TextEditingController();
  bool jenisPartisipan = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MipokaMobileAppBar(),

      drawer: const MobileCustomKemahasiswaanDrawer(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              const CustomMobileTitle(text: 'Kemahasiswaan - MPT Mahasiswa - Detail Mahasiswa per Periode'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [
                  buildTitle('Periode'),
                  CustomTextField(controller: _periodeController),

                  const CustomFieldSpacer(),

                  buildTitle('NIM'),
                  CustomTextField(
                    controller: _nimController,
                    textInputType: TextInputType.number,
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Nama Mahasiswa'),
                  CustomTextField(controller: _namaMahasiswaController),

                  const CustomFieldSpacer(),

                  buildTitle('Jenis Kegiatan'),
                  CustomTextField(controller: _jenisKegiatanController),

                  const CustomFieldSpacer(),

                  buildTitle('Keterangan Mahasiswa'),
                  CustomTextField(controller: _jenisKegiatanController),

                  const CustomFieldSpacer(),

                  buildTitle('File Unggahan'),
                  CustomIconButton(
                    text: 'loremipsum.pdf',
                    onTap: () {},
                    icon: Icons.picture_as_pdf,
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Keterangan Kemahasiswaan'),
                  CustomTextField(controller: _keteranganMahasiswaController),

                  const CustomFieldSpacer(),

                  buildTitle('Poin'),
                  CustomTextField(
                    controller: _poinController,
                    textInputType: TextInputType.number,
                  ),

                  const CustomFieldSpacer(),

                  Row(
                    children: [
                      buildTitle('Status Verifikasi'),
                      const SizedBox(width: 4.0),
                      Switch(
                        value: jenisPartisipan,
                        onChanged: (bool newValue) {
                          setState(() => jenisPartisipan = newValue);
                        },
                      ),
                      const SizedBox(width: 4.0),
                      Expanded(
                        child: jenisPartisipan == false
                            ? buildTitle('Ditolak')
                            : buildTitle('Disetujui'),
                      ),
                    ],
                  ),

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
