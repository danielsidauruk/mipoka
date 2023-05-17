import 'package:flutter/material.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/Method/open_file_picker_method.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_picker.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';

class MobileGantiPasswordPage extends StatefulWidget {
  const MobileGantiPasswordPage({super.key});

  @override
  State<MobileGantiPasswordPage> createState() => _MobileGantiPasswordPageState();
}

class _MobileGantiPasswordPageState extends State<MobileGantiPasswordPage> {
  TextEditingController _kataSandiLamaController = TextEditingController();
  TextEditingController _kataSandiBaruController = TextEditingController();
  TextEditingController _kataSandiBaru2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: const MipokaAppBar(),

      drawer: const MobileCustomPenggunaDrawerWidget(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              const CustomMobileTitle(text: 'Ganti Password'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [
                  buildTitle('Masukkan Kata Sandi Lama'),
                  CustomTextField(controller: _kataSandiLamaController),

                  const CustomFieldSpacer(),

                  buildTitle('Masukkan Kata Sandi Baru'),
                  CustomTextField(controller: _kataSandiBaruController),

                  const CustomFieldSpacer(),

                  buildTitle('Ulangi Kata Sandi Baru'),
                  CustomTextField(controller: _kataSandiBaru2Controller),

                  const CustomFieldSpacer(),
                  
                  CustomButton(
                    onTap: () => Navigator.pop(context),
                    text: 'Ganti Password',
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
