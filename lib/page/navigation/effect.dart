import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<NavigationState> buildEffect() {
  return combineEffects(<Object, Effect<NavigationState>>{
    NavigationAction.action: _onAction,
  });
}

void _onAction(Action action, Context<NavigationState> ctx) {
}
