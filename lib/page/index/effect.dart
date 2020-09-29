import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<IndexState> buildEffect() {
  return combineEffects(<Object, Effect<IndexState>>{
    IndexAction.action: _onAction,
  });
}

void _onAction(Action action, Context<IndexState> ctx) {
}
