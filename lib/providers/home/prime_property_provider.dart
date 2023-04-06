import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:manadarthi/models/home/prime_property_model.dart';
import 'package:manadarthi/utils/shared_preferences.dart';

class PrimePropertyProvider extends ChangeNotifier {
  List<PrimePropertyModel> _list = [];
  List<PrimePropertyModel> get list => _list;

  loadData() async {
    var data = await HomePreferences().getHomeInfo();
    var jsonData = jsonDecode(data);
    List list = jsonData['prime_property'];
    _list = list.map((e) => PrimePropertyModel.fromMap(e)).toList();
    notifyListeners();
  }
}
