import 'package:fish_redux/fish_redux.dart';

enum IndexAction { onChangeBottomNavigationItem }

class IndexActionCreator {
  static Action onChangeBottomNavigationItem(int index) {
    return Action(IndexAction.onChangeBottomNavigationItem, payload: index);
  }
}
