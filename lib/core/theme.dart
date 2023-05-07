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

Text buildTitle(String title) {
  return Text(
    title,
    style: const TextStyle(
      fontSize: 16,
    ),
  );
}