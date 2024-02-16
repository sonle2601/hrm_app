import '../data/network/network_api_services.dart';
import '../utils/app_url.dart';

class InformationRepository{
  final _apiService = NetworkApiServices();

  Future<dynamic> updateInfoPersonal(var data) async{
    dynamic response = await _apiService.putApi(data, AppUrl.infomationPersonal);
    return response;
  }

  Future<dynamic> changePassword(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.changePassword);
    return response;
  }

}