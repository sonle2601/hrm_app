

import 'package:employee_manager/routes/route_name.dart';
import 'package:employee_manager/testgdapi.dart';
import 'package:employee_manager/view/account/information/employee_edit_info_personal.dart';
import 'package:employee_manager/view/account/information/employee_info_widget.dart';
import 'package:employee_manager/view/account/security/password_change_screen.dart';
import 'package:employee_manager/view/approval/attendance/attendance_request_screen.dart';
import 'package:employee_manager/view/approval/exit/exit_request_screen.dart';
import 'package:employee_manager/view/approval/late_early/early_request_screen.dart';
import 'package:employee_manager/view/approval/late_early/late_request_screen.dart';
import 'package:employee_manager/view/home/home_screen.dart';
import 'package:employee_manager/view/information_screen.dart';
import 'package:employee_manager/view/invite_screen.dart';
import 'package:employee_manager/view/login_screen.dart';
import 'package:employee_manager/view/main_screen.dart';
import 'package:employee_manager/view/register_screen.dart';
import 'package:employee_manager/view/saver_screen.dart';
import 'package:employee_manager/view/task/attendance/attendance_detail_screen.dart';
import 'package:employee_manager/view/task/news_feed/news_detail_screen.dart';
import 'package:employee_manager/view/task/salary/saraly_personal_screen.dart';
import 'package:employee_manager/view/home/personal_schedule/detail_schedule_screen.dart';
import 'package:employee_manager/view/home/personal_schedule/personal_schedule.dart';
import 'package:employee_manager/view/approval/shift_leave/shift_leave_request_screen.dart';
import 'package:employee_manager/view/work_schedule/work_schedule_screen.dart';
import 'package:get/get.dart';

import '../view/task/news_feed/news_list_screen.dart';

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

    GetPage(name: RouteName.saverScreen,
      page:() =>  SaverScreen(),
      transitionDuration: Duration(microseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(name: RouteName.loginScreen,
      page:() =>  LoginScreen(),
      transitionDuration: Duration(microseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(name: RouteName.inviteScreen,
      page:() =>  InviteScreen(),
      transitionDuration: Duration(microseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(name: RouteName.mainScreen,
      page:() =>  MainScreen(),
      transitionDuration: Duration(microseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(name: RouteName.employeeInfo,
      page:() =>  EmployeeInfoWidget(),
      transitionDuration: Duration(microseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(name: RouteName.workSchedule,
      page:() =>  WorkScheduleScreen(),
      transitionDuration: Duration(microseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(name: RouteName.personalSchedule,
      page:() =>  PersonalShcedule(),
      transitionDuration: Duration(microseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(name: RouteName.detailScheduleScreen,
      page:() =>  DetailScheduleScreen(),
      transitionDuration: Duration(microseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(name: RouteName.shiftLeaveRequestScreen,
      page:() =>  ShiftLeaveRequestScreen(),
      transitionDuration: Duration(microseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(name: RouteName.attendanceDetailScreen,
      page:() =>  AttendanceDetailScreen(),
      transitionDuration: Duration(microseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(name: RouteName.salaryPersonalScreen,
      page:() =>  SalaryPersonalScreen(),
      transitionDuration: Duration(microseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(name: RouteName.newsListScreen,
      page:() =>  NewsListScreen(),
      transitionDuration: Duration(microseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(name: RouteName.newsDetailScreen,
      page:() =>  NewsDetailScreen(),
      transitionDuration: Duration(microseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(name: RouteName.passwordChangeScreen,
      page:() =>  PasswordChangeScreen(),
      transitionDuration: Duration(microseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),GetPage(name: RouteName.employeeEditInfoPersonal,
      page:() =>  EmployeeEditInfoPersonal(),
      transitionDuration: Duration(microseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(name: RouteName.lateRequestScreen,
      page:() =>  LateRequestScreen(),
      transitionDuration: Duration(microseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(name: RouteName.earlyRequestScreen,
      page:() =>  EarlyRequestScreen(),
      transitionDuration: Duration(microseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(name: RouteName.exitRequestScreen,
      page:() =>  ExitRequestScreen(),
      transitionDuration: Duration(microseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(name: RouteName.attendanceRequestScreen,
      page:() =>  AttendanceRequestScreen(),
      transitionDuration: Duration(microseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),

  ];
}