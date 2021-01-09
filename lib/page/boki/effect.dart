import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<BokiState> buildEffect() {
  return combineEffects(<Object, Effect<BokiState>>{
    BokiAction.action: _onAction,
  });
}

void _onAction(Action action, Context<BokiState> ctx) {
}
