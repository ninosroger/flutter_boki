import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_boki/global_store/state.dart';
import 'package:flutter_boki/resources/colors.dart';

class DrawerState implements GlobalBaseState, Cloneable<DrawerState> {
  @override
  DrawerState clone() {
    return DrawerState()..themeColors = themeColors;
  }

  @override
  ThemeColors themeColors;
}