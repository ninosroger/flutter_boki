import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() => runApp(TabPage());

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

///pink[200]
///blue[300]
///orange[300]
///grey[800]
///bottom_item grey[700]
class _TabPageState extends State<TabPage> {
  int selectedIndex = 0;
  int badge = 0;
  var padding = EdgeInsets.symmetric(horizontal: 18, vertical: 5);
  double gap = 10;

  PageController controller = PageController();

  @override
  void initState() {
    super.initState();
    //设置android状态栏为透明的沉浸
    if (Platform.isAndroid) {
      // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前
      // MaterialApp组件会覆盖掉这个值。
      SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBody: true,
        body: PageView.builder(
          onPageChanged: (page) {
            setState(() {
              selectedIndex = page;
              badge = badge + 1;
            });
          },
          controller: controller,
          itemBuilder: (context, position) {
            return Container(
              color: Colors.white,
            );
          },
          itemCount: 4,
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                  curve: Curves.easeOutExpo,
                  duration: Duration(milliseconds: 800),
                  tabs: [
                    GButton(
                      gap: gap,
                      iconActiveColor: Colors.white,
                      iconColor: Colors.pink[200],
                      textColor: Colors.white,
                      backgroundColor: Colors.pink[200],
                      iconSize: 20,
                      padding: padding,
                      icon: AntDesign.home,
                      text: '首页',
                    ),
                    GButton(
                      gap: gap,
                      iconActiveColor: Colors.white,
                      iconColor: Colors.pink[200],
                      textColor: Colors.white,
                      backgroundColor: Colors.pink[200],
                      iconSize: 20,
                      padding: padding,
                      icon: AntDesign.hearto,
                      text: '喜欢',
                    ),
                    GButton(
                      gap: gap,
                      iconActiveColor: Colors.white,
                      iconColor: Colors.pink[200],
                      textColor: Colors.white,
                      backgroundColor: Colors.pink[200],
                      iconSize: 20,
                      padding: padding,
                      icon: AntDesign.search1,
                      text: '搜索',
                    ),
                    GButton(
                      gap: gap,
                      iconActiveColor: Colors.white,
                      iconColor: Colors.pink[200],
                      textColor: Colors.white,
                      backgroundColor: Colors.pink[200],
                      iconSize: 20,
                      padding: padding,
                      icon: AntDesign.smileo,
                      leading: CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.pink[200],
                          backgroundImage: NetworkImage(
                              "https://www.keaidian.com/uploads/allimg/190427/27154730_0.jpeg")),
                      text: '新之助',
                    )
                  ],
                  selectedIndex: selectedIndex,
                  onTabChange: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                    controller.jumpToPage(index);
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
