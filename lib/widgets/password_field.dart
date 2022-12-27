import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final String placeholder;
  final TextEditingController controller;

  const PasswordField(
      {required this.controller, required this.placeholder, super.key});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 400,
        child: Column(
          children: [
            TextFormField(
              controller: widget.controller,
              obscureText: true,
              decoration:  InputDecoration(
                label: Text(widget.placeholder),
                border: const OutlineInputBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(12.0))),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "${widget.placeholder} cannot be empty!";
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
