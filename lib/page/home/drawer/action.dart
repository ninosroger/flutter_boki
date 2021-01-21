import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum DrawerAction { action }

class DrawerActionCreator {
  static Action onAction() {
    return const Action(DrawerAction.action);
  }
}
