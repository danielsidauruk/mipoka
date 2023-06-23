import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onTap;

  const LoginButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.all(8.0),
        height: 60,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Theme.of(context).hintColor),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Log In - Pengguna',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}


void loginAndNavigate(BuildContext context, String email, String password, String routeName) async {
  try {
    if (email.isNotEmpty && password.isNotEmpty) {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Navigator.pushNamed(context, routeName);
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
}