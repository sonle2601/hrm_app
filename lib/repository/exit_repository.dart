import 'package:employee_manager/models/exit_model.dart';

import '../data/network/network_api_services.dart';
import '../utils/app_url.dart';

class ExitRepository{
  final _apiService = NetworkApiServices();

  Future<dynamic> addExitRequest(var data){
    dynamic response = _apiService.postApi(data, AppUrl.exitRequest);
    return response;
  }

  Future<ExitModel?> getExitRequest(String workScheduleId) async {

    dynamic response = await _apiService.getApi(AppUrl.showExitRequest(workScheduleId));

    ExitModel exitModel = ExitModel.fromJson(response);
    return exitModel;
  }

  Future<void> delete(String id) async {
    dynamic response = await _apiService.deleteApi(AppUrl.deleteExitRequest(id));
    return response;
  }

}