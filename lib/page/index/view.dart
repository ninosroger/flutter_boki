import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boki/page/home/page.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(IndexState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    extendBody: true,
    body: PageView(
      children: <Widget>[
        HomePage().buildPage(null),
      ],
    ),
    floatingActionButton: FloatingActionButton(
      child: Icon(Ionicons.md_add),
      backgroundColor: Colors.pink[200],
    ),
    bottomNavigationBar: SafeArea(
      child: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
              gap: 10,
              curve: Curves.easeOutExpo,
              iconSize: 20,
              activeColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
              tabBackgroundColor: Colors.pink[200],
              duration: Duration(milliseconds: 800),
              tabs: [
                GButton(
                  iconColor: Colors.pink[200],
                  textColor: Colors.white,
                  icon: AntDesign.home,
                  text: '首页',
                ),
                GButton(
                  iconColor: Colors.pink[200],
                  textColor: Colors.white,
                  icon: AntDesign.hearto,
                  text: '喜欢',
                ),
                GButton(
                  iconColor: Colors.pink[200],
                  textColor: Colors.white,
                  icon: AntDesign.search1,
                  text: '搜索',
                ),
                GButton(
                  iconColor: Colors.pink[200],
                  textColor: Colors.white,
                  icon: AntDesign.smileo,
                  leading: CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.pink[200],
                      backgroundImage: NetworkImage(
                          "https://www.keaidian.com/uploads/allimg/190427/27154730_0.jpeg")),
                  text: '新之助',
                )
              ],
              selectedIndex: state.selectedIndex,
              onTabChange: (index) {
                dispatch(IndexActionCreator.onChangeTabItem(index));
              }),
        ),
      ),
    ),
  );
}
