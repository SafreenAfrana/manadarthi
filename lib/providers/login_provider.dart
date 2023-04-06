import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:manadarthi/models/login_model.dart';
import 'package:manadarthi/utils/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  List<LoginModel> _list = [];
  List<LoginModel> get list => _list;

  loadData() async {
    var data = await LoginPreferences().getLoginInfo();
    var jsonData = jsonDecode(data);
    List list = jsonData['data'];
    _list = list.map((e) => LoginModel.fromMap(e)).toList();
    notifyListeners();
  }
}
