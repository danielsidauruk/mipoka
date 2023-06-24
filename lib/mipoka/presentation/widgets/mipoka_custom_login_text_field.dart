import 'package:flutter/material.dart';
import 'package:mipoka/core/theme.dart';

class MipokaCustomLoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscuredText;

  const MipokaCustomLoginTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscuredText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(8.0),
      height: 60,
      width: 450,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        obscureText: obscuredText,
        controller: controller,
        style: const TextStyle(),
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
