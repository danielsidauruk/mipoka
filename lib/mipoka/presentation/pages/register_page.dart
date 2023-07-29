import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/domain/entities/mipoka_user.dart';
import 'package:mipoka/mipoka/presentation/bloc/mipoka_user_bloc/mipoka_user_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/login_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
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

  @override
  void initState() {
    _prodiController.text = listProdi[0];
    super.initState();
  }

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

                const CustomFieldSpacer(),

                const Text(
                  "Prodi",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 16,),
                ),

                const CustomFieldSpacer(),

                MipokaCustomDropdown(
                  items: listProdi,
                  onValueChanged: (value) {
                    _prodiController.text = value ?? "";
                  },
                ),

                LoginButton(
                  title: 'Daftar',
                  onTap:() async {
                    if(_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty &&
                        _namaLengkapController.text.isNotEmpty && _nimController.text.isNotEmpty &&
                        _noHpController.text.isNotEmpty && _semesterController.text.isNotEmpty &&
                        _kelasController.text.isNotEmpty && _prodiController.text.isNotEmpty) {
                      try {
                        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );

                        int semester = int.parse(_semesterController.text);
                        String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

                        if (context.mounted) {
                          mipokaCustomToast(savingDataMessage);

                          context.read<MipokaUserBloc>().add(
                            CreateMipokaUserEvent(
                              mipokaUser: MipokaUser(
                                idUser: userCredential.user?.uid ?? "",
                                ormawa: const [],
                                email: _emailController.text,
                                namaLengkap: _namaLengkapController.text,
                                nim: _nimController.text,
                                noHp: _noHpController.text,
                                image: "",
                                pointMpt: 0,
                                semester: semester,
                                kelas: _kelasController.text,
                                periodeMpt: "",
                                statusMpt: "",
                                role: mahasiswa,
                                prodi: _prodiController.text,
                                createdAt: currentDate,
                                updatedAt: currentDate,
                                createdBy: _emailController.text,
                                updatedBy: _emailController.text,
                              ),
                            ),
                          );
                        }
                      } catch (e) {
                        mipokaCustomToast(e.toString());
                      }
                    } else {
                      mipokaCustomToast("all fields cannot be empty");
                    }
                  },
                ),

                BlocListener<MipokaUserBloc, MipokaUserState>(
                  listenWhen: (prev, current) =>
                  prev.runtimeType != current.runtimeType,
                  listener: (context, state) async {
                    if (state is MipokaUserSuccess) {

                      mipokaCustomToast('Akun anda telah terdaftar');
                      Navigator.pushNamed(context, penggunaBerandaPageRoute);

                    } else if (state is MipokaUserError) {
                      mipokaCustomToast(state.message);
                    }
                  },
                  child: const SizedBox(),
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