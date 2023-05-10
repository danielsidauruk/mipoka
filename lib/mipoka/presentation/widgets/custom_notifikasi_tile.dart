import 'package:flutter/material.dart';

class CustomNotifikasiTile extends StatelessWidget {
  const CustomNotifikasiTile({
    super.key,
    required this.text,
    required this.time,
  });

  final String text;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 5,
          child: Text(
            text,
            textAlign: TextAlign.start,
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            time,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}