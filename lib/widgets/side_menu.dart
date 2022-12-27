import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:try_dynamic/pages/CreateSurvey.dart';
import 'package:try_dynamic/pages/applicationForm.dart';
import 'package:try_dynamic/pages/assessment_form.dart';
import 'package:try_dynamic/pages/dashboard.dart';
import 'package:try_dynamic/pages/login.dart';
import 'package:try_dynamic/pages/register.dart';
import '../pages/CreateSurvey.dart';
import 'drawer_list.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/touch_logo.png"),
          ),
          DrawerListTile(
            title: "Dashboard",
            svgSrc: "assets/icons/menu_dashbord.svg",
            press: () {
              Navigator.pop(context);
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const Dashboard()));
            },
          ),
          DrawerListTile(
            title: "Create Survey",
            svgSrc: "assets/icons/menu_tran.svg",
            press: () {
              Navigator.pop(context);
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const AddSurvey()));
            },
          ),
          DrawerListTile(
            title: "User Management",
            svgSrc: "assets/icons/menu_task.svg",
            press: () {
              Navigator.pop(context);
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const Dashboard()));
            },
          ),
          DrawerListTile(
            title: "Assessment Management",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {
              Navigator.pop(context);
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const Dashboard()));
            },
          ),
          DrawerListTile(
            title: "Assessment Result",
            svgSrc: "assets/icons/menu_store.svg",
            press: () {
              Navigator.pop(context);
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const Dashboard()));
            },
          ),
          DrawerListTile(
            title: "Content Management",
            svgSrc: "assets/icons/menu_notification.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Profile",
            svgSrc: "assets/icons/menu_profile.svg",
            press: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const Dashboard()));
            },
          ),
          DrawerListTile(
            title: "Settings",
            svgSrc: "assets/icons/menu_setting.svg",
            press: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const Dashboard()));
            },
          ),
        ],
      ),
    );
  }
}
