import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/bloc/berita_bloc/berita_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/login_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_login_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/register_textfield.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _namaLengkapController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _noTelController = TextEditingController();
  final TextEditingController _semesterController = TextEditingController();
  final TextEditingController _kelasController = TextEditingController();
  final TextEditingController _prodiController = TextEditingController();
  User? user = FirebaseAuth.instance.currentUser;
  
  @override
  Widget build(BuildContext context) {
    bool darkMode = false;

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
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            child: CustomContentBox(
              children: [

                const SizedBox(height: 20),

                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Daftar',
                    style: loginTitle,
                  ),
                ),

                const SizedBox(height: 20),

                RegisterTextField(
                  controller: _emailController,
                  title: 'Email',
                ),

                RegisterTextField(
                  controller: _passwordController,
                  title: "Password",
                  textInputType: TextInputType.visiblePassword,
                ),

                RegisterTextField(
                  controller: _namaLengkapController,
                  title: "Nama Lengkap",
                ),

                RegisterTextField(
                  controller: _nimController,
                  title: "NIM",
                  textInputType: TextInputType.number,
                ),

                RegisterTextField(
                  controller: _noTelController,
                  title: "Nomor Telepon",
                  textInputType: TextInputType.phone,
                ),

                RegisterTextField(
                  controller: _semesterController,
                  title: "Semester",
                  textInputType: TextInputType.number,
                ),

                RegisterTextField(
                  controller: _kelasController,
                  title: "Kelas",
                ),

                RegisterTextField(
                  controller: _prodiController,
                  title: "Prodi",
                ),

                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [

                      // LoginButton(
                      //   onTap: () {
                      //     registerUser(_emailController.text, _passwordController.text);
                      //     // Navigator.pushNamed(context, penggunaBerandaPageRoute);
                      //   },
                      //   title: 'Sign In',
                      // ),

                      const CustomFieldSpacer(height: 8.0),


                      LoginButton(
                        title: 'Daftar',
                        onTap:() async {
                          try {
                            String email = _emailController.text;
                            String password = _passwordController.text;

                            if (email.isNotEmpty && password.isNotEmpty) {
                              UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                email: email,
                                password: password,
                              );

                              User? user = FirebaseAuth.instance.currentUser;

                              Navigator.pushNamed(context, penggunaBerandaPageRoute);
                              // Navigator.pushNamed(context, kemahasiswaanBerandaPageRoute),
                              // Navigator.pushNamed(context, pemeriksaDaftarLaporanKegiatanPageRoute),
                            } else {
                              if (kDebugMode) {
                                print('Email and Password cannot be empty.');
                              }
                            }
                          } catch (e) {
                            if (kDebugMode) {
                              print('Failed to sign in. Please check your email and password.');
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Fungsi untuk mendaftarkan pengguna
Future<void> registerUser(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  } catch (e) {
  }
}

Future<void> loginUser(String email, String password) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  } catch (e) {
    throw 'Failed to sign in: $e';
  }
}