import 'package:flutter/material.dart';

class LocationDropDown extends StatefulWidget {
  final List<String> list;

  const LocationDropDown({
    super.key,
    required this.list,
  });

  @override
  State<LocationDropDown> createState() => _LocationDropDownState();
}

class _LocationDropDownState extends State<LocationDropDown> {
  late List<String> list;
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    list = widget.list;
    dropdownValue = list.first;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: DropdownButton(
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value!;
          });
        },
      ),
    );
  }
}
