import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boki/route/routes.dart';

import 'global_variable.dart';

Widget createApp() {
  ///设置android状态栏颜色和模式
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: Colors.pink[200],
        statusBarIconBrightness: Brightness.light);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

  ///路由对象
  GlobalVar.router = Routes.configureRoutes();

  ///路由注册后默认加载路径为'/'的页面，此处省略home
  return MaterialApp(
    title: "簿记岛",
    //debug标识去掉
    debugShowCheckedModeBanner: false,
    //注册路由
    onGenerateRoute: GlobalVar.router.generator,
  );
}
