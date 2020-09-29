import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<OwnState> buildEffect() {
  return combineEffects(<Object, Effect<OwnState>>{
    OwnAction.action: _onAction,
  });
}

void _onAction(Action action, Context<OwnState> ctx) {
}
