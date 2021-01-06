import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boki/page/home/page.dart';
import 'package:flutter_boki/resources/dimens.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(IndexState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    body: PageView(
      children: <Widget>[
        HomePage().buildPage(null),
      ],
    ),
    bottomNavigationBar: SafeArea(
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/icon_home.png"),
            ),
            activeIcon: ImageIcon(
              AssetImage("assets/images/icon_home_checked.png"),
            ),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/icon_chart.png"),
            ),
            activeIcon: ImageIcon(
              AssetImage("assets/images/icon_chart_checked.png"),
            ),
            label: '图表',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/icon_boki.png"),
            ),
            activeIcon: ImageIcon(
              AssetImage("assets/images/icon_boki_checked.png"),
            ),
            label: '薄记',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/icon_own.png"),
            ),
            activeIcon: ImageIcon(
              AssetImage("assets/images/icon_own_checked.png"),
            ),
            label: '我的',
          ),
        ],
        backgroundColor: state.themeColors.white,
        type: BottomNavigationBarType.fixed,
        iconSize: 30.0,
        selectedItemColor: state.themeColors.red,
        selectedFontSize: Dimens.font11,
        unselectedFontSize: Dimens.font11,
        currentIndex: 0,
      ),
    ),
  );
}
