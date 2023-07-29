import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';

import 'open_file_picker_method.dart';

class MipokaCustomLoadImage extends StatelessWidget {
  final StreamController<bool> stream;
  final String imageUrl;
  final VoidCallback? onDelete;

  const MipokaCustomLoadImage({super.key,
    required this.stream,
    required this.imageUrl,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: stream.stream,
      initialData: false,
      builder: (context, snapshot) {
        bool isLoaded = snapshot.data!;
        return InkWell(
          onTap: () {
            stream.add(!isLoaded);
          },
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(color: Colors.white),
            ),
            child: isLoaded == false ?
            const Text(
              "Lihat Gambar",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ) :
            Column(
              children: [
                const Text(
                  "Tutup",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),

                const CustomFieldSpacer(),

                Image.network(imageUrl),
              ],
            ),
          ),
        );
      },
    );
  }
}
