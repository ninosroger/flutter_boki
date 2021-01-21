import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<DrawerState> buildEffect() {
  return combineEffects(<Object, Effect<DrawerState>>{
    DrawerAction.action: _onAction,
  });
}

void _onAction(Action action, Context<DrawerState> ctx) {
}
