import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:try_dynamic/pages/question_field.dart';
import 'package:try_dynamic/widgets/drop_down.dart';
import 'package:try_dynamic/widgets/input_field.dart';
import '../structural/option.dart';
import '../structural/question.dart';
import '../widgets/side_menu.dart';
import 'CreateSurvey.dart';
import 'assessment_form.dart';

class ApplicationForm extends StatefulWidget {
  const ApplicationForm({Key? key}) : super(key: key);

  @override
  State<ApplicationForm> createState() => _ApplicationFormState();
}

class _ApplicationFormState extends State<ApplicationForm> {
  final _addFormKey = GlobalKey<FormState>();
  TextEditingController fullName = TextEditingController();
  TextEditingController martialStatus = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController mailingAddress = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController postalCode = TextEditingController();
  TextEditingController province = TextEditingController();
  TextEditingController email = TextEditingController();
  List<String> martialStatusList = ['single', 'married', 'divorced', 'widow'];
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
    return SafeArea(
        child: Scaffold(
      body: Form(
        key: _addFormKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 35,
                  ),
                  const Text(
                    "Application form",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Wrap(
                    children: [
                      InputField(
                          controller: fullName,
                          placeholder: 'Full Name',
                          widthValue: 600),
                      InputField(
                          controller: mailingAddress,
                          placeholder: 'Mailing Address',
                          widthValue: 600),
                      InputField(
                          controller: city,
                          placeholder: 'City',
                          widthValue: 600),
                      InputField(
                          controller: province,
                          placeholder: 'Province',
                          widthValue: 600),
                      InputField(
                          controller: postalCode,
                          placeholder: 'Postal code',
                          widthValue: 600),
                      InputField(
                          controller: phoneNumber,
                          placeholder: 'Phone Number',
                          widthValue: 600),
                      InputField(
                          controller: postalCode,
                          placeholder: 'Email',
                          widthValue: 600),
                      const SizedBox(
                        height: 35,
                      ),
                      DropDown(
                        controller: martialStatus,
                        placeholder: "Martial Status",
                        list: martialStatusList,
                        widthValue: 600,
                      ),
                    ],
                  ),
                  const SizedBox(height: 35,),
                   Column(
                     children: List.generate(_phoneWidgets.length, (i) {
                       return _phoneWidgets[i];
                     }),
                   ),
                  const SizedBox(height: 35,),
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
                        Get.to(const AddSurvey());
                      },
                      child: const Text(
                        "Submit",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
  TextEditingController returnController(String controllerName) {
    final controllerName = TextEditingController();
    return controllerName;
  }
  void loadData() {
    questionList.add(Question(
      statement: "መልካምነቴና ትእግስተኛነቴ",
      option: Option.annotatedTen,
      questionOrder: 1,
      required: false,
    ));
    questionList.add(Question(
      statement: "በቡድን ስራ ላይ ተሰማርቼ የመስራት ችሎታዬ",
      option: Option.linearTen,
      questionOrder: 2,
      required: true,
    ));
    questionList.add(Question(
      statement: "ተግባቢነቴ",
      option: Option.linearFour,
      questionOrder: 3,
      required: true,
    ));
    questionList.add(Question(
      statement: "ልዩነቶችን በአክብሮት የመመልከት ችሎታዬ",
      option: Option.annotatedFour,
      questionOrder: 4,
      required: true,
    ));
    questionList.add(Question(
      statement: "አሳማኝ የሆኑ ሀሳቦችን ተቀብዬ ለማስተናገድ ያለኝ ዝንባሌ",
      option: Option.shortAnswer,
      questionOrder: 5,
      required: true,
    ));
    questionList.add(Question(
      statement: "ለመማር ያለኝ ጥማት",
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
