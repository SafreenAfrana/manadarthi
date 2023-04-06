import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:manadarthi/models/home/bottom_property_model.dart';
import 'package:manadarthi/utils/shared_preferences.dart';

class BottomPropertyProvider extends ChangeNotifier {
  List<BottomPropertyModel> _list = [];
  List<BottomPropertyModel> get list => _list;

  loadData() async {
    var data = await HomePreferences().getHomeInfo();
    var jsonData = jsonDecode(data);
    List list = jsonData['bottom_property'];
    _list = list.map((e) => BottomPropertyModel.fromMap(e)).toList();
    notifyListeners();
  }
}
