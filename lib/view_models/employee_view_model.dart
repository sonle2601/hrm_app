import 'package:employee_manager/models/work_schedule_model.dart';
import 'package:employee_manager/routes/route_name.dart';
import 'package:employee_manager/validation.dart';
import 'package:employee_manager/view_models/user_prefrence_view_model.dart';
import 'package:employee_manager/widgets/select_item/select_address.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../utils/utils.dart';
import '../models/employee_model.dart';
import '../models/information_model.dart';
import '../models/leave_model.dart';
import '../repository/employee_repository.dart';
import 'package:intl/intl.dart';


class EmployeeViewModel extends GetxController{
  final _userPreference = UserPreference();
  final _api = EmployeeRepository();
  RxBool loadData = false.obs;
  var employee = EmployeeModel().obs;
  var employeeAvailable = <EmployeeModel>[].obs;
  var employeeInfo = EmployeeModel().obs;
  RxBool loading = false.obs;
  RxBool status = false.obs;
  String? workShiftId;
  String? date;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final nameEditController = TextEditingController().obs;
  final phoneEditController = TextEditingController().obs;
  final accEditController = TextEditingController().obs;
  String? birthdate;
  String? gender;
  String? address;
  String? accController;
  String? bank;

  String? birdayEdit;
  String? genderEdit;
  String? bankEdit;
  String? addressEdit;
  int? idInfor;
  int? idEmployee;

  @override
  void onInit(){
    super.onInit();
  }

  Future<void> getInvite() async {
    try {
      loadData.value = false;
      EmployeeModel? fetchedEmployee = await _api.getEmployee();
      employee.value = fetchedEmployee!;
      loadData.value = true;
    } catch (error) {
      print(error.toString());
      Utils.snackBar("Lỗi", error.toString());
    }
  }

  Future<void> getEmployeeInfo() async {
    try {
      loadData.value = false;
      EmployeeModel? employeeInfoModel = await _api.getEmployeeInfo();
      employeeInfo.value = employeeInfoModel!;
      loadData.value = true;
    } catch (error) {
      print(error.toString());
      Utils.snackBar("Lỗi", error.toString());
    }
  }

  Future<void> getEmployeeAvailable() async {
    try {
      loadData.value = false;
      List<EmployeeModel> employeeModel = await _api.getEmployeeAvailable(workShiftId!, date!);
      employeeAvailable.assignAll(employeeModel);
      loadData.value = true;
    } catch (error) {
      print(error.toString());
      Utils.snackBar("Lỗi", error.toString());
    }
  }

  String? validateInfo(){
    if(!Validation.isNotEmpty(phoneEditController.value.text)){
      return "Vui lòng nhập số điện thoại";
    } else if(!Validation.isNotEmpty(birdayEdit.toString())){
      return "Vui lòng chọn ngày sinh";
    }else if(!Validation.isNotEmpty(addressEdit.toString())){
      return "Vui lòng nhập địa chỉ";
    }else if(!Validation.isNotEmpty(genderEdit.toString())){
      return "Vui lòng chọn giới tính";
    }
  }



  bool checkSaralyType(String saralyType){
    if(saralyType == 'Trả lương theo tháng'){
      return true;
    }
    return false;
  }

  String formatSalary(String salary) {
    double salaryDouble = double.tryParse(salary) ?? 0.0;
    final formatter = NumberFormat('#,###');
    return formatter.format(salaryDouble);
  }


  void replyUser() {
    loading.value = true;

    var data = {
      'status': status.value // Loại bỏ dấu chấm phẩy ở đây
    };

    _api.replyUser(data).then((value) {
      loading.value = false;
      Utils.snackBar("Chấp nhận", "Chấp nhận thành công!");
      status.value = true;
      _userPreference.updateScreenStatus('information');
      Get.toNamed(RouteName.mainScreen);
    }).onError((error, stackTrace) {
      status.value = true;
      loading.value = false;
      switch (error){
        case 409 :
          Utils.snackBarError("Lỗi", "Đã có lời mời được gửi cho nhân viên");
        case 404 :
          Utils.snackBarError("Lỗi", "Email chưa được đăng kí tài khoản nhân viên");
      }
    });
  }

  void inforEmployee(EmployeeModel? employeeModel) {
    Get.toNamed(RouteName.employeeInfo, arguments: employeeModel); // Truyền dữ liệu vào arguments của Get.toNamed
  }

  void getInfoUpdate(EmployeeModel? employeeModel){
    idEmployee = employeeModel!.id;
    idInfor = employeeModel!.information!.id;
    nameEditController.value.text = employeeModel!.information!.hoTen.toString();
    phoneEditController.value.text = employeeModel!.information!.soDienThoai.toString();
    accEditController.value.text = employeeModel!.information!.soTaiKhoan.toString();
    birdayEdit = employeeModel!.information!.namSinh.toString();
    genderEdit = employeeModel!.information!.gioiTinh.toString();
    bankEdit = employeeModel!.information!.nganHang.toString();
    addressEdit = employeeModel!.information!.diaChi.toString();
    Get.toNamed(RouteName.employeeEditInfoPersonal, arguments: employeeModel);
  }

  void updateInfoEmployee() {
    loading.value = true;

    InformationModel informationModel = InformationModel(
        id: idInfor,
        hoTen: nameEditController.value.text,
        soDienThoai: phoneEditController.value.text,
        namSinh: birdayEdit,
        gioiTinh: genderEdit,
        diaChi: addressEdit,
        nganHang: bankEdit,
        soTaiKhoan: accEditController.value.text
    );

    Map<String, dynamic> data = informationModel.toJson();
    _api.updateInfoEmployee(data).then((value) {
      loading.value = false;
      getEmployeeInfo();
      Utils.snackBar("Thông tin", "Cập nhật thông tin nhân viên thành công!");
      status.value = true;
    }).onError((error, stackTrace) {
      status.value = true;
      loading.value = false;
    });
  }


}
