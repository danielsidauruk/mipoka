import 'package:flutter/material.dart';

class MipokaCountText extends StatelessWidget {
  const MipokaCountText({
    super.key,
    required this.total,
  });

  final int total;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        "Total Kegiatan per Jenis Kegiatan : $total",
        style: const TextStyle(fontSize: 15),
      ),
    );
  }
}