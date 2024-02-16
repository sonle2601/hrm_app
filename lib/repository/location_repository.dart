
import 'package:employee_manager/utils/app_url.dart';

import '../data/network/network_api_services.dart';
import '../models/location_model.dart';

class LocationRepository{
  final _apiService = NetworkApiServices();

   Future<List<dynamic>> getProvinces() async{
      dynamic response = await _apiService.getApi(AppUrl.getProvinces);
    // print(response['results']);
    return response['results'];
  }

  Future<List<dynamic>> getDistricts(int provinceId)async{
    dynamic response =await _apiService.getApi(AppUrl.getDistricts(provinceId));
    return response['results'];
  }

  Future<List<dynamic>> getWards(int districtId) async{
    dynamic response = await _apiService.getApi(AppUrl.getWards(districtId));
    return response['results'];
  }
}