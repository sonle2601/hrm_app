
import '../data/network/network_api_services.dart';
import '../models/work_schedule_model.dart';
import '../utils/app_url.dart';

class WorkScheduleRepository{
  final _apiService = NetworkApiServices();


  Future<List<WorkScheduleModel>> getWorkSchedule( String date) async {
    dynamic response = await _apiService.getApi(AppUrl.workSchedule( date));

    if (response != null && response is List) {
      List<WorkScheduleModel> workScheduleList = List<WorkScheduleModel>.from(
        response.map((workSchedule) => WorkScheduleModel.fromJson(workSchedule)).toList(),
      );
      return workScheduleList;
    }
    else {
      return [];
    }
  }



  Future<List<WorkScheduleModel>> getPersonalWorkSchedule( String date) async {
    dynamic response = await _apiService.getApi(AppUrl.personalWorkSchedule( date));
    if (response != null && response is List) {
      List<WorkScheduleModel> workScheduleList = List<WorkScheduleModel>.from(
        response.map((workSchedule) => WorkScheduleModel.fromJson(workSchedule)).toList(),
      );
      return workScheduleList;
    }
    else {
      return [];
    }
  }
}