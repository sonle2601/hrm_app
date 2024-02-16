import 'package:employee_manager/models/late_early_model.dart';

import '../data/network/network_api_services.dart';
import '../utils/app_url.dart';

class LateEarlyRepository{
  final _apiService = NetworkApiServices();

  Future<dynamic> addLateRequest(var data){
    dynamic response = _apiService.postApi(data, AppUrl.lateRequest);
    return response;
  }

  Future<LateEarlyModel?> getLateRequest(String workScheduleId) async {

    dynamic response = await _apiService.getApi(AppUrl.showLateRequest(workScheduleId));

    LateEarlyModel lateEarlyModel = LateEarlyModel.fromJson(response);
    return lateEarlyModel;
  }

  Future<dynamic> addEarlyRequest(var data){
    dynamic response = _apiService.postApi(data, AppUrl.earlyRequest);
    return response;
  }

  Future<LateEarlyModel?> getEarlyRequest(String workScheduleId) async {

    dynamic response = await _apiService.getApi(AppUrl.showEarlyRequest(workScheduleId));

    LateEarlyModel lateEarlyModel = LateEarlyModel.fromJson(response);
    return lateEarlyModel;
  }

  Future<void> delete(String id) async {
    dynamic response = await _apiService.deleteApi(AppUrl.deleteLateEarlyRequest(id));
    return response;
  }




}