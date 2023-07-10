import 'package:flutter/material.dart';

class MipokaCountText extends StatelessWidget {
  const MipokaCountText({
    super.key,
    required this.total,
  });

  final int total;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Align(
      alignment: size.width < 501 ? Alignment.centerRight : Alignment.centerLeft,
      child: Text(
        "Total Kegiatan per Jenis Kegiatan : $total",
        style: const TextStyle(fontSize: 15),
      ),
    );
  }
}