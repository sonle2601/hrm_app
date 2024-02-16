
import 'package:employee_manager/models/token_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference{

  Future<bool> saveUser(TokenModels responseModel)async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("token", responseModel.token.toString());
    sp.setBool("isLogin", responseModel.isLogin!);

    return true;
  }

  Future<TokenModels> getUser()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
   String? token = sp.getString("token");
    bool? isLogin = sp.getBool("isLogin");

    return TokenModels(
      token: token,
      isLogin: isLogin
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

}