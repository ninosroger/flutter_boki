import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    HomeAction.action: _onAction,
    Lifecycle.initState: _init,
  });
}

void _init(Action action, Context<HomeState> ctx) {
  final TickerProvider tickerProvider = ctx.stfState as TickerProvider;

  //淡入淡出
  ctx.state.topController =
      AnimationController(duration: Duration(milliseconds: 800), vsync: tickerProvider)
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            ctx.state.topStatus = true;
          } else if (status == AnimationStatus.dismissed) {
            ctx.state.topStatus = false;
          }
        });
  ctx.state.topAnimation =
      Tween<double>(begin: 0, end: 1).animate(ctx.state.topController);

  //位移
  ctx.state.cardMoveController = AnimationController(
      duration: Duration(milliseconds: 600), vsync: tickerProvider)
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        ctx.state.cardMoveStatus = true;
        ctx.state.smallMoveController.forward();
        ctx.state.topController.forward();
      } else if (status == AnimationStatus.dismissed) {
        ctx.state.cardMoveStatus = false;
      }
    });
  ctx.state.cardMoveAnimation =
      Tween<Offset>(begin: Offset.zero, end: Offset(-1.2, 0)).animate(
    CurvedAnimation(
      parent: ctx.state.cardMoveController,
      curve: Curves.easeInOutBack,
    ),
  );

  //位移
  ctx.state.smallMoveController = AnimationController(
      duration: Duration(milliseconds: 400), vsync: tickerProvider)
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        ctx.state.smallMoveStatus = true;
        ctx.state.topController.forward();
      } else if (status == AnimationStatus.dismissed) {
        ctx.state.smallMoveStatus = false;
        ctx.state.cardMoveController.reverse();
        ctx.state.topController.reverse();
      }
    });
  ctx.state.smallMoveAnimation =
      Tween<Offset>(begin: Offset.zero, end: Offset(1.5, 0)).animate(
    CurvedAnimation(
      parent: ctx.state.smallMoveController,
      curve: Curves.easeInOutBack,
    ),
  );
}

void _onAction(Action action, Context<HomeState> ctx) {}
