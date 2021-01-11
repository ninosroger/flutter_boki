import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ChartAction { action, changePieIndex }

class ChartActionCreator {
  static Action onAction() {
    return const Action(ChartAction.action);
  }

  static Action onChangePieIndex(int index) {
    return Action(ChartAction.changePieIndex, payload: index);
  }
}
