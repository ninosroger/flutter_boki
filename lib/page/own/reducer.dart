import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<OwnState> buildReducer() {
  return asReducer(
    <Object, Reducer<OwnState>>{
      OwnAction.action: _onAction,
    },
  );
}

OwnState _onAction(OwnState state, Action action) {
  final OwnState newState = state.clone();
  return newState;
}
