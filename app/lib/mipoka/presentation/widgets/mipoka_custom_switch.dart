import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/theme.dart';

class SwitchCubit extends Cubit<bool> {
  SwitchCubit(bool initialState) : super(initialState);

  void toggleSwitch(bool newValue) {
    emit(newValue);
  }
}

class MipokaCustomSwitchButton extends StatelessWidget {
  final String title;
  final String option1;
  final String option2;
  final bool? value;
  final void Function(bool) onChanged;

  const MipokaCustomSwitchButton({super.key,
    required this.title,
    required this.option1,
    required this.option2,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => SwitchCubit(value ?? false),
      child: BlocBuilder<SwitchCubit, bool>(
        builder: (context, state) {
          return SizedBox(
            child: Row(
              // crossAxisAlignment: size.width > 500 ? CrossAxisAlignment.start : CrossAxisAlignment.start,
              // mainAxisAlignment: size.width > 500 ? MainAxisAlignment.start : MainAxisAlignment.spaceBetween,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Expanded(
                //   // flex: 4,
                //   child:
                  buildTitle(title),
                // ),

                const SizedBox(width: 4.0),

                // Expanded(
                //   // flex: 1,
                //   child:
                  Switch(
                    value: state,
                    onChanged: (newValue) {
                      context.read<SwitchCubit>().toggleSwitch(newValue);
                      onChanged(newValue);
                    },
                  ),
                // ),

                const SizedBox(width: 4.0),

                // if(option1 != "" && option2 != "")
                //   Expanded(
                //     flex: 2,
                //     child:
                    state == false ? Center(child: buildTitle(option1)) : Center(child: buildTitle(option2)),
                  // ),
              ],
            ),
          );
        },
      ),
    );
  }
}

