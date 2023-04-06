import 'package:manadarthi/services/api.dart';
import 'package:manadarthi/services/api_constant.dart';
import 'package:manadarthi/shared/common.dart';
import 'package:manadarthi/utils/shared_preferences.dart';

Future<dynamic> getLoginApi() async {
  var map = Map<String, dynamic>();
  map["customer_username"] = '9094590173';
  map["customer_password"] = "123456";
  map["api_key"] = "Sudip@123";

  var body = map;
  var response = await Api().postMethod(body, loginUrl);
  if (response != null) {
    String responseStatus = response["status"];
    if (responseStatus == "Success") {
      LoginPreferences().saveLoginInfo(response);
    } else {
      customToastMsg(responseStatus.toString());
    }
  }
}

Future<dynamic> getHomeApi() async {
  var body = {"api_key": "Sudip@123"};
  var response = await Api().postMethod(body, homeUrl);
  if (response != null) {
    String responseStatus = response["status"];
    if (responseStatus == "Success") {
      HomePreferences().saveHomeInfo(response);
    } else {
      customToastMsg(response);
    }
  }
}
