import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  final String title;
  final TextEditingController controller;

  const CustomCheckBox({
    super.key,
    required this.title,
    required this.controller,
  });

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          checkColor: Colors.black,
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.title),
              if (isChecked)
                Column(
                  children: [
                    const SizedBox(height: 2),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8.0),
                      constraints: const BoxConstraints(minHeight: 35.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: Colors.white),
                      ),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: widget.controller,
                        maxLines: null,
                        style: const TextStyle(),
                        decoration: null,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }
}
