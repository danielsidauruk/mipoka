import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/bloc/cubit/switch_cubit.dart';

class CustomSwitch extends StatelessWidget {
  final String title;
  final String option1;
  final String option2;
  final void Function(bool) onChanged;

  const CustomSwitch({
    super.key,
    required this.title,
    required this.option1,
    required this.option2,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SwitchCubit(),
      child: BlocBuilder<SwitchCubit, bool>(
        builder: (context, state) {
          return Row(
            children: [
              Expanded(
                flex: 4,
                child: buildTitle(title),
              ),

              const SizedBox(width: 4.0),

              Expanded(
                flex: 1,
                child: Switch(
                  value: state,
                  onChanged: (newValue) {
                    context.read<SwitchCubit>().toggleSwitch(newValue);
                    onChanged(newValue);
                  },
                ),
              ),

              const SizedBox(width: 4.0),

              Expanded(
                flex: 2,
                child: state == false ? Center(child: buildTitle(option1)) : Center(child: buildTitle(option2)),
              ),
            ],
          );
        },
      ),
    );
  }
}

