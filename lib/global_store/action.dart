import 'package:fish_redux/fish_redux.dart';

enum GlobalAction { changeThemeColor }

class GlobalActionCreator {
  static Action onchangeThemeColor(String themeName) {
    return Action(GlobalAction.changeThemeColor, payload: themeName);
  }
}
