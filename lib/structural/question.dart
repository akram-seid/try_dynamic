import 'dart:convert';
import 'option.dart';

Question questionFromJson(String str) => Question.fromJson(json.decode(str));

String questionToJson(Question data) => json.encode(data.toJson());

class Question {
  Question({
    required this.statement,
    required this.option,
    required this.questionOrder,
    required this.required,

  });

  String statement;
  Option option;
  int questionOrder;
  bool required;


  factory Question.fromJson(Map<String, dynamic> json) => Question(
    statement: json["statement"],
    option: json["option"],
    questionOrder: json["questionOrder"],
    required: json["required"],

  );

  Map<String, dynamic> toJson() => {
    "statement": statement,
    "option": option,
    "questionOrder": questionOrder,
    "required": required,

  };
}

