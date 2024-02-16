import 'package:employee_manager/routes/routes.dart';
import 'package:employee_manager/services/user_preference_services.dart';
import 'package:employee_manager/test2.dart';
import 'package:employee_manager/view/information_screen.dart';
import 'package:employee_manager/view/invite_screen.dart';
import 'package:employee_manager/view/login_screen.dart';
import 'package:employee_manager/view/register_screen.dart';
import 'package:employee_manager/view/saver_screen.dart';
import 'package:employee_manager/view/splash_screen.dart';
import 'package:employee_manager/view_models/user_prefrence_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {
  UserPreferenceServices userPreferenceServices = UserPreferenceServices();
  // final _userPreference = UserPreference();

  @override
  void initState() {


  // _userPreference.updateScreenStatus('waiting');

    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      getPages: AppRoutes.appRoutes(),
    );
  }
}


