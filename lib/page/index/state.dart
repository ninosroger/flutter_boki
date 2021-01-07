import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boki/global_store/state.dart';
import 'package:flutter_boki/resources/colors.dart';

class IndexState implements GlobalBaseState, Cloneable<IndexState> {
  int selectedIndex = 0;
  PageController pageController = PageController();

  @override
  ThemeColors themeColors;

  @override
  IndexState clone() {
    return IndexState()
      ..selectedIndex = selectedIndex
      ..pageController = pageController
      ..themeColors = themeColors;
  }
}

IndexState initState(Map<String, dynamic> args) {
  return IndexState();
}
