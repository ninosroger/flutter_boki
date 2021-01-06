import 'package:flutter_boki/resources/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toast {
  static void show(String msg,ThemeColors themeColors) {
    Fluttertoast.showToast(
        msg: msg,
        fontSize: 14,
        backgroundColor: themeColors.white,
        textColor: themeColors.black);
  }
}
