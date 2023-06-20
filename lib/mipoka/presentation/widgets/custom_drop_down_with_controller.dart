import 'package:flutter/material.dart';

// class CustomDropdownButton extends StatefulWidget {
//   final List<String> items;
//   final ValueNotifier<String> selectedValueNotifier;
//
//   const CustomDropdownButton({
//     Key? key,
//     required this.items,
//     required this.selectedValueNotifier,
//   }) : super(key: key);
//
//   @override
//   State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
// }
//
// class _CustomDropdownButtonState extends State<CustomDropdownButton> {
//   late String _selectedValue;
//
//   @override
//   void initState() {
//     super.initState();
//     _selectedValue = widget.selectedValueNotifier.value;
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
//         value: _selectedValue,
//         icon: const Icon(Icons.arrow_drop_down),
//         isExpanded: true,
//         underline: const Center(),
//         onChanged: (String? value) {
//           if (value != null) {
//             setState(() {
//               _selectedValue = value;
//               widget.selectedValueNotifier.value = value;
//             });
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

class DropdownController extends StatefulWidget {
  final List<String> list;
  final String? controller;
  final Function(String?)? onValueChanged;

  const DropdownController({
    Key? key,
    required this.list,
    this.controller,
    this.onValueChanged,
  }) : super(key: key);

  @override
  State<DropdownController> createState() => _DropdownControllerState();
}

class _DropdownControllerState extends State<DropdownController> {
  late String dropDownItem;

  @override
  void initState() {
    super.initState();
    dropDownItem = widget.controller ?? widget.list.first;
  }

  @override
  Widget build(BuildContext context) {
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
        value: dropDownItem,
        icon: const Icon(Icons.arrow_drop_down),
        isExpanded: true,
        underline: const Center(),
        onChanged: (value) {
          setState(() {
            dropDownItem = value!;
          });
          if (widget.onValueChanged != null) {
            widget.onValueChanged!(dropDownItem);
          }
        },
        items: widget.list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
