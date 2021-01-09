import 'package:flutter/material.dart';

///控制header展示
class HoverHeaderVM extends ChangeNotifier {
  int _index = 0;
  bool _show = false;
  double _offset = 0;

  int get index => _index;

  double get offset => _offset;

  update(int index, double offset) {
    _index = index;
    _offset = offset;
    notifyListeners();
  }

  bool get show => _show;

  set show(bool show) {
    _show = show;
    notifyListeners();
  }
}
