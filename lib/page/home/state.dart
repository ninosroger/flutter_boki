import 'package:drawerbehavior/drawerbehavior.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_boki/global_store/state.dart';
import 'package:flutter_boki/resources/colors.dart';

class HomeState implements GlobalBaseState, Cloneable<HomeState> {
  DrawerScaffoldController controller = DrawerScaffoldController();

  @override
  HomeState clone() {
    return HomeState()
      ..themeColors = themeColors
      ..controller = controller;
  }

  @override
  ThemeColors themeColors;
}

HomeState initState(Map<String, dynamic> args) {
  return HomeState();
}
