import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/text_field_cubit.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.textInputType = TextInputType.text,
  });

  final TextEditingController controller;
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
