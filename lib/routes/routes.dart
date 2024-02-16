

import 'package:employee_manager/routes/route_name.dart';
import 'package:employee_manager/testgdapi.dart';
import 'package:employee_manager/view/home_screen.dart';
import 'package:employee_manager/view/information_screen.dart';
import 'package:employee_manager/view/register_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static appRoutes() =>[

    GetPage(name: RouteName.registerScreen,
        page:() =>  RegisterScreen(),
        transitionDuration: Duration(microseconds: 250),
        transition: Transition.leftToRightWithFade,
    ),
    GetPage(name: RouteName.homeView,
        page:() =>  HomeScreen(),
        transitionDuration: Duration(microseconds: 250),
        transition: Transition.leftToRightWithFade,
    ),
    GetPage(name: RouteName.informationScreen,
      page:() =>  InformationScreen(),
      transitionDuration: Duration(microseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    //
    // GetPage(name: RouteName.homeView,
    //   page:() =>  HomeView(),
    //   transitionDuration: Duration(microseconds: 250),
    //   transition: Transition.leftToRightWithFade,
    // ),
  ];
}