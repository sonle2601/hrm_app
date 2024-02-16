
import 'package:employee_manager/models/token_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference{

  Future<bool> saveUser(TokenModels responseModel)async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("token", responseModel.token.toString());
    sp.setBool("isLogin", responseModel.isLogin!);
    return true;
  }

  Future<TokenModels> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString("token");
    bool? isLogin = sp.getBool("isLogin");


    return TokenModels(
      token: token,
      isLogin: isLogin,
    );
  }

  Future<bool> removeUser()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }

  Future<String?> getToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString("token");
  }

  // void updateInfoStatus(bool value) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setBool('hasUpdatedInfo', value);
  // }

  void updateScreenStatus(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('screenStatus', value);
  }


  Future<String> getScreenStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String screenStatus = prefs.getString('screenStatus') ?? 'login';
    return screenStatus;
  }

  // Future<bool> getEmployeeStatus() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   bool employeeStatus = prefs.getBool('employeeStatus') ?? false;
  //   return employeeStatus;
  // }




}