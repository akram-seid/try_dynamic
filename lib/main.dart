import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:try_dynamic/pages/CreateSurvey.dart';
import 'package:try_dynamic/pages/applicationForm.dart';
import 'package:try_dynamic/pages/assessment_form.dart';
import 'package:try_dynamic/pages/dashboard.dart';
import 'package:try_dynamic/pages/login.dart';
import 'package:try_dynamic/pages/register.dart';
import 'package:try_dynamic/structural/user.dart';
import 'package:try_dynamic/widgets/side_menu.dart';

import 'constants.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var initialRoute = 'login';

  var isUserLoggedIn = await User.isUserLoggedIn();

  if (isUserLoggedIn) {
    initialRoute = 'dashboard';
  }

  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Touch Point',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: primaryColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.black),
          canvasColor: secondaryColor,
        ),
        initialRoute: initialRoute,
        routes: {
          'login': (context) => const Login(),
          'dashboard': (context) => const Dashboard(),
          'application-form': (context) => const ApplicationForm(),
          'users': (context) => const Dashboard(),
          'create-survey': (context) => const AddSurvey(),
          'register': (context) => const Register(),
        }
    );
  }
}
