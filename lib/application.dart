import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'common/global_field.dart';

Widget createApp() {
  return MaterialApp(
    title: "簿记岛",
    //debug标识去掉
    debugShowCheckedModeBanner: false,
    builder: (context, child) {
      // 保证文字大小不受手机系统设置影响
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: child,
      );
    },
    //注册路由
    onGenerateRoute: GlobalField.router.generator,
    theme: ThemeData(
      textTheme: GoogleFonts.notoSansTextTheme()
    ),
  );
}
