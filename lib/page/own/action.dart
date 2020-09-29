import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum OwnAction { action }

class OwnActionCreator {
  static Action onAction() {
    return const Action(OwnAction.action);
  }
}
