
import '../data/network/network_api_services.dart';
import '../utils/app_url.dart';

class AuthRepository{
  final _apiService = NetworkApiServices();

  Future<dynamic> register(var data){
    dynamic response = _apiService.postApi(data, AppUrl.register);
    return response;
  }

  Future<dynamic> login(var data){
    dynamic response = _apiService.postApi(data, AppUrl.login);
    return response;
  }

  Future<dynamic> checkInfo(){
    dynamic response = _apiService.getApi(AppUrl.checkInfor);
    return response;
  }

  Future<dynamic> checkEmployee(){
    dynamic response = _apiService.getApi(AppUrl.checkEmployee);
    return response;
  }



}