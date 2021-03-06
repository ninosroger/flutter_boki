import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_boki/global_store/state.dart';
import 'package:flutter_boki/resources/colors.dart';

class OwnState implements GlobalBaseState, Cloneable<OwnState> {
  @override
  OwnState clone() {
    return OwnState()..themeColors = themeColors;
  }

  @override
  ThemeColors themeColors;
}

OwnState initState(Map<String, dynamic> args) {
  return OwnState();
}
