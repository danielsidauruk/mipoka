import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class RichTextField extends StatelessWidget {
  final QuillController controller;

  const RichTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: Colors.white),
      ),
      child: Column(
        children: [
          QuillToolbar.basic(
            controller: controller,
            axis: Axis.horizontal,
            multiRowsDisplay: false,
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: QuillEditor(
              controller: controller,
              focusNode: FocusNode(),
              readOnly: false,
              expands: false,
              padding: EdgeInsets.zero,
              scrollController: ScrollController(),
              scrollable: true,
              autoFocus: false,
            ),
          ),
        ],
      ),
    );
  }
}
