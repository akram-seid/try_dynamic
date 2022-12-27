import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:try_dynamic/structural/option.dart';
import 'package:try_dynamic/structural/question.dart';
import 'package:try_dynamic/widgets/drop_down.dart';
import 'package:try_dynamic/widgets/input_field.dart';

import '../structural/category.dart';
import '../widgets/side_menu.dart';

class AddSurvey extends StatefulWidget {
  const AddSurvey({Key? key}) : super(key: key);

  @override
  State<AddSurvey> createState() => _AddSurveyState();
}

class _AddSurveyState extends State<AddSurvey> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController legend = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController statement = TextEditingController();
  TextEditingController optionCategory = TextEditingController();

  RxList questions = [].obs;
  bool required = true;
  final formKey = GlobalKey<FormState>();
  List<String> categoryList = Category.values.map((e) => e.name).toList();
  List<String> optionList = Option.values.map((e) => e.name).toList();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title:const Text("Create New Survey")),
          drawer: const SideMenu(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                 const SizedBox(
                    width: 50,
                  ),
                  const Text(
                    "Create New Survey",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  InputField(
                      controller: title, placeholder: "Title", widthValue: 800),
                  InputField(
                      controller: description,
                      placeholder: "Description",
                      widthValue: 800),
                  InputField(
                      controller: legend, placeholder: "Legend", widthValue: 800),
                  DropDown(
                    controller: category,
                    placeholder: "Category",
                    list: categoryList,
                    widthValue: 800,
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      InputField(
                          controller: statement,
                          placeholder: "Question",
                          widthValue: 350),
                      DropDown(
                          controller: optionCategory,
                          placeholder: "Option Type",
                          list: optionList,
                          widthValue: 130),
                      SizedBox(
                        width: 170,
                        child: CheckboxListTile(

                          title: const Text("Required"),
                          value: required,
                          onChanged: (newValue) {
                            setState(() {
                              required = newValue!;
                            });
                          },
                          controlAffinity: ListTileControlAffinity
                              .leading, //  <-- leading Checkbox
                        ),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 20),
                              textStyle: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          onPressed: () {
                            setState(() {
                              formKey.currentState!.save();
                              questions.add(Question(
                                  statement: statement.text,
                                  option: Option.values.byName(optionCategory.text),
                                  questionOrder: (questions.length + 1),
                                  required: required));
                            });

                          },
                          child: const Text(
                            "+",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.white),
                          )),

                    ],
                  ),
                  DataTable(columns: _createColumns(), rows: _createRows())
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }

  List<DataColumn> _createColumns() {
    return [
      const DataColumn(label: Text('#')),
      const DataColumn(label: Text('Statement')),
      const DataColumn(label: Text('Options')),
      const DataColumn(label: Text('Required')),
      const DataColumn(label: Text('Edit')),
    ];
  }

  List<DataRow> _createRows() {
    return List.generate(
      questions.length,
      (index) {
        var e = questions[index];
        return DataRow(cells: [
          DataCell(Text(e.questionOrder.toString())),
          DataCell(Text(e.statement)),
          DataCell(Text(e.option.toString())),
          DataCell(Text(e.required.toString())),
          DataCell(
            SizedBox(
              height: 40.0,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Edit"),
              ),
            ),
          )
        ]);
      },
    ).toList();
  }
}
