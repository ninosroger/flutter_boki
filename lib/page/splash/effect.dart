import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<SplashState> buildEffect() {
  return combineEffects(<Object, Effect<SplashState>>{
    SplashAction.action: _onAction,
  });
}

void _onAction(Action action, Context<SplashState> ctx) {
}
