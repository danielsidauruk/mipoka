import 'package:flutter/material.dart';

bool darkMode = false;

TextStyle mobileLoginTitle = const TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 24
);

Row customBoxTitle(String title) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    ],
  );
}

Column buildTitle(String title, {double titlePadding = 4}) {
  return Column(
    children: [
      Text(
        title,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),

      SizedBox(height: titlePadding),
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