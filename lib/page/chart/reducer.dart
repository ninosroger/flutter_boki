import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ChartState> buildReducer() {
  return asReducer(
    <Object, Reducer<ChartState>>{
      ChartAction.action: _onAction,
      ChartAction.changePieIndex: _onChangePieIndex,
      ChartAction.changeChartType: _onChangeChartType,
      ChartAction.changeDateType: _onChangeDateType,
      ChartAction.changeChartShowStatus: _onChangeChartShowStatus,
    },
  );
}

ChartState _onAction(ChartState state, Action action) {
  final ChartState newState = state.clone();
  return newState;
}

ChartState _onChangePieIndex(ChartState state, Action action) {
  final ChartState newState = state.clone();
  if (newState.touchPieIndex == action.payload)
    newState.touchPieIndex = -1;
  else
    newState.touchPieIndex = action.payload;
  return newState;
}

ChartState _onChangeChartType(ChartState state, Action action) {
  final ChartState newState = state.clone();
  newState.isPieChart = !state.isPieChart;
  return newState;
}

ChartState _onChangeDateType(ChartState state, Action action) {
  final ChartState newState = state.clone();
  newState.isMonthBtnSelect = action.payload;
  return newState;
}

ChartState _onChangeChartShowStatus(ChartState state, Action action) {
  final ChartState newState = state.clone();
  newState.hasHideChart = action.payload;
  return newState;
}
