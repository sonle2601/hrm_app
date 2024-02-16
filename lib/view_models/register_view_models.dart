
import 'package:employee_manager/repository/auth_repository.dart';
import 'package:employee_manager/routes/route_name.dart';
import 'package:employee_manager/view_models/user_prefrence_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/token_model.dart';
import '../models/user_model.dart';
import '../utils/utils.dart';
import '../validation.dart';

class RegisterViewModel extends GetxController{
  final _api = AuthRepository();
  final _userPreference = UserPreference();


  final emailController = TextEditingController().obs;
  final nameController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final confirmController = TextEditingController().obs;



  String? validateRegister(String name, String email, String password, String confirmPassword) {
    if (!Validation.isNotEmpty(name)) {
      return "Vui lòng nhập tên";
    } else if (!Validation.isNotEmpty(email)) {
      return "Vui lòng nhập email";
    } else if (!Validation.isValidEmail(email)) {
      return "Vui lòng nhập một địa chỉ email hợp lệ";
    } else if (!Validation.isNotEmpty(password)) {
      return "Vui lòng nhập mật khẩu";
    }else if (password != confirmPassword) {
      return "Mật khẩu không khóp nhau";
    }
    return null;
  }



  RxBool loading = false.obs;

  void registerApi() {
    loading.value = true;

    UserModel user = UserModel(
      name: nameController.value.text.trim(),
      email: emailController.value.text.trim(),
      password: passwordController.value.text.trim(),
      role: "staff",
    );

    Map<String, dynamic> data = user.toJson();



    _api.register(data).then((value) {
      loading.value = false;
      TokenModels token = TokenModels(
        token: value['token'],
        isLogin: true,
      );
      _userPreference.saveUser(token).then((value) {
        _api.checkInfo().then((value) {
          _userPreference.updateScreenStatus("information");
          Get.toNamed(RouteName.informationScreen);
        }).onError((error, stackTrace) {
        });
      }).onError((error, stackTrace) {
      });
      Utils.snackBar("Register", "Register Success!");
      Get.toNamed(RouteName.informationScreen);
    }).onError((error, stackTrace) {
      loading.value = false;
      print(error.toString());
      Utils.snackBar("Loi", error.toString());
    });
  }

}