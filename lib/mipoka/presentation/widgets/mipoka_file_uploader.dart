import 'package:flutter/material.dart';

class MipokaFileUploader extends StatefulWidget {
  final VoidCallback onTap;
  final VoidCallback? onDelete;
  final String text;
  final String asset;

  const MipokaFileUploader({
    super.key,
    required this.onTap,
    required this.text,
    required this.asset,
    this.onDelete,
  });

  @override
  State<MipokaFileUploader> createState() => _MipokaFileUploaderState();
}

class _MipokaFileUploaderState extends State<MipokaFileUploader> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: size.width <= 500 ? double.infinity : 300,
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
                widget.text,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            (widget.text == "") ?
            Image.asset(
              widget.asset,
              width: 24,
            ) :
            widget.onDelete != null ?
            InkWell(
              onTap: () => widget.onDelete!(),
              child: Image.asset(
                "assets/icons/delete.png",
                width: 24,
              ),
            ) :
            const Center(),
          ],
        ),
      ),
    );
  }
}