import 'package:employee_manager/models/information_model.dart';
import 'package:employee_manager/repository/data_repository.dart';
import 'package:employee_manager/repository/information_repository.dart';
import 'package:employee_manager/view_models/user_prefrence_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/route_name.dart';
import '../utils/utils.dart';
import '../validation.dart';

class InformationViewModel extends GetxController{

  final _api = DataRepository();
  final _apiService = InformationRepository();
  final _userPreference = UserPreference();

  final email = TextEditingController().obs;
  final name = TextEditingController().obs;
  final idNumber = TextEditingController().obs;
  final phoneNumber = TextEditingController().obs;
  final aptNumber  = TextEditingController().obs;
  final accNumber  = TextEditingController().obs;
  String? selectedGender;
  String? selectedAddress;
  String? selectedBank;
  String? frontImageUrl;
  String? backImageUrl;
  String? birthday;

  final passwordController = TextEditingController().obs;
  final newPasswordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;


  String? validatePassword(){
    if(!Validation.isNotEmpty(passwordController.value.text)){
      return "Vui lòng nhập mât khẩu hiện tại";
    }else if(!Validation.isNotEmpty(newPasswordController.value.text)){
      return "Vui lòng nhập mật khẩu mới";
    }else if(newPasswordController.value.text != confirmPasswordController.value.text){
      return "Mật khẩu không trùng nhau";
    }
  }

  String? validateInformation(
      String email,
      String name,
      String idNumber,
      String phoneNumber,
      String birthday,
      String selectedGender,
      String selectedAddress,
      String frontImageUrl,
      String backImageUrl,
      ) {
    if (!Validation.isNotEmpty(email)){
      return "Vui lòng nhập email";
    }
    else if(!Validation.isValidEmail(email)){
      return "Vui lòng nhập đúng định dạng emal";
    }
    else if(!Validation.isNotEmpty(name)){
      return "Vui lòng nhập họ tên";
    }
    else if(!Validation.isNotEmpty(idNumber)){
      return "Vui lòng nhập số căn cước";
    }
    else if(!Validation.isValidIDNumber(idNumber)){
      return  "Vui lòng nhập đúng định dạng số căn cước";
    }
    else if(!Validation.isNotEmpty(phoneNumber)){
      return "Vui lòng nhập số điện thoại";
    }
    else if(!Validation.isValidIDNumber(phoneNumber)){
      return  "Vui lòng nhập đúng định dạng số điện thoại";
    }
    else if(!Validation.isNotEmpty(birthday)){
      return  "Vui lòng nhập ngày sinh";
    }
    else if(selectedGender?.isNotEmpty != true){
      return "Vui lòng chọn giới tính";
    }
    else if(!Validation.isNotEmpty(selectedAddress)){
      return  "Vui lòng chọn địa chỉ chi tiết";
    }
    else if(frontImageUrl?.isNotEmpty != true){
      return  "Vui lòng thêm ảnh căn cước mặt trước";
    }
    else if(backImageUrl?.isNotEmpty != true){
      return  "Vui lòng thêm ảnh căn cước mặt sau";
    }
  }

  RxBool loading = false.obs;


  void informationApi() {
    loading.value = true;

    InformationModel infor = InformationModel(
      email: email.value.text,
      hoTen: name.value.text,
      soCmnd: idNumber.value.text,
      soDienThoai: phoneNumber.value.text,
      namSinh: birthday,
      gioiTinh: selectedGender.toString(),
      diaChi: selectedAddress.toString(),
      nganHang: selectedBank.toString(),
      soTaiKhoan: accNumber.value.text,
      anhMatSau: backImageUrl.toString(),
      anhMatTruoc: frontImageUrl.toString()
    );

    Map<String, dynamic> data = infor.toJson();


    _api.postInformation(data).then((value) {
      loading.value = false;
      _userPreference.updateScreenStatus('waiting');
      Utils.snackBar("Thông tin", "Cập nhật thông tin thành công!");
      Get.toNamed(RouteName.homeView);
    }).onError((error, stackTrace) {
      loading.value = false;
      print(error.toString());
      Utils.snackBar("Loi", error.toString());
    });
  }


  void changePassword(){
    loading.value = true;
    Map<String, dynamic> data = {
      'current_password': passwordController.value.text,
      'new_password': newPasswordController.value.text
    };

    _apiService.changePassword(data).then((value) {
      loading.value = false;
      Utils.snackBar("Đổi mật khẩu", "Đổi mật khẩu thành công!");
    }).onError((error, stackTrace) {
      loading.value = false;
      print(error.toString());
      Utils.snackBar("Loi", error.toString());
    });



  }


}