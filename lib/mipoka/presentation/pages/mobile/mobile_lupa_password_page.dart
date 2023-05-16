import 'package:flutter/material.dart';
import 'package:mipoka/core/routes.dart';
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

class MobileLupaPasswordPage extends StatefulWidget {
  const MobileLupaPasswordPage({super.key});

  @override
  State<MobileLupaPasswordPage> createState() => _MobileLupaPasswordPageState();
}

class _MobileLupaPasswordPageState extends State<MobileLupaPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: const MipokaAppBar(),

      drawer: const MobileCustomPenggunaDrawerWidget(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomContentBox(
            children: [
              customBoxTitle('Lupa Password'),
              buildDescription('Link untuk pembaruan kata sandi akan dikirim ke e-mail yang anda tulis.'),

              const CustomFieldSpacer(),

              buildTitle('Email'),
              CustomTextField(controller: _emailController),

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
                    onTap: () => Navigator.pushNamed(context, mobilePasswordBaruPageRoute),
                    text: 'Kirim',
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
