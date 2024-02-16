
import '../data/network/network_api_services.dart';
import '../utils/app_url.dart';

class DataRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> postInformation(var data){
    dynamic response = _apiService.postApi(data, AppUrl.infomation);
    return response;
  }
}