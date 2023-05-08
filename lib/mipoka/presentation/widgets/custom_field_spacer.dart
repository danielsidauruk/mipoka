import 'package:flutter/material.dart';

class CustomFieldSpacer extends StatelessWidget {
  final double spacerHeight;

  const CustomFieldSpacer({
    super.key,
    this.spacerHeight = 8.0,
  });

  @override
  Widget build(BuildContext context) => SizedBox(height: spacerHeight);
}