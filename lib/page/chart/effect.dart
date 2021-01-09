import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<ChartState> buildEffect() {
  return combineEffects(<Object, Effect<ChartState>>{
    ChartAction.action: _onAction,
  });
}

void _onAction(Action action, Context<ChartState> ctx) {
}
