import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<BokiState> buildReducer() {
  return asReducer(
    <Object, Reducer<BokiState>>{
      BokiAction.action: _onAction,
    },
  );
}

BokiState _onAction(BokiState state, Action action) {
  final BokiState newState = state.clone();
  return newState;
}
