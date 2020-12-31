import 'package:flutter_boki/resources/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toast {
  static void show(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        fontSize: 14,
        backgroundColor: AppColors.white,
        textColor: AppColors.textDeepGray);
  }
}
