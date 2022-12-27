import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:try_dynamic/structural/option.dart';
import 'package:try_dynamic/structural/question.dart';
import 'question_field.dart';

class AssessmentForm extends StatefulWidget {
  const AssessmentForm({Key? key}) : super(key: key);


  @override
  State<AssessmentForm> createState() => _AssessmentFormState();
}

class _AssessmentFormState extends State<AssessmentForm>
    with SingleTickerProviderStateMixin {
  final List<QuestionField> _phoneWidgets = <QuestionField>[];
  List<String> listOfTextEntries = [];

  List<Question> questionList = [];


  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: ListView(
                shrinkWrap: true,
                children: List.generate(_phoneWidgets.length, (i) {
                  return _phoneWidgets[i];
                }),
              ),
            ),
          ]),
    );
  }

  TextEditingController returnController(String controllerName) {
    final controllerName = TextEditingController();
    return controllerName;
  }

  //You can see the list of text entries from here.
  void showTextFieldEntries() {
    _phoneWidgets.map((i) {
      if (kDebugMode) {
        print("printing:  ${i.controller.text.trim()}");
      }
    }).toList();
  }

  void loadData() {
    questionList.add(Question(
      statement: "What is your Name",
      option: Option.annotatedTen,
      questionOrder: 1,
      required: false,
    ));
    questionList.add(Question(
      statement: "What is your Name",
      option: Option.linearTen,
      questionOrder: 2,
      required: true,
    ));
    questionList.add(Question(
      statement: "What is your Name",
      option: Option.linearFour,
      questionOrder: 3,
      required: true,
    ));
    questionList.add(Question(
      statement: "What is your Name",
      option: Option.annotatedFour,
      questionOrder: 4,
      required: true,
    ));
    questionList.add(Question(
      statement: "What is your Name",
      option: Option.shortAnswer,
      questionOrder: 5,
      required: false,
    ));
    questionList.add(Question(
      statement: "What is your Name",
      option: Option.linearFour,
      questionOrder: 6,
      required: true,
    ));
    for (int i = 0; i < questionList.length; i++) {
      _phoneWidgets.add(QuestionField(
          question: questionList[i],
          controller: returnController(
              "questionController ${_phoneWidgets.length + 1}")));
    }
  }
}