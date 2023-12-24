import 'package:flutter/material.dart';

class CustomFieldSpacer extends StatelessWidget {
  final double height;

  const CustomFieldSpacer({
    super.key,
    this.height = 8.0,
  });

  @override
  Widget build(BuildContext context) => SizedBox(height: height);
}