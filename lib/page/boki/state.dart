import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_boki/global_store/state.dart';
import 'package:flutter_boki/resources/colors.dart';

class BokiState implements GlobalBaseState, Cloneable<BokiState> {
  @override
  BokiState clone() {
    return BokiState()..themeColors = themeColors;
  }

  @override
  ThemeColors themeColors;
}

BokiState initState(Map<String, dynamic> args) {
  return BokiState();
}
