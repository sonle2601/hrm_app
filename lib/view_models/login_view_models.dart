import 'package:employee_manager/models/token_model.dart';
import 'package:employee_manager/repository/auth_repository.dart';
import 'package:employee_manager/view_models/user_prefrence_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';
import '../routes/route_name.dart';
import '../utils/utils.dart';
import '../validation.dart';

class LoginViewModel extends GetxController{

  final _api = AuthRepository();
  UserPreference userPreference = UserPreference();


  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  String? validateLogin(String email, String password) {
     if (!isNotEmpty(email)) {
      return "Vui lòng nhập email";
    } else if (!isValidEmail(email)) {
      return "Vui lòng nhập một địa chỉ email hợp lệ";
    } else if (!isNotEmpty(password)) {
      return "Vui lòng nhập mật khẩu";
    }
    return null;
  }

  RxBool loading = false.obs;

  void loginApi() {
    loading.value = true;



    UserModel user = UserModel(
      email: emailController.value.text.trim(),
      password: passwordController.value.text.trim(),
    );

    Map<String, dynamic> data = user.toJson();

    _api.login(data).then((value) {
      loading.value = false;

      TokenModels token = TokenModels(
        token: value['token'],
        isLogin: true,
      );

      userPreference.saveUser(token).then((value) {
        _api.checkInfo().then((value) {
          if (value['information_exists'] == true) {
            Get.toNamed(RouteName.homeView);
          }else {
            Get.toNamed(RouteName.informationScreen);
          }
        }).onError((error, stackTrace) {
        });
      }).onError((error, stackTrace) {

      });
      Utils.snackBar("Login", "Login Success!");

    }).onError((error, stackTrace) {
      loading.value = false;
      print(error.toString());
      Utils.snackBar("Loi", error.toString());
    });
  }


}