import 'package:flutter/material.dart';

class CustomSwitchField extends StatelessWidget {
  final String title;
  final bool value;
  final String option1;
  final String option2;
  final ValueChanged<bool> onChanged;

  const CustomSwitchField({super.key,
    required this.title,
    required this.value,
    required this.option1,
    required this.option2,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildTitle(title),
        const SizedBox(width: 4.0),
        Switch(
          value: value,
          onChanged: onChanged,
        ),
        const SizedBox(width: 4.0),
        Expanded(
          child: value == false ? buildTitle(option1) : buildTitle(option2),
        ),
      ],
    );
  }

  Widget buildTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }
}
