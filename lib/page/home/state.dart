import 'package:drawerbehavior/drawerbehavior.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boki/global_store/state.dart';
import 'package:flutter_boki/resources/colors.dart';

import 'drawer/state.dart';
import 'hover_header_vm.dart';
import 'hover_offset_info.dart';

class HomeState implements GlobalBaseState, Cloneable<HomeState> {
  DrawerState drawerState = DrawerState();

  //侧边栏controller
  DrawerScaffoldController drawerController = DrawerScaffoldController();

  //顶部渐入渐出
  AnimationController topController;
  Animation topAnimation;

  //cell平移
  AnimationController cellMoveController;
  Animation cellMoveAnimation;

  //card平移
  AnimationController cardMoveController;
  Animation cardMoveAnimation;

  //small平移
  AnimationController smallMoveController;
  Animation smallMoveAnimation;

  bool topStatus = false;
  bool cardMoveStatus = false;
  bool smallMoveStatus = false;

  HoverHeaderVM hoverVM = HoverHeaderVM();
  ScrollController scrollController = ScrollController();
  List<HoverOffsetInfo> hoverOffsetInfoList = [];
  int hoverOffsetInfoIndex = 0;
  List titles = [];
  double lastOffset = 0;

  Map<String, List<String>> data = {
    "": [""],
    "2020": ["1", "2", "3"],
    "2021": ["1", "2", "3", "4", "5"],
    "2022": ["1", "2", "3", "4", "5", "6"],
    "2023": ["1", "2"],
    "2024": ["1", "2", "3", "4", "5"],
    "2025": ["1", "2", "3", "4", "5", "6"],
    "2026": ["1", "2", "3"],
    "2027": ["1", "2", "3", "4"],
    "2028": ["1", "2"],
    "2029": ["1", "2", "3", "4", "5", "6", "7"],
  };

  @override
  HomeState clone() {
    return HomeState()
      ..topStatus = topStatus
      ..drawerState = drawerState
      ..cardMoveStatus = cardMoveStatus
      ..smallMoveStatus = smallMoveStatus
      ..themeColors = themeColors
      ..drawerController = drawerController
      ..topController = topController
      ..topAnimation = topAnimation
      ..cardMoveAnimation = cardMoveAnimation
      ..cardMoveController = cardMoveController
      ..hoverVM = hoverVM
      ..scrollController = scrollController
      ..smallMoveController = smallMoveController
      ..smallMoveAnimation = smallMoveAnimation
      ..hoverOffsetInfoList = hoverOffsetInfoList
      ..hoverOffsetInfoIndex = hoverOffsetInfoIndex
      ..titles = titles
      ..data = data
      ..cellMoveAnimation = cellMoveAnimation
      ..cellMoveController = cellMoveController
      ..lastOffset = lastOffset;
  }

  @override
  ThemeColors themeColors;
}

HomeState initState(Map<String, dynamic> args) {
  var state = HomeState();
  return state;
}

class DrawerConnector extends ConnOp<HomeState, DrawerState> with ReselectMixin<HomeState, DrawerState> {
  @override
  DrawerState computed(HomeState state) => state.drawerState..themeColors = state.themeColors;

  @override
  void set(HomeState state, DrawerState subState) => state.drawerState = subState;
}
