
import 'dart:convert';
import 'dart:io';

import 'package:employee_manager/services/user_preference_services.dart';
import 'package:employee_manager/view_models/user_prefrence_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../exception/app_exceptions.dart';
import 'base_api_services.dart';

class NetworkApiServices extends BaseApiServices{
  UserPreference _userPreference = UserPreference();

  @override
  Future getApi(String url) async {
    if(kDebugMode){
      print(url);
    }
    dynamic responseJson;
    try{
      final response = await http.get(
          Uri.parse(url),
          headers: await _getHeaders()).timeout(const Duration(seconds: 10)
      );
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    return responseJson;
  }


  @override
  Future<dynamic> postApi(var data, String url) async {
    if(kDebugMode){
      print(url);
      print(data);
    }
    dynamic responseJson;
    try{
      final response = await http.post(Uri.parse(url),
          body: data,
          headers: await _getHeaders()).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException catch (e) {
      print('SocketException: $e');
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    return responseJson;
  }


  dynamic returnResponse(http.Response response){
    // print(response.body);
    switch(response.statusCode){
      case 200:
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        // print(responseJson);
        return responseJson;
      case 401:
        throw InvalidUrlException();
      default:
        throw FetchDataException('Error accoured while communication with server'+response.statusCode.toString());
    }
  }


  Future<Map<String, String>> _getHeaders() async {
    final token = await getTokenFromLocalStorage();
    return {'Authorization': 'Bearer $token'};
  }

  Future<String?> getTokenFromLocalStorage() async {
    return await _userPreference.getToken();
  }


}