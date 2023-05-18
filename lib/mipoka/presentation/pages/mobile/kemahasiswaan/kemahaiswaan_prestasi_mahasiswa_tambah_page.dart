import 'package:flutter/material.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_dropdown_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';

class KemahasiswaanPrestasiMahasiswaTambahPage extends StatefulWidget {
  const KemahasiswaanPrestasiMahasiswaTambahPage({super.key});

  @override
  State<KemahasiswaanPrestasiMahasiswaTambahPage> createState() => _KemahasiswaanPrestasiMahasiswaTambahPageState();
}

class _KemahasiswaanPrestasiMahasiswaTambahPageState extends State<KemahasiswaanPrestasiMahasiswaTambahPage> {
  String namaOrmawaValue = listNamaOrmawa[0];
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _namaMahasiswaController = TextEditingController();
  final TextEditingController _namaKegiatanController = TextEditingController();
  String tingkatValue = listTingkat[0];
  String yearValue = DateTime.now().year.toString();
  final TextEditingController _prestasiYangDicapaiController = TextEditingController();

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

              const CustomMobileTitle(text: 'Kemahasiswaan - Tambah Prestasi Mahasiswa'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [

                  buildTitle('Nama Ormawa'),
                  CustomDropdownButton(
                    value: namaOrmawaValue,
                    items: listNamaOrmawa,
                    onChanged: (String? value) {
                      setState(() => namaOrmawaValue = value!);
                    },
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('NIM'),
                  CustomTextField(controller: _nimController),

                  const CustomFieldSpacer(),

                  buildTitle('Nama Mahasiswa'),
                  CustomTextField(controller: _namaMahasiswaController),

                  const CustomFieldSpacer(),

                  buildTitle('Nama Kegiatan'),
                  CustomTextField(controller: _namaKegiatanController),

                  const CustomFieldSpacer(),

                  buildTitle('Waktu Penyelenggaraan'),
                  CustomDropdownButton(
                    value: yearValue,
                    items: years,
                    onChanged: (String? value) {
                      setState(() => yearValue = value!);
                    },
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Tingkat'),
                  CustomDropdownButton(
                    value: tingkatValue,
                    items: listTingkat,
                    onChanged: (String? value) {
                      setState(() => tingkatValue = value!);
                    },
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Prestasi yang dicapai'),
                  CustomTextField(controller: _prestasiYangDicapaiController),

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
