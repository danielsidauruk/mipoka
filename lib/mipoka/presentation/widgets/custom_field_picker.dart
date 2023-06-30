import 'package:flutter/material.dart';
import 'package:mipoka/mipoka/presentation/widgets/open_file_picker_method.dart';

class CustomFilePickerButton extends StatefulWidget {
  final VoidCallback onTap;
  late String text;

  CustomFilePickerButton({
    super.key,
    required this.onTap,
    this.text = "",
  });

  @override
  State<CustomFilePickerButton> createState() => _CustomFilePickerButtonState();
}

class _CustomFilePickerButtonState extends State<CustomFilePickerButton> {
  late bool isUploaded;
  @override
  void initState() {
    if(widget.text != "") {
      isUploaded = false;
    } else {
      isUploaded = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.text == "" ? widget.onTap : null,
      child: Container(
        width: double.infinity,
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

            widget.text == "" ?
            Image.asset(
              'assets/icons/attach.png',
              width: 24,
            ) :
            InkWell(
              onTap: () {
                deleteFileFromFirebase(widget.text);
                setState(() {
                  widget.text = "";
                });
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