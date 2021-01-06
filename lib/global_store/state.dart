import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_boki/resources/colors.dart';

abstract class GlobalBaseState {
  ThemeColors themeColors;
}

class GlobalState implements GlobalBaseState, Cloneable<GlobalState> {
  @override
  ThemeColors themeColors;

  @override
  GlobalState clone() {
    return GlobalState()..themeColors = themeColors;
  }
}
