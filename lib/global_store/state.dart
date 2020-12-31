import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';

abstract class BaseState {
  Color themeColor;
}

class GlobalState implements BaseState, Cloneable<GlobalState> {
  @override
  Color themeColor;

  @override
  GlobalState clone() {
    return GlobalState();
  }
}
