import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toast {
  static void show(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        fontSize: 14,
        backgroundColor: Colors.pink,
        textColor: Colors.white);
  }
}
