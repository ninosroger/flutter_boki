import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<IndexState> buildReducer() {
  return asReducer(
    <Object, Reducer<IndexState>>{
      IndexAction.onChangeBottomNavigationItem: _onChangeBottomNavigationItem,
    },
  );
}

IndexState _onChangeBottomNavigationItem(IndexState state, Action action) {
  return state.clone()
    ..selectedIndex = action.payload
    ..pageController.jumpToPage(action.payload);
}
