import 'package:flutter/material.dart';

class RegisterTextField extends StatefulWidget {
  const RegisterTextField({
    super.key,
    required this.controller,
    required this.title,
    this.textInputType = TextInputType.text,
    this.obscuredText = false,
    this.textFieldWidth = 500,
  });

  final TextEditingController controller;
  final String title;
  final TextInputType textInputType;
  final bool obscuredText;
  final double textFieldWidth;

  @override
  State<RegisterTextField> createState() => _RegisterTextFieldState();
}

class _RegisterTextFieldState extends State<RegisterTextField> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width <= 500 ? double.infinity : widget.textFieldWidth,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              widget.title,
              textAlign: TextAlign.left,
              style: const TextStyle(fontSize: 16,),
            ),
          ),

          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(color: Colors.white),
            ),
            child: TextField(
              obscureText: widget.obscuredText,
              keyboardType: widget.textInputType,
              controller: widget.controller,
              style: const TextStyle(),
              decoration: null,
            ),
          )
        ],
      ),
    );
  }
}