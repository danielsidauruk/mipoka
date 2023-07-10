import 'package:flutter/material.dart';

class CustomFilterButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomFilterButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        width: size.width < 501 ? double.infinity : 300,
        alignment: Alignment.center,
        constraints: const BoxConstraints(minHeight: 35.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
