// To parse this JSON data, do
//
//     final survey = surveyFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import 'category.dart';

Survey surveyFromJson(String str) => Survey.fromJson(json.decode(str));

String surveyToJson(Survey data) => json.encode(data.toJson());

class Survey {
    Survey({
        required this.title,
        required this.preamble,
        required this.description,
        required this.category,
        required this.id,
    });

    String title;
    String preamble;
    String description;
    Category category;
    int id;

    factory Survey.fromJson(Map<String, dynamic> json) => Survey(
        title: json["title"],
        preamble: json["preamble"],
        description: json["description"],
        category: json["category"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "preamble": preamble,
        "description": description,
        "category": category,
        "id": id,
    };
}
