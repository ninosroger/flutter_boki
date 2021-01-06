import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_boki/global_store/state.dart';
import 'package:flutter_boki/resources/colors.dart';

class SplashState implements GlobalBaseState, Cloneable<SplashState> {
  int second = 3;

  @override
  ThemeColors themeColors;

  @override
  SplashState clone() {
    return SplashState()
      ..second = second
      ..themeColors = themeColors;
  }
}

SplashState initState(Map<String, dynamic> args) {
  return SplashState();
}
