import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum HoverDataListAction { action }

class HoverDataListActionCreator {
  static Action onAction() {
    return const Action(HoverDataListAction.action);
  }
}
