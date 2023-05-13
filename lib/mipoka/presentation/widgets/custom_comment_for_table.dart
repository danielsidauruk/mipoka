import 'package:flutter/material.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';

class CustomCommentForTable extends StatefulWidget {
  final String title;
  final String description;
  final TextEditingController controller;

  const CustomCommentForTable({
    super.key,
    required this.title,
    this.description = 'Catatan: (Berisi teks yang harus di revisi)',
    required this.controller,
  });

  @override
  State<CustomCommentForTable> createState() => _CustomCommentForTableState();
}

class _CustomCommentForTableState extends State<CustomCommentForTable> {
  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Row(
          children: [
            Expanded(
              flex: 8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTitle(widget.title),
                  buildDescription(widget.description),
                ],
              ),
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
              CustomTextField(controller: widget.controller),
            ],
          ),

        const CustomFieldSpacer(height: 4.0),
      ],
    );
  }
}