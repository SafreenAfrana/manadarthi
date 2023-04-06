import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:manadarthi/services/api_constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:manadarthi/shared/common.dart';
import 'package:manadarthi/shared/constant.dart';

class Api {
  Future<dynamic> postMethod(var body, String url) async {
    var URL = Uri.parse(baseUrl + url);
    try {
      var response = await http.post(URL,
          body: convert.jsonEncode(body),
          headers: <String, String>{
            'Content-Type': 'application/json'
          }).timeout(Duration(seconds: 20));
      body = json.decode(response.body);
      print(body);
      if (response.statusCode == 200) {
        var responseBody = convert.jsonDecode(response.body);
        return responseBody;
      } else {
        customToastMsg(ERROR_SERVER);
      }
    } on TimeoutException catch (_) {
      customToastMsg(ERROR_POOR_INTERNET);
    } on SocketException catch (_) {
      customToastMsg(ERROR_NO_INTERNET);
    }
  }
}
