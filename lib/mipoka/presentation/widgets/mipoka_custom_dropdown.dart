import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/cubit/dropdown_cubit.dart';

// => Using initState
// class DropdownController extends StatefulWidget {
//   final List<String> items;
//   final String? controller;
//   final Function(String?)? onValueChanged;
//
//   const DropdownController({
//     Key? key,
//     required this.items,
//     this.controller,
//     this.onValueChanged,
//   }) : super(key: key);
//
//   @override
//   State<DropdownController> createState() => _DropdownControllerState();
// }
//
// class _DropdownControllerState extends State<DropdownController> {
//   late String dropDownItem;
//
//   @override
//   void initState() {
//     super.initState();
//     dropDownItem = widget.controller ?? widget.items.first;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 35,
//       padding: const EdgeInsets.symmetric(
//         vertical: 2.0,
//         horizontal: 8.0,
//       ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(4.0),
//         border: Border.all(color: Colors.white),
//       ),
//       child: DropdownButton<String>(
//         value: dropDownItem,
//         icon: const Icon(Icons.arrow_drop_down),
//         isExpanded: true,
//         underline: const Center(),
//         onChanged: (value) {
//           setState(() {
//             dropDownItem = value!;
//           });
//           if (widget.onValueChanged != null) {
//             widget.onValueChanged!(dropDownItem);
//           }
//         },
//         items: widget.items.map<DropdownMenuItem<String>>((String value) {
//           return DropdownMenuItem<String>(
//             value: value,
//             child: Text(value),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }


// => Using Cubit
class MipokaCustomDropdown extends StatefulWidget {
  final List<String> items;
  final String? controller;
  final Function(String?)? onValueChanged;

  const MipokaCustomDropdown({
    Key? key,
    required this.items,
    this.controller,
    this.onValueChanged,
  }) : super(key: key);

  @override
  State<MipokaCustomDropdown> createState() => _MipokaCustomDropdownState();
}

class _MipokaCustomDropdownState extends State<MipokaCustomDropdown> {
  late final DropdownBloc dropdownBloc;

  @override
  void initState() {
    super.initState();
    String initialItem = widget.controller ?? widget.items.first;
    dropdownBloc = DropdownBloc(initialItem);
  }

  @override
  void dispose() {
    dropdownBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DropdownBloc, String>(
      bloc: dropdownBloc,
      builder: (context, selectedValue) {
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
            value: selectedValue,
            icon: const Icon(Icons.arrow_drop_down),
            isExpanded: true,
            underline: const Center(),
            onChanged: (value) {
              dropdownBloc.selectItem(value!);
              if (widget.onValueChanged != null) {
                widget.onValueChanged!(value);
              }
            },
            items: widget.items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
