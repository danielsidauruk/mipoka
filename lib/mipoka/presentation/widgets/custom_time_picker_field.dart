import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/cubit/time_picker_cubit.dart';

// class CustomTimePickerField extends StatefulWidget {
//   final TimeOfDay? selectedTime;
//   final void Function(TimeOfDay) onTimeSelected;
//
//   const CustomTimePickerField({
//     super.key,
//     this.selectedTime,
//     required this.onTimeSelected,
//   });
//
//   @override
//   State<CustomTimePickerField> createState() => _CustomTimePickerFieldState();
// }
//
// class _CustomTimePickerFieldState extends State<CustomTimePickerField> {
//   TimeOfDay? timeOfDays;
//
//   @override
//   void initState() {
//     super.initState();
//     timeOfDays = widget.selectedTime;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     print('Custom Time Picker Reloaded');
//     return InkWell(
//       onTap: () {
//         showTimePicker(
//           context: context,
//           initialTime: TimeOfDay.now(),
//         ).then((value) {
//           if (value != null) {
//             setState(() => timeOfDays = value);
//             widget.onTimeSelected(value);
//           }
//         });
//       },
//       child: Container(
//         alignment: Alignment.center,
//         padding: const EdgeInsets.all(8.0),
//         constraints: const BoxConstraints(minHeight: 35.0),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(5.0),
//           border: Border.all(color: Colors.white),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               timeOfDays != null
//                   ? '${timeOfDays!.hour.toString().padLeft(2, '0')} '
//                   ': ${timeOfDays!.minute.toString().padLeft(2, '0')}'
//                   : '',
//             ),
//             const Icon(
//               Icons.access_time,
//               size: 20,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class CustomTimePickerField extends StatelessWidget {
  final void Function(TimeOfDay) onTimeSelected;

  const CustomTimePickerField({
    Key? key,
    required this.onTimeSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Custom Time Picker Reloaded');
    return BlocProvider<TimePickerCubit>(
      create: (context) => TimePickerCubit(),
      child: BlocBuilder<TimePickerCubit, TimeOfDay?>(
        builder: (context, state) {
          return InkWell(
            onTap: () {
              final currentContext = context;
              showTimePicker(
                context: currentContext,
                initialTime: state ?? TimeOfDay.now(),
              ).then((pickedTime) {
                if (pickedTime != null) {
                  currentContext.read<TimePickerCubit>().setTime(pickedTime);
                  onTimeSelected(pickedTime);
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
                    state != null
                        ? '${state.hour.toString().padLeft(2, '0')}'
                        ':${state.minute.toString().padLeft(2, '0')}'
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
        },
      ),
    );
  }
}

