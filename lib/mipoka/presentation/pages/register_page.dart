import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/domain/entities/ormawa.dart';
import 'package:mipoka/mipoka/domain/entities/mipoka_user.dart';
import 'package:mipoka/mipoka/presentation/bloc/mipoka_user_bloc/mipoka_user_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/login_button.dart';
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
  final TextEditingController _noHpController = TextEditingController();
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
                  controller: _noHpController,
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
                    try {
                      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                      User? user = FirebaseAuth.instance.currentUser;

                      context.read<MipokaUserBloc>().add(
                        CreateMipokaUserEvent(
                          mipokaUser: MipokaUser(
                            idUser: user!.uid,
                            idOrmawa: const [],
                            email: _emailController.text,
                            namaLengkap: _namaLengkapController.text,
                            nim: _nimController.text,
                            noHp: _noHpController.text,
                            image: "",
                            pointMpt: 0,
                            semester: 0,
                            kelas: "",
                            periodeMpt: "",
                            statusMpt: "",
                            prodi: "",
                            createdAt: DateFormat('dd-MM-yyyy').format(DateTime.now()),
                            updatedAt: DateFormat('dd-MM-yyyy').format(DateTime.now()),
                            createdBy: _emailController.text,
                            updatedBy: _emailController.text,
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