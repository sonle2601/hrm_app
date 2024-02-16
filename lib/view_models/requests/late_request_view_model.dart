import 'package:employee_manager/models/late_early_model.dart';
import 'package:employee_manager/repository/late_early_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/work_schedule_model.dart';
import '../../routes/route_name.dart';
import '../../utils/utils.dart';
import '../../validation.dart';

class LateRequestViewModel extends GetxController{
  final _api = LateEarlyRepository();

  var late = LateEarlyModel().obs;


  int? workScheduleId;
  final reasonController = TextEditingController().obs;
  RxBool loadData = false.obs;
  RxBool loading = false.obs;
  String statusButton = 'pending';
  RxBool exists = false.obs;
  bool enableReason = false;

  String? workShiftId;
  String? date;
  String time = "Chọn thời gian đến muộn";

  String? validate(WorkScheduleModel workScheduleModel) {
    if(!Validation.isTime(time.toString())){
      return "Vui lòng chọn thời gian đến muộn";
    }else if(!Validation.isWithinShift(time.toString(), workScheduleModel.workShift!.startTime.toString(), workScheduleModel.workShift!.endTime.toString())){
      return "Thời gian xin đi muộn không được sớm hoặc muộn hơn thời gian ca";
    }
    else if (!Validation.isNotEmpty(reasonController.value.text)) {
      return "Vui lòng nhập lý do";
    }
    return null;
  }

  void addLateRequest() {
    loading.value = true;
    LateEarlyModel lateEarlyModel = LateEarlyModel(
      time: time,
      reason: reasonController.value.text,
      workScheduleId: workScheduleId,
    );

    Map<String, dynamic> data = lateEarlyModel.toJson();


    _api.addLateRequest(data).then((value) {
      loading.value = false;
      Utils.snackBar("Xin đi muộn", "Đã đăng kí xin đi muộn thành công!");
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar("Lỗi", error.toString());
    });
  }

  Future<void> getLateRequest(String workScheduleId, WorkScheduleModel workScheduleModel) async {
    try {
      loadData.value = false;
      LateEarlyModel? lateEarlyModel = await _api.getLateRequest(workScheduleId.toString());
      if (lateEarlyModel != null) {
        late.value = lateEarlyModel;
        reasonController.update((val) {
          val!.text = lateEarlyModel.reason.toString();
        });
        time = lateEarlyModel.time.toString();
      }
      if(lateEarlyModel!.status == 'approved'){
        statusButton = 'approved';
      }else if((lateEarlyModel!.status == 'rejected')){
        statusButton = 'rejected';
      }else{
        statusButton = 'pending';
      }
      enableReason = false;
      loadData.value = true;
      Get.toNamed(RouteName.lateRequestScreen, arguments: workScheduleModel);
    } catch (error) {
      reasonController.value.text = '';
      time ="Chọn thời gian đến muộn";
      statusButton = 'notExists';
      enableReason = true;
      update();
      Get.toNamed(RouteName.lateRequestScreen, arguments: workScheduleModel);
      print(error.toString());
      // Utils.snackBar("Lỗi", error.toString());
    }
  }

  void lateRequest(WorkScheduleModel? workScheduleModel){
    date = workScheduleModel!.date.toString();
    workShiftId = workScheduleModel.workShiftId.toString();
    getLateRequest(workScheduleModel.id.toString(), workScheduleModel);
  }

  void deleteLateRequest(String idLateRequest){
    _api.delete(idLateRequest).then((value) {
      loading.value = false;
      Utils.snackBar("Xin đi muộn", "Đã huỷ xin đi muộn thành công!");
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar("Lỗi", error.toString());
    });
  }

}