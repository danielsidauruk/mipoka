import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/bloc/mipoka_user_bloc/mipoka_user_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/login_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_login_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void dispose() {
    context.read<MipokaUserBloc>().close();
    super.dispose();
  }

  @override
  void initState() {
    if (user != null) {
      context.read<MipokaUserBloc>().add(
          ReadMipokaUserEvent(idMipokaUser: user!.uid));
    }
    super.initState();
  }

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                const SizedBox(height: 40),

                Text(
                  'LOGIN',
                  style: loginTitle,
                ),

                const SizedBox(height: 80),

                MipokaCustomLoginTextField(
                  controller: _emailController,
                  hintText: "Email",
                ),

                MipokaCustomLoginTextField(
                  controller: _passwordController,
                  hintText: "Password",
                  obscuredText: true,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, lupaPasswordPageRoute),
                      child: Text(
                        'Forget Password?',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: Colors.grey),
                      ),
                    ),
                  ],
                ),

                const CustomFieldSpacer(height: 8.0),

                SizedBox(
                  width: 450,
                  child: LoginButton(
                    // title: 'Log in - Pengguna',
                    title: 'Log in',
                    onTap:() async {
                      // Navigator.pushNamed(context, penggunaBerandaPageRoute);
                      String email = _emailController.text;
                      String password = _passwordController.text;

                      if (email.isNotEmpty && password.isNotEmpty) {
                        mipokaCustomToast("Autentikasi Akun ...");

                        try {
                          UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: email,
                            password: password,
                          );

                          if (context.mounted) {
                            context.read<MipokaUserBloc>().add(
                                ReadMipokaUserEvent(idMipokaUser: userCredential.user!.uid));

                            // if (email == "mipoka.admin@gmail.com") {
                            //   Navigator.pushNamedAndRemoveUntil(
                            //     context,
                            //     mipokaAdminDashboardRoute,
                            //         (route) => false,
                            //   );
                            // } else  if (email == "tommychristian24@gmail.com") {
                            //   Navigator.pushNamedAndRemoveUntil(
                            //     context,
                            //     kemahasiswaanBerandaPageRoute,
                            //         (route) => false,
                            //   );
                            // } else if (email == "hafizsritonga08@gmail.com") {
                            //   Navigator.pushNamedAndRemoveUntil(
                            //     context,
                            //     pemeriksaDaftarUsulanKegiatanPageRoute,
                            //         (route) => false,
                            //   );
                            // } else {
                            //     Navigator.pushNamedAndRemoveUntil(
                            //       context,
                            //       penggunaBerandaPageRoute,
                            //           (route) => false,
                            //     );
                            // }
                          }
                        } catch (e) {
                          mipokaCustomToast(
                            "Gagal masuk. Periksa email dan kata sandi Anda.",
                          );
                        }
                      } else {
                        mipokaCustomToast("Email dan Kata Sandi tidak boleh kosong.");
                      }
                    },
                  ),
                ),

                  BlocListener<MipokaUserBloc, MipokaUserState>(
                  listenWhen: (prev, current) =>
                  prev.runtimeType != current.runtimeType,
                  listener: (context, state) {
                    if (state is MipokaUserHasData) {
                      mipokaCustomToast("Berhasil Masuk!");
                      final mipokaUser = state.mipokaUser;

                      if (mipokaUser.role == mipokaAdmin) {
                        Navigator.pushNamedAndRemoveUntil(
                            context,
                            mipokaAdminDashboardRoute,
                                (route) => false);
                      } else if (mipokaUser.role == kemahasiswaan) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          kemahasiswaanBerandaPageRoute,
                              (route) => false,
                        );
                      } else if (mipokaUser.role == pembina) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          pemeriksaDaftarUsulanKegiatanPageRoute,
                              (route) => false,
                        );
                      } else {
                        Navigator.pushNamedAndRemoveUntil(
                            context,
                            penggunaBerandaPageRoute,
                                (route) => false);
                        // Navigator.pushNamed(context, penggunaBerandaPageRoute);
                      }
                    } else if (state is MipokaUserError) {
                      mipokaCustomToast(state.message);
                    }
                  },
                  child: const SizedBox(),
                  // builder: (context, state) {
                  //   if (state is MipokaUserHasData) {
                  //     final mipokaUser = state.mipokaUser;
                  //
                  //     if (mipokaUser.role == kemahasiswaan) {
                  //       return const KemahasiswaanBerandaPage();
                  //     } else if (mipokaUser.role == pembina) {
                  //       return const PemeriksaDaftarPengajuanKegiatanPage();
                  //     } else if (mipokaUser.role == mipokaAdmin) {
                  //       return const MipokaAdminDashboard();
                  //     } else {
                  //       return const PenggunaBerandaPage();
                  //     }
                  //   } else {
                  //     return const LoginPage();
                  //   }
                  // },
                ),

                const CustomFieldSpacer(height: 8.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have a Account? "),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, registrationPageRoute),
                      child: const Text(
                        'Register',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 80),

                Container(
                  width: 250,
                  decoration:
                  BoxDecoration(border: Border.all(color: Colors.white)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Switch(
                        value: darkMode,
                        onChanged: (value) {
                          setState(() => darkMode = value);
                        },
                      ),
                      const Text(
                        'Dark Mode',
                        style: TextStyle(fontWeight: FontWeight.bold),
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