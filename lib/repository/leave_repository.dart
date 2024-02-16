import 'dart:developer';

import '../data/network/network_api_services.dart';
import '../models/leave_model.dart';
import '../utils/app_url.dart';

class LeaveRepository{
  final _apiService = NetworkApiServices();

  Future<dynamic> addLeaveRequest(var data){
    dynamic response = _apiService.postApi(data, AppUrl.leaveRequets);
    return response;
  }

  Future<LeaveModel?> getLeaveRequest(String workShiftId) async {

    dynamic response = await _apiService.getApi(AppUrl.showReaveRequets(workShiftId));

    LeaveModel leaveModel = LeaveModel.fromJson(response);
    return leaveModel;
  }

  Future<void> delete(String id) async {
    dynamic response = await _apiService.deleteApi(AppUrl.deleteLeaveRequets(id));
    return response;
  }


}