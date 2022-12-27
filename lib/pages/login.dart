import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:get/get.dart';
import 'package:try_dynamic/pages/applicationForm.dart';
import 'package:try_dynamic/pages/dashboard.dart';
import 'package:try_dynamic/pages/register.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final _addFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _addFormKey,
                child: Center(
                  child: SizedBox(
                    width: 400,
                    height: 800,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                          height: 50,
                        ),
                        TextFormField(
                          controller: username,
                          decoration: const InputDecoration(
                            label: Text("Username"),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0))),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "This field is Required!";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        TextFormField(
                          controller: password,
                          obscureText: true,
                          decoration: const InputDecoration(
                            label: Text("Password"),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0))),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password cannot be empty!";
                            }
                            return null;
                          },
                        ),
                        TextButton(
                          onPressed: () {
                            Get.defaultDialog(middleText: "Forgot password Clicked",);
                          },
                          child: const Text(
                            "Forget Password?",
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
                               Get.to(const Dashboard());
                            },
                            child: const Text(
                              "Login",textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Colors.white),
                            )),
                        const SizedBox(
                          height: 25,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Register()),
                              );
                            },
                            child: const Text(
                              "Create New Account",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  ),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            bottomSheet: SizedBox(
                height: 60,
                child: Footer(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                      Center(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const <Widget>[
                              Text(
                                'Copyright ©2022, All Rights Reserved.',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15.0,
                                    color: Colors.deepOrange),
                              ),
                            ]),
                      ),
                    ])))));
  }
}
