import 'package:employee_manager/models/information_model.dart';
import 'package:employee_manager/repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/route_name.dart';
import '../utils/utils.dart';
import '../validation.dart';

class InformationViewModel extends GetxController{

  final _api = DataRepository();

  final email = TextEditingController().obs;
  final name = TextEditingController().obs;
  final idNumber = TextEditingController().obs;
  final phoneNumber = TextEditingController().obs;
  final birthday = TextEditingController().obs;
  final aptNumber  = TextEditingController().obs;
  final accNumber  = TextEditingController().obs;
  String? selectedGender;
  String? selectedCity, selectedDistrict, selectedWard;
  String? selectedBank;
  String? frontImageUrl;
  String? backImageUrl;

  String? validateInformation(
      String email,
      String name,
      String idNumber,
      String phoneNumber,
      String birthday,
      String aptNumber,
      String selectedGender,
      String selectedCity,
      String selectedDistrict,
      String selectedWard,
      String frontImageUrl,
      String backImageUrl,
      ) {
    if (!isNotEmpty(email)){
      return "Vui lòng nhập email";
    }
    else if(!isValidEmail(email)){
      return "Vui lòng nhập đúng định dạng emal";
    }
    else if(!isNotEmpty(name)){
      return "Vui lòng nhập họ tên";
    }
    else if(!isNotEmpty(idNumber)){
      return "Vui lòng nhập số căn cước";
    }
    else if(!isValidIDNumber(idNumber)){
      return  "Vui lòng nhập đúng định dạng số căn cước";
    }
    else if(!isNotEmpty(phoneNumber)){
      return "Vui lòng nhập số điện thoại";
    }
    else if(!isValidIDNumber(phoneNumber)){
      return  "Vui lòng nhập đúng định dạng số điện thoại";
    }
    else if(!isNotEmpty(birthday)){
      return  "Vui lòng nhập ngày sinh";
    }
    else if(selectedGender?.isNotEmpty != true){
      return "Vui lòng chọn giới tính";
    }
    else if(selectedWard?.isNotEmpty != true){
      return  "Vui lòng chọn địa chỉ hiện tại";
    }
    else if(!isNotEmpty(aptNumber)){
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
      namSinh: birthday.value.text,
      gioiTinh: selectedGender.toString(),
      thanhPho: selectedCity.toString(),
      huyen: selectedDistrict.toString(),
      xa: selectedWard.toString(),
      soNha: aptNumber.value.text,
      nganHang: selectedBank.toString(),
      soTaiKhoan: accNumber.value.text,
      anhMatSau: backImageUrl.toString(),
      anhMatTruoc: frontImageUrl.toString()
    );

    Map<String, dynamic> data = infor.toJson();


    _api.postInformation(data).then((value) {
      loading.value = false;
      Utils.snackBar("Thông tin", "Cập nhật thông tin thành công!");
      Get.toNamed(RouteName.homeView);
    }).onError((error, stackTrace) {
      loading.value = false;
      print(error.toString());
      Utils.snackBar("Loi", error.toString());
    });
  }

}