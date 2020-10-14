import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boki/net/api.dart';

import 'application.dart';
import 'net/intercept.dart';
import 'net/net_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: Colors.pink[200],
        statusBarIconBrightness: Brightness.light);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

  final List<Interceptor> interceptors = [];
  interceptors.add(LoggingInterceptor());
  interceptors.add(AdapterInterceptor());
  setInitDio(
    baseUrl: Api.baseUrl,
    interceptors: interceptors,
  );

  runApp(createApp());
}
