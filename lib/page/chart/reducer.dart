import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ChartState> buildReducer() {
  return asReducer(
    <Object, Reducer<ChartState>>{
      ChartAction.action: _onAction,
      ChartAction.changePieIndex: _onChangePieIndex,
    },
  );
}

ChartState _onAction(ChartState state, Action action) {
  final ChartState newState = state.clone();
  return newState;
}

ChartState _onChangePieIndex(ChartState state, Action action) {
  final ChartState newState = state.clone();
  newState.touchPieIndex = action.payload;
  return newState;
}
