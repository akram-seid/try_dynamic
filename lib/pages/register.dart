import 'package:flutter/material.dart';
import 'package:try_dynamic/pages/applicationForm.dart';
import 'package:try_dynamic/pages/login.dart';
import 'package:try_dynamic/widgets/input_field.dart';
import '../widgets/password_field.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _addFormKey = GlobalKey<FormState>();
  TextEditingController fullName = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
              key: _addFormKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Touch Point Mentoring and Leadership",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    const Text(
                      "Register",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      width: 400,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 35,
                          ),
                          InputField(controller: fullName,placeholder: 'Full Name',widthValue: 400,),
                          InputField(controller: username,placeholder: 'Username',widthValue: 400,),
                          PasswordField(controller: password,placeholder:'Password' ),
                          PasswordField(controller: confirmPassword,placeholder:'Confirm Password' ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Login()),
                              );
                            },
                            child: const Text(
                              "Already have account? Login here.",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          const SizedBox(
                            height: 35,
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const ApplicationForm()),
                                );
                              },
                              child: const Text(
                                "Register",textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: Colors.white),
                              )),
                          const SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),),
        ),
      ),
    ));
  }
}
