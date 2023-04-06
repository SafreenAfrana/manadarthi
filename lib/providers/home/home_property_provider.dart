import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:manadarthi/models/home/home_property_model.dart';
import 'package:manadarthi/utils/shared_preferences.dart';

class HomePropertyProvider extends ChangeNotifier {
  List<HomePropertyModel> _list = [];
  List<HomePropertyModel> get list => _list;

  loadData() async {
    var data = await HomePreferences().getHomeInfo();
    var jsonData = jsonDecode(data);
    List list = jsonData['home_property'];
    _list = list.map((e) => HomePropertyModel.fromMap(e)).toList();
    notifyListeners();
  }
}
