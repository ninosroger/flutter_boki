import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_boki/global_store/state.dart';
import 'package:flutter_boki/resources/colors.dart';

class IndexState implements GlobalBaseState, Cloneable<IndexState> {
  int selectedIndex = 0;

  @override
  ThemeColors themeColors;

  @override
  IndexState clone() {
    return IndexState()
      ..selectedIndex = selectedIndex
      ..themeColors = themeColors;
  }
}

IndexState initState(Map<String, dynamic> args) {
  return IndexState();
}
