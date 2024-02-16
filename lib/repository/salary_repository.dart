import '../data/network/network_api_services.dart';
import '../models/salary_model.dart';
import '../utils/app_url.dart';

class SalaryRepository{
  final _apiService = NetworkApiServices();

  Future<SalaryModel?> getSalary(String startDate, String endDate) async {

    dynamic response = await _apiService.getApi(AppUrl.salaryPersonal(startDate, endDate));
    SalaryModel salaryModel = SalaryModel.fromJson(response);
    return salaryModel;
  }

}