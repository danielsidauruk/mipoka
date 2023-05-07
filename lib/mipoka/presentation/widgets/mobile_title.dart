import 'package:flutter/material.dart';

class MobileTitle extends StatelessWidget {
  final String text;
  const MobileTitle({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
      ],
    );
  }
}