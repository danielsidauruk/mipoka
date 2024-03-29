import 'package:flutter/material.dart';

class CustomAddButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const CustomAddButton({
    super.key,
    required this.buttonText,
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
        constraints: const BoxConstraints(minHeight: 30.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.add,
                size: 20,
                color: Colors.black,
              ),
            ),
            Expanded(
              child: Text(
                buttonText,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WebCustomAddButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const WebCustomAddButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        width: 250,
        alignment: Alignment.center,
        constraints: const BoxConstraints(minHeight: 30.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.add,
                size: 20,
                color: Colors.black,
              ),
            ),
            Expanded(
              child: Text(
                buttonText,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

