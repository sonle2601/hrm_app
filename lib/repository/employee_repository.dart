import '../data/network/network_api_services.dart';
import '../models/employee_model.dart';
import '../utils/app_url.dart';

class EmployeeRepository{
  final _apiService = NetworkApiServices();


  Future<EmployeeModel?> getEmployee() async {
    dynamic response = await _apiService.getApi(AppUrl.invite);

    if (response != null) {
      if (response is Map<String, dynamic>) {

        return EmployeeModel.fromJson(response);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }


  Future<EmployeeModel?> getEmployeeInfo() async {
    dynamic response = await _apiService.getApi(AppUrl.employeeInfo);

    if (response != null) {
      if (response is Map<String, dynamic>) {
        return EmployeeModel.fromJson(response);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  Future<List<EmployeeModel>> getEmployeeAvailable(String work_shift_id, String date) async {
    dynamic response = await _apiService.getApi(AppUrl.employeeAvailable(work_shift_id, date));
    if (response != null && response is List) {
      List<EmployeeModel> employeeList = List<EmployeeModel>.from(
        response.map((employee) => EmployeeModel.fromJson(employee)).toList(),
      );
      return employeeList;
    }
    else {
      return [];
    }
  }

  Future<dynamic> replyUser(var data) async{
    dynamic response = await _apiService.putApi(data, AppUrl.replyUser);
    return response;
  }

  Future<dynamic> updateInfoEmployee(var data) async{
    dynamic response = await _apiService.putApi(data, AppUrl.infomationPersonal);
    return response;
  }


}