import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boki/page/index/page.dart';
import 'package:flutter_boki/route/route_config.dart';
import 'package:flutter_boki/route/routes.dart';

Widget createApp() {
  RouteConfig.router = Routes.configureRoutes();

  //设置android状态栏为透明的沉浸
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前
    // MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

  return MaterialApp(
    title: "簿记岛",
    debugShowCheckedModeBanner: false,
    home: IndexPage().buildPage(null),
    onGenerateRoute: RouteConfig.router.generator,
  );
}
