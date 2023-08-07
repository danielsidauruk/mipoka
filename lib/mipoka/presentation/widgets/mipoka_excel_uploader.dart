import 'package:flutter/material.dart';

class MipokaExcelUploader extends StatefulWidget {
  final VoidCallback onTap;
  final String text;

  const MipokaExcelUploader({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  State<MipokaExcelUploader> createState() => _MipokaExcelUploaderState();
}

class _MipokaExcelUploaderState extends State<MipokaExcelUploader> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: size.width <= 500 ? double.infinity : 500,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        constraints: const BoxConstraints(minHeight: 35.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(color: Colors.white),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                // Uri.parse(widget.text).pathSegments.last,
                widget.text,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Image.asset(
              "assets/icons/excel.png",
              width: 24,
            )
          ],
        ),
      ),
    );
  }
}