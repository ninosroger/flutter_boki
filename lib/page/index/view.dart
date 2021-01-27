import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boki/global_store/global_store.dart';
import 'package:flutter_boki/page/boki/page.dart';
import 'package:flutter_boki/page/chart/page.dart';
import 'package:flutter_boki/page/home/page.dart';
import 'package:flutter_boki/page/own/page.dart';
import 'package:flutter_boki/resources/res.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(IndexState state, Dispatch dispatch, ViewService viewService) {
  var iconSize = 28.0;
  var home = HomePage();
  var chart = ChartPage();
  var boki = BokiPage();
  var own = OwnPage();
  home.connectExtraStore<GlobalState>(
    GlobalStore.store,
    (Object pageState, GlobalState appState) {
      final GlobalBaseState gbs = pageState;
      if (gbs.themeColors != appState.themeColors) {
        if (pageState is Cloneable) {
          final Object copy = pageState.clone();
          final GlobalBaseState newState = copy;
          newState.themeColors = appState.themeColors;
          return newState;
        }
      }
      return pageState;
    },
  );
  chart.connectExtraStore<GlobalState>(
    GlobalStore.store,
    (Object pageState, GlobalState appState) {
      final GlobalBaseState gbs = pageState;
      if (gbs.themeColors != appState.themeColors) {
        if (pageState is Cloneable) {
          final Object copy = pageState.clone();
          final GlobalBaseState newState = copy;
          newState.themeColors = appState.themeColors;
          return newState;
        }
      }
      return pageState;
    },
  );
  boki.connectExtraStore<GlobalState>(
    GlobalStore.store,
    (Object pageState, GlobalState appState) {
      final GlobalBaseState gbs = pageState;
      if (gbs.themeColors != appState.themeColors) {
        if (pageState is Cloneable) {
          final Object copy = pageState.clone();
          final GlobalBaseState newState = copy;
          newState.themeColors = appState.themeColors;
          return newState;
        }
      }
      return pageState;
    },
  );
  own.connectExtraStore<GlobalState>(
    GlobalStore.store,
    (Object pageState, GlobalState appState) {
      final GlobalBaseState gbs = pageState;
      if (gbs.themeColors != appState.themeColors) {
        if (pageState is Cloneable) {
          final Object copy = pageState.clone();
          final GlobalBaseState newState = copy;
          newState.themeColors = appState.themeColors;
          return newState;
        }
      }
      return pageState;
    },
  );
  return Scaffold(
    body: PageView(
      children: <Widget>[
        home.buildPage(null),
        chart.buildPage(null),
        Gaps.empty,
        boki.buildPage(null),
        own.buildPage(null),
      ],
      controller: state.pageController,
      //统一滑动效果，同iOS越界回弹
      // physics: const PageScrollPhysics(parent: const BouncingScrollPhysics()),
      physics: NeverScrollableScrollPhysics(),
    ),
    floatingActionButton: Container(
      width: 60,
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: state.themeColors.red,
        borderRadius: BorderRadius.circular(30),
        gradient: Styles.linearGradientYellowToRedForLight,
        boxShadow: [
          BoxShadow(
            color: state.themeColors.gray,
            offset: Offset(0.0, 2.0),
            blurRadius: 10.0,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: Icon(
        Icons.add_sharp,
        size: 28,
        color: state.themeColors.white,
      ),
    ),
    floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    bottomNavigationBar: SafeArea(
      child: BottomAppBar(
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/icon_home.png",
                width: iconSize,
                height: iconSize,
              ),
              activeIcon: Image.asset(
                "assets/images/icon_home_checked.png",
                width: iconSize,
                height: iconSize,
              ),
              label: '首页',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/icon_chart.png",
                width: iconSize,
                height: iconSize,
              ),
              activeIcon: Image.asset(
                "assets/images/icon_chart_checked.png",
                width: iconSize,
                height: iconSize,
              ),
              label: '图表',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/icon_transparent.png",
                width: iconSize,
                height: iconSize,
              ),
              activeIcon: Image.asset(
                "assets/images/icon_transparent.png",
                width: iconSize,
                height: iconSize,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/icon_boki.png",
                width: iconSize,
                height: iconSize,
              ),
              activeIcon: Image.asset(
                "assets/images/icon_boki_checked.png",
                width: iconSize,
                height: iconSize,
              ),
              label: '薄记',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/icon_own.png",
                width: iconSize,
                height: iconSize,
              ),
              activeIcon: Image.asset(
                "assets/images/icon_own_checked.png",
                width: iconSize,
                height: iconSize,
              ),
              label: '我的',
            ),
          ],
          onTap: (value) =>
              dispatch(IndexActionCreator.onChangeBottomNavigationItem(value)),
          backgroundColor: state.themeColors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: state.themeColors.red,
          unselectedItemColor: state.themeColors.gray,
          selectedFontSize: Dimens.font11,
          unselectedFontSize: Dimens.font11,
          currentIndex: state.selectedIndex,
        ),
        shape: CircularNotchedRectangle(),
        color: state.themeColors.white,
        notchMargin: 6.0,
      ),
    ),
  );
}
