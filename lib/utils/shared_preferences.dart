import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LoginPreferences {
  static const LOGIN_INFO = "login_info";
  saveLoginInfo(var data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(
        LOGIN_INFO, data.toString().isNotEmpty ? jsonEncode(data) : "");
  }

  Future<dynamic> getLoginInfo() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(LOGIN_INFO) ?? "";
  }
}

class HomePreferences {
  static const HOME_INFO = "home_info";
  saveHomeInfo(var data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(
        HOME_INFO, data.toString().isNotEmpty ? jsonEncode(data) : "");
  }

  Future<dynamic> getHomeInfo() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(HOME_INFO) ?? "";
  }
}
