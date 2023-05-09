import 'package:flutter/material.dart';

class CustomDropdownButton extends StatefulWidget {
  final String? value;
  final List<String> items;
  final Function(String) onChanged;

  const CustomDropdownButton({
    Key? key,
    required this.value,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  String? dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      // constraints: const BoxConstraints(minHeight: 35.0),
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(color: Colors.white),
      ),
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_drop_down),
        isExpanded: true,
        underline: const Center(),
        onChanged: (String? value) {
          setState(() {
            dropdownValue = value;
            widget.onChanged(value!);
          });
        },
        items: widget.items
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
