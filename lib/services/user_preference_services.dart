
import 'dart:async';

import 'package:employee_manager/repository/auth_repository.dart';
import 'package:get/get.dart';

import '../routes/route_name.dart';
import '../view_models/user_prefrence_view_model.dart';

class UserPreferenceServices{

  UserPreference userPreference = UserPreference();
  AuthRepository _api = AuthRepository();


  Future<bool> isLogin() async {
    try {
      final userInfo = await userPreference.getUser();
      final infoCheck = await _api.checkInfo();



      if (userInfo.isLogin == false || userInfo.isLogin.toString() == 'null') {
        await Future.delayed(const Duration(seconds: 3));
        Get.toNamed(RouteName.loginScreen);
      } else if (infoCheck['information_exists'] == true) {
        Get.toNamed(RouteName.homeView);
      } else {
        Get.toNamed(RouteName.informationScreen);
      }
    } catch (error) {
      // Xử lý lỗi nếu cần
      print(error);
    }
    return true;

  }


}