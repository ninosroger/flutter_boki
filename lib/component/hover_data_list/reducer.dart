import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HoverDataListState> buildReducer() {
  return asReducer(
    <Object, Reducer<HoverDataListState>>{
      HoverDataListAction.action: _onAction,
    },
  );
}

HoverDataListState _onAction(HoverDataListState state, Action action) {
  final HoverDataListState newState = state.clone();
  return newState;
}
