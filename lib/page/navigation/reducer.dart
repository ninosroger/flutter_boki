import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<NavigationState> buildReducer() {
  return asReducer(
    <Object, Reducer<NavigationState>>{
      NavigationAction.action: _onAction,
      NavigationAction.pageChanged: _onPageChanged,
    },
  );
}

NavigationState _onAction(NavigationState state, Action action) {
  final NavigationState newState = state.clone();
  return newState;
}

NavigationState _onPageChanged(NavigationState state, Action action) {
  final NavigationState newState = state.clone();
  newState.currentIndex = action.payload;
  return newState;
}
