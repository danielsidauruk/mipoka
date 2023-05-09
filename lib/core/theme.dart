import 'package:flutter/material.dart';

bool darkMode = false;

TextStyle mobileLoginTitle = const TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 24
);

TextStyle mobileSubTitle = const TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 20,
);

Column buildTitle(String title) {
  return Column(
    children: [
      Text(
        title,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),

      const SizedBox(height: 4.0),
    ],
  );
}

Column buildDescription(String text) {
  return Column(
    children: [
      Text(
        text,
        style: const TextStyle(color: Colors.grey),
      ),

      const SizedBox(height: 4.0),
    ],
  );
}