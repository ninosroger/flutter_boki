import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_boki/util/prefs_utils.dart';

import 'action.dart';
import 'state.dart';

Reducer<GlobalState> buildReducer() {
  return asReducer(
    <Object, Reducer<GlobalState>>{
      GlobalAction.changeThemeColor: _onchangeThemeColor,
    },
  );
}

GlobalState _onchangeThemeColor(GlobalState state, Action action) {
  return state.clone()..themeColors = getThemeColorsForName(action.payload);
}
