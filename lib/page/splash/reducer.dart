import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SplashState> buildReducer() {
  return asReducer(
    <Object, Reducer<SplashState>>{
      SplashAction.action: _onAction,
      SplashAction.countdown: _onCountdown,
    },
  );
}

SplashState _onAction(SplashState state, Action action) {
  final SplashState newState = state.clone();
  return newState;
}

SplashState _onCountdown(SplashState state, Action action) {
  final SplashState newState = state.clone();
  newState.second--;
  return newState;
}
