import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boki/global_store/state.dart';
import 'package:flutter_boki/resources/colors.dart';

class NavigationState implements GlobalBaseState, Cloneable<NavigationState> {
  double currentIndex = 0;
  var controller = PageController(viewportFraction: 0.8);

  @override
  ThemeColors themeColors;

  @override
  NavigationState clone() {
    return NavigationState()
      ..currentIndex = currentIndex
      ..controller = controller
      ..themeColors = themeColors;
  }
}

NavigationState initState(Map<String, dynamic> args) {
  return NavigationState();
}
