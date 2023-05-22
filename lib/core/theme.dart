import 'package:flutter/material.dart';

bool darkMode = false;

TextStyle loginTitle =
    const TextStyle(fontWeight: FontWeight.bold, fontSize: 24);

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
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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

Widget customDisplayField(String text) {
  return Container(
    alignment: Alignment.centerLeft,
    width: double.infinity,
    constraints: const BoxConstraints(minHeight: 35.0),
    padding: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4.0),
      border: Border.all(color: Colors.white),
    ),
    child: Text(text),
  );
}
