import 'package:flutter/material.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';

Widget showImageWidget(BuildContext context, String imageUrl, String title) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      buildTitle(title),
      InkWell(
        onTap: () => showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.clear,
                      size: 24.0,
                    ),
                  )
                ],
              ),
              content: Image.network(
                fit: BoxFit.scaleDown,
                imageUrl,
              ),
            );
          },
        ),
        child: showImageButton(),
      ),
      const CustomFieldSpacer(),
    ],
  );
}

Widget showImageButton() => Container(
  constraints: const BoxConstraints(maxWidth: 500),
  alignment: Alignment.center,
  padding: const EdgeInsets.all(8.0),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(5.0),
    border: Border.all(color: Colors.white),
  ),
  child: const Text(
    "Lihat Gambar",
    style: TextStyle(
      color: Colors.white,
      fontSize: 16,
    ),
  ),
);