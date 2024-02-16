
class AppUrl{
  static const String baseUrl = "http://192.168.1.6:8001/api";

  static const String login = "$baseUrl/login";

  static const String register = "$baseUrl/register";

  static const String infomation = "$baseUrl/information";


  static const String checkInfor = "$baseUrl/check-information";

  static const String getUser = "http://192.168.1.6:8001/api/users";

  static const String baseUlrLocation = "https://vnprovinces.pythonanywhere.com/api";

  static const String getProvinces = "$baseUlrLocation/provinces/?basic=true&limit=100";

  static String getDistricts(int provinceId) => "$baseUlrLocation/districts/?province_id=$provinceId&basic=true&limit=100";

  static String getWards(int districtId)=> "$baseUlrLocation/wards/?district_id=$districtId&basic=true&limit=100";

}