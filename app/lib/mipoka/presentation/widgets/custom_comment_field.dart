import 'package:flutter/material.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';

class CustomCommentWidget extends StatefulWidget {
  final String title;
  final String description;
  final String mainText;
  final TextEditingController controller;

  const CustomCommentWidget({
    super.key,
    required this.title,
    this.description = 'Catatan: (Berisi teks yang harus di revisi)',
    required this.mainText,
    required this.controller,
  });

  @override
  State<CustomCommentWidget> createState() => _CustomCommentWidgetState();
}

class _CustomCommentWidgetState extends State<CustomCommentWidget> {
  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTitle(widget.title),
        buildDescription(widget.description),
        Row(
          children: [
            Expanded(
              flex: 8,
              child: customDisplayField(widget.mainText),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 6.0),

                  InkWell(
                    child: const Icon(
                      Icons.check_outlined,
                      color: Colors.green,
                    ),
                    onTap: () {
                      setState(() {
                        isEditing = false;
                      });
                    },
                  ),

                  const SizedBox(width: 4.0),

                  InkWell(
                    child: const Icon(
                      Icons.mode_edit_outlined,
                      color: Colors.yellow,
                    ),
                    onTap: () {
                      setState(() {
                        isEditing = !isEditing;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        if (isEditing)
          Column(
            children: [
              const CustomFieldSpacer(),

              CustomTextField(controller: widget.controller),
            ],
          ),
      ],
    );
  }
}