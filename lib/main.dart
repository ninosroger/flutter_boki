import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boki/global_store/global_store.dart';
import 'application.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'common/global_field.dart';
import 'net/net.dart';

import 'net/intercept.dart';
import 'route/route.dart';
import 'util/event_bus.dart';
import 'util/prefs_utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); //添加此处代码是为了防止下句代码报错

  init().then((value) => runApp(createApp()));

  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

///初始化主题色
///初始化网络请求
///初始化全局变量
Future init() async {
  final List<Interceptor> interceptors = [];
  interceptors.add(LoggingInterceptor());
  interceptors.add(AdapterInterceptor());
  setInitDio(
    baseUrl: Api.baseUrl,
    interceptors: interceptors,
  );

  GlobalField.bus = EventBus();
  GlobalField.router = Routers.configureRouters();
  GlobalField.prefs = await SharedPreferences.getInstance();
  GlobalField.logger = Logger(printer: PrettyPrinter(printTime: true, colors: true));
  GlobalStore.store.dispatch(GlobalActionCreator.onchangeThemeColor(getThemeName()));
}
