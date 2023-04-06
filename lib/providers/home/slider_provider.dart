import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:manadarthi/models/home/slider_model.dart';
import 'package:manadarthi/utils/shared_preferences.dart';

class SliderProvider extends ChangeNotifier {
  List<SliderModel> _list = [];
  List<SliderModel> get list => _list;

  loadData() async {
    var data = await HomePreferences().getHomeInfo();
    var jsonData = jsonDecode(data);
    List list = jsonData['Slider'];
    _list = list.map((e) => SliderModel.fromMap(e)).toList();
    notifyListeners();
  }
}
