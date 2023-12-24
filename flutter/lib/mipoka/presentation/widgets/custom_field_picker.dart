import 'package:flutter/material.dart';
import 'package:mipoka/mipoka/presentation/widgets/open_file_picker_method.dart';

class CustomFilePickerButton extends StatefulWidget {
  final VoidCallback onTap;
  final VoidCallback onDelete;
  final String text;
  final String asset;

  const CustomFilePickerButton({
    super.key,
    required this.onTap,
    required this.onDelete,
    required this.text,
    this.asset = "assets/icons/attach.png",
  });

  @override
  State<CustomFilePickerButton> createState() => _CustomFilePickerButtonState();
}

class _CustomFilePickerButtonState extends State<CustomFilePickerButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.text == "" ? widget.onTap : null,
      child: Container(
        width:  double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        constraints: const BoxConstraints(minHeight: 30.0, maxWidth: 500),
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
              InkWell(
                onTap: () {
                  deleteFileFromFirebase(widget.text);
                  widget.onDelete();
                },
                child: Image.asset(
                  "assets/icons/delete.png",
                  width: 24,
                ),
              ),
          ],
        ),
      ),
    );
  }
}