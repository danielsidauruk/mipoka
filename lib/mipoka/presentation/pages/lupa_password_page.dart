import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
import 'package:mipoka/mipoka/presentation/widgets/open_file_picker_method.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_picker.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';

class LupaPasswordPage extends StatefulWidget {
  const LupaPasswordPage({super.key});

  @override
  State<LupaPasswordPage> createState() => _LupaPasswordPageState();
}

class _LupaPasswordPageState extends State<LupaPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          'MIPOKA',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomContentBox(
            children: [
              customBoxTitle('Lupa Password'),
              buildDescription(
                  'Link untuk pembaruan kata sandi akan dikirim ke e-mail yang anda tulis.'),
              const CustomFieldSpacer(),
              buildTitle('Email'),
              CustomTextField(controller: _emailController),
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
                    onTap: () async {
                      String email = _emailController.text;

                      try {
                        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
                        mipokaCustomToast("Password reset email sent.");
                        Navigator.pushNamed(context, loginPageRoute);
                      } catch (e) {
                        final errorMessage = e.toString();
                        final int startIndex;
                        if (e.toString().contains('[firebase_auth/user-not-found]')) {
                          startIndex = errorMessage.indexOf("[firebase_auth/user-not-found]");
                          mipokaCustomToast(errorMessage.substring(startIndex));
                        } else {
                          mipokaCustomToast(errorMessage);
                        }
                      }
                    },
                    text: 'Reset Password',
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
