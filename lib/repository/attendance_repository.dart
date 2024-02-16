import 'dart:developer';

import 'package:employee_manager/models/attendance_model.dart';
import 'package:employee_manager/utils/app_url.dart';

import '../data/network/network_api_services.dart';

class AttendanceRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> attendance(var data) async{
    dynamic response = await _apiService.postApi(data,AppUrl.attendance);
    return response;
  }


  Future<List<AttendanceModel>> getAttendancePersonal() async {

    dynamic response = await _apiService.getApi(AppUrl.attendancePersonal);

    if (response != null && response is List) {
      List<AttendanceModel> attendanceModel = List<AttendanceModel>.from(
        response.map((attendance) => AttendanceModel.fromJson(attendance)).toList(),
      );
      return attendanceModel;
    }
    else {
      return [];
    }
  }

  Future<dynamic> addAttendanceRequest(var data){
    dynamic response = _apiService.postApi(data, AppUrl.attendanceRequest);
    return response;
  }

  Future<AttendanceModel?> getAttendanceRequest(String workScheduleId) async {

    dynamic response = await _apiService.getApi(AppUrl.showAttendanceRequest(workScheduleId));

    AttendanceModel attendanceModel = AttendanceModel.fromJson(response);
    return attendanceModel;
  }

  Future<void> delete(String id) async {
    dynamic response = await _apiService.deleteApi(AppUrl.deleteAttendanceRequest(id));
    return response;
  }

}