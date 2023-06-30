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

class GantiPasswordPage extends StatefulWidget {
  const GantiPasswordPage({super.key});

  @override
  State<GantiPasswordPage> createState() => _GantiPasswordPageState();
}

class _GantiPasswordPageState extends State<GantiPasswordPage> {
  final TextEditingController _kataSandiLamaController = TextEditingController();
  final TextEditingController _kataSandiBaruController = TextEditingController();
  final TextEditingController _kataSandiBaru2Controller = TextEditingController();

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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomMipokaButton(
                        onTap: () => Navigator.pop(context),
                        text: "Batal",
                      ),

                      const SizedBox(width: 8.0),

                      CustomMipokaButton(
                        onTap: () {
                          User? user = FirebaseAuth.instance.currentUser;
                          
                          if (_kataSandiLamaController.text.isNotEmpty && _kataSandiBaruController.text.isNotEmpty 
                              && _kataSandiBaru2Controller.text.isNotEmpty) {
                            if(_kataSandiBaruController.text == _kataSandiBaru2Controller.text) {
                              AuthCredential credential = EmailAuthProvider.credential(
                                email: user?.email ?? "",
                                password: _kataSandiLamaController.text,
                              );

                              user?.reauthenticateWithCredential(credential).then((result) {
                                user.updatePassword(_kataSandiBaruController.text)
                                    .then((_) {
                                  mipokaCustomToast("Perubahan password berhasil disimpan.");
                                  Navigator.pushNamed(context, penggunaBerandaPageRoute);})
                                    .catchError(
                                      (error) {
                                    final errorMessage = error.toString();
                                    final int startIndex;
                                    if (error.toString().contains('Firebase:')) {
                                      startIndex = errorMessage.indexOf("Firebase:");
                                      mipokaCustomToast(errorMessage.substring(startIndex));
                                    } else {
                                      mipokaCustomToast(errorMessage);
                                    }},
                                );
                              }).catchError((error) {
                                final errorMessage = error.toString();
                                final int startIndex;
                                if (error.toString().contains('Firebase:')) {
                                  startIndex = errorMessage.indexOf("Firebase:");
                                  mipokaCustomToast(errorMessage.substring(startIndex));
                                } else {
                                  mipokaCustomToast(errorMessage);
                                }
                                // mipokaCustomToast(error.toString());
                              });
                            } else {
                              mipokaCustomToast("Password baru dan Ulang password baru harus sama.");
                            }
                          } else {
                            mipokaCustomToast("Harap isi semua field yang diperlukan.");
                          }
                        },
                        text: 'Ganti Password',
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
