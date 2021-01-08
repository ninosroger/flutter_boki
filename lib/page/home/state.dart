import 'package:drawerbehavior/drawerbehavior.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boki/global_store/state.dart';
import 'package:flutter_boki/resources/colors.dart';

class HomeState implements GlobalBaseState, Cloneable<HomeState> {
  //侧边栏controller
  DrawerScaffoldController drawerController = DrawerScaffoldController();

  //顶部渐入渐出
  AnimationController topController;
  Animation topAnimation;

  //card平移
  AnimationController cardMoveController;
  Animation cardMoveAnimation;

  //small平移
  AnimationController smallMoveController;
  Animation smallMoveAnimation;

  bool topStatus = false;
  bool cardMoveStatus = false;
  bool smallMoveStatus = false;

  @override
  HomeState clone() {
    return HomeState()
      ..topStatus = topStatus
      ..cardMoveStatus = cardMoveStatus
      ..smallMoveStatus = smallMoveStatus
      ..themeColors = themeColors
      ..drawerController = drawerController
      ..topController = topController
      ..topAnimation = topAnimation
      ..cardMoveAnimation = cardMoveAnimation
      ..cardMoveController = cardMoveController;
  }

  @override
  ThemeColors themeColors;
}

HomeState initState(Map<String, dynamic> args) {
  var state = HomeState();
  return state;
}
