import 'package:flutter/material.dart';

class CustomFilePickerButton extends StatelessWidget {
  final VoidCallback onTap;

  const CustomFilePickerButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        constraints: const BoxConstraints(minHeight: 35.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(color: Colors.white),
        ),
        child: const Align(
          alignment: Alignment.centerRight,
          child: Icon(
            Icons.upload,
            size: 20,
          ),
        ),
      ),
    );
  }
}