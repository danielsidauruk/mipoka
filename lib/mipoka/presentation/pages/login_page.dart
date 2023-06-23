import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/login_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_login_text_field.dart';

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
                        title: 'Log in - Pengguna',
                        onTap:() async {
                          Navigator.pushNamed(context, penggunaBerandaPageRoute);
                          // try {
                          //   String email = _emailController.text;
                          //   String password = _passwordController.text;
                          //
                          //   if (email.isNotEmpty && password.isNotEmpty) {
                          //     UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                          //       email: email,
                          //       password: password,
                          //     );
                          //
                          //     User? user = FirebaseAuth.instance.currentUser;
                          //
                          //     Navigator.pushNamed(context, penggunaBerandaPageRoute);
                          //     // Navigator.pushNamed(context, kemahasiswaanBerandaPageRoute),
                          //     // Navigator.pushNamed(context, pemeriksaDaftarLaporanKegiatanPageRoute),
                          //   } else {
                          //     if (kDebugMode) {
                          //       print('Email and Password cannot be empty.');
                          //     }
                          //   }
                          // } catch (e) {
                          //   if (kDebugMode) {
                          //     print('Failed to sign in. Please check your email and password.');
                          //   }
                          // }
                        },
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
                    ],
                  ),
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