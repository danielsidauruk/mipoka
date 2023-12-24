import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/cubit/dropdown_cubit.dart';


class MipokaCustomDropdown extends StatefulWidget {
  final List<String> items;
  final String? initialItem;
  final Function(String?)? onValueChanged;

  const MipokaCustomDropdown({
    super.key,
    required this.items,
    this.initialItem,
    this.onValueChanged,
  });

  @override
  State<MipokaCustomDropdown> createState() => _MipokaCustomDropdownState();
}

class _MipokaCustomDropdownState extends State<MipokaCustomDropdown> {
  late final DropdownBloc dropdownBloc;

  @override
  void initState() {
    String? initialItem;
    super.initState();
    if(widget.initialItem == "" || widget.initialItem == null) {
      initialItem = widget.items.first;
    } else {
      initialItem = widget.initialItem;
    }
    widget.items == [] ? ["-"] : widget.items;
    dropdownBloc = DropdownBloc(initialItem ?? widget.items.first);
  }

  @override
  void dispose() {
    dropdownBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<DropdownBloc, String>(
      bloc: dropdownBloc,
      builder: (context, selectedValue) {
        return Container(
          width: size.width <= 500 ? double.infinity : 500,
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


class MipokaCustomDropdown2 extends StatefulWidget {
  final List<String> items;
  final String? initialItem;
  final Function(String?)? onValueChanged;

  const MipokaCustomDropdown2({
    super.key,
    required this.items,
    this.initialItem,
    this.onValueChanged,
  });

  @override
  State<MipokaCustomDropdown2> createState() => _MipokaCustomDropdown2State();
}

class _MipokaCustomDropdown2State extends State<MipokaCustomDropdown2> {
  late final DropdownBloc dropdownBloc;

  @override
  void initState() {
    String? initialItem;
    super.initState();
    if(widget.initialItem == "" || widget.initialItem == null) {
      initialItem = widget.items.first;
    } else {
      initialItem = widget.initialItem;
    }
    widget.items == [] ? ["-"] : widget.items;
    dropdownBloc = DropdownBloc(initialItem ?? widget.items.first);
  }

  @override
  void dispose() {
    dropdownBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<DropdownBloc, String>(
      bloc: dropdownBloc,
      builder: (context, selectedValue) {
        return Container(
          width: size.width <= 500 ? double.infinity : 500,
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


class MipokaCustomDropdown3 extends StatefulWidget {
  final List<String> items;
  final String? initialItem;
  final Function(String?)? onValueChanged;

  const MipokaCustomDropdown3({
    super.key,
    required this.items,
    this.initialItem,
    this.onValueChanged,
  });

  @override
  State<MipokaCustomDropdown3> createState() => _MipokaCustomDropdown3State();
}

class _MipokaCustomDropdown3State extends State<MipokaCustomDropdown3> {
  late final DropdownBloc dropdownBloc;

  @override
  void initState() {
    String? initialItem;
    super.initState();
    if(widget.initialItem == "" || widget.initialItem == null) {
      initialItem = widget.items.first;
    } else {
      initialItem = widget.initialItem;
    }
    widget.items == [] ? ["-"] : widget.items;
    dropdownBloc = DropdownBloc(initialItem ?? widget.items.first);
  }

  @override
  void dispose() {
    dropdownBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<DropdownBloc, String>(
      bloc: dropdownBloc,
      builder: (context, selectedValue) {
        return Container(
          width: size.width <= 500 ? double.infinity : 500,
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




class WebMipokaCustomDropdown extends StatefulWidget {
  final List<String> items;
  final String? initialItem;
  final Function(String?)? onValueChanged;

  const WebMipokaCustomDropdown({
    super.key,
    required this.items,
    this.initialItem,
    this.onValueChanged,
  });

  @override
  State<WebMipokaCustomDropdown> createState() => _WebMipokaCustomDropdownState();
}

class _WebMipokaCustomDropdownState extends State<WebMipokaCustomDropdown> {
  late final DropdownBloc dropdownBloc;

  @override
  void initState() {
    String? initialItem;
    super.initState();
    if(widget.initialItem == "") {
      initialItem = widget.items.first;
    } else {
      initialItem = widget.initialItem;
    }
    dropdownBloc = DropdownBloc(initialItem ?? widget.items.first);
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
          width: 250,
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
