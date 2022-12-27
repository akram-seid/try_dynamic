import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:try_dynamic/structural/option.dart';
import 'package:try_dynamic/structural/question.dart';

class QuestionField extends StatefulWidget {
  final Question question;
  final TextEditingController controller;

  const QuestionField(
      {required this.question, required this.controller, super.key});

  @override
  State<QuestionField> createState() => _QuestionFieldState();
}

class _QuestionFieldState extends State<QuestionField> {
  String _groupValue = "1";

  Widget choiceField(Option option) {
    if (option == Option.shortAnswer) {
      return SizedBox(
        width: 700,
        child: TextFormField(
          minLines: 3,
          maxLines: 5,
          controller: widget.controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "This field is Required!";
            }
            return null;
          },
        ),
      );
    } else if (option == Option.linearTen) {
      return SizedBox(
        width: 700,
        child: RadioGroup<String>.builder(
          direction: Axis.horizontal,
          groupValue: _groupValue,
          onChanged: (value) => setState(() {
            _groupValue = value ?? '10';
            widget.controller.text = _groupValue;
          }),
          items: const ['10', '9', '8', '7', '6', '5', '4', '3', '2', '1'],
          itemBuilder: (item) => RadioButtonBuilder(
            item,
          ),
        ),
      );
    } else if (option == Option.linearFour) {
      return SizedBox(
        width: 700,
        child: RadioGroup<String>.builder(
          direction: Axis.horizontal,
          groupValue: _groupValue,
          horizontalAlignment: MainAxisAlignment.start,
          onChanged: (value) => setState(() {
            _groupValue = value ?? '10';
            widget.controller.text = _groupValue;
          }),
          items: const ['4', '3', '2', '1'],
          itemBuilder: (item) => RadioButtonBuilder(
            item,
          ),
        ),
      );
    } else if (option == Option.annotatedTen) {
      return SizedBox(
        width: 700,
        child: RadioGroup<String>.builder(
          direction: Axis.horizontal,
          groupValue: _groupValue,
          onChanged: (value) => setState(() {
            _groupValue = value ?? '10';
            widget.controller.text = _groupValue;
          }),
          items: const ['10', '9', '8', '7', '6', '5', '4', '3', '2', '1'],
          itemBuilder: (item) => RadioButtonBuilder(
            item,
          ),
        ),
      );
    } else {
      return SizedBox(
        width: 700,
        child: RadioGroup<String>.builder(
          direction: Axis.horizontal,
          groupValue: _groupValue,
          onChanged: (value) => setState(() {
            _groupValue = value ?? '10';
            widget.controller.text = _groupValue;
          }),
          items: const ['Excellent', 'Very Good', 'good', 'bad'],
          itemBuilder: (item) => RadioButtonBuilder(
            item,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          children: [
            Text(
              "${widget.question.questionOrder}. ",
              style: const TextStyle(fontSize: 18.0, ),
            ),
            Text(
              widget.question.statement,
              style: const TextStyle(fontSize: 18.0, ),
            ),
          ],
        ),
    const SizedBox(height: 10.0,),
        Wrap(
          children: [
            choiceField(widget.question.option),
            Text(
              widget.question.required ? "*" : "",
              style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red),
            )

          ],
        ),
        const SizedBox(height: 10.0,),
      ],
    );
  }
}
