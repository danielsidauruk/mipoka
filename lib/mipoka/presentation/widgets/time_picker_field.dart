import 'package:flutter/material.dart';

class TimePickerField extends StatefulWidget {
  final TimeOfDay? selectedTime;
  final void Function(TimeOfDay) onTimeSelected;

  const TimePickerField({
    super.key,
    this.selectedTime,
    required this.onTimeSelected,
  });

  @override
  State<TimePickerField> createState() => _TimePickerFieldState();
}

class _TimePickerFieldState extends State<TimePickerField> {
  TimeOfDay? timeOfDays;

  @override
  void initState() {
    super.initState();
    timeOfDays = widget.selectedTime;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        ).then((value) {
          if (value != null) {
            setState(() => timeOfDays = value);
            widget.onTimeSelected(value);
          }
        });
      },
      child: Container(
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
            Text(
              timeOfDays != null
                  ? '${timeOfDays!.hour.toString().padLeft(2, '0')} '
                  ': ${timeOfDays!.minute.toString().padLeft(2, '0')}'
                  : '',
            ),
            const Icon(
              Icons.access_time,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
