import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum SplashAction { action, countdown }

class SplashActionCreator {
  static Action onAction() {
    return const Action(SplashAction.action);
  }

  static Action onCountdown() {
    return const Action(SplashAction.countdown);
  }
}
