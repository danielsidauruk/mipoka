import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/domain/entities/ormawa.dart';
import 'package:mipoka/mipoka/domain/entities/user.dart';
import 'package:mipoka/mipoka/presentation/bloc/berita_bloc/berita_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/user_bloc/user_bloc.dart';
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
                  title: 'Password',
                  obscuredText: true,
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

                LoginButton(
                  title: 'Daftar',
                  onTap:() async {
                    // if (_emailController.text.isEmpty || _passwordController.text.isEmpty ||
                    //     _namaLengkapController.text.isEmpty || _nimController.text.isEmpty ||
                    //     _noTelController.text.isEmpty || _semesterController.text.isEmpty ||
                    //     _kelasController.text.isEmpty || _prodiController.text.isEmpty) {
                    //   print('Please fill all field');
                    // } else {
                    //   try {
                    //     UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    //       email: _emailController.text,
                    //       password: _passwordController.text,
                    //     );
                    //   } catch (e) {
                    //     if (kDebugMode) {
                    //       final errorMessage = e.toString();
                    //       final startIndex = errorMessage.indexOf("Firebase:");
                    //       final errorText = errorMessage.substring(startIndex);
                    //
                    //       print(errorText);
                    //     }
                    //   }
                    // }
                    try {
                      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );

                      User? user = FirebaseAuth.instance.currentUser;
                      context.read<UserBloc>().add(
                        CreateUserEvent(
                          mipokaUser: MipokaUser(
                            idUser: user?.uid ?? "",
                            idOrmawa: 0,
                            idOrmawaB: 0,
                            email: user?.email ?? "",
                            namaLengkap: _namaLengkapController.text,
                            nim: _nimController.text,
                            noHp: _noTelController.text,
                            image: "",
                            mpt: 0,
                            semester: _semesterController.text,
                            kelas: _kelasController.text,
                            periodeMpt: "",
                            status: "",
                            prodi: _prodiController.text,
                            createdAt: DateFormat('dd-MM-yyyy').format(DateTime.now()).toString(),
                            updatedAt: DateFormat('dd-MM-yyyy').format(DateTime.now()).toString(),
                            ormawa: Ormawa(
                              idOrmawa: 0,
                              namaOrmawa: "",
                              pembina: "",
                              ketua: "",
                              wakil: "",
                              bendahara: "",
                              jumlahAnggota: 0,
                              fotoPembina: "",
                              fotoKetua: "",
                              fotoWakil: "",
                              fotoBendahara: "",
                            ),
                          ),
                        ),
                      );

                      // Navigator.pushNamed(context, loginPageRoute);
                    } catch (e) {
                      if (kDebugMode) {
                        final errorMessage = e.toString();
                        final int startIndex;
                        if (e.toString().contains('Firebase:')) {
                          startIndex = errorMessage.indexOf("Firebase:");
                          print(errorMessage.substring(startIndex));
                        } else {
                          print(errorMessage);
                        }
                      }
                    }
                  },
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an Account? "),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, loginPageRoute),
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}