import 'dart:async';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_boki/route/router_utils.dart';
import 'package:flutter_boki/route/routers.dart';

import 'action.dart';
import 'state.dart';

Effect<SplashState> buildEffect() {
  return combineEffects(<Object, Effect<SplashState>>{
    SplashAction.action: _onAction,
    Lifecycle.initState: _init,
  });
}

void _init(Action action, Context<SplashState> ctx) {
  Timer.periodic(const Duration(seconds: 1), (timer) {
    if (ctx.state.second > 0)
      ctx.dispatch(SplashActionCreator.onCountdown());
    else {
      timer.cancel();
      FluroNavigator.push(ctx.context, Routers.navigation, replace: true);
    }
  });
}

void _onAction(Action action, Context<SplashState> ctx) {}
