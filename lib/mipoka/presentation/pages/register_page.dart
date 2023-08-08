import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/uniqe_id_generator.dart';
import 'package:mipoka/mipoka/domain/entities/mipoka_user.dart';
import 'package:mipoka/mipoka/presentation/bloc/mipoka_user_bloc/mipoka_user_bloc.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_beranda_tambah_berita.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_picker.dart';
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

  final StreamController<String?> _profileStream = StreamController<String?>.broadcast();
  FilePickerResult? result;
  Uint8List? bytes;

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
        child: Center(
          child: SizedBox(
            width: 500,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    controller: _nimController,
                    title: "NIM",
                    textInputType: TextInputType.number,
                  ),

                  RegisterTextField(
                    controller: _namaLengkapController,
                    title: "Nama Lengkap",
                  ),

                  RegisterTextField(
                    controller: _emailController,
                    title: 'Email',
                  ),

                  RegisterTextField(
                    controller: _noHpController,
                    title: "Nomor Telepon",
                    textInputType: TextInputType.phone,
                  ),

                  const CustomFieldSpacer(),

                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Prodi",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 16,),
                    ),
                  ),

                  const CustomFieldSpacer(),

                  MipokaCustomDropdown(
                    items: listProdi,
                    onValueChanged: (value) {
                      _prodiController.text = value ?? "";
                    },
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
                    controller: _passwordController,
                    title: 'Password',
                    obscuredText: true,
                  ),

                  const CustomFieldSpacer(),

                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Foto Profil",
                      style: TextStyle(fontSize: 16,),
                    ),
                  ),

                  const CustomFieldSpacer(),

                  StreamBuilder<String?>(
                    stream: _profileStream.stream,
                    builder: (context, snapshot) {
                      String text = snapshot.data ?? "";
                      return CustomFilePickerButton(
                        onTap: () async {
                          result = await FilePicker.platform.pickFiles();
                          _profileStream.add(result?.names.first ?? "");
                        },
                        onDelete: () {
                          _profileStream.add("");
                        },
                        text: text,
                      );
                    },
                  ),

                  const CustomFieldSpacer(),

                  SizedBox(
                    width: 500,
                    child: LoginButton(
                      title: 'Daftar',
                      onTap: () async {
                        int? semester = int.tryParse(_semesterController.text);
                        String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
                        String? fotoProfilUrl;

                        if (_nimController.text.isEmpty) {
                          mipokaCustomToast(emptyFieldPrompt("NIM"));
                        } else if (_namaLengkapController.text.isEmpty) {
                          mipokaCustomToast(emptyFieldPrompt("Nama Lengkap"));
                        } else if(_emailController.text.isEmpty) {
                          mipokaCustomToast(emptyFieldPrompt("Email"));
                        } else if (_noHpController.text.isEmpty) {
                          mipokaCustomToast(emptyFieldPrompt("No. Hp"));
                        } else if (_prodiController.text.isEmpty) {
                          mipokaCustomToast(emptyFieldPrompt("Prodi"));
                        } else if (_semesterController.text.isEmpty) {
                          mipokaCustomToast(emptyFieldPrompt("Semester"));
                        } else if (semester == null) {
                          mipokaCustomToast(dataTypeFalsePrompt("Semester"));
                        } else if (_kelasController.text.isEmpty) {
                          mipokaCustomToast(emptyFieldPrompt("Kelas"));
                        } else if (_passwordController.text.isEmpty) {
                          mipokaCustomToast(emptyFieldPrompt("Password"));
                        }  else if (result == null) {
                          mipokaCustomToast(emptyFieldPrompt("Foto Profil"));
                        } else {

                          try {
                            UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                              email: _emailController.text,
                              password: _passwordController.text,
                            );

                            mipokaCustomToast("Pendaftaran sedang diproses.");

                            if (kIsWeb) {
                              bytes = result?.files.first.bytes;
                            } else if (Platform.isAndroid) {
                              bytes = await File(result!.files.first.path!).readAsBytes();
                            }

                            if (bytes != null) {
                              int uniqueId = UniqueIdGenerator.generateUniqueId();
                              fotoProfilUrl = await uploadBytesToFirebase(bytes!, "$uniqueId${result!.files.first.name}");
                            }

                            if (context.mounted) {
                              context.read<MipokaUserBloc>().add(
                                CreateMipokaUserEvent(
                                  mipokaUser: MipokaUser(
                                    idUser: userCredential.user?.uid ?? "",
                                    ormawa: const [],
                                    email: _emailController.text,
                                    namaLengkap: _namaLengkapController.text,
                                    nim: _nimController.text,
                                    noHp: _noHpController.text,
                                    image: fotoProfilUrl ?? "",
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
                        }
                      },
                    ),
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
                      const Text("Sudah punya akun? "),
                      InkWell(
                        onTap: () => Navigator.pushNamed(context, loginPageRoute),
                        child: const Text(
                          'Masuk',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}