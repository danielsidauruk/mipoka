import 'package:flutter/material.dart';

class CustomFilePickerButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const CustomFilePickerButton({
    super.key,
    required this.onTap,
    this.text = '',
  });

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),

            Image.asset(
              'assets/icons/attach.png',
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}