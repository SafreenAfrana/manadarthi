import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void customToastMsg(String content) {
  Fluttertoast.showToast(
      msg: content,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      fontSize: 16,
      textColor: Colors.black,
      backgroundColor: Colors.grey[100]);
}
