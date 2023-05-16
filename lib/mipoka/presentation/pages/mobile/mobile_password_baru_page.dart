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

class MobilePasswordBaruPage extends StatefulWidget {
  const MobilePasswordBaruPage({super.key});

  @override
  State<MobilePasswordBaruPage> createState() => _MobilePasswordBaruPageState();
}

class _MobilePasswordBaruPageState extends State<MobilePasswordBaruPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _password1Controller = TextEditingController();

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
              customBoxTitle('Password Baru'),

              const CustomFieldSpacer(),

              buildTitle('Masukkan Password Baru'),
              CustomTextField(controller: _passwordController),

              const CustomFieldSpacer(),

              buildTitle('Ulangi Password'),
              CustomTextField(controller: _password1Controller),

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
                    onTap: () => Navigator.pushNamed(context, mobileLoginPageRoute),
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
