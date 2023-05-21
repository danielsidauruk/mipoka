import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/dropdown_cubit.dart';

class CustomDropdownButton extends StatelessWidget {
  final List<String> items;
  final Function(String) onValueChanged;

  const CustomDropdownButton({
    super.key,
    required this.items,
    required this.onValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DropdownCubit(items[0]),
      child: BlocBuilder<DropdownCubit, String>(
        builder: (context, state) {
          return Container(
            width: double.infinity,
            height: 35,
            padding: const EdgeInsets.symmetric(
              vertical: 2.0,
              horizontal: 8.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(color: Colors.white),
            ),
            child: DropdownButton<String>(
              value: state,
              icon: const Icon(Icons.arrow_drop_down),
              isExpanded: true,
              underline: const Center(),
              onChanged: (String? value) {
                if (value != null) {
                  context.read<DropdownCubit>().setDropdownValue(value);
                  onValueChanged(value);
                }
              },
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
