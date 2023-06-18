import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatePickerField extends StatelessWidget {
  final TextEditingController controller;

  const CustomDatePickerField({
    super.key,
    required this.controller,
  });

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
                hintText: 'Enter Date',
              ),
              resetIcon: null,
              format: DateFormat('dd-MM-yyyy'),
              onShowPicker: (context, currentValue) async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: currentValue ?? DateTime.now(),
                  firstDate: DateTime(1945),
                  lastDate: DateTime(2100),
                );
                return date;
              },
            ),
          ),

          const Icon(
            Icons.calendar_today_outlined,
            size: 20,
          ),
        ],
      ),
    );
  }
}
