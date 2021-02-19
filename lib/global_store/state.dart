import 'package:fish_redux/fish_redux.dart';

import '../resources/colors.dart';

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
