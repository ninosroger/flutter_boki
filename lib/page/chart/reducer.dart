import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ChartState> buildReducer() {
  return asReducer(
    <Object, Reducer<ChartState>>{
      ChartAction.action: _onAction,
    },
  );
}

ChartState _onAction(ChartState state, Action action) {
  final ChartState newState = state.clone();
  return newState;
}
