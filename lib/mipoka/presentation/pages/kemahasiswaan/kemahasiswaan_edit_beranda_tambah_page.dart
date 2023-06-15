import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/domain/entities/berita.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_icon_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_rich_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';

class KemahasiswaanEditBerandaTambahPage extends StatefulWidget {
  const KemahasiswaanEditBerandaTambahPage({super.key});

  @override
  State<KemahasiswaanEditBerandaTambahPage> createState() => _KemahasiswaanEditBerandaTambahPageState();
}

class _KemahasiswaanEditBerandaTambahPageState extends State<KemahasiswaanEditBerandaTambahPage> {
  final TextEditingController _judulBeritaController = TextEditingController();
  final TextEditingController _penulisController = TextEditingController();
  final QuillController _textBeritaController = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    Berita berita;

    return Scaffold(
      appBar: const MipokaMobileAppBar(),

      drawer: const MobileCustomKemahasiswaanDrawer(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomMobileTitle(text: 'Kemahasiswaan - Edit Beranda - Tambah'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [
                  buildTitle('Judul Berita'),
                  
                  CustomTextField(controller: _judulBeritaController),

                  const CustomFieldSpacer(),

                  buildTitle('Penulis'),

                  CustomTextField(controller: _penulisController),

                  const CustomFieldSpacer(),
                  
                  buildTitle('Tambah Gambar'),
                  CustomIconButton(onTap: () {}, icon: Icons.upload),

                  const CustomFieldSpacer(),

                  buildTitle('Text Berita'),
                  CustomRichTextField(controller: _textBeritaController),

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
                        onTap: () {

                          Navigator.pop(context);
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