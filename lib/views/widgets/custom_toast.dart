import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class CustomToast {
  final String msg;
  const CustomToast({required this.msg});

  void showSuccessToast() {
      Fluttertoast.showToast(
        msg: 'Thông báo: $msg',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.black,
        fontSize: 16.0,
      );
  }
  void showErrorToast() {
    Fluttertoast.showToast(
      msg: 'Thông báo: $msg',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.black,
      fontSize: 16.0,
    );
  }
}
