import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  final String placeholder;
  final TextEditingController controller;
  final List<String> list;
  final double widthValue;

  const DropDown(
      {required this.controller,
      required this.placeholder,
      required this.list,
      required this.widthValue,
      super.key});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          width: widget.widthValue,
          child: DropdownButtonFormField<String>(
            isExpanded: true,
            items: widget.list
                .map((value) => DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    ))
                .toList(),
            onChanged: (value) {
              widget.controller.text = value!;
            },
            decoration: InputDecoration(
              labelText: widget.placeholder,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
              ),
            ),
            validator: (value) {
              if (value == null) {
                return "please select ${widget.placeholder}";
              }
              return null;
            },
          )),
    );
  }
}
