import 'package:fish_redux/fish_redux.dart';

enum IndexAction { onChangeTabItem }

class IndexActionCreator {
  static Action onChangeTabItem(int index) {
    return Action(IndexAction.onChangeTabItem, payload: index);
  }
}
