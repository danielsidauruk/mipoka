import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/mipoka/presentation/bloc/cubit/date_picker_cubit.dart';

class CustomDatePickerField extends StatelessWidget {
  final void Function(DateTime?) onDateSelected;

  const CustomDatePickerField({
    super.key,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CustomDatePickerCubit>(
      create: (context) => CustomDatePickerCubit(),
      child: BlocBuilder<CustomDatePickerCubit, DateTime?>(
        builder: (context, state) {
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
                  initialDate: state ?? DateTime.now(),
                  firstDate: DateTime(1000),
                  lastDate: DateTime(2100),
                ).then((value) {
                  if (value != null) {
                    context.read<CustomDatePickerCubit>().selectDate(value);
                    onDateSelected(value);
                  }
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    state != null
                        ? DateFormat('dd / MM / yyyy').format(state)
                        : '',
                  ),
                  Image.asset(
                    'assets/icons/calendar.png',
                    width: 24,
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
