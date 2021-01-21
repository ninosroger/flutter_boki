import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<NavigationState> buildReducer() {
  return asReducer(
    <Object, Reducer<NavigationState>>{
      NavigationAction.action: _onAction,
    },
  );
}

NavigationState _onAction(NavigationState state, Action action) {
  final NavigationState newState = state.clone();
  return newState;
}
