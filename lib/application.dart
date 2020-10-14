import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boki/entity/token_entity.dart';
import 'package:flutter_boki/net/api.dart';
import 'package:flutter_boki/net/net_manager.dart';
import 'package:flutter_boki/route/routers.dart';
import 'package:logger/logger.dart';

import 'global_field.dart';

Widget createApp() {
  GlobalField.router = Routers.configureRouters();
  GlobalField.logger =
      Logger(printer: PrettyPrinter(printTime: true, colors: true));

  Net.instance.requestNetwork<TokenEntity>(
    Method.POST,
    Api.login,
    params: FormData.fromMap({
      "account": "",
      "pwd": "",
    }),
    onSuccess: (data) {
      data.toString();
    },
    onError: (code, msg) {
      msg.toString();
    },
  );

  return MaterialApp(
    title: "簿记岛",
    //debug标识去掉
    debugShowCheckedModeBanner: false,
    //注册路由
    onGenerateRoute: GlobalField.router.generator,
  );
}
