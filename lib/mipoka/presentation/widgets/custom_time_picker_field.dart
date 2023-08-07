import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomTimePickerField extends StatelessWidget {
  final TextEditingController controller;

  const CustomTimePickerField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width < 501 ? double.infinity : 500,
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
                hintText: 'Enter Time',
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

