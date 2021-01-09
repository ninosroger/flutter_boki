import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum BokiAction { action }

class BokiActionCreator {
  static Action onAction() {
    return const Action(BokiAction.action);
  }
}
