import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback navigation;
  final String text;

  const Button({
    required this.navigation,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: navigation,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
            height: 30,
            alignment: Alignment.center,
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
            ),
          ),
        ),
      ],
    );
  }
}