import 'dart:developer';

import 'package:employee_manager/models/attendance_model.dart';
import 'package:employee_manager/repository/attendance_repository.dart';
import 'package:get/get.dart';
import 'package:connectivity/connectivity.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

import '../routes/route_name.dart';
import '../utils/utils.dart';

class AttendanceViewModel extends GetxController{
  RxBool loading = false.obs;
  RxBool loadData = false.obs;
  var atendances = <AttendanceModel>[].obs;


  final _api = AttendanceRepository();



  Future<void> attendance() async {
    loading.value = true;
    DateTime dateTime = DateTime.now();
    String? wifiBSSID;
    String? wifiName;

    final info = NetworkInfo();
    var locationStatus = await Permission.location.status;
    if (locationStatus.isDenied) {
      await Permission.locationWhenInUse.request();
    }
    if (await Permission.location.isRestricted) {
      openAppSettings();
    }

    if (await Permission.location.isGranted) {
      try {
        wifiName = await info.getWifiName();
        wifiBSSID = await info.getWifiBSSID();
      } catch (e) {
        log('Error getting wifi info: $e');
      }
    }
    AttendanceModel attendanceModel = AttendanceModel(
      checkIn: dateTime.toString(),
      macAddress: wifiBSSID,
      nameDevice: removeQuotes(wifiName)
    );

    Map<String, dynamic> data = attendanceModel.toJson();

    _api.attendance(data).then((value) {
      loading.value = false;
      Utils.snackBar("Chấm công", "Bạn đã chấm công thành công!");
      Get.toNamed(RouteName.mainScreen);
    }).onError((error, stackTrace) {
      Utils.snackBar("Lỗi", error.toString());
      loading.value = false;
    });
  }

  Future<void> getAttendancePersonal() async {
    try {
      loadData.value = false;
      List<AttendanceModel> atendanceModel = await _api.getAttendancePersonal();
      atendances.assignAll(atendanceModel);
      loadData.value = true;
    } catch (error) {
      print(error.toString());
      Utils.snackBar("Lỗi", error.toString());
    }
  }


}



String? removeQuotes(String? input) {
  if (input == null) return null;
  return input.replaceAll('"', '');
}
