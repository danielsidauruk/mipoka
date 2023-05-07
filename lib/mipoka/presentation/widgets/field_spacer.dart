import 'package:flutter/material.dart';

class FieldSpacer extends StatelessWidget {
  final double spacerHeight;

  const FieldSpacer({
    super.key,
    this.spacerHeight = 8.0,
  });

  @override
  Widget build(BuildContext context) => SizedBox(height: spacerHeight);
}