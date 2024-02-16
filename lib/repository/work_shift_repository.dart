
import '../data/network/network_api_services.dart';
import '../models/work_shift_model.dart';
import '../utils/app_url.dart';

class WorkShiftRepository {
  final _apiService = NetworkApiServices();


  Future<List<WorkShiftModel>> getWorkShift() async {
    dynamic response = await _apiService.getApi(AppUrl.workShift);

    if (response != null && response is List) {
      List<WorkShiftModel> workShiftList = List<WorkShiftModel>.from(
        response.map((part) => WorkShiftModel.fromJson(part)).toList(),
      );
      return workShiftList;
    }
    else {
      return [];
    }
  }


}