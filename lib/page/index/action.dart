import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum IndexAction { action }

class IndexActionCreator {
  static Action onAction() {
    return const Action(IndexAction.action);
  }
}
