import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void mipokaCustomToast(String msg, {int time = 2}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: time,
    backgroundColor: Colors.white,
    textColor: Colors.black,
    fontSize: 16.0,
  );
}