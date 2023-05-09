import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback navigation;
  final String text;

  const CustomButton({
    required this.navigation,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: navigation,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
            constraints: const BoxConstraints(minHeight: 35.0),
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
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
