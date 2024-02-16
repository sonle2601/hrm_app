import 'package:employee_manager/models/exit_model.dart';
import 'package:employee_manager/repository/exit_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/work_schedule_model.dart';
import '../../routes/route_name.dart';
import '../../utils/utils.dart';
import '../../validation.dart';

class ExitRequestViewModel extends GetxController{
  final _api = ExitRepository();

  var exit = ExitModel().obs;


  int? workScheduleId;
  final reasonController = TextEditingController().obs;
  final  minutesOutController = TextEditingController().obs;
  RxBool loadData = false.obs;
  RxBool loading = false.obs;
  String statusButton = 'pending';
  RxBool exists = false.obs;
  bool enableReason = false;

  String? workShiftId;
  String? date;

  String? validate(WorkScheduleModel workScheduleModel) {
    if (!Validation.isNotEmpty(reasonController.value.text)) {
      return "Vui lòng nhập lý do";
    }else if(!Validation.isNotEmpty(minutesOutController.value.text)){
      return "Vui lòng số phút";
    }else if(!Validation.isMinutesInRange(minutesOutController.value.text, workScheduleModel.workShift!.startTime.toString(), workScheduleModel.workShift!.endTime.toString())){
      return "Thời gian xin ra ngoài không vượt quá thời gian ca";
    }
    return null;
  }

  void addExitRequest() {
    int? minutesOut = int.tryParse(minutesOutController.value.text);
    loading.value = true;
    ExitModel exitModel = ExitModel(
      minutesOut: minutesOut,
      reason: reasonController.value.text,
      workScheduleId: workScheduleId,
    );

    Map<String, dynamic> data = exitModel.toJson();


    _api.addExitRequest(data).then((value) {
      loading.value = false;
      Utils.snackBar("Xin ra ngoài", "Đã đăng kí xin ra ngoài thành công!");
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar("Lỗi", error.toString());
    });
  }

  Future<void> getExitRequest(String workScheduleId, WorkScheduleModel workScheduleModel) async {
    try {
      loadData.value = false;
      ExitModel? exitModel = await _api.getExitRequest(workScheduleId.toString());
      if (exitModel != null) {
        exit.value = exitModel;
        reasonController.update((val) {
          val!.text = exitModel.reason.toString();
        });
        minutesOutController.update((val) {
          val!.text = exitModel.minutesOut.toString();
        });
      }
      if(exitModel!.status == 'approved'){
        statusButton = 'approved';
      }else if((exitModel!.status == 'rejected')){
        statusButton = 'rejected';
      }else{
        statusButton = 'pending';
      }
      enableReason = false;
      loadData.value = true;
      Get.toNamed(RouteName.exitRequestScreen, arguments: workScheduleModel);
    } catch (error) {
      reasonController.value.text = '';
      minutesOutController.value.text = '';
      statusButton = 'notExists';
      enableReason = true;
      update();
      Get.toNamed(RouteName.exitRequestScreen, arguments: workScheduleModel);
      print(error.toString());
      // Utils.snackBar("Lỗi", error.toString());
    }
  }
  void exitRequest(WorkScheduleModel? workScheduleModel){
    date = workScheduleModel!.date.toString();
    workShiftId = workScheduleModel.workShiftId.toString();
    getExitRequest(workScheduleModel.id.toString(), workScheduleModel);
  }

  void deleteExitRequest(String idExitRequest){
    _api.delete(idExitRequest).then((value) {
      loading.value = false;
      Utils.snackBar("Xin ra ngoài", "Đã huỷ xin ra ngoài thành công!");
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar("Lỗi", error.toString());
    });
  }

}