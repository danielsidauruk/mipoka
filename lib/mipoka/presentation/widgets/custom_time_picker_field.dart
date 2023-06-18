import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomTimePickerField extends StatelessWidget {
  final TextEditingController controller;

  const CustomTimePickerField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      constraints: const BoxConstraints(minHeight: 35.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: Colors.white),
      ),
      child: Row(
        children: [
          Expanded(
            child: DateTimeField(
              controller: controller,
              decoration: const InputDecoration.collapsed(
                hintText: 'Input Time',
              ),
              resetIcon: null,
              format: DateFormat.Hm(),
              onShowPicker: (context, currentValue) async {
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                );
                return DateTimeField.convert(time);
              },
            ),
          ),
          const Icon(
            Icons.access_time,
            size: 20,
          ),
        ],
      ),
    );
  }
}

