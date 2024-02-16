import 'dart:developer';

import 'package:employee_manager/models/work_schedule_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/leave_model.dart';
import '../../repository/leave_repository.dart';
import '../../routes/route_name.dart';
import '../../utils/utils.dart';
import '../../validation.dart';

class LeaveRequestViewModel extends GetxController{
  final _api = LeaveRepository();

  var leave = LeaveModel().obs;


  int? workScheduleId;
  final reasonController = TextEditingController().obs;
  RxBool loadData = false.obs;
  RxBool loading = false.obs;
  String statusButton = 'waiting';
  RxBool exists = false.obs;
  bool enableReason = false;

  String? workShiftId;
  String? date;



  String? validate() {
   if (!Validation.isNotEmpty(reasonController.value.text)) {
      return "Vui lòng nhập lý do";
    }
    return null;
  }

  void addLeaveRequest() {
    loading.value = true;
    LeaveModel leaveModel = LeaveModel(
        reason: reasonController.value.text,
        workScheduleId: workScheduleId,
    );

    Map<String, dynamic> data = leaveModel.toJson();


    _api.addLeaveRequest(data).then((value) {
      loading.value = false;
      Utils.snackBar("Nghỉ ca", "Đã đăng kí nghỉ ca thành công!");
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar("Lỗi", error.toString());
    });
  }

  Future<void> getLeaveRequest(String workScheduleId, WorkScheduleModel workScheduleModel) async {
    try {
      loadData.value = false;
      LeaveModel? leaveModel = await _api.getLeaveRequest(workScheduleId.toString());
      if (leaveModel != null) {
        leave.value = leaveModel;
        reasonController.update((val) {
          val!.text = leaveModel.reason.toString();
        });
      }
      log(leaveModel!.status.toString());
      if(leaveModel!.status == 'refuse'){
        statusButton = 'refuse';
      }else if((leaveModel!.status == 'accept')){
        statusButton = 'accept';
      }else{
        statusButton = 'waiting';
      }
      enableReason = false;
      loadData.value = true;
      Get.toNamed(RouteName.shiftLeaveRequestScreen, arguments: workScheduleModel);
    } catch (error) {
      reasonController.value.text = '';
      statusButton = 'notExists';
      enableReason = true;
      update();
      Get.toNamed(RouteName.shiftLeaveRequestScreen, arguments: workScheduleModel);
      print(error.toString());
      // Utils.snackBar("Lỗi", error.toString());
    }
  }
  // Future<void> getLeaveRequestExists(String workScheduleId) async {
  //   try {
  //     loadData.value = false;
  //     leave.value = await _api.getLeaveRequest(workScheduleId.toString());
  //     loadData.value = true;
  //   } catch (error) {
  //     print(error.toString());
  //     Utils.snackBar("Lỗi", error.toString());
  //   }
  // }

void leaveRequest(WorkScheduleModel? workScheduleModel){
    date = workScheduleModel!.date.toString();
    workShiftId = workScheduleModel.workShiftId.toString();
    getLeaveRequest(workScheduleModel.id.toString(), workScheduleModel);
}

void deleteLeaveRequest(String idLeaveRequest){
  _api.delete(idLeaveRequest).then((value) {
    loading.value = false;
    Utils.snackBar("Nghỉ ca", "Đã huỷ nghỉ ca thành công!");
  }).onError((error, stackTrace) {
    loading.value = false;
    Utils.snackBar("Lỗi", error.toString());
  });
}


}