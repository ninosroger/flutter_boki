import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_boki/global_store/state.dart';
import 'package:flutter_boki/resources/colors.dart';

class ChartState implements GlobalBaseState, Cloneable<ChartState> {
  @override
  ChartState clone() {
    return ChartState()..themeColors = themeColors;
  }

  @override
  ThemeColors themeColors;
}

ChartState initState(Map<String, dynamic> args) {
  return ChartState();
}
