import 'package:employee_manager/models/attendance_model.dart';
import 'package:employee_manager/models/exit_model.dart';
import 'package:employee_manager/repository/attendance_repository.dart';
import 'package:employee_manager/repository/exit_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/work_schedule_model.dart';
import '../../routes/route_name.dart';
import '../../utils/utils.dart';
import '../../validation.dart';

class AttendanceRequestViewModel extends GetxController{
  final _api = AttendanceRepository();

  var attendance = AttendanceModel().obs;


  int? workScheduleId;
  final  minutesOutController = TextEditingController().obs;
  RxBool loadData = false.obs;
  RxBool loading = false.obs;
  String statusButton = 'pending';
  RxBool exists = false.obs;
  bool enableReason = false;
  String checkIn = "Thời gian đến";
  String checkOut = "Thời gian về";

  String? workShiftId;
  String? date;

  String? validate(WorkScheduleModel workScheduleModel) {
    if (!Validation.isTime(checkIn)) {
      return "Vui lòng chọn giờ đến";

    }else if (!Validation.isWithinShift(checkIn,workScheduleModel.workShift!.startTime.toString(), workScheduleModel.workShift!.endTime.toString())) {
      return "Thời gian đến không được ngoài thời gian ca";
    }
    else if (!Validation.isTime(checkOut)) {
      return "Vui lòng chọn giờ về";
    }else if (!Validation.isWithinShift(checkOut,workScheduleModel.workShift!.startTime.toString(), workScheduleModel.workShift!.endTime.toString())) {
      return "Thời gian về không được ngoài thời gian ca";
    }
    return null;
  }

  void addAttendanceRequest() {
    int? minutesOut = int.tryParse(minutesOutController.value.text);
    loading.value = true;
    AttendanceModel attendanceModel = AttendanceModel(
      minutesOut: minutesOut ?? 0,
      checkIn: checkIn,
      checkOut: checkOut,
      workScheduleId: workScheduleId,
    );

    Map<String, dynamic> data = attendanceModel.toJson();


    _api.addAttendanceRequest(data).then((value) {
      loading.value = false;
      Utils.snackBar("Chấm công bổ sung", "Đã chấm công bổ sung thành công!");
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar("Lỗi", error.toString());
    });
  }

  Future<void> getAttendanceRequest(String workScheduleId, WorkScheduleModel workScheduleModel) async {
    try {
      loadData.value = false;
      AttendanceModel? attendanceModel = await _api.getAttendanceRequest(workScheduleId.toString());
      if (attendanceModel != null) {
        attendance.value = attendanceModel;
        checkIn = attendanceModel.checkIn.toString();
        checkOut = attendanceModel.checkOut.toString();
        minutesOutController.update((val) {
          val!.text = attendanceModel.minutesOut.toString();
        });
      }
      if(attendanceModel!.status == 'approved'){
        statusButton = 'approved';
      }else if((attendanceModel!.status == 'rejected')){
        statusButton = 'rejected';
      }else{
        statusButton = 'pending';
      }
      enableReason = false;
      loadData.value = true;
      Get.toNamed(RouteName.attendanceRequestScreen, arguments: workScheduleModel);
    } catch (error) {
      minutesOutController.value.text = '';
       checkIn = "Thời gian đến";
       checkOut = "Thời gian về";
      statusButton = 'notExists';
      enableReason = true;
      update();
      Get.toNamed(RouteName.attendanceRequestScreen, arguments: workScheduleModel);
      print(error.toString());
      // Utils.snackBar("Lỗi", error.toString());
    }
  }
  void attendanceRequest(WorkScheduleModel? workScheduleModel){
    date = workScheduleModel!.date.toString();
    workShiftId = workScheduleModel.workShiftId.toString();
    getAttendanceRequest(workScheduleModel.id.toString(), workScheduleModel);
  }



  void deleteAttendanceRequest(String idAttendanceRequest){
    _api.delete(idAttendanceRequest).then((value) {
      loading.value = false;
      Utils.snackBar("Xin chấm công bổ sung", "Đã huỷ chấm công bổ sung thành công!");
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar("Lỗi", error.toString());
    });
  }

}