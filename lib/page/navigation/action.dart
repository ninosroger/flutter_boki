import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum NavigationAction { action, pageChanged }

class NavigationActionCreator {
  static Action onAction() {
    return const Action(NavigationAction.action);
  }

  static Action onPageChanged(double index) {
    return Action(NavigationAction.pageChanged, payload: index);
  }
}
