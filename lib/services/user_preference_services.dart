
import 'dart:async';

import 'package:get/get.dart';

import '../routes/route_name.dart';
import '../view_models/user_prefrence_view_model.dart';

class UserPreferenceServices{

  UserPreference _userPreference = UserPreference();


  Future<void> isLogin() async {
      final token = await _userPreference.getToken();
      if(token != null){
        Get.offAllNamed(RouteName.mainScreen);
      }else{
        Get.toNamed(RouteName.loginScreen);
      }

  }


}