import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.textInputType = TextInputType.text,
    // this.textInputType = TextInputType.multiline,
  });

  final TextEditingController controller;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      constraints: const BoxConstraints(minHeight: 35),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: Colors.white),
      ),
      child: TextField(
        // textInputAction: TextInputAction.newline,
        keyboardType: textInputType,
        controller: controller,
        maxLines: null,
        style: const TextStyle(),
        decoration: null,
      ),
    );
  }
}


class CustomTextField2 extends StatelessWidget {
  const CustomTextField2({
    super.key,
    required this.onSubmitted,
    this.textInputType = TextInputType.text,
  });

  final Function(String) onSubmitted;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      constraints: const BoxConstraints(minHeight: 35.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: Colors.white),
      ),
      child: TextField(
        keyboardType: textInputType,
        onSubmitted: onSubmitted,
        style: const TextStyle(),
        decoration: null,
      ),
    );
  }
}


class CustomTextField3 extends StatelessWidget {
  const CustomTextField3({
    super.key,
    required this.value,
    required this.onSubmitted,
    this.textInputType = TextInputType.text,
  });

  final String value;
  final Function(String) onSubmitted;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      constraints: const BoxConstraints(minHeight: 35.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: Colors.white),
      ),
      child: TextField(
        keyboardType: textInputType,
        controller: TextEditingController(text: value),
        style: const TextStyle(),
        decoration: null,
      ),
    );
  }
}

