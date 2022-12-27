import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String placeholder;
  final TextEditingController controller;
  final double widthValue;

  const InputField(
      {required this.controller, required this.placeholder, required this.widthValue,super.key});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: widget.widthValue,
        child: TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(12.0))
            ),
            labelText: widget.placeholder,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "Please enter ${widget.placeholder}";
            }
            return null;
          },
        ),
      ),
    );
  }
}
