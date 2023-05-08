import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatePickerField extends StatefulWidget {
  final DateTime? selectedDate;
  final void Function(DateTime?) onDateSelected;

  const CustomDatePickerField({
    super.key,
    this.selectedDate,
    required this.onDateSelected,
  });

  @override
  State<CustomDatePickerField> createState() => _CustomDatePickerFieldState();
}

class _CustomDatePickerFieldState extends State<CustomDatePickerField> {
  DateTime? dateTime;

  @override
  void initState() {
    super.initState();
    dateTime = widget.selectedDate;
  }

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
      child: InkWell(
        onTap: () {
          showDatePicker(
            context: context,
            initialDate: dateTime ?? DateTime.now(),
            firstDate: DateTime(1000),
            lastDate: DateTime(2100),
          ).then((value) {
            if (value != null) {
              setState(() {
                dateTime = value;
                widget.onDateSelected(value);
              });
            }
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              dateTime != null
                  ? DateFormat('dd / MM / yyyy').format(dateTime!)
                  : '',
            ),
            const Icon(
              Icons.calendar_month_sharp,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
